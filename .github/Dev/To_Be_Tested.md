## New main class extraction function
```javascript
const fs = require('fs-extra');
const xml2js = require('xml2js');
const path = require('path');

const apkFolder = '/data/data/com.termux/files/home/test';

fs.readFile(path.join(apkFolder, 'AndroidManifest.xml'), 'utf8', (error, data) => {
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
    
    const launcherActivity = getLauncherActivity(result, apkFolder);
    
    if (launcherActivity === -1) {
      console.log('Cannot Find a Suitable Class for Hooking in the Manifest!');
      console.log('Please use Another APK as a Template!.');
      console.log();
      return;
    }
    
    console.log(launcherActivity);
  });
});

function getLauncherActivity(manifest) {
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
