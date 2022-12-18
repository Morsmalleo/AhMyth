.class final Lc/g0/i/h$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ld/r;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/g0/i/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# instance fields
.field private final a:Ld/e;

.field b:I

.field c:B

.field d:I

.field e:I

.field f:S


# direct methods
.method public constructor <init>(Ld/e;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc/g0/i/h$a;->a:Ld/e;

    return-void
.end method

.method private a()V
    .locals 7

    iget v0, p0, Lc/g0/i/h$a;->d:I

    iget-object v1, p0, Lc/g0/i/h$a;->a:Ld/e;

    invoke-static {v1}, Lc/g0/i/h;->N(Ld/e;)I

    move-result v1

    iput v1, p0, Lc/g0/i/h$a;->e:I

    iput v1, p0, Lc/g0/i/h$a;->b:I

    iget-object v1, p0, Lc/g0/i/h$a;->a:Ld/e;

    invoke-interface {v1}, Ld/e;->D()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    iget-object v2, p0, Lc/g0/i/h$a;->a:Ld/e;

    invoke-interface {v2}, Ld/e;->D()B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    iput-byte v2, p0, Lc/g0/i/h$a;->c:B

    sget-object v2, Lc/g0/i/h;->e:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_0

    iget v3, p0, Lc/g0/i/h$a;->d:I

    iget v5, p0, Lc/g0/i/h$a;->b:I

    iget-byte v6, p0, Lc/g0/i/h$a;->c:B

    invoke-static {v4, v3, v5, v1, v6}, Lc/g0/i/e;->b(ZIIBB)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    :cond_0
    iget-object v2, p0, Lc/g0/i/h$a;->a:Ld/e;

    invoke-interface {v2}, Ld/e;->H()I

    move-result v2

    const v3, 0x7fffffff

    and-int/2addr v2, v3

    iput v2, p0, Lc/g0/i/h$a;->d:I

    const/16 v3, 0x9

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-ne v1, v3, :cond_2

    if-ne v2, v0, :cond_1

    return-void

    :cond_1
    new-array v0, v6, [Ljava/lang/Object;

    const-string v1, "TYPE_CONTINUATION streamId changed"

    invoke-static {v1, v0}, Lc/g0/i/e;->d(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    throw v5

    :cond_2
    new-array v0, v4, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    aput-object v1, v0, v6

    const-string v1, "%s != TYPE_CONTINUATION"

    invoke-static {v1, v0}, Lc/g0/i/e;->d(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    throw v5
.end method


# virtual methods
.method public G(Ld/c;J)J
    .locals 6

    :goto_0
    iget v0, p0, Lc/g0/i/h$a;->e:I

    const-wide/16 v1, -0x1

    if-nez v0, :cond_1

    iget-object v0, p0, Lc/g0/i/h$a;->a:Ld/e;

    iget-short v3, p0, Lc/g0/i/h$a;->f:S

    int-to-long v3, v3

    invoke-interface {v0, v3, v4}, Ld/e;->j(J)V

    const/4 v0, 0x0

    iput-short v0, p0, Lc/g0/i/h$a;->f:S

    iget-byte v0, p0, Lc/g0/i/h$a;->c:B

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    return-wide v1

    :cond_0
    invoke-direct {p0}, Lc/g0/i/h$a;->a()V

    goto :goto_0

    :cond_1
    iget-object v3, p0, Lc/g0/i/h$a;->a:Ld/e;

    int-to-long v4, v0

    invoke-static {p2, p3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    invoke-interface {v3, p1, p2, p3}, Ld/r;->G(Ld/c;J)J

    move-result-wide p1

    cmp-long p3, p1, v1

    if-nez p3, :cond_2

    return-wide v1

    :cond_2
    iget p3, p0, Lc/g0/i/h$a;->e:I

    int-to-long v0, p3

    sub-long/2addr v0, p1

    long-to-int p3, v0

    iput p3, p0, Lc/g0/i/h$a;->e:I

    return-wide p1
.end method

.method public b()Ld/s;
    .locals 1

    iget-object v0, p0, Lc/g0/i/h$a;->a:Ld/e;

    invoke-interface {v0}, Ld/r;->b()Ld/s;

    move-result-object v0

    return-object v0
.end method

.method public close()V
    .locals 0

    return-void
.end method
