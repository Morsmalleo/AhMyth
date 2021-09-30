.class final Lokhttp3/internal/cache2/FileOperator;
.super Ljava/lang/Object;
.source "FileOperator.java"


# instance fields
.field private final fileChannel:Ljava/nio/channels/FileChannel;


# direct methods
.method constructor <init>(Ljava/nio/channels/FileChannel;)V
    .locals 0
    .param p1, "fileChannel"    # Ljava/nio/channels/FileChannel;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lokhttp3/internal/cache2/FileOperator;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 41
    return-void
.end method


# virtual methods
.method public read(JLokio/Buffer;J)V
    .locals 9
    .param p1, "pos"    # J
    .param p3, "sink"    # Lokio/Buffer;
    .param p4, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    const-wide/16 v0, 0x0

    cmp-long v2, p4, v0

    if-ltz v2, :cond_1

    .line 62
    :goto_0
    cmp-long v2, p4, v0

    if-lez v2, :cond_0

    .line 63
    iget-object v3, p0, Lokhttp3/internal/cache2/FileOperator;->fileChannel:Ljava/nio/channels/FileChannel;

    move-wide v4, p1

    move-wide v6, p4

    move-object v8, p3

    invoke-virtual/range {v3 .. v8}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    move-result-wide v2

    .line 64
    .local v2, "bytesRead":J
    add-long/2addr p1, v2

    .line 65
    sub-long/2addr p4, v2

    .line 66
    .end local v2    # "bytesRead":J
    goto :goto_0

    .line 67
    :cond_0
    return-void

    .line 60
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public write(JLokio/Buffer;J)V
    .locals 13
    .param p1, "pos"    # J
    .param p3, "source"    # Lokio/Buffer;
    .param p4, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 45
    const-wide/16 v0, 0x0

    cmp-long v2, p4, v0

    if-ltz v2, :cond_1

    invoke-virtual/range {p3 .. p3}, Lokio/Buffer;->size()J

    move-result-wide v2

    cmp-long v4, p4, v2

    if-gtz v4, :cond_1

    move-wide v2, p1

    move-wide/from16 v11, p4

    .line 47
    .end local p1    # "pos":J
    .end local p4    # "byteCount":J
    .local v2, "pos":J
    .local v11, "byteCount":J
    :goto_0
    cmp-long v4, v11, v0

    if-lez v4, :cond_0

    .line 48
    move-object v4, p0

    iget-object v5, v4, Lokhttp3/internal/cache2/FileOperator;->fileChannel:Ljava/nio/channels/FileChannel;

    move-object/from16 v6, p3

    move-wide v7, v2

    move-wide v9, v11

    invoke-virtual/range {v5 .. v10}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J

    move-result-wide v5

    .line 49
    .local v5, "bytesWritten":J
    add-long/2addr v2, v5

    .line 50
    sub-long/2addr v11, v5

    .line 51
    .end local v5    # "bytesWritten":J
    goto :goto_0

    .line 52
    :cond_0
    move-object v4, p0

    return-void

    .line 45
    .end local v2    # "pos":J
    .end local v11    # "byteCount":J
    .restart local p1    # "pos":J
    .restart local p4    # "byteCount":J
    :cond_1
    move-object v4, p0

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method
