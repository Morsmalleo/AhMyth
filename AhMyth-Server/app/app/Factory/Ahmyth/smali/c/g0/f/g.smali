.class public final Lc/g0/f/g;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/g0/f/g$a;
    }
.end annotation


# instance fields
.field public final a:Lc/a;

.field private b:Lc/c0;

.field private final c:Lc/j;

.field private final d:Ljava/lang/Object;

.field private final e:Lc/g0/f/f;

.field private f:I

.field private g:Lc/g0/f/c;

.field private h:Z

.field private i:Z

.field private j:Lc/g0/g/c;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lc/j;Lc/a;Ljava/lang/Object;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc/g0/f/g;->c:Lc/j;

    iput-object p2, p0, Lc/g0/f/g;->a:Lc/a;

    new-instance p1, Lc/g0/f/f;

    invoke-direct {p0}, Lc/g0/f/g;->m()Lc/g0/f/d;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Lc/g0/f/f;-><init>(Lc/a;Lc/g0/f/d;)V

    iput-object p1, p0, Lc/g0/f/g;->e:Lc/g0/f/f;

    iput-object p3, p0, Lc/g0/f/g;->d:Ljava/lang/Object;

    return-void
.end method

.method private e(ZZZ)V
    .locals 2

    iget-object v0, p0, Lc/g0/f/g;->c:Lc/j;

    monitor-enter v0

    const/4 v1, 0x0

    if-eqz p3, :cond_0

    :try_start_0
    iput-object v1, p0, Lc/g0/f/g;->j:Lc/g0/g/c;

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :cond_0
    :goto_0
    const/4 p3, 0x1

    if-eqz p2, :cond_1

    iput-boolean p3, p0, Lc/g0/f/g;->h:Z

    :cond_1
    iget-object p2, p0, Lc/g0/f/g;->g:Lc/g0/f/c;

    if-eqz p2, :cond_5

    if-eqz p1, :cond_2

    iput-boolean p3, p2, Lc/g0/f/c;->m:Z

    :cond_2
    iget-object p1, p0, Lc/g0/f/g;->j:Lc/g0/g/c;

    if-nez p1, :cond_5

    iget-boolean p1, p0, Lc/g0/f/g;->h:Z

    if-nez p1, :cond_3

    iget-boolean p1, p2, Lc/g0/f/c;->m:Z

    if-eqz p1, :cond_5

    :cond_3
    invoke-direct {p0, p2}, Lc/g0/f/g;->l(Lc/g0/f/c;)V

    iget-object p1, p0, Lc/g0/f/g;->g:Lc/g0/f/c;

    iget-object p1, p1, Lc/g0/f/c;->l:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lc/g0/f/g;->g:Lc/g0/f/c;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide p2

    iput-wide p2, p1, Lc/g0/f/c;->n:J

    sget-object p1, Lc/g0/a;->a:Lc/g0/a;

    iget-object p2, p0, Lc/g0/f/g;->c:Lc/j;

    iget-object p3, p0, Lc/g0/f/g;->g:Lc/g0/f/c;

    invoke-virtual {p1, p2, p3}, Lc/g0/a;->d(Lc/j;Lc/g0/f/c;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lc/g0/f/g;->g:Lc/g0/f/c;

    goto :goto_1

    :cond_4
    move-object p1, v1

    :goto_1
    iput-object v1, p0, Lc/g0/f/g;->g:Lc/g0/f/c;

    move-object v1, p1

    :cond_5
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_6

    invoke-virtual {v1}, Lc/g0/f/c;->p()Ljava/net/Socket;

    move-result-object p1

    invoke-static {p1}, Lc/g0/c;->c(Ljava/net/Socket;)V

    :cond_6
    return-void

    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private f(IIIZ)Lc/g0/f/c;
    .locals 8

    iget-object v0, p0, Lc/g0/f/g;->c:Lc/j;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lc/g0/f/g;->h:Z

    if-nez v1, :cond_6

    iget-object v1, p0, Lc/g0/f/g;->j:Lc/g0/g/c;

    if-nez v1, :cond_5

    iget-boolean v1, p0, Lc/g0/f/g;->i:Z

    if-nez v1, :cond_4

    iget-object v1, p0, Lc/g0/f/g;->g:Lc/g0/f/c;

    if-eqz v1, :cond_0

    iget-boolean v2, v1, Lc/g0/f/c;->m:Z

    if-nez v2, :cond_0

    monitor-exit v0

    return-object v1

    :cond_0
    sget-object v1, Lc/g0/a;->a:Lc/g0/a;

    iget-object v2, p0, Lc/g0/f/g;->c:Lc/j;

    iget-object v3, p0, Lc/g0/f/g;->a:Lc/a;

    invoke-virtual {v1, v2, v3, p0}, Lc/g0/a;->e(Lc/j;Lc/a;Lc/g0/f/g;)Lc/g0/f/c;

    move-result-object v1

    if-eqz v1, :cond_1

    iput-object v1, p0, Lc/g0/f/g;->g:Lc/g0/f/c;

    monitor-exit v0

    return-object v1

    :cond_1
    iget-object v1, p0, Lc/g0/f/g;->b:Lc/c0;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-nez v1, :cond_2

    iget-object v0, p0, Lc/g0/f/g;->e:Lc/g0/f/f;

    invoke-virtual {v0}, Lc/g0/f/f;->g()Lc/c0;

    move-result-object v1

    iget-object v0, p0, Lc/g0/f/g;->c:Lc/j;

    monitor-enter v0

    :try_start_1
    iput-object v1, p0, Lc/g0/f/g;->b:Lc/c0;

    const/4 v2, 0x0

    iput v2, p0, Lc/g0/f/g;->f:I

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_2
    :goto_0
    new-instance v0, Lc/g0/f/c;

    invoke-direct {v0, v1}, Lc/g0/f/c;-><init>(Lc/c0;)V

    iget-object v1, p0, Lc/g0/f/g;->c:Lc/j;

    monitor-enter v1

    :try_start_2
    invoke-virtual {p0, v0}, Lc/g0/f/g;->a(Lc/g0/f/c;)V

    sget-object v2, Lc/g0/a;->a:Lc/g0/a;

    iget-object v3, p0, Lc/g0/f/g;->c:Lc/j;

    invoke-virtual {v2, v3, v0}, Lc/g0/a;->g(Lc/j;Lc/g0/f/c;)V

    iput-object v0, p0, Lc/g0/f/g;->g:Lc/g0/f/c;

    iget-boolean v2, p0, Lc/g0/f/g;->i:Z

    if-nez v2, :cond_3

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    iget-object v1, p0, Lc/g0/f/g;->a:Lc/a;

    invoke-virtual {v1}, Lc/a;->b()Ljava/util/List;

    move-result-object v6

    move-object v2, v0

    move v3, p1

    move v4, p2

    move v5, p3

    move v7, p4

    invoke-virtual/range {v2 .. v7}, Lc/g0/f/c;->g(IIILjava/util/List;Z)V

    invoke-direct {p0}, Lc/g0/f/g;->m()Lc/g0/f/d;

    move-result-object p1

    invoke-virtual {v0}, Lc/g0/f/c;->a()Lc/c0;

    move-result-object p2

    invoke-virtual {p1, p2}, Lc/g0/f/d;->a(Lc/c0;)V

    return-object v0

    :cond_3
    :try_start_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Canceled"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_1
    move-exception p1

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1

    :cond_4
    :try_start_4
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Canceled"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "codec != null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "released"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_2
    move-exception p1

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw p1
.end method

.method private g(IIIZZ)Lc/g0/f/c;
    .locals 3

    :goto_0
    invoke-direct {p0, p1, p2, p3, p4}, Lc/g0/f/g;->f(IIIZ)Lc/g0/f/c;

    move-result-object v0

    iget-object v1, p0, Lc/g0/f/g;->c:Lc/j;

    monitor-enter v1

    :try_start_0
    iget v2, v0, Lc/g0/f/c;->h:I

    if-nez v2, :cond_0

    monitor-exit v1

    return-object v0

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v0, p5}, Lc/g0/f/c;->n(Z)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lc/g0/f/g;->j()V

    goto :goto_0

    :cond_1
    return-object v0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method private l(Lc/g0/f/c;)V
    .locals 3

    iget-object v0, p1, Lc/g0/f/c;->l:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    iget-object v2, p1, Lc/g0/f/c;->l:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/Reference;

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p0, :cond_0

    iget-object p1, p1, Lc/g0/f/c;->l:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    return-void

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method private m()Lc/g0/f/d;
    .locals 2

    sget-object v0, Lc/g0/a;->a:Lc/g0/a;

    iget-object v1, p0, Lc/g0/f/g;->c:Lc/j;

    invoke-virtual {v0, v1}, Lc/g0/a;->h(Lc/j;)Lc/g0/f/d;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public a(Lc/g0/f/c;)V
    .locals 2

    iget-object p1, p1, Lc/g0/f/c;->l:Ljava/util/List;

    new-instance v0, Lc/g0/f/g$a;

    iget-object v1, p0, Lc/g0/f/g;->d:Ljava/lang/Object;

    invoke-direct {v0, p0, v1}, Lc/g0/f/g$a;-><init>(Lc/g0/f/g;Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public b()V
    .locals 3

    iget-object v0, p0, Lc/g0/f/g;->c:Lc/j;

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lc/g0/f/g;->i:Z

    iget-object v1, p0, Lc/g0/f/g;->j:Lc/g0/g/c;

    iget-object v2, p0, Lc/g0/f/g;->g:Lc/g0/f/c;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lc/g0/g/c;->a()V

    goto :goto_0

    :cond_0
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lc/g0/f/c;->f()V

    :cond_1
    :goto_0
    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public c()Lc/g0/g/c;
    .locals 2

    iget-object v0, p0, Lc/g0/f/g;->c:Lc/j;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lc/g0/f/g;->j:Lc/g0/g/c;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public declared-synchronized d()Lc/g0/f/c;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lc/g0/f/g;->g:Lc/g0/f/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public h()Z
    .locals 1

    iget-object v0, p0, Lc/g0/f/g;->b:Lc/c0;

    if-nez v0, :cond_1

    iget-object v0, p0, Lc/g0/f/g;->e:Lc/g0/f/f;

    invoke-virtual {v0}, Lc/g0/f/f;->c()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public i(Lc/v;Z)Lc/g0/g/c;
    .locals 8

    invoke-virtual {p1}, Lc/v;->d()I

    move-result v1

    invoke-virtual {p1}, Lc/v;->w()I

    move-result v6

    invoke-virtual {p1}, Lc/v;->D()I

    move-result v7

    invoke-virtual {p1}, Lc/v;->x()Z

    move-result v4

    move-object v0, p0

    move v2, v6

    move v3, v7

    move v5, p2

    :try_start_0
    invoke-direct/range {v0 .. v5}, Lc/g0/f/g;->g(IIIZZ)Lc/g0/f/c;

    move-result-object p2

    iget-object v0, p2, Lc/g0/f/c;->g:Lc/g0/i/g;

    if-eqz v0, :cond_0

    new-instance v0, Lc/g0/i/f;

    iget-object p2, p2, Lc/g0/f/c;->g:Lc/g0/i/g;

    invoke-direct {v0, p1, p0, p2}, Lc/g0/i/f;-><init>(Lc/v;Lc/g0/f/g;Lc/g0/i/g;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lc/g0/f/c;->p()Ljava/net/Socket;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/net/Socket;->setSoTimeout(I)V

    iget-object v0, p2, Lc/g0/f/c;->i:Ld/e;

    invoke-interface {v0}, Ld/r;->b()Ld/s;

    move-result-object v0

    int-to-long v1, v6

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Ld/s;->g(JLjava/util/concurrent/TimeUnit;)Ld/s;

    iget-object v0, p2, Lc/g0/f/c;->j:Ld/d;

    invoke-interface {v0}, Ld/q;->b()Ld/s;

    move-result-object v0

    int-to-long v1, v7

    invoke-virtual {v0, v1, v2, v3}, Ld/s;->g(JLjava/util/concurrent/TimeUnit;)Ld/s;

    new-instance v0, Lc/g0/h/a;

    iget-object v1, p2, Lc/g0/f/c;->i:Ld/e;

    iget-object p2, p2, Lc/g0/f/c;->j:Ld/d;

    invoke-direct {v0, p1, p0, v1, p2}, Lc/g0/h/a;-><init>(Lc/v;Lc/g0/f/g;Ld/e;Ld/d;)V

    :goto_0
    iget-object p1, p0, Lc/g0/f/g;->c:Lc/j;

    monitor-enter p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iput-object v0, p0, Lc/g0/f/g;->j:Lc/g0/g/c;

    monitor-exit p1

    return-object v0

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p2
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p1

    new-instance p2, Lc/g0/f/e;

    invoke-direct {p2, p1}, Lc/g0/f/e;-><init>(Ljava/io/IOException;)V

    throw p2
.end method

.method public j()V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, v1}, Lc/g0/f/g;->e(ZZZ)V

    return-void
.end method

.method public k()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v0}, Lc/g0/f/g;->e(ZZZ)V

    return-void
