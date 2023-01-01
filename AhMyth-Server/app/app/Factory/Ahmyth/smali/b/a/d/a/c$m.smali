.class Lb/a/d/a/c$m;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/c;->D()Lb/a/d/a/c;
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

    iput-object p1, p0, Lb/a/d/a/c$m;->a:Lb/a/d/a/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lb/a/d/a/c$m;->a:Lb/a/d/a/c;

    invoke-static {v0}, Lb/a/d/a/c;->x(Lb/a/d/a/c;)Lb/a/d/a/c$v;

    move-result-object v0

    sget-object v1, Lb/a/d/a/c$v;->a:Lb/a/d/a/c$v;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lb/a/d/a/c$m;->a:Lb/a/d/a/c;

    invoke-static {v0}, Lb/a/d/a/c;->x(Lb/a/d/a/c;)Lb/a/d/a/c$v;

    move-result-object v0

    sget-object v1, Lb/a/d/a/c$v;->b:Lb/a/d/a/c$v;

    if-ne v0, v1, :cond_3

    :cond_0
    iget-object v0, p0, Lb/a/d/a/c$m;->a:Lb/a/d/a/c;

    sget-object v1, Lb/a/d/a/c$v;->c:Lb/a/d/a/c$v;

    invoke-static {v0, v1}, Lb/a/d/a/c;->y(Lb/a/d/a/c;Lb/a/d/a/c$v;)Lb/a/d/a/c$v;

    iget-object v0, p0, Lb/a/d/a/c$m;->a:Lb/a/d/a/c;

    new-instance v1, Lb/a/d/a/c$m$a;

    invoke-direct {v1, p0, v0}, Lb/a/d/a/c$m$a;-><init>(Lb/a/d/a/c$m;Lb/a/d/a/c;)V

    const/4 v2, 0x1

    new-array v2, v2, [Lb/a/c/a$a;

    const/4 v3, 0x0

    new-instance v4, Lb/a/d/a/c$m$b;

    invoke-direct {v4, p0, v0, v2, v1}, Lb/a/d/a/c$m$b;-><init>(Lb/a/d/a/c$m;Lb/a/d/a/c;[Lb/a/c/a$a;Ljava/lang/Runnable;)V

    aput-object v4, v2, v3

    new-instance v3, Lb/a/d/a/c$m$c;

    invoke-direct {v3, p0, v0, v2}, Lb/a/d/a/c$m$c;-><init>(Lb/a/d/a/c$m;Lb/a/d/a/c;[Lb/a/c/a$a;)V

    iget-object v0, v0, Lb/a/d/a/c;->s:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lb/a/d/a/c$m;->a:Lb/a/d/a/c;

    new-instance v2, Lb/a/d/a/c$m$d;

    invoke-direct {v2, p0, v3, v1}, Lb/a/d/a/c$m$d;-><init>(Lb/a/d/a/c$m;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    const-string v1, "drain"

    invoke-virtual {v0, v1, v2}, Lb/a/c/a;->f(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lb/a/d/a/c$m;->a:Lb/a/d/a/c;

    invoke-static {v0}, Lb/a/d/a/c;->l(Lb/a/d/a/c;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_2
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    :cond_3
    :goto_0
    return-void
.end method
