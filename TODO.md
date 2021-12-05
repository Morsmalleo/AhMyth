
1. Integrate Live Camera Preview for the Camera option in the Victims Lab, controlled by the  *CameraManager*  file
     
*CameraManager*  file is located @ `~/AhMyth/AhMyth-Client/app/src/main/java/ahmyth/mine/king/ahmyth/CameraManager.java`
#
2. Integrate Video Recording for the camera option in the Victims Lab
#
3. Integrate Call Notifications for Incoming and Outgoing Calls from and to the Victim
#
4. Re-write AhMyth payload APK.
#
5. Find a way to stop the flickering Victim's Connections with `socket.io-client v2.0.1`, currently needs to maintain `socket.io-client v0.8.3` to hold a connection without flickering back and forth with Connecting and Disconnecting with Victims
#
6. Find a way to upgrade `semantic-ui` or find an alternative, as it's causing blocks in upgrading most of AhMyth's `node_modules` which is likely the reason the AhMyth interface breaks with the default electron version provided by *npm*

Warnings + errors when running `npm install semantic-ui@latest` stopping semantic-ui from upgrading
#
7. Find out a way to have the `AppCtrl.js` file detect `RANGE ERRORS` with apktool, then create a new `smali_classes` folder inside a decompiled original APK for the storing of AhMyth files when a `RANGE ERROR` is detected. 
   
   If this does not work then find a way to integrate a `Rebuild` button and function into AhMyth's APK Builder interface, that when clicked, initates the rebuilding and signing of the decompiled original APK that failed to build previously.
   (This is a known workaround with apktool)
#
8. Find a way to add `RES_TYPE_STYLES2` plus other `RES_TYPE_STYLES` to Apktool via tweaking the settings of Apktool and building via `gradlew build shadowJar` as 
these style's are used by most APK files today, namely by `Facebook`
#
9. Find a way to successfully integrate Steghide into AhMyth for steganography builder. (THIS IS STILL HAPPENING)
#
10. Finish the Ransomware Builder and construct a new Ransomware APK of our own that somewhat matches the color of the AhMyth interface, WITHOUT any ransom wallet addresses
# 
11. Stabilise Binding option by switching out `fs.readfile` with something more efficient for reading larger files.
#
12. explore other, more discrete options for the URL payload masker.

    (THIS INTEGRATION IS STAYING REGARDLESS IF THE COMMUNITY LIKES IT OR NOT)
