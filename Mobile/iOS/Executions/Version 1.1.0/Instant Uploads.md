###  Instant Uploads

#### Pr: https://github.com/owncloud/ios-app/pull/484

Devices: iPhone XS v12, iPadAir v12<br>
Server: 10.2.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**View**|||||
| Settings | Open Settings view | Instant upload options are there and correct in both orientations | P m12 t12 |  |  |
| Account | Open Settings view and account selection | List of accounts is there, only if at least one instant upload option is enabled | P m12 t12| FIXED: No way to go back |  |
| Path | Open Settings view and select an account | Correct picker | P m12 t12 |  |  |
|**One account - Images**|||||
| Root folder | Select the root folder<br>Take two pics | Both pics are uploaded to the root folder | P m12 t12 |  |  |
| Non-Root folder | Select a non-root folder<br>Take two pics | Both pics are uploaded to the folder | P m12 t12 |  |  |
| Switch to other | Select a new folder as before<br>Take two pics | Both pics are uploaded to the new target folder | P m12 t12 |  |  |
| Rename target folder | In the app, rename the target folder<br>Take two pics | Both pics are uploaded to the new named folder | P m12 t12| FIXED: Target folder not found, errors. In Settings, account disappears |  |
| Move target folder | In the app, move the target folder<br>Take two pics | Both pics are uploaded to the moved folder | P m12 t12 | FIXED: Target folder not found, errors. In Settings, account disappears |  |
| Remove target folder | In the app, remove the target folder<br>Take two pics | Both pics are not uploaded?  | P m12 t12 | FIXED: Target folder not found, errors. In Settings, account disappears |  |
| Select no account |Install the app from scratch and enable pics instant uploads<br> Take two pics | Should not be posible | NA | Not posible, forced to set an account  |  |
| Select no target folder |Install the app from scratch and enable pics instant uploads, selecting an account<br> Take two pics | No upload | NA | Not posible, forced to set a path |  |
| Disable | After enabling and taking some pics, disable the feature<br>Take some pics<br>Enable again the feature<br>Take more pics | Only the pictures that were taken with the feature enabled were uploaded, other ones were ignored | P m12 t12 |  |  |
|**One account - Videos**|||||
| Root folder | Select the root folder<br>Take two videos | Both videos are uploaded to the root folder | P m12 t12| FIXED: Videos not uploade |  |
| Non-Root folder | Select a non-root folder<br>Take two videos | Both videos are uploaded to the folder | P m12 t12|  |  |
| Switch to other | Select a new folder as before<br>Take two videos | Both videos are uploaded to the new target folder | P m12 t12 |  |  |
| Rename target folder | In the app, rename the target folder<br>Take two videos | Both videos are uploaded to the new named folder | P m12 t12| FIXED: Target not found |  |
| Move target folder | In the app, move the target folder<br>Take two videos | Both videos are uploaded to the moved folder | P m12 t12 | FIXED: Target not found |  |
| Remove target folder | In the app, remove the target folder<br>Take two videos | Both videos are not uploaded?  | P m12 t12 |FIXED: Target not found  |  |
| Select no account |Install the app from scratch and enable videos instant uploads<br> Take two videos | Should not be posible? | NA |  |  |
| Select no target folder |Install the app from scratch and enable videos instant uploads, selecting an account<br> Take two videos | They are uploaded anywhere? | NA |  |  |
| Disable | After enabling and taking some videos, disable the feature<br>Take some videos<br>Enable again the feature<br>Take more videos | Only the videos that were taken with the feature enabled were uploaded, other ones were ignored | P m12 t12 |  |  |
|**Pics & Videos**|||||
| Only pics | Enable instant upload for pics<br>Take some pics and videos<br>Enable the instant upload for videos | Only pics are uploaded | P m12 t12 | FIXED: Videos not uploaded |  |
| Only videos | Enable instant upload for videos<br>Take some pics and videos<br>Enable the instant upload for pics | Only videos are uploaded | P m12 t12 |  |  |
| Late enabling | Disable instant uploads for pics and videos<br>Take some pics and videos<br>Enable the instant upload for pics and videos | Nothing is uploaded | P m12 t12  |  |  |
|**Several accounts**|||||
| Upload to one | Select one of several accounts and an existing folder<br>Take two pics and two videos | Both items are uploaded to the correct folder | P m12 t12|  |  |
| Upload to two | Select one of several accounts and an existing folder<br>Take two pics and two videos<br>Select a different account and take more pics | Every item is uploaded to the correct account and target folder | P m12 t12|  |  |
| Account removed | Select one of several accounts and an existing folder<br>remove the account from the device and take some pics/videos | Feature disabled | P m12 t12| FIXED: Account locked |  |
|**Background tasks**|||||
| App closed | With instant uplaods enabled and app closed, take videos and pics | Detected when the app comes to foreground (check status tab) | P m12 | |  |
| Large video | With instant uplaods enabled, take a long video<br>Once it is detected, minimize the app | Video is uploaded in background | F m12 | Problems handled separately |  |
| Large video and many pics | With instant uplaods enabled, take a long video and then, many pictures<br>Once it is detected, minimize the app | Everything is uploaded in background | F m12 | Stucked after re-opening -> Problems handled separately |  |
|**Miscellaneous**|||||
| Convert to JPEG | Enable instant uplaods and convert to JPEG<br> take several pics | Uploaded in JPEG format | P m12 |  |  |
| Convert to MP4 | Enable instant uplaods and convert to MP4<br> take several videos | Uploaded in MP4 format | P m12 |  |  |