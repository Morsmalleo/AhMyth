.class Landroid/arch/lifecycle/FullLifecycleObserverAdapter;
.super Ljava/lang/Object;
.source "FullLifecycleObserverAdapter.java"

# interfaces
.implements Landroid/arch/lifecycle/GenericLifecycleObserver;


# instance fields
.field private final mObserver:Landroid/arch/lifecycle/FullLifecycleObserver;


# direct methods
.method constructor <init>(Landroid/arch/lifecycle/FullLifecycleObserver;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Landroid/arch/lifecycle/FullLifecycleObserverAdapter;->mObserver:Landroid/arch/lifecycle/FullLifecycleObserver;

    return-void
.end method


# virtual methods
.method public onStateChanged(Landroid/arch/lifecycle/LifecycleOwner;Landroid/arch/lifecycle/Lifecycle$Event;)V
    .locals 1

    .line 29
    sget-object v0, Landroid/arch/lifecycle/FullLifecycleObserverAdapter$1;->$SwitchMap$android$arch$lifecycle$Lifecycle$Event:[I

    invoke-virtual {p2}, Landroid/arch/lifecycle/Lifecycle$Event;->ordinal()I

    move-result p2

    aget p2, v0, p2

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 49
    :pswitch_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "ON_ANY must not been send by anybody"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 46
    :pswitch_1
    iget-object p2, p0, Landroid/arch/lifecycle/FullLifecycleObserverAdapter;->mObserver:Landroid/arch/lifecycle/FullLifecycleObserver;

    invoke-interface {p2, p1}, Landroid/arch/lifecycle/FullLifecycleObserver;->onDestroy(Landroid/arch/lifecycle/LifecycleOwner;)V

    goto :goto_0

    .line 43
    :pswitch_2
    iget-object p2, p0, Landroid/arch/lifecycle/FullLifecycleObserverAdapter;->mObserver:Landroid/arch/lifecycle/FullLifecycleObserver;

    invoke-interface {p2, p1}, Landroid/arch/lifecycle/FullLifecycleObserver;->onStop(Landroid/arch/lifecycle/LifecycleOwner;)V

    goto :goto_0

    .line 40
    :pswitch_3
    iget-object p2, p0, Landroid/arch/lifecycle/FullLifecycleObserverAdapter;->mObserver:Landroid/arch/lifecycle/FullLifecycleObserver;

    invoke-interface {p2, p1}, Landroid/arch/lifecycle/FullLifecycleObserver;->onPause(Landroid/arch/lifecycle/LifecycleOwner;)V

    goto :goto_0

    .line 37
    :pswitch_4
    iget-object p2, p0, Landroid/arch/lifecycle/FullLifecycleObserverAdapter;->mObserver:Landroid/arch/lifecycle/FullLifecycleObserver;

    invoke-interface {p2, p1}, Landroid/arch/lifecycle/FullLifecycleObserver;->onResume(Landroid/arch/lifecycle/LifecycleOwner;)V

    goto :goto_0

    .line 34
    :pswitch_5
    iget-object p2, p0, Landroid/arch/lifecycle/FullLifecycleObserverAdapter;->mObserver:Landroid/arch/lifecycle/FullLifecycleObserver;

    invoke-interface {p2, p1}, Landroid/arch/lifecycle/FullLifecycleObserver;->onStart(Landroid/arch/lifecycle/LifecycleOwner;)V

    goto :goto_0

    .line 31
    :pswitch_6
    iget-object p2, p0, Landroid/arch/lifecycle/FullLifecycleObserverAdapter;->mObserver:Landroid/arch/lifecycle/FullLifecycleObserver;

    invoke-interface {p2, p1}, Landroid/arch/lifecycle/FullLifecycleObserver;->onCreate(Landroid/arch/lifecycle/LifecycleOwner;)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
