.class final Ld/m;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ld/e;


# instance fields
.field public final a:Ld/c;

.field public final b:Ld/r;

.field c:Z


# direct methods
.method constructor <init>(Ld/r;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ld/c;

    invoke-direct {v0}, Ld/c;-><init>()V

    iput-object v0, p0, Ld/m;->a:Ld/c;

    if-eqz p1, :cond_0

    iput-object p1, p0, Ld/m;->b:Ld/r;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "source == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public C([BII)I
    .locals 9

    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v7, p3

    move-wide v5, v7

    invoke-static/range {v1 .. v6}, Ld/t;->b(JJJ)V

    iget-object p3, p0, Ld/m;->a:Ld/c;

    iget-wide v0, p3, Ld/c;->b:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    iget-object v0, p0, Ld/m;->b:Ld/r;

    const-wide/16 v1, 0x2000

    invoke-interface {v0, p3, v1, v2}, Ld/r;->G(Ld/c;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long p3, v0, v2

    if-nez p3, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    iget-object p3, p0, Ld/m;->a:Ld/c;

    iget-wide v0, p3, Ld/c;->b:J

    invoke-static {v7, v8, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int p3, v0

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0, p1, p2, p3}, Ld/c;->C([BII)I

    move-result p1

    return p1
.end method

.method public D()B
    .locals 2

    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Ld/m;->F(J)V

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0}, Ld/c;->D()B

    move-result v0

    return v0
.end method

.method public F(J)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Ld/m;->y(J)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1
.end method

.method public G(Ld/c;J)J
    .locals 6

    if-eqz p1, :cond_3

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_2

    iget-boolean v2, p0, Ld/m;->c:Z

    if-nez v2, :cond_1

    iget-object v2, p0, Ld/m;->a:Ld/c;

    iget-wide v3, v2, Ld/c;->b:J

    cmp-long v5, v3, v0

    if-nez v5, :cond_0

    iget-object v0, p0, Ld/m;->b:Ld/r;

    const-wide/16 v3, 0x2000

    invoke-interface {v0, v2, v3, v4}, Ld/r;->G(Ld/c;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    return-wide v2

    :cond_0
    iget-object v0, p0, Ld/m;->a:Ld/c;

    iget-wide v0, v0, Ld/c;->b:J

    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0, p1, p2, p3}, Ld/c;->G(Ld/c;J)J

    move-result-wide p1

    return-wide p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "byteCount < 0: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sink == null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public H()I
    .locals 2

    const-wide/16 v0, 0x4

    invoke-virtual {p0, v0, v1}, Ld/m;->F(J)V

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0}, Ld/c;->H()I

    move-result v0

    return v0
.end method

.method public a(BJ)J
    .locals 8

    iget-boolean v0, p0, Ld/m;->c:Z

    if-nez v0, :cond_2

    :goto_0
    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0, p1, p2, p3}, Ld/c;->O(BJ)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    return-wide v0

    :cond_0
    iget-object v0, p0, Ld/m;->a:Ld/c;

    iget-wide v4, v0, Ld/c;->b:J

    iget-object v1, p0, Ld/m;->b:Ld/r;

    const-wide/16 v6, 0x2000

    invoke-interface {v1, v0, v6, v7}, Ld/r;->G(Ld/c;J)J

    move-result-wide v0

    cmp-long v6, v0, v2

    if-nez v6, :cond_1

    return-wide v2

    :cond_1
    invoke-static {p2, p3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p2

    goto :goto_0

    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public b()Ld/s;
    .locals 1

    iget-object v0, p0, Ld/m;->b:Ld/r;

    invoke-interface {v0}, Ld/r;->b()Ld/s;

    move-result-object v0

    return-object v0
.end method

.method public c()Ld/c;
    .locals 1

    iget-object v0, p0, Ld/m;->a:Ld/c;

    return-object v0
.end method

.method public close()V
    .locals 1

    iget-boolean v0, p0, Ld/m;->c:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Ld/m;->c:Z

    iget-object v0, p0, Ld/m;->b:Ld/r;

    invoke-interface {v0}, Ld/r;->close()V

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0}, Ld/c;->I()V

    return-void
.end method

.method public d(J)Ld/f;
    .locals 1

    invoke-virtual {p0, p1, p2}, Ld/m;->F(J)V

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0, p1, p2}, Ld/c;->d(J)Ld/f;

    move-result-object p1

    return-object p1
.end method

.method public h()I
    .locals 2

    const-wide/16 v0, 0x4

    invoke-virtual {p0, v0, v1}, Ld/m;->F(J)V

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0}, Ld/c;->h()I

    move-result v0

    return v0
.end method

