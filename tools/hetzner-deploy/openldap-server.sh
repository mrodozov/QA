# Setup for a small local ldap server.
#
# - upon first start, this
#   * this creates some ldif files,
#   * starts a docker based server, and
#   * prints instructions for usage with owncloud.
# - re-running this script (after changes)
#   * recreates the ldif files, then
#   * only prints instructions to restart the server.

ldif=$HOME/ldif	# must be absolute path, because of docker.
mkdir -p $ldif
# pushd $ldif
## We don't use their's. Several issues commented and fixed below.
# ocis_ldif_url=https://raw.githubusercontent.com/owncloud/ocis/master/deployments/examples/oc10_ocis_parallel/config/ldap/ldif/
# wget -c $ocis_ldif_url/10_owncloud_schema.ldif	## sAMAccountName is missing.
# wget -c $ocis_ldif_url/20_users.ldif			## sAMAccountName missing, and cn == uid
# wget -c $ocis_ldif_url/30_groups.ldif 		## FIXME: The groups file causes an already exists conflict?
# rm -f 30_groups.ldif
# popd


## FIXME: sAMAccountName is not set. Needed to verify e.g. https://github.com/owncloud/oauth2/pull/307#issuecomment-947578357
cat <<EOF1 > $ldif/10_owncloud_schema.ldif
# This LDIF files describes the ownCloud schema and can be used to
# add two optional attributes: ownCloudQuota and ownCloudUUID
# The ownCloudUUID is used to store a unique, non-reassignable, persistent identifier for users and groups
#  it can be generated by: uuidgen | tr -d '\n' | base64
dn: cn=owncloud,cn=schema,cn=config
objectClass: olcSchemaConfig
cn: owncloud
olcAttributeTypes: ( 1.3.6.1.4.1.39430.1.1.1 NAME 'ownCloudQuota' DESC 'User Quota (e.g. 2 GB)' EQUALITY caseExactMatch SUBSTR caseIgnoreSubstringsMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 SINGLE-VALUE )
olcAttributeTypes: ( 1.3.6.1.4.1.39430.1.1.2 NAME 'ownCloudUUID' DESC 'A non-reassignable and persistent account ID)' EQUALITY uuidMatch SUBSTR caseIgnoreSubstringsMatch SYNTAX 1.3.6.1.1.16.1 SINGLE-VALUE )
olcAttributeTypes: ( 1.3.6.1.4.1.39430.1.1.3 NAME 'ownCloudSelector' DESC 'A selector attribute for a route in the ownCloud Infinte Scale proxy)' EQUALITY caseIgnoreMatch SUBSTR caseIgnoreSubstringsMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 SINGLE-VALUE )
olcAttributeTypes: ( 1.3.6.1.4.1.39430.1.1.4 NAME 'sAMAccountName' DESC 'Originally from LSDN, but openldap does not have that field.' EQUALITY caseIgnoreMatch SUBSTR caseIgnoreSubstringsMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 SINGLE-VALUE )
olcObjectClasses:  ( 1.3.6.1.4.1.39430.1.2.1 NAME 'ownCloud' DESC 'ownCloud LDAP Schema' AUXILIARY MAY ( ownCloudQuota $ ownCloudUUID $ ownCloudSelector $ sAMAccountName ) )
EOF1

## FROM https://stackoverflow.com/questions/6372365/support-reverse-group-membership-maintenance-for-openldap-2-3
## Fails with DEBUG  | 2021-12-15 01:12:47 | ldap_add: No such object (32)
## 	matched DN: cn=config
## adding new entry "olcOverlay={1}memberof,olcDatabase={2}hdb,cn=config"
## ldap_add: Insufficient access (50)
##
# cat <<EOF4 > $ldif/11_memberof.ldif
# dn: olcOverlay={1}memberof,olcDatabase={2}hdb,cn=config
# objectClass: olcConfig
# objectClass: olcMemberOf
# objectClass: olcOverlayConfig
# objectClass: top
# olcOverlay: {1}memberof
# EOF4

