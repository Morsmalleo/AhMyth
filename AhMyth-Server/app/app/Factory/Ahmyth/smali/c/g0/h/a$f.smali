.class Lc/g0/h/a$f;
.super Lc/g0/h/a$b;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/g0/h/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "f"
.end annotation


# instance fields
.field private d:J

.field final synthetic e:Lc/g0/h/a;


# direct methods
.method public constructor <init>(Lc/g0/h/a;J)V
    .locals 2

    iput-object p1, p0, Lc/g0/h/a$f;->e:Lc/g0/h/a;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lc/g0/h/a$b;-><init>(Lc/g0/h/a;Lc/g0/h/a$a;)V

    iput-wide p2, p0, Lc/g0/h/a$f;->d:J

    const-wide/16 v0, 0x0

    cmp-long p1, p2, v0

    if-nez p1, :cond_0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lc/g0/h/a$b;->a(Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public G(Ld/c;J)J
    .locals 7

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_4

    iget-boolean v2, p0, Lc/g0/h/a$b;->b:Z

    if-nez v2, :cond_3

    iget-wide v2, p0, Lc/g0/h/a$f;->d:J

    const-wide/16 v4, -0x1

    cmp-long v6, v2, v0

    if-nez v6, :cond_0

    return-wide v4

    :cond_0
    iget-object v6, p0, Lc/g0/h/a$f;->e:Lc/g0/h/a;

    iget-object v6, v6, Lc/g0/h/a;->c:Ld/e;

    invoke-static {v2, v3, p2, p3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    invoke-interface {v6, p1, p2, p3}, Ld/r;->G(Ld/c;J)J

    move-result-wide p1

    cmp-long p3, p1, v4

    if-eqz p3, :cond_2

    iget-wide v2, p0, Lc/g0/h/a$f;->d:J

    sub-long/2addr v2, p1

    iput-wide v2, p0, Lc/g0/h/a$f;->d:J

    cmp-long p3, v2, v0

    if-nez p3, :cond_1

    const/4 p3, 0x1

    invoke-virtual {p0, p3}, Lc/g0/h/a$b;->a(Z)V

    :cond_1
    return-wide p1

    :cond_2
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lc/g0/h/a$b;->a(Z)V

    new-instance p1, Ljava/net/ProtocolException;

    const-string p2, "unexpected end of stream"

    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
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
.end method

.method public close()V
    .locals 5

    iget-boolean v0, p0, Lc/g0/h/a$b;->b:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-wide v0, p0, Lc/g0/h/a$f;->d:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    const/16 v0, 0x64

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, v0, v1}, Lc/g0/c;->h(Ld/r;ILjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lc/g0/h/a$b;->a(Z)V

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lc/g0/h/a$b;->b:Z

    return-void
.end method
