.class public final Lc/g0/f/f;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private final a:Lc/a;

.field private final b:Lc/g0/f/d;

.field private c:Ljava/net/Proxy;

.field private d:Ljava/net/InetSocketAddress;

.field private e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation
.end field

.field private f:I

.field private g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/net/InetSocketAddress;",
            ">;"
        }
    .end annotation
.end field

.field private h:I

.field private final i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/c0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lc/a;Lc/g0/f/d;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lc/g0/f/f;->e:Ljava/util/List;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lc/g0/f/f;->g:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/g0/f/f;->i:Ljava/util/List;

    iput-object p1, p0, Lc/g0/f/f;->a:Lc/a;

    iput-object p2, p0, Lc/g0/f/f;->b:Lc/g0/f/d;

    invoke-virtual {p1}, Lc/a;->k()Lc/s;

    move-result-object p2

    invoke-virtual {p1}, Lc/a;->f()Ljava/net/Proxy;

    move-result-object p1

    invoke-direct {p0, p2, p1}, Lc/g0/f/f;->l(Lc/s;Ljava/net/Proxy;)V

    return-void
.end method

.method static b(Ljava/net/InetSocketAddress;)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private d()Z
    .locals 2

    iget v0, p0, Lc/g0/f/f;->h:I

    iget-object v1, p0, Lc/g0/f/f;->g:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private e()Z
    .locals 1

    iget-object v0, p0, Lc/g0/f/f;->i:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private f()Z
    .locals 2

    iget v0, p0, Lc/g0/f/f;->f:I

    iget-object v1, p0, Lc/g0/f/f;->e:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private h()Ljava/net/InetSocketAddress;
    .locals 3

    invoke-direct {p0}, Lc/g0/f/f;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/g0/f/f;->g:Ljava/util/List;

    iget v1, p0, Lc/g0/f/f;->h:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lc/g0/f/f;->h:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetSocketAddress;

    return-object v0

    :cond_0
    new-instance v0, Ljava/net/SocketException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No route to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lc/g0/f/f;->a:Lc/a;

    invoke-virtual {v2}, Lc/a;->k()Lc/s;

    move-result-object v2

    invoke-virtual {v2}, Lc/s;->l()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "; exhausted inet socket addresses: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lc/g0/f/f;->g:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private i()Lc/c0;
    .locals 2

    iget-object v0, p0, Lc/g0/f/f;->i:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/c0;

    return-object v0
.end method

