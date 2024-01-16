###  Bug: Tableviews behind navigation 

#### Pr: https://github.com/owncloud/ios/pull/XXX 


---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------ | :------------- | :------------- | :-------------- | :----- | :------
**Upper bar**|
| 1 | Files view in root  |  Log into a account with a high number of files in root folder |  List of files is listed below the upper bar   |
| 2 | Files view in not root  |  Log into a account with a high number of files in a folder which is not root |  List of files is listed below the upper bar   |
| 3 | Uploads view - current  |  Tap to upload a high number of files  |  During the upload, list of files is listed below the upper bar in uploads view   |
| 4 | Uploads view - uploaded  |   Tap to upload a high number of files (can be used the same as last test case) | The list of uploaded is listed below the upper bar in uploads view
| 5 | Shared links view |  Share a high number of files/folders by link | The list of shared links is listed below the upper bar in uploads view
| 6 | Settings view |  Tap on "Settings" | The settings is listed below the upper bar in settings view
**Footer**|
| 7 | Files view  |  Log into a account with a high number of files in a folder which is not root |  Footer is correct   |
| 8 | Uploads view |  Tap to upload a high number of files  |  Footer is correct   |
| 9 | Shared links view |  Share a high number of files/folders by link | Footer is correct
| 10 | Settings view |  Tap on "Settings" and add several accounts | Footer is correct
