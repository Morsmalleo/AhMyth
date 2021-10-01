.class public final Lokhttp3/internal/connection/RouteSelector;
.super Ljava/lang/Object;
.source "RouteSelector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/internal/connection/RouteSelector$Selection;
    }
.end annotation


# instance fields
.field private final address:Lokhttp3/Address;

.field private final call:Lokhttp3/Call;

.field private final eventListener:Lokhttp3/EventListener;

.field private inetSocketAddresses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/net/InetSocketAddress;",
            ">;"
        }
    .end annotation
.end field

.field private nextProxyIndex:I

.field private final postponedRoutes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/Route;",
            ">;"
        }
    .end annotation
.end field

.field private proxies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation
.end field

.field private final routeDatabase:Lokhttp3/internal/connection/RouteDatabase;


# direct methods
.method public constructor <init>(Lokhttp3/Address;Lokhttp3/internal/connection/RouteDatabase;Lokhttp3/Call;Lokhttp3/EventListener;)V
    .locals 2
    .param p1, "address"    # Lokhttp3/Address;
    .param p2, "routeDatabase"    # Lokhttp3/internal/connection/RouteDatabase;
    .param p3, "call"    # Lokhttp3/Call;
    .param p4, "eventListener"    # Lokhttp3/EventListener;

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->proxies:Ljava/util/List;

    .line 51
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->postponedRoutes:Ljava/util/List;

    .line 58
    iput-object p1, p0, Lokhttp3/internal/connection/RouteSelector;->address:Lokhttp3/Address;

    .line 59
    iput-object p2, p0, Lokhttp3/internal/connection/RouteSelector;->routeDatabase:Lokhttp3/internal/connection/RouteDatabase;

    .line 60
    iput-object p3, p0, Lokhttp3/internal/connection/RouteSelector;->call:Lokhttp3/Call;

    .line 61
    iput-object p4, p0, Lokhttp3/internal/connection/RouteSelector;->eventListener:Lokhttp3/EventListener;

    .line 63
    invoke-virtual {p1}, Lokhttp3/Address;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {p1}, Lokhttp3/Address;->proxy()Ljava/net/Proxy;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lokhttp3/internal/connection/RouteSelector;->resetNextProxy(Lokhttp3/HttpUrl;Ljava/net/Proxy;)V

    .line 64
    return-void
.end method

.method static getHostString(Ljava/net/InetSocketAddress;)Ljava/lang/String;
    .locals 2
    .param p0, "socketAddress"    # Ljava/net/InetSocketAddress;

    .line 205
    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 206
    .local v0, "address":Ljava/net/InetAddress;
    if-nez v0, :cond_0

    .line 210
    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 214
    :cond_0
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private hasNextProxy()Z
    .locals 2

    .line 139
    iget v0, p0, Lokhttp3/internal/connection/RouteSelector;->nextProxyIndex:I

    iget-object v1, p0, Lokhttp3/internal/connection/RouteSelector;->proxies:Ljava/util/List;

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

