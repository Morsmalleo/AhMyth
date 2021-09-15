.class Landroidx/core/view/WindowInsetsControllerCompat$Impl30$2;
.super Ljava/lang/Object;
.source "WindowInsetsControllerCompat.java"

# interfaces
.implements Landroid/view/WindowInsetsController$OnControllableInsetsChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/core/view/WindowInsetsControllerCompat$Impl30;->addOnControllableInsetsChangedListener(Landroidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/core/view/WindowInsetsControllerCompat$Impl30;

.field final synthetic val$listener:Landroidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener;


# direct methods
.method constructor <init>(Landroidx/core/view/WindowInsetsControllerCompat$Impl30;Landroidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/core/view/WindowInsetsControllerCompat$Impl30;

    .line 737
    iput-object p1, p0, Landroidx/core/view/WindowInsetsControllerCompat$Impl30$2;->this$0:Landroidx/core/view/WindowInsetsControllerCompat$Impl30;

    iput-object p2, p0, Landroidx/core/view/WindowInsetsControllerCompat$Impl30$2;->val$listener:Landroidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onControllableInsetsChanged(Landroid/view/WindowInsetsController;I)V
    .locals 2
    .param p1, "controller"    # Landroid/view/WindowInsetsController;
    .param p2, "typeMask"    # I

    .line 743
    iget-object v0, p0, Landroidx/core/view/WindowInsetsControllerCompat$Impl30$2;->this$0:Landroidx/core/view/WindowInsetsControllerCompat$Impl30;

    iget-object v0, v0, Landroidx/core/view/WindowInsetsControllerCompat$Impl30;->mInsetsController:Landroid/view/WindowInsetsController;

    if-ne v0, p1, :cond_0

    .line 744
    iget-object v0, p0, Landroidx/core/view/WindowInsetsControllerCompat$Impl30$2;->val$listener:Landroidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener;

    iget-object v1, p0, Landroidx/core/view/WindowInsetsControllerCompat$Impl30$2;->this$0:Landroidx/core/view/WindowInsetsControllerCompat$Impl30;

    iget-object v1, v1, Landroidx/core/view/WindowInsetsControllerCompat$Impl30;->mCompatController:Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-interface {v0, v1, p2}, Landroidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener;->onControllableInsetsChanged(Landroidx/core/view/WindowInsetsControllerCompat;I)V

    .line 747
    :cond_0
    return-void
.end method
