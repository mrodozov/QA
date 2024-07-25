#! /bin/bash
#
# References:
#  - https://owncloud.dev/libre-graph-api/#/users/ListUsers
#  - https://owncloud.dev/libre-graph-api/#/drives.permissions/Invite
#  - https://owncloud.dev/libre-graph-api/#/driveItem/GetDriveItem		# has examples of driveId and itemID !
#
# We can either use the external port 443 through traffic, e.g. via
#  wget -d -O - --user=$api_user --password=$api_pass "https://web.$base_fqdn/graph/v1.0/"
# or an internal port 9200 directly on the container. For the latter, we need to find the correct IPaddress
#
# v0.2, 20240723 - jw@owncloud.com - support both /graph/v1.0 and /v1.0 as an optional prefix for the query.
# v0.3, 20240724 - jw@owncloud.com - added: share invite using /graph/v1beta1
# v0.4, 20240725 - jw@owncloud.com - share works for local users, list-my-space added.

api_user=admin
api_pass=admin
test -n "$OCIS_API_USER" && api_user="$OCIS_API_USER"
test -n "$OCIS_API_PASS" && api_pass="$OCIS_API_PASS"

query="$1"

if [ "$query" = "" -o "$query" = "-h" -o "$query" = "--help" ]; then
	cat <<EOF
$0 [graph/v1.0/query]

Well known queries are:
	/v1.0/groups					# list all groups
	/v1.0/groups/GROUPNAME			# show only matching group
	/v1.0/users | jq '.value[].displayName' -r	# show all displayNames of all users.

        list-my-space				# readdir of the personal space

	share <spaceId>:<objectId> user:<userId> [Viewer|Editor|Uploader|Manager|...]
	share 835e4533-8cc3-4c22-a7d0-e6bbb1618193:50d4b91b-d91e-4715-9645-3c81b2d72578 user:084de045-3148-4a8b-bff2-11a4575e751b Viewer

See also: https://owncloud.dev/libre-graph-api

environment:
	OCIS_API_USER		# specify the username for the query. Default: $api_user
	OCIS_API_PASS		# specify the password for the query. Default: $api_pass

EOF
	exit 0
fi

# Find a container that is e.g. named 'o-ocis-1'
ocis_name=$(docker ps --format json | jq '[.] | [.[] | .Names] | .[0]' -r | grep -s -- '-ocis-')
# Sanity check: do we have port 9200 there?
docker inspect $ocis_name | jq '.[0].NetworkSettings.Ports' | grep -q 9200/ || { echo "ERROR: container '$ocis_name' does not exports port 9200"; exit 1; }
# Find the IPAddress of this container.
ocis_addr=$(docker inspect $ocis_name | jq '.[0].NetworkSettings.Networks[].IPAddress' -r)

echo "$ocis_name -> $ocis_addr" 1>&2

auths=$(curl -s -i  -k -u"$api_user:$api_pass" "http://$ocis_addr:9200/graph/v1.0" | grep -i -e '\( 401 \|www-Authenticate:\)')
if echo "$auths" | grep -q -i ' 401 '; then
  echo "ERROR: $auths"
  if echo "$auths" | grep -q -i "basic"; then
    cat <<EOF

Authentication with user $api_user failed.
Try setting the env variables OCIS_API_USER and OCIS_API_PASS.
EOF
  else
    cat <<EOF

This ocis instance seems to require oauth2, which is not implemented in $0
Please enable PROXY_ENABLE_BASIC_AUTH=true in .env followed by docker compose down ocis; docker compose up -d ocis
EOF
  fi
  exit 1
fi

if [ "$query" = "list-my-space" ]; then
	url="http://$ocis_addr:9200/graph/v1.0/me/drive/root/children"

	echo "+ curl -s -u\"$api_user:\$OCIS_API_PASS\" '$url' | jq '.value | .[] | {name: .name, id: .id }'"
	curl -s -u"$api_user:$api_pass" "$url" | jq '.value | .[] | {name: .name, id: .id }'
	exit 0
fi

# See https://owncloud.dev/libre-graph-api/#/drives.permissions/Invite
if [ "$query" = "share" ]; then
	object="$2"
	sharee="$3"
	role="$4"

	spaceId="$(  echo "$object" | sed -e 's/:.*//')"
	itemId="$(   echo "$object" | sed -e 's/.*://')"
	sharetype="$(echo "$sharee" | sed -e 's/:.*//')"
	shareeId="$( echo "$sharee" | sed -e 's/.*://')"

	case $role in
		"Viewer") 	roleId="b1e2218d-eef8-4d4c-b82d-0f1a1b48f3b5" ;;
                "Space Viewer") roleId="a8d5fe5e-96e3-418d-825b-534dbdf22b99" ;;
                "Editor")	roleId="fb6c3e19-e378-47e5-b277-9732f9de6e21" ;;
                "Space Editor")	roleId="58c63c02-1d89-4572-916a-870abc5a1b7d" ;;
                "File Editor")	roleId="2d00ce52-1fc2-4dbc-8b95-a73b73395f5a" ;;
                "Co Owner")	roleId="3a4ba8e9-6a0d-4235-9140-0e7a34007abe" ;;
                "Uploader")	roleId="1c996275-f1c9-4e71-abdf-a42f6495e960" ;;
                "Manager")	roleId="312c0871-5ef7-4b3a-85b6-0e4074c64049" ;;
                "Secure viewer")roleId="aa97fe03-7980-45ac-9e50-b325749fd7e6" ;;
		"")		echo "Usage: $0 share <spaceId>:<objectId> user:<userId> [Viewer|Editor|Uploader|Manager|...]"; exit 0 ;;
                *)		echo "ERROR: onknown sharing type: $role"; exit 1 ;;
	esac

	url="http://$ocis_addr:9200/graph/v1beta1/drives/$spaceId/items/$spaceId!$itemId/invite"
	# url="http://$ocis_addr:9200/graph/v1.0/drives/$spaceId/items/$spaceId!$itemId/invite"
	body='{"recipients":[{"@libre.graph.recipient.type":"'"$sharetype"'","objectId":"'"$shareeId"'"}],"roles":["'"$roleId"'"]}'

	echo "+ curl -s -u\"$api_user:\$OCIS_API_PASS\" -d '$body' '$url'"
	curl -s -u"$api_user:$api_pass" -d "$body" "$url"
	exit 0
fi

# add prefix /graph/v1.0 if missing in full or partly.
echo "$query" | grep '^/*v1\.0' && query="/graph/$query"
echo "$query" | grep '^/*graph//*v1\.0' || query="/graph/v1.0/$query"
# graph api responds with 404, when it sees dupicate slashes. Remove them.
query=$(echo "/$query" | sed -e 's@//*@/@g')

echo "+ curl -s -u$api_user:\$OCIS_API_PASS  http://$ocis_addr:9200$query" 1>&2
curl -s -u"$api_user:$api_pass" "http://$ocis_addr:9200$query"

