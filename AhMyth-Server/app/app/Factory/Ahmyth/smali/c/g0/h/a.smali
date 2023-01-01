.class public final Lc/g0/h/a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lc/g0/g/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/g0/h/a$g;,
        Lc/g0/h/a$d;,
        Lc/g0/h/a$f;,
        Lc/g0/h/a$b;,
        Lc/g0/h/a$c;,
        Lc/g0/h/a$e;
    }
.end annotation


# instance fields
.field final a:Lc/v;

.field final b:Lc/g0/f/g;

.field final c:Ld/e;

.field final d:Ld/d;

.field e:I


# direct methods
.method public constructor <init>(Lc/v;Lc/g0/f/g;Ld/e;Ld/d;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lc/g0/h/a;->e:I

    iput-object p1, p0, Lc/g0/h/a;->a:Lc/v;

    iput-object p2, p0, Lc/g0/h/a;->b:Lc/g0/f/g;

    iput-object p3, p0, Lc/g0/h/a;->c:Ld/e;

    iput-object p4, p0, Lc/g0/h/a;->d:Ld/d;

    return-void
.end method

.method private h(Lc/a0;)Ld/r;
    .locals 4

    invoke-static {p1}, Lc/g0/g/e;->c(Lc/a0;)Z

    move-result v0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lc/g0/h/a;->l(J)Ld/r;

    move-result-object p1

    return-object p1

    :cond_0
    const-string v0, "Transfer-Encoding"

    invoke-virtual {p1, v0}, Lc/a0;->K(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "chunked"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lc/a0;->Q()Lc/y;

    move-result-object p1

    invoke-virtual {p1}, Lc/y;->h()Lc/s;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/g0/h/a;->j(Lc/s;)Ld/r;

    move-result-object p1

    return-object p1

    :cond_1
    invoke-static {p1}, Lc/g0/g/e;->b(Lc/a0;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long p1, v0, v2

    if-eqz p1, :cond_2

    invoke-virtual {p0, v0, v1}, Lc/g0/h/a;->l(J)Ld/r;

    move-result-object p1

    return-object p1

    :cond_2
    invoke-virtual {p0}, Lc/g0/h/a;->m()Ld/r;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public a()V
    .locals 1

    iget-object v0, p0, Lc/g0/h/a;->b:Lc/g0/f/g;

    invoke-virtual {v0}, Lc/g0/f/g;->d()Lc/g0/f/c;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lc/g0/f/c;->f()V

    :cond_0
    return-void
.end method

.method public b()V
    .locals 1

    iget-object v0, p0, Lc/g0/h/a;->d:Ld/d;

    invoke-interface {v0}, Ld/d;->flush()V

    return-void
.end method

.method public c(Lc/y;)V
    .locals 1

    iget-object v0, p0, Lc/g0/h/a;->b:Lc/g0/f/g;

    invoke-virtual {v0}, Lc/g0/f/g;->d()Lc/g0/f/c;

    move-result-object v0

    invoke-virtual {v0}, Lc/g0/f/c;->a()Lc/c0;

    move-result-object v0

    invoke-virtual {v0}, Lc/c0;->b()Ljava/net/Proxy;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    invoke-static {p1, v0}, Lc/g0/g/i;->a(Lc/y;Ljava/net/Proxy$Type;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lc/y;->d()Lc/r;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Lc/g0/h/a;->p(Lc/r;Ljava/lang/String;)V

    return-void
.end method

.method public d(Lc/a0;)Lc/b0;
    .locals 2

    invoke-direct {p0, p1}, Lc/g0/h/a;->h(Lc/a0;)Ld/r;

    move-result-object v0

    new-instance v1, Lc/g0/g/h;

    invoke-virtual {p1}, Lc/a0;->M()Lc/r;

    move-result-object p1

    invoke-static {v0}, Ld/k;->b(Ld/r;)Ld/e;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lc/g0/g/h;-><init>(Lc/r;Ld/e;)V

    return-object v1
.end method

.method public e()Lc/a0$a;
    .locals 1

    invoke-virtual {p0}, Lc/g0/h/a;->o()Lc/a0$a;

    move-result-object v0

    return-object v0
.end method

.method public f(Lc/y;J)Ld/q;
    .locals 2

    const-string v0, "Transfer-Encoding"

    invoke-virtual {p1, v0}, Lc/y;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "chunked"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lc/g0/h/a;->i()Ld/q;

    move-result-object p1

    return-object p1

    :cond_0
    const-wide/16 v0, -0x1

    cmp-long p1, p2, v0

    if-eqz p1, :cond_1

    invoke-virtual {p0, p2, p3}, Lc/g0/h/a;->k(J)Ld/q;

    move-result-object p1

    return-object p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Cannot stream a request body without chunked encoding or a known content length!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method g(Ld/h;)V
    .locals 2

    invoke-virtual {p1}, Ld/h;->i()Ld/s;

    move-result-object v0

    sget-object v1, Ld/s;->d:Ld/s;

    invoke-virtual {p1, v1}, Ld/h;->j(Ld/s;)Ld/h;

    invoke-virtual {v0}, Ld/s;->a()Ld/s;

    invoke-virtual {v0}, Ld/s;->b()Ld/s;

    return-void
.end method

.method public i()Ld/q;
    .locals 3

    iget v0, p0, Lc/g0/h/a;->e:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x2

    iput v0, p0, Lc/g0/h/a;->e:I

    new-instance v0, Lc/g0/h/a$c;

    invoke-direct {v0, p0}, Lc/g0/h/a$c;-><init>(Lc/g0/h/a;)V

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lc/g0/h/a;->e:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public j(Lc/s;)Ld/r;
    .locals 2

    iget v0, p0, Lc/g0/h/a;->e:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x5

    iput v0, p0, Lc/g0/h/a;->e:I

    new-instance v0, Lc/g0/h/a$d;

    invoke-direct {v0, p0, p1}, Lc/g0/h/a$d;-><init>(Lc/g0/h/a;Lc/s;)V

    return-object v0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lc/g0/h/a;->e:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public k(J)Ld/q;
    .locals 2

    iget v0, p0, Lc/g0/h/a;->e:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x2

    iput v0, p0, Lc/g0/h/a;->e:I

    new-instance v0, Lc/g0/h/a$e;

    invoke-direct {v0, p0, p1, p2}, Lc/g0/h/a$e;-><init>(Lc/g0/h/a;J)V

    return-object v0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "state: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lc/g0/h/a;->e:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public l(J)Ld/r;
    .locals 2

    iget v0, p0, Lc/g0/h/a;->e:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x5

    iput v0, p0, Lc/g0/h/a;->e:I

    new-instance v0, Lc/g0/h/a$f;

    invoke-direct {v0, p0, p1, p2}, Lc/g0/h/a$f;-><init>(Lc/g0/h/a;J)V

    return-object v0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "state: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lc/g0/h/a;->e:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public m()Ld/r;
    .locals 3

    iget v0, p0, Lc/g0/h/a;->e:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lc/g0/h/a;->b:Lc/g0/f/g;

    if-eqz v0, :cond_0

    const/4 v1, 0x5

    iput v1, p0, Lc/g0/h/a;->e:I

    invoke-virtual {v0}, Lc/g0/f/g;->j()V

    new-instance v0, Lc/g0/h/a$g;

    invoke-direct {v0, p0}, Lc/g0/h/a$g;-><init>(Lc/g0/h/a;)V

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "streamAllocation == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lc/g0/h/a;->e:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public n()Lc/r;
    .locals 3

    new-instance v0, Lc/r$a;

    invoke-direct {v0}, Lc/r$a;-><init>()V

    :goto_0
    iget-object v1, p0, Lc/g0/h/a;->c:Ld/e;

    invoke-interface {v1}, Ld/e;->z()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Lc/g0/a;->a:Lc/g0/a;

    invoke-virtual {v2, v0, v1}, Lc/g0/a;->a(Lc/r$a;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lc/r$a;->d()Lc/r;

    move-result-object v0

    return-object v0
.end method

.method public o()Lc/a0$a;
    .locals 4

    iget v0, p0, Lc/g0/h/a;->e:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lc/g0/h/a;->e:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    :try_start_0
    iget-object v0, p0, Lc/g0/h/a;->c:Ld/e;

    invoke-interface {v0}, Ld/e;->z()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lc/g0/g/k;->a(Ljava/lang/String;)Lc/g0/g/k;

    move-result-object v0

    new-instance v1, Lc/a0$a;

    invoke-direct {v1}, Lc/a0$a;-><init>()V

    iget-object v2, v0, Lc/g0/g/k;->a:Lc/w;

    invoke-virtual {v1, v2}, Lc/a0$a;->m(Lc/w;)Lc/a0$a;

    iget v2, v0, Lc/g0/g/k;->b:I

    invoke-virtual {v1, v2}, Lc/a0$a;->g(I)Lc/a0$a;

    iget-object v2, v0, Lc/g0/g/k;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lc/a0$a;->j(Ljava/lang/String;)Lc/a0$a;

    invoke-virtual {p0}, Lc/g0/h/a;->n()Lc/r;

    move-result-object v2

    invoke-virtual {v1, v2}, Lc/a0$a;->i(Lc/r;)Lc/a0$a;

    iget v0, v0, Lc/g0/g/k;->b:I

    const/16 v2, 0x64

    if-eq v0, v2, :cond_1

    const/4 v0, 0x4

    iput v0, p0, Lc/g0/h/a;->e:I
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unexpected end of stream on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lc/g0/h/a;->b:Lc/g0/f/g;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method public p(Lc/r;Ljava/lang/String;)V
    .locals 4

    iget v0, p0, Lc/g0/h/a;->e:I

    if-nez v0, :cond_1

    iget-object v0, p0, Lc/g0/h/a;->d:Ld/d;

    invoke-interface {v0, p2}, Ld/d;->e(Ljava/lang/String;)Ld/d;

    move-result-object p2

    const-string v0, "\r\n"

    invoke-interface {p2, v0}, Ld/d;->e(Ljava/lang/String;)Ld/d;

    const/4 p2, 0x0

    invoke-virtual {p1}, Lc/r;->e()I

    move-result v1

    :goto_0
    if-ge p2, v1, :cond_0

    iget-object v2, p0, Lc/g0/h/a;->d:Ld/d;

    invoke-virtual {p1, p2}, Lc/r;->c(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ld/d;->e(Ljava/lang/String;)Ld/d;

    move-result-object v2

    const-string v3, ": "

    invoke-interface {v2, v3}, Ld/d;->e(Ljava/lang/String;)Ld/d;

    move-result-object v2

    invoke-virtual {p1, p2}, Lc/r;->g(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ld/d;->e(Ljava/lang/String;)Ld/d;

    move-result-object v2

    invoke-interface {v2, v0}, Ld/d;->e(Ljava/lang/String;)Ld/d;

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lc/g0/h/a;->d:Ld/d;

    invoke-interface {p1, v0}, Ld/d;->e(Ljava/lang/String;)Ld/d;

    const/4 p1, 0x1

    iput p1, p0, Lc/g0/h/a;->e:I

    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "state: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lc/g0/h/a;->e:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method
