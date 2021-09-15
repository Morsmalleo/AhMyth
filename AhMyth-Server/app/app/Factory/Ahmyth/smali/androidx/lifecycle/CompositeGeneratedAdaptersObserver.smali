.class Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;
.super Ljava/lang/Object;
.source "CompositeGeneratedAdaptersObserver.java"

# interfaces
.implements Landroidx/lifecycle/LifecycleEventObserver;


# instance fields
.field private final mGeneratedAdapters:[Landroidx/lifecycle/GeneratedAdapter;


# direct methods
.method constructor <init>([Landroidx/lifecycle/GeneratedAdapter;)V
    .locals 0
    .param p1, "generatedAdapters"    # [Landroidx/lifecycle/GeneratedAdapter;

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;->mGeneratedAdapters:[Landroidx/lifecycle/GeneratedAdapter;

    .line 28
    return-void
.end method


# virtual methods
.method public onStateChanged(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 6
    .param p1, "source"    # Landroidx/lifecycle/LifecycleOwner;
    .param p2, "event"    # Landroidx/lifecycle/Lifecycle$Event;

    .line 32
    new-instance v0, Landroidx/lifecycle/MethodCallsLogger;

    invoke-direct {v0}, Landroidx/lifecycle/MethodCallsLogger;-><init>()V

    .line 33
    .local v0, "logger":Landroidx/lifecycle/MethodCallsLogger;
    iget-object v1, p0, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;->mGeneratedAdapters:[Landroidx/lifecycle/GeneratedAdapter;

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_0

    aget-object v5, v1, v4

    .line 34
    .local v5, "mGenerated":Landroidx/lifecycle/GeneratedAdapter;
    invoke-interface {v5, p1, p2, v3, v0}, Landroidx/lifecycle/GeneratedAdapter;->callMethods(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;ZLandroidx/lifecycle/MethodCallsLogger;)V

    .line 33
    .end local v5    # "mGenerated":Landroidx/lifecycle/GeneratedAdapter;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 36
    :cond_0
    iget-object v1, p0, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;->mGeneratedAdapters:[Landroidx/lifecycle/GeneratedAdapter;

    array-length v2, v1

    :goto_1
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 37
    .local v4, "mGenerated":Landroidx/lifecycle/GeneratedAdapter;
    const/4 v5, 0x1

    invoke-interface {v4, p1, p2, v5, v0}, Landroidx/lifecycle/GeneratedAdapter;->callMethods(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;ZLandroidx/lifecycle/MethodCallsLogger;)V

    .line 36
    .end local v4    # "mGenerated":Landroidx/lifecycle/GeneratedAdapter;
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 39
    :cond_1
    return-void
.end method
