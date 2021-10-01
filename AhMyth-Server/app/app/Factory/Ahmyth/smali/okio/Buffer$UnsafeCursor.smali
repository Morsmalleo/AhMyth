.class public final Lokio/Buffer$UnsafeCursor;
.super Ljava/lang/Object;
.source "Buffer.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokio/Buffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UnsafeCursor"
.end annotation


# instance fields
.field public buffer:Lokio/Buffer;

.field public data:[B

.field public end:I

.field public offset:J

.field public readWrite:Z

.field private segment:Lokio/Segment;

.field public start:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 2062
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2067
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 2069
    const/4 v0, -0x1

    iput v0, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 2070
    iput v0, p0, Lokio/Buffer$UnsafeCursor;->end:I

    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 2290
    iget-object v0, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    if-eqz v0, :cond_0

    .line 2294
    const/4 v0, 0x0

    iput-object v0, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    .line 2295
    iput-object v0, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 2296
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 2297
    iput-object v0, p0, Lokio/Buffer$UnsafeCursor;->data:[B

    .line 2298
    const/4 v0, -0x1

    iput v0, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 2299
    iput v0, p0, Lokio/Buffer$UnsafeCursor;->end:I

    .line 2300
    return-void

    .line 2291
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "not attached to a buffer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final expandBuffer(I)J
    .locals 8
    .param p1, "minByteCount"    # I

    .line 2259
    if-lez p1, :cond_3

    .line 2262
    const/16 v0, 0x2000

    if-gt p1, v0, :cond_2

    .line 2265
    iget-object v1, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    if-eqz v1, :cond_1

    .line 2268
    iget-boolean v2, p0, Lokio/Buffer$UnsafeCursor;->readWrite:Z

    if-eqz v2, :cond_0

    .line 2272
    iget-wide v1, v1, Lokio/Buffer;->size:J

    .line 2273
    .local v1, "oldSize":J
    iget-object v3, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    invoke-virtual {v3, p1}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v3

    .line 2274
    .local v3, "tail":Lokio/Segment;
    iget v4, v3, Lokio/Segment;->limit:I

    rsub-int v4, v4, 0x2000

    .line 2275
    .local v4, "result":I
    iput v0, v3, Lokio/Segment;->limit:I

    .line 2276
    iget-object v5, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    int-to-long v6, v4

    add-long/2addr v6, v1

    iput-wide v6, v5, Lokio/Buffer;->size:J

    .line 2279
    iput-object v3, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 2280
    iput-wide v1, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 2281
    iget-object v5, v3, Lokio/Segment;->data:[B

    iput-object v5, p0, Lokio/Buffer$UnsafeCursor;->data:[B

    .line 2282
    rsub-int v5, v4, 0x2000

    iput v5, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 2283
    iput v0, p0, Lokio/Buffer$UnsafeCursor;->end:I

    .line 2285
    int-to-long v5, v4

    return-wide v5

    .line 2269
    .end local v1    # "oldSize":J
    .end local v3    # "tail":Lokio/Segment;
    .end local v4    # "result":I
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "expandBuffer() only permitted for read/write buffers"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2266
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "not attached to a buffer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2263
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "minByteCount > Segment.SIZE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2260
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "minByteCount <= 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final next()I
    .locals 5

    .line 2078
    iget-wide v0, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    iget-object v2, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    iget-wide v2, v2, Lokio/Buffer;->size:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    .line 2079
    iget-wide v0, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lokio/Buffer$UnsafeCursor;->seek(J)I

    move-result v0

    return v0

    .line 2080
    :cond_0
    iget v2, p0, Lokio/Buffer$UnsafeCursor;->end:I

    iget v3, p0, Lokio/Buffer$UnsafeCursor;->start:I

    sub-int/2addr v2, v3

    int-to-long v2, v2

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lokio/Buffer$UnsafeCursor;->seek(J)I

    move-result v0

    return v0

    .line 2078
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public final resizeBuffer(J)J
    .locals 12
    .param p1, "newSize"    # J

    .line 2178
    iget-object v0, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    if-eqz v0, :cond_7

    .line 2181
    iget-boolean v1, p0, Lokio/Buffer$UnsafeCursor;->readWrite:Z

    if-eqz v1, :cond_6

    .line 2185
    iget-wide v0, v0, Lokio/Buffer;->size:J

    .line 2186
    .local v0, "oldSize":J
    const-wide/16 v2, 0x0

    cmp-long v4, p1, v0

    if-gtz v4, :cond_3

    .line 2187
    cmp-long v4, p1, v2

    if-ltz v4, :cond_2

    .line 2191
    sub-long v4, v0, p1

    .local v4, "bytesToSubtract":J
    :goto_0
    cmp-long v6, v4, v2

    if-lez v6, :cond_1

    .line 2192
    iget-object v6, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    iget-object v6, v6, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v6, v6, Lokio/Segment;->prev:Lokio/Segment;

    .line 2193
    .local v6, "tail":Lokio/Segment;
    iget v7, v6, Lokio/Segment;->limit:I

    iget v8, v6, Lokio/Segment;->pos:I

    sub-int/2addr v7, v8

    .line 2194
    .local v7, "tailSize":I
    int-to-long v8, v7

    cmp-long v10, v8, v4

    if-gtz v10, :cond_0

    .line 2195
    iget-object v8, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    invoke-virtual {v6}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v9

    iput-object v9, v8, Lokio/Buffer;->head:Lokio/Segment;

    .line 2196
    invoke-static {v6}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 2197
    int-to-long v8, v7

    sub-long/2addr v4, v8

    .line 2202
    .end local v6    # "tail":Lokio/Segment;
    .end local v7    # "tailSize":I
    goto :goto_0

    .line 2199
    .restart local v6    # "tail":Lokio/Segment;
    .restart local v7    # "tailSize":I
    :cond_0
    iget v2, v6, Lokio/Segment;->limit:I

    int-to-long v2, v2

    sub-long/2addr v2, v4

    long-to-int v3, v2

    iput v3, v6, Lokio/Segment;->limit:I

    .line 2204
    .end local v4    # "bytesToSubtract":J
    .end local v6    # "tail":Lokio/Segment;
    .end local v7    # "tailSize":I
    :cond_1
    const/4 v2, 0x0

    iput-object v2, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 2205
    iput-wide p1, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 2206
    iput-object v2, p0, Lokio/Buffer$UnsafeCursor;->data:[B

    .line 2207
    const/4 v2, -0x1

    iput v2, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 2208
    iput v2, p0, Lokio/Buffer$UnsafeCursor;->end:I

    goto :goto_2

    .line 2188
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "newSize < 0: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2209
    :cond_3
    cmp-long v4, p1, v0

    if-lez v4, :cond_5

    .line 2211
    const/4 v4, 0x1

    .line 2212
    .local v4, "needsToSeek":Z
    sub-long v5, p1, v0

    .local v5, "bytesToAdd":J
    :goto_1
    cmp-long v7, v5, v2

    if-lez v7, :cond_5

    .line 2213
    iget-object v7, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v7

    .line 2214
    .local v7, "tail":Lokio/Segment;
    iget v8, v7, Lokio/Segment;->limit:I

    rsub-int v8, v8, 0x2000

    int-to-long v8, v8

    invoke-static {v5, v6, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    long-to-int v9, v8

    .line 2215
    .local v9, "segmentBytesToAdd":I
    iget v8, v7, Lokio/Segment;->limit:I

    add-int/2addr v8, v9

    iput v8, v7, Lokio/Segment;->limit:I

    .line 2216
    int-to-long v10, v9

    sub-long/2addr v5, v10

    .line 2219
    if-eqz v4, :cond_4

    .line 2220
    iput-object v7, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 2221
    iput-wide v0, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 2222
    iget-object v8, v7, Lokio/Segment;->data:[B

    iput-object v8, p0, Lokio/Buffer$UnsafeCursor;->data:[B

    .line 2223
    iget v8, v7, Lokio/Segment;->limit:I

    sub-int/2addr v8, v9

    iput v8, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 2224
    iget v8, v7, Lokio/Segment;->limit:I

    iput v8, p0, Lokio/Buffer$UnsafeCursor;->end:I

    .line 2225
    const/4 v4, 0x0

    .line 2227
    .end local v7    # "tail":Lokio/Segment;
    .end local v9    # "segmentBytesToAdd":I
    :cond_4
    goto :goto_1

    .line 2230
    .end local v4    # "needsToSeek":Z
    .end local v5    # "bytesToAdd":J
    :cond_5
    :goto_2
    iget-object v2, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    iput-wide p1, v2, Lokio/Buffer;->size:J

    .line 2232
    return-wide v0

    .line 2182
    .end local v0    # "oldSize":J
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "resizeBuffer() only permitted for read/write buffers"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2179
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "not attached to a buffer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw v0

    :goto_4
    goto :goto_3
.end method

.method public final seek(J)I
    .locals 12
    .param p1, "offset"    # J

    .line 2089
    const-wide/16 v0, -0x1

    cmp-long v2, p1, v0

    if-ltz v2, :cond_8

    iget-object v2, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    iget-wide v2, v2, Lokio/Buffer;->size:J

    cmp-long v4, p1, v2

    if-gtz v4, :cond_8

    .line 2094
    cmp-long v2, p1, v0

    if-eqz v2, :cond_7

    iget-object v0, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    iget-wide v0, v0, Lokio/Buffer;->size:J

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    goto/16 :goto_3

    .line 2104
    :cond_0
    const-wide/16 v0, 0x0

    .line 2105
    .local v0, "min":J
    iget-object v2, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    iget-wide v2, v2, Lokio/Buffer;->size:J

    .line 2106
    .local v2, "max":J
    iget-object v4, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    iget-object v4, v4, Lokio/Buffer;->head:Lokio/Segment;

    .line 2107
    .local v4, "head":Lokio/Segment;
    iget-object v5, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    iget-object v5, v5, Lokio/Buffer;->head:Lokio/Segment;

    .line 2108
    .local v5, "tail":Lokio/Segment;
    iget-object v6, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    if-eqz v6, :cond_2

    .line 2109
    iget-wide v7, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    iget v9, p0, Lokio/Buffer$UnsafeCursor;->start:I

    iget v6, v6, Lokio/Segment;->pos:I

    sub-int/2addr v9, v6

    int-to-long v9, v9

    sub-long/2addr v7, v9

    .line 2110
    .local v7, "segmentOffset":J
    cmp-long v6, v7, p1

    if-lez v6, :cond_1

    .line 2112
    move-wide v2, v7

    .line 2113
    iget-object v5, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    goto :goto_0

    .line 2116
    :cond_1
    move-wide v0, v7

    .line 2117
    iget-object v4, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 2123
    .end local v7    # "segmentOffset":J
    :cond_2
    :goto_0
    sub-long v6, v2, p1

    sub-long v8, p1, v0

    cmp-long v10, v6, v8

    if-lez v10, :cond_3

    .line 2125
    move-object v6, v4

    .line 2126
    .local v6, "next":Lokio/Segment;
    move-wide v7, v0

    .line 2127
    .local v7, "nextOffset":J
    :goto_1
    iget v9, v6, Lokio/Segment;->limit:I

    iget v10, v6, Lokio/Segment;->pos:I

    sub-int/2addr v9, v10

    int-to-long v9, v9

    add-long/2addr v9, v7

    cmp-long v11, p1, v9

    if-ltz v11, :cond_4

    .line 2128
    iget v9, v6, Lokio/Segment;->limit:I

    iget v10, v6, Lokio/Segment;->pos:I

    sub-int/2addr v9, v10

    int-to-long v9, v9

    add-long/2addr v7, v9

    .line 2129
    iget-object v6, v6, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_1

    .line 2133
    .end local v6    # "next":Lokio/Segment;
    .end local v7    # "nextOffset":J
    :cond_3
    move-object v6, v5

    .line 2134
    .restart local v6    # "next":Lokio/Segment;
    move-wide v7, v2

    .line 2135
    .restart local v7    # "nextOffset":J
    :goto_2
    cmp-long v9, v7, p1

    if-lez v9, :cond_4

    .line 2136
    iget-object v6, v6, Lokio/Segment;->prev:Lokio/Segment;

    .line 2137
    iget v9, v6, Lokio/Segment;->limit:I

    iget v10, v6, Lokio/Segment;->pos:I

    sub-int/2addr v9, v10

    int-to-long v9, v9

    sub-long/2addr v7, v9

    goto :goto_2

    .line 2142
    :cond_4
    iget-boolean v9, p0, Lokio/Buffer$UnsafeCursor;->readWrite:Z

    if-eqz v9, :cond_6

    iget-boolean v9, v6, Lokio/Segment;->shared:Z

    if-eqz v9, :cond_6

    .line 2143
    invoke-virtual {v6}, Lokio/Segment;->unsharedCopy()Lokio/Segment;

    move-result-object v9

    .line 2144
    .local v9, "unsharedNext":Lokio/Segment;
    iget-object v10, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    iget-object v10, v10, Lokio/Buffer;->head:Lokio/Segment;

    if-ne v10, v6, :cond_5

    .line 2145
    iget-object v10, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    iput-object v9, v10, Lokio/Buffer;->head:Lokio/Segment;

    .line 2147
    :cond_5
    invoke-virtual {v6, v9}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    move-result-object v6

    .line 2148
    iget-object v10, v6, Lokio/Segment;->prev:Lokio/Segment;

    invoke-virtual {v10}, Lokio/Segment;->pop()Lokio/Segment;

    .line 2152
    .end local v9    # "unsharedNext":Lokio/Segment;
    :cond_6
    iput-object v6, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 2153
    iput-wide p1, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 2154
    iget-object v9, v6, Lokio/Segment;->data:[B

    iput-object v9, p0, Lokio/Buffer$UnsafeCursor;->data:[B

    .line 2155
    iget v9, v6, Lokio/Segment;->pos:I

    sub-long v10, p1, v7

    long-to-int v11, v10

    add-int/2addr v9, v11

    iput v9, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 2156
    iget v9, v6, Lokio/Segment;->limit:I

    iput v9, p0, Lokio/Buffer$UnsafeCursor;->end:I

    .line 2157
    iget v10, p0, Lokio/Buffer$UnsafeCursor;->start:I

    sub-int/2addr v9, v10

    return v9

    .line 2095
    .end local v0    # "min":J
    .end local v2    # "max":J
    .end local v4    # "head":Lokio/Segment;
    .end local v5    # "tail":Lokio/Segment;
    .end local v6    # "next":Lokio/Segment;
    .end local v7    # "nextOffset":J
    :cond_7
    :goto_3
    const/4 v0, 0x0

    iput-object v0, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 2096
    iput-wide p1, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 2097
    iput-object v0, p0, Lokio/Buffer$UnsafeCursor;->data:[B

    .line 2098
    const/4 v0, -0x1

    iput v0, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 2099
    iput v0, p0, Lokio/Buffer$UnsafeCursor;->end:I

    .line 2100
    return v0

    .line 2090
    :cond_8
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 2091
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    iget-wide v3, v3, Lokio/Buffer;->size:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "offset=%s > size=%s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw v0

    :goto_5
    goto :goto_4
.end method
