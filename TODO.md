## Client-Side TODO List:
- [ ] 01: Integrate Live Camera Preview Stream for the Client. 
#
- [ ] 02: Hijack a legitimate APK and configure it as a standalone Payload for AhMyth.
#
- [ ] 03: Integrate a valid signing certificate to bypass Play Protect. 
#
- [ ] 04: Integrate persistence for the AhMyth payload.
#
- [ ] 05: Integrate real-time viewing of the victim device screen.
#
- [ ] 06: Integrate screen recording for real time viewing device screens.
#
- [ ] 07: Integrate USSD dialing and response view feature for the 
AhMyth client, requested by user from Issue [#97](https://github.com/Morsmalleo/AhMyth/issues/97)
#
- [ ] 08: Integrate screenshot for real time viewing of victim device screens.
#
- [ ] 09: Integrate access to the victim device SD Card.
#
- [ ] 10: Figure out how to gain access to root storage without the victim device being rooted.
#
- [ ] 11: Update *socket.io-client java 0.8.3* to *socket.io-client java 2.0.1*
#
#
## Server-Side TODO List:

- [ ] 01: integrate a `Retry` function to be called so apktool
can be executed a second time, but with the added flag *--use-aapt* if building an APK fails
the first time.
#
- [x] 02: Create a backup copy of AhMyth's `AndroidManifest.xml`
file, and store it in the newly created backup directory 
`Vault` in order to restore AhMyth's original manifest file back to 
it's original state after being edited with custom permissions.

- This is done! It just needs to be updated to work with the
Constants.js file
#
- [ ] 03: Explore other, more discrete options for the 
URL payload masker.
#
- [ ] 04: Integrate the function to Log apktool.jar and sign.jar 
errors to a text file for the GUI version of AhMyth.
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
- [ ] 8: Update *socket.io 2.4.2* to *socket.io 4.x*
#
#
# Stability TODO's

- [ ] 01: Figure out why AhMyth is so unstable on 
Windows machines!
# 
- [ ] 02: Stabilise Launcher Activity binding method

This is almost stable, just need to code in some functions
taken from *msfvenom*, then add a way to hook smali files that use the
`super` method instead of the `OnCreate` method. This shouldn't be to hard
thanks to `dana-at-cp/backdoor-apk`.
