.class Landroid/arch/lifecycle/LifecycleRegistry$ObserverWithState;
.super Ljava/lang/Object;
.source "LifecycleRegistry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/arch/lifecycle/LifecycleRegistry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ObserverWithState"
.end annotation


# instance fields
.field mLifecycleObserver:Landroid/arch/lifecycle/GenericLifecycleObserver;

.field mState:Landroid/arch/lifecycle/Lifecycle$State;


# direct methods
.method constructor <init>(Landroid/arch/lifecycle/LifecycleObserver;Landroid/arch/lifecycle/Lifecycle$State;)V
    .locals 0

    .line 346
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 347
    invoke-static {p1}, Landroid/arch/lifecycle/Lifecycling;->getCallback(Ljava/lang/Object;)Landroid/arch/lifecycle/GenericLifecycleObserver;

    move-result-object p1

    iput-object p1, p0, Landroid/arch/lifecycle/LifecycleRegistry$ObserverWithState;->mLifecycleObserver:Landroid/arch/lifecycle/GenericLifecycleObserver;

    .line 348
    iput-object p2, p0, Landroid/arch/lifecycle/LifecycleRegistry$ObserverWithState;->mState:Landroid/arch/lifecycle/Lifecycle$State;

    return-void
.end method


# virtual methods
.method dispatchEvent(Landroid/arch/lifecycle/LifecycleOwner;Landroid/arch/lifecycle/Lifecycle$Event;)V
    .locals 2

    .line 352
    invoke-static {p2}, Landroid/arch/lifecycle/LifecycleRegistry;->getStateAfter(Landroid/arch/lifecycle/Lifecycle$Event;)Landroid/arch/lifecycle/Lifecycle$State;

    move-result-object v0

    .line 353
    iget-object v1, p0, Landroid/arch/lifecycle/LifecycleRegistry$ObserverWithState;->mState:Landroid/arch/lifecycle/Lifecycle$State;

    invoke-static {v1, v0}, Landroid/arch/lifecycle/LifecycleRegistry;->min(Landroid/arch/lifecycle/Lifecycle$State;Landroid/arch/lifecycle/Lifecycle$State;)Landroid/arch/lifecycle/Lifecycle$State;

    move-result-object v1

    iput-object v1, p0, Landroid/arch/lifecycle/LifecycleRegistry$ObserverWithState;->mState:Landroid/arch/lifecycle/Lifecycle$State;

    .line 354
    iget-object v1, p0, Landroid/arch/lifecycle/LifecycleRegistry$ObserverWithState;->mLifecycleObserver:Landroid/arch/lifecycle/GenericLifecycleObserver;

    invoke-interface {v1, p1, p2}, Landroid/arch/lifecycle/GenericLifecycleObserver;->onStateChanged(Landroid/arch/lifecycle/LifecycleOwner;Landroid/arch/lifecycle/Lifecycle$Event;)V

    .line 355
    iput-object v0, p0, Landroid/arch/lifecycle/LifecycleRegistry$ObserverWithState;->mState:Landroid/arch/lifecycle/Lifecycle$State;

    return-void
.end method
