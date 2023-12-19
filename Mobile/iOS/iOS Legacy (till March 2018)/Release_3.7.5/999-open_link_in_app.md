### Open private link within the app

#### Pr: https://github.com/owncloud/ios/pull/999 

Devices: iPadAir v11, iPhone 6S Plus v11

Server: 10.0.6


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Root**|||||||
| 1 | File in root supported downloaded | 1. Get private link of a supported format downloaded file in root<br>2. Open the link in the device | App is opened and the file is opened | P t11 m11|  |
| 2 | File in root supported not downloaded | 1. Get private link of a  supported format downloaded file in root<br>2. Open the link in the device | App is opened and the file is downloaded and opened | P t11 m11|  |
| 3 | File in root not supported downloaded | 1. Get private link of a non-supported format file in root<br>2. Open the link in the device | App is opened and the file is highlighted | P t11 m11| FIXED: When settings displayed not highlighted |
| 4 | File in root not supported not downloaded | 1. Get private link of a non-supported format non-downloaded file in root<br>2. Open the link in the device | App is opened and the file is highlighted | P t11 m11 | FIXED: When settings displayed not highlighted |
| 5 | Shared file supported | 1. User1 shares with user2 and send the link<br>2. User2 open the link | File downloaded and displayed | P t11 m11 | FIXED: Not opened - error message |
| 6 | Shared file non-supported | 1. User1 shares with user2 and send the link<br>2. User2 open the link | File downloaded and highlighted | P t11 m11 | FIXED: Not opened - error message |
| 7 | Shared Folder | 1. User1 shares with user2 and send the link<br>2. User2 open the link | Folder opened | P t11 m11 | FIXED: Error message |
|**Non-root cached**|||||||
| 8 | Non-Root folder | 1. Get private link of a cached folder in non-root<br>2. Open the link in the device | App is opened and the content of the folder is shown | P t11 m11 |  |
| 9 | File in non-root supported downloaded | 1. Get private link of a supported format downloaded file in non-root folder, which is cached<br>2. Open the link in the device | App is opened and the file is opened | P t11 m11 |  |
| 10 | File in non-root supported not downloaded | 1. Get private link of a  supported format downloaded file in non-root folder, which is cached and contais special characters<br>2. Open the link in the device | App is opened and the file is opened | P t11 m11 | FIXED: Special characters -> crash |
| 11 | File in non-root not supported downloaded | 1. Get private link of a non-supported format file in non-root folder, which is cached<br>2. Open the link in the device | App is opened and the file is highlighted | P t11 m11 |  |
| 12 | File in non-root not supported not downloaded | 1. Get private link of a non-supported format non-downloaded file in non-root folder, which is cached<br>2. Open the link in the device | App is opened and the file is highlighted | P t11 m11 |  |
|**Non-root non-cached**|||||||
| 13 | Non-Root folder | 1. Get private link of a non-cached folder in root<br>2. Open the link in the device | App is opened and the content of the folder is shown | P t11 m11 |  |
| 14 | File in non-root supported | 1. Get private link of a supported format downloaded file in non-root folder, which is non-cached<br>2. Open the link in the device | App is opened and the file is opened | P t11 m11|  |
| 15 | File in non-root not supported | 1. Get private link of a non-supported format file in non-root folder, which is non-cached<br>2. Open the link in the device | App is opened and the file is highlighted | P m11 t11 |  |
|**Names**|||||||
| 16 | File special characters | 1. Get private link of a file which name contains special characters | File opened or highlighted | P t11 m11 | FIXED: Error message, not opened |
| 17 | Folder special characters | 1. Get private link of a folder which name contains special characters | Folder opened | P t11 m11 | FIXED: Crash |
| 18 | File blanks | 1. Get private link of a file which name contains blanks | File opened or highlighted | P t11 m11 |  |
| 19 | Folder blanks | 1. Get private link of a folder which name contains blanks | Folder opened | P t11 m11| FIXED: Error message |
|**Multiaccount**|||||||
| 20 | Active account | 1. Get private link of item in the active account<br>2. Open the link in the device | App is opened and the item is correctly shown | P t11 m11 |  |
| 21 | Non-active account | 1. Get private link of item in a non-active account<br>2. Open the link in the device | Error message, the account is not the active one | P t11 m11|  |
|**Error handling**|||||||
| 22 | No Connection cached non-downloaded file | 1. Get private link of a non-downloaded cached file<br>2. Open the link in a device | File can not be downloaded but browsed, correct error message | P t11 m11 |  |
| 23 | No Connection downloaded cached file | 1. Get private link of a downloaded cached file<br>2. Open the link in a device | App is opened and the file is browsed and opened. | F t11 m11| File not shown  pics1/pics2/pics3 | 
| 24 | No Connection non-cached file | 1. Get private link of a non-cached file<br>2. Open the link in a device | File or folder can not be browsed, correct error message | P t11 m11 |  |
| 25 | No Connection non-cached folder | 1. Get private link of a non-cached folder<br>2. Open the link in a device | Folder can not be browsed, correct error message | P t11 m11|  |
| 26 | No Connection cached folder | 1. Get private link of a cached folder<br>2. Open the link in a device | Folder is opened  | F t11 m11 | Cached, should be accesible. Not browsed, only JPEG and not always |
| 27 | Non existing cached item | 1. Get private link of a non-cached file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in a device | File or folder does not exist, correct error message | P t11 m11 | FIXED: Crash |
| 28 | Non existing non-cached item | 1. Get private link of a non-cached file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in a device  | File or folder can not be browsed, correct error message | P t11 P m11 | FIXED: Crash |
| 29 | File not accesible | 1. Get private link of a non-accesible file<br>2. Open the link in a device  | File can not be shown, correct error message? | P m11 t11 | FIXED: Crash |
| 30 | Folder not accesible | 1. Get private link of a item non-accesible folder<br>2. Open the link in a device  | Folder can not be shown, correct error message? | P t11 m11 | FIXED: Crash |
| 31 | App not installed | Get private link of a non-cached file or folder | Opened in browser | P t11 m11 |  |
| 32 | Public link | Get public link of a folder | Opened in browser | P t11 m11|  |