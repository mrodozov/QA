### Biometrical authentication button

#### PRs: https://github.com/owncloud/ios-app/pull/1098

Device/s: iPhoneXR v15.3, iPadAir2 v14.3 <br>
Server: 10.9.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------: | 
|**Enable passcode**||||||
| Enable Passcode 4 digit | Enable passcode with 4 digits | No biometrical authentication button | P m15 t14 | 
| Enable Passcode 6 digit | Enable passcode with 6 digits | No biometrical authentication button | P m15 t14 |  | 
|**Disable passcode**||||||
| Disable Passcode | Disable passcode | No biometrical authentication button | P m15 t14 | 
|**Unlocking app**||||||
| Passcode 4 digit + Biometrical| 1. Enable 4 digit passcode and biometrical<br>2. Reopen the app | Keyboard shows biometrical button | P m15 t14 | FIXED: Face ID not working | 
| Passcode 6 digit + Biometrical| 1. Enable 6 digit passcode and biometrical<br>2. Reopen the app | Keyboard shows biometrical button | P m15 t14 | FIXED: Face ID not working | 
| Passcode 4 digit without Biometrical| 1. Enable 4 digit passcode and disable biometrical<br>2. Reopen the app | Keyboard does not show biometrical button | P m15 t14 |  | 
| Passcode 6 digit without Biometrical| 1. Enable 6 digit passcode and disable biometrical<br>2. Reopen the app | Keyboard does not show biometrical button | P m15 t14 |  |
|**Unlocking Files app**||||||
| Passcode 4 digit + Biometrical| 1. Enable 4 digit passcode and biometrical<br>2. Open oC account in Files app | Keyboard shows biometrical button | P m15 t14 | FIXED: `Enter code` dismiss oC dialog | 
| Passcode 6 digit + Biometrical| 1. Enable 6 digit passcode and biometrical<br>2. Open oC account in Files app | Keyboard shows biometrical button | P m15 t14 | FIXED: `Enter code` dismiss oC dialog  | 
| Passcode 4 digit without Biometrical| 1. Enable 4 digit passcode and disable biometrical<br>2. Open oC account in Files app| Keyboard does not show biometrical button |P m15 t14 |  |  | 
| Passcode 6 digit without Biometrical| 1. Enable 6 digit passcode and disable biometrical<br>2. Open oC account in Files app | Keyboard does not show biometrical button | P m15 t14 |  |
|**Biometrical not available**||||||
| App | 1. Enable 4 digit passcode<br>2. Reopen the app | Keyboard does not show biometrical button | P m15 | Tested with emulator | 
| Files App | 1. Enable 4 digit passcode<br>2. Reopen the app | Keyboard does not show biometrical button | P m15 | Tested with emulator | 
|**Update**||||||