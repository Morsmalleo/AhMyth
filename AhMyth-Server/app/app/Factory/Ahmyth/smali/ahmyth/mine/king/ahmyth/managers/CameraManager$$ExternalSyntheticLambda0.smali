.class public final synthetic Lahmyth/mine/king/ahmyth/managers/CameraManager$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/hardware/Camera$PictureCallback;


# instance fields
.field public final synthetic f$0:Lahmyth/mine/king/ahmyth/managers/CameraManager;


# direct methods
.method public synthetic constructor <init>(Lahmyth/mine/king/ahmyth/managers/CameraManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lahmyth/mine/king/ahmyth/managers/CameraManager$$ExternalSyntheticLambda0;->f$0:Lahmyth/mine/king/ahmyth/managers/CameraManager;

    return-void
.end method


# virtual methods
.method public final onPictureTaken([BLandroid/hardware/Camera;)V
    .locals 1

    iget-object v0, p0, Lahmyth/mine/king/ahmyth/managers/CameraManager$$ExternalSyntheticLambda0;->f$0:Lahmyth/mine/king/ahmyth/managers/CameraManager;

    invoke-virtual {v0, p1, p2}, Lahmyth/mine/king/ahmyth/managers/CameraManager;->lambda$startUp$0$CameraManager([BLandroid/hardware/Camera;)V

    return-void
.end method
