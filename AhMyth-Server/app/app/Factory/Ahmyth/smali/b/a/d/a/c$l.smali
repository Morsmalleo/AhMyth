.class Lb/a/d/a/c$l;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/c;->R()Lb/a/d/a/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/d/a/c;


# direct methods
.method constructor <init>(Lb/a/d/a/c;)V
    .locals 0

    iput-object p1, p0, Lb/a/d/a/c$l;->a:Lb/a/d/a/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lb/a/d/a/c$l;->a:Lb/a/d/a/c;

    invoke-static {v0}, Lb/a/d/a/c;->t(Lb/a/d/a/c;)Z

    move-result v0

    const-string v1, "websocket"

    if-eqz v0, :cond_0

    invoke-static {}, Lb/a/d/a/c;->u()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lb/a/d/a/c$l;->a:Lb/a/d/a/c;

    invoke-static {v0}, Lb/a/d/a/c;->w(Lb/a/d/a/c;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lb/a/d/a/c$l;->a:Lb/a/d/a/c;

    invoke-static {v0}, Lb/a/d/a/c;->w(Lb/a/d/a/c;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lb/a/d/a/c$l;->a:Lb/a/d/a/c;

    new-instance v1, Lb/a/d/a/c$l$a;

    invoke-direct {v1, p0, v0}, Lb/a/d/a/c$l$a;-><init>(Lb/a/d/a/c$l;Lb/a/d/a/c;)V

    invoke-static {v1}, Lb/a/i/a;->j(Ljava/lang/Runnable;)V

    return-void

    :cond_1
    iget-object v0, p0, Lb/a/d/a/c$l;->a:Lb/a/d/a/c;

    invoke-static {v0}, Lb/a/d/a/c;->w(Lb/a/d/a/c;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    :goto_0
    iget-object v0, p0, Lb/a/d/a/c$l;->a:Lb/a/d/a/c;

    sget-object v2, Lb/a/d/a/c$v;->a:Lb/a/d/a/c$v;

    invoke-static {v0, v2}, Lb/a/d/a/c;->y(Lb/a/d/a/c;Lb/a/d/a/c$v;)Lb/a/d/a/c$v;

    iget-object v0, p0, Lb/a/d/a/c$l;->a:Lb/a/d/a/c;

    invoke-static {v0, v1}, Lb/a/d/a/c;->z(Lb/a/d/a/c;Ljava/lang/String;)Lb/a/d/a/d;

    move-result-object v0

    iget-object v1, p0, Lb/a/d/a/c$l;->a:Lb/a/d/a/c;

    invoke-static {v1, v0}, Lb/a/d/a/c;->A(Lb/a/d/a/c;Lb/a/d/a/d;)V

    invoke-virtual {v0}, Lb/a/d/a/d;->q()Lb/a/d/a/d;

    return-void
.end method
