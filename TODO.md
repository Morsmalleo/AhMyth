## Client-Side TODO List:
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
AhMyth client, requested by user from Issue [#97](https://github.com/Morsmalleo/AhMyth/issues/97)
#
- [ ] 07: Integrate screenshot for real time viewing of victim device screens.
#
- [ ] 08: Integrate access to the victim device SD Card.
#
- [ ] 09: Update *socket.io-client java 0.8.3* to *socket.io-client java 2.0.1* and build the newly updated APK for AhMyth
#
- [ ] 10: Convert the Client from *Java* to *Kotlin* and test to see if
it performs better with *Kotlin* instead of *Java* 
#
## Server-Side TODO List:

- [ ] 01: integrate a `Retry` function to be called so apktool
can be executed a second time, but with the added flag `--use-aapt` if building an APK fails
the first time.
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
      2. Side scrolling tabs instead of top scrolling tabs
      3. Icons to replace the Tab names
      4. Settings menu for UI style adjustments
      5. Dark theme
      6. AhMyth user account login - Default username will be `ahmyth` 
      and the default password will be `trojan`
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
- [ ] 14: Add Settings Menu to switch between theme looks
#
## Stability TODO List:

- [ ] 01: Figure out why AhMyth is so unstable on 
Windows machines!
# 
- [ ] 02: Stabilise `On Launch` binding method by effectively 
allowing AhMyth to search for the `onCreate()V` method if the `onCreate(Landroid/os/Bundle;)V` 
method is not found in the **Launcher Activity**.
#
- [ ] 03: Figure out how to allow AhMyth to search `smali_classes` directories, if the launcher activity is not present anywhere in the `smali` directory 

