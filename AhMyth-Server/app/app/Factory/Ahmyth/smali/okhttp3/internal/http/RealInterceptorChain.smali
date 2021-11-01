.class public final Lokhttp3/internal/http/RealInterceptorChain;
.super Ljava/lang/Object;
.source "RealInterceptorChain.java"

# interfaces
.implements Lokhttp3/Interceptor$Chain;


# instance fields
.field private calls:I

.field private final connection:Lokhttp3/Connection;

.field private final httpCodec:Lokhttp3/internal/http/HttpCodec;

.field private final index:I

.field private final interceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/Interceptor;",
            ">;"
        }
    .end annotation
.end field

.field private final request:Lokhttp3/Request;

.field private final streamAllocation:Lokhttp3/internal/connection/StreamAllocation;


# direct methods
.method public constructor <init>(Ljava/util/List;Lokhttp3/internal/connection/StreamAllocation;Lokhttp3/internal/http/HttpCodec;Lokhttp3/Connection;ILokhttp3/Request;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lokhttp3/Interceptor;",
            ">;",
            "Lokhttp3/internal/connection/StreamAllocation;",
            "Lokhttp3/internal/http/HttpCodec;",
            "Lokhttp3/Connection;",
            "I",
            "Lokhttp3/Request;",
            ")V"
        }
    .end annotation

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    .line 43
    iput-object p4, p0, Lokhttp3/internal/http/RealInterceptorChain;->connection:Lokhttp3/Connection;

    .line 44
    iput-object p2, p0, Lokhttp3/internal/http/RealInterceptorChain;->streamAllocation:Lokhttp3/internal/connection/StreamAllocation;

    .line 45
    iput-object p3, p0, Lokhttp3/internal/http/RealInterceptorChain;->httpCodec:Lokhttp3/internal/http/HttpCodec;

    .line 46
    iput p5, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    .line 47
    iput-object p6, p0, Lokhttp3/internal/http/RealInterceptorChain;->request:Lokhttp3/Request;

    return-void
.end method

.method private sameConnection(Lokhttp3/HttpUrl;)Z
    .locals 2

    .line 109
    invoke-virtual {p1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lokhttp3/internal/http/RealInterceptorChain;->connection:Lokhttp3/Connection;

    invoke-interface {v1}, Lokhttp3/Connection;->route()Lokhttp3/Route;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Route;->address()Lokhttp3/Address;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Address;->url()Lokhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    invoke-virtual {p1}, Lokhttp3/HttpUrl;->port()I

    move-result p1

    iget-object v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->connection:Lokhttp3/Connection;

    invoke-interface {v0}, Lokhttp3/Connection;->route()Lokhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Route;->address()Lokhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Address;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->port()I

    move-result v0

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public connection()Lokhttp3/Connection;
    .locals 1

    .line 51
    iget-object v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->connection:Lokhttp3/Connection;

    return-object v0
.end method

.method public httpStream()Lokhttp3/internal/http/HttpCodec;
    .locals 1

    .line 59
    iget-object v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->httpCodec:Lokhttp3/internal/http/HttpCodec;

    return-object v0
.end method

.method public proceed(Lokhttp3/Request;)Lokhttp3/Response;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->streamAllocation:Lokhttp3/internal/connection/StreamAllocation;

    iget-object v1, p0, Lokhttp3/internal/http/RealInterceptorChain;->httpCodec:Lokhttp3/internal/http/HttpCodec;

    iget-object v2, p0, Lokhttp3/internal/http/RealInterceptorChain;->connection:Lokhttp3/Connection;

    invoke-virtual {p0, p1, v0, v1, v2}, Lokhttp3/internal/http/RealInterceptorChain;->proceed(Lokhttp3/Request;Lokhttp3/internal/connection/StreamAllocation;Lokhttp3/internal/http/HttpCodec;Lokhttp3/Connection;)Lokhttp3/Response;

    move-result-object p1

    return-object p1
.end method

.method public proceed(Lokhttp3/Request;Lokhttp3/internal/connection/StreamAllocation;Lokhttp3/internal/http/HttpCodec;Lokhttp3/Connection;)Lokhttp3/Response;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    iget v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    iget-object v1, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_7

    .line 74
    iget v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->calls:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->calls:I

    .line 77
    iget-object v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->httpCodec:Lokhttp3/internal/http/HttpCodec;

    const-string v2, "network interceptor "

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-direct {p0, v0}, Lokhttp3/internal/http/RealInterceptorChain;->sameConnection(Lokhttp3/HttpUrl;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 78
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object p3, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    iget p4, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    sub-int/2addr p4, v1

    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " must retain the same host and port"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 83
    :cond_1
    :goto_0
    iget-object v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->httpCodec:Lokhttp3/internal/http/HttpCodec;

    const-string v3, " must call proceed() exactly once"

    if-eqz v0, :cond_3

    iget v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->calls:I

    if-gt v0, v1, :cond_2

    goto :goto_1

    .line 84
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object p3, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    iget p4, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    sub-int/2addr p4, v1

    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 89
    :cond_3
    :goto_1
    new-instance v0, Lokhttp3/internal/http/RealInterceptorChain;

    iget-object v5, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    iget v4, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    add-int/lit8 v9, v4, 0x1

    move-object v4, v0

    move-object v6, p2

    move-object v7, p3

    move-object v8, p4

    move-object v10, p1

    invoke-direct/range {v4 .. v10}, Lokhttp3/internal/http/RealInterceptorChain;-><init>(Ljava/util/List;Lokhttp3/internal/connection/StreamAllocation;Lokhttp3/internal/http/HttpCodec;Lokhttp3/Connection;ILokhttp3/Request;)V

    .line 91
    iget-object p1, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    iget p2, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lokhttp3/Interceptor;

    .line 92
    invoke-interface {p1, v0}, Lokhttp3/Interceptor;->intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;

    move-result-object p2

    if-eqz p3, :cond_5

    .line 95
    iget p3, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    add-int/2addr p3, v1

    iget-object p4, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p4

    if-ge p3, p4, :cond_5

    iget p3, v0, Lokhttp3/internal/http/RealInterceptorChain;->calls:I

    if-ne p3, v1, :cond_4

    goto :goto_2

    .line 96
    :cond_4
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_5
    :goto_2
    if-eqz p2, :cond_6

    return-object p2

    .line 102
    :cond_6
    new-instance p2, Ljava/lang/NullPointerException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "interceptor "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " returned null"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 72
    :cond_7
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    throw p1
.end method

.method public request()Lokhttp3/Request;
    .locals 1

    .line 63
    iget-object v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->request:Lokhttp3/Request;

    return-object v0
.end method

.method public streamAllocation()Lokhttp3/internal/connection/StreamAllocation;
    .locals 1

    .line 55
    iget-object v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->streamAllocation:Lokhttp3/internal/connection/StreamAllocation;

    return-object v0
.end method
