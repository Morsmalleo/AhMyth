.class final Lc/g0/l/d$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ld/q;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/g0/l/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field a:I

.field b:J

.field c:Z

.field d:Z

.field final synthetic e:Lc/g0/l/d;


# direct methods
.method constructor <init>(Lc/g0/l/d;)V
    .locals 0

    iput-object p1, p0, Lc/g0/l/d$a;->e:Lc/g0/l/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public b()Ld/s;
    .locals 1

    iget-object v0, p0, Lc/g0/l/d$a;->e:Lc/g0/l/d;

    iget-object v0, v0, Lc/g0/l/d;->c:Ld/d;

    invoke-interface {v0}, Ld/q;->b()Ld/s;

    move-result-object v0

    return-object v0
.end method

.method public close()V
    .locals 7

    iget-boolean v0, p0, Lc/g0/l/d$a;->d:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lc/g0/l/d$a;->e:Lc/g0/l/d;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lc/g0/l/d$a;->e:Lc/g0/l/d;

    iget v2, p0, Lc/g0/l/d$a;->a:I

    iget-object v3, v1, Lc/g0/l/d;->e:Ld/c;

    invoke-virtual {v3}, Ld/c;->V()J

    move-result-wide v3

    iget-boolean v5, p0, Lc/g0/l/d$a;->c:Z

    const/4 v6, 0x1

    invoke-virtual/range {v1 .. v6}, Lc/g0/l/d;->d(IJZZ)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lc/g0/l/d$a;->d:Z

    iget-object v0, p0, Lc/g0/l/d$a;->e:Lc/g0/l/d;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lc/g0/l/d;->g:Z

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public flush()V
    .locals 7

    iget-boolean v0, p0, Lc/g0/l/d$a;->d:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lc/g0/l/d$a;->e:Lc/g0/l/d;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lc/g0/l/d$a;->e:Lc/g0/l/d;

    iget v2, p0, Lc/g0/l/d$a;->a:I

    iget-object v3, v1, Lc/g0/l/d;->e:Ld/c;

    invoke-virtual {v3}, Ld/c;->V()J

    move-result-wide v3

    iget-boolean v5, p0, Lc/g0/l/d$a;->c:Z

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lc/g0/l/d;->d(IJZZ)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lc/g0/l/d$a;->c:Z

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public l(Ld/c;J)V
    .locals 6

    iget-boolean v0, p0, Lc/g0/l/d$a;->d:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lc/g0/l/d$a;->e:Lc/g0/l/d;

    iget-object v0, v0, Lc/g0/l/d;->e:Ld/c;

    invoke-virtual {v0, p1, p2, p3}, Ld/c;->l(Ld/c;J)V

    iget-boolean p1, p0, Lc/g0/l/d$a;->c:Z

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    iget-wide v0, p0, Lc/g0/l/d$a;->b:J

    const-wide/16 v2, -0x1

    cmp-long p1, v0, v2

    if-eqz p1, :cond_0

    iget-object p1, p0, Lc/g0/l/d$a;->e:Lc/g0/l/d;

    iget-object p1, p1, Lc/g0/l/d;->e:Ld/c;

    invoke-virtual {p1}, Ld/c;->V()J

    move-result-wide v0

    iget-wide v2, p0, Lc/g0/l/d$a;->b:J

    const-wide/16 v4, 0x2000

    sub-long/2addr v2, v4

    cmp-long p1, v0, v2

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iget-object p3, p0, Lc/g0/l/d$a;->e:Lc/g0/l/d;

    iget-object p3, p3, Lc/g0/l/d;->e:Ld/c;

    invoke-virtual {p3}, Ld/c;->K()J

    move-result-wide v2

    const-wide/16 v0, 0x0

    cmp-long p3, v2, v0

    if-lez p3, :cond_1

    if-nez p1, :cond_1

    iget-object p1, p0, Lc/g0/l/d$a;->e:Lc/g0/l/d;

    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lc/g0/l/d$a;->e:Lc/g0/l/d;

    iget v1, p0, Lc/g0/l/d$a;->a:I

    iget-boolean v4, p0, Lc/g0/l/d$a;->c:Z

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lc/g0/l/d;->d(IJZZ)V

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iput-boolean p2, p0, Lc/g0/l/d$a;->c:Z

    goto :goto_1

    :catchall_0
    move-exception p2

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p2

    :cond_1
    :goto_1
    return-void

    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
