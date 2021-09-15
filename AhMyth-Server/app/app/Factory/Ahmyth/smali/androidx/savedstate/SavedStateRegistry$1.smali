.class Landroidx/savedstate/SavedStateRegistry$1;
.super Ljava/lang/Object;
.source "SavedStateRegistry.java"

# interfaces
.implements Landroidx/lifecycle/GenericLifecycleObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/savedstate/SavedStateRegistry;->performRestore(Landroidx/lifecycle/Lifecycle;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/savedstate/SavedStateRegistry;


# direct methods
.method constructor <init>(Landroidx/savedstate/SavedStateRegistry;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/savedstate/SavedStateRegistry;

    .line 197
    iput-object p1, p0, Landroidx/savedstate/SavedStateRegistry$1;->this$0:Landroidx/savedstate/SavedStateRegistry;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onStateChanged(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 2
    .param p1, "source"    # Landroidx/lifecycle/LifecycleOwner;
    .param p2, "event"    # Landroidx/lifecycle/Lifecycle$Event;

    .line 200
    sget-object v0, Landroidx/lifecycle/Lifecycle$Event;->ON_START:Landroidx/lifecycle/Lifecycle$Event;

    if-ne p2, v0, :cond_0

    .line 201
    iget-object v0, p0, Landroidx/savedstate/SavedStateRegistry$1;->this$0:Landroidx/savedstate/SavedStateRegistry;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroidx/savedstate/SavedStateRegistry;->mAllowingSavingState:Z

    goto :goto_0

    .line 202
    :cond_0
    sget-object v0, Landroidx/lifecycle/Lifecycle$Event;->ON_STOP:Landroidx/lifecycle/Lifecycle$Event;

    if-ne p2, v0, :cond_1

    .line 203
    iget-object v0, p0, Landroidx/savedstate/SavedStateRegistry$1;->this$0:Landroidx/savedstate/SavedStateRegistry;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroidx/savedstate/SavedStateRegistry;->mAllowingSavingState:Z

    .line 205
    :cond_1
    :goto_0
    return-void
.end method