.method private nextProxy()Ljava/net/Proxy;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 144
    invoke-direct {p0}, Lokhttp3/internal/connection/RouteSelector;->hasNextProxy()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->proxies:Ljava/util/List;

    iget v1, p0, Lokhttp3/internal/connection/RouteSelector;->nextProxyIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lokhttp3/internal/connection/RouteSelector;->nextProxyIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Proxy;

    .line 149
    .local v0, "result":Ljava/net/Proxy;
    invoke-direct {p0, v0}, Lokhttp3/internal/connection/RouteSelector;->resetNextInetSocketAddress(Ljava/net/Proxy;)V

    .line 150
    return-object v0

    .line 145
    .end local v0    # "result":Ljava/net/Proxy;
    :cond_0
    new-instance v0, Ljava/net/SocketException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No route to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lokhttp3/internal/connection/RouteSelector;->address:Lokhttp3/Address;

    invoke-virtual {v2}, Lokhttp3/Address;->url()Lokhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; exhausted proxy configurations: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lokhttp3/internal/connection/RouteSelector;->proxies:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private resetNextInetSocketAddress(Ljava/net/Proxy;)V
    .locals 8
    .param p1, "proxy"    # Ljava/net/Proxy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 156
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    .line 160
    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v0, v1, :cond_2

    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->SOCKS:Ljava/net/Proxy$Type;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 164
    :cond_0
    invoke-virtual {p1}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v0

    .line 165
    .local v0, "proxyAddress":Ljava/net/SocketAddress;
    instance-of v1, v0, Ljava/net/InetSocketAddress;

    if-eqz v1, :cond_1

    .line 169
    move-object v1, v0

    check-cast v1, Ljava/net/InetSocketAddress;

    .line 170
    .local v1, "proxySocketAddress":Ljava/net/InetSocketAddress;
    invoke-static {v1}, Lokhttp3/internal/connection/RouteSelector;->getHostString(Ljava/net/InetSocketAddress;)Ljava/lang/String;

    move-result-object v2

    .line 171
    .local v2, "socketHost":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v3

    .local v3, "socketPort":I
    goto :goto_1

    .line 166
    .end local v1    # "proxySocketAddress":Ljava/net/InetSocketAddress;
    .end local v2    # "socketHost":Ljava/lang/String;
    .end local v3    # "socketPort":I
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Proxy.address() is not an InetSocketAddress: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 167
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 161
    .end local v0    # "proxyAddress":Ljava/net/SocketAddress;
    :cond_2
    :goto_0
    iget-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->address:Lokhttp3/Address;

    invoke-virtual {v0}, Lokhttp3/Address;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    .line 162
    .restart local v2    # "socketHost":Ljava/lang/String;
    iget-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->address:Lokhttp3/Address;

    invoke-virtual {v0}, Lokhttp3/Address;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->port()I

    move-result v3

    .line 174
    .restart local v3    # "socketPort":I
    :goto_1
    const/4 v0, 0x1

    if-lt v3, v0, :cond_6

    const v0, 0xffff

    if-gt v3, v0, :cond_6

    .line 179
    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->SOCKS:Ljava/net/Proxy$Type;

    if-ne v0, v1, :cond_3

    .line 180
    iget-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    invoke-static {v2, v3}, Ljava/net/InetSocketAddress;->createUnresolved(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 182
    :cond_3
    iget-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->eventListener:Lokhttp3/EventListener;

    iget-object v1, p0, Lokhttp3/internal/connection/RouteSelector;->call:Lokhttp3/Call;

    invoke-virtual {v0, v1, v2}, Lokhttp3/EventListener;->dnsStart(Lokhttp3/Call;Ljava/lang/String;)V

    .line 185
    iget-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->address:Lokhttp3/Address;

    invoke-virtual {v0}, Lokhttp3/Address;->dns()Lokhttp3/Dns;

    move-result-object v0

    invoke-interface {v0, v2}, Lokhttp3/Dns;->lookup(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 186
    .local v0, "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/net/InetAddress;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    .line 190
    iget-object v1, p0, Lokhttp3/internal/connection/RouteSelector;->eventListener:Lokhttp3/EventListener;

    iget-object v4, p0, Lokhttp3/internal/connection/RouteSelector;->call:Lokhttp3/Call;

    invoke-virtual {v1, v4, v2, v0}, Lokhttp3/EventListener;->dnsEnd(Lokhttp3/Call;Ljava/lang/String;Ljava/util/List;)V

    .line 192
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    .local v4, "size":I
    :goto_2
    if-ge v1, v4, :cond_4

    .line 193
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/net/InetAddress;

    .line 194
    .local v5, "inetAddress":Ljava/net/InetAddress;
    iget-object v6, p0, Lokhttp3/internal/connection/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    new-instance v7, Ljava/net/InetSocketAddress;

    invoke-direct {v7, v5, v3}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    .end local v5    # "inetAddress":Ljava/net/InetAddress;
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 197
    .end local v0    # "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/net/InetAddress;>;"
    .end local v1    # "i":I
    .end local v4    # "size":I
    :cond_4
    :goto_3
    return-void

    .line 187
    .restart local v0    # "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/net/InetAddress;>;"
    :cond_5
    new-instance v1, Ljava/net/UnknownHostException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lokhttp3/internal/connection/RouteSelector;->address:Lokhttp3/Address;

    invoke-virtual {v5}, Lokhttp3/Address;->dns()Lokhttp3/Dns;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " returned no addresses for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 175
    .end local v0    # "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/net/InetAddress;>;"
    :cond_6
    new-instance v0, Ljava/net/SocketException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No route to "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ":"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "; port is out of range"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw v0

    :goto_5
    goto :goto_4
.end method

.method private resetNextProxy(Lokhttp3/HttpUrl;Ljava/net/Proxy;)V
    .locals 4
    .param p1, "url"    # Lokhttp3/HttpUrl;
    .param p2, "proxy"    # Ljava/net/Proxy;

    .line 124
    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 126
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lokhttp3/internal/connection/RouteSelector;->proxies:Ljava/util/List;

    goto :goto_1

    .line 129
    :cond_0
    iget-object v1, p0, Lokhttp3/internal/connection/RouteSelector;->address:Lokhttp3/Address;

    invoke-virtual {v1}, Lokhttp3/Address;->proxySelector()Ljava/net/ProxySelector;

    move-result-object v1

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->uri()Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object v1

    .line 130
    .local v1, "proxiesOrNull":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 131
    invoke-static {v1}, Lokhttp3/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    goto :goto_0

    .line 132
    :cond_1
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/net/Proxy;

    sget-object v3, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    aput-object v3, v2, v0

    invoke-static {v2}, Lokhttp3/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    :goto_0
    iput-object v2, p0, Lokhttp3/internal/connection/RouteSelector;->proxies:Ljava/util/List;

    .line 134
    .end local v1    # "proxiesOrNull":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    :goto_1
    iput v0, p0, Lokhttp3/internal/connection/RouteSelector;->nextProxyIndex:I

    .line 135
    return-void
.end method


# virtual methods
.method public connectFailed(Lokhttp3/Route;Ljava/io/IOException;)V
    .locals 3
    .param p1, "failedRoute"    # Lokhttp3/Route;
    .param p2, "failure"    # Ljava/io/IOException;

    .line 113
    invoke-virtual {p1}, Lokhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->address:Lokhttp3/Address;

    invoke-virtual {v0}, Lokhttp3/Address;->proxySelector()Ljava/net/ProxySelector;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->address:Lokhttp3/Address;

    invoke-virtual {v0}, Lokhttp3/Address;->proxySelector()Ljava/net/ProxySelector;

    move-result-object v0

    iget-object v1, p0, Lokhttp3/internal/connection/RouteSelector;->address:Lokhttp3/Address;

    .line 116
    invoke-virtual {v1}, Lokhttp3/Address;->url()Lokhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl;->uri()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {p1}, Lokhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v2

    .line 115
    invoke-virtual {v0, v1, v2, p2}, Ljava/net/ProxySelector;->connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V

    .line 119
    :cond_0
    iget-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->routeDatabase:Lokhttp3/internal/connection/RouteDatabase;

    invoke-virtual {v0, p1}, Lokhttp3/internal/connection/RouteDatabase;->failed(Lokhttp3/Route;)V

    .line 120
    return-void
.end method

.method public hasNext()Z
    .locals 1

    .line 70
    invoke-direct {p0}, Lokhttp3/internal/connection/RouteSelector;->hasNextProxy()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lokhttp3/internal/connection/RouteSelector;->postponedRoutes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

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

.method public next()Lokhttp3/internal/connection/RouteSelector$Selection;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    invoke-virtual {p0}, Lokhttp3/internal/connection/RouteSelector;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .local v0, "routes":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Route;>;"
    :goto_0
    invoke-direct {p0}, Lokhttp3/internal/connection/RouteSelector;->hasNextProxy()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 84
    invoke-direct {p0}, Lokhttp3/internal/connection/RouteSelector;->nextProxy()Ljava/net/Proxy;

    move-result-object v1

    .line 85
    .local v1, "proxy":Ljava/net/Proxy;
    const/4 v2, 0x0

    .local v2, "i":I
    iget-object v3, p0, Lokhttp3/internal/connection/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "size":I
    :goto_1
    if-ge v2, v3, :cond_1

    .line 86
    new-instance v4, Lokhttp3/Route;

    iget-object v5, p0, Lokhttp3/internal/connection/RouteSelector;->address:Lokhttp3/Address;

    iget-object v6, p0, Lokhttp3/internal/connection/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/net/InetSocketAddress;

    invoke-direct {v4, v5, v1, v6}, Lokhttp3/Route;-><init>(Lokhttp3/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;)V

    .line 87
    .local v4, "route":Lokhttp3/Route;
    iget-object v5, p0, Lokhttp3/internal/connection/RouteSelector;->routeDatabase:Lokhttp3/internal/connection/RouteDatabase;

    invoke-virtual {v5, v4}, Lokhttp3/internal/connection/RouteDatabase;->shouldPostpone(Lokhttp3/Route;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 88
    iget-object v5, p0, Lokhttp3/internal/connection/RouteSelector;->postponedRoutes:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 90
    :cond_0
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .end local v4    # "route":Lokhttp3/Route;
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 94
    .end local v2    # "i":I
    .end local v3    # "size":I
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 95
    goto :goto_3

    .line 97
    .end local v1    # "proxy":Ljava/net/Proxy;
    :cond_2
    goto :goto_0

    .line 99
    :cond_3
    :goto_3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 101
    iget-object v1, p0, Lokhttp3/internal/connection/RouteSelector;->postponedRoutes:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 102
    iget-object v1, p0, Lokhttp3/internal/connection/RouteSelector;->postponedRoutes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 105
    :cond_4
    new-instance v1, Lokhttp3/internal/connection/RouteSelector$Selection;

    invoke-direct {v1, v0}, Lokhttp3/internal/connection/RouteSelector$Selection;-><init>(Ljava/util/List;)V

    return-object v1

    .line 75
    .end local v0    # "routes":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Route;>;"
    :cond_5
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    goto :goto_5

    :goto_4
    throw v0

    :goto_5
    goto :goto_4
.end method
