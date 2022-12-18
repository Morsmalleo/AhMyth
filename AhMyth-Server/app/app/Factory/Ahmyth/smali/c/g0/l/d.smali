.class final Lc/g0/l/d;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/g0/l/d$a;
    }
.end annotation


# instance fields
.field final a:Z

.field final b:Ljava/util/Random;

.field final c:Ld/d;

.field d:Z

.field final e:Ld/c;

.field final f:Lc/g0/l/d$a;

.field g:Z

.field final h:[B

.field final i:[B


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(ZLd/d;Ljava/util/Random;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ld/c;

    invoke-direct {v0}, Ld/c;-><init>()V

    iput-object v0, p0, Lc/g0/l/d;->e:Ld/c;

    new-instance v0, Lc/g0/l/d$a;

    invoke-direct {v0, p0}, Lc/g0/l/d$a;-><init>(Lc/g0/l/d;)V

    iput-object v0, p0, Lc/g0/l/d;->f:Lc/g0/l/d$a;

    if-eqz p2, :cond_3

    if-eqz p3, :cond_2

    iput-boolean p1, p0, Lc/g0/l/d;->a:Z

    iput-object p2, p0, Lc/g0/l/d;->c:Ld/d;

    iput-object p3, p0, Lc/g0/l/d;->b:Ljava/util/Random;

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    const/4 p3, 0x4

    new-array p3, p3, [B

    goto :goto_0

    :cond_0
    move-object p3, p2

    :goto_0
    iput-object p3, p0, Lc/g0/l/d;->h:[B

    if-eqz p1, :cond_1

    const/16 p1, 0x2000

    new-array p2, p1, [B

    :cond_1
    iput-object p2, p0, Lc/g0/l/d;->i:[B

    return-void

    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "random == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "sink == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private c(ILd/f;)V
    .locals 7

    iget-boolean v0, p0, Lc/g0/l/d;->d:Z

    if-nez v0, :cond_2

    invoke-virtual {p2}, Ld/f;->o()I

    move-result v0

    int-to-long v1, v0

    const-wide/16 v3, 0x7d

    cmp-long v5, v1, v3

    if-gtz v5, :cond_1

    or-int/lit16 p1, p1, 0x80

    iget-object v1, p0, Lc/g0/l/d;->c:Ld/d;

    invoke-interface {v1, p1}, Ld/d;->m(I)Ld/d;

    iget-boolean p1, p0, Lc/g0/l/d;->a:Z

    if-eqz p1, :cond_0

    or-int/lit16 p1, v0, 0x80

    iget-object v0, p0, Lc/g0/l/d;->c:Ld/d;

    invoke-interface {v0, p1}, Ld/d;->m(I)Ld/d;

    iget-object p1, p0, Lc/g0/l/d;->b:Ljava/util/Random;

    iget-object v0, p0, Lc/g0/l/d;->h:[B

    invoke-virtual {p1, v0}, Ljava/util/Random;->nextBytes([B)V

    iget-object p1, p0, Lc/g0/l/d;->c:Ld/d;

    iget-object v0, p0, Lc/g0/l/d;->h:[B

    invoke-interface {p1, v0}, Ld/d;->f([B)Ld/d;

    invoke-virtual {p2}, Ld/f;->s()[B

    move-result-object p1

    array-length p2, p1

    int-to-long v2, p2

    iget-object v4, p0, Lc/g0/l/d;->h:[B

    const-wide/16 v5, 0x0

    move-object v1, p1

    invoke-static/range {v1 .. v6}, Lc/g0/l/b;->b([BJ[BJ)V

    iget-object p2, p0, Lc/g0/l/d;->c:Ld/d;

    invoke-interface {p2, p1}, Ld/d;->f([B)Ld/d;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lc/g0/l/d;->c:Ld/d;

    invoke-interface {p1, v0}, Ld/d;->m(I)Ld/d;

    iget-object p1, p0, Lc/g0/l/d;->c:Ld/d;

    invoke-interface {p1, p2}, Ld/d;->n(Ld/f;)Ld/d;

    :goto_0
    iget-object p1, p0, Lc/g0/l/d;->c:Ld/d;

    invoke-interface {p1}, Ld/d;->flush()V

    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Payload size must be less than or equal to 125"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method a(IJ)Ld/q;
    .locals 2

    iget-boolean v0, p0, Lc/g0/l/d;->g:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lc/g0/l/d;->g:Z

    iget-object v1, p0, Lc/g0/l/d;->f:Lc/g0/l/d$a;

    iput p1, v1, Lc/g0/l/d$a;->a:I

    iput-wide p2, v1, Lc/g0/l/d$a;->b:J

    iput-boolean v0, v1, Lc/g0/l/d$a;->c:Z

    const/4 p1, 0x0

    iput-boolean p1, v1, Lc/g0/l/d$a;->d:Z

    return-object v1

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Another message writer is active. Did you call close()?"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method b(ILd/f;)V
    .locals 1

    sget-object v0, Ld/f;->e:Ld/f;

    if-nez p1, :cond_0

    if-eqz p2, :cond_3

    :cond_0
    if-eqz p1, :cond_1

    invoke-static {p1}, Lc/g0/l/b;->c(I)V

    :cond_1
    new-instance v0, Ld/c;

    invoke-direct {v0}, Ld/c;-><init>()V

    invoke-virtual {v0, p1}, Ld/c;->h0(I)Ld/c;

    if-eqz p2, :cond_2

    invoke-virtual {v0, p2}, Ld/c;->Z(Ld/f;)Ld/c;

    :cond_2
    invoke-virtual {v0}, Ld/c;->Q()Ld/f;

    move-result-object v0

    :cond_3
    monitor-enter p0

    const/16 p1, 0x8

    const/4 p2, 0x1

    :try_start_0
    invoke-direct {p0, p1, v0}, Lc/g0/l/d;->c(ILd/f;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iput-boolean p2, p0, Lc/g0/l/d;->d:Z

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    :catchall_1
    move-exception p1

    iput-boolean p2, p0, Lc/g0/l/d;->d:Z

    throw p1

    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method d(IJZZ)V
    .locals 9

    iget-boolean v0, p0, Lc/g0/l/d;->d:Z

    if-nez v0, :cond_8

    const/4 v0, 0x0

    if-eqz p4, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p5, :cond_1

    or-int/lit16 p1, p1, 0x80

    :cond_1
    iget-object p4, p0, Lc/g0/l/d;->c:Ld/d;

    invoke-interface {p4, p1}, Ld/d;->m(I)Ld/d;

    iget-boolean p1, p0, Lc/g0/l/d;->a:Z

    if-eqz p1, :cond_2

    const/16 p1, 0x80

    goto :goto_1

    :cond_2
    const/4 p1, 0x0

    :goto_1
    const-wide/16 p4, 0x7d

    cmp-long v1, p2, p4

    if-gtz v1, :cond_3

    long-to-int p4, p2

    or-int/2addr p1, p4

    iget-object p4, p0, Lc/g0/l/d;->c:Ld/d;

    invoke-interface {p4, p1}, Ld/d;->m(I)Ld/d;

    goto :goto_2

    :cond_3
    const-wide/32 p4, 0xffff

    cmp-long v1, p2, p4

    if-gtz v1, :cond_4

    or-int/lit8 p1, p1, 0x7e

    iget-object p4, p0, Lc/g0/l/d;->c:Ld/d;

    invoke-interface {p4, p1}, Ld/d;->m(I)Ld/d;

    iget-object p1, p0, Lc/g0/l/d;->c:Ld/d;

    long-to-int p4, p2

    invoke-interface {p1, p4}, Ld/d;->w(I)Ld/d;

    goto :goto_2

    :cond_4
    or-int/lit8 p1, p1, 0x7f

    iget-object p4, p0, Lc/g0/l/d;->c:Ld/d;

    invoke-interface {p4, p1}, Ld/d;->m(I)Ld/d;

    iget-object p1, p0, Lc/g0/l/d;->c:Ld/d;

    invoke-interface {p1, p2, p3}, Ld/d;->E(J)Ld/d;

    :goto_2
    iget-boolean p1, p0, Lc/g0/l/d;->a:Z

    if-eqz p1, :cond_6

    iget-object p1, p0, Lc/g0/l/d;->b:Ljava/util/Random;

    iget-object p4, p0, Lc/g0/l/d;->h:[B

    invoke-virtual {p1, p4}, Ljava/util/Random;->nextBytes([B)V

    iget-object p1, p0, Lc/g0/l/d;->c:Ld/d;

    iget-object p4, p0, Lc/g0/l/d;->h:[B

    invoke-interface {p1, p4}, Ld/d;->f([B)Ld/d;

    const-wide/16 p4, 0x0

    :goto_3
    cmp-long p1, p4, p2

    if-gez p1, :cond_7

    iget-object p1, p0, Lc/g0/l/d;->i:[B

    array-length p1, p1

    int-to-long v1, p1

    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int p1, v1

    iget-object v1, p0, Lc/g0/l/d;->e:Ld/c;

    iget-object v2, p0, Lc/g0/l/d;->i:[B

    invoke-virtual {v1, v2, v0, p1}, Ld/c;->C([BII)I

    move-result p1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_5

    iget-object v1, p0, Lc/g0/l/d;->i:[B

    int-to-long v7, p1

    iget-object v4, p0, Lc/g0/l/d;->h:[B

    move-wide v2, v7

    move-wide v5, p4

    invoke-static/range {v1 .. v6}, Lc/g0/l/b;->b([BJ[BJ)V

    iget-object v1, p0, Lc/g0/l/d;->c:Ld/d;

    iget-object v2, p0, Lc/g0/l/d;->i:[B

    invoke-interface {v1, v2, v0, p1}, Ld/d;->i([BII)Ld/d;

    add-long/2addr p4, v7

    goto :goto_3

    :cond_5
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    throw p1

    :cond_6
    iget-object p1, p0, Lc/g0/l/d;->c:Ld/d;

    iget-object p4, p0, Lc/g0/l/d;->e:Ld/c;

    invoke-interface {p1, p4, p2, p3}, Ld/q;->l(Ld/c;J)V

    :cond_7
    iget-object p1, p0, Lc/g0/l/d;->c:Ld/d;

    invoke-interface {p1}, Ld/d;->p()Ld/d;

    return-void

    :cond_8
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw p1

    :goto_5
    goto :goto_4
.end method

.method e(Ld/f;)V
    .locals 1

    monitor-enter p0

    const/16 v0, 0x9

    :try_start_0
    invoke-direct {p0, v0, p1}, Lc/g0/l/d;->c(ILd/f;)V

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method f(Ld/f;)V
    .locals 1

    monitor-enter p0

    const/16 v0, 0xa

    :try_start_0
    invoke-direct {p0, v0, p1}, Lc/g0/l/d;->c(ILd/f;)V

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
