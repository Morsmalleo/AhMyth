.class public final Lc/g0/i/i;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/g0/i/i$c;,
        Lc/g0/i/i$a;,
        Lc/g0/i/i$b;
    }
.end annotation


# instance fields
.field a:J

.field b:J

.field final c:I

.field final d:Lc/g0/i/g;

.field private e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/g0/i/c;",
            ">;"
        }
    .end annotation
.end field

.field private final f:Lc/g0/i/i$b;

.field final g:Lc/g0/i/i$a;

.field final h:Lc/g0/i/i$c;

.field final i:Lc/g0/i/i$c;

.field j:Lc/g0/i/b;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(ILc/g0/i/g;ZZLjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lc/g0/i/g;",
            "ZZ",
            "Ljava/util/List<",
            "Lc/g0/i/c;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lc/g0/i/i;->a:J

    new-instance v0, Lc/g0/i/i$c;

    invoke-direct {v0, p0}, Lc/g0/i/i$c;-><init>(Lc/g0/i/i;)V

    iput-object v0, p0, Lc/g0/i/i;->h:Lc/g0/i/i$c;

    new-instance v0, Lc/g0/i/i$c;

    invoke-direct {v0, p0}, Lc/g0/i/i$c;-><init>(Lc/g0/i/i;)V

    iput-object v0, p0, Lc/g0/i/i;->i:Lc/g0/i/i$c;

    const/4 v0, 0x0

    iput-object v0, p0, Lc/g0/i/i;->j:Lc/g0/i/b;

    if-eqz p2, :cond_1

    if-eqz p5, :cond_0

    iput p1, p0, Lc/g0/i/i;->c:I

    iput-object p2, p0, Lc/g0/i/i;->d:Lc/g0/i/g;

    iget-object p1, p2, Lc/g0/i/g;->n:Lc/g0/i/n;

    invoke-virtual {p1}, Lc/g0/i/n;->d()I

    move-result p1

    int-to-long v0, p1

    iput-wide v0, p0, Lc/g0/i/i;->b:J

    new-instance p1, Lc/g0/i/i$b;

    iget-object p2, p2, Lc/g0/i/g;->m:Lc/g0/i/n;

    invoke-virtual {p2}, Lc/g0/i/n;->d()I

    move-result p2

    int-to-long v0, p2

    invoke-direct {p1, p0, v0, v1}, Lc/g0/i/i$b;-><init>(Lc/g0/i/i;J)V

    iput-object p1, p0, Lc/g0/i/i;->f:Lc/g0/i/i$b;

    new-instance p2, Lc/g0/i/i$a;

    invoke-direct {p2, p0}, Lc/g0/i/i$a;-><init>(Lc/g0/i/i;)V

    iput-object p2, p0, Lc/g0/i/i;->g:Lc/g0/i/i$a;

    iput-boolean p4, p1, Lc/g0/i/i$b;->e:Z

    iput-boolean p3, p2, Lc/g0/i/i$a;->c:Z

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "requestHeaders == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "connection == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private e(Lc/g0/i/b;)Z
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lc/g0/i/i;->j:Lc/g0/i/b;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    iget-object v0, p0, Lc/g0/i/i;->f:Lc/g0/i/i$b;

    iget-boolean v0, v0, Lc/g0/i/i$b;->e:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lc/g0/i/i;->g:Lc/g0/i/i$a;

    iget-boolean v0, v0, Lc/g0/i/i$a;->c:Z

    if-eqz v0, :cond_1

    monitor-exit p0

    return v1

    :cond_1
    iput-object p1, p0, Lc/g0/i/i;->j:Lc/g0/i/b;

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lc/g0/i/i;->d:Lc/g0/i/g;

    iget v0, p0, Lc/g0/i/i;->c:I

    invoke-virtual {p1, v0}, Lc/g0/i/g;->T(I)Lc/g0/i/i;

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method


# virtual methods
.method a(J)V
    .locals 3

    iget-wide v0, p0, Lc/g0/i/i;->b:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lc/g0/i/i;->b:J

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    :cond_0
    return-void
.end method

.method b()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lc/g0/i/i;->f:Lc/g0/i/i$b;

    iget-boolean v1, v0, Lc/g0/i/i$b;->e:Z

    if-nez v1, :cond_1

    iget-boolean v0, v0, Lc/g0/i/i$b;->d:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lc/g0/i/i;->g:Lc/g0/i/i$a;

    iget-boolean v1, v0, Lc/g0/i/i$a;->c:Z

    if-nez v1, :cond_0

    iget-boolean v0, v0, Lc/g0/i/i$a;->b:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Lc/g0/i/i;->l()Z

    move-result v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_2

    sget-object v0, Lc/g0/i/b;->g:Lc/g0/i/b;

    invoke-virtual {p0, v0}, Lc/g0/i/i;->d(Lc/g0/i/b;)V

    goto :goto_1

    :cond_2
    if-nez v1, :cond_3

    iget-object v0, p0, Lc/g0/i/i;->d:Lc/g0/i/g;

    iget v1, p0, Lc/g0/i/i;->c:I

    invoke-virtual {v0, v1}, Lc/g0/i/g;->T(I)Lc/g0/i/i;

    :cond_3
    :goto_1
    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method c()V
    .locals 2

    iget-object v0, p0, Lc/g0/i/i;->g:Lc/g0/i/i$a;

    iget-boolean v1, v0, Lc/g0/i/i$a;->b:Z

    if-nez v1, :cond_2

    iget-boolean v0, v0, Lc/g0/i/i$a;->c:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lc/g0/i/i;->j:Lc/g0/i/b;

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lc/g0/i/o;

    iget-object v1, p0, Lc/g0/i/i;->j:Lc/g0/i/b;

    invoke-direct {v0, v1}, Lc/g0/i/o;-><init>(Lc/g0/i/b;)V

    throw v0

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream finished"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public d(Lc/g0/i/b;)V
    .locals 2

    invoke-direct {p0, p1}, Lc/g0/i/i;->e(Lc/g0/i/b;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lc/g0/i/i;->d:Lc/g0/i/g;

    iget v1, p0, Lc/g0/i/i;->c:I

    invoke-virtual {v0, v1, p1}, Lc/g0/i/g;->a0(ILc/g0/i/b;)V

    return-void
.end method

.method public f(Lc/g0/i/b;)V
    .locals 2

    invoke-direct {p0, p1}, Lc/g0/i/i;->e(Lc/g0/i/b;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lc/g0/i/i;->d:Lc/g0/i/g;

    iget v1, p0, Lc/g0/i/i;->c:I

    invoke-virtual {v0, v1, p1}, Lc/g0/i/g;->b0(ILc/g0/i/b;)V

    return-void
.end method

.method public g()I
    .locals 1

    iget v0, p0, Lc/g0/i/i;->c:I

    return v0
.end method

.method public declared-synchronized h()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lc/g0/i/c;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lc/g0/i/i;->h:Lc/g0/i/i$c;

    invoke-virtual {v0}, Ld/a;->m()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :goto_0
    :try_start_1
    iget-object v0, p0, Lc/g0/i/i;->e:Ljava/util/List;

    if-nez v0, :cond_0

    iget-object v0, p0, Lc/g0/i/i;->j:Lc/g0/i/b;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lc/g0/i/i;->r()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :cond_0
    :try_start_2
    iget-object v0, p0, Lc/g0/i/i;->h:Lc/g0/i/i$c;

    invoke-virtual {v0}, Lc/g0/i/i$c;->w()V

    iget-object v0, p0, Lc/g0/i/i;->e:Ljava/util/List;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v0, :cond_1

    monitor-exit p0

    return-object v0

    :cond_1
    :try_start_3
    new-instance v0, Lc/g0/i/o;

    iget-object v1, p0, Lc/g0/i/i;->j:Lc/g0/i/b;

    invoke-direct {v0, v1}, Lc/g0/i/o;-><init>(Lc/g0/i/b;)V

    throw v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lc/g0/i/i;->h:Lc/g0/i/i$c;

    invoke-virtual {v1}, Lc/g0/i/i$c;->w()V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v0

    monitor-exit p0

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public i()Ld/q;
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lc/g0/i/i;->e:Ljava/util/List;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lc/g0/i/i;->k()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "reply before requesting the sink"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lc/g0/i/i;->g:Lc/g0/i/i$a;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public j()Ld/r;
    .locals 1

    iget-object v0, p0, Lc/g0/i/i;->f:Lc/g0/i/i$b;

    return-object v0
.end method

.method public k()Z
    .locals 4

    iget v0, p0, Lc/g0/i/i;->c:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v3, p0, Lc/g0/i/i;->d:Lc/g0/i/g;

    iget-boolean v3, v3, Lc/g0/i/g;->a:Z

    if-ne v3, v0, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    return v1
.end method

.method public declared-synchronized l()Z
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lc/g0/i/i;->j:Lc/g0/i/b;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lc/g0/i/i;->f:Lc/g0/i/i$b;

    iget-boolean v2, v0, Lc/g0/i/i$b;->e:Z

    if-nez v2, :cond_1

    iget-boolean v0, v0, Lc/g0/i/i$b;->d:Z

    if-eqz v0, :cond_3

    :cond_1
    iget-object v0, p0, Lc/g0/i/i;->g:Lc/g0/i/i$a;

    iget-boolean v2, v0, Lc/g0/i/i$a;->c:Z

    if-nez v2, :cond_2

    iget-boolean v0, v0, Lc/g0/i/i$a;->b:Z

    if-eqz v0, :cond_3

    :cond_2
    iget-object v0, p0, Lc/g0/i/i;->e:Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_3

    monitor-exit p0

    return v1

    :cond_3
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public m()Ld/s;
    .locals 1

    iget-object v0, p0, Lc/g0/i/i;->h:Lc/g0/i/i$c;

    return-object v0
.end method

.method n(Ld/e;I)V
    .locals 3

    iget-object v0, p0, Lc/g0/i/i;->f:Lc/g0/i/i$b;

    int-to-long v1, p2

    invoke-virtual {v0, p1, v1, v2}, Lc/g0/i/i$b;->y(Ld/e;J)V

    return-void
.end method

.method o()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lc/g0/i/i;->f:Lc/g0/i/i$b;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lc/g0/i/i$b;->e:Z

    invoke-virtual {p0}, Lc/g0/i/i;->l()Z

    move-result v0

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    iget-object v0, p0, Lc/g0/i/i;->d:Lc/g0/i/g;

    iget v1, p0, Lc/g0/i/i;->c:I

    invoke-virtual {v0, v1}, Lc/g0/i/g;->T(I)Lc/g0/i/i;

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method p(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lc/g0/i/c;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lc/g0/i/i;->e:Ljava/util/List;

    if-nez v1, :cond_0

    iput-object p1, p0, Lc/g0/i/i;->e:Ljava/util/List;

    invoke-virtual {p0}, Lc/g0/i/i;->l()Z

    move-result v0

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Lc/g0/i/i;->e:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iput-object v1, p0, Lc/g0/i/i;->e:Ljava/util/List;

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    iget-object p1, p0, Lc/g0/i/i;->d:Lc/g0/i/g;

    iget v0, p0, Lc/g0/i/i;->c:I

    invoke-virtual {p1, v0}, Lc/g0/i/g;->T(I)Lc/g0/i/i;

    :cond_1
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method declared-synchronized q(Lc/g0/i/b;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lc/g0/i/i;->j:Lc/g0/i/b;

    if-nez v0, :cond_0

    iput-object p1, p0, Lc/g0/i/i;->j:Lc/g0/i/b;

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method r()V
    .locals 1

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    throw v0
.end method

.method public s()Ld/s;
    .locals 1

    iget-object v0, p0, Lc/g0/i/i;->i:Lc/g0/i/i$c;

    return-object v0
.end method