## FROM https://stackoverflow.com/questions/6372365/support-reverse-group-membership-maintenance-for-openldap-2-3
## inspect with: ldapsearch -b cn=config -D 'cn=root,cn=config' -W
## ldap_add: Insufficient access (50)
#
# cat <<EOF4 > $ldif/11_memberof.ldif
# dn: cn=module{0},cn=config
# objectClass: olcModuleList
# cn: module{0}
# olcModulePath: /usr/lib/openldap
# olcModuleLoad: {0}memberof
# olcModuleLoad: {1}refint
# EOF4

cat <<EOF2 > $ldif/20_users.ldif
dn: ou=users,dc=owncloud,dc=com
objectClass: organizationalUnit
ou: users

# Start dn with uid (user identifier / login), not cn (Firstname + Surname)
dn: uid=einstein,ou=users,dc=owncloud,dc=com
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: ownCloud
objectClass: person
objectClass: posixAccount
objectClass: top
uid: einstein
givenName: Albert
sn: Einstein
cn: albert-einstein
sAMAccountName: AlbertEinstein
displayName: Albert Einstein
description: A German-born theoretical physicist who developed the theory of relativity, one of the two pillars of modern physics (alongside quantum mechanics).
mail: einstein@example.org
uidNumber: 20000
gidNumber: 30000
homeDirectory: /home/einstein
ownCloudUUID:: NGM1MTBhZGEtYzg2Yi00ODE1LTg4MjAtNDJjZGY4MmMzZDUx
userPassword:: e1NTSEF9TXJEcXpFNGdKbXZxbVRVTGhvWEZ1VzJBbkV3NWFLK3J3WTIvbHc9PQ==
ownCloudSelector: ocis


dn: uid=marie,ou=users,dc=owncloud,dc=com
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: ownCloud
objectClass: person
objectClass: posixAccount
objectClass: top
uid: marie
givenName: Marie
sn: Curie
cn: marie-curie
sAMAccountName: MarieCurie
displayName: Marie Skłodowska Curie
description: A Polish and naturalized-French physicist and chemist who conducted pioneering research on radioactivity.
mail: marie@example.org
uidNumber: 20001
gidNumber: 30000
homeDirectory: /home/marie
ownCloudUUID:: ZjdmYmY4YzgtMTM5Yi00Mzc2LWIzMDctY2YwYThjMmQwZDlj
userPassword:: e1NTSEF9UmFvQWs3TU9jRHBIUWY3bXN3MGhHNnVraFZQWnRIRlhOSUNNZEE9PQ==
ownCloudSelector: oc10

dn: uid=richard,ou=users,dc=owncloud,dc=com
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: ownCloud
objectClass: person
objectClass: posixAccount
objectClass: top
uid: richard
givenName: Richard
sn: Feynman
cn: richard-feynman
sAMAccountName: RichardFeynman
displayName: Richard Phillips Feynman
description: An American theoretical physicist, known for his work in the path integral formulation of quantum mechanics, the theory of quantum electrodynamics, the physics of the superfluidity of supercooled liquid helium, as well as his work in particle physics for which he proposed the parton model.
mail: richard@example.org
uidNumber: 20002
gidNumber: 30000
homeDirectory: /home/richard
ownCloudUUID:: OTMyYjQ1NDAtOGQxNi00ODFlLThlZjQtNTg4ZTRiNmIxNTFj
userPassword:: e1NTSEF9Z05LZTRreHdmOGRUREY5eHlhSmpySTZ3MGxSVUM1d1RGcWROTVE9PQ==
ownCloudSelector: ocis

