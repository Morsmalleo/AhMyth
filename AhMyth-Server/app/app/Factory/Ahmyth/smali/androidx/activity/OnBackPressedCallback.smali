.class public abstract Landroidx/activity/OnBackPressedCallback;
.super Ljava/lang/Object;
.source "OnBackPressedCallback.java"


# instance fields
.field private mCancellables:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Landroidx/activity/Cancellable;",
            ">;"
        }
    .end annotation
.end field

.field private mEnabled:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Landroidx/activity/OnBackPressedCallback;->mCancellables:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 55
    iput-boolean p1, p0, Landroidx/activity/OnBackPressedCallback;->mEnabled:Z

    .line 56
    return-void
.end method


# virtual methods
.method addCancellable(Landroidx/activity/Cancellable;)V
    .locals 1
    .param p1, "cancellable"    # Landroidx/activity/Cancellable;

    .line 103
    iget-object v0, p0, Landroidx/activity/OnBackPressedCallback;->mCancellables:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    return-void
.end method

.method public abstract handleOnBackPressed()V
.end method

.method public final isEnabled()Z
    .locals 1

    .line 82
    iget-boolean v0, p0, Landroidx/activity/OnBackPressedCallback;->mEnabled:Z

    return v0
.end method

.method public final remove()V
    .locals 2

    .line 91
    iget-object v0, p0, Landroidx/activity/OnBackPressedCallback;->mCancellables:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/activity/Cancellable;

    .line 92
    .local v1, "cancellable":Landroidx/activity/Cancellable;
    invoke-interface {v1}, Landroidx/activity/Cancellable;->cancel()V

    .line 93
    .end local v1    # "cancellable":Landroidx/activity/Cancellable;
    goto :goto_0

    .line 94
    :cond_0
    return-void
.end method

.method removeCancellable(Landroidx/activity/Cancellable;)V
    .locals 1
    .param p1, "cancellable"    # Landroidx/activity/Cancellable;

    .line 107
    iget-object v0, p0, Landroidx/activity/OnBackPressedCallback;->mCancellables:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 108
    return-void
.end method

.method public final setEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 71
    iput-boolean p1, p0, Landroidx/activity/OnBackPressedCallback;->mEnabled:Z

    .line 72
    return-void
.end method
