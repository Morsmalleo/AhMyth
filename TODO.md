## Stability Updates:

- [x] 01: Figure out why AhMyth is so unstable on 
Windows machines!
```
Done, was due to outdated coding in `main.js` + and an old electron version (`electron v9.0.0`).
```
#
- [ ] 02: Fully stabilise `On Launch` binding method by effectively 
allowing AhMyth to search for the
```smali
->onCreate()V
```
method if the...
```
->onCreate(Landroid/os/Bundle;)V
```
method is not found in the **Launcher Activity**, 
and throw an error if both methods aren't found.
#
- [x] 03: Figure out how to allow AhMyth to search `smali_classes` directories, 
if the launcher activity is not present anywhere in the `smali` directory.

```
Done For Windows, Linux & macOS FINALLY!!

For Windows, we've made use of the `set-location` & `gci (get-childItem)` commands
to recursively locate the launcher activity and return a RELATIVE (NOT ABSOLUTE) path 
to the launcher activity from inside the selected decompiled APK.

The Linux variant utilises GNU findUtil's "find" command
to recursively locate the launcher activity and return a RELATIVE (NOT ABSOLUTE) path 
to the launcher activity from inside the selected decompiled APK.

macOS variant utilises the Apple's built in BSD findUtils `find` command
to recursively locate the launcher activity and return a RELATIVE (NOT ABSOLUTE) path 
to the launcher activity from inside the selected decompiled APK.
```
#
- [ ] 04. Stabilise the SMS feature by adding the ability to view sent SMS's 
with inbox SMS's, and possibly view Conversation lists as well.
#
- [ ] 05: Update *socket.io-client java 0.8.3* to *socket.io-client java 2.0.1* 
and test the client with the Server's Socket.io v4.x.x
#
- [ ] 06: Convert the AhMyth Client from *Java* to *Kotlin* and test to see if
it performs better with *Kotlin* instead of *Java* 
#
- [ ] 07: Implement battery ignorance as well as proper background activity for 
longer connections while the client is in sleep mode.
#
- [ ] 08: Update the autoinstall script to install AhMyth based on the current supported OS's 
if they're detected after running the script, the script should also check to see if the required 
dependencies are installed, and install them if they're aren't.