# userPassword for Jeff Moss is hacker
# It can be generated with: slappasswd -h '{SSHA}' -s hacker | tr -d '\n' | base64
dn: uid=jeff,ou=users,dc=owncloud,dc=com
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: ownCloud
objectClass: person
objectClass: posixAccount
objectClass: top
uid: moss
givenName: Jeff
sn: Moss
cn: jeff-moss
sAMAccountName: JeffMoss
displayName: Jeff Moss
description: Jeff Moss (born January 1, 1975), also known as Dark Tangent, is an American hacker, computer and internet security expert who founded the Black Hat and DEF CON computer security conferences.
mail: jeff@example.org
uidNumber: 20002
gidNumber: 30000
homeDirectory: /home/jeff
ownCloudUUID:: ZjRhMTAzZjEtY2IyYS00Njk4LWExMTgtM2UxNmY3NWNjOGM2
userPassword:: e1NTSEF9UllCcE1EdXlqTk92RjFxMlVzUHlXbHpMK1pLSE1NcjM=
ownCloudSelector: oc10
EOF2

cat <<EOF3 > $ldif/30_groups.ldif
dn: ou=groups,dc=owncloud,dc=com
objectClass: organizationalUnit
ou: groups

## From https://stackoverflow.com/questions/8937248/ldap-error-invalid-structural-object-class-chain-organizationalunit-referral
## The objectClass: extensibleObject allows us to have multiple objectClasses.
## Without that, we always get "Object class violation (65): invalid structural object class chain (groupOfUniqueNames/posixGroup)"
##
## posixGroup is a 'structural object class', but does not allow the 'uniqueMember' attribute.
## groupOfUniqueNames is a 'structural object class', but does not allow the 'gidNumber' attribute.
## We can use one of the two, combined with 'objectClasses: extensibleObject' - to allow foreign attributes.
dn: cn=physics-lovers,ou=groups,dc=owncloud,dc=com
objectClass: top
objectClass: extensibleObject
objectClass: posixGroup
# objectClass: groupOfUniqueNames
objectClass: ownCloud
cn: physics-lovers
description: Physics lovers
gidNumber: 30007
ownCloudUUID:: MjYyOTgyYzEtMjM2Mi00YWZhLWJmZGYtOGNiZmVmNjRhMDZl
uniqueMember: uid=einstein,ou=users,dc=owncloud,dc=com
uniqueMember: uid=marie,ou=users,dc=owncloud,dc=com
uniqueMember: uid=richard,ou=users,dc=owncloud,dc=com

dn: cn=users,ou=groups,dc=owncloud,dc=com
#objectClass: groupOfUniqueNames
objectClass: extensibleObject
objectClass: posixGroup
objectClass: ownCloud
objectClass: top
cn: users
description: All LDAP users
gidNumber: 30000
ownCloudUUID:: NTA5YTlkY2QtYmIzNy00ZjRmLWEwMWEtMTlkY2EyN2Q5Y2Zh
uniqueMember: uid=einstein,ou=users,dc=owncloud,dc=com
uniqueMember: uid=marie,ou=users,dc=owncloud,dc=com
uniqueMember: uid=richard,ou=users,dc=owncloud,dc=com
uniqueMember: uid=jeff,ou=users,dc=owncloud,dc=com
uniqueMember: uid=admin,ou=users,dc=owncloud,dc=com

dn: cn=hackers,ou=groups,dc=owncloud,dc=com
# objectClass: groupOfUniqueNames
objectClass: extensibleObject
objectClass: posixGroup
objectClass: ownCloud
objectClass: top
cn: hackers
description: Hackers
gidNumber: 30002
ownCloudUUID:: ZGQ1OGU1ZWMtODQyZS00OThiLTg4MDAtNjFmMmVjNmY5MTFm
uniqueMember: uid=jeff,ou=users,dc=owncloud,dc=com


## The hackers group is nested in the sailors group.
## Therefore jeff should see things that are shared with sailors.
dn: cn=sailors,ou=groups,dc=owncloud,dc=com
# objectClass: groupOfUniqueNames
objectClass: extensibleObject
objectClass: posixGroup
objectClass: ownCloud
objectClass: top
cn: sailors
description: Sailing ship lovers
gidNumber: 30001
ownCloudUUID:: NjA0MGFhMTctOWM2NC00ZmVmLTliZDAtNzcyMzRkNzFiYWQw
uniqueMember: uid=einstein,ou=users,dc=owncloud,dc=com
uniqueMember: cn=hackers,ou=groups,dc=owncloud,dc=com
EOF3

