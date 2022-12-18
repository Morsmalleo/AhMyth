.class public final Lc/a;
.super Ljava/lang/Object;
.source ""


# instance fields
.field final a:Lc/s;

.field final b:Lc/p;

.field final c:Ljavax/net/SocketFactory;

.field final d:Lc/b;

.field final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/w;",
            ">;"
        }
    .end annotation
.end field

.field final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/k;",
            ">;"
        }
    .end annotation
.end field

.field final g:Ljava/net/ProxySelector;

.field final h:Ljava/net/Proxy;

.field final i:Ljavax/net/ssl/SSLSocketFactory;

.field final j:Ljavax/net/ssl/HostnameVerifier;

.field final k:Lc/g;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILc/p;Ljavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;Lc/g;Lc/b;Ljava/net/Proxy;Ljava/util/List;Ljava/util/List;Ljava/net/ProxySelector;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Lc/p;",
            "Ljavax/net/SocketFactory;",
            "Ljavax/net/ssl/SSLSocketFactory;",
            "Ljavax/net/ssl/HostnameVerifier;",
            "Lc/g;",
            "Lc/b;",
            "Ljava/net/Proxy;",
            "Ljava/util/List<",
            "Lc/w;",
            ">;",
            "Ljava/util/List<",
            "Lc/k;",
            ">;",
            "Ljava/net/ProxySelector;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lc/s$a;

    invoke-direct {v0}, Lc/s$a;-><init>()V

    if-eqz p5, :cond_0

    const-string v1, "https"

    goto :goto_0

    :cond_0
    const-string v1, "http"

    :goto_0
    invoke-virtual {v0, v1}, Lc/s$a;->t(Ljava/lang/String;)Lc/s$a;

    invoke-virtual {v0, p1}, Lc/s$a;->g(Ljava/lang/String;)Lc/s$a;

    invoke-virtual {v0, p2}, Lc/s$a;->o(I)Lc/s$a;

    invoke-virtual {v0}, Lc/s$a;->a()Lc/s;

    move-result-object p1

    iput-object p1, p0, Lc/a;->a:Lc/s;

    if-eqz p3, :cond_6

    iput-object p3, p0, Lc/a;->b:Lc/p;

    if-eqz p4, :cond_5

    iput-object p4, p0, Lc/a;->c:Ljavax/net/SocketFactory;

    if-eqz p8, :cond_4

    iput-object p8, p0, Lc/a;->d:Lc/b;

    if-eqz p10, :cond_3

    invoke-static {p10}, Lc/g0/c;->m(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lc/a;->e:Ljava/util/List;

    if-eqz p11, :cond_2

    invoke-static {p11}, Lc/g0/c;->m(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lc/a;->f:Ljava/util/List;

    if-eqz p12, :cond_1

    iput-object p12, p0, Lc/a;->g:Ljava/net/ProxySelector;

    iput-object p9, p0, Lc/a;->h:Ljava/net/Proxy;

    iput-object p5, p0, Lc/a;->i:Ljavax/net/ssl/SSLSocketFactory;

    iput-object p6, p0, Lc/a;->j:Ljavax/net/ssl/HostnameVerifier;

    iput-object p7, p0, Lc/a;->k:Lc/g;

    return-void

    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "proxySelector == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "connectionSpecs == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "protocols == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "proxyAuthenticator == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "socketFactory == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "dns == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public a()Lc/g;
    .locals 1

    iget-object v0, p0, Lc/a;->k:Lc/g;

    return-object v0
.end method

.method public b()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lc/k;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lc/a;->f:Ljava/util/List;

    return-object v0
.end method

.method public c()Lc/p;
    .locals 1

    iget-object v0, p0, Lc/a;->b:Lc/p;

    return-object v0
.end method

.method public d()Ljavax/net/ssl/HostnameVerifier;
    .locals 1

    iget-object v0, p0, Lc/a;->j:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method public e()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lc/w;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lc/a;->e:Ljava/util/List;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    instance-of v0, p1, Lc/a;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    check-cast p1, Lc/a;

    iget-object v0, p0, Lc/a;->a:Lc/s;

    iget-object v2, p1, Lc/a;->a:Lc/s;

    invoke-virtual {v0, v2}, Lc/s;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/a;->b:Lc/p;

    iget-object v2, p1, Lc/a;->b:Lc/p;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/a;->d:Lc/b;

    iget-object v2, p1, Lc/a;->d:Lc/b;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/a;->e:Ljava/util/List;

    iget-object v2, p1, Lc/a;->e:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/a;->f:Ljava/util/List;

    iget-object v2, p1, Lc/a;->f:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/a;->g:Ljava/net/ProxySelector;

    iget-object v2, p1, Lc/a;->g:Ljava/net/ProxySelector;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/a;->h:Ljava/net/Proxy;

    iget-object v2, p1, Lc/a;->h:Ljava/net/Proxy;

    invoke-static {v0, v2}, Lc/g0/c;->j(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/a;->i:Ljavax/net/ssl/SSLSocketFactory;

    iget-object v2, p1, Lc/a;->i:Ljavax/net/ssl/SSLSocketFactory;

    invoke-static {v0, v2}, Lc/g0/c;->j(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/a;->j:Ljavax/net/ssl/HostnameVerifier;

    iget-object v2, p1, Lc/a;->j:Ljavax/net/ssl/HostnameVerifier;

    invoke-static {v0, v2}, Lc/g0/c;->j(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/a;->k:Lc/g;

    iget-object p1, p1, Lc/a;->k:Lc/g;

    invoke-static {v0, p1}, Lc/g0/c;->j(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public f()Ljava/net/Proxy;
    .locals 1

    iget-object v0, p0, Lc/a;->h:Ljava/net/Proxy;

    return-object v0
.end method

.method public g()Lc/b;
    .locals 1

    iget-object v0, p0, Lc/a;->d:Lc/b;

    return-object v0
.end method

.method public h()Ljava/net/ProxySelector;
    .locals 1

    iget-object v0, p0, Lc/a;->g:Ljava/net/ProxySelector;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lc/a;->a:Lc/s;

    invoke-virtual {v0}, Lc/s;->hashCode()I

    move-result v0

    const/16 v1, 0x20f

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lc/a;->b:Lc/p;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lc/a;->d:Lc/b;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lc/a;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lc/a;->f:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lc/a;->g:Ljava/net/ProxySelector;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lc/a;->h:Ljava/net/Proxy;

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/net/Proxy;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lc/a;->i:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lc/a;->j:Ljavax/net/ssl/HostnameVerifier;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    :goto_2
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lc/a;->k:Lc/g;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lc/g;->hashCode()I

    move-result v2

    :cond_3
    add-int/2addr v1, v2

    return v1
.end method

.method public i()Ljavax/net/SocketFactory;
    .locals 1

    iget-object v0, p0, Lc/a;->c:Ljavax/net/SocketFactory;

    return-object v0
.end method

.method public j()Ljavax/net/ssl/SSLSocketFactory;
    .locals 1

    iget-object v0, p0, Lc/a;->i:Ljavax/net/ssl/SSLSocketFactory;

    return-object v0
.end method

.method public k()Lc/s;
    .locals 1

    iget-object v0, p0, Lc/a;->a:Lc/s;

    return-object v0
.end method
