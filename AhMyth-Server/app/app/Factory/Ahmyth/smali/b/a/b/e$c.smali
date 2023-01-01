.class Lb/a/b/e$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/b/e;->G()Lb/a/b/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/b/e;


# direct methods
.method constructor <init>(Lb/a/b/e;)V
    .locals 0

    iput-object p1, p0, Lb/a/b/e$c;->a:Lb/a/b/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lb/a/b/e$c;->a:Lb/a/b/e;

    invoke-static {v0}, Lb/a/b/e;->n(Lb/a/b/e;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lb/a/b/e$c;->a:Lb/a/b/e;

    invoke-static {v0}, Lb/a/b/e;->o(Lb/a/b/e;)V

    iget-object v0, p0, Lb/a/b/e$c;->a:Lb/a/b/e;

    invoke-static {v0}, Lb/a/b/e;->p(Lb/a/b/e;)Lb/a/b/c;

    move-result-object v0

    invoke-virtual {v0}, Lb/a/b/c;->U()Lb/a/b/c;

    sget-object v0, Lb/a/b/c$p;->c:Lb/a/b/c$p;

    iget-object v1, p0, Lb/a/b/e$c;->a:Lb/a/b/e;

    invoke-static {v1}, Lb/a/b/e;->p(Lb/a/b/e;)Lb/a/b/c;

    move-result-object v1

    iget-object v1, v1, Lb/a/b/c;->b:Lb/a/b/c$p;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lb/a/b/e$c;->a:Lb/a/b/e;

    invoke-static {v0}, Lb/a/b/e;->h(Lb/a/b/e;)V

    :cond_1
    iget-object v0, p0, Lb/a/b/e$c;->a:Lb/a/b/e;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "connecting"

    invoke-virtual {v0, v2, v1}, Lb/a/b/e;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method
