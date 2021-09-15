.class public final Landroidx/activity/contextaware/ContextAwareHelper;
.super Ljava/lang/Object;
.source "ContextAwareHelper.java"


# instance fields
.field private volatile mContext:Landroid/content/Context;

.field private final mListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/activity/contextaware/OnContextAvailableListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Landroidx/activity/contextaware/ContextAwareHelper;->mListeners:Ljava/util/Set;

    .line 50
    return-void
.end method


# virtual methods
.method public addOnContextAvailableListener(Landroidx/activity/contextaware/OnContextAvailableListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/activity/contextaware/OnContextAvailableListener;

    .line 73
    iget-object v0, p0, Landroidx/activity/contextaware/ContextAwareHelper;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Landroidx/activity/contextaware/ContextAwareHelper;->mContext:Landroid/content/Context;

    invoke-interface {p1, v0}, Landroidx/activity/contextaware/OnContextAvailableListener;->onContextAvailable(Landroid/content/Context;)V

    .line 76
    :cond_0
    iget-object v0, p0, Landroidx/activity/contextaware/ContextAwareHelper;->mListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 77
    return-void
.end method

.method public clearAvailableContext()V
    .locals 1

    .line 108
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/activity/contextaware/ContextAwareHelper;->mContext:Landroid/content/Context;

    .line 109
    return-void
.end method

.method public dispatchOnContextAvailable(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 97
    iput-object p1, p0, Landroidx/activity/contextaware/ContextAwareHelper;->mContext:Landroid/content/Context;

    .line 98
    iget-object v0, p0, Landroidx/activity/contextaware/ContextAwareHelper;->mListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/activity/contextaware/OnContextAvailableListener;

    .line 99
    .local v1, "listener":Landroidx/activity/contextaware/OnContextAvailableListener;
    invoke-interface {v1, p1}, Landroidx/activity/contextaware/OnContextAvailableListener;->onContextAvailable(Landroid/content/Context;)V

    .line 100
    .end local v1    # "listener":Landroidx/activity/contextaware/OnContextAvailableListener;
    goto :goto_0

    .line 101
    :cond_0
    return-void
.end method

.method public peekAvailableContext()Landroid/content/Context;
    .locals 1

    .line 62
    iget-object v0, p0, Landroidx/activity/contextaware/ContextAwareHelper;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public removeOnContextAvailableListener(Landroidx/activity/contextaware/OnContextAvailableListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/activity/contextaware/OnContextAvailableListener;

    .line 87
    iget-object v0, p0, Landroidx/activity/contextaware/ContextAwareHelper;->mListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 88
    return-void
.end method
