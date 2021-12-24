
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
of using the added argument for apktool `--use-aapt` or `--use-aapt2`.
#
8. Find a way to add `RES_TYPE_STYLES2` plus 
other `RES_TYPE_STYLES` to Apktool via the tweaking 
of Apktool's source code from [iBotPeaches/Apktool](https://GitHub.com/iBotPeaches/Apktool) 
and building via `gradlew build shadowJar` as 
these style's are used by most APK files today, 
namely by `Facebook`.
#
9. Create a copy of the original AhMyth 
AndroidManifest.xml and rename it to "AndroidManifest.xml.ahmyth" 
and store it in a read-only directory called "Vault",
then integrate a copy function to replace the AndroidManifest.xml
after being edited with custom permissions, with the backup copy 
stored in the "Vault" Directory, instead of replacing it
with `wget`
#
10. Finish the Ransomware Builder and construct 
a new Ransomware APK of our own that somewhat 
matches the color of the AhMyth interface, 
WITHOUT any ransom wallet addresses
# 
11. Stabilise Binding option

- This is now half done, I have fixed the function
to find the main Launchable Activity in an original 
APK's AndroidManifest.xml file, as this was the reason the 
GUI error,

`Cannot find Launchable Activity , please try the other binding method`

error was arising.

- The problem now is just function to find and read
the main launchable activity Smali file from an original
APK's smaliPath as the code is very old and needs some
tweaking and updating.

- Take note that not all APK's contain a Launchable 
Activity Smali file! for example Facebook-Lite doesn't
have a MainActivity.smali file even know it's declared
in its Manifest, this is most likely because it's split
into seperate apk files, or because of proguard Protection.

- I plan on building a Terminal based version of AhMyth
so I can easily determine why further problems with
Decompiling, Binding, Building & Signing are happening.
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
16. Build a No-GUI/Terminal version of AhMyth
for better understanding of errors with Decompiling,
Binding, Building & Signing, my gut tells me this has 
got a lot to do with Apktool.