.end method

.method public n(Ljava/io/IOException;)V
    .locals 6

    iget-object v0, p0, Lc/g0/f/g;->c:Lc/j;

    monitor-enter v0

    :try_start_0
    instance-of v1, p1, Lc/g0/i/o;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v1, :cond_1

    check-cast p1, Lc/g0/i/o;

    iget-object p1, p1, Lc/g0/i/o;->a:Lc/g0/i/b;

    sget-object v1, Lc/g0/i/b;->f:Lc/g0/i/b;

    if-ne p1, v1, :cond_0

    iget v5, p0, Lc/g0/f/g;->f:I

    add-int/2addr v5, v4

    iput v5, p0, Lc/g0/f/g;->f:I

    :cond_0
    if-ne p1, v1, :cond_4

    iget p1, p0, Lc/g0/f/g;->f:I

    if-le p1, v4, :cond_6

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lc/g0/f/g;->g:Lc/g0/f/c;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lc/g0/f/c;->o()Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    instance-of v1, p1, Lc/g0/i/a;

    if-eqz v1, :cond_6

    :cond_3
    iget-object v1, p0, Lc/g0/f/g;->g:Lc/g0/f/c;

    iget v1, v1, Lc/g0/f/c;->h:I

    if-nez v1, :cond_5

    iget-object v1, p0, Lc/g0/f/g;->b:Lc/c0;

    if-eqz v1, :cond_4

    if-eqz p1, :cond_4

    iget-object v5, p0, Lc/g0/f/g;->e:Lc/g0/f/f;

    invoke-virtual {v5, v1, p1}, Lc/g0/f/f;->a(Lc/c0;Ljava/io/IOException;)V

    :cond_4
    :goto_0
    iput-object v2, p0, Lc/g0/f/g;->b:Lc/c0;

    :cond_5
    const/4 p1, 0x1

    goto :goto_1

    :cond_6
    const/4 p1, 0x0

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0, p1, v3, v4}, Lc/g0/f/g;->e(ZZZ)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public o(ZLc/g0/g/c;)V
    .locals 3

    iget-object v0, p0, Lc/g0/f/g;->c:Lc/j;

    monitor-enter v0

    if-eqz p2, :cond_1

    :try_start_0
    iget-object v1, p0, Lc/g0/f/g;->j:Lc/g0/g/c;

    if-ne p2, v1, :cond_1

    const/4 p2, 0x1

    if-nez p1, :cond_0

    iget-object v1, p0, Lc/g0/f/g;->g:Lc/g0/f/c;

    iget v2, v1, Lc/g0/f/c;->h:I

    add-int/2addr v2, p2

    iput v2, v1, Lc/g0/f/c;->h:I

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lc/g0/f/g;->e(ZZZ)V

    return-void

    :cond_1
    :try_start_1
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "expected "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lc/g0/f/g;->j:Lc/g0/g/c;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " but was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lc/g0/f/g;->a:Lc/a;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
