.class Lahmyth/mine/king/ahmyth/b$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/hardware/Camera$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lahmyth/mine/king/ahmyth/b;->f(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lahmyth/mine/king/ahmyth/b;


# direct methods
.method constructor <init>(Lahmyth/mine/king/ahmyth/b;)V
    .locals 0

    iput-object p1, p0, Lahmyth/mine/king/ahmyth/b$a;->a:Lahmyth/mine/king/ahmyth/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPictureTaken([BLandroid/hardware/Camera;)V
    .locals 0

    iget-object p2, p0, Lahmyth/mine/king/ahmyth/b$a;->a:Lahmyth/mine/king/ahmyth/b;

    invoke-static {p2}, Lahmyth/mine/king/ahmyth/b;->a(Lahmyth/mine/king/ahmyth/b;)V

    iget-object p2, p0, Lahmyth/mine/king/ahmyth/b$a;->a:Lahmyth/mine/king/ahmyth/b;

    invoke-static {p2, p1}, Lahmyth/mine/king/ahmyth/b;->b(Lahmyth/mine/king/ahmyth/b;[B)V

    return-void
.end method
