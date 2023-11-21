###  Sharing

#### Pr: https://github.com/owncloud/ios-app/pull/358

Devices: iPhone6Plus v12.2, iPadAir 10.2<br>
Server: 10.2

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Files view**||||||
| Portrait  | Open Card | Options to share correct | P m12 t12 | FIXED: Glitches in card  |  |
| Landscape | Open Card | Options to share correct | P m12 t12 | FIXED: Glitches in card |  |
| Sort by shared | Sort by shared by having some hares | Correctly sorted | P m12 t12 |  |  |
|**Private Share**||||||
| Portrait view  | Open Private Share view | View correct | P m12 t12 |  |  |
| Landscape | Open Private Share view| View correct | P m12 t12|  |  |
| Share with a user | Open Share<br>Type a correct user name<br>Select user | Sharees list updated with the user | P m12 t12 |  |
| Share with a group | Open Share<br>Type a correct group name<br>Select group | Group list updated with the user. Check that every user in the group can access the file | P m12 t12 |  |
| Share with a non existing user | Open Share<br>Type a user name that does not exist | No matches| P m12 t12 |  |
| Share with an already shared | Open Share<br>Type a user name which already has the file | Correct error| P m12 t12| FIXED: UX not very good |
| Share permission OK | Open Share<br>Share with another user with share permission<br>Try to reshare | Recipient can reshare | P m12 t12| FIXED: Recipients should not see himself  |
| Share permission denied | Open Share<br>Share with another user with no share permission<br>Try to reshare |  Not posible | P m12 t12 |  |
| Permission inheritance | Open Share<br>Share with another user with no edit permission<br>Recipient tries to reshare with edit permission |  Not posible | P m12 t12 | FIXED: Error message improvable |
| Reshare reflected | Open Share<br>Share with another user<br>Recipient reshares |  First user sees both shares | P m12 t12|  |
| Edit permission OK | Open Share<br>Share with another user with edit permission<br>Recipient tries to edit<br>Try the same with Files App | Recipient can edit | P m12 t12 |  |
| Edit permission denied | Open Share<br>Share with another user with no edit permission<br>Recipient tries to edit<br>Try the same with Files App |  It is posible | F m12 t12 | Spinner forever -> move to core|
| Edit permission folders view | Open Share<br>Share a folder with another user  |  Create, change, delete options are there. Information icon shows additional info | P m12 t12 |  |
| Edit permission folders vanished | Open Share<br>Share a folder with another user without change, create and delete | options vanished | P m12 t12| FIXED: Can Edit checked |
| Edit permission folders | Open Share<br>Share a folder with another user with all permissions<br>Remove two permissions (change and delete)  | Correctly updated in UI | P m12 t12| FIXED: Race conditions |
| Edit permission folders create | Open Share<br>Share a folder with another user with only create  | Recipient can upload content, but change and delete | P m12 t12|  |
| Edit permission folders Change | Open Share<br>Share a folder with another user with only change  | Recipient can change content, but create and delete | F m12 t12| Not delete -> Unshare |
| Edit permission folders Delete | Open Share<br>Share a folder with another user with only Delete  | Recipient can delete content, but create and change | P m12 t12|  |
| Delete one recipient | Open Share<br>Share with several users<br>Delete one recipient | Recpient deleted, but in files view file is still marked as shared (private) | P m12 t12 | FIXED: Unshare wording  |
| Delete all recipients | Open Share<br>Share with serveral users<br>Delete all recipients | Recipients deleted, in files view file is not marked as shared (private) | P m12 t12 |  |
| Recipient deletes | Share with a user<br>Recipient deletes the file in the file list | File is not shared, check in original user | NA | Server behaviour is keeping the share?
| Remote share | In web UI create a share with different options | Correctly shown in the app | P m12 t12 |  |
| More than 50 results | Perform a recipient search that retrieves more than 50 results| App runs correctly (good performance) | P m12 t12 |  |
|**Federated Share**||||||
| Share with a user in other server | Open Share<br>Type a correct user name with remote URL<br>Recipient accepts | Sharees list updated with the user after accepting in web UI<br>Recipient accesses the file | P m12 t12|  |
| Share with a user which contains @ | Open Share<br>Type a correct user name which contais @ | User in the list of matches | P m12 t12| FIXED: Identified as federated |
| Remove federated | Recipient remove the share | Share is not in the list of shares of the original user | P m12 t12|  |
| Incorrect federated | URL is not correct | Correct error shown to the user | P m12 t12|  |
| Accept federated | Create a federated share<br>In Quick access, accept federated share | Share is added to the list and removed from pending. Same in WebUI | P m12 t12|  |
| Decline federated | Create a federated share<br>In Quick access, decline federated share | Share is not added to the list and removed from pending. Same in WebUI | P m12 t12| FIXED:Incorrect value in notification |
| Accept federated remote | Create a federated share<br>In Quick access, check federated share<br>Accept in web UI | Share is added to the list and removed from pending in app. Same in WebUI | P m12 t12|  |
| Decline federated remote | Create a federated share<br>In Quick access, check federated share<br>Decline in web UI | Share is not added to the list and removed from pending in app. Same in WebUI | P m12 t12|  |
| Unshare | Create a federated share<br>In recipient, accept and then, unshare | Share is removed from both source and recipient | P m12 t12| FIXED: Not working |
|**Public Share**||||||
| View files | Select to create a public link from a file | Correct view and premissions available | P m12 t12 | FIXED: Long links overlaps copy button | |  
| View folders | Select to create a public link from a folder | Correct view and premissions available | P m12 t12 | | |  
| Create with name | Select to create a public link with an specific name | Correct creation with name (check in web UI)| P m12 t12|  | | 
| Create without name | Select to create a public link with no name  | Correct creation with  default name (check in web UI)| P m12 t12 | FIXED: Crash. No name shown | | 
| Create with password| Select to create a public link with password  | Correct creation with password. Paste the link in browser to be asked the password| P m12 t12 |  | | 
| Create without password| Select to create a public link with no password  | Correct creation with no password. Paste the link in browser, password not asked| P m12 t12 |  | | 
| Create with expiration date| Select to create a public link with expiration date  | Correct creation with expiration date. Check in web UI| P m12 t12 | FIXED: Date picker behind keyboard. Default date not saved |  | 
| Create without expiration date| Select to create a public link with no expiration date  | Correct creation with no expiration date. Check in web UI| P m12 t12|  | | 
| Create folder Download/View | Select to create a public link of a folder with Download/View permission  | Correct creation. Check in web UI| P m12 t12 |  | | 
| Create folder Download/View/Upload | Select to create a public link of a folder with Download/View/Upload permission  | Correct creation. Check in web UI| P m12 t12 |  | | 
| Create folder Upload Only (File Drop) | Select to create a public link of a folder with Upload only permission  | Correct creation. Check in web UI| P m12 t12|  | | 
| Edit name | On a created public link, edit the name  | Correct edition. Check in web UI| P m12 t12 | FIXED: Not posible | | 
| Edit password | On a created public link, edit the password  | Correct edition. Check in web UI| P m12 t12 |  | | 
| Edit removing password | On a created public link, remove the password  | Correct edition. Check in web UI| P m12 t12 |  | | 
| Edit expiration date | On a created public link, edit the expiration date  | Correct edition. Check in web UI| P m12 t12 | FIXED: Bad UX | | 
| Edit removing expiration date | On a created public link, remove the expiration date  | Correct edition. Check in web UI| P m12 t12 | FIXED: Expiration date not removed  | | 
| Edit folder permission | On a created public link on a folder, switch the permissions through every option | Correct edition. Check in web UI| P m12 t12|  | | 
| Delete one | Delete an already create public link  |  Link not available anymore, check in file list | P m12 t12|  | | 
| Delete all | Delete all public link of an item | Links not available anymore, check in file list | P m12 t12 |  | | 
| Send link | Create a link and use the open in option to send it | Options to send correctly displayed | P m12 t12 | | | 
|**Private link**||||||
| Get link View | Open Share view | Option correctly displayed | P m12 t12| FIXED: overlapped with button | | 
| Copy link | Get copy link and paste in the browser | File correctly linked | P m12 t12 | | | 
|**Capabilities**||||||
| Share API disabled | Open file list | There is no option to share | P m12 t12|  |
| Allow share via link disabled | Open file list | There is no option to share public, but there is for privates | P m12 t12 | Links enabled -> expected behaviour|
| Enforce password protection read only enabled | Create a public share with read only permission  and without password | Not posible | P m12 t12 |  |
| Enforce password protection read write enabled | Create a public share with read and write permission and without password | Not posible | P m12 t12  |  |
| Enforce password protection upload only enabled | Create a public share with upload only permission and without password | Not posible | P m12 t12 |  |
| Default expiration date | Create a public share and enable expiration date | Default date is there | P m12 | FIXED: Not set |
| Enforced expiration date | Create a public share and enforce expiration date | Default date is there and can not be removed| P m12 t12|  |
| Allow resharing enabled | Share a file<br>Recipient tries to reshare  | Recipient can reshare| P m12 |  |
| Allow resharing disabled | Share a file<br>Recipient tries to reshare  | There is no option to reshare | P m12 t12| FIXED: Options to reshare are there. Share option not hidden. |
| Allow sharing with groups disabled | Share a file with groups | Not posible | P m12 t12 |  |
| Default share permission | Set different options in web UI<br>Create a share in the app | Default options are the same | F m12 t12 | Hidden instead of unchecked |
| Allow send federated = false | Try to create a federated share | Not posible | P m12 t12 |  |
| Allow receive federated = false | Try to create a federated share | Not posible | P m12 t12|  |
|**Privacy Policy**| 1 device |||
| Minimum characters | Set a minumum characters to create the password<br>Type a password with less characters | Correct error | P m12 |  |
| Lowercase | Set a minumum lowercase characters to create the password<br>Type a password with less lowercase characters | Correct error | P m12 |  |
| Uppercase | Set a minumum uppercase characters to create the password<br>Type a password with less uppercase characters | Correct error | P m12 |  |
| Numbers | Set a minumum numbers to create the password<br>Type a password with less special characters | Correct error | P m12 |  |
| Special characters | Set a minumum special characters to create the password<br>Type a password with less uppercase characters | Correct error | P m12 |  |
| Matching policy | Set all conditions<br>Type a password that matches every condition | Link created | P m12 |  |
| Expiration with password set | Set a number of days for expiration if password is set | Link forces to include expiration date in maximum the set up| P m12 |  |
| Expiration with password notset | Set a number of days for expiration if password is not set | Link forces to include expiration date in maximum the set up| P m12 |  |
|**Favorites**||||
| View | Open card of any item | View is correct | P m12 t12| | | 
| Set fav File | in the app, set a file as favorite | Check in web UI that the file is favorite | P m12 t12| | | 
| Set fav Folder | in the app, set a folder as favorite | Check in web UI that the folder is favorite | P m12 t12 | | | 
| Unset fav File | in the app, unset a file as favorite | Check in web UI that the file is not favorite anymore| P m12 t12 | | | 
| Unset fav Folder | in the app, set a folder as favorite | Check in web UI that the folder is not favorite anymore | P m12 t12 | | | 
| Remote set fav | in web UI, set an item as favorite | Check in the app that the item is favorite | P m12 t12 | | | 
| Remote unset fav | in web UI, unset an item as favorite | Check in the app that the item is not favorite anymore | P m12 t12 | | | 
| Set fav offline| in the app, with no connection set a file as favorite<br>Recover connection | Check in web UI that the file is favorite | P m12 t12 | | | 
| Unset fav offline | in the app with no connection, unset a file as favorite<br>Recover connection | Check in web UI that the file is not favorite anymore| P m12 t12 | | | 
| Set fav remote offline| in the app, remove connection<br>In web set a file as favorite<br>Recover connection | Check in the app that the file is favorite | P m12 t12 | | | 
| Unset fav remote offline | in the app, remove connection<br>In web UI unset a file as favorite<br>Recover connection | Check in app that the file is not favorite anymore| P m12 t12 | | | 
|**Quick access**||||
| No Public links | Open Quick Access -> Public Links with no public links| Correct view | P m12 | | | 
| Public links | Create some public links<br>Open Quick Access -> Public Links | All public links are there | P m12 | | | 
| No Shares | Open Quick Access | No Shares there | P m12 | | | 
| Shares  | Create some Shares<br>Open Quick Access -> Shares | All Shares are there | P m12 | | | 
| No Shared with you | Open Quick Access | No Shares with you there | P m12 | | | 
| Shared with you | Create some Shares<br>Open Quick Access in the recipient -> Shares | All Shares are there | P m12 | | | 
| No Images | Open Quick Access -> Images, but no images in the account| Correct view | P m12 | | | 
| Images | Upload some images<br>Open Quick Access -> Images | All images are there | P m12 | | | 
| No PDFs | Open Quick Access -> PDFs, but no pdfs in the account| Correct view | P m12 | | | 
| PDFs | Upload some PDFs<br>Open Quick Access -> PDFs | All PDFs are there | P m12 | | | 
| No Favorites | Open Quick Access -> Favorites, but no favorites in the account| Correct view | P m12| | | 
| Favorites | Set some favorites in different folders<br>Open Quick Access -> Favorites | All Favorites are there | P m12 | | | 
|**Extra**||||
| 292 | Issue 292 ||  P m12 | FIXED (all): https://github.com/owncloud/ios-app/pull/358#issuecomment-498705578 | | |

