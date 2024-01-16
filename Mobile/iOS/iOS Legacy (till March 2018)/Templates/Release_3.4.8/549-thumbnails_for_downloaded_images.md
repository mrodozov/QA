
###  Thumbnails for downloaded images 

#### Pr: https://github.com/owncloud/ios/pull/549

Devices:

Server version:

---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------ | :------------- | :------------- | :-------------- | :----- | :------
**Image Formats**|
1| JPG/JPEG| Download a JPG file | Thumbnail is shown|
2| PNG| Download a PNG file | Thumbnail is shown|
3| GIF| Download a GIF file | Thumbnail is shown|
4| TIFF| Download a TIFF file | Thumbnail is shown|
**Actions**|
5|Download file| 1. Upload an image file<br>2. Download the file (change orientation)|1. No Thumbnail<br>2. Thumbnail is visible
6|Download folder| 1. Upload an large amount of image files in a folder<br>2. Swipe to download the whole folder |All thumbnails are correcly shown
7|Move file| 1. Download an image<br>2. Move the file to another folder|1. Thumbnail is visible<br>2. Thumbnail is visible in the new location
8|Rename file| 1. Download an image<br>2. Rename the file using special characeters|1. Thumbnail is visible<br>2. Thumbnail is visible with the new name
9|Duplicated name| 1. Download an image<br>2. Rename another image with the same name in other folder and download it <br>|1. Thumbnail is visible<br>2. Both thumbnails are correct
10|Overwrite file in mobile device| 1. Download an image<br>2. In mobile, upload another image with the same name in the folder<br>3. Solve the conflict with "overwrite"|1. Thumbnail is visible<br>2. A conflict is detected<br>3. The thumbnail of the new image is visible
11|Overwrite file in server| 1. Download an image in mobile<br>2. In server, upload another image with the same name<br>3. Solve the conflict with "overwrite"|1. Thumbnail is visible<br>2. A conflict is detected<br>3. The thumbnail of the new image is visible|
12|Move and overwrite file| 1. Download an image<br>2. Upload another image with the same name in another folder and download it<br>3. Move one image to the folder in which is the another one<br>4. Solve the conflict with "overwrite"|2. Both thumbnails are visible<br>3. A conflict is detected<br>4. The thumbnail of the image is visible|
13|Overwrite from a external app| 1. Download an image<br>2. Upload another image from an external app with the same name<br>3. Solve the conflict with "overwrite"|1. Thumbnail is visible<br>2. A conflict is detected<br>3. The thumbnail of the new image is visible|
14|Rename file (conflict)| 1. Download an image<br>2. Upload another image with the same name in the folder<br>3. Solve the conflict with "rename" and download it|1. Thumbnail is visible<br>2. A conflict is detected<br>3. Both thumbnails are visible
15|Delete file locally| 1. Download an image<br>2. Delete the file from the device|1. Thumbnail is visible<br>2. Thumbnail is not visible
16|Share file|1. Download an image<br>2. Share the image to another user<br>3. Login with this user and download the image|1. Thumbnail is visible<br>3. Thumbnail is visible for the sharee
17|Favourite file|1. Set an image as favourite|Thumbnail is visible
18|Update favourite|1. Set an image as favourite<br>2. From the web, upload another one with the same name overwriting the first one|The thumbnail in device is updated
19|Favourite folder|1. Create a new folder and upload a large amount of images<br>2. Set the folder as favourite|All thumbnails are shown
20|Cancel Download|1. Create a new folder and upload a large amount of images<br>2. Swipe to download the folder<br>3. Cancel the downloading|Only the downloaded images show their thumbnail
21|Cancel Favourite|1. Create a new folder and upload a large amount of images<br>2. Swipe to set the folder as favourite<br>3. Cancel the favourite|Only the downloaded images show their thumbnail
**Multiaccount**|
22|Multiaccount| 1. Download some images in different accounts and change from one to another|Thumbnails are correctly shown in all accounts
23|Multiaccount| 1. Upload and download some image files in a folder call "folder1"<br>2. Change to account2<br> 3.Upload and download some image files in a folder call "folder1"  <br>4. Change the account to the first one|1. Thumbnails of account 1 are visible correctly<br>3. Thumbnails of account 2 are visible correctly<br>4. Thumbnails of account 1 keep on being correct
**Shibboleth**|
24|Shibb server|1. Login in a Shibboleth server<br>2. Download some images|The thumbnails are correctly shown

