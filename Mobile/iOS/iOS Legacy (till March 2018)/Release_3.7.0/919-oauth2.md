###  OAuth2 

#### Pr: https://github.com/owncloud/ios/pull/919 

Devices: iPhone 6 v9.2, iPhone6 Plus v10.0.1, iPad v10.1

Server: 10.0.3 (with LDAP users)


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Login View**|||||||
| 1 | Initial look | Open the app. Check both orientations | Correct view. Only URL and connect button are shown  | P m9 t10|  |
| 2 | OAuth2 URL http | 1. Set an URL of a http server with OAuth2<br>2. Tap on connect.<br> Check both orientations | Redirected to webview. No more options shown | P m9 t10 | |
| 3 | OAuth2 URL https trusted | 1. Set an URL of a https trusted server with OAuth2<br>2. Tap on connect.<br> Check both orientations | Redirected to webview. No more options shown | P m9 t10 |  |
| 4 | OAuth2 URL https non-trusted | 1. Set an URL of a https non-trusted server with OAuth2<br>2. Tap on connect.<br> Check both orientations | Redirected to webview. No more options shown | P m9 t10 | FIXED: webview not raised |
| 5 | Basic Auth http URL | 1. Set an URL of a http server without OAuth2<br>2. Tap on connect.<br>Check both orientations | Fields username and password are shown | P m9 t10 |  |
| 6 | Basic Auth https trusted URL | 1. Set an URL of a https trusted server without OAuth2<br>2. Tap on connect.<br>Check both orientations | Fields username and password are shown | P m9 t10 |  |
| 7 | Basic Auth https non-trusted URL | 1. Set an URL of a https non-trusted server without OAuth2<br>2. Tap on connect.<br>Check both orientations | Fields username and password are shown | P m9 t10 |  |
| 8 | Redirected URL | 1. Set a redirection URL <br>2. Tap on connect. <br>Check both orientations | Fields username and password are shown  | P m9 t10 |
| 9 | SAML URL | Set an SAML URL (not supported by the app)<br>Check both orientations | Correct error messaege | P m9 t10 |  |
| 10 | Wrong URL | Set an incorrect URL. <br>Check both orientations | Correct error message | P m9 t10 |  |
| 11 | Wrong Authorizathion endpoint | 1. In customization file, change auth endpoint for a incorrect one<br>2. Enter OAuth2 URL and connect. <br>Check both orientations | Correct error handling | P m9 t10 | Message improvable|
|**Branding**|||||||
| 12 | OAuth2 URL hardcoded | Open the app.<br>Check both orientations | Correct view | P m9 t10|  |
| 13 | OAuth2 URL hardcoded and hidden | Open the app.<br> Check both orientations | Correct view | P m9 t10 | FIXED: No way to reload webview |
| 14 | Help link hidden | Open the app.<br>Check both orientations | Correct view | P m9 t10 |
|**OAuth2 UI flow**|||||||
| 15 | Webview | Enter OAuth2 URL and connect.<br> Check both orientations | Correct webview  | P m9 t10|  |
| 16 | Correct credentials | 1. Enter OAuth2 URL and connect.<br>2. Enter correct credentials. <br>Check both orientations | 1. Webview is opened<br> 2. Credentials are checked and webview is closed  | P m9 t10 |  |
| 17 | Wrong credentials | 1. Enter OAuth2 URL and connect.<br>2. Enter wrong credentials. <br>Check both orientations | 1. Webview is opened<br> 2. Webview can be closed  | P m9 t10|  |
| 18 | Wrong client id | 1. In customization file, change client id for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>Check both orientations | Correct error handling  | P m9 t10 | FIXED: file list in web view |
| 19 | Wrong secret id | 1. In customization file, change secret id for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>Check both orientations | Correct error handling  | P m9 t10 |  |
| 20 | Wrong redirection url | 1. In customization file, change redirection url for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>3. Input correct credentials<br>Check both orientations | Correct error handling  | P m9 t10 | FIXED: file list in web view |
| 21 | Wrong token endpoint | 1. In customization file, change token endpoint for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>3. Input correct credentials<br>Check both orientations | Correct error handling  | P m9 t10 | FIXED: Best error message? |
|**OAuth2 internal flow**|||||||
| 22 | Auth request | With mitmproxy, check the OAuth2 GET authorization code request | The URL contains the parameters: response_type=code, redirect_uri=\<customized\>, client_id=\<customized\> | P m9 t10 |  |
| 23 | Token request | With mitmproxy, check the OAuth2 POST token request | The POST request contains in the body the parameters: grant_type=authorization_code, code=\<code from prev test\>,  redirect_uri=\<customized\>, client_id=\<customized\>.<br> Header Content Type = application/x-www-form-urlencoded.<br> Header www-authorization = Basic + client id + : + secretid | P m9 t10 | URL encoding? |
| 24 | Token refresh | With mitmproxy, check the OAuth2 POST token request | The POST request contains in the body the parameters: grant_type=authorization_code, code=\<code from prev test\>,  redirect_uri=\<customized\>, client_id=\<customized\>.<br> Header Content Type = application/x-www-form-urlencoded.<br> Header www-authorization = Basic | P t10 |  |
|**OAuth2 session**|||||||
| 25 | Create folder | With OAuth2 session active, create folder | Success | P m9 t10|  |
| 26 | Upload files | With OAuth2 session active, upload files | Success | P m9 t10 |  |
| 27 | Download files | With OAuth2 session active, upload files | Success | P m9 t10 |  |
| 28 | Remove files | With OAuth2 session active, remove files | Success | P m9 t10 |  |
| 29 | Rename files | With OAuth2 session active, rename files | Success | P m9 t10 |  |
| 30 | Av. offline files | With OAuth2 session active,set files as av.offline | Success | P m9 t10|  |
| 31 | Instant uploads | With OAuth2 session active, upload files | Success | P m9 t10|  |
| 32 | Share with users | With OAuth2 session active, share with users | Success | P m9 t10|  |
| 33 | Share public| With OAuth2 session active, share public | Success | P m9 t10|  |
| 34 | Open from | With OAuth2 session active, open from an external app | Success | NA |  |
| 35 | Share with oC | With OAuth2 session active, share content from an external app | Success | P m9 t10 |  |
|**Session ends/refresh**||||||
| 36 | Session Expired | 1. Wait until token is refreshed<br> 2. Perform actions (download, upload, delete, move, remove) | New token is used in the requests and the action is performed | F t10 | Uploads file if triggered before expiration |
| 37 | Session Expired - external | 1. Wait until token is refreshed out of the app<br> 2. From an external app, send content once the token is expired | New token is used in the requests and the action is performed| delayed | Pending server issue |
|**Multiaccount**|||||||
| 38 | Several OAuth2 same server | Attach several OAuth2 accounts of the same server on the same device. Check correct expirations. | All correct | P m9 t10 | FIXED: Shown files view. Instant uploads. |
| 39 | Several OAuth2 different server | Attach several OAuth2 accounts of different servers on the same device | All correct | P m9 t10 | FIXED: Shown files view. Instant uploads. |
| 40 | Several OAuth2 expiration | 1. Attach several OAuth2 accounts of different servers on the same device<br>2. Wait until one session expires. | Expired session is refresed. The other sessions keep alive | P t10 |  |
| 41 | OAuth2 + basic | Attach an OAuth2 and a basic auth accounts to the same device | All correct |  P m9 t10 |  | 
| 42 | OAuth2 + SAML | Attach an OAuth2 and a SAML auth accounts to the same device | Not posible | P m9 t10 |  |
|**External actions**|||||||
| 43 | Refresh Token revoked | 1. After login, remove refresh token in DB<br> 2. Wait until session expires| Session is not refreshed. User redirected to login view | P t10 | FIXED: Not redirected to login |
| 44 | Token revoked | After login, remove token (and refresh) | Session ends. User redirected to login view | P m9 t10 | Not redirected to login  |
| 45 | Change credentials | 1. In webUI, change password<br> 2. In app, after login, in settings view, go to edit credentials and enter new credentials | New token is received | P m9 t10 | FIXED: Crash after editing |
| 46 | Edit credentials with other account | In app, after login, in settings view, go to edit credentials and enter other user credentials | Account updated / Error shown | P m9 t10 |  |
| 47 | User deleted | 1. In webUI, remove user | Session ends. User redirected to login view and can not login anymore | P m9 t10| FIXED: Check again after fix in 43. and 44. |
| 48 | Remove client | In webUI, remove client | Not posible to authenticate anymore | P m9 | FIXED: files view opened in web view |
| 49 | Remove OAuth2 app | In webUI, disable app | basic auth | P m9 t10 | FIXED: Crash |
|**Errors**|||||||
| 50 | No internet connection | 1. Disable internet connection in device<br>2. Try to login in OAuth2 | Correct error | P m9 t10 | FIXED: Message improvable |
| 51 | No server connection | 1. Switch server off in device<br>2. Try to login in OAuth2 | Correct error | P m9 t10 | FIXED: Message improvable |
| 52 | Maintenance mode login | 1. Enable maintenance mode<br>2. Try to login in OAuth2 | Correct error | P m9 t10 | FIXED: Less info than before |
| 53 | Firewall mode login | Enable a firewall rule to ban the login<br>2. Try to login in OAuth2 | Correct error | NA | Server allows login. Not allows other operations |
|**Regression**|||||||
| 54 | Basic Auth server | Open a session in a basic auth server and perform some actions (create folder, update, download, share...) | Success | P m9 t10 |  |
| 55 | SAML server | Open a session in a SAML server and perform some actions (create folder, update, download, share...) | Success | P m10 t10 | Checked also with SSO |
| 56 | SAML expiration | Open a session in a SAML server and wait until it expires | Redirected to iDP credentials view | P m10 t10 |  |
| 57 | Redirected | Open a session in a redirected server and perform some actions (create folder, update, download, share...) | Success | P m10 t10 | Checked with 301 and 302 |
| 58 | Redirected with subfolder| Open a session in a redirected server with subfolder and perform some actions (create folder, update, download, share...) | Success | P m9 |  |
| 59 | VideoStreaming | Stream a video in a OAuth2 server | Video is streamed | P m9 t10 |  |
|**Upgrade & Migration**|||||||
| 60 | Upgrade app from older version with basic | 1. Install an older version (basic auth)<br>2. Upgrade to this one without changes in server| Correct upgrade | P m10 t10 |  |
| 61 | Upgrade auth method server (to OAuth2)| 1. Login in a server without OAuth2<br>2. Enable OAuth2 in server<br>3. Login again with OAuth2 | 1. Correct login and account works<br>2. Correct login and account works | P m10 t10 | New ones are OAuth2. Older need a edit credentials to become OAuth2 |
| 62 | Upgrade auth method server (to basic)| 1. Login in a server with OAuth2<br>2. Disable OAuth2 in server<br>3. Login again with basic | 1. Correct login<br>2. Correct login | P m10 t10| FIXED: Crash when OAuth2 is disabled. |
| 63 | Migrate SAML to OAuth2| 1. Login in a older SAML server<br>2. Upgrade by migrating to a OAuth2 server | Migration OK. Users access to the account without re-login | P m10 t10 | FIXED: Error after migrating |
| 64 | Migrate OAuth2 to OAuth2| 1. Login in a OAuth2 server<br>2. Upgrade by migrating to a different OAuth2 server | Migration OK. | P m10 t10 | FIXED: Credentials required twice |
| 65 | Migrate OAuth2 to SAML| 1. Login in a OAuth2 server<br>2. Upgrade by migrating to a SAML server | Migration OK. | P m10 t10 | FIXED Credentials required twice |
| 66 | Migrate OAuth2 to basic| 1. Login in a OAuth2 server<br>2. Upgrade by migrating to a basic server | Migration OK. | P m10 t10|  |
| 67 | Migrate with passcode enforced | 1. Login in a older basic server<br>2. Upgrade by migrating to a OAuth2 server and enforcing passcode in the app.<br>3. Miimize the app in the middle of the auth process | Migration OK and passcode asked and stored| P m10 t10 | FIXED: Credentials required twice |
