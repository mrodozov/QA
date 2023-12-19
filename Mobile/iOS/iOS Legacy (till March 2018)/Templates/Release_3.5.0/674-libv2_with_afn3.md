###  New library version including AFN3 

#### Pr: https://github.com/owncloud/ios/pull/674

Device:

Server:

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Login**||||||
| 1 | http URL | Input a correct http URL | The connection is stablished |  |  |
| 2 | https trusted URL | Input a correct https URL (server with trusted certif) | The connection is stablished |  |  |
| 3 | https untrusted URL | Input a correct https URL (server with untrusted certif) | The connection is stablished atfer accepting the certificate|  |  |
| 4 | Correct credentials | Input correct credentials | Access granted to the app |  |
| 5 | Incorrect credentials | Input incorrect credentials | Access denied to the app |  |
|**File actions**||||||
| 6 | Create folder | Tap on (...) to create a new folder with special characters | Folder is correctly created (check in server)  |  |
| 7 | Rename file | Swipe over a file and select rename | File is renamed correctly  |  |
| 8 | Rename folder | Swipe over a folder and select rename | Folder is renamed correctly  |  |
| 8 | Move file | Swipe over a file (in root) and select move. Move it to a deep folder | Folder is moved correctly  |  |
| 10 | Move folder | Swipe over a folder (not in root) and select move. Move it to root folder | Folder is moved correctly  |  |
| 11 | Download file | Tap on a file  | File is downloaded correctly |
| 12 | Download huge file | Tap on a huge file  | File is downloaded correctly |
| 13 | Download folder foreground| Swipe to download folder that have several subfolders in different deep levels, containing files | Folder content is correctly downloaded |
| 14 | Download folder background| Swipe to download a folder that have several subfolders in different deep levels, containing a huge number of files. Lock the device and wait at least 3 minutes | Folder content is correctly downloaded |
| 15 | Favourite folder foreground| Swipe to favourite a folder that have several subfolders in different deep levels, containing files | Folder content is correctly downloaded and favourited |
| 16 | Favourite folder background| Swipe to download a folder that have several subfolders in different deep levels, containing a huge number of files. Lock the device and wait at least 3 minutes | Folder content is correctly downloaded and favourited |
| 17 | Cancel download file | 1. Tap on a file  to download<br>2. Cancel the download | File is not downloaded |
| 18 | Cancel download folder | 1. Swipe to download a folder<br>2. Swipe to cancel the download | 1. Folder starts to download<br>2. The already downloaded files remain. Othercase, the download is cancelled |
| 19 | Update file in server | 1. Modify a file in server<br>2. In the app, pull down<br>3. Tap on the file| 2. Change is detected<br>3. File is updated | | | 
| 20 | Update folder in server | 1. Modify a folder in server<br>2. In the app, pull down<br>3. Tap on the folder| 2. Change is detected<br>3. Folder is updated | | | 
| 21 | Update favourite file in server | 1. Modify a favourite file in server<br>2. In the app, pull down| 2. Change is detected and file is updated | | | 
| 22 | Update favourite folder in server | 1. Modify a favourite folder in server<br>2. In the app, pull down| 2. Change is detected and folder is updated | | |
| 23 | Delete file | Swipe over a file to delete | File is removed correctly (check in server side) |
| 24 | Delete folder | Swipe over a folder to delete | File is removed correctly (check in server side) |
|**Uploads**||||||
| 25 |Upload file| Tap on (...) and select a pic to upload| File is uploaded correctly (check in server side) and correctly handled in uploads view |
| 26 |Upload files| Tap on (...) and select several pics to upload| Files are uploaded correctly (check in server side) and correctly handled in uploads view |
| 27 |Upload huge file | 1. Tap on (...) and select a huge file to upload| Selected file is uploaded |
| 28 |Cancel upload | 1. Tap on (...) and select a huge file to upload<br>2. Cancel the upload by tapping on (X)| Selected file is not uploaded |
| 29 |Queue priority| 1. Tap on (...) and select several pics to upload<br>2. Tap on a file that is being uploaded| Selected file is uploaded immediatly. At the end all files are uploaded|
| 30 |Local updating| 1. Modify locally a file| Selected file is uploaded immediatly| | |
| 31 |No connection| 1. Set the device connection off<br>2.  Tap on (...) and select several pics to upload<br>3. Set the device connection on| 2. File is awaiting connection in uploads view<br>3. Files are uploaded |
| 32 |Connection loss| 1. Tap on (...) and select a pic to upload<br>2. Set the device connection off<br>3. Set the device connection on| 2. File is awaiting connection in uploads view<br>3. Upload is resumed|
| 33 |Instant upload| 1. In Settings, enable instant uploads <br>2. Take a pic |  Pic is uploaded immediatly|
| 34 |Instant uploads| 1. In Settings, enable instant uploads <br>2. Take several pics | Pics are uploaded immediatly |
| 35 |Instant uploads without connection| 1. In Settings, enable instant uploads <br>2. Take several pics without connection<br>3. Switch the device connection on| Pics are uploaded when the connection is recovered |
|**Share**||||||
| 36 |Share a file/folder with a user| 1. Swipe to share with users/groups<br>2. Select a user | File is correctly shared (check with the sharee) |
| 37 |Share a file/folder with a group| 1. Swipe to share with users/groups<br>2. Se7lect a group | File is correctly shared (check with the sharees) |
| 38 |Share link| 1. Swipe to share by link<br>2. Enable expiration time<br>3. Enable  password<br>4. In case of a folder, enable editing | 1. Share link is generated<br> 2. Check expiration date in server<br>3. Check the link with the password<br>4. Check that content can be uploaded |
| 39 |Federated share| 1. Swipe to share with users/groups<br>2. Select a user in other server<br>3. With the sharee, accept the share | File is correctly shared (check with the sharee) |
|**No connections**|Disable network in device|||||
| 40 |Create folder| Create a folder without connection | Error is shown |
| 41 |Move file/folder| Move a file/folder without connection | Error is shown |
| 42 |Rename file/folder| Rename file/folder without connection | Error is shown |
| 43 |Download file/folder| Download file/folder without connection | Error is shown |
| 44 |Favourite file/folder| Favourite file/folder without connection | Error is shown |
| 45 |Share file/folder| Share file/folder without connection | Error is shown |
| 46 |Share link| Share link without connection | Error is shown |
|**Thumbnails**||||||
| 47 |Remote thumbnails| 1.In server, upload a huge amount of pics<br>2. Login in that account with the app| Thumbnails are downloaded. By scrolling down, the thumbnails downloaded are always the displayed ones |
|**Special servers**||||||
| 48 |Redirection| 1. Login in a redirect server<br>2. Perform some actions over files and folders | Actions are correctly performed |
| 49 |Shibboleth| 1. Login in a Shibboleth server<br>2. Perform some actions over files and folders | Actions are correctly performed |
| 50 |Shibboleth expiration| 1. Login in a Shibboleth server<br>2. Wait until session expires and perform any action| Login view is displayed and credentials are required |