.method public j(J)V
    .locals 6

    iget-boolean v0, p0, Ld/m;->c:Z

    if-nez v0, :cond_3

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_2

    iget-object v2, p0, Ld/m;->a:Ld/c;

    iget-wide v3, v2, Ld/c;->b:J

    cmp-long v5, v3, v0

    if-nez v5, :cond_1

    iget-object v0, p0, Ld/m;->b:Ld/r;

    const-wide/16 v3, 0x2000

    invoke-interface {v0, v2, v3, v4}, Ld/r;->G(Ld/c;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    goto :goto_1

    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :cond_1
    :goto_1
    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0}, Ld/c;->V()J

    move-result-wide v0

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    iget-object v2, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v2, v0, v1}, Ld/c;->j(J)V

    sub-long/2addr p1, v0

    goto :goto_0

    :cond_2
    return-void

    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public k()Z
    .locals 5

    iget-boolean v0, p0, Ld/m;->c:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0}, Ld/c;->k()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Ld/m;->b:Ld/r;

    iget-object v1, p0, Ld/m;->a:Ld/c;

    const-wide/16 v2, 0x2000

    invoke-interface {v0, v1, v2, v3}, Ld/r;->G(Ld/c;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public o(Ld/c;J)V
    .locals 1

    :try_start_0
    invoke-virtual {p0, p2, p3}, Ld/m;->F(J)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0, p1, p2, p3}, Ld/c;->o(Ld/c;J)V

    return-void

    :catch_0
    move-exception p2

    iget-object p3, p0, Ld/m;->a:Ld/c;

    invoke-virtual {p1, p3}, Ld/c;->c0(Ld/r;)J

    throw p2
.end method

.method public q([B)V
    .locals 8

    :try_start_0
    array-length v0, p1

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Ld/m;->F(J)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0, p1}, Ld/c;->q([B)V

    return-void

    :catch_0
    move-exception v0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Ld/m;->a:Ld/c;

    iget-wide v3, v2, Ld/c;->b:J

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-lez v7, :cond_1

    long-to-int v4, v3

    invoke-virtual {v2, p1, v1, v4}, Ld/c;->C([BII)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    add-int/2addr v1, v2

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    throw p1

    :cond_1
    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public r()S
    .locals 2

    const-wide/16 v0, 0x2

    invoke-virtual {p0, v0, v1}, Ld/m;->F(J)V

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0}, Ld/c;->r()S

    move-result v0

    return v0
.end method

.method public s(B)J
    .locals 2

    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Ld/m;->a(BJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public t()S
    .locals 2

    const-wide/16 v0, 0x2

    invoke-virtual {p0, v0, v1}, Ld/m;->F(J)V

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0}, Ld/c;->t()S

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "buffer("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ld/m;->b:Ld/r;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public u()J
    .locals 2

    const-wide/16 v0, 0x8

    invoke-virtual {p0, v0, v1}, Ld/m;->F(J)V

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0}, Ld/c;->u()J

    move-result-wide v0

    return-wide v0
.end method

.method public v(J)[B
    .locals 1

    invoke-virtual {p0, p1, p2}, Ld/m;->F(J)V

    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0, p1, p2}, Ld/c;->v(J)[B

    move-result-object p1

    return-object p1
.end method

.method public x()J
    .locals 6

    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Ld/m;->F(J)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    add-int/lit8 v2, v1, 0x1

    int-to-long v3, v2

    invoke-virtual {p0, v3, v4}, Ld/m;->y(J)Z

    move-result v3

    if-eqz v3, :cond_5

    iget-object v3, p0, Ld/m;->a:Ld/c;

    int-to-long v4, v1

    invoke-virtual {v3, v4, v5}, Ld/c;->N(J)B

    move-result v3

    const/16 v4, 0x30

    if-lt v3, v4, :cond_0

    const/16 v4, 0x39

    if-le v3, v4, :cond_2

    :cond_0
    const/16 v4, 0x61

    if-lt v3, v4, :cond_1

    const/16 v4, 0x66

    if-le v3, v4, :cond_2

    :cond_1
    const/16 v4, 0x41

    if-lt v3, v4, :cond_3

    const/16 v4, 0x46

    if-le v3, v4, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    :goto_1
    if-eqz v1, :cond_4

    goto :goto_2

    :cond_4
    new-instance v1, Ljava/lang/NumberFormatException;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    aput-object v3, v2, v0

    const-string v0, "Expected leading [0-9a-fA-F] character but was %#x"

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_5
    :goto_2
    iget-object v0, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v0}, Ld/c;->x()J

    move-result-wide v0

    return-wide v0
.end method

.method public y(J)Z
    .locals 5

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_3

    iget-boolean v0, p0, Ld/m;->c:Z

    if-nez v0, :cond_2

    :cond_0
    iget-object v0, p0, Ld/m;->a:Ld/c;

    iget-wide v1, v0, Ld/c;->b:J

    cmp-long v3, v1, p1

    if-gez v3, :cond_1

    iget-object v1, p0, Ld/m;->b:Ld/r;

    const-wide/16 v2, 0x2000

    invoke-interface {v1, v0, v2, v3}, Ld/r;->G(Ld/c;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "byteCount < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :goto_0
    throw v0

    :goto_1
    goto :goto_0
.end method

.method public z()Ljava/lang/String;
    .locals 9

    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Ld/m;->s(B)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iget-object v2, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v2, v0, v1}, Ld/c;->U(J)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ld/c;

    invoke-direct {v0}, Ld/c;-><init>()V

    iget-object v1, p0, Ld/m;->a:Ld/c;

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x20

    invoke-virtual {v1}, Ld/c;->V()J

    move-result-wide v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    move-object v2, v0

    invoke-virtual/range {v1 .. v6}, Ld/c;->L(Ld/c;JJ)Ld/c;

    new-instance v1, Ljava/io/EOFException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\\n not found: size="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Ld/m;->a:Ld/c;

    invoke-virtual {v3}, Ld/c;->V()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, " content="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ld/c;->Q()Ld/f;

    move-result-object v0

    invoke-virtual {v0}, Ld/f;->i()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u2026"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
