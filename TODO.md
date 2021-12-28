
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
7. integrate a `Retry` button and function into AhMyth's APK Builder 
interface, that when clicked, initates the rebuilding and signing of 
the decompiled original APK that failed to build previously but with 
the exception of using the added argument for apktool `--use-aapt` or 
`--use-aapt2`.

- THIS IS HALF DONE! the rebuild function just needs to be 
integrated.
#
8. Create a copy of the original AhMyth 
AndroidManifest.xml and rename it to "AndroidManifest.xml.ahmyth" 
and store it in a read-only directory called "Vault",
then integrate a copy function to replace the AndroidManifest.xml
after being edited with custom permissions, with the backup copy 
stored in the "Vault" Directory, instead of replacing it
with `wget`

- This is done! It just needs to be updated to work with the
Constants.js file
#
9. Finish the Ransomware Builder and construct 
a new Ransomware APK of our own that somewhat 
matches the color of the AhMyth interface, 
WITHOUT any ransom wallet addresses
# 
10. Stabilise Launcher Activity binding method (Half done)

- Update function to find the correct Smali file for
the main Launchable Activity, currently AhMyth now 
binds with APK's that it couldn't bind with before, 
however some of these APK's don't work at all after
the backdoor process is complete, so I will need to look
into why this is happening.
#
11. explore other, more discrete options for the 
URL payload masker.
#
12. Integrate telephone call recording for 
Victims Lab Audio Recording option with seperate 
button for recording calls, or create a separate
tab for call recording
#
13. Figure out how to allow Client APK access to 
`storage/emulated`
#
14. Integrate upload and execute capabilities 
for the File Manager option in the Victims Lab.
#
15. Build a No-GUI/Terminal version of AhMyth
for better understanding of errors with Decompiling,
Binding, Building & Signing, my gut tells me this has 
got a lot to do with Apktool.
#
16. Integrate the function to Log apktool.jar and sign.jar 
errors to a text file for the GUI version of AhMyth.
