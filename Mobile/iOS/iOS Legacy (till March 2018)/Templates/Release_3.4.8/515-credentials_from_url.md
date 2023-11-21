###  Populate Server Credentials from URL

#### Pr: https://github.com/owncloud/ios/pull/515

Devices:

Server:

---


TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------: | :------------- | :------------- | :-------------- | :----- | :----------
| 1 | Server URL without username:password auth   |  1. Open app <br>2. Paste URL into Server URL field<br>3. Select Username field<br> |  Username and Password fields should remain blank and login button should be active     |
| 2 | Server URL with username:password auth   |  1. Open app <br>2. Paste URL with form `https://myuser:mypass@host.com` into Server URL field<br>3. Select Username field<br> |  Username field should be populated with `myuser`and Password field should be populated with `mypass`. Login button should be active  
| 3 | Server URL without prefix|1. Open app  <br>2. Paste URL with form `myuser:mypass@host.com` into Server URL field without [http://] or [https://]| Username and password are populated with `myuser` and `mypass`. Login button should be active
| 4 | Incorrect credentials |1. Open app  <br>2. Paste URL with form `http://myuser:mypass@host.com` into Server URL inputing a wrong password| Username and password are populated with `myuser` and `mypass` but can not enter due the incorrect pass
**Special servers**|
| 5 | Redirect servers |1. Open app  <br>2. Paste URL of a redirect server with form `http://myuser:mypass@host.com` | Username and password are populated with `myuser` and `mypass`. Login button should be active.
| 6 | No self signed |1. Open app  <br>2. Paste URL of a no self signed server with form `http://myuser:mypass@host.com` | Username and password are populated with `myuser` and `mypass`. Login button should be active.
| 7 | Shibboleth servers |1. Open app | Login button should be active. |
| 8 | Server with subpath  |  1. Open app <br>2. Paste URL Paste URL with form `https://host.com:port/subpath1/subpath2`<br>3. Select Username field<br> |  Username and Password fields should remain blank and login button should be active | |