cat << EOF5 > $ldif/40_jwextra_schema.ldif
# This is a schema extension.
# We add private attributes to objectclass jwextra. the class is loaded at startup already,
# because I have not found a ways to load it with ldapadd during runtime. I always get permission denied.
#
# To use these attributes
# - run ldapadd to load the file
# - create a new object and add jwextra to its list of objectclasses.
#
# 1.3.6.1.4.1.39430	is the owncloud OID schema prefix.
#  - we use 1.1.10, 1.1.11, 1.1.12, ... for attributes
#  - and 1.3.2 for the class name
dn: cn=jwextra,cn=schema,cn=config
objectClass: olcSchemaConfig
cn: jwextra
olcAttributeTypes: ( 1.3.6.1.4.1.39430.1.1.10 NAME 'myname' DESC 'A generic name attribute.' EQUALITY caseIgnoreMatch SUBSTR caseIgnoreSubstringsMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 SINGLE-VALUE )
olcAttributeTypes: ( 1.3.6.1.4.1.39430.1.1.11 NAME 'fixID' DESC 'For testing https://github.com/owncloud/enterprise/issues/5071 .' EQUALITY caseIgnoreMatch SUBSTR caseIgnoreSubstringsMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 SINGLE-VALUE )
olcObjectClasses: ( 1.3.6.1.4.1.39430.1.3.2 NAME 'jwextra' DESC 'jwextra LDAP Schema' AUXILIARY MAY ( name $ fixID ) )
EOF5

# -------------------------- begin of lemmings generator
function generate_user()
{
  namepre=$1
  namecnt=$2
  ownCloudUUID=$(uuidgen | tr -d '\n' | base64)
  userPassword=e1NTSEF9WHlSZjJxcnMycXhSbkM4emVVV3lOMWVtVENqOVB0RVIK	# slappasswd -s secret | base64
  ucfirst=$(echo $namepre | sed -e 's/./\U&/')
  uidNumber=$(expr 20000 + $namecnt)

cat << EOU
# dn: ou=users,dc=owncloud,dc=com
# objectClass: organizationalUnit
# ou: users

# Start dn with uid (user identifier / login), not cn (Firstname + Surname)
dn: uid=$namepre$namecnt,ou=users,dc=owncloud,dc=com
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: ownCloud
objectClass: person
objectClass: posixAccount
objectClass: top
uid: $namepre$namecnt
givenName: N$namecnt
sn: $ucfirst
cn: n$namecnt-$namepre
sAMAccountName: N$namecnt$ucfirst
displayName: N$namecnt $ucfirst
description: Number $namecnt of $ucfirst.
mail: $namepre$namecnt@example.org
uidNumber: $uidNumber
gidNumber: 30000
homeDirectory: /home/$namepre$namecnt
ownCloudUUID:: $ownCloudUUID
userPassword:: $userPassword

EOU
}

function generate_users_and_group()
{
  namepre=$1
  namecnt=$2

  echo 1>&2 "+ generate_users_and_group $1 $2 ..."
  for u in $(seq -w 1 $namecnt); do
    generate_user $namepre $u
  done

  ownCloudUUID=$(uuidgen | tr -d '\n' | base64)
  ucfirst=$(echo $namepre | sed -e 's/./\U&/')
  gidNumber=$(expr 30000 + $(echo $1 | sum | head -c 3))

   cat << EOG
# dn: ou=groups,dc=owncloud,dc=com
# objectClass: organizationalUnit
# ou: groups

dn: cn=${namepre}s,ou=groups,dc=owncloud,dc=com
objectClass: top
objectClass: extensibleObject
objectClass: posixGroup
# objectClass: groupOfUniqueNames
objectClass: ownCloud
cn: $namepre-group
description: $ucfirst group
gidNumber: $gidNumber
ownCloudUUID:: $ownCloudUUID
EOG

  for g in $(seq -w 1 $namecnt); do
    echo "uniqueMember: uid=$namepre$g,ou=users,dc=owncloud,dc=com"
  done
  echo ""
}

