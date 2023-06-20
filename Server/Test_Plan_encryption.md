# Encryption Test Plan

Template: https://github.com/owncloud/QA/blob/master/Server/Test_Plan_encryption.md

TODO: qualify test items from https://github.com/owncloud/enterprise/issues/4933#issuecomment-1005287788 to become regression test items here.

## Setup
<details><summary>Setup details (click to view)</summary>

* Cloned from 135.181.147.142 (Erwin's HSM setup)
* `env OC10_DNSNAME=oc1070-enc-hsm-DATE ./make_oc10_apps.sh encryption hsmdaemon-0.0.8.zip`
* `env OC10_DNSNAME=oc1070-enc150-hsm-DATE ./make_oc10_apps.sh encryption=1.5.0 hsmdaemon-0.0.8.zip`

</details>
  
## Testing functionality

The toplevel checkmark indictes the test was performed.
The indented checkmarks indicate the results were as expected.

* [ ] Enable the app
   * [ ] No problems found
* [ ] Disable and enable the app using CLI
   * [ ] No problems found
* [ ] Master Key Encryption
   occ encryption:enable
   occ encryption:select-encryption-type masterkey --yes 
   * [ ] Uploaded files via client are stored encrypted. (Inspect with xxd)
   * [ ] Uploaded files via desktop are stored encrypted.
   * [ ] Files saved via TextEditor or Colabora are stored encrypted.
   * [ ] Files on external SFTP, WND storage are stored encrypted.
      * [ ] Test_Plan_Files_external_CLI.md:Change Mount option for an SFTP mount
         * [ ] option disable encryption is there.
         * [ ] disable, and inspect files with xxd.
   * [ ] files added to the storge + occ file:scan are *not* encrypted.
   * [ ] move file from main storage to unencrypted external storage. The file gets decrypted on disk.
   * [ ] move file from unencrypted external storage to main storage. The file gets encrypted on disk.
   * [ ] enable encryption on the external storage + occ file:scan
      * [ ] Existing files remain unencrypted
      * [ ] New files are encrypted 
   * [ ] move file one encrypted external storage to another encrypted external storage. The file gets encrypted on disk.
----
* [ ] Receiving fedrated share folder from an unencrypted server.
   * [ ] Test_Plan_External.md:The admin adds an external site with different type of encryption from the external site settings page
      * [ ] The external site icon must be visible in the apps menu
   * [ ] Test_Plan_External.md:The admin adds an external site with different type of encryption and clicks the icon on the apps menu
      * [ ] The external site page should not be visible in the webUI
   * [ ] Files added locally to the received folder are *not* encrypted.
   * [ ] Files added locally can be read by the remote server.
* [ ] Sending fedrated share folder to an unencrypted server.
   * [ ] Files added locally to the folder are encrypted.
   * [ ] Files can be cleanly read by feaderated servers.
* [ ] Test_Plan_Federated_Sharing.md:share a file (server A), in (server B) using different oC versions both servers with encryption
   * [ ] shared file can be seen from server B
* [ ] Test_Plan_Federated_Sharing.md:share a file with link (server A), add link to your owncloud (server B) using different O.C versions both servers with encryption
   * [ ] shared file can be seen from server B
* [ ] Public link to folder with file drop
   * [ ] files dropped into the folder are encrypted.
* [ ] Public link to folder with file drop in unencrypted SFTP drive
   * [ ] files dropped into the folder are *not* encrypted.
----
* [ ] Test_Plan_Files_Transfer_Ownership.md:**files:transfer-ownership with encryption enabled**
   * [ ] Test_Plan_Files_Transfer_Ownership.md:Transfer from user1 to user2, both users are in group "group1". Non-decrypted encrypted files
   * [ ] The files/folders are transferred to user2 and they do not appear for user1 any longer
   * [ ] Confirm user2 can read.
----
* [ ] update migration from previous core release
   * [ ] Test_Plan_Updater.md:* Create a file, encrypt the server and create another file after the encryption.
   * [ ] latest app on previous core can encrypt files, unencrypted files remain unencrypted.
   * [ ] update to latest oc10 succeeds. unencrypted files remain unencrypted.
   * [ ] decrypt works, encrypt of new files works.
* [ ] update migration from previous app release to current release
   * [ ] previous app release on current core can encrypt files
   * [ ] update to latest app succeeds.
   * [ ] decrypt works, encrypt of new files works.
---
 * [ ] hsmdaemon + softHSM
   * [ ] Check Generated Keys (https://doc.owncloud.com/server/admin_manual/configuration/server/security/hsmdaemon/#initialize-and-check-generated-keys)
   * [ ] encrypt and decrypt with a generated key 
   * [ ] hsmdaemon diagnostics 
      * [ ] No errors during setup.
      * [ ] hsmdaemon logs to /var/www.hsm.log
      * [ ] no hsm-related errors in syslog `journalctl -a | grep hsmdaemon`
      * [ ] file upload: hsm debug log has `"Requested","url":"/decrypt/..."`, `Decrypting`, `Decrypt`, `module":"/usr/.../libsofthsm2.so`, `"slotID":757826573`, `"found object","id":"\u0013\ufffd?...`, `Decrypted`
   * [ ] binary encryption works with hsm. `xxd /var/www/owncloud/data/admin/files/Photos/Portugal.jpg | less`
   * [ ] `occ encryption:decrypt-all` works
   * [ ] encrypted and unencrypted external storages work.

