## Client Upgrades:
- [ ] 01: Integrate Live Camera Preview Stream for the Client. 
#
- [ ] 02: Integrate a valid signing certificate to bypass Play Protect. 
#
- [ ] 03: Integrate persistence for the AhMyth payload.
#
- [ ] 04: Integrate real-time viewing of victim device screens.
#
- [ ] 05: Integrate screen recording for real time viewing of victim device screens.
#
- [ ] 06: Integrate USSD dialing and response view feature for the 
AhMyth client
#
- [ ] 07: Integrate screenshot for real time viewing of victim device screens.
#
- [ ] 08: Integrate proper storage access for the client.
#
- [ ] 09: Implement notification listening, a feature from L3MON.
#
## Server Upgrades:

- [ ] 01: Figure out a new hook method for the new Bind On Launch functions.
#
- [x] 02: Create a backup copy of AhMyth's `AndroidManifest.xml`
file, and store it in the newly created backup directory 
`Vault` in order to restore AhMyth's original manifest file back to 
it's original state after being edited with custom permissions.

- DONE!
#
- [ ] 03: Explore other, more discrete options for the 
URL payload masker.
#
- [x] 04: Integrate the function to Log apktool.jar and sign.jar 
errors to a text file for the GUI version of AhMyth.

- DONE!
#
- [ ] 05: Restyle the AhMyth Server using the following

      1. Glassmorphism 
      2. Icons next to Tab Names ✔️
      3. Dark Theme 
      4. Light Theme
      5. High Contrast Theme
      6. Settings Tab for UI Theme preferences
      7. Payload Options Tab for when other payload options have been built into AhMyth.

#
- [ ] 06: Integrate an EXE Builder for an AhMyth Windows client.
#
- [ ] 07: Explore the possibility of adding Browser Hook feature 
to control a range of devices by hooking their web browser - inspired by [beEF](https://GitHub.com/beefproject/beef)
#
- [ ] 08: Update *socket.io 2.4.2* to *socket.io 4.x* (after updating the client with *socket.io-client java 2.0.1*)
#
- [ ] 09: Hijack a legitimate APK and configure it to be built as a standalone
AhMyth payload.
#
- [ ] 10: Integrate APK obfuscation to avoid the payload being decompiled after deployment.
#
- [ ] 12: Add High contrast theme
#
- [ ] 13: Add Dark Theme
#
- [ ] 14: Add Settings Menu to switch between UI themes
#
## Stability Upgrades:

- [ ] 01: Figure out why AhMyth is so unstable on 
Windows machines!
# 
- [ ] 02: Stabilise `On Launch` binding method by effectively 
allowing AhMyth to search for the `->onCreate()V` method if the `->onCreate(Landroid/os/Bundle;)V` 
method is not found in the **Launcher Activity**.
#
- [x] 03: Figure out how to allow AhMyth to search `smali_classes` directories, if the launcher activity is not present anywhere in the `smali` directory

- Done For Windows, Linux & macOS FINALLY!!
- [ ] 04. Stabilise the SMS feature by adding the ability to view sent SMS's and possibly Conversation lists.
#
- [ ] 05: Update *socket.io-client java 0.8.3* to *socket.io-client java 2.0.1* and build the newly updated APK for AhMyth
#
- [ ] 06: Convert the AhMyth Client from *Java* to *Kotlin* and test to see if
it performs better with *Kotlin* instead of *Java* 
#
- [ ] 07: Implement battery ignorance as well as proper background activity for longer connections while the client is in sleep mode.
