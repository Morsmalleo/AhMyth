## New Launcher Extraction function using xml2js

```js
const fs = require('fs-extra');

const xml2js = require('xml2js');

var path = require('path');

var apkFolder = '/data/data/com.termux/files/home/test'

fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {

    if (error) {

        console.log('Reading AndroidManifest.xml Failed!');

        console.log();

        return;

    }

   xml2js.parseString(data, (err, result) => {

       if (err) {

           console.error(err);

           return;

       }

       var launcherActivity = GetLauncherActivity(result, apkFolder);

           if (launcherActivity == -1) {

               console.log("Cannot Find the Launcher Activity in the Manifest!");

               console.log("Please use Another APK as a Template!.");

               console.log();

               return;

           }

           console.log(launcherActivity);

       });

   });

function GetLauncherActivity(manifest) {

    // Extract the name of the main application class from the manifest

    const application = manifest['manifest']['application'][0];

    let mainApplicationClassName = application && application['$'] && application['$']['android:name'];

    if (mainApplicationClassName) {

        // Remove the package name if it's present

        mainApplicationClassName = mainApplicationClassName.split('.').pop();

        if (mainApplicationClassName.startsWith('.')) {

            mainApplicationClassName = mainApplicationClassName.slice(1);

        }

        return mainApplicationClassName + '.smali';

    }

    // Extract the class name of the main launcher activity from the manifest

    const activity = application && application['activity'] && application['activity'].find(activity => {

        const intentFilter = activity['intent-filter'];

        if (intentFilter) {

            return intentFilter.some(filter => filter['action'].some(action => action['$']['android:name'] === 'android.intent.action.MAIN') && filter['category'].some(category => category['$']['android:name'] === 'android.intent.category.LAUNCHER'));

        }

        return false;

    });

    let mainActivityClassName;

    if (activity) {

        mainActivityClassName = activity['$'] && activity['$']['android:name'];

        // Remove the package name if it's present

        mainActivityClassName = mainActivityClassName.split('.').pop();

        if (mainActivityClassName.startsWith('.')) {

            mainActivityClassName = mainActivityClassName.slice(1);

        }

        return mainActivityClassName + '.smali';

    }

    // Extract the class name of the main launcher activity from the manifest

    const activityAlias = application && application['activity-alias'] && application['activity-alias'].find(activityAlias => {

        const intentFilter = activityAlias['intent-filter'];

        if (intentFilter) {

            return intentFilter.some(filter => filter['action'].some(action => action['$']['android:name'] === 'android.intent.action.MAIN') && filter['category'].some(category => category['$']['android:name'] === 'android.intent.category.LAUNCHER'));

        }

        return false;

    });

    if (activityAlias) {

        const targetActivityName = activityAlias['$'] && activityAlias['$']['android:targetActivity'];

        mainActivityClassName = targetActivityName.split('.').pop();

        if (mainActivityClassName.startsWith('.')) {

            mainActivityClassName = mainActivityClassName.slice(1);

        }

        return mainActivityClassName + '.smali';

    }

    return -1;

}
```
