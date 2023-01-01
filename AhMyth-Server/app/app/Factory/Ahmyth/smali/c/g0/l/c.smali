.class final Lc/g0/l/c;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/g0/l/c$a;
    }
.end annotation


# instance fields
.field final a:Z

.field final b:Ld/e;

.field final c:Lc/g0/l/c$a;

.field d:Z

.field e:I

.field f:J

.field g:J

.field h:Z

.field i:Z

.field j:Z

.field final k:[B

.field final l:[B


# direct methods
.method constructor <init>(ZLd/e;Lc/g0/l/c$a;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lc/g0/l/c;->k:[B

    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lc/g0/l/c;->l:[B

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    iput-boolean p1, p0, Lc/g0/l/c;->a:Z

    iput-object p2, p0, Lc/g0/l/c;->b:Ld/e;

    iput-object p3, p0, Lc/g0/l/c;->c:Lc/g0/l/c$a;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "frameCallback == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "source == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private b()V
    .locals 11

    new-instance v0, Ld/c;

    invoke-direct {v0}, Ld/c;-><init>()V

    iget-wide v1, p0, Lc/g0/l/c;->g:J

    iget-wide v3, p0, Lc/g0/l/c;->f:J

    cmp-long v5, v1, v3

    if-gez v5, :cond_2

    iget-boolean v1, p0, Lc/g0/l/c;->a:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lc/g0/l/c;->b:Ld/e;

    invoke-interface {v1, v0, v3, v4}, Ld/e;->o(Ld/c;J)V

    goto :goto_1

    :cond_0
    :goto_0
    iget-wide v1, p0, Lc/g0/l/c;->g:J

    iget-wide v3, p0, Lc/g0/l/c;->f:J

    cmp-long v5, v1, v3

    if-gez v5, :cond_2

    sub-long/2addr v3, v1

    iget-object v1, p0, Lc/g0/l/c;->l:[B

    array-length v1, v1

    int-to-long v1, v1

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v2, v1

    iget-object v1, p0, Lc/g0/l/c;->b:Ld/e;

    iget-object v3, p0, Lc/g0/l/c;->l:[B

    const/4 v4, 0x0

    invoke-interface {v1, v3, v4, v2}, Ld/e;->C([BII)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    iget-object v5, p0, Lc/g0/l/c;->l:[B

    int-to-long v2, v1

    iget-object v8, p0, Lc/g0/l/c;->k:[B

    iget-wide v9, p0, Lc/g0/l/c;->g:J

    move-wide v6, v2

    invoke-static/range {v5 .. v10}, Lc/g0/l/b;->b([BJ[BJ)V

    iget-object v5, p0, Lc/g0/l/c;->l:[B

    invoke-virtual {v0, v5, v4, v1}, Ld/c;->b0([BII)Ld/c;

    iget-wide v4, p0, Lc/g0/l/c;->g:J

    add-long/2addr v4, v2

    iput-wide v4, p0, Lc/g0/l/c;->g:J

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    :cond_2
    :goto_1
    iget v1, p0, Lc/g0/l/c;->e:I

    packed-switch v1, :pswitch_data_0

    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown control opcode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lc/g0/l/c;->e:I

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget-object v1, p0, Lc/g0/l/c;->c:Lc/g0/l/c$a;

    invoke-virtual {v0}, Ld/c;->Q()Ld/f;

    move-result-object v0

    invoke-interface {v1, v0}, Lc/g0/l/c$a;->c(Ld/f;)V

    goto :goto_3

    :pswitch_1
    iget-object v1, p0, Lc/g0/l/c;->c:Lc/g0/l/c$a;

    invoke-virtual {v0}, Ld/c;->Q()Ld/f;

    move-result-object v0

    invoke-interface {v1, v0}, Lc/g0/l/c$a;->f(Ld/f;)V

    goto :goto_3

    :pswitch_2
    const/16 v1, 0x3ed

    invoke-virtual {v0}, Ld/c;->V()J

    move-result-wide v2

    const-wide/16 v4, 0x1

    cmp-long v6, v2, v4

    if-eqz v6, :cond_5

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-eqz v6, :cond_4

    invoke-virtual {v0}, Ld/c;->r()S

    move-result v1

    invoke-virtual {v0}, Ld/c;->S()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1}, Lc/g0/l/b;->a(I)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    goto :goto_2

    :cond_3
    new-instance v0, Ljava/net/ProtocolException;

    invoke-direct {v0, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    const-string v0, ""

    :goto_2
    iget-object v2, p0, Lc/g0/l/c;->c:Lc/g0/l/c$a;

    invoke-interface {v2, v1, v0}, Lc/g0/l/c$a;->i(ILjava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lc/g0/l/c;->d:Z

    :goto_3
    return-void

    :cond_5
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Malformed close payload length of 1."

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw v0

    :goto_5
    goto :goto_4

    nop

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private c()V
    .locals 7

    iget-boolean v0, p0, Lc/g0/l/c;->d:Z

    if-nez v0, :cond_11

    iget-object v0, p0, Lc/g0/l/c;->b:Ld/e;

    invoke-interface {v0}, Ld/r;->b()Ld/s;

    move-result-object v0

    invoke-virtual {v0}, Ld/s;->h()J

    move-result-wide v0

    iget-object v2, p0, Lc/g0/l/c;->b:Ld/e;

    invoke-interface {v2}, Ld/r;->b()Ld/s;

    move-result-object v2

    invoke-virtual {v2}, Ld/s;->b()Ld/s;

    :try_start_0
    iget-object v2, p0, Lc/g0/l/c;->b:Ld/e;

    invoke-interface {v2}, Ld/e;->D()B

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    and-int/lit16 v2, v2, 0xff

    iget-object v3, p0, Lc/g0/l/c;->b:Ld/e;

    invoke-interface {v3}, Ld/r;->b()Ld/s;

    move-result-object v3

    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1, v4}, Ld/s;->g(JLjava/util/concurrent/TimeUnit;)Ld/s;

    and-int/lit8 v0, v2, 0xf

    iput v0, p0, Lc/g0/l/c;->e:I

    and-int/lit16 v0, v2, 0x80

    const/4 v1, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lc/g0/l/c;->h:Z

    and-int/lit8 v4, v2, 0x8

    if-eqz v4, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    iput-boolean v4, p0, Lc/g0/l/c;->i:Z

    if-eqz v4, :cond_3

    if-eqz v0, :cond_2

    goto :goto_2

    :cond_2
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Control frames must be final."

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    :goto_2
    and-int/lit8 v0, v2, 0x40

    if-eqz v0, :cond_4

    const/4 v0, 0x1

    goto :goto_3

    :cond_4
    const/4 v0, 0x0

    :goto_3
    and-int/lit8 v4, v2, 0x20

    if-eqz v4, :cond_5

    const/4 v4, 0x1

    goto :goto_4

    :cond_5
    const/4 v4, 0x0

    :goto_4
    and-int/lit8 v2, v2, 0x10

    if-eqz v2, :cond_6

    const/4 v2, 0x1

    goto :goto_5

    :cond_6
    const/4 v2, 0x0

    :goto_5
    if-nez v0, :cond_10

    if-nez v4, :cond_10

    if-nez v2, :cond_10

    iget-object v0, p0, Lc/g0/l/c;->b:Ld/e;

    invoke-interface {v0}, Ld/e;->D()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    and-int/lit16 v2, v0, 0x80

    if-eqz v2, :cond_7

    goto :goto_6

    :cond_7
    const/4 v1, 0x0

    :goto_6
    iput-boolean v1, p0, Lc/g0/l/c;->j:Z

    iget-boolean v2, p0, Lc/g0/l/c;->a:Z

    if-ne v1, v2, :cond_9

    new-instance v0, Ljava/net/ProtocolException;

    iget-boolean v1, p0, Lc/g0/l/c;->a:Z

    if-eqz v1, :cond_8

    const-string v1, "Server-sent frames must not be masked."

    goto :goto_7

    :cond_8
    const-string v1, "Client-sent frames must be masked."

    :goto_7
    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9
    and-int/lit8 v0, v0, 0x7f

    int-to-long v0, v0

    iput-wide v0, p0, Lc/g0/l/c;->f:J

    const-wide/16 v2, 0x7e

    const-wide/16 v4, 0x0

    cmp-long v6, v0, v2

    if-nez v6, :cond_a

    iget-object v0, p0, Lc/g0/l/c;->b:Ld/e;

    invoke-interface {v0}, Ld/e;->r()S

    move-result v0

    int-to-long v0, v0

    const-wide/32 v2, 0xffff

    and-long/2addr v0, v2

    iput-wide v0, p0, Lc/g0/l/c;->f:J

    goto :goto_8

    :cond_a
    const-wide/16 v2, 0x7f

    cmp-long v6, v0, v2

    if-nez v6, :cond_c

    iget-object v0, p0, Lc/g0/l/c;->b:Ld/e;

    invoke-interface {v0}, Ld/e;->u()J

    move-result-wide v0

    iput-wide v0, p0, Lc/g0/l/c;->f:J

    cmp-long v2, v0, v4

    if-ltz v2, :cond_b

    goto :goto_8

    :cond_b
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Frame length 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lc/g0/l/c;->f:J

    invoke-static {v2, v3}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " > 0x7FFFFFFFFFFFFFFF"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    :goto_8
    iput-wide v4, p0, Lc/g0/l/c;->g:J

    iget-boolean v0, p0, Lc/g0/l/c;->i:Z

    if-eqz v0, :cond_e

    iget-wide v0, p0, Lc/g0/l/c;->f:J

    const-wide/16 v2, 0x7d

    cmp-long v4, v0, v2

    if-gtz v4, :cond_d

    goto :goto_9

    :cond_d
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Control frame must be less than 125B."

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    :goto_9
    iget-boolean v0, p0, Lc/g0/l/c;->j:Z

    if-eqz v0, :cond_f

    iget-object v0, p0, Lc/g0/l/c;->b:Ld/e;

    iget-object v1, p0, Lc/g0/l/c;->k:[B

    invoke-interface {v0, v1}, Ld/e;->q([B)V

    :cond_f
    return-void

    :cond_10
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Reserved flags are unsupported."

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v2

    iget-object v3, p0, Lc/g0/l/c;->b:Ld/e;

    invoke-interface {v3}, Ld/r;->b()Ld/s;

    move-result-object v3

    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1, v4}, Ld/s;->g(JLjava/util/concurrent/TimeUnit;)Ld/s;

    throw v2

    :cond_11
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private d(Ld/c;)V
    .locals 11

    :goto_0
    iget-boolean v0, p0, Lc/g0/l/c;->d:Z

    if-nez v0, :cond_6

    iget-wide v0, p0, Lc/g0/l/c;->g:J

    iget-wide v2, p0, Lc/g0/l/c;->f:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_2

    iget-boolean v0, p0, Lc/g0/l/c;->h:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lc/g0/l/c;->f()V

    iget v0, p0, Lc/g0/l/c;->e:I

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lc/g0/l/c;->h:Z

    if-eqz v0, :cond_2

    iget-wide v0, p0, Lc/g0/l/c;->f:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_2

    return-void

    :cond_1
    new-instance p1, Ljava/net/ProtocolException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Expected continuation opcode. Got: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lc/g0/l/c;->e:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    iget-wide v0, p0, Lc/g0/l/c;->f:J

    iget-wide v2, p0, Lc/g0/l/c;->g:J

    sub-long/2addr v0, v2

    iget-boolean v2, p0, Lc/g0/l/c;->j:Z

    const-wide/16 v3, -0x1

    if-eqz v2, :cond_4

    iget-object v2, p0, Lc/g0/l/c;->l:[B

    array-length v2, v2

    int-to-long v5, v2

    invoke-static {v0, v1, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    iget-object v2, p0, Lc/g0/l/c;->b:Ld/e;

    iget-object v5, p0, Lc/g0/l/c;->l:[B

    long-to-int v1, v0

    const/4 v0, 0x0

    invoke-interface {v2, v5, v0, v1}, Ld/e;->C([BII)I

    move-result v1

    int-to-long v1, v1

    cmp-long v5, v1, v3

    if-eqz v5, :cond_3

    iget-object v5, p0, Lc/g0/l/c;->l:[B

    iget-object v8, p0, Lc/g0/l/c;->k:[B

    iget-wide v9, p0, Lc/g0/l/c;->g:J

    move-wide v6, v1

    invoke-static/range {v5 .. v10}, Lc/g0/l/b;->b([BJ[BJ)V

    iget-object v3, p0, Lc/g0/l/c;->l:[B

    long-to-int v4, v1

    invoke-virtual {p1, v3, v0, v4}, Ld/c;->b0([BII)Ld/c;

    goto :goto_1

    :cond_3
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :cond_4
    iget-object v2, p0, Lc/g0/l/c;->b:Ld/e;

    invoke-interface {v2, p1, v0, v1}, Ld/r;->G(Ld/c;J)J

    move-result-wide v1

    cmp-long v0, v1, v3

    if-eqz v0, :cond_5

    :goto_1
    iget-wide v3, p0, Lc/g0/l/c;->g:J

    add-long/2addr v3, v1

    iput-wide v3, p0, Lc/g0/l/c;->g:J

    goto/16 :goto_0

    :cond_5
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :cond_6
    new-instance p1, Ljava/io/IOException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method private e()V
    .locals 4

    iget v0, p0, Lc/g0/l/c;->e:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown opcode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    :goto_0
    new-instance v2, Ld/c;

    invoke-direct {v2}, Ld/c;-><init>()V

    invoke-direct {p0, v2}, Lc/g0/l/c;->d(Ld/c;)V

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lc/g0/l/c;->c:Lc/g0/l/c$a;

    invoke-virtual {v2}, Ld/c;->S()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lc/g0/l/c$a;->b(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lc/g0/l/c;->c:Lc/g0/l/c$a;

    invoke-virtual {v2}, Ld/c;->Q()Ld/f;

    move-result-object v1

    invoke-interface {v0, v1}, Lc/g0/l/c$a;->h(Ld/f;)V

    :goto_1
    return-void
.end method


# virtual methods
.method a()V
    .locals 1

    invoke-direct {p0}, Lc/g0/l/c;->c()V

    iget-boolean v0, p0, Lc/g0/l/c;->i:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lc/g0/l/c;->b()V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lc/g0/l/c;->e()V

    :goto_0
    return-void
.end method

.method f()V
    .locals 1

    :goto_0
    iget-boolean v0, p0, Lc/g0/l/c;->d:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Lc/g0/l/c;->c()V

    iget-boolean v0, p0, Lc/g0/l/c;->i:Z

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-direct {p0}, Lc/g0/l/c;->b()V

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method
