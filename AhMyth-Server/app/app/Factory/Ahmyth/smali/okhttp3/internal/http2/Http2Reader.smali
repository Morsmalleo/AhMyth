.class final Lokhttp3/internal/http2/Http2Reader;
.super Ljava/lang/Object;
.source "Http2Reader.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/internal/http2/Http2Reader$Handler;,
        Lokhttp3/internal/http2/Http2Reader$ContinuationSource;
    }
.end annotation


# static fields
.field static final logger:Ljava/util/logging/Logger;


# instance fields
.field private final client:Z

.field private final continuation:Lokhttp3/internal/http2/Http2Reader$ContinuationSource;

.field final hpackReader:Lokhttp3/internal/http2/Hpack$Reader;

.field private final source:Lokio/BufferedSource;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 60
    const-class v0, Lokhttp3/internal/http2/Http2;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http2/Http2Reader;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method constructor <init>(Lokio/BufferedSource;Z)V
    .locals 3
    .param p1, "source"    # Lokio/BufferedSource;
    .param p2, "client"    # Z

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    .line 72
    iput-boolean p2, p0, Lokhttp3/internal/http2/Http2Reader;->client:Z

    .line 73
    new-instance v0, Lokhttp3/internal/http2/Http2Reader$ContinuationSource;

    invoke-direct {v0, p1}, Lokhttp3/internal/http2/Http2Reader$ContinuationSource;-><init>(Lokio/BufferedSource;)V

    iput-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->continuation:Lokhttp3/internal/http2/Http2Reader$ContinuationSource;

    .line 74
    new-instance v1, Lokhttp3/internal/http2/Hpack$Reader;

    const/16 v2, 0x1000

    invoke-direct {v1, v2, v0}, Lokhttp3/internal/http2/Hpack$Reader;-><init>(ILokio/Source;)V

    iput-object v1, p0, Lokhttp3/internal/http2/Http2Reader;->hpackReader:Lokhttp3/internal/http2/Hpack$Reader;

    .line 75
    return-void
.end method