generate_users_and_group lemming 1000  > $ldif/45-lem1000.ldif
generate_users_and_group rabbit  1000 >> $ldif/45-lem1000.ldif
# -------------------------- end of lemmings generator

admin_dn="cn=admin,dc=owncloud,dc=com"
admin_pass="12345678"

ports="-p 389:389 -p 636:636"
mount="$ldif:/container/service/slapd/assets/config/bootstrap/ldif/custom"
opts="-v $mount $ports --env LDAP_ADMIN_PASSWORD=$admin_pass --env LDAP_ORGANISATION=ownCloud --env LDAP_DOMAIN=owncloud.com"

docker container inspect -f 'openldap is already running' openldap 2> /dev/null && {
  echo " - to reload try:"
  echo "    docker kill openldap"
  echo "    docker run --rm --name openldap $opts osixia/openldap --copy-service --loglevel debug"
  exit 0
}


docker run --rm --name openldap $opts -d osixia/openldap --copy-service --loglevel debug
sleep 5
ldapserver=$(docker inspect openldap | jq '.[0].NetworkSettings.IPAddress' -r)

ldapsearch -x -H ldap://$ldapserver -b dc=owncloud,dc=com -D "$admin_dn" -w "$admin_pass" -v

docker run --rm -p 6443:443 --name phpldapadmin-server --env PHPLDAPADMIN_LDAP_HOSTS=$ldapserver --detach osixia/phpldapadmin

cat << EOF6
-----------------------------------------------
Connect to php ldapadmin:
  https://$(hostname -I  | sed -e 's/ .*//'):6443
  Login DN: $admin_dn
  Password: $admin_pass
EOF6

cat << EOF7
-----------------------------------------------
Connect owncloud via user_ldap:
- Admin -> Settings -> Admin -> User Authentication
   Host: $ldapserver	Port: 389
   User DN: $admin_dn
   Password: $admin_pass
   One Base DN per line: dc=owncloud,dc=com
   Test Base DN: 11 entries available
   [x] Manually enter LDAP filters
   -> Continue -> Continue -> Continue
 - Groups
   Click "Edit LDAP Query", (if needed: Mode switch -> YES)
   -> The dropdown become active:
   Only these object classes: ownCloud, posixGroup
   Only from these groups: hackers, physics-lovers, sailors, users
   Verify settings and count groups: 4 groups found
   -> Back -> Back
 - User
   Click "Edit LDAP Query", (if needed: Mode switch -> YES)
   -> Some dropdown become active.
   Verify settings and count users: 4 users found
 - Expert
   Attribute for internal username: sAMAccountName	( to avoid UUIDs in the oc user listing)

Finally from the login shell:
  time occ user:sync "OCA\User_LDAP\User_Proxy" --showCount --re-enable --missing-account-action=disable

Extend the LDAP Schema
 - Edit ~/ldif/40_jwextra_schema.ldif
	For each attribute add an olcAttributeTypes line.
	Make sure all attributes in the file are listed in the olcObjectClasses line.
 - run (FIXME: ldapadd always fails. We must docker kill and restart)
	ldapadd -H ldap://$ldapserver -D "$admin_dn" -w "$admin_pass" -v -f ldif/40_jwextra_schema.ldif
 - Then create objects that inherit from objectclass jwextra or add jwextra to te objectclass list of existing objects.
 - Then ldapadmin should allow the new attributes for 'Add new attribute'
 - to update an existing Schema, (FIXME: ldapmodify always fails. Must docker kill and restart...)
    - Edit the file to include the line 'changetype: modify' as the second line.
    - Run
	ldapmodify -H ldap://$ldapserver -D "$admin_dn" -w "$admin_pass" -v -f ldif/40_jwextra_schema.ldif
      still fails to update... No such object, Insufficient access, or similar.
EOF7





