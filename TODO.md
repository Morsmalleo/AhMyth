
1. Integrate Live Camera Preview for the Camera option in the Victims Lab, controlled by the  *CameraManager*  file
     
*CameraManager*  file is located @ `~/AhMyth/AhMyth-Client/app/src/main/java/ahmyth/mine/king/ahmyth/CameraManager.java`
#
2. Integrate Video Recording for the camera option in the Victims Lab
#
3. Integrate Call Notifications for Incoming and Outgoing Calls from and to the Victim
#
4. Re-write AhMyth APK payload activity in order to switch out the Google Play Services look, for a more legitimate one
#
5. Find a way to stop the flickering Victim's Connections with `socket.io-client v2.0.1`, currently needs to maintain `socket.io-client v0.8.3` to hold a connection without flickering back and forth with Connecting and Disconnecting with Victims
#
6. Find a way to upgrade `semantic-ui` or find an alternative, as it's causing blocks in upgrading most of AhMyth's `node_modules` which is likely the reason the AhMyth interface breaks with the default electron version provided by *npm*

Warnings + errors when running `npm install semantic-ui@latest` stopping semantic-ui from upgrading
#
7. Find out a way to have AhMyth detect errors with apktool when `Building Failed/Signing Failed/Decompiling Failed` errors then output said errors to a log file.
   
   If this does not work then find a way to integrate a `Rebuild` button and function into AhMyth's APK Builder interface, that when clicked, initates the rebuilding and signing of the decompiled original APK that failed to build previously.
   (This is a known workaround with apktool)
#
8. Find a way to add `RES_TYPE_STYLES2` plus other `RES_TYPE_STYLES` to Apktool via tweaking the settings of Apktool and building via `gradlew build shadowJar` as 
these style's are used by most APK files today, namely by `Facebook`
#
9. Integrate a copy function into "AppCtrl.js" for the copyng of the original AhMyth AndroidManifest (before being edited with custom permissions) into a backup file called "AndroidManifest.xml.ahmyth" which will then be moved to a secure read-only Directory called `Vault` just outside the decopiled `Ahmyth` APK folder located inside the `Factory` folder, instead of replacing the AndroidManifest after it has been edited with the custom permission with `wget https://raw.githubusercontent.com/Morsmalleo/AhMyth/master/AhMyth-Server/app/app/Factory/Ahmyth/AndroidManifest.xml`
#
10. Finish the Ransomware Builder and construct a new Ransomware APK of our own that somewhat matches the color of the AhMyth interface, WITHOUT any ransom wallet addresses
# 
11. Stabilise Binding option by adding the different names of `LAUNCHER` activity for APK's as AhMyth will not bind with an APK whose launcher activity is not called `LAUNCHER`

An example on that would be like this;
- 1.apk - launcher activity = `android.intent.category.LAUNCHER` - AhMyth WILL bind with this apk
- 2.apk - launcher activity = `android.intent.category.INFO` - AhMyth WILL NOT bind with this apk

This is why different launcher activity names need to be added.
#
12. explore other, more discrete options for the URL payload masker.

    (THIS INTEGRATION IS STAYING REGARDLESS IF THE COMMUNITY LIKES IT OR NOT)
#
13. Integrate telephone call recording for Victims Lab Audio Recording option with seperate button for recording calls
#
14. Figure out how to allow Client APK access to `storage/emulated`
#
15. Integrate upload and execute capabilities for the File Manager option in the Victims Lab.
#
16. Integrate "Rebuild" button for failed APK Bindings 
