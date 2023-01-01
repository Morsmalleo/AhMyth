.class public final Lc/g0/e/a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lc/t;


# instance fields
.field final a:Lc/g0/e/d;


# direct methods
.method public constructor <init>(Lc/g0/e/d;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc/g0/e/a;->a:Lc/g0/e/d;

    return-void
.end method

.method private b(Lc/g0/e/b;Lc/a0;)Lc/a0;
    .locals 3

    if-nez p1, :cond_0

    return-object p2

    :cond_0
    invoke-interface {p1}, Lc/g0/e/b;->b()Ld/q;

    move-result-object v0

    if-nez v0, :cond_1

    return-object p2

    :cond_1
    invoke-virtual {p2}, Lc/a0;->a()Lc/b0;

    move-result-object v1

    invoke-virtual {v1}, Lc/b0;->J()Ld/e;

    move-result-object v1

    invoke-static {v0}, Ld/k;->a(Ld/q;)Ld/d;

    move-result-object v0

    new-instance v2, Lc/g0/e/a$a;

    invoke-direct {v2, p0, v1, p1, v0}, Lc/g0/e/a$a;-><init>(Lc/g0/e/a;Ld/e;Lc/g0/e/b;Ld/d;)V

    invoke-virtual {p2}, Lc/a0;->O()Lc/a0$a;

    move-result-object p1

    new-instance v0, Lc/g0/g/h;

    invoke-virtual {p2}, Lc/a0;->M()Lc/r;

    move-result-object p2

    invoke-static {v2}, Ld/k;->b(Ld/r;)Ld/e;

    move-result-object v1

    invoke-direct {v0, p2, v1}, Lc/g0/g/h;-><init>(Lc/r;Ld/e;)V

    invoke-virtual {p1, v0}, Lc/a0$a;->b(Lc/b0;)Lc/a0$a;

    invoke-virtual {p1}, Lc/a0$a;->c()Lc/a0;

    move-result-object p1

    return-object p1
.end method

.method private static c(Lc/r;Lc/r;)Lc/r;
    .locals 7

    new-instance v0, Lc/r$a;

    invoke-direct {v0}, Lc/r$a;-><init>()V

    invoke-virtual {p0}, Lc/r;->e()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_3

    invoke-virtual {p0, v3}, Lc/r;->c(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3}, Lc/r;->g(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "Warning"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, "1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_1

    :cond_0
    invoke-static {v4}, Lc/g0/e/a;->d(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {p1, v4}, Lc/r;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_2

    :cond_1
    sget-object v6, Lc/g0/a;->a:Lc/g0/a;

    invoke-virtual {v6, v0, v4, v5}, Lc/g0/a;->b(Lc/r$a;Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lc/r;->e()I

    move-result p0

    :goto_2
    if-ge v2, p0, :cond_6

    invoke-virtual {p1, v2}, Lc/r;->c(I)Ljava/lang/String;

    move-result-object v1

    const-string v3, "Content-Length"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_3

    :cond_4
    invoke-static {v1}, Lc/g0/e/a;->d(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    sget-object v3, Lc/g0/a;->a:Lc/g0/a;

    invoke-virtual {p1, v2}, Lc/r;->g(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v0, v1, v4}, Lc/g0/a;->b(Lc/r$a;Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_6
    invoke-virtual {v0}, Lc/r$a;->d()Lc/r;

    move-result-object p0

    return-object p0
.end method

.method static d(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "Connection"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Keep-Alive"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Proxy-Authenticate"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Proxy-Authorization"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "TE"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Trailers"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Transfer-Encoding"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Upgrade"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private e(Lc/a0;Lc/y;Lc/g0/e/d;)Lc/g0/e/b;
    .locals 2

    const/4 v0, 0x0

    if-nez p3, :cond_0

    return-object v0

    :cond_0
    invoke-static {p1, p2}, Lc/g0/e/c;->a(Lc/a0;Lc/y;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p2}, Lc/y;->f()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lc/g0/g/f;->a(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    :try_start_0
    invoke-interface {p3, p2}, Lc/g0/e/d;->f(Lc/y;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    return-object v0

    :cond_2
    invoke-interface {p3, p1}, Lc/g0/e/d;->d(Lc/a0;)Lc/g0/e/b;

    move-result-object p1

    return-object p1
.end method

.method private static f(Lc/a0;)Lc/a0;
    .locals 1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lc/a0;->a()Lc/b0;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lc/a0;->O()Lc/a0$a;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lc/a0$a;->b(Lc/b0;)Lc/a0$a;

    invoke-virtual {p0}, Lc/a0$a;->c()Lc/a0;

    move-result-object p0

    :cond_0
    return-object p0
.end method


# virtual methods
.method public a(Lc/t$a;)Lc/a0;
    .locals 5

    iget-object v0, p0, Lc/g0/e/a;->a:Lc/g0/e/d;

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lc/t$a;->a()Lc/y;

    move-result-object v1

    invoke-interface {v0, v1}, Lc/g0/e/d;->a(Lc/y;)Lc/a0;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    new-instance v3, Lc/g0/e/c$a;

    invoke-interface {p1}, Lc/t$a;->a()Lc/y;

    move-result-object v4

    invoke-direct {v3, v1, v2, v4, v0}, Lc/g0/e/c$a;-><init>(JLc/y;Lc/a0;)V

    invoke-virtual {v3}, Lc/g0/e/c$a;->c()Lc/g0/e/c;

    move-result-object v1

    iget-object v2, v1, Lc/g0/e/c;->a:Lc/y;

    iget-object v3, v1, Lc/g0/e/c;->b:Lc/a0;

    iget-object v4, p0, Lc/g0/e/a;->a:Lc/g0/e/d;

    if-eqz v4, :cond_1

    invoke-interface {v4, v1}, Lc/g0/e/d;->e(Lc/g0/e/c;)V

    :cond_1
    if-eqz v0, :cond_2

    if-nez v3, :cond_2

    invoke-virtual {v0}, Lc/a0;->a()Lc/b0;

    move-result-object v1

    invoke-static {v1}, Lc/g0/c;->b(Ljava/io/Closeable;)V

    :cond_2
    if-nez v2, :cond_3

    if-nez v3, :cond_3

    new-instance v0, Lc/a0$a;

    invoke-direct {v0}, Lc/a0$a;-><init>()V

    invoke-interface {p1}, Lc/t$a;->a()Lc/y;

    move-result-object p1

    invoke-virtual {v0, p1}, Lc/a0$a;->o(Lc/y;)Lc/a0$a;

    sget-object p1, Lc/w;->c:Lc/w;

    invoke-virtual {v0, p1}, Lc/a0$a;->m(Lc/w;)Lc/a0$a;

    const/16 p1, 0x1f8

    invoke-virtual {v0, p1}, Lc/a0$a;->g(I)Lc/a0$a;

    const-string p1, "Unsatisfiable Request (only-if-cached)"

    invoke-virtual {v0, p1}, Lc/a0$a;->j(Ljava/lang/String;)Lc/a0$a;

    sget-object p1, Lc/g0/c;->c:Lc/b0;

    invoke-virtual {v0, p1}, Lc/a0$a;->b(Lc/b0;)Lc/a0$a;

    const-wide/16 v1, -0x1

    invoke-virtual {v0, v1, v2}, Lc/a0$a;->p(J)Lc/a0$a;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lc/a0$a;->n(J)Lc/a0$a;

    invoke-virtual {v0}, Lc/a0$a;->c()Lc/a0;

    move-result-object p1

    return-object p1

    :cond_3
    if-nez v2, :cond_4

    invoke-virtual {v3}, Lc/a0;->O()Lc/a0$a;

    move-result-object p1

    invoke-static {v3}, Lc/g0/e/a;->f(Lc/a0;)Lc/a0;

    move-result-object v0

    invoke-virtual {p1, v0}, Lc/a0$a;->d(Lc/a0;)Lc/a0$a;

    invoke-virtual {p1}, Lc/a0$a;->c()Lc/a0;

    move-result-object p1

    return-object p1

    :cond_4
    :try_start_0
    invoke-interface {p1, v2}, Lc/t$a;->b(Lc/y;)Lc/a0;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_5

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lc/a0;->a()Lc/b0;

    move-result-object v0

    invoke-static {v0}, Lc/g0/c;->b(Ljava/io/Closeable;)V

    :cond_5
    if-eqz v3, :cond_7

    invoke-virtual {p1}, Lc/a0;->I()I

    move-result v0

    const/16 v1, 0x130

    if-ne v0, v1, :cond_6

    invoke-virtual {v3}, Lc/a0;->O()Lc/a0$a;

    move-result-object v0

    invoke-virtual {v3}, Lc/a0;->M()Lc/r;

    move-result-object v1

    invoke-virtual {p1}, Lc/a0;->M()Lc/r;

    move-result-object v2

    invoke-static {v1, v2}, Lc/g0/e/a;->c(Lc/r;Lc/r;)Lc/r;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a0$a;->i(Lc/r;)Lc/a0$a;

    invoke-virtual {p1}, Lc/a0;->R()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lc/a0$a;->p(J)Lc/a0$a;

    invoke-virtual {p1}, Lc/a0;->P()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lc/a0$a;->n(J)Lc/a0$a;

    invoke-static {v3}, Lc/g0/e/a;->f(Lc/a0;)Lc/a0;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a0$a;->d(Lc/a0;)Lc/a0$a;

    invoke-static {p1}, Lc/g0/e/a;->f(Lc/a0;)Lc/a0;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a0$a;->k(Lc/a0;)Lc/a0$a;

    invoke-virtual {v0}, Lc/a0$a;->c()Lc/a0;

    move-result-object v0

    invoke-virtual {p1}, Lc/a0;->a()Lc/b0;

    move-result-object p1

    invoke-virtual {p1}, Lc/b0;->close()V

    iget-object p1, p0, Lc/g0/e/a;->a:Lc/g0/e/d;

    invoke-interface {p1}, Lc/g0/e/d;->b()V

    iget-object p1, p0, Lc/g0/e/a;->a:Lc/g0/e/d;

    invoke-interface {p1, v3, v0}, Lc/g0/e/d;->c(Lc/a0;Lc/a0;)V

    return-object v0

    :cond_6
    invoke-virtual {v3}, Lc/a0;->a()Lc/b0;

    move-result-object v0

    invoke-static {v0}, Lc/g0/c;->b(Ljava/io/Closeable;)V

    :cond_7
    invoke-virtual {p1}, Lc/a0;->O()Lc/a0$a;

    move-result-object v0

    invoke-static {v3}, Lc/g0/e/a;->f(Lc/a0;)Lc/a0;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a0$a;->d(Lc/a0;)Lc/a0$a;

    invoke-static {p1}, Lc/g0/e/a;->f(Lc/a0;)Lc/a0;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a0$a;->k(Lc/a0;)Lc/a0$a;

    invoke-virtual {v0}, Lc/a0$a;->c()Lc/a0;

    move-result-object v0

    invoke-static {v0}, Lc/g0/g/e;->c(Lc/a0;)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-virtual {p1}, Lc/a0;->Q()Lc/y;

    move-result-object p1

    iget-object v1, p0, Lc/g0/e/a;->a:Lc/g0/e/d;

    invoke-direct {p0, v0, p1, v1}, Lc/g0/e/a;->e(Lc/a0;Lc/y;Lc/g0/e/d;)Lc/g0/e/b;

    move-result-object p1

    invoke-direct {p0, p1, v0}, Lc/g0/e/a;->b(Lc/g0/e/b;Lc/a0;)Lc/a0;

    move-result-object v0

    :cond_8
    return-object v0

    :catchall_0
    move-exception p1

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lc/a0;->a()Lc/b0;

    move-result-object v0

    invoke-static {v0}, Lc/g0/c;->b(Ljava/io/Closeable;)V

    :cond_9
    throw p1
.end method
