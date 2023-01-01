.class final Lc/x;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lc/e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/x$a;
    }
.end annotation


# instance fields
.field final a:Lc/v;

.field final b:Lc/g0/g/j;

.field final c:Lc/y;

.field final d:Z

.field private e:Z


# direct methods
.method constructor <init>(Lc/v;Lc/y;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc/x;->a:Lc/v;

    iput-object p2, p0, Lc/x;->c:Lc/y;

    iput-boolean p3, p0, Lc/x;->d:Z

    new-instance p2, Lc/g0/g/j;

    invoke-direct {p2, p1, p3}, Lc/g0/g/j;-><init>(Lc/v;Z)V

    iput-object p2, p0, Lc/x;->b:Lc/g0/g/j;

    return-void
.end method

.method private b()V
    .locals 2

    invoke-static {}, Lc/g0/j/e;->h()Lc/g0/j/e;

    move-result-object v0

    const-string v1, "response.body().close()"

    invoke-virtual {v0, v1}, Lc/g0/j/e;->j(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lc/x;->b:Lc/g0/g/j;

    invoke-virtual {v1, v0}, Lc/g0/g/j;->i(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    iget-object v0, p0, Lc/x;->b:Lc/g0/g/j;

    invoke-virtual {v0}, Lc/g0/g/j;->b()V

    return-void
.end method

.method public c()Lc/x;
    .locals 4

    new-instance v0, Lc/x;

    iget-object v1, p0, Lc/x;->a:Lc/v;

    iget-object v2, p0, Lc/x;->c:Lc/y;

    iget-boolean v3, p0, Lc/x;->d:Z

    invoke-direct {v0, v1, v2, v3}, Lc/x;-><init>(Lc/v;Lc/y;Z)V

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lc/x;->c()Lc/x;

    move-result-object v0

    return-object v0
.end method

.method d()Lc/a0;
    .locals 9

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lc/x;->a:Lc/v;

    invoke-virtual {v0}, Lc/v;->m()Ljava/util/List;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lc/x;->b:Lc/g0/g/j;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lc/g0/g/a;

    iget-object v2, p0, Lc/x;->a:Lc/v;

    invoke-virtual {v2}, Lc/v;->g()Lc/m;

    move-result-object v2

    invoke-direct {v0, v2}, Lc/g0/g/a;-><init>(Lc/m;)V

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lc/g0/e/a;

    iget-object v2, p0, Lc/x;->a:Lc/v;

    invoke-virtual {v2}, Lc/v;->n()Lc/g0/e/d;

    move-result-object v2

    invoke-direct {v0, v2}, Lc/g0/e/a;-><init>(Lc/g0/e/d;)V

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lc/g0/f/a;

    iget-object v2, p0, Lc/x;->a:Lc/v;

    invoke-direct {v0, v2}, Lc/g0/f/a;-><init>(Lc/v;)V

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-boolean v0, p0, Lc/x;->d:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lc/x;->a:Lc/v;

    invoke-virtual {v0}, Lc/v;->o()Ljava/util/List;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    new-instance v0, Lc/g0/g/b;

    iget-boolean v2, p0, Lc/x;->d:Z

    invoke-direct {v0, v2}, Lc/g0/g/b;-><init>(Z)V

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v7, Lc/g0/g/g;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v8, p0, Lc/x;->c:Lc/y;

    move-object v0, v7

    move-object v6, v8

    invoke-direct/range {v0 .. v6}, Lc/g0/g/g;-><init>(Ljava/util/List;Lc/g0/f/g;Lc/g0/g/c;Lc/i;ILc/y;)V

    invoke-interface {v7, v8}, Lc/t$a;->b(Lc/y;)Lc/a0;

    move-result-object v0

    return-object v0
.end method

.method public e()Z
    .locals 1

    iget-object v0, p0, Lc/x;->b:Lc/g0/g/j;

    invoke-virtual {v0}, Lc/g0/g/j;->e()Z

    move-result v0

    return v0
.end method

.method f()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lc/x;->c:Lc/y;

    invoke-virtual {v0}, Lc/y;->h()Lc/s;

    move-result-object v0

    invoke-virtual {v0}, Lc/s;->A()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method g()Lc/g0/f/g;
    .locals 1

    iget-object v0, p0, Lc/x;->b:Lc/g0/g/j;

    invoke-virtual {v0}, Lc/g0/g/j;->j()Lc/g0/f/g;

    move-result-object v0

    return-object v0
.end method

.method h()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lc/x;->e()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "canceled "

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lc/x;->d:Z

    if-eqz v1, :cond_1

    const-string v1, "web socket"

    goto :goto_1

    :cond_1
    const-string v1, "call"

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lc/x;->f()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public y(Lc/f;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lc/x;->e:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lc/x;->e:Z

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Lc/x;->b()V

    iget-object v0, p0, Lc/x;->a:Lc/v;

    invoke-virtual {v0}, Lc/v;->h()Lc/o;

    move-result-object v0

    new-instance v1, Lc/x$a;

    invoke-direct {v1, p0, p1}, Lc/x$a;-><init>(Lc/x;Lc/f;)V

    invoke-virtual {v0, v1}, Lc/o;->a(Lc/x$a;)V

    return-void

    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Already Executed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
