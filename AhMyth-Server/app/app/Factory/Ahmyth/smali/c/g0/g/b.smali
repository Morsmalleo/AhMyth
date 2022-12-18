.class public final Lc/g0/g/b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lc/t;


# instance fields
.field private final a:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lc/g0/g/b;->a:Z

    return-void
.end method


# virtual methods
.method public a(Lc/t$a;)Lc/a0;
    .locals 6

    move-object v0, p1

    check-cast v0, Lc/g0/g/g;

    invoke-virtual {v0}, Lc/g0/g/g;->c()Lc/g0/g/c;

    move-result-object v1

    invoke-virtual {v0}, Lc/g0/g/g;->f()Lc/g0/f/g;

    move-result-object v0

    invoke-interface {p1}, Lc/t$a;->a()Lc/y;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v1, p1}, Lc/g0/g/c;->c(Lc/y;)V

    invoke-virtual {p1}, Lc/y;->f()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lc/g0/g/f;->b(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p1}, Lc/y;->a()Lc/z;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {p1}, Lc/y;->a()Lc/z;

    move-result-object v4

    invoke-virtual {v4}, Lc/z;->a()J

    move-result-wide v4

    invoke-interface {v1, p1, v4, v5}, Lc/g0/g/c;->f(Lc/y;J)Ld/q;

    move-result-object v4

    invoke-static {v4}, Ld/k;->a(Ld/q;)Ld/d;

    move-result-object v4

    invoke-virtual {p1}, Lc/y;->a()Lc/z;

    move-result-object v5

    invoke-virtual {v5, v4}, Lc/z;->e(Ld/d;)V

    invoke-interface {v4}, Ld/q;->close()V

    :cond_0
    invoke-interface {v1}, Lc/g0/g/c;->b()V

    invoke-interface {v1}, Lc/g0/g/c;->e()Lc/a0$a;

    move-result-object v4

    invoke-virtual {v4, p1}, Lc/a0$a;->o(Lc/y;)Lc/a0$a;

    invoke-virtual {v0}, Lc/g0/f/g;->d()Lc/g0/f/c;

    move-result-object p1

    invoke-virtual {p1}, Lc/g0/f/c;->m()Lc/q;

    move-result-object p1

    invoke-virtual {v4, p1}, Lc/a0$a;->h(Lc/q;)Lc/a0$a;

    invoke-virtual {v4, v2, v3}, Lc/a0$a;->p(J)Lc/a0$a;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v4, v2, v3}, Lc/a0$a;->n(J)Lc/a0$a;

    invoke-virtual {v4}, Lc/a0$a;->c()Lc/a0;

    move-result-object p1

    invoke-virtual {p1}, Lc/a0;->I()I

    move-result v2

    iget-boolean v3, p0, Lc/g0/g/b;->a:Z

    if-eqz v3, :cond_1

    const/16 v3, 0x65

    if-ne v2, v3, :cond_1

    invoke-virtual {p1}, Lc/a0;->O()Lc/a0$a;

    move-result-object p1

    sget-object v1, Lc/g0/c;->c:Lc/b0;

    invoke-virtual {p1, v1}, Lc/a0$a;->b(Lc/b0;)Lc/a0$a;

    invoke-virtual {p1}, Lc/a0$a;->c()Lc/a0;

    move-result-object p1

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lc/a0;->O()Lc/a0$a;

    move-result-object v3

    invoke-interface {v1, p1}, Lc/g0/g/c;->d(Lc/a0;)Lc/b0;

    move-result-object p1

    invoke-virtual {v3, p1}, Lc/a0$a;->b(Lc/b0;)Lc/a0$a;

    invoke-virtual {v3}, Lc/a0$a;->c()Lc/a0;

    move-result-object p1

    :goto_0
    invoke-virtual {p1}, Lc/a0;->Q()Lc/y;

    move-result-object v1

    const-string v3, "Connection"

    invoke-virtual {v1, v3}, Lc/y;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "close"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p1, v3}, Lc/a0;->K(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    invoke-virtual {v0}, Lc/g0/f/g;->j()V

    :cond_3
    const/16 v0, 0xcc

    if-eq v2, v0, :cond_4

    const/16 v0, 0xcd

    if-ne v2, v0, :cond_5

    :cond_4
    invoke-virtual {p1}, Lc/a0;->a()Lc/b0;

    move-result-object v0

    invoke-virtual {v0}, Lc/b0;->a()J

    move-result-wide v0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-gtz v5, :cond_6

    :cond_5
    return-object p1

    :cond_6
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "HTTP "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " had non-zero Content-Length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lc/a0;->a()Lc/b0;

    move-result-object p1

    invoke-virtual {p1}, Lc/b0;->a()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
