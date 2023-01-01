.class public Landroid/arch/lifecycle/h;
.super Landroid/app/Fragment;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/arch/lifecycle/h$a;
    }
.end annotation


# instance fields
.field private a:Landroid/arch/lifecycle/h$a;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method private a(Landroid/arch/lifecycle/c$a;)V
    .locals 2

    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v1, v0, Landroid/arch/lifecycle/f;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/arch/lifecycle/f;

    invoke-interface {v0}, Landroid/arch/lifecycle/f;->a()Landroid/arch/lifecycle/e;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/arch/lifecycle/e;->e(Landroid/arch/lifecycle/c$a;)V

    return-void

    :cond_0
    instance-of v1, v0, Landroid/arch/lifecycle/d;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/arch/lifecycle/d;

    invoke-interface {v0}, Landroid/arch/lifecycle/d;->a()Landroid/arch/lifecycle/c;

    move-result-object v0

    instance-of v1, v0, Landroid/arch/lifecycle/e;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/arch/lifecycle/e;

    invoke-virtual {v0, p1}, Landroid/arch/lifecycle/e;->e(Landroid/arch/lifecycle/c$a;)V

    :cond_1
    return-void
.end method

.method private b(Landroid/arch/lifecycle/h$a;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/arch/lifecycle/h$a;->a()V

    :cond_0
    return-void
.end method

.method private c(Landroid/arch/lifecycle/h$a;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/arch/lifecycle/h$a;->b()V

    :cond_0
    return-void
.end method

.method private d(Landroid/arch/lifecycle/h$a;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/arch/lifecycle/h$a;->c()V

    :cond_0
    return-void
.end method

.method public static e(Landroid/app/Activity;)V
    .locals 3

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string v0, "android.arch.lifecycle.LifecycleDispatcher.report_fragment_tag"

    invoke-virtual {p0, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    new-instance v2, Landroid/arch/lifecycle/h;

    invoke-direct {v2}, Landroid/arch/lifecycle/h;-><init>()V

    invoke-virtual {v1, v2, v0}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    invoke-virtual {p0}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_0
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    iget-object p1, p0, Landroid/arch/lifecycle/h;->a:Landroid/arch/lifecycle/h$a;

    invoke-direct {p0, p1}, Landroid/arch/lifecycle/h;->b(Landroid/arch/lifecycle/h$a;)V

    sget-object p1, Landroid/arch/lifecycle/c$a;->ON_CREATE:Landroid/arch/lifecycle/c$a;

    invoke-direct {p0, p1}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/c$a;)V

    return-void
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    sget-object v0, Landroid/arch/lifecycle/c$a;->ON_DESTROY:Landroid/arch/lifecycle/c$a;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/c$a;)V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/arch/lifecycle/h;->a:Landroid/arch/lifecycle/h$a;

    return-void
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    sget-object v0, Landroid/arch/lifecycle/c$a;->ON_PAUSE:Landroid/arch/lifecycle/c$a;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/c$a;)V

    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    iget-object v0, p0, Landroid/arch/lifecycle/h;->a:Landroid/arch/lifecycle/h$a;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/h;->c(Landroid/arch/lifecycle/h$a;)V

    sget-object v0, Landroid/arch/lifecycle/c$a;->ON_RESUME:Landroid/arch/lifecycle/c$a;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/c$a;)V

    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onStart()V

    iget-object v0, p0, Landroid/arch/lifecycle/h;->a:Landroid/arch/lifecycle/h$a;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/h;->d(Landroid/arch/lifecycle/h$a;)V

    sget-object v0, Landroid/arch/lifecycle/c$a;->ON_START:Landroid/arch/lifecycle/c$a;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/c$a;)V

    return-void
.end method

.method public onStop()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onStop()V

    sget-object v0, Landroid/arch/lifecycle/c$a;->ON_STOP:Landroid/arch/lifecycle/c$a;

    invoke-direct {p0, v0}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/c$a;)V

    return-void
.end method
