## Client Only TODO List:
- [ ] 01: Integrate Live Camera Preview Stream for the Client. 
#
- [ ] 02: Integrate Video Recording for the Client. 
#
- [ ] 03: Rewrite AhMyth Client using the original 
payload from `v1.0-beta.2` as the starting point.
#
- [ ] 04: Figure out a way to bypass play protect. 
#
- [ ] 05: Create persistence for the AhMyth payload
#
- [ ] 06: Figure out how to give the client access to 
`storage/emulated` so we can access it when using the
FIle Manager in the AhMyth Server Victims Lab.
#
#
## Server Only TODO List:

- [ ] 01: Migrate AhMyth from `semantic-ui`, to `fomantic-ui`.
#
- [ ] 02: integrate a `Retry` button and function into AhMyth's APK Builder 
interface, that when clicked, initates the rebuilding and signing of 
the decompiled original APK that failed to build previously but with 
the exception of using the added argument for apktool `--use-aapt` or 
`--use-aapt2`.

- THIS IS HALF DONE! the rebuild function just needs to be 
integrated.
#
- [x] 03: Create a copy of the original AhMyth 
AndroidManifest.xml and rename it to "AndroidManifest.xml.ahmyth" 
and store it in a read-only directory called "Vault",
then integrate a copy function to replace the AndroidManifest.xml
after being edited with custom permissions, with the backup copy 
stored in the "Vault" Directory, instead of replacing it
with `wget` 

- This is done! It just needs to be updated to work with the
Constants.js file
# 
- [ ] 04: Stabilise Launcher Activity binding method

This is almost stable, there are currently two problems
that arise with some APKs that have been Bound using 
the `On Launch` method, they are as follows, please note 
that I will find a way to fix these problems.
    
     1. Application is stuck on a white/black screen
       After being opened on the victim device.
    
     2. Building fails because there is no launcher activity,
       most likely because the APK is setup to call the launcher activity
       from a server once the APK is installed, APKs such as Facebook 
       use this.
#
- [ ] 05: Explore other, more discrete options for the 
URL payload masker.
#
- [ ] 06: Integrate the function to Log apktool.jar and sign.jar 
errors to a text file for the GUI version of AhMyth.
#
- [ ] 07: Restyle the AhMyth Server using the following

      1. Glassmorphism 
      2. Side scrolling tabs instead of top scrolling tabs
      3. Icons to replace the Tab names
      4. Settings menu for UI style adjustments
      5. Dark theme
      6. AhMyth user account login - Default username will be `ahmyth` 
      and the default password will be `trojan`
#
#
## Client & Server TODO List (TODO's for both the Client & Server)

- [ ] 01: Update `socket.io-client 0.8.3` to 
`socket.io-client 2.0.1` for the AhMyth Client, 
in order for connections to work with `socket.io 4x`
#
- [ ] 02: Integrate telephone call recording for 
Victims Lab Audio Recording option with seperate 
button for recording calls, or create a separate
tab for call recording
#
- [ ] 03: Integrate Call Notifications for Incoming and 
Outgoing Calls from and to the Victim.
