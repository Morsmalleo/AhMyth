.class public final Lokhttp3/internal/http/RealResponseBody;
.super Lokhttp3/ResponseBody;
.source "RealResponseBody.java"


# instance fields
.field private final headers:Lokhttp3/Headers;

.field private final source:Lokio/BufferedSource;


# direct methods
.method public constructor <init>(Lokhttp3/Headers;Lokio/BufferedSource;)V
    .locals 0

    .line 27
    invoke-direct {p0}, Lokhttp3/ResponseBody;-><init>()V

    .line 28
    iput-object p1, p0, Lokhttp3/internal/http/RealResponseBody;->headers:Lokhttp3/Headers;

    .line 29
    iput-object p2, p0, Lokhttp3/internal/http/RealResponseBody;->source:Lokio/BufferedSource;

    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 38
    iget-object v0, p0, Lokhttp3/internal/http/RealResponseBody;->headers:Lokhttp3/Headers;

    invoke-static {v0}, Lokhttp3/internal/http/HttpHeaders;->contentLength(Lokhttp3/Headers;)J

    move-result-wide v0

    return-wide v0
.end method

.method public contentType()Lokhttp3/MediaType;
    .locals 2

    .line 33
    iget-object v0, p0, Lokhttp3/internal/http/RealResponseBody;->headers:Lokhttp3/Headers;

    const-string v1, "Content-Type"

    invoke-virtual {v0, v1}, Lokhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 34
    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public source()Lokio/BufferedSource;
    .locals 1

    .line 42
    iget-object v0, p0, Lokhttp3/internal/http/RealResponseBody;->source:Lokio/BufferedSource;

    return-object v0
.end method
