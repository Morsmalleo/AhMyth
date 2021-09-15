.class Landroidx/recyclerview/widget/MessageThreadUtil;
.super Ljava/lang/Object;
.source "MessageThreadUtil.java"

# interfaces
.implements Landroidx/recyclerview/widget/ThreadUtil;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/recyclerview/widget/MessageThreadUtil$MessageQueue;,
        Landroidx/recyclerview/widget/MessageThreadUtil$SyncQueueItem;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroidx/recyclerview/widget/ThreadUtil<",
        "TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 27
    .local p0, "this":Landroidx/recyclerview/widget/MessageThreadUtil;, "Landroidx/recyclerview/widget/MessageThreadUtil<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBackgroundProxy(Landroidx/recyclerview/widget/ThreadUtil$BackgroundCallback;)Landroidx/recyclerview/widget/ThreadUtil$BackgroundCallback;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/ThreadUtil$BackgroundCallback<",
            "TT;>;)",
            "Landroidx/recyclerview/widget/ThreadUtil$BackgroundCallback<",
            "TT;>;"
        }
    .end annotation

    .line 88
    .local p0, "this":Landroidx/recyclerview/widget/MessageThreadUtil;, "Landroidx/recyclerview/widget/MessageThreadUtil<TT;>;"
    .local p1, "callback":Landroidx/recyclerview/widget/ThreadUtil$BackgroundCallback;, "Landroidx/recyclerview/widget/ThreadUtil$BackgroundCallback<TT;>;"
    new-instance v0, Landroidx/recyclerview/widget/MessageThreadUtil$2;

    invoke-direct {v0, p0, p1}, Landroidx/recyclerview/widget/MessageThreadUtil$2;-><init>(Landroidx/recyclerview/widget/MessageThreadUtil;Landroidx/recyclerview/widget/ThreadUtil$BackgroundCallback;)V

    return-object v0
.end method

.method public getMainThreadProxy(Landroidx/recyclerview/widget/ThreadUtil$MainThreadCallback;)Landroidx/recyclerview/widget/ThreadUtil$MainThreadCallback;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/ThreadUtil$MainThreadCallback<",
            "TT;>;)",
            "Landroidx/recyclerview/widget/ThreadUtil$MainThreadCallback<",
            "TT;>;"
        }
    .end annotation

    .line 31
    .local p0, "this":Landroidx/recyclerview/widget/MessageThreadUtil;, "Landroidx/recyclerview/widget/MessageThreadUtil<TT;>;"
    .local p1, "callback":Landroidx/recyclerview/widget/ThreadUtil$MainThreadCallback;, "Landroidx/recyclerview/widget/ThreadUtil$MainThreadCallback<TT;>;"
    new-instance v0, Landroidx/recyclerview/widget/MessageThreadUtil$1;

    invoke-direct {v0, p0, p1}, Landroidx/recyclerview/widget/MessageThreadUtil$1;-><init>(Landroidx/recyclerview/widget/MessageThreadUtil;Landroidx/recyclerview/widget/ThreadUtil$MainThreadCallback;)V

    return-object v0
.end method
