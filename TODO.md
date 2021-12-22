
1. Integrate Live Camera Stream from Client to Server
in order to view a live camera preview for the Camera 
option in the Victims Lab, without showing the Victim 
a preview.
#
2. Integrate Video Recording for the camera 
option in the Server Victims Lab and the APK Client.
#
3. Integrate Call Notifications for Incoming and 
Outgoing Calls from and to the Victim.
#
4. Rewrite AhMyth payload using the original 
payload from `v1.0-beta.2` as the starting point.
#
5. Find a way to stop the flickering Victim's 
Connections with `socket.io-client v2.0.1`, c
urrently needs to maintain `socket.io-client v0.8.3` 
to hold a connection without flickering back and 
forth with Connecting and Disconnecting with 
Victims.
#
6. Find a way to upgrade `semantic-ui` or find an 
alternative, as it's causing blocks in upgrading 
most of AhMyth's `node_modules` which is likely 
the reason the AhMyth interface breaks with the 
default electron version provided by **npm**.
#
7. Find out a way to have AhMyth detect errors 
with apktool when `Decompiling Failed/Building Failed/Signing Failed` 
errors arise, then output said errors to a log file.
   
- If this does not work then integrate a `Rebuild` 
button and function into AhMyth's APK Builder 
interface, that when clicked, initates the rebuilding 
and signing of the decompiled original APK that 
failed to build previously but with the exception 
of using the the added argument `--use-aapt` or `--use-aapt2`.
#
8. Find a way to add `RES_TYPE_STYLES2` plus 
other `RES_TYPE_STYLES` to Apktool via the tweaking 
of Apktool's source code from [iBotPeaches/Apktool](https://GitHub.com/iBotPeaches/Apktool) 
and building via `gradlew build shadowJar` as 
these style's are used by most APK files today, 
namely by `Facebook`.
#
9. Integrate a copy function into "AppCtrl.js" 
for the copyng of the original AhMyth AndroidManifest 
(before being edited with custom permissions) 
into a backup file called "AndroidManifest.xml.ahmyth" 
which will then be moved to a secure read-only 
Directory called `Vault` just outside the 
decopiled `Ahmyth` APK folder located inside 
the `Factory` folder, instead of replacing the 
AndroidManifest after it has been edited with 
the custom permission with `wget https://raw.githubusercontent.com/Morsmalleo/AhMyth/master/AhMyth-Server/app/app/Factory/Ahmyth/AndroidManifest.xml`
#
10. Finish the Ransomware Builder and construct 
a new Ransomware APK of our own that somewhat 
matches the color of the AhMyth interface, 
WITHOUT any ransom wallet addresses
# 
11. Stabilise Binding option by figuring out why 
the hell it's so unstable and fix it!!

- The problem so far, is to do with the function 
to extract the launcher activity in the `AppCtrl.js` 
file.
#
12. explore other, more discrete options for the 
URL payload masker.
#
13. Integrate telephone call recording for 
Victims Lab Audio Recording option with seperate 
button for recording calls, or create a separate
tab for call recording
#
14. Figure out how to allow Client APK access to 
`storage/emulated`
#
15. Integrate upload and execute capabilities 
for the File Manager option in the Victims Lab.
#
