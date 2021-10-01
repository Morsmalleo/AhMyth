.class Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;
.super Lokhttp3/internal/http1/Http1Codec$AbstractSource;
.source "Http1Codec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/http1/Http1Codec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FixedLengthSource"
.end annotation


# instance fields
.field private bytesRemaining:J

.field final synthetic this$0:Lokhttp3/internal/http1/Http1Codec;


# direct methods
.method constructor <init>(Lokhttp3/internal/http1/Http1Codec;J)V
    .locals 3
    .param p2, "length"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 395
    iput-object p1, p0, Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;->this$0:Lokhttp3/internal/http1/Http1Codec;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lokhttp3/internal/http1/Http1Codec$AbstractSource;-><init>(Lokhttp3/internal/http1/Http1Codec;Lokhttp3/internal/http1/Http1Codec$1;)V

    .line 396
    iput-wide p2, p0, Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;->bytesRemaining:J

    .line 397
    const-wide/16 v1, 0x0

    cmp-long p1, p2, v1

    if-nez p1, :cond_0

    .line 398
    const/4 p1, 0x1

    invoke-virtual {p0, p1, v0}, Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;->endOfInput(ZLjava/io/IOException;)V

    .line 400
    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 422
    iget-boolean v0, p0, Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;->closed:Z

    if-eqz v0, :cond_0

    return-void

    .line 424
    :cond_0
    iget-wide v0, p0, Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;->bytesRemaining:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    const/16 v0, 0x64

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, v0, v1}, Lokhttp3/internal/Util;->discard(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 425
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;->endOfInput(ZLjava/io/IOException;)V

    .line 428
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;->closed:Z

    .line 429
    return-void
.end method

.method public read(Lokio/Buffer;J)J
    .locals 7
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 403
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_4

    .line 404
    iget-boolean v2, p0, Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;->closed:Z

    if-nez v2, :cond_3

    .line 405
    iget-wide v2, p0, Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;->bytesRemaining:J

    const-wide/16 v4, -0x1

    cmp-long v6, v2, v0

    if-nez v6, :cond_0

    return-wide v4

    .line 407
    :cond_0
    invoke-static {v2, v3, p2, p3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    invoke-super {p0, p1, v2, v3}, Lokhttp3/internal/http1/Http1Codec$AbstractSource;->read(Lokio/Buffer;J)J

    move-result-wide v2

    .line 408
    .local v2, "read":J
    cmp-long v6, v2, v4

    if-eqz v6, :cond_2

    .line 414
    iget-wide v4, p0, Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;->bytesRemaining:J

    sub-long/2addr v4, v2

    iput-wide v4, p0, Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;->bytesRemaining:J

    .line 415
    cmp-long v6, v4, v0

    if-nez v6, :cond_1

    .line 416
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;->endOfInput(ZLjava/io/IOException;)V

    .line 418
    :cond_1
    return-wide v2

    .line 409
    :cond_2
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "unexpected end of stream"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 410
    .local v0, "e":Ljava/net/ProtocolException;
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Lokhttp3/internal/http1/Http1Codec$FixedLengthSource;->endOfInput(ZLjava/io/IOException;)V

    .line 411
    throw v0

    .line 404
    .end local v0    # "e":Ljava/net/ProtocolException;
    .end local v2    # "read":J
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 403
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "byteCount < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
