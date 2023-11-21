### Trackpad & mouse support iPad

#### Pr: https://github.com/owncloud/ios-app/pull/656

Devices: iPad Air v13.4<br>
Server: 10.4.0

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Welcome view**|
| Welcome view | Click in: Settings button, plus button, Add account button | Correctly executed  | P t13 |  |  |
|**Add account**|
| Add account | Click in: Cancel, Continue, soft keyboard, cancel review connection, approve review connection, Done | Correctly executed  | P t13 |  |
|**Settings**|
| Passcode Lock | Click in: Switch, number buttons, cancel | Correctly executed  | P t13 | | |
| Lock aplication | Click in: different options | Correctly executed  | P t13 | | |
| Touch ID | Click in: switch | Correctly executed | P t13 | | |
| Certificates | Click in: certificates | Correctly executed | F t13 | Not posible to scroll down. Not posible to swipe left in certificate  | Scroll only available with mouse, not trackpad | |
| User interface | Click in: themes, logging switches, logging options, open in loggingfile | Correctly executed | P t13 | | |
| Storage | Click in: themes, logging switches, logging options, open in logging file | Correctly executed | P t13 | | |
| Display Settings | Click in: Switch | Correctly executed  | P t13 | | |
| Media Files | Click in: Switch | Correctly executed  | P t13 | | |
| Media Upload | Click in: Switches, Select account, Select upload Path| Correctly executed  | P t13 | | |
| In App | Click in: Switches, Purchase buttons | Correctly executed  | P t13 | | |
| More | Click in: Switch | Correctly executed  | P t13 | | |
|**Accounts**|
| Add account | Click in: Edit, plus button, Settings, Swipe account | Correctly executed | F t13 | Swipe is not posible  |
| Swipe options | Click in: Edit, Delete, Manage, Open in new window | Correctly executed| P t13 |  |
| Manage Account | Click in: Switch, Delete Local Copies | Correctly executed| P t13 |  |
|**File list**|
| Up section | Click in: Back button, plus button, three dot button, search bar, sorting bar, multiselection, navigation chevron | Correctly executed | P t13 | FIXED: Three dot button shows incorrectly the menu |
| Bottom section | Click in: Browse, Quick access items, status | Correctly executed | P t13 | FIXED: Three dot button in quick access items shows incorrectly the menu |
|**File operations**|
| Browse | Click in: file and folder in the list | Correctly executed |  |
| File | Click in: items of the card, including the favorite start | Correctly executed | P t13 | FIXED: Card not correctly displayed  |
| Folder | Click in: items of the card, including the favorite start | Correctly executed | P t13 | FIXED: Card not correctly displayed |
| Share with users | Click in: search bar, results, permissions, name, save, cancel, info | Correctly executed | P t13 |  |
| Links | Click in: copy link, create link, plus button, done, switches, name, create | Correctly executed | P t13 |  |
| PDF view | Click in: List, search, Go to | Correctly executed | P t13 |  |
| Markup | Click in: Painting options, text, signature, magnifier, done, open in | Correctly executed | P t13 |  |
| Stop | Select an item to upload and cancel it before it finishes by clicking the square button | Correctly stopped | P t13 |  |
|**Hover efects**|
| File List | Move the cursor over items in the file list | Hover visual effect  | P t13 |  |
| More menu | Move the cursor over items in the more menu | Hover visual effect  | P t13 |  |
| Account list | Move the cursor over items in the account list | Hover visual effect  | P t13 |  |
| Settings | Move the cursor over items in the settings | Hover visual effect  | P t13 |  |
| Photo selection | Move the cursor over items in the photo selection (upload from albums) | Hover visual effect  | P t13 |  |
| PDF thumbnail view | Move the cursor over items in the PDF thumbnail view (in the top of PDF preview, icon with three lines) | Hover visual effect  | P t13 |  |
|**iPhone**|||||
| Correct working | Install in an iPhone | App is correctly installed, and login is posible as well as other operations | P m13 |  |