###  Keyboard commands

#### Pr: https://github.com/owncloud/ios-app/pull/491

Devices: iPhoneX v13<br>
Server: 10.2.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Account management**|
| Add account | Execute the Add account with the keyboard: cmd + "+"| Correctly executed  | P t13 | FIXED: Not posible to approve. OAuth2.  |  |
| Edit account | Execute the Edit account with the keyboard: capitals + cmd + ","| Correctly opened  | P t13 | FIXED: OAuth2 |  |
| Manage account | Execute the Manage account with the keyboard: capitals + cmd + "M"| Correctly opened  | P t13 | FIXED: Cannot cancel |  |
| Delete account | Execute the Manage account with the keyboard: capitals + cmd + "back"| Correctly deleted  | P t13 |  |  |
|**Settings**|
| Open View | Execute the Open Settings with the keyboard: cmd + "," from the list of accounts| Correctly displayed  | P t13 |  |  |
| Browse | Browse through the setting and change them | Switches are switched with the right arrow<br>Submenus are browsed with the right arrow<br>Multiple selection are selected/upselected with the right arrow<br>Browse back with cmd + up arrow | P t13 | FIXED: Delete unused copies. FIXED: Instant uploads folder |  |
|**File operations**|
| Open In | Execute the Open In with the keyboard over a file: cmd + O | Correctly executed  | P t13 |  |  |
| Move | Move an item with the keyboard: cmd + V<br>Browse to select a correct target folder | Correctly executed  | P t13  | FIXED: ow to select move? |  |
| Rename | Rename an item with the keyboard: cmd + intro | Correctly executed  | P t13 |  |  |
| Duplicate | Duplicate an item with the keyboard: cmd + D | Correctly executed  | P t13 |  |  |
| Copy | Copy an item with the keyboard: cmd + C<br>Browse to select a correct target folder | Correctly executed  | P t13 | FIXED: How to select the target? |  |
| Remove | Remove an item with the keyboard: cmd + back arrow | Correctly executed  | P t13 | Can not cancel3 |  |
| Share default permissions| Share an item with the keyboard: cmd + S<br>Search recipient cmd + F<br>Select one recipient and submit with default permissions<br>Save cmd + S | Correctly executed with default permissions | P t13 | FIXED: Crash  |  |
| Share with changed perimssions | Share an item with the keyboard: cmd + S<br>Search recipient cmd + F<br>Select one recipient<br>Modify permissions<br>Save cmd + S | Correctly executed with correct permissions | P t13 | FIXED: Crash |  |
| Link defaults| Create a link over an item with the keyboard: cmd + L<br>Save cmd + S | Correctly executed  | P t13 | FIXED: Crash |  |
| Link name| Create a link over an item with the keyboard: cmd + L<br>Change name<br>Save cmd + S | Correctly executed with the typed name | P t13 | FIXED: Crash when editing |  |
| Link password| Create a link over an item with the keyboard: cmd + L<br>Change (add) password<br>Save cmd + S | Correctly executed with the password | P t13 |  |  |
| Link expiration| Create a link over an item with the keyboard: cmd + L<br>Save cmd + S | Correctly executed  | NA | PENDING: How to select the expiration date? |  |
| Copy clipboard | Copy an item to clipboard with the keyboard: capitals + cmd + C| Correctly executed  | P t13 |  |  |
| Paste clipboard | Paste an item from clipboard with the keyboard: capitals + cmd + V| Correctly executed  | P t13 |  |  |
| Search | Search an item with the keyboard: cmd + F| Correctly executed  | P t13 | FIXED: Only if item not selected. How to deselect? |  |
| Av. offline | Set as av. offline an item: capitals + cmd + O| Correctly executed  | P t13 | FIXED: All items as av. offline |  |
| Unav. offline | Unav. offline an item: capitals + cmd + O| Correctly executed  | P t13 |  |  |
| Favorite | Set as favorite an item: cmd + F| Correctly executed  | P t13 | |  |
| Unfavorite | Unfavorite an item: cmd + F| Correctly executed  | P t13 | |  |
| Change Sort Order | Change sort order with the keyboard: capitals + cmd + S| Correctly executed  | P t13  |  |  |
| Sort by name | Sort by name with the keyboard: alt + cmd + 1| Correctly executed  | P t13 |  |  |
| Sort by type | Sort by type with the keyboard: alt + cmd + 2| Correctly executed  | P t13 |  |  |
| Sort by size | Sort by size with the keyboard: alt + cmd + 3| Correctly executed  | P t13 |  |
| Sort by date | Sort by date with the keyboard: alt + cmd + 4| Correctly executed  | P t13 |  |  |  |
| Sort by share | Sort by share with the keyboard: alt + cmd + 5| Correctly executed  | P t13 |  |  |
| Select next | Select next with the keyboard: down arrow | Correctly executed  | P t13 |  |  |
| Open Selected | Open Selected with the keyboard: right arrow | Correctly executed  | P t13 |  |  |
| Scroll to top | Scroll to top with the keyboard: capitals + cmd + up arrow | Correctly executed  | P t13 |  |  |
| Scroll to bottom | Scroll to bottom with the keyboard: capitals + cmd + down arrow | Correctly executed  | P t13 |  |  |
| Select last item | Select last item with the keyboard: cmd + down arrow | Correctly executed  | P t13 |  |  |
| Create folder | Create folder with the keyboard: cmd + N | Correctly executed  | P t13 | FIXED: How to create in root? |  |
| Upload File | Upload with the keyboard: cmd + "+"<br>Select files from Files App to upload | Correctly uploaded  | P t13 | FIXED: How to upload in root? |  |
| Upload Photos | Upload with the keyboard: cmd + "+"<br>Select from camera album by browsing<br>With space key, select items to upload<br>With cmd + U, sumbit the selection | Correctly uploaded  | P t13 | FIXED: How to upload in root? |  |
|**Shorcuts**|
| Browse | Select "Browse" shortcut with cmd + 1 | Tab opened  | P t13 |  |  |
| Quick access | Select "Quick access" shortcut with cmd + 2<br>Browse through the options | Tab opened and correct browsing | P t13 |  |  |
| Status | Select "Status" shortcut with cmd + 3 | Tab opened  | P t13 |  |  |