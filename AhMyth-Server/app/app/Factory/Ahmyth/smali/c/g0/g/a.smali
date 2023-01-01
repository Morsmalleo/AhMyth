.class public final Lc/g0/g/a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lc/t;


# instance fields
.field private final a:Lc/m;


# direct methods
.method public constructor <init>(Lc/m;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc/g0/g/a;->a:Lc/m;

    return-void
.end method

.method private b(Ljava/util/List;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lc/l;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    if-lez v2, :cond_0

    const-string v3, "; "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lc/l;

    invoke-virtual {v3}, Lc/l;->c()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v4, 0x3d

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lc/l;->k()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public a(Lc/t$a;)Lc/a0;
    .locals 9

    invoke-interface {p1}, Lc/t$a;->a()Lc/y;

    move-result-object v0

    invoke-virtual {v0}, Lc/y;->g()Lc/y$a;

    move-result-object v1

    invoke-virtual {v0}, Lc/y;->a()Lc/z;

    move-result-object v2

    const-string v3, "Content-Length"

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lc/z;->b()Lc/u;

    move-result-object v4

    if-nez v4, :cond_1

    invoke-virtual {v2}, Lc/z;->a()J

    move-result-wide v4

    const-wide/16 v6, -0x1

    const-string v2, "Transfer-Encoding"

    cmp-long v8, v4, v6

    if-eqz v8, :cond_0

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lc/y$a;->c(Ljava/lang/String;Ljava/lang/String;)Lc/y$a;

    invoke-virtual {v1, v2}, Lc/y$a;->f(Ljava/lang/String;)Lc/y$a;

    goto :goto_0

    :cond_0
    const-string v4, "chunked"

    invoke-virtual {v1, v2, v4}, Lc/y$a;->c(Ljava/lang/String;Ljava/lang/String;)Lc/y$a;

    invoke-virtual {v1, v3}, Lc/y$a;->f(Ljava/lang/String;)Lc/y$a;

    goto :goto_0

    :cond_1
    invoke-virtual {v4}, Lc/u;->toString()Ljava/lang/String;

    const/4 p1, 0x0

    throw p1

    :cond_2
    :goto_0
    const-string v2, "Host"

    invoke-virtual {v0, v2}, Lc/y;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    if-nez v4, :cond_3

    invoke-virtual {v0}, Lc/y;->h()Lc/s;

    move-result-object v4

    invoke-static {v4, v5}, Lc/g0/c;->l(Lc/s;Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Lc/y$a;->c(Ljava/lang/String;Ljava/lang/String;)Lc/y$a;

    :cond_3
    const-string v2, "Connection"

    invoke-virtual {v0, v2}, Lc/y;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_4

    const-string v4, "Keep-Alive"

    invoke-virtual {v1, v2, v4}, Lc/y$a;->c(Ljava/lang/String;Ljava/lang/String;)Lc/y$a;

    :cond_4
    const-string v2, "Accept-Encoding"

    invoke-virtual {v0, v2}, Lc/y;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "gzip"

    if-nez v4, :cond_5

    const/4 v5, 0x1

    invoke-virtual {v1, v2, v6}, Lc/y$a;->c(Ljava/lang/String;Ljava/lang/String;)Lc/y$a;

    :cond_5
    iget-object v2, p0, Lc/g0/g/a;->a:Lc/m;

    invoke-virtual {v0}, Lc/y;->h()Lc/s;

    move-result-object v4

    invoke-interface {v2, v4}, Lc/m;->a(Lc/s;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_6

    invoke-direct {p0, v2}, Lc/g0/g/a;->b(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "Cookie"

    invoke-virtual {v1, v4, v2}, Lc/y$a;->c(Ljava/lang/String;Ljava/lang/String;)Lc/y$a;

    :cond_6
    const-string v2, "User-Agent"

    invoke-virtual {v0, v2}, Lc/y;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_7

    invoke-static {}, Lc/g0/d;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Lc/y$a;->c(Ljava/lang/String;Ljava/lang/String;)Lc/y$a;

    :cond_7
    invoke-virtual {v1}, Lc/y$a;->b()Lc/y;

    move-result-object v1

    invoke-interface {p1, v1}, Lc/t$a;->b(Lc/y;)Lc/a0;

    move-result-object p1

    iget-object v1, p0, Lc/g0/g/a;->a:Lc/m;

    invoke-virtual {v0}, Lc/y;->h()Lc/s;

    move-result-object v2

    invoke-virtual {p1}, Lc/a0;->M()Lc/r;

    move-result-object v4

    invoke-static {v1, v2, v4}, Lc/g0/g/e;->e(Lc/m;Lc/s;Lc/r;)V

    invoke-virtual {p1}, Lc/a0;->O()Lc/a0$a;

    move-result-object v1

    invoke-virtual {v1, v0}, Lc/a0$a;->o(Lc/y;)Lc/a0$a;

    if-eqz v5, :cond_8

    const-string v0, "Content-Encoding"

    invoke-virtual {p1, v0}, Lc/a0;->K(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-static {p1}, Lc/g0/g/e;->c(Lc/a0;)Z

    move-result v2

    if-eqz v2, :cond_8

    new-instance v2, Ld/i;

    invoke-virtual {p1}, Lc/a0;->a()Lc/b0;

    move-result-object v4

    invoke-virtual {v4}, Lc/b0;->J()Ld/e;

    move-result-object v4

    invoke-direct {v2, v4}, Ld/i;-><init>(Ld/r;)V

    invoke-virtual {p1}, Lc/a0;->M()Lc/r;

    move-result-object p1

    invoke-virtual {p1}, Lc/r;->d()Lc/r$a;

    move-result-object p1

    invoke-virtual {p1, v0}, Lc/r$a;->f(Ljava/lang/String;)Lc/r$a;

    invoke-virtual {p1, v3}, Lc/r$a;->f(Ljava/lang/String;)Lc/r$a;

    invoke-virtual {p1}, Lc/r$a;->d()Lc/r;

    move-result-object p1

    invoke-virtual {v1, p1}, Lc/a0$a;->i(Lc/r;)Lc/a0$a;

    new-instance v0, Lc/g0/g/h;

    invoke-static {v2}, Ld/k;->b(Ld/r;)Ld/e;

    move-result-object v2

    invoke-direct {v0, p1, v2}, Lc/g0/g/h;-><init>(Lc/r;Ld/e;)V

    invoke-virtual {v1, v0}, Lc/a0$a;->b(Lc/b0;)Lc/a0$a;

    :cond_8
    invoke-virtual {v1}, Lc/a0$a;->c()Lc/a0;

    move-result-object p1

    return-object p1
.end method
