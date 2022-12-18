.class public final Lc/c0;
.super Ljava/lang/Object;
.source ""


# instance fields
.field final a:Lc/a;

.field final b:Ljava/net/Proxy;

.field final c:Ljava/net/InetSocketAddress;


# direct methods
.method public constructor <init>(Lc/a;Ljava/net/Proxy;Ljava/net/InetSocketAddress;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    iput-object p1, p0, Lc/c0;->a:Lc/a;

    iput-object p2, p0, Lc/c0;->b:Ljava/net/Proxy;

    iput-object p3, p0, Lc/c0;->c:Ljava/net/InetSocketAddress;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "inetSocketAddress == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "proxy == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "address == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public a()Lc/a;
    .locals 1

    iget-object v0, p0, Lc/c0;->a:Lc/a;

    return-object v0
.end method

.method public b()Ljava/net/Proxy;
    .locals 1

    iget-object v0, p0, Lc/c0;->b:Ljava/net/Proxy;

    return-object v0
.end method

.method public c()Z
    .locals 2

    iget-object v0, p0, Lc/c0;->a:Lc/a;

    iget-object v0, v0, Lc/a;->i:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/c0;->b:Ljava/net/Proxy;

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public d()Ljava/net/InetSocketAddress;
    .locals 1

    iget-object v0, p0, Lc/c0;->c:Ljava/net/InetSocketAddress;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    instance-of v0, p1, Lc/c0;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    check-cast p1, Lc/c0;

    iget-object v0, p0, Lc/c0;->a:Lc/a;

    iget-object v2, p1, Lc/c0;->a:Lc/a;

    invoke-virtual {v0, v2}, Lc/a;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/c0;->b:Ljava/net/Proxy;

    iget-object v2, p1, Lc/c0;->b:Ljava/net/Proxy;

    invoke-virtual {v0, v2}, Ljava/net/Proxy;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/c0;->c:Ljava/net/InetSocketAddress;

    iget-object p1, p1, Lc/c0;->c:Ljava/net/InetSocketAddress;

    invoke-virtual {v0, p1}, Ljava/net/InetSocketAddress;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lc/c0;->a:Lc/a;

    invoke-virtual {v0}, Lc/a;->hashCode()I

    move-result v0

    const/16 v1, 0x20f

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lc/c0;->b:Ljava/net/Proxy;

    invoke-virtual {v0}, Ljava/net/Proxy;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lc/c0;->c:Ljava/net/InetSocketAddress;

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    return v1
.end method
