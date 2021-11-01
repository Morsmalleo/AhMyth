.class Lahmyth/mine/king/ahmyth/CameraManager$1;
.super Ljava/lang/Object;
.source "CameraManager.java"

# interfaces
.implements Landroid/hardware/Camera$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lahmyth/mine/king/ahmyth/CameraManager;->startUp(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lahmyth/mine/king/ahmyth/CameraManager;


# direct methods
.method constructor <init>(Lahmyth/mine/king/ahmyth/CameraManager;)V
    .locals 0

    .line 42
    iput-object p1, p0, Lahmyth/mine/king/ahmyth/CameraManager$1;->this$0:Lahmyth/mine/king/ahmyth/CameraManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPictureTaken([BLandroid/hardware/Camera;)V
    .locals 0

    .line 45
    iget-object p2, p0, Lahmyth/mine/king/ahmyth/CameraManager$1;->this$0:Lahmyth/mine/king/ahmyth/CameraManager;

    invoke-static {p2}, Lahmyth/mine/king/ahmyth/CameraManager;->access$000(Lahmyth/mine/king/ahmyth/CameraManager;)V

    .line 46
    iget-object p2, p0, Lahmyth/mine/king/ahmyth/CameraManager$1;->this$0:Lahmyth/mine/king/ahmyth/CameraManager;

    invoke-static {p2, p1}, Lahmyth/mine/king/ahmyth/CameraManager;->access$100(Lahmyth/mine/king/ahmyth/CameraManager;[B)V

    return-void
.end method
