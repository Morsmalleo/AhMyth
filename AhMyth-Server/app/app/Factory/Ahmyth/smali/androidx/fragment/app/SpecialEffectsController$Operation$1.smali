.class Landroidx/fragment/app/SpecialEffectsController$Operation$1;
.super Ljava/lang/Object;
.source "SpecialEffectsController.java"

# interfaces
.implements Landroidx/core/os/CancellationSignal$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/SpecialEffectsController$Operation;-><init>(Landroidx/fragment/app/SpecialEffectsController$Operation$State;Landroidx/fragment/app/SpecialEffectsController$Operation$LifecycleImpact;Landroidx/fragment/app/Fragment;Landroidx/core/os/CancellationSignal;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/fragment/app/SpecialEffectsController$Operation;


# direct methods
.method constructor <init>(Landroidx/fragment/app/SpecialEffectsController$Operation;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 527
    iput-object p1, p0, Landroidx/fragment/app/SpecialEffectsController$Operation$1;->this$0:Landroidx/fragment/app/SpecialEffectsController$Operation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 1

    .line 530
    iget-object v0, p0, Landroidx/fragment/app/SpecialEffectsController$Operation$1;->this$0:Landroidx/fragment/app/SpecialEffectsController$Operation;

    invoke-virtual {v0}, Landroidx/fragment/app/SpecialEffectsController$Operation;->cancel()V

    .line 531
    return-void
.end method
