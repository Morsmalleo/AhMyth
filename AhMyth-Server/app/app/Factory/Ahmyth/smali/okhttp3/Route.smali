.class public final Lokhttp3/Route;
.super Ljava/lang/Object;
.source "Route.java"


# instance fields
.field final address:Lokhttp3/Address;

.field final inetSocketAddress:Ljava/net/InetSocketAddress;

.field final proxy:Ljava/net/Proxy;


# direct methods
.method public constructor <init>(Lokhttp3/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;)V
    .locals 2
    .param p1, "address"    # Lokhttp3/Address;
    .param p2, "proxy"    # Ljava/net/Proxy;
    .param p3, "inetSocketAddress"    # Ljava/net/InetSocketAddress;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    if-eqz p1, :cond_2

    .line 46
    if-eqz p2, :cond_1

    .line 49
    if-eqz p3, :cond_0

    .line 52
    iput-object p1, p0, Lokhttp3/Route;->address:Lokhttp3/Address;

    .line 53
    iput-object p2, p0, Lokhttp3/Route;->proxy:Ljava/net/Proxy;

    .line 54
    iput-object p3, p0, Lokhttp3/Route;->inetSocketAddress:Ljava/net/InetSocketAddress;

    .line 55
    return-void

    .line 50
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "inetSocketAddress == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "proxy == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "address == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public address()Lokhttp3/Address;
    .locals 1

    .line 58
    iget-object v0, p0, Lokhttp3/Route;->address:Lokhttp3/Address;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "other"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 84
    instance-of v0, p1, Lokhttp3/Route;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lokhttp3/Route;

    iget-object v0, v0, Lokhttp3/Route;->address:Lokhttp3/Address;

    iget-object v1, p0, Lokhttp3/Route;->address:Lokhttp3/Address;

    .line 85
    invoke-virtual {v0, v1}, Lokhttp3/Address;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lokhttp3/Route;

    iget-object v0, v0, Lokhttp3/Route;->proxy:Ljava/net/Proxy;

    iget-object v1, p0, Lokhttp3/Route;->proxy:Ljava/net/Proxy;

    .line 86
    invoke-virtual {v0, v1}, Ljava/net/Proxy;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lokhttp3/Route;

    iget-object v0, v0, Lokhttp3/Route;->inetSocketAddress:Ljava/net/InetSocketAddress;

    iget-object v1, p0, Lokhttp3/Route;->inetSocketAddress:Ljava/net/InetSocketAddress;

    .line 87
    invoke-virtual {v0, v1}, Ljava/net/InetSocketAddress;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 84
    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 91
    const/16 v0, 0x11

    .line 92
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lokhttp3/Route;->address:Lokhttp3/Address;

    invoke-virtual {v2}, Lokhttp3/Address;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    .line 93
    .end local v0    # "result":I
    .local v1, "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lokhttp3/Route;->proxy:Ljava/net/Proxy;

    invoke-virtual {v2}, Ljava/net/Proxy;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    .line 94
    .end local v1    # "result":I
    .restart local v0    # "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lokhttp3/Route;->inetSocketAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    .line 95
    .end local v0    # "result":I
    .restart local v1    # "result":I
    return v1
.end method

.method public proxy()Ljava/net/Proxy;
    .locals 1

    .line 68
    iget-object v0, p0, Lokhttp3/Route;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public requiresTunnel()Z
    .locals 2

    .line 80
    iget-object v0, p0, Lokhttp3/Route;->address:Lokhttp3/Address;

    iget-object v0, v0, Lokhttp3/Address;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lokhttp3/Route;->proxy:Ljava/net/Proxy;

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

.method public socketAddress()Ljava/net/InetSocketAddress;
    .locals 1

    .line 72
    iget-object v0, p0, Lokhttp3/Route;->inetSocketAddress:Ljava/net/InetSocketAddress;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Route{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lokhttp3/Route;->inetSocketAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
