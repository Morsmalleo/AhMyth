.class Landroid/arch/lifecycle/e$b;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/arch/lifecycle/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "b"
.end annotation


# instance fields
.field a:Landroid/arch/lifecycle/c$b;

.field b:Landroid/arch/lifecycle/GenericLifecycleObserver;


# virtual methods
.method a(Landroid/arch/lifecycle/d;Landroid/arch/lifecycle/c$a;)V
    .locals 2

    invoke-static {p2}, Landroid/arch/lifecycle/e;->d(Landroid/arch/lifecycle/c$a;)Landroid/arch/lifecycle/c$b;

    move-result-object v0

    iget-object v1, p0, Landroid/arch/lifecycle/e$b;->a:Landroid/arch/lifecycle/c$b;

    invoke-static {v1, v0}, Landroid/arch/lifecycle/e;->h(Landroid/arch/lifecycle/c$b;Landroid/arch/lifecycle/c$b;)Landroid/arch/lifecycle/c$b;

    move-result-object v1

    iput-object v1, p0, Landroid/arch/lifecycle/e$b;->a:Landroid/arch/lifecycle/c$b;

    iget-object v1, p0, Landroid/arch/lifecycle/e$b;->b:Landroid/arch/lifecycle/GenericLifecycleObserver;

    invoke-interface {v1, p1, p2}, Landroid/arch/lifecycle/GenericLifecycleObserver;->a(Landroid/arch/lifecycle/d;Landroid/arch/lifecycle/c$a;)V

    iput-object v0, p0, Landroid/arch/lifecycle/e$b;->a:Landroid/arch/lifecycle/c$b;

    return-void
.end method
