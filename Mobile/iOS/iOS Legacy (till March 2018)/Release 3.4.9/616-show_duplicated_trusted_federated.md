###  Show duplicated users in trusted federated servers 

#### Pr: https://github.com/owncloud/ios/pull/616 

Devices: iPhone6S v9.2, iPadAir v8.4

Server: v9

Precondition: Set a server with federation app. Set a server as trusted to federated sharing.

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :-----: | :------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Users in other server (with autoc.)| 1. Set in a remote trusted server two users with the same displayname<br> 2. Share a file/folder with that users| The autocompletion shows both distinguishing them (user@server)| F m9 | In share view the users are not being distinguished |
|**Regression**||||||
| 2 | User in other server (with autoc.)|  1. Share a file/folder with a user of a trusted server typing only his name| The autocompletion shows the complete federated URL with format displayName (server)| P m9 t8||
| 3 | User in other server (without autoc.) |  1. Share a file/folder with a user of a non-trusted server typing only his name| When the @ is written is shown as username@ (remote)| P m9 t8||
| 4 | Two users with same name  (with autoc.) |  1. Share a file/folder with a user of a trusted server typing only his name. Another user with the same name exists in the current server| Both users are shown correctly, the remote including whole URL with format displayName (server)| P m9 t8||
| 5 | Two users with same name  (without autoc.) |  1. Share a file/folder with a user of a non-trusted server typing only his name. Another user with the same name exists in the current server| Both users are shown correctly, the remote one including notation "username@ (remote)"| P m9 t8||
| 6 | Three users with same name  (with autoc.) |  1. Share a file/folder with two users of different trusted servers typing only his name. Another user with the same name exists in the current server| Both users are shown correctly, including correct URLs with format displayName (server)| P m9 t8||
| 7 | Three users with same name  (without autoc.) |  1. Share a file/folder with two users of different servers (trusted/non-trusted) typing only his name. Another user with the same name exists in the current server| Both users are shown correctly, including correct URLs with format displayName (server) and the one in non-trusted as username@ (remote)| P m9 t8||
| 8 | Three users end with @ (without autoc.) |  1. Share a file/folder with two users of different servers (trusted/non-trusted) typing only his name that ends with @. Another user with the same name exists in the current server| Both users are shown correctly, including correct URLs  with format displayName (server) and the one in non-trusted as username@ (remote)| P m9 t8||

