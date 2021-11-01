.class final Lokhttp3/internal/http2/Http2Stream$FramedDataSource;
.super Ljava/lang/Object;
.source "Http2Stream.java"

# interfaces
.implements Lokio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/http2/Http2Stream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "FramedDataSource"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field closed:Z

.field finished:Z

.field private final maxByteCount:J

.field private final readBuffer:Lokio/Buffer;

.field private final receiveBuffer:Lokio/Buffer;

.field final synthetic this$0:Lokhttp3/internal/http2/Http2Stream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 300
    const-class v0, Lokhttp3/internal/http2/Http2Stream;

    return-void
.end method

.method constructor <init>(Lokhttp3/internal/http2/Http2Stream;J)V
    .locals 0

    .line 319
    iput-object p1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 302
    new-instance p1, Lokio/Buffer;

    invoke-direct {p1}, Lokio/Buffer;-><init>()V

    iput-object p1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->receiveBuffer:Lokio/Buffer;

    .line 305
    new-instance p1, Lokio/Buffer;

    invoke-direct {p1}, Lokio/Buffer;-><init>()V

    iput-object p1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->readBuffer:Lokio/Buffer;

    .line 320
    iput-wide p2, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->maxByteCount:J

    return-void
.end method

.method private checkNotClosed()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 424
    iget-boolean v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->closed:Z

    if-nez v0, :cond_1

    .line 427
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v0, v0, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    if-nez v0, :cond_0

    return-void

    .line 428
    :cond_0
    new-instance v0, Lokhttp3/internal/http2/StreamResetException;

    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v1, v1, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    invoke-direct {v0, v1}, Lokhttp3/internal/http2/StreamResetException;-><init>(Lokhttp3/internal/http2/ErrorCode;)V

    throw v0

    .line 425
    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private waitUntilReadable()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 360
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v0, v0, Lokhttp3/internal/http2/Http2Stream;->readTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v0}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;->enter()V

    .line 362
    :goto_0
    :try_start_0
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    iget-boolean v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->finished:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->closed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v0, v0, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    if-nez v0, :cond_0

    .line 363
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lokhttp3/internal/http2/Http2Stream;->waitForIo()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 366
    :cond_0
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v0, v0, Lokhttp3/internal/http2/Http2Stream;->readTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v0}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v1, v1, Lokhttp3/internal/http2/Http2Stream;->readTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v1}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 415
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    monitor-enter v0

    const/4 v1, 0x1

    .line 416
    :try_start_0
    iput-boolean v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->closed:Z

    .line 417
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v1}, Lokio/Buffer;->clear()V

    .line 418
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 419
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 420
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lokhttp3/internal/http2/Http2Stream;->cancelStreamIfNecessary()V

    return-void

    :catchall_0
    move-exception v1

    .line 419
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public read(Lokio/Buffer;J)J
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_3

    .line 328
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    monitor-enter v2

    .line 329
    :try_start_0
    invoke-direct {p0}, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->waitUntilReadable()V

    .line 330
    invoke-direct {p0}, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->checkNotClosed()V

    .line 331
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v3}, Lokio/Buffer;->size()J

    move-result-wide v3

    cmp-long v5, v3, v0

    if-nez v5, :cond_0

    const-wide/16 p1, -0x1

    monitor-exit v2

    return-wide p1

    .line 334
    :cond_0
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v3}, Lokio/Buffer;->size()J

    move-result-wide v4

    invoke-static {p2, p3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    invoke-virtual {v3, p1, p2, p3}, Lokio/Buffer;->read(Lokio/Buffer;J)J

    move-result-wide p1

    .line 337
    iget-object p3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-wide v3, p3, Lokhttp3/internal/http2/Http2Stream;->unacknowledgedBytesRead:J

    add-long/2addr v3, p1

    iput-wide v3, p3, Lokhttp3/internal/http2/Http2Stream;->unacknowledgedBytesRead:J

    .line 338
    iget-object p3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-wide v3, p3, Lokhttp3/internal/http2/Http2Stream;->unacknowledgedBytesRead:J

    iget-object p3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object p3, p3, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget-object p3, p3, Lokhttp3/internal/http2/Http2Connection;->okHttpSettings:Lokhttp3/internal/http2/Settings;

    .line 339
    invoke-virtual {p3}, Lokhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-long v5, p3

    cmp-long p3, v3, v5

    if-ltz p3, :cond_1

    .line 340
    iget-object p3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object p3, p3, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget-object v3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget v3, v3, Lokhttp3/internal/http2/Http2Stream;->id:I

    iget-object v4, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-wide v4, v4, Lokhttp3/internal/http2/Http2Stream;->unacknowledgedBytesRead:J

    invoke-virtual {p3, v3, v4, v5}, Lokhttp3/internal/http2/Http2Connection;->writeWindowUpdateLater(IJ)V

    .line 341
    iget-object p3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iput-wide v0, p3, Lokhttp3/internal/http2/Http2Stream;->unacknowledgedBytesRead:J

    .line 343
    :cond_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 346
    iget-object p3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object p3, p3, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    monitor-enter p3

    .line 347
    :try_start_1
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v2, v2, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget-wide v3, v2, Lokhttp3/internal/http2/Http2Connection;->unacknowledgedBytesRead:J

    add-long/2addr v3, p1

    iput-wide v3, v2, Lokhttp3/internal/http2/Http2Connection;->unacknowledgedBytesRead:J

    .line 348
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v2, v2, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget-wide v2, v2, Lokhttp3/internal/http2/Http2Connection;->unacknowledgedBytesRead:J

    iget-object v4, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v4, v4, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget-object v4, v4, Lokhttp3/internal/http2/Http2Connection;->okHttpSettings:Lokhttp3/internal/http2/Settings;

    .line 349
    invoke-virtual {v4}, Lokhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-long v4, v4

    cmp-long v6, v2, v4

    if-ltz v6, :cond_2

    .line 350
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v2, v2, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    const/4 v3, 0x0

    iget-object v4, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v4, v4, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget-wide v4, v4, Lokhttp3/internal/http2/Http2Connection;->unacknowledgedBytesRead:J

    invoke-virtual {v2, v3, v4, v5}, Lokhttp3/internal/http2/Http2Connection;->writeWindowUpdateLater(IJ)V

    .line 351
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v2, v2, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iput-wide v0, v2, Lokhttp3/internal/http2/Http2Connection;->unacknowledgedBytesRead:J

    .line 353
    :cond_2
    monitor-exit p3

    return-wide p1

    :catchall_0
    move-exception p1

    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_1
    move-exception p1

    .line 343
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1

    .line 325
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "byteCount < 0: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method receive(Lokio/BufferedSource;J)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_6

    .line 376
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    monitor-enter v2

    .line 377
    :try_start_0
    iget-boolean v3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->finished:Z

    .line 378
    iget-object v4, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v4}, Lokio/Buffer;->size()J

    move-result-wide v4

    add-long/2addr v4, p2

    iget-wide v6, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->maxByteCount:J

    const/4 v8, 0x1

    const/4 v9, 0x0

    cmp-long v10, v4, v6

    if-lez v10, :cond_0

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    .line 379
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v4, :cond_1

    .line 383
    invoke-interface {p1, p2, p3}, Lokio/BufferedSource;->skip(J)V

    .line 384
    iget-object p1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    sget-object p2, Lokhttp3/internal/http2/ErrorCode;->FLOW_CONTROL_ERROR:Lokhttp3/internal/http2/ErrorCode;

    invoke-virtual {p1, p2}, Lokhttp3/internal/http2/Http2Stream;->closeLater(Lokhttp3/internal/http2/ErrorCode;)V

    return-void

    :cond_1
    if-eqz v3, :cond_2

    .line 390
    invoke-interface {p1, p2, p3}, Lokio/BufferedSource;->skip(J)V

    return-void

    .line 395
    :cond_2
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->receiveBuffer:Lokio/Buffer;

    invoke-interface {p1, v2, p2, p3}, Lokio/BufferedSource;->read(Lokio/Buffer;J)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v6, v2, v4

    if-eqz v6, :cond_5

    sub-long/2addr p2, v2

    .line 400
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    monitor-enter v2

    .line 401
    :try_start_1
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v3}, Lokio/Buffer;->size()J

    move-result-wide v3

    cmp-long v5, v3, v0

    if-nez v5, :cond_3

    goto :goto_2

    :cond_3
    const/4 v8, 0x0

    .line 402
    :goto_2
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->readBuffer:Lokio/Buffer;

    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->receiveBuffer:Lokio/Buffer;

    invoke-virtual {v0, v1}, Lokio/Buffer;->writeAll(Lokio/Source;)J

    if-eqz v8, :cond_4

    .line 404
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 406
    :cond_4
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    .line 396
    :cond_5
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :catchall_1
    move-exception p1

    .line 379
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1

    :cond_6
    return-void
.end method

.method public timeout()Lokio/Timeout;
    .locals 1

    .line 411
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSource;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v0, v0, Lokhttp3/internal/http2/Http2Stream;->readTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    return-object v0
.end method