.method private j()Ljava/net/Proxy;
    .locals 3

    invoke-direct {p0}, Lc/g0/f/f;->f()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/g0/f/f;->e:Ljava/util/List;

    iget v1, p0, Lc/g0/f/f;->f:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lc/g0/f/f;->f:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Proxy;

    invoke-direct {p0, v0}, Lc/g0/f/f;->k(Ljava/net/Proxy;)V

    return-object v0

    :cond_0
    new-instance v0, Ljava/net/SocketException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No route to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lc/g0/f/f;->a:Lc/a;

    invoke-virtual {v2}, Lc/a;->k()Lc/s;

    move-result-object v2

    invoke-virtual {v2}, Lc/s;->l()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "; exhausted proxy configurations: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lc/g0/f/f;->e:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private k(Ljava/net/Proxy;)V
    .locals 7

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/g0/f/f;->g:Ljava/util/List;

    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v0, v1, :cond_2

    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->SOCKS:Ljava/net/Proxy$Type;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v0

    instance-of v1, v0, Ljava/net/InetSocketAddress;

    if-eqz v1, :cond_1

    check-cast v0, Ljava/net/InetSocketAddress;

    invoke-static {v0}, Lc/g0/f/f;->b(Ljava/net/InetSocketAddress;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v0

    goto :goto_1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Proxy.address() is not an InetSocketAddress: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_0
    iget-object v0, p0, Lc/g0/f/f;->a:Lc/a;

    invoke-virtual {v0}, Lc/a;->k()Lc/s;

    move-result-object v0

    invoke-virtual {v0}, Lc/s;->l()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lc/g0/f/f;->a:Lc/a;

    invoke-virtual {v0}, Lc/a;->k()Lc/s;

    move-result-object v0

    invoke-virtual {v0}, Lc/s;->x()I

    move-result v0

    :goto_1
    const/4 v2, 0x1

    if-lt v0, v2, :cond_5

    const v2, 0xffff

    if-gt v0, v2, :cond_5

    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object p1

    sget-object v2, Ljava/net/Proxy$Type;->SOCKS:Ljava/net/Proxy$Type;

    const/4 v3, 0x0

    if-ne p1, v2, :cond_3

    iget-object p1, p0, Lc/g0/f/f;->g:Ljava/util/List;

    invoke-static {v1, v0}, Ljava/net/InetSocketAddress;->createUnresolved(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_3
    iget-object p1, p0, Lc/g0/f/f;->a:Lc/a;

    invoke-virtual {p1}, Lc/a;->c()Lc/p;

    move-result-object p1

    invoke-interface {p1, v1}, Lc/p;->a(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_2
    if-ge v2, v1, :cond_4

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/net/InetAddress;

    iget-object v5, p0, Lc/g0/f/f;->g:Ljava/util/List;

    new-instance v6, Ljava/net/InetSocketAddress;

    invoke-direct {v6, v4, v0}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_4
    :goto_3
    iput v3, p0, Lc/g0/f/f;->h:I

    return-void

    :cond_5
    new-instance p1, Ljava/net/SocketException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No route to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "; port is out of range"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw p1

    :goto_5
    goto :goto_4
.end method

.method private l(Lc/s;Ljava/net/Proxy;)V
    .locals 1

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lc/g0/f/f;->e:Ljava/util/List;

    goto :goto_1

    :cond_0
    iget-object p2, p0, Lc/g0/f/f;->a:Lc/a;

    invoke-virtual {p2}, Lc/a;->h()Ljava/net/ProxySelector;

    move-result-object p2

    invoke-virtual {p1}, Lc/s;->D()Ljava/net/URI;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_1

    invoke-static {p1}, Lc/g0/c;->m(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    new-array p1, p1, [Ljava/net/Proxy;

    sget-object p2, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    aput-object p2, p1, v0

    invoke-static {p1}, Lc/g0/c;->n([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    goto :goto_0

    :goto_1
    iput v0, p0, Lc/g0/f/f;->f:I

    return-void
.end method


# virtual methods
.method public a(Lc/c0;Ljava/io/IOException;)V
    .locals 3

    invoke-virtual {p1}, Lc/c0;->b()Ljava/net/Proxy;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lc/g0/f/f;->a:Lc/a;

    invoke-virtual {v0}, Lc/a;->h()Ljava/net/ProxySelector;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/g0/f/f;->a:Lc/a;

    invoke-virtual {v0}, Lc/a;->h()Ljava/net/ProxySelector;

    move-result-object v0

    iget-object v1, p0, Lc/g0/f/f;->a:Lc/a;

    invoke-virtual {v1}, Lc/a;->k()Lc/s;

    move-result-object v1

    invoke-virtual {v1}, Lc/s;->D()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {p1}, Lc/c0;->b()Ljava/net/Proxy;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v2

    invoke-virtual {v0, v1, v2, p2}, Ljava/net/ProxySelector;->connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V

    :cond_0
    iget-object p2, p0, Lc/g0/f/f;->b:Lc/g0/f/d;

    invoke-virtual {p2, p1}, Lc/g0/f/d;->b(Lc/c0;)V

    return-void
.end method

.method public c()Z
    .locals 1

    invoke-direct {p0}, Lc/g0/f/f;->d()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lc/g0/f/f;->f()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lc/g0/f/f;->e()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public g()Lc/c0;
    .locals 4

    invoke-direct {p0}, Lc/g0/f/f;->d()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lc/g0/f/f;->f()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lc/g0/f/f;->e()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lc/g0/f/f;->i()Lc/c0;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    :cond_1
    invoke-direct {p0}, Lc/g0/f/f;->j()Ljava/net/Proxy;

    move-result-object v0

    iput-object v0, p0, Lc/g0/f/f;->c:Ljava/net/Proxy;

    :cond_2
    invoke-direct {p0}, Lc/g0/f/f;->h()Ljava/net/InetSocketAddress;

    move-result-object v0

    iput-object v0, p0, Lc/g0/f/f;->d:Ljava/net/InetSocketAddress;

    new-instance v1, Lc/c0;

    iget-object v2, p0, Lc/g0/f/f;->a:Lc/a;

    iget-object v3, p0, Lc/g0/f/f;->c:Ljava/net/Proxy;

    invoke-direct {v1, v2, v3, v0}, Lc/c0;-><init>(Lc/a;Ljava/net/Proxy;Ljava/net/InetSocketAddress;)V

    iget-object v0, p0, Lc/g0/f/f;->b:Lc/g0/f/d;

    invoke-virtual {v0, v1}, Lc/g0/f/d;->c(Lc/c0;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lc/g0/f/f;->i:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lc/g0/f/f;->g()Lc/c0;

    move-result-object v0

    return-object v0

    :cond_3
    return-object v1
.end method
