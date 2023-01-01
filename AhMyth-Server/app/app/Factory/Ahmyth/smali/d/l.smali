.class final Ld/l;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ld/d;


# instance fields
.field public final a:Ld/c;

.field public final b:Ld/q;

.field c:Z


# direct methods
.method constructor <init>(Ld/q;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ld/c;

    invoke-direct {v0}, Ld/c;-><init>()V

    iput-object v0, p0, Ld/l;->a:Ld/c;

    if-eqz p1, :cond_0

    iput-object p1, p0, Ld/l;->b:Ld/q;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "sink == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public A()Ld/d;
    .locals 5

    iget-boolean v0, p0, Ld/l;->c:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Ld/l;->a:Ld/c;

    invoke-virtual {v0}, Ld/c;->K()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    iget-object v2, p0, Ld/l;->b:Ld/q;

    iget-object v3, p0, Ld/l;->a:Ld/c;

    invoke-interface {v2, v3, v0, v1}, Ld/q;->l(Ld/c;J)V

    :cond_0
    return-object p0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public B(J)Ld/d;
    .locals 1

    iget-boolean v0, p0, Ld/l;->c:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Ld/l;->a:Ld/c;

    invoke-virtual {v0, p1, p2}, Ld/c;->e0(J)Ld/c;

    invoke-virtual {p0}, Ld/l;->A()Ld/d;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public E(J)Ld/d;
    .locals 1

    iget-boolean v0, p0, Ld/l;->c:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Ld/l;->a:Ld/c;

    invoke-virtual {v0, p1, p2}, Ld/c;->g0(J)Ld/c;

    invoke-virtual {p0}, Ld/l;->A()Ld/d;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public b()Ld/s;
    .locals 1

    iget-object v0, p0, Ld/l;->b:Ld/q;

    invoke-interface {v0}, Ld/q;->b()Ld/s;

    move-result-object v0

    return-object v0
.end method

.method public c()Ld/c;
    .locals 1

    iget-object v0, p0, Ld/l;->a:Ld/c;

    return-object v0
.end method

.method public close()V
    .locals 7

    iget-boolean v0, p0, Ld/l;->c:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Ld/l;->a:Ld/c;

    iget-wide v2, v1, Ld/c;->b:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_1

    iget-object v4, p0, Ld/l;->b:Ld/q;

    invoke-interface {v4, v1, v2, v3}, Ld/q;->l(Ld/c;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    move-object v1, v0

    goto :goto_0

    :catchall_0
    move-exception v1

    :goto_0
    :try_start_1
    iget-object v2, p0, Ld/l;->b:Ld/q;

    invoke-interface {v2}, Ld/q;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    if-nez v1, :cond_2

    move-object v1, v2

    :cond_2
    :goto_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Ld/l;->c:Z

    if-nez v1, :cond_3

    return-void

    :cond_3
    invoke-static {v1}, Ld/t;->e(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public e(Ljava/lang/String;)Ld/d;
    .locals 1

    iget-boolean v0, p0, Ld/l;->c:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Ld/l;->a:Ld/c;

    invoke-virtual {v0, p1}, Ld/c;->i0(Ljava/lang/String;)Ld/c;

    invoke-virtual {p0}, Ld/l;->A()Ld/d;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public f([B)Ld/d;
    .locals 1

    iget-boolean v0, p0, Ld/l;->c:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Ld/l;->a:Ld/c;

    invoke-virtual {v0, p1}, Ld/c;->a0([B)Ld/c;

    invoke-virtual {p0}, Ld/l;->A()Ld/d;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public flush()V
    .locals 6

    iget-boolean v0, p0, Ld/l;->c:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Ld/l;->a:Ld/c;

    iget-wide v1, v0, Ld/c;->b:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    iget-object v3, p0, Ld/l;->b:Ld/q;

    invoke-interface {v3, v0, v1, v2}, Ld/q;->l(Ld/c;J)V

    :cond_0
    iget-object v0, p0, Ld/l;->b:Ld/q;

    invoke-interface {v0}, Ld/q;->flush()V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public g(I)Ld/d;
    .locals 1

    iget-boolean v0, p0, Ld/l;->c:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Ld/l;->a:Ld/c;

    invoke-virtual {v0, p1}, Ld/c;->f0(I)Ld/c;

    invoke-virtual {p0}, Ld/l;->A()Ld/d;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public i([BII)Ld/d;
    .locals 1

    iget-boolean v0, p0, Ld/l;->c:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Ld/l;->a:Ld/c;

    invoke-virtual {v0, p1, p2, p3}, Ld/c;->b0([BII)Ld/c;

    invoke-virtual {p0}, Ld/l;->A()Ld/d;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public l(Ld/c;J)V
    .locals 1

    iget-boolean v0, p0, Ld/l;->c:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Ld/l;->a:Ld/c;

    invoke-virtual {v0, p1, p2, p3}, Ld/c;->l(Ld/c;J)V

    invoke-virtual {p0}, Ld/l;->A()Ld/d;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public m(I)Ld/d;
    .locals 1

    iget-boolean v0, p0, Ld/l;->c:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Ld/l;->a:Ld/c;

    invoke-virtual {v0, p1}, Ld/c;->d0(I)Ld/c;

    invoke-virtual {p0}, Ld/l;->A()Ld/d;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public n(Ld/f;)Ld/d;
    .locals 1

    iget-boolean v0, p0, Ld/l;->c:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Ld/l;->a:Ld/c;

    invoke-virtual {v0, p1}, Ld/c;->Z(Ld/f;)Ld/c;

    invoke-virtual {p0}, Ld/l;->A()Ld/d;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public p()Ld/d;
    .locals 5

    iget-boolean v0, p0, Ld/l;->c:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Ld/l;->a:Ld/c;

    invoke-virtual {v0}, Ld/c;->V()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    iget-object v2, p0, Ld/l;->b:Ld/q;

    iget-object v3, p0, Ld/l;->a:Ld/c;

    invoke-interface {v2, v3, v0, v1}, Ld/q;->l(Ld/c;J)V

    :cond_0
    return-object p0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "buffer("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ld/l;->b:Ld/q;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public w(I)Ld/d;
    .locals 1

    iget-boolean v0, p0, Ld/l;->c:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Ld/l;->a:Ld/c;

    invoke-virtual {v0, p1}, Ld/c;->h0(I)Ld/c;

    invoke-virtual {p0}, Ld/l;->A()Ld/d;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
