## Client Only TODO List:
- [ ] Integrate Live Camera Preview Stream for the Client. 
#
- [ ] Integrate Video Recording for the Client. 
#
- [ ] Rewrite AhMyth Client using the original 
payload from `v1.0-beta.2` as the starting point.
#
- [ ] Figure out a way to bypass play protect. 
#
- [ ] Create persistence for the AhMyth payload
#
#
## Server Only TODO List:

- [ ] Find a way to upgrade `semantic-ui` or find an 
alternative, as it's causing blocks in upgrading 
most of AhMyth's `node_modules` which is likely 
the reason the AhMyth interface breaks with the 
default electron version provided by **npm**.
#
- [ ] integrate a `Retry` button and function into AhMyth's APK Builder 
interface, that when clicked, initates the rebuilding and signing of 
the decompiled original APK that failed to build previously but with 
the exception of using the added argument for apktool `--use-aapt` or 
`--use-aapt2`.

- THIS IS HALF DONE! the rebuild function just needs to be 
integrated.
#
- [x] Create a copy of the original AhMyth 
AndroidManifest.xml and rename it to "AndroidManifest.xml.ahmyth" 
and store it in a read-only directory called "Vault",
then integrate a copy function to replace the AndroidManifest.xml
after being edited with custom permissions, with the backup copy 
stored in the "Vault" Directory, instead of replacing it
with `wget` 

- This is done! It just needs to be updated to work with the
Constants.js file
# 
- [ ] Stabilise Launcher Activity binding method

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
- [ ] explore other, more discrete options for the 
URL payload masker.
#
- [ ] Integrate the function to Log apktool.jar and sign.jar 
errors to a text file for the GUI version of AhMyth.
#
- [ ] Restyle the AhMyth Server using the following

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

- [ ] Find a way to stop the flickering Victim's 
Connections with `socket.io-client v2.0.1`,
currently needs to maintain `socket.io-client v0.8.3` 
to hold a connection without flickering back and 
forth between Connecting and Disconnecting with 
Victims.
#
- [ ] Figure out how to allow access to 
`storage/emulated` when using the File Manager
#
- [ ] Integrate telephone call recording for 
Victims Lab Audio Recording option with seperate 
button for recording calls, or create a separate
tab for call recording
#
- [ ] Integrate Call Notifications for Incoming and 
Outgoing Calls from and to the Victim.
