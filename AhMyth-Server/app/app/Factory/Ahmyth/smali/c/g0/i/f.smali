.class public final Lc/g0/i/f;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lc/g0/g/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/g0/i/f$a;
    }
.end annotation


# static fields
.field private static final e:Ld/f;

.field private static final f:Ld/f;

.field private static final g:Ld/f;

.field private static final h:Ld/f;

.field private static final i:Ld/f;

.field private static final j:Ld/f;

.field private static final k:Ld/f;

.field private static final l:Ld/f;

.field private static final m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ld/f;",
            ">;"
        }
    .end annotation
.end field

.field private static final n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ld/f;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Lc/v;

.field final b:Lc/g0/f/g;

.field private final c:Lc/g0/i/g;

.field private d:Lc/g0/i/i;


# direct methods
.method static constructor <clinit>()V
    .locals 19

    const-string v0, "connection"

    invoke-static {v0}, Ld/f;->g(Ljava/lang/String;)Ld/f;

    move-result-object v0

    sput-object v0, Lc/g0/i/f;->e:Ld/f;

    const-string v1, "host"

    invoke-static {v1}, Ld/f;->g(Ljava/lang/String;)Ld/f;

    move-result-object v1

    sput-object v1, Lc/g0/i/f;->f:Ld/f;

    const-string v2, "keep-alive"

    invoke-static {v2}, Ld/f;->g(Ljava/lang/String;)Ld/f;

    move-result-object v2

    sput-object v2, Lc/g0/i/f;->g:Ld/f;

    const-string v3, "proxy-connection"

    invoke-static {v3}, Ld/f;->g(Ljava/lang/String;)Ld/f;

    move-result-object v3

    sput-object v3, Lc/g0/i/f;->h:Ld/f;

    const-string v4, "transfer-encoding"

    invoke-static {v4}, Ld/f;->g(Ljava/lang/String;)Ld/f;

    move-result-object v4

    sput-object v4, Lc/g0/i/f;->i:Ld/f;

    const-string v5, "te"

    invoke-static {v5}, Ld/f;->g(Ljava/lang/String;)Ld/f;

    move-result-object v5

    sput-object v5, Lc/g0/i/f;->j:Ld/f;

    const-string v6, "encoding"

    invoke-static {v6}, Ld/f;->g(Ljava/lang/String;)Ld/f;

    move-result-object v6

    sput-object v6, Lc/g0/i/f;->k:Ld/f;

    const-string v7, "upgrade"

    invoke-static {v7}, Ld/f;->g(Ljava/lang/String;)Ld/f;

    move-result-object v7

    sput-object v7, Lc/g0/i/f;->l:Ld/f;

    const/16 v8, 0xc

    new-array v8, v8, [Ld/f;

    const/4 v9, 0x0

    aput-object v0, v8, v9

    const/4 v10, 0x1

    aput-object v1, v8, v10

    const/4 v11, 0x2

    aput-object v2, v8, v11

    const/4 v12, 0x3

    aput-object v3, v8, v12

    const/4 v13, 0x4

    aput-object v5, v8, v13

    const/4 v14, 0x5

    aput-object v4, v8, v14

    const/4 v15, 0x6

    aput-object v6, v8, v15

    const/16 v16, 0x7

    aput-object v7, v8, v16

    sget-object v17, Lc/g0/i/c;->f:Ld/f;

    const/16 v15, 0x8

    aput-object v17, v8, v15

    sget-object v17, Lc/g0/i/c;->g:Ld/f;

    const/16 v18, 0x9

    aput-object v17, v8, v18

    sget-object v17, Lc/g0/i/c;->h:Ld/f;

    const/16 v18, 0xa

    aput-object v17, v8, v18

    sget-object v17, Lc/g0/i/c;->i:Ld/f;

    const/16 v18, 0xb

    aput-object v17, v8, v18

    invoke-static {v8}, Lc/g0/c;->n([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    sput-object v8, Lc/g0/i/f;->m:Ljava/util/List;

    new-array v8, v15, [Ld/f;

    aput-object v0, v8, v9

    aput-object v1, v8, v10

    aput-object v2, v8, v11

    aput-object v3, v8, v12

    aput-object v5, v8, v13

    aput-object v4, v8, v14

    const/4 v0, 0x6

    aput-object v6, v8, v0

    aput-object v7, v8, v16

    invoke-static {v8}, Lc/g0/c;->n([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lc/g0/i/f;->n:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lc/v;Lc/g0/f/g;Lc/g0/i/g;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc/g0/i/f;->a:Lc/v;

    iput-object p2, p0, Lc/g0/i/f;->b:Lc/g0/f/g;

    iput-object p3, p0, Lc/g0/i/f;->c:Lc/g0/i/g;

    return-void
.end method

.method public static g(Lc/y;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lc/y;",
            ")",
            "Ljava/util/List<",
            "Lc/g0/i/c;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lc/y;->d()Lc/r;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v0}, Lc/r;->e()I

    move-result v2

    add-int/lit8 v2, v2, 0x4

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v2, Lc/g0/i/c;

    sget-object v3, Lc/g0/i/c;->f:Ld/f;

    invoke-virtual {p0}, Lc/y;->f()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lc/g0/i/c;-><init>(Ld/f;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v2, Lc/g0/i/c;

    sget-object v3, Lc/g0/i/c;->g:Ld/f;

    invoke-virtual {p0}, Lc/y;->h()Lc/s;

    move-result-object v4

    invoke-static {v4}, Lc/g0/g/i;->c(Lc/s;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lc/g0/i/c;-><init>(Ld/f;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v2, Lc/g0/i/c;

    sget-object v3, Lc/g0/i/c;->i:Ld/f;

    invoke-virtual {p0}, Lc/y;->h()Lc/s;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lc/g0/c;->l(Lc/s;Z)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lc/g0/i/c;-><init>(Ld/f;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v2, Lc/g0/i/c;

    sget-object v3, Lc/g0/i/c;->h:Ld/f;

    invoke-virtual {p0}, Lc/y;->h()Lc/s;

    move-result-object p0

    invoke-virtual {p0}, Lc/s;->C()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, v3, p0}, Lc/g0/i/c;-><init>(Ld/f;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lc/r;->e()I

    move-result p0

    :goto_0
    if-ge v5, p0, :cond_1

    invoke-virtual {v0, v5}, Lc/r;->c(I)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ld/f;->g(Ljava/lang/String;)Ld/f;

    move-result-object v2

    sget-object v3, Lc/g0/i/f;->m:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    new-instance v3, Lc/g0/i/c;

    invoke-virtual {v0, v5}, Lc/r;->g(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lc/g0/i/c;-><init>(Ld/f;Ljava/lang/String;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method public static h(Ljava/util/List;)Lc/a0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lc/g0/i/c;",
            ">;)",
            "Lc/a0$a;"
        }
    .end annotation

    new-instance v0, Lc/r$a;

    invoke-direct {v0}, Lc/r$a;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lc/g0/i/c;

    iget-object v4, v4, Lc/g0/i/c;->a:Ld/f;

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lc/g0/i/c;

    iget-object v5, v5, Lc/g0/i/c;->b:Ld/f;

    invoke-virtual {v5}, Ld/f;->t()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lc/g0/i/c;->e:Ld/f;

    invoke-virtual {v4, v6}, Ld/f;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    move-object v2, v5

    goto :goto_1

    :cond_0
    sget-object v6, Lc/g0/i/f;->n:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    sget-object v6, Lc/g0/a;->a:Lc/g0/a;

    invoke-virtual {v4}, Ld/f;->t()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v0, v4, v5}, Lc/g0/a;->b(Lc/r$a;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    if-eqz v2, :cond_3

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HTTP/1.1 "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lc/g0/g/k;->a(Ljava/lang/String;)Lc/g0/g/k;

    move-result-object p0

    new-instance v1, Lc/a0$a;

    invoke-direct {v1}, Lc/a0$a;-><init>()V

    sget-object v2, Lc/w;->e:Lc/w;

    invoke-virtual {v1, v2}, Lc/a0$a;->m(Lc/w;)Lc/a0$a;

    iget v2, p0, Lc/g0/g/k;->b:I

    invoke-virtual {v1, v2}, Lc/a0$a;->g(I)Lc/a0$a;

    iget-object p0, p0, Lc/g0/g/k;->c:Ljava/lang/String;

    invoke-virtual {v1, p0}, Lc/a0$a;->j(Ljava/lang/String;)Lc/a0$a;

    invoke-virtual {v0}, Lc/r$a;->d()Lc/r;

    move-result-object p0

    invoke-virtual {v1, p0}, Lc/a0$a;->i(Lc/r;)Lc/a0$a;

    return-object v1

    :cond_3
    new-instance p0, Ljava/net/ProtocolException;

    const-string v0, "Expected \':status\' header not present"

    invoke-direct {p0, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p0

    :goto_3
    goto :goto_2
.end method


# virtual methods
.method public a()V
    .locals 2

    iget-object v0, p0, Lc/g0/i/f;->d:Lc/g0/i/i;

    if-eqz v0, :cond_0

    sget-object v1, Lc/g0/i/b;->g:Lc/g0/i/b;

    invoke-virtual {v0, v1}, Lc/g0/i/i;->f(Lc/g0/i/b;)V

    :cond_0
    return-void
.end method

.method public b()V
    .locals 1

    iget-object v0, p0, Lc/g0/i/f;->d:Lc/g0/i/i;

    invoke-virtual {v0}, Lc/g0/i/i;->i()Ld/q;

    move-result-object v0

    invoke-interface {v0}, Ld/q;->close()V

    return-void
.end method

.method public c(Lc/y;)V
    .locals 3

    iget-object v0, p0, Lc/g0/i/f;->d:Lc/g0/i/i;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lc/y;->a()Lc/z;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-static {p1}, Lc/g0/i/f;->g(Lc/y;)Ljava/util/List;

    move-result-object p1

    iget-object v1, p0, Lc/g0/i/f;->c:Lc/g0/i/g;

    invoke-virtual {v1, p1, v0}, Lc/g0/i/g;->M(Ljava/util/List;Z)Lc/g0/i/i;

    move-result-object p1

    iput-object p1, p0, Lc/g0/i/f;->d:Lc/g0/i/i;

    invoke-virtual {p1}, Lc/g0/i/i;->m()Ld/s;

    move-result-object p1

    iget-object v0, p0, Lc/g0/i/f;->a:Lc/v;

    invoke-virtual {v0}, Lc/v;->w()I

    move-result v0

    int-to-long v0, v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ld/s;->g(JLjava/util/concurrent/TimeUnit;)Ld/s;

    iget-object p1, p0, Lc/g0/i/f;->d:Lc/g0/i/i;

    invoke-virtual {p1}, Lc/g0/i/i;->s()Ld/s;

    move-result-object p1

    iget-object v0, p0, Lc/g0/i/f;->a:Lc/v;

    invoke-virtual {v0}, Lc/v;->D()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1, v0, v1, v2}, Ld/s;->g(JLjava/util/concurrent/TimeUnit;)Ld/s;

    return-void
.end method

.method public d(Lc/a0;)Lc/b0;
    .locals 2

    new-instance v0, Lc/g0/i/f$a;

    iget-object v1, p0, Lc/g0/i/f;->d:Lc/g0/i/i;

    invoke-virtual {v1}, Lc/g0/i/i;->j()Ld/r;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lc/g0/i/f$a;-><init>(Lc/g0/i/f;Ld/r;)V

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

    iget-object v0, p0, Lc/g0/i/f;->d:Lc/g0/i/i;

    invoke-virtual {v0}, Lc/g0/i/i;->h()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lc/g0/i/f;->h(Ljava/util/List;)Lc/a0$a;

    move-result-object v0

    return-object v0
.end method

.method public f(Lc/y;J)Ld/q;
    .locals 0

    iget-object p1, p0, Lc/g0/i/f;->d:Lc/g0/i/i;

    invoke-virtual {p1}, Lc/g0/i/i;->i()Ld/q;

    move-result-object p1

    return-object p1
.end method
