### iPad Pro support

#### Pr: https://github.com/owncloud/ios/pull/582

Devices: iPad pro v9
         iPhone6 v8
         iPad mini
         iPhone6 v9.2

Server version: 8.2.2

<br>
 
Test Case ID | Test case     | Steps   | Expected behavior | Result | Related Comments
|:----:|:------------- |:-------------------|:-------------|:-------------:|:----------
**Help guide**|
1|Help guide| Open the app for the first time | Help guide is shown and the images are shown properly not pixeled| p t9 tmini9 m9
**SplashScreen**|
2|Portrait| Check that Splash screen are shown and images are not pixeled|  | p t9 tmini9 m9
3|Landscape|  Check that Splash screen are shown and images are not pixeled|  | p t9 tmini9
**mType images**|
4|Files view| Check that mtypes are shown and images are not pixeled (text, doc, image, pdf, sound..|  |p t9 tmini9 m9
5|Details view| Check that mtypes are shown and images are not pixeled (text, doc, image, pdf, sound..|  |p t9 tmini9 m9
**Tab bar**|
6|Tab bar| Check that tab bar images are shown and images are not pixeled |  |  p t9 tmini9 m9
**Branding**|
7|Branding| Check a branding client |  |  p t9 tmini9 m9 | Branded splash image is shown after restarting the device.
**App Icon**|
8|App Icon| Check the App icon |  |  p t9 tmini9 m9

NOTE:
- A bug has been found: a grey row is added on the uploads view