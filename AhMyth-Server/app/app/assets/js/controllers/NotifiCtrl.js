const { ipcRenderer } = require('electron');
const { getCurrentWebContents } = require('@electron/remote');
const app = angular.module('myappy', []);

const victim = getCurrentWebContents().victim;

app.controller("NotifiCtrl", function ($scope, $location) {
    $NotifiCtrl = $scope;
    $NotifiCtrl.victimSocket = victim.ip + ":" + victim.port;
    $NotifiCtrl.victimModel = victim.model;
    $NotifiCtrl.victimCountry = victim.country;
});