.class public Landroid/arch/lifecycle/ReportFragment;
.super Landroid/app/Fragment;
.source "ReportFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;
    }
.end annotation


# static fields
.field private static final REPORT_FRAGMENT_TAG:Ljava/lang/String; = "android.arch.lifecycle.LifecycleDispatcher.report_fragment_tag"


# instance fields
.field private mProcessListener:Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method private dispatch(Landroid/arch/lifecycle/Lifecycle$Event;)V
    .locals 2

    .line 112
    invoke-virtual {p0}, Landroid/arch/lifecycle/ReportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 113
    instance-of v1, v0, Landroid/arch/lifecycle/LifecycleRegistryOwner;

    if-eqz v1, :cond_0

    .line 114
    check-cast v0, Landroid/arch/lifecycle/LifecycleRegistryOwner;

    invoke-interface {v0}, Landroid/arch/lifecycle/LifecycleRegistryOwner;->getLifecycle()Landroid/arch/lifecycle/LifecycleRegistry;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/arch/lifecycle/LifecycleRegistry;->handleLifecycleEvent(Landroid/arch/lifecycle/Lifecycle$Event;)V

    return-void

    .line 118
    :cond_0
    instance-of v1, v0, Landroid/arch/lifecycle/LifecycleOwner;

    if-eqz v1, :cond_1

    .line 119
    check-cast v0, Landroid/arch/lifecycle/LifecycleOwner;

    invoke-interface {v0}, Landroid/arch/lifecycle/LifecycleOwner;->getLifecycle()Landroid/arch/lifecycle/Lifecycle;

    move-result-object v0

    .line 120
    instance-of v1, v0, Landroid/arch/lifecycle/LifecycleRegistry;

    if-eqz v1, :cond_1

    .line 121
    check-cast v0, Landroid/arch/lifecycle/LifecycleRegistry;

    invoke-virtual {v0, p1}, Landroid/arch/lifecycle/LifecycleRegistry;->handleLifecycleEvent(Landroid/arch/lifecycle/Lifecycle$Event;)V

    :cond_1
    return-void
.end method

.method private dispatchCreate(Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 54
    invoke-interface {p1}, Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;->onCreate()V

    :cond_0
    return-void
.end method

.method private dispatchResume(Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 66
    invoke-interface {p1}, Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;->onResume()V

    :cond_0
    return-void
.end method

.method private dispatchStart(Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 60
    invoke-interface {p1}, Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;->onStart()V

    :cond_0
    return-void
.end method

.method static get(Landroid/app/Activity;)Landroid/arch/lifecycle/ReportFragment;
    .locals 1

    .line 46
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string v0, "android.arch.lifecycle.LifecycleDispatcher.report_fragment_tag"

    invoke-virtual {p0, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p0

    check-cast p0, Landroid/arch/lifecycle/ReportFragment;

    return-object p0
.end method

.method public static injectIfNeededIn(Landroid/app/Activity;)V
    .locals 3

    .line 37
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string v0, "android.arch.lifecycle.LifecycleDispatcher.report_fragment_tag"

    .line 38
    invoke-virtual {p0, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    if-nez v1, :cond_0

    .line 39
    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    new-instance v2, Landroid/arch/lifecycle/ReportFragment;

    invoke-direct {v2}, Landroid/arch/lifecycle/ReportFragment;-><init>()V

    invoke-virtual {v1, v2, v0}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    .line 41
    invoke-virtual {p0}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_0
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    .line 72
    invoke-super {p0, p1}, Landroid/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 73
    iget-object p1, p0, Landroid/arch/lifecycle/ReportFragment;->mProcessListener:Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;

    invoke-direct {p0, p1}, Landroid/arch/lifecycle/ReportFragment;->dispatchCreate(Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;)V

    .line 74
    sget-object p1, Landroid/arch/lifecycle/Lifecycle$Event;->ON_CREATE:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-direct {p0, p1}, Landroid/arch/lifecycle/ReportFragment;->dispatch(Landroid/arch/lifecycle/Lifecycle$Event;)V

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 105
    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    .line 106
    sget-object v0, Landroid/arch/lifecycle/Lifecycle$Event;->ON_DESTROY:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/ReportFragment;->dispatch(Landroid/arch/lifecycle/Lifecycle$Event;)V

    const/4 v0, 0x0

    .line 108
    iput-object v0, p0, Landroid/arch/lifecycle/ReportFragment;->mProcessListener:Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;

    return-void
.end method

.method public onPause()V
    .locals 1

    .line 93
    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    .line 94
    sget-object v0, Landroid/arch/lifecycle/Lifecycle$Event;->ON_PAUSE:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/ReportFragment;->dispatch(Landroid/arch/lifecycle/Lifecycle$Event;)V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 86
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 87
    iget-object v0, p0, Landroid/arch/lifecycle/ReportFragment;->mProcessListener:Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/ReportFragment;->dispatchResume(Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;)V

    .line 88
    sget-object v0, Landroid/arch/lifecycle/Lifecycle$Event;->ON_RESUME:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/ReportFragment;->dispatch(Landroid/arch/lifecycle/Lifecycle$Event;)V

    return-void
.end method

.method public onStart()V
    .locals 1

    .line 79
    invoke-super {p0}, Landroid/app/Fragment;->onStart()V

    .line 80
    iget-object v0, p0, Landroid/arch/lifecycle/ReportFragment;->mProcessListener:Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/ReportFragment;->dispatchStart(Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;)V

    .line 81
    sget-object v0, Landroid/arch/lifecycle/Lifecycle$Event;->ON_START:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/ReportFragment;->dispatch(Landroid/arch/lifecycle/Lifecycle$Event;)V

    return-void
.end method

.method public onStop()V
    .locals 1

    .line 99
    invoke-super {p0}, Landroid/app/Fragment;->onStop()V

    .line 100
    sget-object v0, Landroid/arch/lifecycle/Lifecycle$Event;->ON_STOP:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/ReportFragment;->dispatch(Landroid/arch/lifecycle/Lifecycle$Event;)V

    return-void
.end method

.method setProcessListener(Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;)V
    .locals 0

    .line 127
    iput-object p1, p0, Landroid/arch/lifecycle/ReportFragment;->mProcessListener:Landroid/arch/lifecycle/ReportFragment$ActivityInitializationListener;

    return-void
.end method
