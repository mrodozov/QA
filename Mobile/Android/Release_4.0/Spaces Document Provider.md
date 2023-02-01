### Spaces document provider


#### PR: 

**Devices**: Samsung A51 Android 12<br>
**Server**: 10.11


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**List spaces**||||
| Only personal | 1. Add oCIS account with no custom spaces, only Personal<br>2. Open any app with access to Document Provider | Account is listed<br>Only Personal space listed in root level  | P m12  |  |
| Personal and Custom spaces | 1. Add oCIS account with some custom spaces<br>2. Open any app with access to Document Provider | Account is listed<br>All spaces listed in root level  | P m12 |  |
| Add new space | 1. Add oCIS account with some custom spaces<br>2. Open any app with access to Document Provider<br>3. In web, add a new space<br>4. In document provider app, pull to refresh | New space is listed | NA | Hot update only in the app |
| Remove existing space | 1. Add oCIS account with some custom spaces<br>2. Open any app with access to Document Provider<br>3. In web, remove an existing space<br>4. In document provider app, pull to refresh | Space removed is no longer listed | NA | Hot update only in the app |
| Two accounts with spaces | 1. Add two oCIS account with some custom spaces<br>2. Open any app with access to Document Provider<br>3. Switch to one account to other in the Document Provider app | Both apps showing their correct list of spaces | F m12 | Not switching list |
| oCIS + oC10 | 1. Add a oCIS account with some custom spaces<br>2. Add an oC10 account<br>3. Open any app with access to Document Provider<br>3. Switch to one account to other in the Document Provider app | oCIS account shows list of spaces<br>oC10 shows the content of root folder | P m12 |  |
|Two accounts without spaces | 1. Add two oC10 accounts<br>2. Open any app with access to Document Provider<br>3. Switch to one account to other in the Document Provider app | Just showing root folder content, no spaces available | P m12 |  |
| Setting disabled | 1. Add oCIS accounts<br>2. In app Settings, go to Security and click option `Lock access from document provider`<br>3. Open any app with access to Document Provider | Access to oC locked| P m12 |  |
|**Spaces content**||||
| Personal | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open the personal space<br>3. Browse through space in document provider app| 2. Root folder listed<br>3. All folders' content is listed  | P m12 |  |
| No Personal | 1. Add oCIS account with custom spaces<br>2. Open any app with access to Document Provider to open the custom spaces<br>3. Browse through spaces in document provider app| All folders' content is listed in custom spaces | P m12 |  |
| oC10 | 1. Add oC10 account<br>2. Open any app with access to Document Provider<br>3. Browse through folders in document provider app| All folders' content is listed  | P m12 |  |
|**Operations**||||
| Create folder personal root | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open the personal space<br>3. Create new folder in personal space's root folder | Folder created and visible in document provider app, oC app and server  | P m12 |  |
| Create folder personal non-root | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open the personal space<br>3. Create new folder in personal space's non-root folder | Folder created and visible in document provider app, oC app and server  | P m12 |  |
| Create folder custom space root | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open any custom space<br>3. Create new folder in custom space's root folder | Folder created and visible in document provider app, oC app and server  | P m12 |  |
| Create folder custom non-root | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open any custom space<br>3. Create new folder in custom space's non-root folder | Folder created and visible in document provider app, oC app and server  | P m12 |  |
| Create folder oC10 | 1. Add oC10 account<br>2. Open any app with access to Document Provider to open any custom space<br>3. Create new folder in oC10, both root and non-root folder | Folders created and visible in document provider app, oC app and server  | P m12 |  |
| Error Create folder | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open any custom space<br>3. Create new folder using the same name as an existing folder causing a collision | Error message in document provider app | P m12 |  |
| Create folder spaces level | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Open list of spaces with document provider account<br>4. Try to create a folder there | Not posible | P m12 |  |
| Rename item personal root | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open the personal space<br>3. Rename any item in personal space's root folder | Item renamed and visible in document provider app, oC app and server  | P m12 |  |
| Rename item personal non-root | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open the personal space<br>3. Rename item in personal space's non-root folder | Item renamed and visible in document provider app, oC app and server  | P m12 |  |
| Rename item custom space root | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open any custom space<br>3. Rename item in custom space's root folder | Item renamed and visible in document provider app, oC app and server  | P m12 |  |
| Rename item custom non-root | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open any custom space<br>3. Rename item in custom space's non-root folder | Item renamed and visible in document provider app, oC app and server  | P m12 |  |
| Rename item oC10 | 1. Add oC10 account<br>2. Open any app with access to Document Provider to open any custom space<br>3. Rename item in oC10, both root and non-root folder | Items renamed  and visible in document provider app, oC app and server  | P m12 |  |
| Error Rename | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open any custom space<br>3. Rename any item by using the same name as an existing item, causing a collision | Error message in document provider app | P m12 |  |
| Rename space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Open list of spaces with document provider account<br>4. Try to rename a space there | Not posible | P m12 |  |
| Delete item personal root | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open the personal space<br>3. Delete any item in personal space's root folder | Item deleten and not visible in document provider app, oC app and server anymore | P m12 |  |
| Delete item personal non-root | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open the personal space<br>3. Delete item in personal space's non-root folder | Item deleted and not visible in document provider app, oC app and server anymore | P m12 |  |
| Delete item custom space root | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open any custom space<br>3. Delete item in custom space's root folder | Item deleted and not visible in document provider app, oC app and server anymore | P m12  |  |
| Delete item custom non-root | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open any custom space<br>3. Delete item in custom space's non-root folder | Item deleted and not visible in document provider app, oC app and server anymore | P m12 |  |
| Delete item oC10 | 1. Add oC10 account<br>2. Open any app with access to Document Provider to open any custom space<br>3. Delete item in oC10, both root and non-root folder | Items deleted  and not visible in document provider app, oC app and server anymore | P m12 |  |
| Delete space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Open list of spaces with document provider account<br>4. Try to delete a space from there | Not posible | P m12 |  |