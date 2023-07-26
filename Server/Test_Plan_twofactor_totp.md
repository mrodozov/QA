## Setup
```
./make_oc10_apps.sh twofactor_totp

# as ldap_user use alliah_abernathy in compose-playground/examples/hetzner-deploy/make_openidconnect_test.sh
```

## Twofactor TOTP Test Plan

* References: [Template](https://github.com/owncloud/QA/edit/master/Server/Test_Plan_twofactor_totp.md)

Run the tests below with freeotp and/or google authenticator. Optionally also some tests with another otp app.

| Test Case                                | Expected Result                          | Result         | Related Comment |
| ---------------------------------------- | ---------------------------------------- | -------------- | --------------- |
| Enable the app.                          | No problems found.                       | 🚧  |                 |
| Using a non admin user user1, enable totp in the personal settings, security.<br />Having the app freeotp (android or ios) scan the QR code provided and set it up.<br />Login using user1, get a new code in the freeotp app. Introduce it in the login view. Login. | User1 is asked the code during login and login succeeds.        | 🚧            |                 |
| Using a non admin user user1, enable totp in the personal settings.<br />Having the app freeotp (android or ios) scan the QR code provided - enter a random verification code | code is not verified |  🚧            |                 |
| Using a non admin user user1, enable totp in the personal settings.<br />Having the app freeotp (android or ios) scan the QR code provided and set it up.<br />Login using user1, get a new code in the freeotp app. Introduce it in the login view. Login. Logout. Login again using same code | User1 cannot login without a new code        | 🚧             |                |
| Using users user1 & user2, enable totp and set it up in the personal settings.<br />Login using user1, get a new code in the freeotp app for user2. Introduce it in the login view. Login. | user1 cannot login      | 🚧            |                 |
| Using users user1, enable totp and set it up in the personal settings.<br />Login using user1, totp.<br />Disable TOTP in the personal settings of user1. Login again | user1 can login without TOTP token      | 🚧            |                 |
| Using users user1, enable totp and set it up in the personal settings.<br />Login using user1, totp.<br />Disable TOTP in the personal settings of user1<br/> Enable it again, set it up scanning the new QR code. | new verification code is accepted      | 🚧            |                 |
| Using users user1, enable totp and set it up in the personal settings.<br />Login using user1, totp.<br />Disable TOTP in the personal settings of user1<br/> Enable it again, do **not** scan the new QR code but use a current code from the first setup to verify | code is not accepted      | 🚧            |                 |
| Using a non admin user user1, enable totp in the personal settings.<br />Having the app freeotp (android or ios) scan the QR code provided and set it up.<br />Try to login with user1 using his password. When the totp input appears introduce random numbers, emojis, negative numbers and empty string. | User1 cannot login in any of this situations. | 🚧              |                 |
| Using a LDAP user ldap_user, enable totp in the personal settings.<br />Having the app freeotp (android or ios) scan the QR code provided and set it up.<br />Login using ldap_user, get a new code in the freeotp app. Introduce it in the login view. Login. | User_ldap can login without problems.    | 🚧              |                 |
| Using a non admin user user1, enable totp in the personal settings.<br />Having the app **google authenticator** (android or ios) scan the QR code provided and set it up.<br />Login using user1, get a new code in the **google authenticator** app. Introduce it in the login view. Login. | User1 can login without problems.        | 🚧             |                 |
| Using a non admin user user1, enable totp in the personal settings.<br />Having the app **google authenticator** (android or ios) set up the account in the app using the **TOTP secret key**.<br />Login using user1, get a new code in the **google authenticator** app. Introduce it in the login view. Login. | User1 can login without problems.        | 🚧             |                 |
| **CLI**                             |                                          |                |                 |
| Test 1/2 Having a user 'user1' with a working enabled two factor authentication, use the CLI command to disable it twofactorauth:disable                           |   'user1' now can login without using 2FA                                       |  🚧               |                 |
| Test 2/2 Use the CLI command twofactorauth:enable to enable again 2FA for 'user1'   |   'user1' has to use 2FA mandatory to login                                       |  🚧               |                 |
| **Browsers**                             |                                          |                |                 |
| Check the login process is possible using chrome |                                          | 🚧             |                 |
| Check the login process is possible using firefox |                                          | 🚧              |                 |
| Check the login process is possible using edge |                                          | 🚧             |            |
| Check the login process is possible using internet explorer 11 |                                          | 🚧             | <br />          |
| Check the login process is possible using safari |                                          | 🚧             |                 |


Since 0.8.0 and core 10.13.0
* [ ] Admin enforces 2FA in the Settings -> Security -> somewhere????
   - [ ] user with already configured 2FA can still log in, using his connected authenticator
   - [ ] user with not yet configured 2FA is presented a QR code and can do the configuration before login.
     