.method static lengthWithoutPadding(IBS)I
    .locals 3
    .param p0, "length"    # I
    .param p1, "flags"    # B
    .param p2, "padding"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 406
    and-int/lit8 v0, p1, 0x8

    if-eqz v0, :cond_0

    add-int/lit8 p0, p0, -0x1

    .line 407
    :cond_0
    if-gt p2, p0, :cond_1

    .line 410
    sub-int v0, p0, p2

    int-to-short v0, v0

    return v0

    .line 408
    :cond_1
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const-string v1, "PROTOCOL_ERROR padding %s > remaining length %s"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method private readData(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V
    .locals 6
    .param p1, "handler"    # Lokhttp3/internal/http2/Http2Reader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 202
    const/4 v0, 0x0

    if-eqz p4, :cond_4

    .line 205
    and-int/lit8 v1, p3, 0x1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 206
    .local v1, "inFinished":Z
    :goto_0
    and-int/lit8 v3, p3, 0x20

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    .line 207
    .local v2, "gzipped":Z
    :goto_1
    if-nez v2, :cond_3

    .line 211
    and-int/lit8 v3, p3, 0x8

    if-eqz v3, :cond_2

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    .line 212
    .local v0, "padding":S
    :cond_2
    invoke-static {p2, p3, v0}, Lokhttp3/internal/http2/Http2Reader;->lengthWithoutPadding(IBS)I

    move-result p2

    .line 214
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {p1, v1, p4, v3, p2}, Lokhttp3/internal/http2/Http2Reader$Handler;->data(ZILokio/BufferedSource;I)V

    .line 215
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    int-to-long v4, v0

    invoke-interface {v3, v4, v5}, Lokio/BufferedSource;->skip(J)V

    .line 216
    return-void

    .line 208
    .end local v0    # "padding":S
    :cond_3
    new-array v0, v0, [Ljava/lang/Object;

    const-string v3, "PROTOCOL_ERROR: FLAG_COMPRESSED without SETTINGS_COMPRESS_DATA"

    invoke-static {v3, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 202
    .end local v1    # "inFinished":Z
    .end local v2    # "gzipped":Z
    :cond_4
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "PROTOCOL_ERROR: TYPE_DATA streamId == 0"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method private readGoAway(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V
    .locals 8
    .param p1, "handler"    # Lokhttp3/internal/http2/Http2Reader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 317
    const/4 v0, 0x1

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-lt p2, v1, :cond_3

    .line 318
    if-nez p4, :cond_2

    .line 319
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v1}, Lokio/BufferedSource;->readInt()I

    move-result v1

    .line 320
    .local v1, "lastStreamId":I
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v3}, Lokio/BufferedSource;->readInt()I

    move-result v3

    .line 321
    .local v3, "errorCodeInt":I
    add-int/lit8 v4, p2, -0x8

    .line 322
    .local v4, "opaqueDataLength":I
    invoke-static {v3}, Lokhttp3/internal/http2/ErrorCode;->fromHttp2(I)Lokhttp3/internal/http2/ErrorCode;

    move-result-object v5

    .line 323
    .local v5, "errorCode":Lokhttp3/internal/http2/ErrorCode;
    if-eqz v5, :cond_1

    .line 326
    sget-object v0, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    .line 327
    .local v0, "debugData":Lokio/ByteString;
    if-lez v4, :cond_0

    .line 328
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    int-to-long v6, v4

    invoke-interface {v2, v6, v7}, Lokio/BufferedSource;->readByteString(J)Lokio/ByteString;

    move-result-object v0

    .line 330
    :cond_0
    invoke-interface {p1, v1, v5, v0}, Lokhttp3/internal/http2/Http2Reader$Handler;->goAway(ILokhttp3/internal/http2/ErrorCode;Lokio/ByteString;)V

    .line 331
    return-void

    .line 324
    .end local v0    # "debugData":Lokio/ByteString;
    :cond_1
    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v0, v2

    const-string v2, "TYPE_GOAWAY unexpected error code: %d"

    invoke-static {v2, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 318
    .end local v1    # "lastStreamId":I
    .end local v3    # "errorCodeInt":I
    .end local v4    # "opaqueDataLength":I
    .end local v5    # "errorCode":Lokhttp3/internal/http2/ErrorCode;
    :cond_2
    new-array v0, v2, [Ljava/lang/Object;

    const-string v1, "TYPE_GOAWAY streamId != 0"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 317
    :cond_3
    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v2

    const-string v1, "TYPE_GOAWAY length < 8: %s"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method private readHeaderBlock(ISBI)Ljava/util/List;
    .locals 1
    .param p1, "length"    # I
    .param p2, "padding"    # S
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ISBI)",
            "Ljava/util/List<",
            "Lokhttp3/internal/http2/Header;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 189
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->continuation:Lokhttp3/internal/http2/Http2Reader$ContinuationSource;

    iput p1, v0, Lokhttp3/internal/http2/Http2Reader$ContinuationSource;->left:I

    iput p1, v0, Lokhttp3/internal/http2/Http2Reader$ContinuationSource;->length:I

    .line 190
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->continuation:Lokhttp3/internal/http2/Http2Reader$ContinuationSource;

    iput-short p2, v0, Lokhttp3/internal/http2/Http2Reader$ContinuationSource;->padding:S

    .line 191
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->continuation:Lokhttp3/internal/http2/Http2Reader$ContinuationSource;

    iput-byte p3, v0, Lokhttp3/internal/http2/Http2Reader$ContinuationSource;->flags:B

    .line 192
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->continuation:Lokhttp3/internal/http2/Http2Reader$ContinuationSource;

    iput p4, v0, Lokhttp3/internal/http2/Http2Reader$ContinuationSource;->streamId:I

    .line 196
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->hpackReader:Lokhttp3/internal/http2/Hpack$Reader;

    invoke-virtual {v0}, Lokhttp3/internal/http2/Hpack$Reader;->readHeaders()V

    .line 197
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->hpackReader:Lokhttp3/internal/http2/Hpack$Reader;

    invoke-virtual {v0}, Lokhttp3/internal/http2/Hpack$Reader;->getAndResetHeaderList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private readHeaders(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V
    .locals 4
    .param p1, "handler"    # Lokhttp3/internal/http2/Http2Reader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 169
    const/4 v0, 0x0

    if-eqz p4, :cond_3

    .line 171
    and-int/lit8 v1, p3, 0x1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 173
    .local v1, "endStream":Z
    :goto_0
    and-int/lit8 v2, p3, 0x8

    if-eqz v2, :cond_1

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    .line 175
    .local v0, "padding":S
    :cond_1
    and-int/lit8 v2, p3, 0x20

    if-eqz v2, :cond_2

    .line 176
    invoke-direct {p0, p1, p4}, Lokhttp3/internal/http2/Http2Reader;->readPriority(Lokhttp3/internal/http2/Http2Reader$Handler;I)V

    .line 177
    add-int/lit8 p2, p2, -0x5

    .line 180
    :cond_2
    invoke-static {p2, p3, v0}, Lokhttp3/internal/http2/Http2Reader;->lengthWithoutPadding(IBS)I

    move-result p2

    .line 182
    invoke-direct {p0, p2, v0, p3, p4}, Lokhttp3/internal/http2/Http2Reader;->readHeaderBlock(ISBI)Ljava/util/List;

    move-result-object v2

    .line 184
    .local v2, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    const/4 v3, -0x1

    invoke-interface {p1, v1, p4, v3, v2}, Lokhttp3/internal/http2/Http2Reader$Handler;->headers(ZIILjava/util/List;)V

    .line 185
    return-void

    .line 169
    .end local v0    # "padding":S
    .end local v1    # "endStream":Z
    .end local v2    # "headerBlock":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    :cond_3
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "PROTOCOL_ERROR: TYPE_HEADERS streamId == 0"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method static readMedium(Lokio/BufferedSource;)I
    .locals 2
    .param p0, "source"    # Lokio/BufferedSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 399
    invoke-interface {p0}, Lokio/BufferedSource;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x10

    .line 400
    invoke-interface {p0}, Lokio/BufferedSource;->readByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 401
    invoke-interface {p0}, Lokio/BufferedSource;->readByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 399
    return v0
.end method

.method private readPing(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V
    .locals 5
    .param p1, "handler"    # Lokhttp3/internal/http2/Http2Reader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 307
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/16 v2, 0x8

    if-ne p2, v2, :cond_2

    .line 308
    if-nez p4, :cond_1

    .line 309
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v2}, Lokio/BufferedSource;->readInt()I

    move-result v2

    .line 310
    .local v2, "payload1":I
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v3}, Lokio/BufferedSource;->readInt()I

    move-result v3

    .line 311
    .local v3, "payload2":I
    and-int/lit8 v4, p3, 0x1

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    .line 312
    .local v0, "ack":Z
    :cond_0
    invoke-interface {p1, v0, v2, v3}, Lokhttp3/internal/http2/Http2Reader$Handler;->ping(ZII)V

    .line 313
    return-void

    .line 308
    .end local v0    # "ack":Z
    .end local v2    # "payload1":I
    .end local v3    # "payload2":I
    :cond_1
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "TYPE_PING streamId != 0"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 307
    :cond_2
    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v0

    const-string v0, "TYPE_PING length != 8: %s"

    invoke-static {v0, v1}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method private readPriority(Lokhttp3/internal/http2/Http2Reader$Handler;I)V
    .locals 5
    .param p1, "handler"    # Lokhttp3/internal/http2/Http2Reader$Handler;
    .param p2, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 226
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->readInt()I

    move-result v0

    .line 227
    .local v0, "w1":I
    const/high16 v1, -0x80000000

    and-int/2addr v1, v0

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 228
    .local v1, "exclusive":Z
    :goto_0
    const v3, 0x7fffffff

    and-int/2addr v3, v0

    .line 229
    .local v3, "streamDependency":I
    iget-object v4, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v4}, Lokio/BufferedSource;->readByte()B

    move-result v4

    and-int/lit16 v4, v4, 0xff

    add-int/2addr v4, v2

    .line 230
    .local v4, "weight":I
    invoke-interface {p1, p2, v3, v4, v1}, Lokhttp3/internal/http2/Http2Reader$Handler;->priority(IIIZ)V

    .line 231
    return-void
.end method

.method private readPriority(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V
    .locals 3
    .param p1, "handler"    # Lokhttp3/internal/http2/Http2Reader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 220
    const/4 v0, 0x0

    const/4 v1, 0x5

    if-ne p2, v1, :cond_1

    .line 221
    if-eqz p4, :cond_0

    .line 222
    invoke-direct {p0, p1, p4}, Lokhttp3/internal/http2/Http2Reader;->readPriority(Lokhttp3/internal/http2/Http2Reader$Handler;I)V

    .line 223
    return-void

    .line 221
    :cond_0
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "TYPE_PRIORITY streamId == 0"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 220
    :cond_1
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v0

    const-string v0, "TYPE_PRIORITY length: %d != 5"

    invoke-static {v0, v1}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method private readPushPromise(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V
    .locals 3
    .param p1, "handler"    # Lokhttp3/internal/http2/Http2Reader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 294
    const/4 v0, 0x0

    if-eqz p4, :cond_1

    .line 297
    and-int/lit8 v1, p3, 0x8

    if-eqz v1, :cond_0

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    .line 298
    .local v0, "padding":S
    :cond_0
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v1}, Lokio/BufferedSource;->readInt()I

    move-result v1

    const v2, 0x7fffffff

    and-int/2addr v1, v2

    .line 299
    .local v1, "promisedStreamId":I
    add-int/lit8 p2, p2, -0x4

    .line 300
    invoke-static {p2, p3, v0}, Lokhttp3/internal/http2/Http2Reader;->lengthWithoutPadding(IBS)I

    move-result p2

    .line 301
    invoke-direct {p0, p2, v0, p3, p4}, Lokhttp3/internal/http2/Http2Reader;->readHeaderBlock(ISBI)Ljava/util/List;

    move-result-object v2

    .line 302
    .local v2, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    invoke-interface {p1, p4, v1, v2}, Lokhttp3/internal/http2/Http2Reader$Handler;->pushPromise(IILjava/util/List;)V

    .line 303
    return-void

    .line 295
    .end local v0    # "padding":S
    .end local v1    # "promisedStreamId":I
    .end local v2    # "headerBlock":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/http2/Header;>;"
    :cond_1
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "PROTOCOL_ERROR: TYPE_PUSH_PROMISE streamId == 0"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method private readRstStream(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V
    .locals 5
    .param p1, "handler"    # Lokhttp3/internal/http2/Http2Reader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 235
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-ne p2, v2, :cond_2

    .line 236
    if-eqz p4, :cond_1

    .line 237
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v2}, Lokio/BufferedSource;->readInt()I

    move-result v2

    .line 238
    .local v2, "errorCodeInt":I
    invoke-static {v2}, Lokhttp3/internal/http2/ErrorCode;->fromHttp2(I)Lokhttp3/internal/http2/ErrorCode;

    move-result-object v3

    .line 239
    .local v3, "errorCode":Lokhttp3/internal/http2/ErrorCode;
    if-eqz v3, :cond_0

    .line 242
    invoke-interface {p1, p4, v3}, Lokhttp3/internal/http2/Http2Reader$Handler;->rstStream(ILokhttp3/internal/http2/ErrorCode;)V

    .line 243
    return-void

    .line 240
    :cond_0
    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v0, v1

    const-string v1, "TYPE_RST_STREAM unexpected error code: %d"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 236
    .end local v2    # "errorCodeInt":I
    .end local v3    # "errorCode":Lokhttp3/internal/http2/ErrorCode;
    :cond_1
    new-array v0, v1, [Ljava/lang/Object;

    const-string v1, "TYPE_RST_STREAM streamId == 0"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 235
    :cond_2
    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const-string v1, "TYPE_RST_STREAM length: %d != 4"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method private readSettings(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V
    .locals 7
    .param p1, "handler"    # Lokhttp3/internal/http2/Http2Reader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 247
    const/4 v0, 0x0

    if-nez p4, :cond_c

    .line 248
    and-int/lit8 v1, p3, 0x1

    if-eqz v1, :cond_1

    .line 249
    if-nez p2, :cond_0

    .line 250
    invoke-interface {p1}, Lokhttp3/internal/http2/Http2Reader$Handler;->ackSettings()V

    .line 251
    return-void

    .line 249
    :cond_0
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "FRAME_SIZE_ERROR ack frame should be empty!"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 254
    :cond_1
    rem-int/lit8 v1, p2, 0x6

    const/4 v2, 0x1

    if-nez v1, :cond_b

    .line 255
    new-instance v1, Lokhttp3/internal/http2/Settings;

    invoke-direct {v1}, Lokhttp3/internal/http2/Settings;-><init>()V

    .line 256
    .local v1, "settings":Lokhttp3/internal/http2/Settings;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, p2, :cond_a

    .line 257
    iget-object v4, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v4}, Lokio/BufferedSource;->readShort()S

    move-result v4

    const v5, 0xffff

    and-int/2addr v4, v5

    .line 258
    .local v4, "id":I
    iget-object v5, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v5}, Lokio/BufferedSource;->readInt()I

    move-result v5

    .line 260
    .local v5, "value":I
    const/4 v6, 0x2

    if-eq v4, v6, :cond_7

    const/4 v6, 0x3

    if-eq v4, v6, :cond_6

    const/4 v6, 0x4

    if-eq v4, v6, :cond_4

    const/4 v6, 0x5

    if-eq v4, v6, :cond_2

    goto :goto_1

    .line 278
    :cond_2
    const/16 v6, 0x4000

    if-lt v5, v6, :cond_3

    const v6, 0xffffff

    if-gt v5, v6, :cond_3

    goto :goto_1

    .line 279
    :cond_3
    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v2, v0

    const-string v0, "PROTOCOL_ERROR SETTINGS_MAX_FRAME_SIZE: %s"

    invoke-static {v0, v2}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 272
    :cond_4
    const/4 v4, 0x7

    .line 273
    if-ltz v5, :cond_5

    goto :goto_1

    .line 274
    :cond_5
    new-array v0, v0, [Ljava/lang/Object;

    const-string v2, "PROTOCOL_ERROR SETTINGS_INITIAL_WINDOW_SIZE > 2^31 - 1"

    invoke-static {v2, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 269
    :cond_6
    const/4 v4, 0x4

    .line 270
    goto :goto_1

    .line 264
    :cond_7
    if-eqz v5, :cond_9

    if-ne v5, v2, :cond_8

    goto :goto_1

    .line 265
    :cond_8
    new-array v0, v0, [Ljava/lang/Object;

    const-string v2, "PROTOCOL_ERROR SETTINGS_ENABLE_PUSH != 0 or 1"

    invoke-static {v2, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 287
    :cond_9
    :goto_1
    invoke-virtual {v1, v4, v5}, Lokhttp3/internal/http2/Settings;->set(II)Lokhttp3/internal/http2/Settings;

    .line 256
    .end local v4    # "id":I
    .end local v5    # "value":I
    add-int/lit8 v3, v3, 0x6

    goto :goto_0

    .line 289
    .end local v3    # "i":I
    :cond_a
    invoke-interface {p1, v0, v1}, Lokhttp3/internal/http2/Http2Reader$Handler;->settings(ZLokhttp3/internal/http2/Settings;)V

    .line 290
    return-void

    .line 254
    .end local v1    # "settings":Lokhttp3/internal/http2/Settings;
    :cond_b
    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v0

    const-string v0, "TYPE_SETTINGS length %% 6 != 0: %s"

    invoke-static {v0, v1}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 247
    :cond_c
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "TYPE_SETTINGS streamId != 0"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2
.end method

.method private readWindowUpdate(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V
    .locals 7
    .param p1, "handler"    # Lokhttp3/internal/http2/Http2Reader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 335
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x4

    if-ne p2, v2, :cond_1

    .line 336
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v2}, Lokio/BufferedSource;->readInt()I

    move-result v2

    int-to-long v2, v2

    const-wide/32 v4, 0x7fffffff

    and-long/2addr v2, v4

    .line 337
    .local v2, "increment":J
    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-eqz v6, :cond_0

    .line 338
    invoke-interface {p1, p4, v2, v3}, Lokhttp3/internal/http2/Http2Reader$Handler;->windowUpdate(IJ)V

    .line 339
    return-void

    .line 337
    :cond_0
    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v1, v0

    const-string v0, "windowSizeIncrement was 0"

    invoke-static {v0, v1}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 335
    .end local v2    # "increment":J
    :cond_1
    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v0

    const-string v0, "TYPE_WINDOW_UPDATE length !=4: %s"

    invoke-static {v0, v1}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 342
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->close()V

    .line 343
    return-void
.end method

.method public nextFrame(ZLokhttp3/internal/http2/Http2Reader$Handler;)Z
    .locals 8
    .param p1, "requireSettings"    # Z
    .param p2, "handler"    # Lokhttp3/internal/http2/Http2Reader$Handler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 95
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    const-wide/16 v2, 0x9

    invoke-interface {v1, v2, v3}, Lokio/BufferedSource;->require(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    nop

    .line 111
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-static {v1}, Lokhttp3/internal/http2/Http2Reader;->readMedium(Lokio/BufferedSource;)I

    move-result v1

    .line 112
    .local v1, "length":I
    const/4 v2, 0x1

    if-ltz v1, :cond_3

    const/16 v3, 0x4000

    if-gt v1, v3, :cond_3

    .line 115
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v3}, Lokio/BufferedSource;->readByte()B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    .line 116
    .local v3, "type":B
    if-eqz p1, :cond_1

    const/4 v4, 0x4

    if-ne v3, v4, :cond_0

    goto :goto_0

    .line 117
    :cond_0
    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    aput-object v4, v2, v0

    const-string v0, "Expected a SETTINGS frame but was %s"

    invoke-static {v0, v2}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 119
    :cond_1
    :goto_0
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    .line 120
    .local v0, "flags":B
    iget-object v4, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    invoke-interface {v4}, Lokio/BufferedSource;->readInt()I

    move-result v4

    const v5, 0x7fffffff

    and-int/2addr v4, v5

    .line 121
    .local v4, "streamId":I
    sget-object v5, Lokhttp3/internal/http2/Http2Reader;->logger:Ljava/util/logging/Logger;

    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-static {v2, v4, v1, v3, v0}, Lokhttp3/internal/http2/Http2;->frameLog(ZIIBB)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 123
    :cond_2
    packed-switch v3, :pswitch_data_0

    .line 162
    iget-object v5, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    int-to-long v6, v1

    invoke-interface {v5, v6, v7}, Lokio/BufferedSource;->skip(J)V

    goto :goto_1

    .line 157
    :pswitch_0
    invoke-direct {p0, p2, v1, v0, v4}, Lokhttp3/internal/http2/Http2Reader;->readWindowUpdate(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V

    .line 158
    goto :goto_1

    .line 153
    :pswitch_1
    invoke-direct {p0, p2, v1, v0, v4}, Lokhttp3/internal/http2/Http2Reader;->readGoAway(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V

    .line 154
    goto :goto_1

    .line 149
    :pswitch_2
    invoke-direct {p0, p2, v1, v0, v4}, Lokhttp3/internal/http2/Http2Reader;->readPing(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V

    .line 150
    goto :goto_1

    .line 145
    :pswitch_3
    invoke-direct {p0, p2, v1, v0, v4}, Lokhttp3/internal/http2/Http2Reader;->readPushPromise(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V

    .line 146
    goto :goto_1

    .line 141
    :pswitch_4
    invoke-direct {p0, p2, v1, v0, v4}, Lokhttp3/internal/http2/Http2Reader;->readSettings(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V

    .line 142
    goto :goto_1

    .line 137
    :pswitch_5
    invoke-direct {p0, p2, v1, v0, v4}, Lokhttp3/internal/http2/Http2Reader;->readRstStream(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V

    .line 138
    goto :goto_1

    .line 133
    :pswitch_6
    invoke-direct {p0, p2, v1, v0, v4}, Lokhttp3/internal/http2/Http2Reader;->readPriority(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V

    .line 134
    goto :goto_1

    .line 129
    :pswitch_7
    invoke-direct {p0, p2, v1, v0, v4}, Lokhttp3/internal/http2/Http2Reader;->readHeaders(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V

    .line 130
    goto :goto_1

    .line 125
    :pswitch_8
    invoke-direct {p0, p2, v1, v0, v4}, Lokhttp3/internal/http2/Http2Reader;->readData(Lokhttp3/internal/http2/Http2Reader$Handler;IBI)V

    .line 126
    nop

    .line 164
    :goto_1
    return v2

    .line 113
    .end local v0    # "flags":B
    .end local v3    # "type":B
    .end local v4    # "streamId":I
    :cond_3
    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v0

    const-string v0, "FRAME_SIZE_ERROR: %s"

    invoke-static {v0, v2}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 96
    .end local v1    # "length":I
    :catch_0
    move-exception v1

    .line 97
    .local v1, "e":Ljava/io/IOException;
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public readConnectionPreface(Lokhttp3/internal/http2/Http2Reader$Handler;)V
    .locals 6
    .param p1, "handler"    # Lokhttp3/internal/http2/Http2Reader$Handler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    iget-boolean v0, p0, Lokhttp3/internal/http2/Http2Reader;->client:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 80
    invoke-virtual {p0, v2, p1}, Lokhttp3/internal/http2/Http2Reader;->nextFrame(ZLokhttp3/internal/http2/Http2Reader$Handler;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 81
    :cond_0
    new-array v0, v1, [Ljava/lang/Object;

    const-string v1, "Required SETTINGS preface not received"

    invoke-static {v1, v0}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 85
    :cond_1
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Reader;->source:Lokio/BufferedSource;

    sget-object v3, Lokhttp3/internal/http2/Http2;->CONNECTION_PREFACE:Lokio/ByteString;

    invoke-virtual {v3}, Lokio/ByteString;->size()I

    move-result v3

    int-to-long v3, v3

    invoke-interface {v0, v3, v4}, Lokio/BufferedSource;->readByteString(J)Lokio/ByteString;

    move-result-object v0

    .line 86
    .local v0, "connectionPreface":Lokio/ByteString;
    sget-object v3, Lokhttp3/internal/http2/Http2Reader;->logger:Ljava/util/logging/Logger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_2

    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    const-string v5, "<< CONNECTION %s"

    invoke-static {v5, v4}, Lokhttp3/internal/Util;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 87
    :cond_2
    sget-object v3, Lokhttp3/internal/http2/Http2;->CONNECTION_PREFACE:Lokio/ByteString;

    invoke-virtual {v3, v0}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 91
    .end local v0    # "connectionPreface":Lokio/ByteString;
    :goto_0
    return-void

    .line 88
    .restart local v0    # "connectionPreface":Lokio/ByteString;
    :cond_3
    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Lokio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    const-string v1, "Expected a connection header but was %s"

    invoke-static {v1, v2}, Lokhttp3/internal/http2/Http2;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v1

    throw v1
.end method
