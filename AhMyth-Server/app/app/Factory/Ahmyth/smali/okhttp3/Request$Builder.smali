.class public Lokhttp3/Request$Builder;
.super Ljava/lang/Object;
.source "Request.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field body:Lokhttp3/RequestBody;

.field headers:Lokhttp3/Headers$Builder;

.field method:Ljava/lang/String;

.field tag:Ljava/lang/Object;

.field url:Lokhttp3/HttpUrl;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "GET"

    .line 107
    iput-object v0, p0, Lokhttp3/Request$Builder;->method:Ljava/lang/String;

    .line 108
    new-instance v0, Lokhttp3/Headers$Builder;

    invoke-direct {v0}, Lokhttp3/Headers$Builder;-><init>()V

    iput-object v0, p0, Lokhttp3/Request$Builder;->headers:Lokhttp3/Headers$Builder;

    return-void
.end method

.method constructor <init>(Lokhttp3/Request;)V
    .locals 1

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iget-object v0, p1, Lokhttp3/Request;->url:Lokhttp3/HttpUrl;

    iput-object v0, p0, Lokhttp3/Request$Builder;->url:Lokhttp3/HttpUrl;

    .line 113
    iget-object v0, p1, Lokhttp3/Request;->method:Ljava/lang/String;

    iput-object v0, p0, Lokhttp3/Request$Builder;->method:Ljava/lang/String;

    .line 114
    iget-object v0, p1, Lokhttp3/Request;->body:Lokhttp3/RequestBody;

    iput-object v0, p0, Lokhttp3/Request$Builder;->body:Lokhttp3/RequestBody;

    .line 115
    iget-object v0, p1, Lokhttp3/Request;->tag:Ljava/lang/Object;

    iput-object v0, p0, Lokhttp3/Request$Builder;->tag:Ljava/lang/Object;

    .line 116
    iget-object p1, p1, Lokhttp3/Request;->headers:Lokhttp3/Headers;

    invoke-virtual {p1}, Lokhttp3/Headers;->newBuilder()Lokhttp3/Headers$Builder;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/Request$Builder;->headers:Lokhttp3/Headers$Builder;

    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;
    .locals 1

    .line 176
    iget-object v0, p0, Lokhttp3/Request$Builder;->headers:Lokhttp3/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lokhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    return-object p0
.end method

.method public build()Lokhttp3/Request;
    .locals 2

    .line 254
    iget-object v0, p0, Lokhttp3/Request$Builder;->url:Lokhttp3/HttpUrl;

    if-eqz v0, :cond_0

    .line 255
    new-instance v0, Lokhttp3/Request;

    invoke-direct {v0, p0}, Lokhttp3/Request;-><init>(Lokhttp3/Request$Builder;)V

    return-object v0

    .line 254
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "url == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public cacheControl(Lokhttp3/CacheControl;)Lokhttp3/Request$Builder;
    .locals 2

    .line 197
    invoke-virtual {p1}, Lokhttp3/CacheControl;->toString()Ljava/lang/String;

    move-result-object p1

    .line 198
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const-string v1, "Cache-Control"

    if-eqz v0, :cond_0

    invoke-virtual {p0, v1}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p1

    return-object p1

    .line 199
    :cond_0
    invoke-virtual {p0, v1, p1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public delete()Lokhttp3/Request$Builder;
    .locals 1

    .line 219
    sget-object v0, Lokhttp3/internal/Util;->EMPTY_REQUEST:Lokhttp3/RequestBody;

    invoke-virtual {p0, v0}, Lokhttp3/Request$Builder;->delete(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    return-object v0
.end method

.method public delete(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;
    .locals 1

    const-string v0, "DELETE"

    .line 215
    invoke-virtual {p0, v0, p1}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public get()Lokhttp3/Request$Builder;
    .locals 2

    const-string v0, "GET"

    const/4 v1, 0x0

    .line 203
    invoke-virtual {p0, v0, v1}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    return-object v0
.end method

.method public head()Lokhttp3/Request$Builder;
    .locals 2

    const-string v0, "HEAD"

    const/4 v1, 0x0

    .line 207
    invoke-virtual {p0, v0, v1}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    return-object v0
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;
    .locals 1

    .line 164
    iget-object v0, p0, Lokhttp3/Request$Builder;->headers:Lokhttp3/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lokhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    return-object p0
.end method

.method public headers(Lokhttp3/Headers;)Lokhttp3/Request$Builder;
    .locals 0

    .line 187
    invoke-virtual {p1}, Lokhttp3/Headers;->newBuilder()Lokhttp3/Headers$Builder;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/Request$Builder;->headers:Lokhttp3/Headers$Builder;

    return-object p0
.end method

.method public method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;
    .locals 2

    if-eqz p1, :cond_5

    .line 232
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "method "

    if-eqz p2, :cond_1

    .line 233
    invoke-static {p1}, Lokhttp3/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 234
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " must not have a request body."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_1
    :goto_0
    if-nez p2, :cond_3

    .line 236
    invoke-static {p1}, Lokhttp3/internal/http/HttpMethod;->requiresRequestBody(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_1

    .line 237
    :cond_2
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " must have a request body."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 239
    :cond_3
    :goto_1
    iput-object p1, p0, Lokhttp3/Request$Builder;->method:Ljava/lang/String;

    .line 240
    iput-object p2, p0, Lokhttp3/Request$Builder;->body:Lokhttp3/RequestBody;

    return-object p0

    .line 232
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "method.length() == 0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 231
    :cond_5
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "method == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public patch(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;
    .locals 1

    const-string v0, "PATCH"

    .line 227
    invoke-virtual {p0, v0, p1}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;
    .locals 1

    const-string v0, "POST"

    .line 211
    invoke-virtual {p0, v0, p1}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public put(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;
    .locals 1

    const-string v0, "PUT"

    .line 223
    invoke-virtual {p0, v0, p1}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;
    .locals 1

    .line 181
    iget-object v0, p0, Lokhttp3/Request$Builder;->headers:Lokhttp3/Headers$Builder;

    invoke-virtual {v0, p1}, Lokhttp3/Headers$Builder;->removeAll(Ljava/lang/String;)Lokhttp3/Headers$Builder;

    return-object p0
.end method

.method public tag(Ljava/lang/Object;)Lokhttp3/Request$Builder;
    .locals 0

    .line 249
    iput-object p1, p0, Lokhttp3/Request$Builder;->tag:Ljava/lang/Object;

    return-object p0
.end method

.method public url(Ljava/lang/String;)Lokhttp3/Request$Builder;
    .locals 6

    if-eqz p1, :cond_3

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x3

    const-string v3, "ws:"

    move-object v0, p1

    .line 135
    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x4

    const-string v3, "wss:"

    move-object v0, p1

    .line 137
    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 141
    :cond_1
    :goto_0
    invoke-static {p1}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 143
    invoke-virtual {p0, v0}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object p1

    return-object p1

    .line 142
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected url: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "url == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public url(Ljava/net/URL;)Lokhttp3/Request$Builder;
    .locals 3

    if-eqz p1, :cond_1

    .line 154
    invoke-static {p1}, Lokhttp3/HttpUrl;->get(Ljava/net/URL;)Lokhttp3/HttpUrl;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 156
    invoke-virtual {p0, v0}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object p1

    return-object p1

    .line 155
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected url: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "url == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;
    .locals 1

    if-eqz p1, :cond_0

    .line 121
    iput-object p1, p0, Lokhttp3/Request$Builder;->url:Lokhttp3/HttpUrl;

    return-object p0

    .line 120
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "url == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
