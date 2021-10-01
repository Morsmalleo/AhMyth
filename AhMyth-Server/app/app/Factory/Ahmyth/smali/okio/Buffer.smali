.class public final Lokio/Buffer;
.super Ljava/lang/Object;
.source "Buffer.java"

# interfaces
.implements Lokio/BufferedSource;
.implements Lokio/BufferedSink;
.implements Ljava/lang/Cloneable;
.implements Ljava/nio/channels/ByteChannel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokio/Buffer$UnsafeCursor;
    }
.end annotation


# static fields
.field private static final DIGITS:[B

.field static final REPLACEMENT_CHARACTER:I = 0xfffd


# instance fields
.field head:Lokio/Segment;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field size:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 55
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lokio/Buffer;->DIGITS:[B

    return-void

    :array_0
    .array-data 1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    return-void
.end method

.method private digest(Ljava/lang/String;)Lokio/ByteString;
    .locals 6
    .param p1, "algorithm"    # Ljava/lang/String;

    .line 1704
    :try_start_0
    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 1705
    .local v0, "messageDigest":Ljava/security/MessageDigest;
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eqz v1, :cond_0

    .line 1706
    iget-object v1, v1, Lokio/Segment;->data:[B

    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v2, v2, Lokio/Segment;->pos:I

    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v3, Lokio/Segment;->limit:I

    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v4, v4, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    invoke-virtual {v0, v1, v2, v3}, Ljava/security/MessageDigest;->update([BII)V

    .line 1707
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    .local v1, "s":Lokio/Segment;
    :goto_0
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eq v1, v2, :cond_0

    .line 1708
    iget-object v2, v1, Lokio/Segment;->data:[B

    iget v3, v1, Lokio/Segment;->pos:I

    iget v4, v1, Lokio/Segment;->limit:I

    iget v5, v1, Lokio/Segment;->pos:I

    sub-int/2addr v4, v5

    invoke-virtual {v0, v2, v3, v4}, Ljava/security/MessageDigest;->update([BII)V

    .line 1707
    iget-object v2, v1, Lokio/Segment;->next:Lokio/Segment;

    move-object v1, v2

    goto :goto_0

    .line 1711
    .end local v1    # "s":Lokio/Segment;
    :cond_0
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    invoke-static {v1}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v1
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 1712
    .end local v0    # "messageDigest":Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    .line 1713
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method private hmac(Ljava/lang/String;Lokio/ByteString;)Lokio/ByteString;
    .locals 6
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "key"    # Lokio/ByteString;

    .line 1734
    :try_start_0
    invoke-static {p1}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v0

    .line 1735
    .local v0, "mac":Ljavax/crypto/Mac;
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {p2}, Lokio/ByteString;->toByteArray()[B

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 1736
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eqz v1, :cond_0

    .line 1737
    iget-object v1, v1, Lokio/Segment;->data:[B

    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v2, v2, Lokio/Segment;->pos:I

    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v3, Lokio/Segment;->limit:I

    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v4, v4, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    invoke-virtual {v0, v1, v2, v3}, Ljavax/crypto/Mac;->update([BII)V

    .line 1738
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    .local v1, "s":Lokio/Segment;
    :goto_0
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eq v1, v2, :cond_0

    .line 1739
    iget-object v2, v1, Lokio/Segment;->data:[B

    iget v3, v1, Lokio/Segment;->pos:I

    iget v4, v1, Lokio/Segment;->limit:I

    iget v5, v1, Lokio/Segment;->pos:I

    sub-int/2addr v4, v5

    invoke-virtual {v0, v2, v3, v4}, Ljavax/crypto/Mac;->update([BII)V

    .line 1738
    iget-object v2, v1, Lokio/Segment;->next:Lokio/Segment;

    move-object v1, v2

    goto :goto_0

    .line 1742
    .end local v1    # "s":Lokio/Segment;
    :cond_0
    invoke-virtual {v0}, Ljavax/crypto/Mac;->doFinal()[B

    move-result-object v1

    invoke-static {v1}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v1
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 1745
    .end local v0    # "mac":Ljavax/crypto/Mac;
    :catch_0
    move-exception v0

    .line 1746
    .local v0, "e":Ljava/security/InvalidKeyException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 1743
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    :catch_1
    move-exception v0

    .line 1744
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method private rangeEquals(Lokio/Segment;ILokio/ByteString;II)Z
    .locals 5
    .param p1, "segment"    # Lokio/Segment;
    .param p2, "segmentPos"    # I
    .param p3, "bytes"    # Lokio/ByteString;
    .param p4, "bytesOffset"    # I
    .param p5, "bytesLimit"    # I

    .line 1635
    iget v0, p1, Lokio/Segment;->limit:I

    .line 1636
    .local v0, "segmentLimit":I
    iget-object v1, p1, Lokio/Segment;->data:[B

    .line 1638
    .local v1, "data":[B
    move v2, p4

    .local v2, "i":I
    :goto_0
    if-ge v2, p5, :cond_2

    .line 1639
    if-ne p2, v0, :cond_0

    .line 1640
    iget-object p1, p1, Lokio/Segment;->next:Lokio/Segment;

    .line 1641
    iget-object v1, p1, Lokio/Segment;->data:[B

    .line 1642
    iget p2, p1, Lokio/Segment;->pos:I

    .line 1643
    iget v0, p1, Lokio/Segment;->limit:I

    .line 1646
    :cond_0
    aget-byte v3, v1, p2

    invoke-virtual {p3, v2}, Lokio/ByteString;->getByte(I)B

    move-result v4

    if-eq v3, v4, :cond_1

    .line 1647
    const/4 v3, 0x0

    return v3

    .line 1650
    :cond_1
    add-int/lit8 p2, p2, 0x1

    .line 1651
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1654
    .end local v2    # "i":I
    :cond_2
    const/4 v2, 0x1

    return v2
.end method

.method private readFrom(Ljava/io/InputStream;JZ)V
    .locals 7
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "byteCount"    # J
    .param p4, "forever"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 246
    if-eqz p1, :cond_4

    .line 247
    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-gtz v2, :cond_1

    if-eqz p4, :cond_0

    goto :goto_1

    .line 259
    :cond_0
    return-void

    .line 248
    :cond_1
    :goto_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v0

    .line 249
    .local v0, "tail":Lokio/Segment;
    iget v1, v0, Lokio/Segment;->limit:I

    rsub-int v1, v1, 0x2000

    int-to-long v1, v1

    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v2, v1

    .line 250
    .local v2, "maxToCopy":I
    iget-object v1, v0, Lokio/Segment;->data:[B

    iget v3, v0, Lokio/Segment;->limit:I

    invoke-virtual {p1, v1, v3, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 251
    .local v1, "bytesRead":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_3

    .line 252
    if-eqz p4, :cond_2

    return-void

    .line 253
    :cond_2
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 255
    :cond_3
    iget v3, v0, Lokio/Segment;->limit:I

    add-int/2addr v3, v1

    iput v3, v0, Lokio/Segment;->limit:I

    .line 256
    iget-wide v3, p0, Lokio/Buffer;->size:J

    int-to-long v5, v1

    add-long/2addr v3, v5

    iput-wide v3, p0, Lokio/Buffer;->size:J

    .line 257
    int-to-long v3, v1

    sub-long/2addr p2, v3

    .line 258
    .end local v0    # "tail":Lokio/Segment;
    .end local v1    # "bytesRead":I
    .end local v2    # "maxToCopy":I
    goto :goto_0

    .line 246
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "in == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2
.end method


# virtual methods
.method public buffer()Lokio/Buffer;
    .locals 0

    .line 71
    return-object p0
.end method

.method public final clear()V
    .locals 2

    .line 922
    :try_start_0
    iget-wide v0, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->skip(J)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 925
    nop

    .line 926
    return-void

    .line 923
    :catch_0
    move-exception v0

    .line 924
    .local v0, "e":Ljava/io/EOFException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0}, Lokio/Buffer;->clone()Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lokio/Buffer;
    .locals 6

    .line 1806
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 1807
    .local v0, "result":Lokio/Buffer;
    iget-wide v1, p0, Lokio/Buffer;->size:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    return-object v0

    .line 1809
    :cond_0
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    invoke-virtual {v1}, Lokio/Segment;->sharedCopy()Lokio/Segment;

    move-result-object v1

    iput-object v1, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1810
    iput-object v1, v1, Lokio/Segment;->prev:Lokio/Segment;

    iput-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    .line 1811
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    .local v1, "s":Lokio/Segment;
    :goto_0
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eq v1, v2, :cond_1

    .line 1812
    iget-object v2, v0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v2, v2, Lokio/Segment;->prev:Lokio/Segment;

    invoke-virtual {v1}, Lokio/Segment;->sharedCopy()Lokio/Segment;

    move-result-object v3

    invoke-virtual {v2, v3}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    .line 1811
    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_0

    .line 1814
    .end local v1    # "s":Lokio/Segment;
    :cond_1
    iget-wide v1, p0, Lokio/Buffer;->size:J

    iput-wide v1, v0, Lokio/Buffer;->size:J

    .line 1815
    return-object v0
.end method

.method public close()V
    .locals 0

    .line 1665
    return-void
.end method

.method public final completeSegmentByteCount()J
    .locals 5

    .line 267
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 268
    .local v0, "result":J
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    return-wide v2

    .line 271
    :cond_0
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v2, v2, Lokio/Segment;->prev:Lokio/Segment;

    .line 272
    .local v2, "tail":Lokio/Segment;
    iget v3, v2, Lokio/Segment;->limit:I

    const/16 v4, 0x2000

    if-ge v3, v4, :cond_1

    iget-boolean v3, v2, Lokio/Segment;->owner:Z

    if-eqz v3, :cond_1

    .line 273
    iget v3, v2, Lokio/Segment;->limit:I

    iget v4, v2, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    sub-long/2addr v0, v3

    .line 276
    :cond_1
    return-wide v0
.end method

.method public final copyTo(Ljava/io/OutputStream;)Lokio/Buffer;
    .locals 6
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 142
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->copyTo(Ljava/io/OutputStream;JJ)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public final copyTo(Ljava/io/OutputStream;JJ)Lokio/Buffer;
    .locals 7
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "offset"    # J
    .param p4, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 150
    if-eqz p1, :cond_3

    .line 151
    iget-wide v0, p0, Lokio/Buffer;->size:J

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 152
    const-wide/16 v0, 0x0

    cmp-long v2, p4, v0

    if-nez v2, :cond_0

    return-object p0

    .line 155
    :cond_0
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 156
    .local v2, "s":Lokio/Segment;
    :goto_0
    iget v3, v2, Lokio/Segment;->limit:I

    iget v4, v2, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    cmp-long v5, p2, v3

    if-ltz v5, :cond_1

    .line 157
    iget v3, v2, Lokio/Segment;->limit:I

    iget v4, v2, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    sub-long/2addr p2, v3

    .line 156
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_0

    .line 161
    :cond_1
    :goto_1
    cmp-long v3, p4, v0

    if-lez v3, :cond_2

    .line 162
    iget v3, v2, Lokio/Segment;->pos:I

    int-to-long v3, v3

    add-long/2addr v3, p2

    long-to-int v4, v3

    .line 163
    .local v4, "pos":I
    iget v3, v2, Lokio/Segment;->limit:I

    sub-int/2addr v3, v4

    int-to-long v5, v3

    invoke-static {v5, v6, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v3, v5

    .line 164
    .local v3, "toCopy":I
    iget-object v5, v2, Lokio/Segment;->data:[B

    invoke-virtual {p1, v5, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 165
    int-to-long v5, v3

    sub-long/2addr p4, v5

    .line 166
    const-wide/16 p2, 0x0

    .line 161
    .end local v3    # "toCopy":I
    .end local v4    # "pos":I
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_1

    .line 169
    :cond_2
    return-object p0

    .line 150
    .end local v2    # "s":Lokio/Segment;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "out == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2
.end method

.method public final copyTo(Lokio/Buffer;JJ)Lokio/Buffer;
    .locals 6
    .param p1, "out"    # Lokio/Buffer;
    .param p2, "offset"    # J
    .param p4, "byteCount"    # J

    .line 174
    if-eqz p1, :cond_4

    .line 175
    iget-wide v0, p0, Lokio/Buffer;->size:J

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 176
    const-wide/16 v0, 0x0

    cmp-long v2, p4, v0

    if-nez v2, :cond_0

    return-object p0

    .line 178
    :cond_0
    iget-wide v2, p1, Lokio/Buffer;->size:J

    add-long/2addr v2, p4

    iput-wide v2, p1, Lokio/Buffer;->size:J

    .line 181
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 182
    .local v2, "s":Lokio/Segment;
    :goto_0
    iget v3, v2, Lokio/Segment;->limit:I

    iget v4, v2, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    cmp-long v5, p2, v3

    if-ltz v5, :cond_1

    .line 183
    iget v3, v2, Lokio/Segment;->limit:I

    iget v4, v2, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    sub-long/2addr p2, v3

    .line 182
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_0

    .line 187
    :cond_1
    :goto_1
    cmp-long v3, p4, v0

    if-lez v3, :cond_3

    .line 188
    invoke-virtual {v2}, Lokio/Segment;->sharedCopy()Lokio/Segment;

    move-result-object v3

    .line 189
    .local v3, "copy":Lokio/Segment;
    iget v4, v3, Lokio/Segment;->pos:I

    int-to-long v4, v4

    add-long/2addr v4, p2

    long-to-int v5, v4

    iput v5, v3, Lokio/Segment;->pos:I

    .line 190
    iget v4, v3, Lokio/Segment;->pos:I

    long-to-int v5, p4

    add-int/2addr v4, v5

    iget v5, v3, Lokio/Segment;->limit:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    iput v4, v3, Lokio/Segment;->limit:I

    .line 191
    iget-object v4, p1, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v4, :cond_2

    .line 192
    iput-object v3, v3, Lokio/Segment;->prev:Lokio/Segment;

    iput-object v3, v3, Lokio/Segment;->next:Lokio/Segment;

    iput-object v3, p1, Lokio/Buffer;->head:Lokio/Segment;

    goto :goto_2

    .line 194
    :cond_2
    iget-object v4, v4, Lokio/Segment;->prev:Lokio/Segment;

    invoke-virtual {v4, v3}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    .line 196
    :goto_2
    iget v4, v3, Lokio/Segment;->limit:I

    iget v5, v3, Lokio/Segment;->pos:I

    sub-int/2addr v4, v5

    int-to-long v4, v4

    sub-long/2addr p4, v4

    .line 197
    const-wide/16 p2, 0x0

    .line 187
    .end local v3    # "copy":Lokio/Segment;
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_1

    .line 200
    :cond_3
    return-object p0

    .line 174
    .end local v2    # "s":Lokio/Segment;
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "out == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw v0

    :goto_4
    goto :goto_3
.end method

.method public emit()Lokio/BufferedSink;
    .locals 0

    .line 101
    return-object p0
.end method

.method public emitCompleteSegments()Lokio/Buffer;
    .locals 0

    .line 97
    return-object p0
.end method

.method public bridge synthetic emitCompleteSegments()Lokio/BufferedSink;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0}, Lokio/Buffer;->emitCompleteSegments()Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 17
    .param p1, "o"    # Ljava/lang/Object;

    .line 1751
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    return v2

    .line 1752
    :cond_0
    instance-of v3, v1, Lokio/Buffer;

    const/4 v4, 0x0

    if-nez v3, :cond_1

    return v4

    .line 1753
    :cond_1
    move-object v3, v1

    check-cast v3, Lokio/Buffer;

    .line 1754
    .local v3, "that":Lokio/Buffer;
    iget-wide v5, v0, Lokio/Buffer;->size:J

    iget-wide v7, v3, Lokio/Buffer;->size:J

    cmp-long v9, v5, v7

    if-eqz v9, :cond_2

    return v4

    .line 1755
    :cond_2
    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-nez v9, :cond_3

    return v2

    .line 1757
    :cond_3
    iget-object v5, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1758
    .local v5, "sa":Lokio/Segment;
    iget-object v6, v3, Lokio/Buffer;->head:Lokio/Segment;

    .line 1759
    .local v6, "sb":Lokio/Segment;
    iget v7, v5, Lokio/Segment;->pos:I

    .line 1760
    .local v7, "posA":I
    iget v8, v6, Lokio/Segment;->pos:I

    .line 1762
    .local v8, "posB":I
    const-wide/16 v9, 0x0

    .local v9, "pos":J
    :goto_0
    iget-wide v11, v0, Lokio/Buffer;->size:J

    cmp-long v13, v9, v11

    if-gez v13, :cond_8

    .line 1763
    iget v11, v5, Lokio/Segment;->limit:I

    sub-int/2addr v11, v7

    iget v12, v6, Lokio/Segment;->limit:I

    sub-int/2addr v12, v8

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v11

    int-to-long v11, v11

    .line 1765
    .local v11, "count":J
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_1
    int-to-long v14, v13

    cmp-long v16, v14, v11

    if-gez v16, :cond_5

    .line 1766
    iget-object v14, v5, Lokio/Segment;->data:[B

    add-int/lit8 v15, v7, 0x1

    .end local v7    # "posA":I
    .local v15, "posA":I
    aget-byte v7, v14, v7

    iget-object v14, v6, Lokio/Segment;->data:[B

    add-int/lit8 v16, v8, 0x1

    .end local v8    # "posB":I
    .local v16, "posB":I
    aget-byte v8, v14, v8

    if-eq v7, v8, :cond_4

    return v4

    .line 1765
    :cond_4
    add-int/lit8 v13, v13, 0x1

    move v7, v15

    move/from16 v8, v16

    goto :goto_1

    .line 1769
    .end local v13    # "i":I
    .end local v15    # "posA":I
    .end local v16    # "posB":I
    .restart local v7    # "posA":I
    .restart local v8    # "posB":I
    :cond_5
    iget v13, v5, Lokio/Segment;->limit:I

    if-ne v7, v13, :cond_6

    .line 1770
    iget-object v5, v5, Lokio/Segment;->next:Lokio/Segment;

    .line 1771
    iget v7, v5, Lokio/Segment;->pos:I

    .line 1774
    :cond_6
    iget v13, v6, Lokio/Segment;->limit:I

    if-ne v8, v13, :cond_7

    .line 1775
    iget-object v6, v6, Lokio/Segment;->next:Lokio/Segment;

    .line 1776
    iget v8, v6, Lokio/Segment;->pos:I

    .line 1762
    :cond_7
    add-long/2addr v9, v11

    goto :goto_0

    .line 1780
    .end local v9    # "pos":J
    .end local v11    # "count":J
    :cond_8
    return v2
.end method

.method public exhausted()Z
    .locals 5

    .line 105
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public flush()V
    .locals 0

    .line 1658
    return-void
.end method

.method public final getByte(J)B
    .locals 6
    .param p1, "pos"    # J

    .line 302
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v4, 0x1

    move-wide v2, p1

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 303
    iget-wide v0, p0, Lokio/Buffer;->size:J

    sub-long v2, v0, p1

    cmp-long v4, v2, p1

    if-lez v4, :cond_1

    .line 304
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 305
    .local v0, "s":Lokio/Segment;
    :goto_0
    iget v1, v0, Lokio/Segment;->limit:I

    iget v2, v0, Lokio/Segment;->pos:I

    sub-int/2addr v1, v2

    .line 306
    .local v1, "segmentByteCount":I
    int-to-long v2, v1

    cmp-long v4, p1, v2

    if-gez v4, :cond_0

    iget-object v2, v0, Lokio/Segment;->data:[B

    iget v3, v0, Lokio/Segment;->pos:I

    long-to-int v4, p1

    add-int/2addr v3, v4

    aget-byte v2, v2, v3

    return v2

    .line 307
    :cond_0
    int-to-long v2, v1

    sub-long/2addr p1, v2

    .line 304
    .end local v1    # "segmentByteCount":I
    iget-object v0, v0, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_0

    .line 310
    .end local v0    # "s":Lokio/Segment;
    :cond_1
    sub-long/2addr p1, v0

    .line 311
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v0, v0, Lokio/Segment;->prev:Lokio/Segment;

    .line 312
    .restart local v0    # "s":Lokio/Segment;
    :goto_1
    iget v1, v0, Lokio/Segment;->limit:I

    iget v2, v0, Lokio/Segment;->pos:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    add-long/2addr p1, v1

    .line 313
    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-ltz v3, :cond_2

    iget-object v1, v0, Lokio/Segment;->data:[B

    iget v2, v0, Lokio/Segment;->pos:I

    long-to-int v3, p1

    add-int/2addr v2, v3

    aget-byte v1, v1, v2

    return v1

    .line 311
    :cond_2
    iget-object v0, v0, Lokio/Segment;->prev:Lokio/Segment;

    goto :goto_1
.end method

.method public hashCode()I
    .locals 6

    .line 1784
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1785
    .local v0, "s":Lokio/Segment;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    return v1

    .line 1786
    :cond_0
    const/4 v1, 0x1

    .line 1788
    .local v1, "result":I
    :goto_0
    iget v2, v0, Lokio/Segment;->pos:I

    .local v2, "pos":I
    iget v3, v0, Lokio/Segment;->limit:I

    .local v3, "limit":I
    :goto_1
    if-ge v2, v3, :cond_1

    .line 1789
    mul-int/lit8 v4, v1, 0x1f

    iget-object v5, v0, Lokio/Segment;->data:[B

    aget-byte v5, v5, v2

    add-int v1, v4, v5

    .line 1788
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1791
    .end local v2    # "pos":I
    .end local v3    # "limit":I
    :cond_1
    iget-object v0, v0, Lokio/Segment;->next:Lokio/Segment;

    .line 1792
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-ne v0, v2, :cond_2

    .line 1793
    return v1

    .line 1792
    :cond_2
    goto :goto_0
.end method

.method public final hmacSha1(Lokio/ByteString;)Lokio/ByteString;
    .locals 1
    .param p1, "key"    # Lokio/ByteString;

    .line 1719
    const-string v0, "HmacSHA1"

    invoke-direct {p0, v0, p1}, Lokio/Buffer;->hmac(Ljava/lang/String;Lokio/ByteString;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final hmacSha256(Lokio/ByteString;)Lokio/ByteString;
    .locals 1
    .param p1, "key"    # Lokio/ByteString;

    .line 1724
    const-string v0, "HmacSHA256"

    invoke-direct {p0, v0, p1}, Lokio/Buffer;->hmac(Ljava/lang/String;Lokio/ByteString;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final hmacSha512(Lokio/ByteString;)Lokio/ByteString;
    .locals 1
    .param p1, "key"    # Lokio/ByteString;

    .line 1729
    const-string v0, "HmacSHA512"

    invoke-direct {p0, v0, p1}, Lokio/Buffer;->hmac(Ljava/lang/String;Lokio/ByteString;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public indexOf(B)J
    .locals 6
    .param p1, "b"    # B

    .line 1405
    const-wide/16 v2, 0x0

    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move v1, p1

    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->indexOf(BJJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOf(BJ)J
    .locals 6
    .param p1, "b"    # B
    .param p2, "fromIndex"    # J

    .line 1413
    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->indexOf(BJJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOf(BJJ)J
    .locals 10
    .param p1, "b"    # B
    .param p2, "fromIndex"    # J
    .param p4, "toIndex"    # J

    .line 1417
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_8

    cmp-long v0, p4, p2

    if-ltz v0, :cond_8

    .line 1422
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v2, p4, v0

    if-lez v2, :cond_0

    iget-wide p4, p0, Lokio/Buffer;->size:J

    .line 1423
    :cond_0
    const-wide/16 v2, -0x1

    cmp-long v4, p2, p4

    if-nez v4, :cond_1

    return-wide v2

    .line 1431
    :cond_1
    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1432
    .local v4, "s":Lokio/Segment;
    if-nez v4, :cond_2

    .line 1434
    return-wide v2

    .line 1435
    :cond_2
    sub-long/2addr v0, p2

    cmp-long v5, v0, p2

    if-gez v5, :cond_3

    .line 1437
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 1438
    .local v0, "offset":J
    :goto_0
    cmp-long v5, v0, p2

    if-lez v5, :cond_4

    .line 1439
    iget-object v4, v4, Lokio/Segment;->prev:Lokio/Segment;

    .line 1440
    iget v5, v4, Lokio/Segment;->limit:I

    iget v6, v4, Lokio/Segment;->pos:I

    sub-int/2addr v5, v6

    int-to-long v5, v5

    sub-long/2addr v0, v5

    goto :goto_0

    .line 1444
    .end local v0    # "offset":J
    :cond_3
    const-wide/16 v0, 0x0

    .line 1445
    .restart local v0    # "offset":J
    :goto_1
    iget v5, v4, Lokio/Segment;->limit:I

    iget v6, v4, Lokio/Segment;->pos:I

    sub-int/2addr v5, v6

    int-to-long v5, v5

    add-long/2addr v5, v0

    move-wide v7, v5

    .local v7, "nextOffset":J
    cmp-long v9, v5, p2

    if-gez v9, :cond_4

    .line 1446
    iget-object v4, v4, Lokio/Segment;->next:Lokio/Segment;

    .line 1447
    move-wide v0, v7

    goto :goto_1

    .line 1453
    .end local v7    # "nextOffset":J
    :cond_4
    :goto_2
    cmp-long v5, v0, p4

    if-gez v5, :cond_7

    .line 1454
    iget-object v5, v4, Lokio/Segment;->data:[B

    .line 1455
    .local v5, "data":[B
    iget v6, v4, Lokio/Segment;->limit:I

    int-to-long v6, v6

    iget v8, v4, Lokio/Segment;->pos:I

    int-to-long v8, v8

    add-long/2addr v8, p4

    sub-long/2addr v8, v0

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    long-to-int v7, v6

    .line 1456
    .local v7, "limit":I
    iget v6, v4, Lokio/Segment;->pos:I

    int-to-long v8, v6

    add-long/2addr v8, p2

    sub-long/2addr v8, v0

    long-to-int v6, v8

    .line 1457
    .local v6, "pos":I
    :goto_3
    if-ge v6, v7, :cond_6

    .line 1458
    aget-byte v8, v5, v6

    if-ne v8, p1, :cond_5

    .line 1459
    iget v2, v4, Lokio/Segment;->pos:I

    sub-int v2, v6, v2

    int-to-long v2, v2

    add-long/2addr v2, v0

    return-wide v2

    .line 1457
    :cond_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 1464
    :cond_6
    iget v8, v4, Lokio/Segment;->limit:I

    iget v9, v4, Lokio/Segment;->pos:I

    sub-int/2addr v8, v9

    int-to-long v8, v8

    add-long/2addr v0, v8

    .line 1465
    move-wide p2, v0

    .line 1466
    iget-object v4, v4, Lokio/Segment;->next:Lokio/Segment;

    .line 1467
    .end local v5    # "data":[B
    .end local v6    # "pos":I
    .end local v7    # "limit":I
    goto :goto_2

    .line 1469
    :cond_7
    return-wide v2

    .line 1418
    .end local v0    # "offset":J
    .end local v4    # "s":Lokio/Segment;
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-wide v3, p0, Lokio/Buffer;->size:J

    .line 1419
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const/4 v2, 0x2

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "size=%s fromIndex=%s toIndex=%s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw v0

    :goto_5
    goto :goto_4
.end method

.method public indexOf(Lokio/ByteString;)J
    .locals 2
    .param p1, "bytes"    # Lokio/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1473
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->indexOf(Lokio/ByteString;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOf(Lokio/ByteString;J)J
    .locals 22
    .param p1, "bytes"    # Lokio/ByteString;
    .param p2, "fromIndex"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1477
    move-object/from16 v6, p0

    invoke-virtual/range {p1 .. p1}, Lokio/ByteString;->size()I

    move-result v0

    if-eqz v0, :cond_8

    .line 1478
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_7

    .line 1486
    iget-object v0, v6, Lokio/Buffer;->head:Lokio/Segment;

    .line 1487
    .local v0, "s":Lokio/Segment;
    const-wide/16 v7, -0x1

    if-nez v0, :cond_0

    .line 1489
    return-wide v7

    .line 1490
    :cond_0
    iget-wide v1, v6, Lokio/Buffer;->size:J

    sub-long v1, v1, p2

    cmp-long v3, v1, p2

    if-gez v3, :cond_1

    .line 1492
    iget-wide v1, v6, Lokio/Buffer;->size:J

    .line 1493
    .local v1, "offset":J
    :goto_0
    cmp-long v3, v1, p2

    if-lez v3, :cond_2

    .line 1494
    iget-object v0, v0, Lokio/Segment;->prev:Lokio/Segment;

    .line 1495
    iget v3, v0, Lokio/Segment;->limit:I

    iget v4, v0, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    sub-long/2addr v1, v3

    goto :goto_0

    .line 1499
    .end local v1    # "offset":J
    :cond_1
    const-wide/16 v1, 0x0

    .line 1500
    .restart local v1    # "offset":J
    :goto_1
    iget v3, v0, Lokio/Segment;->limit:I

    iget v4, v0, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    add-long/2addr v3, v1

    move-wide v9, v3

    .local v9, "nextOffset":J
    cmp-long v5, v3, p2

    if-gez v5, :cond_2

    .line 1501
    iget-object v0, v0, Lokio/Segment;->next:Lokio/Segment;

    .line 1502
    move-wide v1, v9

    goto :goto_1

    .line 1509
    .end local v9    # "nextOffset":J
    :cond_2
    const/4 v3, 0x0

    move-object/from16 v9, p1

    invoke-virtual {v9, v3}, Lokio/ByteString;->getByte(I)B

    move-result v10

    .line 1510
    .local v10, "b0":B
    invoke-virtual/range {p1 .. p1}, Lokio/ByteString;->size()I

    move-result v11

    .line 1511
    .local v11, "bytesSize":I
    iget-wide v3, v6, Lokio/Buffer;->size:J

    int-to-long v12, v11

    sub-long/2addr v3, v12

    const-wide/16 v12, 0x1

    add-long/2addr v12, v3

    move-wide/from16 v14, p2

    move-object v5, v0

    move-wide/from16 v16, v1

    .line 1512
    .end local v0    # "s":Lokio/Segment;
    .end local v1    # "offset":J
    .end local p2    # "fromIndex":J
    .local v5, "s":Lokio/Segment;
    .local v12, "resultLimit":J
    .local v14, "fromIndex":J
    .local v16, "offset":J
    :goto_2
    cmp-long v0, v16, v12

    if-gez v0, :cond_6

    .line 1514
    iget-object v4, v5, Lokio/Segment;->data:[B

    .line 1515
    .local v4, "data":[B
    iget v0, v5, Lokio/Segment;->limit:I

    int-to-long v0, v0

    iget v2, v5, Lokio/Segment;->pos:I

    int-to-long v2, v2

    add-long/2addr v2, v12

    sub-long v2, v2, v16

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v3, v0

    .line 1516
    .local v3, "segmentLimit":I
    iget v0, v5, Lokio/Segment;->pos:I

    int-to-long v0, v0

    add-long/2addr v0, v14

    sub-long v0, v0, v16

    long-to-int v1, v0

    move v2, v1

    .local v2, "pos":I
    :goto_3
    if-ge v2, v3, :cond_5

    .line 1517
    aget-byte v0, v4, v2

    if-ne v0, v10, :cond_3

    add-int/lit8 v18, v2, 0x1

    const/16 v19, 0x1

    move-object/from16 v0, p0

    move-object v1, v5

    move/from16 v20, v2

    .end local v2    # "pos":I
    .local v20, "pos":I
    move/from16 v2, v18

    move/from16 v18, v3

    .end local v3    # "segmentLimit":I
    .local v18, "segmentLimit":I
    move-object/from16 v3, p1

    move-object/from16 v21, v4

    .end local v4    # "data":[B
    .local v21, "data":[B
    move/from16 v4, v19

    move-object v7, v5

    .end local v5    # "s":Lokio/Segment;
    .local v7, "s":Lokio/Segment;
    move v5, v11

    invoke-direct/range {v0 .. v5}, Lokio/Buffer;->rangeEquals(Lokio/Segment;ILokio/ByteString;II)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1518
    iget v0, v7, Lokio/Segment;->pos:I

    sub-int v2, v20, v0

    int-to-long v0, v2

    add-long v0, v0, v16

    return-wide v0

    .line 1517
    .end local v7    # "s":Lokio/Segment;
    .end local v18    # "segmentLimit":I
    .end local v20    # "pos":I
    .end local v21    # "data":[B
    .restart local v2    # "pos":I
    .restart local v3    # "segmentLimit":I
    .restart local v4    # "data":[B
    .restart local v5    # "s":Lokio/Segment;
    :cond_3
    move/from16 v20, v2

    move/from16 v18, v3

    move-object/from16 v21, v4

    move-object v7, v5

    .line 1516
    .end local v2    # "pos":I
    .end local v3    # "segmentLimit":I
    .end local v4    # "data":[B
    .end local v5    # "s":Lokio/Segment;
    .restart local v7    # "s":Lokio/Segment;
    .restart local v18    # "segmentLimit":I
    .restart local v20    # "pos":I
    .restart local v21    # "data":[B
    :cond_4
    add-int/lit8 v2, v20, 0x1

    move-object v5, v7

    move/from16 v3, v18

    move-object/from16 v4, v21

    const-wide/16 v7, -0x1

    .end local v20    # "pos":I
    .restart local v2    # "pos":I
    goto :goto_3

    .end local v7    # "s":Lokio/Segment;
    .end local v18    # "segmentLimit":I
    .end local v21    # "data":[B
    .restart local v3    # "segmentLimit":I
    .restart local v4    # "data":[B
    .restart local v5    # "s":Lokio/Segment;
    :cond_5
    move/from16 v20, v2

    move/from16 v18, v3

    move-object/from16 v21, v4

    move-object v7, v5

    .line 1523
    .end local v2    # "pos":I
    .end local v3    # "segmentLimit":I
    .end local v4    # "data":[B
    .end local v5    # "s":Lokio/Segment;
    .restart local v7    # "s":Lokio/Segment;
    .restart local v18    # "segmentLimit":I
    .restart local v21    # "data":[B
    iget v0, v7, Lokio/Segment;->limit:I

    iget v1, v7, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    add-long v16, v16, v0

    .line 1524
    move-wide/from16 v14, v16

    .line 1525
    iget-object v5, v7, Lokio/Segment;->next:Lokio/Segment;

    .line 1526
    .end local v7    # "s":Lokio/Segment;
    .end local v18    # "segmentLimit":I
    .end local v21    # "data":[B
    .restart local v5    # "s":Lokio/Segment;
    const-wide/16 v7, -0x1

    goto :goto_2

    .line 1528
    :cond_6
    const-wide/16 v0, -0x1

    return-wide v0

    .line 1478
    .end local v5    # "s":Lokio/Segment;
    .end local v10    # "b0":B
    .end local v11    # "bytesSize":I
    .end local v12    # "resultLimit":J
    .end local v14    # "fromIndex":J
    .end local v16    # "offset":J
    .restart local p2    # "fromIndex":J
    :cond_7
    move-object/from16 v9, p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "fromIndex < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1477
    :cond_8
    move-object/from16 v9, p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bytes is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw v0

    :goto_5
    goto :goto_4
.end method

.method public indexOfElement(Lokio/ByteString;)J
    .locals 2
    .param p1, "targetBytes"    # Lokio/ByteString;

    .line 1532
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->indexOfElement(Lokio/ByteString;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOfElement(Lokio/ByteString;J)J
    .locals 16
    .param p1, "targetBytes"    # Lokio/ByteString;
    .param p2, "fromIndex"    # J

    .line 1536
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-wide/16 v2, 0x0

    cmp-long v4, p2, v2

    if-ltz v4, :cond_c

    .line 1544
    iget-object v2, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1545
    .local v2, "s":Lokio/Segment;
    const-wide/16 v3, -0x1

    if-nez v2, :cond_0

    .line 1547
    return-wide v3

    .line 1548
    :cond_0
    iget-wide v5, v0, Lokio/Buffer;->size:J

    sub-long v5, v5, p2

    cmp-long v7, v5, p2

    if-gez v7, :cond_1

    .line 1550
    iget-wide v5, v0, Lokio/Buffer;->size:J

    .line 1551
    .local v5, "offset":J
    :goto_0
    cmp-long v7, v5, p2

    if-lez v7, :cond_2

    .line 1552
    iget-object v2, v2, Lokio/Segment;->prev:Lokio/Segment;

    .line 1553
    iget v7, v2, Lokio/Segment;->limit:I

    iget v8, v2, Lokio/Segment;->pos:I

    sub-int/2addr v7, v8

    int-to-long v7, v7

    sub-long/2addr v5, v7

    goto :goto_0

    .line 1557
    .end local v5    # "offset":J
    :cond_1
    const-wide/16 v5, 0x0

    .line 1558
    .restart local v5    # "offset":J
    :goto_1
    iget v7, v2, Lokio/Segment;->limit:I

    iget v8, v2, Lokio/Segment;->pos:I

    sub-int/2addr v7, v8

    int-to-long v7, v7

    add-long/2addr v7, v5

    move-wide v9, v7

    .local v9, "nextOffset":J
    cmp-long v11, v7, p2

    if-gez v11, :cond_2

    .line 1559
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    .line 1560
    move-wide v5, v9

    goto :goto_1

    .line 1568
    .end local v9    # "nextOffset":J
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lokio/ByteString;->size()I

    move-result v7

    const/4 v8, 0x2

    const/4 v9, 0x0

    if-ne v7, v8, :cond_7

    .line 1570
    invoke-virtual {v1, v9}, Lokio/ByteString;->getByte(I)B

    move-result v7

    .line 1571
    .local v7, "b0":B
    const/4 v8, 0x1

    invoke-virtual {v1, v8}, Lokio/ByteString;->getByte(I)B

    move-result v8

    move-wide v9, v5

    move-wide/from16 v5, p2

    .line 1572
    .end local p2    # "fromIndex":J
    .local v5, "fromIndex":J
    .local v8, "b1":B
    .local v9, "offset":J
    :goto_2
    iget-wide v11, v0, Lokio/Buffer;->size:J

    cmp-long v13, v9, v11

    if-gez v13, :cond_6

    .line 1573
    iget-object v11, v2, Lokio/Segment;->data:[B

    .line 1574
    .local v11, "data":[B
    iget v12, v2, Lokio/Segment;->pos:I

    int-to-long v12, v12

    add-long/2addr v12, v5

    sub-long/2addr v12, v9

    long-to-int v13, v12

    .local v13, "pos":I
    iget v12, v2, Lokio/Segment;->limit:I

    .local v12, "limit":I
    :goto_3
    if-ge v13, v12, :cond_5

    .line 1575
    aget-byte v14, v11, v13

    .line 1576
    .local v14, "b":I
    if-eq v14, v7, :cond_4

    if-ne v14, v8, :cond_3

    goto :goto_4

    .line 1574
    .end local v14    # "b":I
    :cond_3
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 1577
    .restart local v14    # "b":I
    :cond_4
    :goto_4
    iget v3, v2, Lokio/Segment;->pos:I

    sub-int v3, v13, v3

    int-to-long v3, v3

    add-long/2addr v3, v9

    return-wide v3

    .line 1582
    .end local v12    # "limit":I
    .end local v13    # "pos":I
    .end local v14    # "b":I
    :cond_5
    iget v12, v2, Lokio/Segment;->limit:I

    iget v13, v2, Lokio/Segment;->pos:I

    sub-int/2addr v12, v13

    int-to-long v12, v12

    add-long/2addr v9, v12

    .line 1583
    move-wide v5, v9

    .line 1584
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    .line 1585
    .end local v11    # "data":[B
    goto :goto_2

    .line 1586
    .end local v7    # "b0":B
    .end local v8    # "b1":B
    :cond_6
    goto :goto_8

    .line 1588
    .end local v9    # "offset":J
    .local v5, "offset":J
    .restart local p2    # "fromIndex":J
    :cond_7
    invoke-virtual/range {p1 .. p1}, Lokio/ByteString;->internalArray()[B

    move-result-object v7

    move-wide v10, v5

    move-wide/from16 v5, p2

    .line 1589
    .end local p2    # "fromIndex":J
    .local v5, "fromIndex":J
    .local v7, "targetByteArray":[B
    .local v10, "offset":J
    :goto_5
    iget-wide v12, v0, Lokio/Buffer;->size:J

    cmp-long v8, v10, v12

    if-gez v8, :cond_b

    .line 1590
    iget-object v8, v2, Lokio/Segment;->data:[B

    .line 1591
    .local v8, "data":[B
    iget v12, v2, Lokio/Segment;->pos:I

    int-to-long v12, v12

    add-long/2addr v12, v5

    sub-long/2addr v12, v10

    long-to-int v13, v12

    .restart local v13    # "pos":I
    iget v12, v2, Lokio/Segment;->limit:I

    .restart local v12    # "limit":I
    :goto_6
    if-ge v13, v12, :cond_a

    .line 1592
    aget-byte v14, v8, v13

    .line 1593
    .restart local v14    # "b":I
    array-length v15, v7

    :goto_7
    if-ge v9, v15, :cond_9

    aget-byte v3, v7, v9

    .line 1594
    .local v3, "t":B
    if-ne v14, v3, :cond_8

    iget v4, v2, Lokio/Segment;->pos:I

    sub-int v4, v13, v4

    int-to-long v0, v4

    add-long/2addr v0, v10

    return-wide v0

    .line 1593
    .end local v3    # "t":B
    :cond_8
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-wide/16 v3, -0x1

    goto :goto_7

    .line 1591
    .end local v14    # "b":I
    :cond_9
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-wide/16 v3, -0x1

    const/4 v9, 0x0

    goto :goto_6

    .line 1599
    .end local v12    # "limit":I
    .end local v13    # "pos":I
    :cond_a
    iget v0, v2, Lokio/Segment;->limit:I

    iget v1, v2, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    add-long/2addr v10, v0

    .line 1600
    move-wide v5, v10

    .line 1601
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    .line 1602
    .end local v8    # "data":[B
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-wide/16 v3, -0x1

    const/4 v9, 0x0

    goto :goto_5

    .line 1589
    :cond_b
    move-wide v9, v10

    .line 1605
    .end local v7    # "targetByteArray":[B
    .end local v10    # "offset":J
    .restart local v9    # "offset":J
    :goto_8
    const-wide/16 v0, -0x1

    return-wide v0

    .line 1536
    .end local v2    # "s":Lokio/Segment;
    .end local v5    # "fromIndex":J
    .end local v9    # "offset":J
    .restart local p2    # "fromIndex":J
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "fromIndex < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_a

    :goto_9
    throw v0

    :goto_a
    goto :goto_9
.end method

.method public inputStream()Ljava/io/InputStream;
    .locals 1

    .line 117
    new-instance v0, Lokio/Buffer$2;

    invoke-direct {v0, p0}, Lokio/Buffer$2;-><init>(Lokio/Buffer;)V

    return-object v0
.end method

.method public isOpen()Z
    .locals 1

    .line 1661
    const/4 v0, 0x1

    return v0
.end method

.method public final md5()Lokio/ByteString;
    .locals 1

    .line 1684
    const-string v0, "MD5"

    invoke-direct {p0, v0}, Lokio/Buffer;->digest(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public outputStream()Ljava/io/OutputStream;
    .locals 1

    .line 75
    new-instance v0, Lokio/Buffer$1;

    invoke-direct {v0, p0}, Lokio/Buffer$1;-><init>(Lokio/Buffer;)V

    return-object v0
.end method

.method public rangeEquals(JLokio/ByteString;)Z
    .locals 6
    .param p1, "offset"    # J
    .param p3, "bytes"    # Lokio/ByteString;

    .line 1609
    invoke-virtual {p3}, Lokio/ByteString;->size()I

    move-result v5

    const/4 v4, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->rangeEquals(JLokio/ByteString;II)Z

    move-result v0

    return v0
.end method

.method public rangeEquals(JLokio/ByteString;II)Z
    .locals 6
    .param p1, "offset"    # J
    .param p3, "bytes"    # Lokio/ByteString;
    .param p4, "bytesOffset"    # I
    .param p5, "byteCount"    # I

    .line 1614
    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-ltz v3, :cond_3

    if-ltz p4, :cond_3

    if-ltz p5, :cond_3

    iget-wide v1, p0, Lokio/Buffer;->size:J

    sub-long/2addr v1, p1

    int-to-long v3, p5

    cmp-long v5, v1, v3

    if-ltz v5, :cond_3

    .line 1618
    invoke-virtual {p3}, Lokio/ByteString;->size()I

    move-result v1

    sub-int/2addr v1, p4

    if-ge v1, p5, :cond_0

    goto :goto_1

    .line 1621
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p5, :cond_2

    .line 1622
    int-to-long v2, v1

    add-long/2addr v2, p1

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->getByte(J)B

    move-result v2

    add-int v3, p4, v1

    invoke-virtual {p3, v3}, Lokio/ByteString;->getByte(I)B

    move-result v3

    if-eq v2, v3, :cond_1

    .line 1623
    return v0

    .line 1621
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1626
    .end local v1    # "i":I
    :cond_2
    const/4 v0, 0x1

    return v0

    .line 1619
    :cond_3
    :goto_1
    return v0
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .locals 6
    .param p1, "sink"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 899
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 900
    .local v0, "s":Lokio/Segment;
    if-nez v0, :cond_0

    const/4 v1, -0x1

    return v1

    .line 902
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    iget v2, v0, Lokio/Segment;->limit:I

    iget v3, v0, Lokio/Segment;->pos:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 903
    .local v1, "toCopy":I
    iget-object v2, v0, Lokio/Segment;->data:[B

    iget v3, v0, Lokio/Segment;->pos:I

    invoke-virtual {p1, v2, v3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 905
    iget v2, v0, Lokio/Segment;->pos:I

    add-int/2addr v2, v1

    iput v2, v0, Lokio/Segment;->pos:I

    .line 906
    iget-wide v2, p0, Lokio/Buffer;->size:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lokio/Buffer;->size:J

    .line 908
    iget v2, v0, Lokio/Segment;->pos:I

    iget v3, v0, Lokio/Segment;->limit:I

    if-ne v2, v3, :cond_1

    .line 909
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v2

    iput-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 910
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 913
    :cond_1
    return v1
.end method

.method public read([B)I
    .locals 2
    .param p1, "sink"    # [B

    .line 867
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lokio/Buffer;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 7
    .param p1, "sink"    # [B
    .param p2, "offset"    # I
    .param p3, "byteCount"    # I

    .line 880
    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v5, p3

    invoke-static/range {v1 .. v6}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 882
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 883
    .local v0, "s":Lokio/Segment;
    if-nez v0, :cond_0

    const/4 v1, -0x1

    return v1

    .line 884
    :cond_0
    iget v1, v0, Lokio/Segment;->limit:I

    iget v2, v0, Lokio/Segment;->pos:I

    sub-int/2addr v1, v2

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 885
    .local v1, "toCopy":I
    iget-object v2, v0, Lokio/Segment;->data:[B

    iget v3, v0, Lokio/Segment;->pos:I

    invoke-static {v2, v3, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 887
    iget v2, v0, Lokio/Segment;->pos:I

    add-int/2addr v2, v1

    iput v2, v0, Lokio/Segment;->pos:I

    .line 888
    iget-wide v2, p0, Lokio/Buffer;->size:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lokio/Buffer;->size:J

    .line 890
    iget v2, v0, Lokio/Segment;->pos:I

    iget v3, v0, Lokio/Segment;->limit:I

    if-ne v2, v3, :cond_1

    .line 891
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v2

    iput-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 892
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 895
    :cond_1
    return v1
.end method

.method public read(Lokio/Buffer;J)J
    .locals 5
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J

    .line 1396
    if-eqz p1, :cond_3

    .line 1397
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_2

    .line 1398
    iget-wide v2, p0, Lokio/Buffer;->size:J

    cmp-long v4, v2, v0

    if-nez v4, :cond_0

    const-wide/16 v0, -0x1

    return-wide v0

    .line 1399
    :cond_0
    cmp-long v0, p2, v2

    if-lez v0, :cond_1

    iget-wide p2, p0, Lokio/Buffer;->size:J

    .line 1400
    :cond_1
    invoke-virtual {p1, p0, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 1401
    return-wide p2

    .line 1397
    :cond_2
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

    .line 1396
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "sink == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readAll(Lokio/Sink;)J
    .locals 5
    .param p1, "sink"    # Lokio/Sink;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 675
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 676
    .local v0, "byteCount":J
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 677
    invoke-interface {p1, p0, v0, v1}, Lokio/Sink;->write(Lokio/Buffer;J)V

    .line 679
    :cond_0
    return-wide v0
.end method

.method public final readAndWriteUnsafe()Lokio/Buffer$UnsafeCursor;
    .locals 1

    .line 1849
    new-instance v0, Lokio/Buffer$UnsafeCursor;

    invoke-direct {v0}, Lokio/Buffer$UnsafeCursor;-><init>()V

    invoke-virtual {p0, v0}, Lokio/Buffer;->readAndWriteUnsafe(Lokio/Buffer$UnsafeCursor;)Lokio/Buffer$UnsafeCursor;

    move-result-object v0

    return-object v0
.end method

.method public final readAndWriteUnsafe(Lokio/Buffer$UnsafeCursor;)Lokio/Buffer$UnsafeCursor;
    .locals 2
    .param p1, "unsafeCursor"    # Lokio/Buffer$UnsafeCursor;

    .line 1853
    iget-object v0, p1, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    if-nez v0, :cond_0

    .line 1857
    iput-object p0, p1, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    .line 1858
    const/4 v0, 0x1

    iput-boolean v0, p1, Lokio/Buffer$UnsafeCursor;->readWrite:Z

    .line 1859
    return-object p1

    .line 1854
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "already attached to a buffer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readByte()B
    .locals 9

    .line 280
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    .line 282
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 283
    .local v0, "segment":Lokio/Segment;
    iget v1, v0, Lokio/Segment;->pos:I

    .line 284
    .local v1, "pos":I
    iget v2, v0, Lokio/Segment;->limit:I

    .line 286
    .local v2, "limit":I
    iget-object v3, v0, Lokio/Segment;->data:[B

    .line 287
    .local v3, "data":[B
    add-int/lit8 v4, v1, 0x1

    .end local v1    # "pos":I
    .local v4, "pos":I
    aget-byte v1, v3, v1

    .line 288
    .local v1, "b":B
    iget-wide v5, p0, Lokio/Buffer;->size:J

    const-wide/16 v7, 0x1

    sub-long/2addr v5, v7

    iput-wide v5, p0, Lokio/Buffer;->size:J

    .line 290
    if-ne v4, v2, :cond_0

    .line 291
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v5

    iput-object v5, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 292
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_0

    .line 294
    :cond_0
    iput v4, v0, Lokio/Segment;->pos:I

    .line 297
    :goto_0
    return v1

    .line 280
    .end local v0    # "segment":Lokio/Segment;
    .end local v1    # "b":B
    .end local v2    # "limit":I
    .end local v3    # "data":[B
    .end local v4    # "pos":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "size == 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readByteArray()[B
    .locals 2

    .line 849
    :try_start_0
    iget-wide v0, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->readByteArray(J)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 850
    :catch_0
    move-exception v0

    .line 851
    .local v0, "e":Ljava/io/EOFException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public readByteArray(J)[B
    .locals 6
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 856
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 857
    const-wide/32 v0, 0x7fffffff

    cmp-long v2, p1, v0

    if-gtz v2, :cond_0

    .line 861
    long-to-int v0, p1

    new-array v0, v0, [B

    .line 862
    .local v0, "result":[B
    invoke-virtual {p0, v0}, Lokio/Buffer;->readFully([B)V

    .line 863
    return-object v0

    .line 858
    .end local v0    # "result":[B
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "byteCount > Integer.MAX_VALUE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readByteString()Lokio/ByteString;
    .locals 2

    .line 540
    new-instance v0, Lokio/ByteString;

    invoke-virtual {p0}, Lokio/Buffer;->readByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lokio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public readByteString(J)Lokio/ByteString;
    .locals 2
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 544
    new-instance v0, Lokio/ByteString;

    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readByteArray(J)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lokio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public readDecimalLong()J
    .locals 20

    .line 426
    move-object/from16 v0, p0

    iget-wide v1, v0, Lokio/Buffer;->size:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-eqz v5, :cond_c

    .line 429
    const-wide/16 v1, 0x0

    .line 430
    .local v1, "value":J
    const/4 v3, 0x0

    .line 431
    .local v3, "seen":I
    const/4 v4, 0x0

    .line 432
    .local v4, "negative":Z
    const/4 v5, 0x0

    .line 434
    .local v5, "done":Z
    const-wide v6, -0xcccccccccccccccL

    .line 435
    .local v6, "overflowZone":J
    const-wide/16 v8, -0x7

    .line 438
    .local v8, "overflowDigit":J
    :goto_0
    iget-object v10, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 440
    .local v10, "segment":Lokio/Segment;
    iget-object v11, v10, Lokio/Segment;->data:[B

    .line 441
    .local v11, "data":[B
    iget v12, v10, Lokio/Segment;->pos:I

    .line 442
    .local v12, "pos":I
    iget v13, v10, Lokio/Segment;->limit:I

    .line 444
    .local v13, "limit":I
    :goto_1
    if-ge v12, v13, :cond_7

    .line 445
    aget-byte v14, v11, v12

    .line 446
    .local v14, "b":B
    const/16 v15, 0x30

    if-lt v14, v15, :cond_4

    const/16 v15, 0x39

    if-gt v14, v15, :cond_4

    .line 447
    rsub-int/lit8 v15, v14, 0x30

    .line 450
    .local v15, "digit":I
    cmp-long v16, v1, v6

    if-ltz v16, :cond_2

    cmp-long v16, v1, v6

    if-nez v16, :cond_0

    move-wide/from16 v16, v6

    move v7, v5

    .end local v5    # "done":Z
    .end local v6    # "overflowZone":J
    .local v7, "done":Z
    .local v16, "overflowZone":J
    int-to-long v5, v15

    cmp-long v18, v5, v8

    if-gez v18, :cond_1

    goto :goto_2

    .end local v7    # "done":Z
    .end local v16    # "overflowZone":J
    .restart local v5    # "done":Z
    .restart local v6    # "overflowZone":J
    :cond_0
    move-wide/from16 v16, v6

    move v7, v5

    .line 455
    .end local v5    # "done":Z
    .end local v6    # "overflowZone":J
    .restart local v7    # "done":Z
    .restart local v16    # "overflowZone":J
    :cond_1
    const-wide/16 v5, 0xa

    mul-long v1, v1, v5

    .line 456
    int-to-long v5, v15

    add-long/2addr v1, v5

    .line 457
    .end local v15    # "digit":I
    move/from16 v18, v7

    move-object/from16 v19, v11

    goto :goto_3

    .line 450
    .end local v7    # "done":Z
    .end local v16    # "overflowZone":J
    .restart local v5    # "done":Z
    .restart local v6    # "overflowZone":J
    .restart local v15    # "digit":I
    :cond_2
    move-wide/from16 v16, v6

    move v7, v5

    .line 451
    .end local v5    # "done":Z
    .end local v6    # "overflowZone":J
    .restart local v7    # "done":Z
    .restart local v16    # "overflowZone":J
    :goto_2
    new-instance v5, Lokio/Buffer;

    invoke-direct {v5}, Lokio/Buffer;-><init>()V

    invoke-virtual {v5, v1, v2}, Lokio/Buffer;->writeDecimalLong(J)Lokio/Buffer;

    move-result-object v5

    invoke-virtual {v5, v14}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    move-result-object v5

    .line 452
    .local v5, "buffer":Lokio/Buffer;
    if-nez v4, :cond_3

    invoke-virtual {v5}, Lokio/Buffer;->readByte()B

    .line 453
    :cond_3
    new-instance v6, Ljava/lang/NumberFormatException;

    move/from16 v18, v7

    .end local v7    # "done":Z
    .local v18, "done":Z
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v19, v11

    .end local v11    # "data":[B
    .local v19, "data":[B
    const-string v11, "Number too large: "

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 446
    .end local v15    # "digit":I
    .end local v16    # "overflowZone":J
    .end local v18    # "done":Z
    .end local v19    # "data":[B
    .local v5, "done":Z
    .restart local v6    # "overflowZone":J
    .restart local v11    # "data":[B
    :cond_4
    move/from16 v18, v5

    move-wide/from16 v16, v6

    move-object/from16 v19, v11

    .line 457
    .end local v5    # "done":Z
    .end local v6    # "overflowZone":J
    .end local v11    # "data":[B
    .restart local v16    # "overflowZone":J
    .restart local v18    # "done":Z
    .restart local v19    # "data":[B
    const/16 v5, 0x2d

    if-ne v14, v5, :cond_5

    if-nez v3, :cond_5

    .line 458
    const/4 v4, 0x1

    .line 459
    const-wide/16 v5, 0x1

    sub-long/2addr v8, v5

    .line 444
    .end local v14    # "b":B
    :goto_3
    add-int/lit8 v12, v12, 0x1

    add-int/lit8 v3, v3, 0x1

    move-wide/from16 v6, v16

    move/from16 v5, v18

    move-object/from16 v11, v19

    goto :goto_1

    .line 461
    .restart local v14    # "b":B
    :cond_5
    if-eqz v3, :cond_6

    .line 466
    const/4 v5, 0x1

    .line 467
    .end local v18    # "done":Z
    .restart local v5    # "done":Z
    goto :goto_4

    .line 462
    .end local v5    # "done":Z
    .restart local v18    # "done":Z
    :cond_6
    new-instance v5, Ljava/lang/NumberFormatException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expected leading [0-9] or \'-\' character but was 0x"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 463
    invoke-static {v14}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 444
    .end local v14    # "b":B
    .end local v16    # "overflowZone":J
    .end local v18    # "done":Z
    .end local v19    # "data":[B
    .restart local v5    # "done":Z
    .restart local v6    # "overflowZone":J
    .restart local v11    # "data":[B
    :cond_7
    move/from16 v18, v5

    move-wide/from16 v16, v6

    move-object/from16 v19, v11

    .line 471
    .end local v6    # "overflowZone":J
    .end local v11    # "data":[B
    .restart local v16    # "overflowZone":J
    .restart local v19    # "data":[B
    :goto_4
    if-ne v12, v13, :cond_8

    .line 472
    invoke-virtual {v10}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v6

    iput-object v6, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 473
    invoke-static {v10}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_5

    .line 475
    :cond_8
    iput v12, v10, Lokio/Segment;->pos:I

    .line 477
    .end local v10    # "segment":Lokio/Segment;
    .end local v12    # "pos":I
    .end local v13    # "limit":I
    .end local v19    # "data":[B
    :goto_5
    if-nez v5, :cond_a

    iget-object v6, v0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v6, :cond_9

    goto :goto_6

    :cond_9
    move-wide/from16 v6, v16

    goto/16 :goto_0

    .line 479
    :cond_a
    :goto_6
    iget-wide v6, v0, Lokio/Buffer;->size:J

    int-to-long v10, v3

    sub-long/2addr v6, v10

    iput-wide v6, v0, Lokio/Buffer;->size:J

    .line 480
    if-eqz v4, :cond_b

    move-wide v6, v1

    goto :goto_7

    :cond_b
    neg-long v6, v1

    :goto_7
    return-wide v6

    .line 426
    .end local v1    # "value":J
    .end local v3    # "seen":I
    .end local v4    # "negative":Z
    .end local v5    # "done":Z
    .end local v8    # "overflowDigit":J
    .end local v16    # "overflowZone":J
    :cond_c
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "size == 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_9

    :goto_8
    throw v1

    :goto_9
    goto :goto_8
.end method

.method public final readFrom(Ljava/io/InputStream;)Lokio/Buffer;
    .locals 3
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 234
    const-wide v0, 0x7fffffffffffffffL

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Lokio/Buffer;->readFrom(Ljava/io/InputStream;JZ)V

    .line 235
    return-object p0
.end method

.method public final readFrom(Ljava/io/InputStream;J)Lokio/Buffer;
    .locals 3
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 240
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_0

    .line 241
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lokio/Buffer;->readFrom(Ljava/io/InputStream;JZ)V

    .line 242
    return-object p0

    .line 240
    :cond_0
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

.method public readFully(Lokio/Buffer;J)V
    .locals 3
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 667
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v2, v0, p2

    if-ltz v2, :cond_0

    .line 671
    invoke-virtual {p1, p0, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 672
    return-void

    .line 668
    :cond_0
    invoke-virtual {p1, p0, v0, v1}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 669
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readFully([B)V
    .locals 3
    .param p1, "sink"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 871
    const/4 v0, 0x0

    .line 872
    .local v0, "offset":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 873
    array-length v1, p1

    sub-int/2addr v1, v0

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->read([BII)I

    move-result v1

    .line 874
    .local v1, "read":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 875
    add-int/2addr v0, v1

    .line 876
    .end local v1    # "read":I
    goto :goto_0

    .line 874
    .restart local v1    # "read":I
    :cond_0
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 877
    .end local v1    # "read":I
    :cond_1
    return-void
.end method

.method public readHexadecimalUnsignedLong()J
    .locals 15

    .line 484
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_9

    .line 486
    const-wide/16 v0, 0x0

    .line 487
    .local v0, "value":J
    const/4 v4, 0x0

    .line 488
    .local v4, "seen":I
    const/4 v5, 0x0

    .line 491
    .local v5, "done":Z
    :cond_0
    iget-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 493
    .local v6, "segment":Lokio/Segment;
    iget-object v7, v6, Lokio/Segment;->data:[B

    .line 494
    .local v7, "data":[B
    iget v8, v6, Lokio/Segment;->pos:I

    .line 495
    .local v8, "pos":I
    iget v9, v6, Lokio/Segment;->limit:I

    .line 497
    .local v9, "limit":I
    :goto_0
    if-ge v8, v9, :cond_6

    .line 500
    aget-byte v10, v7, v8

    .line 501
    .local v10, "b":B
    const/16 v11, 0x30

    if-lt v10, v11, :cond_1

    const/16 v11, 0x39

    if-gt v10, v11, :cond_1

    .line 502
    add-int/lit8 v11, v10, -0x30

    .local v11, "digit":I
    goto :goto_1

    .line 503
    .end local v11    # "digit":I
    :cond_1
    const/16 v11, 0x61

    if-lt v10, v11, :cond_2

    const/16 v11, 0x66

    if-gt v10, v11, :cond_2

    .line 504
    add-int/lit8 v11, v10, -0x61

    add-int/lit8 v11, v11, 0xa

    .restart local v11    # "digit":I
    goto :goto_1

    .line 505
    .end local v11    # "digit":I
    :cond_2
    const/16 v11, 0x41

    if-lt v10, v11, :cond_4

    const/16 v11, 0x46

    if-gt v10, v11, :cond_4

    .line 506
    add-int/lit8 v11, v10, -0x41

    add-int/lit8 v11, v11, 0xa

    .line 518
    .restart local v11    # "digit":I
    :goto_1
    const-wide/high16 v12, -0x1000000000000000L    # -3.105036184601418E231

    and-long/2addr v12, v0

    cmp-long v14, v12, v2

    if-nez v14, :cond_3

    .line 523
    const/4 v12, 0x4

    shl-long/2addr v0, v12

    .line 524
    int-to-long v12, v11

    or-long/2addr v0, v12

    .line 497
    .end local v10    # "b":B
    .end local v11    # "digit":I
    add-int/lit8 v8, v8, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 519
    .restart local v10    # "b":B
    .restart local v11    # "digit":I
    :cond_3
    new-instance v2, Lokio/Buffer;

    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    invoke-virtual {v2, v0, v1}, Lokio/Buffer;->writeHexadecimalUnsignedLong(J)Lokio/Buffer;

    move-result-object v2

    invoke-virtual {v2, v10}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    move-result-object v2

    .line 520
    .local v2, "buffer":Lokio/Buffer;
    new-instance v3, Ljava/lang/NumberFormatException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Number too large: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v2}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v3, v12}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 508
    .end local v2    # "buffer":Lokio/Buffer;
    .end local v11    # "digit":I
    :cond_4
    if-eqz v4, :cond_5

    .line 513
    const/4 v5, 0x1

    .line 514
    goto :goto_2

    .line 509
    :cond_5
    new-instance v2, Ljava/lang/NumberFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Expected leading [0-9a-fA-F] character but was 0x"

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 510
    invoke-static {v10}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 527
    .end local v10    # "b":B
    :cond_6
    :goto_2
    if-ne v8, v9, :cond_7

    .line 528
    invoke-virtual {v6}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v10

    iput-object v10, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 529
    invoke-static {v6}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_3

    .line 531
    :cond_7
    iput v8, v6, Lokio/Segment;->pos:I

    .line 533
    .end local v6    # "segment":Lokio/Segment;
    .end local v7    # "data":[B
    .end local v8    # "pos":I
    .end local v9    # "limit":I
    :goto_3
    if-nez v5, :cond_8

    iget-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v6, :cond_0

    .line 535
    :cond_8
    iget-wide v2, p0, Lokio/Buffer;->size:J

    int-to-long v6, v4

    sub-long/2addr v2, v6

    iput-wide v2, p0, Lokio/Buffer;->size:J

    .line 536
    return-wide v0

    .line 484
    .end local v0    # "value":J
    .end local v4    # "seen":I
    .end local v5    # "done":Z
    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "size == 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw v0

    :goto_5
    goto :goto_4
.end method

.method public readInt()I
    .locals 10

    .line 348
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x4

    cmp-long v4, v0, v2

    if-ltz v4, :cond_2

    .line 350
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 351
    .local v0, "segment":Lokio/Segment;
    iget v1, v0, Lokio/Segment;->pos:I

    .line 352
    .local v1, "pos":I
    iget v4, v0, Lokio/Segment;->limit:I

    .line 355
    .local v4, "limit":I
    sub-int v5, v4, v1

    const/4 v6, 0x4

    if-ge v5, v6, :cond_0

    .line 356
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x18

    .line 357
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x10

    or-int/2addr v2, v3

    .line 358
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v2, v3

    .line 359
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    .line 356
    return v2

    .line 362
    :cond_0
    iget-object v5, v0, Lokio/Segment;->data:[B

    .line 363
    .local v5, "data":[B
    add-int/lit8 v6, v1, 0x1

    .end local v1    # "pos":I
    .local v6, "pos":I
    aget-byte v1, v5, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "pos":I
    .local v7, "pos":I
    aget-byte v6, v5, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x10

    or-int/2addr v1, v6

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "pos":I
    .restart local v6    # "pos":I
    aget-byte v7, v5, v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    or-int/2addr v1, v7

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "pos":I
    .restart local v7    # "pos":I
    aget-byte v6, v5, v6

    and-int/lit16 v6, v6, 0xff

    or-int/2addr v1, v6

    .line 367
    .local v1, "i":I
    iget-wide v8, p0, Lokio/Buffer;->size:J

    sub-long/2addr v8, v2

    iput-wide v8, p0, Lokio/Buffer;->size:J

    .line 369
    if-ne v7, v4, :cond_1

    .line 370
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v2

    iput-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 371
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_0

    .line 373
    :cond_1
    iput v7, v0, Lokio/Segment;->pos:I

    .line 376
    :goto_0
    return v1

    .line 348
    .end local v0    # "segment":Lokio/Segment;
    .end local v1    # "i":I
    .end local v4    # "limit":I
    .end local v5    # "data":[B
    .end local v7    # "pos":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "size < 4: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lokio/Buffer;->size:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readIntLe()I
    .locals 1

    .line 418
    invoke-virtual {p0}, Lokio/Buffer;->readInt()I

    move-result v0

    invoke-static {v0}, Lokio/Util;->reverseBytesInt(I)I

    move-result v0

    return v0
.end method

.method public readLong()J
    .locals 15

    .line 380
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x8

    cmp-long v4, v0, v2

    if-ltz v4, :cond_2

    .line 382
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 383
    .local v0, "segment":Lokio/Segment;
    iget v1, v0, Lokio/Segment;->pos:I

    .line 384
    .local v1, "pos":I
    iget v4, v0, Lokio/Segment;->limit:I

    .line 387
    .local v4, "limit":I
    sub-int v5, v4, v1

    const/16 v6, 0x20

    const/16 v7, 0x8

    if-ge v5, v7, :cond_0

    .line 388
    invoke-virtual {p0}, Lokio/Buffer;->readInt()I

    move-result v2

    int-to-long v2, v2

    const-wide v7, 0xffffffffL

    and-long/2addr v2, v7

    shl-long/2addr v2, v6

    .line 389
    invoke-virtual {p0}, Lokio/Buffer;->readInt()I

    move-result v5

    int-to-long v5, v5

    and-long/2addr v5, v7

    or-long/2addr v2, v5

    .line 388
    return-wide v2

    .line 392
    :cond_0
    iget-object v5, v0, Lokio/Segment;->data:[B

    .line 393
    .local v5, "data":[B
    add-int/lit8 v8, v1, 0x1

    .end local v1    # "pos":I
    .local v8, "pos":I
    aget-byte v1, v5, v1

    int-to-long v9, v1

    const-wide/16 v11, 0xff

    and-long/2addr v9, v11

    const/16 v1, 0x38

    shl-long/2addr v9, v1

    add-int/lit8 v1, v8, 0x1

    .end local v8    # "pos":I
    .restart local v1    # "pos":I
    aget-byte v8, v5, v8

    int-to-long v13, v8

    and-long/2addr v13, v11

    const/16 v8, 0x30

    shl-long/2addr v13, v8

    or-long/2addr v9, v13

    add-int/lit8 v8, v1, 0x1

    .end local v1    # "pos":I
    .restart local v8    # "pos":I
    aget-byte v1, v5, v1

    int-to-long v13, v1

    and-long/2addr v13, v11

    const/16 v1, 0x28

    shl-long/2addr v13, v1

    or-long/2addr v9, v13

    add-int/lit8 v1, v8, 0x1

    .end local v8    # "pos":I
    .restart local v1    # "pos":I
    aget-byte v8, v5, v8

    int-to-long v13, v8

    and-long/2addr v13, v11

    shl-long/2addr v13, v6

    or-long/2addr v9, v13

    add-int/lit8 v6, v1, 0x1

    .end local v1    # "pos":I
    .local v6, "pos":I
    aget-byte v1, v5, v1

    int-to-long v13, v1

    and-long/2addr v13, v11

    const/16 v1, 0x18

    shl-long/2addr v13, v1

    or-long/2addr v9, v13

    add-int/lit8 v1, v6, 0x1

    .end local v6    # "pos":I
    .restart local v1    # "pos":I
    aget-byte v6, v5, v6

    int-to-long v13, v6

    and-long/2addr v13, v11

    const/16 v6, 0x10

    shl-long/2addr v13, v6

    or-long/2addr v9, v13

    add-int/lit8 v6, v1, 0x1

    .end local v1    # "pos":I
    .restart local v6    # "pos":I
    aget-byte v1, v5, v1

    int-to-long v13, v1

    and-long/2addr v13, v11

    shl-long v7, v13, v7

    or-long/2addr v7, v9

    add-int/lit8 v1, v6, 0x1

    .end local v6    # "pos":I
    .restart local v1    # "pos":I
    aget-byte v6, v5, v6

    int-to-long v9, v6

    and-long/2addr v9, v11

    or-long/2addr v7, v9

    .line 401
    .local v7, "v":J
    iget-wide v9, p0, Lokio/Buffer;->size:J

    sub-long/2addr v9, v2

    iput-wide v9, p0, Lokio/Buffer;->size:J

    .line 403
    if-ne v1, v4, :cond_1

    .line 404
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v2

    iput-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 405
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_0

    .line 407
    :cond_1
    iput v1, v0, Lokio/Segment;->pos:I

    .line 410
    :goto_0
    return-wide v7

    .line 380
    .end local v0    # "segment":Lokio/Segment;
    .end local v1    # "pos":I
    .end local v4    # "limit":I
    .end local v5    # "data":[B
    .end local v7    # "v":J
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "size < 8: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lokio/Buffer;->size:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readLongLe()J
    .locals 2

    .line 422
    invoke-virtual {p0}, Lokio/Buffer;->readLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Lokio/Util;->reverseBytesLong(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public readShort()S
    .locals 10

    .line 319
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x2

    cmp-long v4, v0, v2

    if-ltz v4, :cond_2

    .line 321
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 322
    .local v0, "segment":Lokio/Segment;
    iget v1, v0, Lokio/Segment;->pos:I

    .line 323
    .local v1, "pos":I
    iget v4, v0, Lokio/Segment;->limit:I

    .line 326
    .local v4, "limit":I
    sub-int v5, v4, v1

    const/4 v6, 0x2

    if-ge v5, v6, :cond_0

    .line 327
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    .line 328
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    .line 329
    .local v2, "s":I
    int-to-short v3, v2

    return v3

    .line 332
    .end local v2    # "s":I
    :cond_0
    iget-object v5, v0, Lokio/Segment;->data:[B

    .line 333
    .local v5, "data":[B
    add-int/lit8 v6, v1, 0x1

    .end local v1    # "pos":I
    .local v6, "pos":I
    aget-byte v1, v5, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "pos":I
    .local v7, "pos":I
    aget-byte v6, v5, v6

    and-int/lit16 v6, v6, 0xff

    or-int/2addr v1, v6

    .line 335
    .local v1, "s":I
    iget-wide v8, p0, Lokio/Buffer;->size:J

    sub-long/2addr v8, v2

    iput-wide v8, p0, Lokio/Buffer;->size:J

    .line 337
    if-ne v7, v4, :cond_1

    .line 338
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v2

    iput-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 339
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_0

    .line 341
    :cond_1
    iput v7, v0, Lokio/Segment;->pos:I

    .line 344
    :goto_0
    int-to-short v2, v1

    return v2

    .line 319
    .end local v0    # "segment":Lokio/Segment;
    .end local v1    # "s":I
    .end local v4    # "limit":I
    .end local v5    # "data":[B
    .end local v7    # "pos":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "size < 2: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lokio/Buffer;->size:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readShortLe()S
    .locals 1

    .line 414
    invoke-virtual {p0}, Lokio/Buffer;->readShort()S

    move-result v0

    invoke-static {v0}, Lokio/Util;->reverseBytesShort(S)S

    move-result v0

    return v0
.end method

.method public readString(JLjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 6
    .param p1, "byteCount"    # J
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 703
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 704
    if-eqz p3, :cond_4

    .line 705
    const-wide/32 v0, 0x7fffffff

    cmp-long v2, p1, v0

    if-gtz v2, :cond_3

    .line 708
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    const-string v0, ""

    return-object v0

    .line 710
    :cond_0
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 711
    .local v0, "s":Lokio/Segment;
    iget v1, v0, Lokio/Segment;->pos:I

    int-to-long v1, v1

    add-long/2addr v1, p1

    iget v3, v0, Lokio/Segment;->limit:I

    int-to-long v3, v3

    cmp-long v5, v1, v3

    if-lez v5, :cond_1

    .line 713
    new-instance v1, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readByteArray(J)[B

    move-result-object v2

    invoke-direct {v1, v2, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v1

    .line 716
    :cond_1
    new-instance v1, Ljava/lang/String;

    iget-object v2, v0, Lokio/Segment;->data:[B

    iget v3, v0, Lokio/Segment;->pos:I

    long-to-int v4, p1

    invoke-direct {v1, v2, v3, v4, p3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 717
    .local v1, "result":Ljava/lang/String;
    iget v2, v0, Lokio/Segment;->pos:I

    int-to-long v2, v2

    add-long/2addr v2, p1

    long-to-int v3, v2

    iput v3, v0, Lokio/Segment;->pos:I

    .line 718
    iget-wide v2, p0, Lokio/Buffer;->size:J

    sub-long/2addr v2, p1

    iput-wide v2, p0, Lokio/Buffer;->size:J

    .line 720
    iget v2, v0, Lokio/Segment;->pos:I

    iget v3, v0, Lokio/Segment;->limit:I

    if-ne v2, v3, :cond_2

    .line 721
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v2

    iput-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 722
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 725
    :cond_2
    return-object v1

    .line 706
    .end local v0    # "s":Lokio/Segment;
    .end local v1    # "result":Ljava/lang/String;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "byteCount > Integer.MAX_VALUE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 704
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "charset == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .line 696
    :try_start_0
    iget-wide v0, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v0, v1, p1}, Lokio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 697
    :catch_0
    move-exception v0

    .line 698
    .local v0, "e":Ljava/io/EOFException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public final readUnsafe()Lokio/Buffer$UnsafeCursor;
    .locals 1

    .line 1835
    new-instance v0, Lokio/Buffer$UnsafeCursor;

    invoke-direct {v0}, Lokio/Buffer$UnsafeCursor;-><init>()V

    invoke-virtual {p0, v0}, Lokio/Buffer;->readUnsafe(Lokio/Buffer$UnsafeCursor;)Lokio/Buffer$UnsafeCursor;

    move-result-object v0

    return-object v0
.end method

.method public final readUnsafe(Lokio/Buffer$UnsafeCursor;)Lokio/Buffer$UnsafeCursor;
    .locals 2
    .param p1, "unsafeCursor"    # Lokio/Buffer$UnsafeCursor;

    .line 1839
    iget-object v0, p1, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    if-nez v0, :cond_0

    .line 1843
    iput-object p0, p1, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    .line 1844
    const/4 v0, 0x0

    iput-boolean v0, p1, Lokio/Buffer$UnsafeCursor;->readWrite:Z

    .line 1845
    return-object p1

    .line 1840
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "already attached to a buffer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readUtf8()Ljava/lang/String;
    .locals 3

    .line 684
    :try_start_0
    iget-wide v0, p0, Lokio/Buffer;->size:J

    sget-object v2, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0, v1, v2}, Lokio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 685
    :catch_0
    move-exception v0

    .line 686
    .local v0, "e":Ljava/io/EOFException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public readUtf8(J)Ljava/lang/String;
    .locals 1
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 691
    sget-object v0, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p1, p2, v0}, Lokio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUtf8CodePoint()I
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 773
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_a

    .line 775
    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->getByte(J)B

    move-result v0

    .line 780
    .local v0, "b0":B
    and-int/lit16 v1, v0, 0x80

    const v2, 0xfffd

    if-nez v1, :cond_0

    .line 782
    and-int/lit8 v1, v0, 0x7f

    .line 783
    .local v1, "codePoint":I
    const/4 v3, 0x1

    .line 784
    .local v3, "byteCount":I
    const/4 v4, 0x0

    .local v4, "min":I
    goto :goto_0

    .line 786
    .end local v1    # "codePoint":I
    .end local v3    # "byteCount":I
    .end local v4    # "min":I
    :cond_0
    and-int/lit16 v1, v0, 0xe0

    const/16 v3, 0xc0

    if-ne v1, v3, :cond_1

    .line 788
    and-int/lit8 v1, v0, 0x1f

    .line 789
    .restart local v1    # "codePoint":I
    const/4 v3, 0x2

    .line 790
    .restart local v3    # "byteCount":I
    const/16 v4, 0x80

    .restart local v4    # "min":I
    goto :goto_0

    .line 792
    .end local v1    # "codePoint":I
    .end local v3    # "byteCount":I
    .end local v4    # "min":I
    :cond_1
    and-int/lit16 v1, v0, 0xf0

    const/16 v3, 0xe0

    if-ne v1, v3, :cond_2

    .line 794
    and-int/lit8 v1, v0, 0xf

    .line 795
    .restart local v1    # "codePoint":I
    const/4 v3, 0x3

    .line 796
    .restart local v3    # "byteCount":I
    const/16 v4, 0x800

    .restart local v4    # "min":I
    goto :goto_0

    .line 798
    .end local v1    # "codePoint":I
    .end local v3    # "byteCount":I
    .end local v4    # "min":I
    :cond_2
    and-int/lit16 v1, v0, 0xf8

    const/16 v3, 0xf0

    if-ne v1, v3, :cond_9

    .line 800
    and-int/lit8 v1, v0, 0x7

    .line 801
    .restart local v1    # "codePoint":I
    const/4 v3, 0x4

    .line 802
    .restart local v3    # "byteCount":I
    const/high16 v4, 0x10000

    .line 810
    .restart local v4    # "min":I
    :goto_0
    iget-wide v5, p0, Lokio/Buffer;->size:J

    int-to-long v7, v3

    cmp-long v9, v5, v7

    if-ltz v9, :cond_8

    .line 818
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_1
    if-ge v5, v3, :cond_4

    .line 819
    int-to-long v6, v5

    invoke-virtual {p0, v6, v7}, Lokio/Buffer;->getByte(J)B

    move-result v6

    .line 820
    .local v6, "b":B
    and-int/lit16 v7, v6, 0xc0

    const/16 v8, 0x80

    if-ne v7, v8, :cond_3

    .line 822
    shl-int/lit8 v1, v1, 0x6

    .line 823
    and-int/lit8 v7, v6, 0x3f

    or-int/2addr v1, v7

    .line 818
    .end local v6    # "b":B
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 825
    .restart local v6    # "b":B
    :cond_3
    int-to-long v7, v5

    invoke-virtual {p0, v7, v8}, Lokio/Buffer;->skip(J)V

    .line 826
    return v2

    .line 830
    .end local v5    # "i":I
    .end local v6    # "b":B
    :cond_4
    int-to-long v5, v3

    invoke-virtual {p0, v5, v6}, Lokio/Buffer;->skip(J)V

    .line 832
    const v5, 0x10ffff

    if-le v1, v5, :cond_5

    .line 833
    return v2

    .line 836
    :cond_5
    const v5, 0xd800

    if-lt v1, v5, :cond_6

    const v5, 0xdfff

    if-gt v1, v5, :cond_6

    .line 837
    return v2

    .line 840
    :cond_6
    if-ge v1, v4, :cond_7

    .line 841
    return v2

    .line 844
    :cond_7
    return v1

    .line 811
    :cond_8
    new-instance v2, Ljava/io/EOFException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "size < "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lokio/Buffer;->size:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " (to read code point prefixed 0x"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 812
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 806
    .end local v1    # "codePoint":I
    .end local v3    # "byteCount":I
    .end local v4    # "min":I
    :cond_9
    const-wide/16 v3, 0x1

    invoke-virtual {p0, v3, v4}, Lokio/Buffer;->skip(J)V

    .line 807
    return v2

    .line 773
    .end local v0    # "b0":B
    :cond_a
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2
.end method

.method public readUtf8Line()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 729
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lokio/Buffer;->indexOf(B)J

    move-result-wide v0

    .line 731
    .local v0, "newline":J
    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    .line 732
    iget-wide v2, p0, Lokio/Buffer;->size:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-eqz v6, :cond_0

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return-object v2

    .line 735
    :cond_1
    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->readUtf8Line(J)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method readUtf8Line(J)Ljava/lang/String;
    .locals 5
    .param p1, "newline"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 758
    const-wide/16 v0, 0x1

    const-wide/16 v2, 0x0

    cmp-long v4, p1, v2

    if-lez v4, :cond_0

    sub-long v2, p1, v0

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->getByte(J)B

    move-result v2

    const/16 v3, 0xd

    if-ne v2, v3, :cond_0

    .line 760
    sub-long v0, p1, v0

    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v0

    .line 761
    .local v0, "result":Ljava/lang/String;
    const-wide/16 v1, 0x2

    invoke-virtual {p0, v1, v2}, Lokio/Buffer;->skip(J)V

    .line 762
    return-object v0

    .line 766
    .end local v0    # "result":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v2

    .line 767
    .local v2, "result":Ljava/lang/String;
    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->skip(J)V

    .line 768
    return-object v2
.end method

.method public readUtf8LineStrict()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 739
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->readUtf8LineStrict(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUtf8LineStrict(J)Ljava/lang/String;
    .locals 12
    .param p1, "limit"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 743
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_3

    .line 744
    const-wide/16 v0, 0x1

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v4, p1, v2

    if-nez v4, :cond_0

    goto :goto_0

    :cond_0
    add-long v2, p1, v0

    .line 745
    .local v2, "scanLength":J
    :goto_0
    const/16 v5, 0xa

    const-wide/16 v6, 0x0

    move-object v4, p0

    move-wide v8, v2

    invoke-virtual/range {v4 .. v9}, Lokio/Buffer;->indexOf(BJJ)J

    move-result-wide v4

    .line 746
    .local v4, "newline":J
    const-wide/16 v6, -0x1

    cmp-long v8, v4, v6

    if-eqz v8, :cond_1

    invoke-virtual {p0, v4, v5}, Lokio/Buffer;->readUtf8Line(J)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 747
    :cond_1
    invoke-virtual {p0}, Lokio/Buffer;->size()J

    move-result-wide v6

    cmp-long v8, v2, v6

    if-gez v8, :cond_2

    sub-long v0, v2, v0

    .line 748
    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->getByte(J)B

    move-result v0

    const/16 v1, 0xd

    if-ne v0, v1, :cond_2

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->getByte(J)B

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_2

    .line 749
    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->readUtf8Line(J)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 751
    :cond_2
    new-instance v7, Lokio/Buffer;

    invoke-direct {v7}, Lokio/Buffer;-><init>()V

    .line 752
    .local v7, "data":Lokio/Buffer;
    const-wide/16 v8, 0x0

    const-wide/16 v0, 0x20

    invoke-virtual {p0}, Lokio/Buffer;->size()J

    move-result-wide v10

    invoke-static {v0, v1, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v10

    move-object v6, p0

    invoke-virtual/range {v6 .. v11}, Lokio/Buffer;->copyTo(Lokio/Buffer;JJ)Lokio/Buffer;

    .line 753
    new-instance v0, Ljava/io/EOFException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\\n not found: limit="

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lokio/Buffer;->size()J

    move-result-wide v8

    invoke-static {v8, v9, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    invoke-virtual {v1, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, " content="

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 754
    invoke-virtual {v7}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    move-result-object v6

    invoke-virtual {v6}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v6, 0x2026

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 743
    .end local v2    # "scanLength":J
    .end local v4    # "newline":J
    .end local v7    # "data":Lokio/Buffer;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "limit < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public request(J)Z
    .locals 3
    .param p1, "byteCount"    # J

    .line 113
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v2, v0, p1

    if-ltz v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public require(J)V
    .locals 3
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 109
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v2, v0, p1

    if-ltz v2, :cond_0

    .line 110
    return-void

    .line 109
    :cond_0
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method segmentSizes()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1673
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 1674
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1675
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v1, v1, Lokio/Segment;->limit:I

    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v2, v2, Lokio/Segment;->pos:I

    sub-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1676
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    .local v1, "s":Lokio/Segment;
    :goto_0
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eq v1, v2, :cond_1

    .line 1677
    iget v2, v1, Lokio/Segment;->limit:I

    iget v3, v1, Lokio/Segment;->pos:I

    sub-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1676
    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_0

    .line 1679
    .end local v1    # "s":Lokio/Segment;
    :cond_1
    return-object v0
.end method

.method public select(Lokio/Options;)I
    .locals 4
    .param p1, "options"    # Lokio/Options;

    .line 548
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lokio/Buffer;->selectPrefix(Lokio/Options;Z)I

    move-result v0

    .line 549
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return v1

    .line 552
    :cond_0
    iget-object v1, p1, Lokio/Options;->byteStrings:[Lokio/ByteString;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lokio/ByteString;->size()I

    move-result v1

    .line 554
    .local v1, "selectedSize":I
    int-to-long v2, v1

    :try_start_0
    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->skip(J)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 557
    nop

    .line 558
    return v0

    .line 555
    :catch_0
    move-exception v2

    .line 556
    .local v2, "e":Ljava/io/EOFException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3
.end method

.method selectPrefix(Lokio/Options;Z)I
    .locals 18
    .param p1, "options"    # Lokio/Options;
    .param p2, "selectTruncated"    # Z

    .line 574
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iget-object v2, v1, Lokio/Buffer;->head:Lokio/Segment;

    .line 575
    .local v2, "head":Lokio/Segment;
    const/4 v3, -0x2

    if-nez v2, :cond_1

    .line 576
    if-eqz p2, :cond_0

    return v3

    .line 577
    :cond_0
    sget-object v3, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    invoke-virtual {v0, v3}, Lokio/Options;->indexOf(Ljava/lang/Object;)I

    move-result v3

    return v3

    .line 580
    :cond_1
    move-object v4, v2

    .line 581
    .local v4, "s":Lokio/Segment;
    iget-object v5, v2, Lokio/Segment;->data:[B

    .line 582
    .local v5, "data":[B
    iget v6, v2, Lokio/Segment;->pos:I

    .line 583
    .local v6, "pos":I
    iget v7, v2, Lokio/Segment;->limit:I

    .line 585
    .local v7, "limit":I
    iget-object v8, v0, Lokio/Options;->trie:[I

    .line 586
    .local v8, "trie":[I
    const/4 v9, 0x0

    .line 588
    .local v9, "triePos":I
    const/4 v10, -0x1

    .line 592
    .local v10, "prefixIndex":I
    :goto_0
    add-int/lit8 v11, v9, 0x1

    .end local v9    # "triePos":I
    .local v11, "triePos":I
    aget v9, v8, v9

    .line 594
    .local v9, "scanOrSelect":I
    add-int/lit8 v12, v11, 0x1

    .end local v11    # "triePos":I
    .local v12, "triePos":I
    aget v11, v8, v11

    .line 595
    .local v11, "possiblePrefixIndex":I
    const/4 v13, -0x1

    if-eq v11, v13, :cond_2

    .line 596
    move v10, v11

    .line 601
    :cond_2
    if-nez v4, :cond_3

    .line 602
    goto :goto_3

    .line 603
    :cond_3
    if-gez v9, :cond_b

    .line 605
    mul-int/lit8 v13, v9, -0x1

    .line 606
    .local v13, "scanByteCount":I
    add-int v14, v12, v13

    .line 608
    .local v14, "trieLimit":I
    :goto_1
    add-int/lit8 v15, v6, 0x1

    .end local v6    # "pos":I
    .local v15, "pos":I
    aget-byte v6, v5, v6

    and-int/lit16 v6, v6, 0xff

    .line 609
    .local v6, "b":I
    add-int/lit8 v3, v12, 0x1

    .end local v12    # "triePos":I
    .local v3, "triePos":I
    aget v12, v8, v12

    if-eq v6, v12, :cond_4

    return v10

    .line 610
    :cond_4
    if-ne v3, v14, :cond_5

    const/4 v12, 0x1

    goto :goto_2

    :cond_5
    const/4 v12, 0x0

    .line 613
    .local v12, "scanComplete":Z
    :goto_2
    if-ne v15, v7, :cond_9

    .line 614
    iget-object v4, v4, Lokio/Segment;->next:Lokio/Segment;

    .line 615
    iget v15, v4, Lokio/Segment;->pos:I

    .line 616
    iget-object v5, v4, Lokio/Segment;->data:[B

    .line 617
    iget v7, v4, Lokio/Segment;->limit:I

    .line 618
    if-ne v4, v2, :cond_8

    .line 619
    if-nez v12, :cond_7

    move v12, v3

    move v6, v15

    .line 662
    .end local v3    # "triePos":I
    .end local v9    # "scanOrSelect":I
    .end local v11    # "possiblePrefixIndex":I
    .end local v13    # "scanByteCount":I
    .end local v14    # "trieLimit":I
    .end local v15    # "pos":I
    .local v6, "pos":I
    .local v12, "triePos":I
    :goto_3
    if-eqz p2, :cond_6

    const/16 v16, -0x2

    return v16

    .line 663
    :cond_6
    return v10

    .line 620
    .restart local v3    # "triePos":I
    .local v6, "b":I
    .restart local v9    # "scanOrSelect":I
    .restart local v11    # "possiblePrefixIndex":I
    .local v12, "scanComplete":Z
    .restart local v13    # "scanByteCount":I
    .restart local v14    # "trieLimit":I
    .restart local v15    # "pos":I
    :cond_7
    const/16 v16, -0x2

    const/4 v4, 0x0

    goto :goto_4

    .line 618
    :cond_8
    const/16 v16, -0x2

    goto :goto_4

    .line 613
    :cond_9
    const/16 v16, -0x2

    .line 624
    :goto_4
    if-eqz v12, :cond_a

    .line 625
    aget v17, v8, v3

    .line 626
    .local v17, "nextStep":I
    nop

    .line 629
    .end local v6    # "b":I
    .end local v12    # "scanComplete":Z
    .end local v13    # "scanByteCount":I
    .end local v14    # "trieLimit":I
    move v6, v15

    move/from16 v12, v17

    goto :goto_6

    .line 628
    .end local v17    # "nextStep":I
    .restart local v13    # "scanByteCount":I
    .restart local v14    # "trieLimit":I
    :cond_a
    move v12, v3

    move v6, v15

    const/4 v3, -0x2

    goto :goto_1

    .line 631
    .end local v3    # "triePos":I
    .end local v13    # "scanByteCount":I
    .end local v14    # "trieLimit":I
    .end local v15    # "pos":I
    .local v6, "pos":I
    .local v12, "triePos":I
    :cond_b
    const/16 v16, -0x2

    move v3, v9

    .line 632
    .local v3, "selectChoiceCount":I
    add-int/lit8 v13, v6, 0x1

    .end local v6    # "pos":I
    .local v13, "pos":I
    aget-byte v6, v5, v6

    and-int/lit16 v6, v6, 0xff

    .line 633
    .local v6, "b":I
    add-int v14, v12, v3

    .line 635
    .local v14, "selectLimit":I
    :goto_5
    if-ne v12, v14, :cond_c

    return v10

    .line 637
    :cond_c
    aget v15, v8, v12

    if-ne v6, v15, :cond_10

    .line 638
    add-int v15, v12, v3

    aget v17, v8, v15

    .line 639
    .restart local v17    # "nextStep":I
    nop

    .line 646
    if-ne v13, v7, :cond_e

    .line 647
    iget-object v4, v4, Lokio/Segment;->next:Lokio/Segment;

    .line 648
    iget v13, v4, Lokio/Segment;->pos:I

    .line 649
    iget-object v5, v4, Lokio/Segment;->data:[B

    .line 650
    iget v7, v4, Lokio/Segment;->limit:I

    .line 651
    if-ne v4, v2, :cond_d

    .line 652
    const/4 v4, 0x0

    move v3, v12

    move v6, v13

    move/from16 v12, v17

    goto :goto_6

    .line 651
    :cond_d
    move v3, v12

    move v6, v13

    move/from16 v12, v17

    goto :goto_6

    .line 646
    :cond_e
    move v3, v12

    move v6, v13

    move/from16 v12, v17

    .line 657
    .end local v13    # "pos":I
    .end local v14    # "selectLimit":I
    .end local v17    # "nextStep":I
    .local v3, "triePos":I
    .local v6, "pos":I
    .local v12, "nextStep":I
    :goto_6
    if-ltz v12, :cond_f

    return v12

    .line 658
    :cond_f
    neg-int v9, v12

    .line 659
    .end local v3    # "triePos":I
    .end local v11    # "possiblePrefixIndex":I
    .end local v12    # "nextStep":I
    .local v9, "triePos":I
    const/4 v3, -0x2

    goto/16 :goto_0

    .line 642
    .local v3, "selectChoiceCount":I
    .local v6, "b":I
    .local v9, "scanOrSelect":I
    .restart local v11    # "possiblePrefixIndex":I
    .local v12, "triePos":I
    .restart local v13    # "pos":I
    .restart local v14    # "selectLimit":I
    :cond_10
    add-int/lit8 v12, v12, 0x1

    goto :goto_5
.end method

.method public final sha1()Lokio/ByteString;
    .locals 1

    .line 1689
    const-string v0, "SHA-1"

    invoke-direct {p0, v0}, Lokio/Buffer;->digest(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final sha256()Lokio/ByteString;
    .locals 1

    .line 1694
    const-string v0, "SHA-256"

    invoke-direct {p0, v0}, Lokio/Buffer;->digest(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final sha512()Lokio/ByteString;
    .locals 1

    .line 1699
    const-string v0, "SHA-512"

    invoke-direct {p0, v0}, Lokio/Buffer;->digest(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final size()J
    .locals 2

    .line 67
    iget-wide v0, p0, Lokio/Buffer;->size:J

    return-wide v0
.end method

.method public skip(J)V
    .locals 6
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 930
    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_2

    .line 931
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eqz v0, :cond_1

    .line 933
    iget v0, v0, Lokio/Segment;->limit:I

    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v1, v1, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v1, v0

    .line 934
    .local v1, "toSkip":I
    iget-wide v2, p0, Lokio/Buffer;->size:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lokio/Buffer;->size:J

    .line 935
    int-to-long v2, v1

    sub-long/2addr p1, v2

    .line 936
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v2, v0, Lokio/Segment;->pos:I

    add-int/2addr v2, v1

    iput v2, v0, Lokio/Segment;->pos:I

    .line 938
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v0, v0, Lokio/Segment;->pos:I

    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v2, v2, Lokio/Segment;->limit:I

    if-ne v0, v2, :cond_0

    .line 939
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 940
    .local v0, "toRecycle":Lokio/Segment;
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v2

    iput-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 941
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 943
    .end local v0    # "toRecycle":Lokio/Segment;
    .end local v1    # "toSkip":I
    :cond_0
    goto :goto_0

    .line 931
    :cond_1
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 944
    :cond_2
    return-void
.end method

.method public final snapshot()Lokio/ByteString;
    .locals 5

    .line 1820
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/32 v2, 0x7fffffff

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 1823
    long-to-int v1, v0

    invoke-virtual {p0, v1}, Lokio/Buffer;->snapshot(I)Lokio/ByteString;

    move-result-object v0

    return-object v0

    .line 1821
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "size > Integer.MAX_VALUE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lokio/Buffer;->size:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final snapshot(I)Lokio/ByteString;
    .locals 1
    .param p1, "byteCount"    # I

    .line 1830
    if-nez p1, :cond_0

    sget-object v0, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    return-object v0

    .line 1831
    :cond_0
    new-instance v0, Lokio/SegmentedByteString;

    invoke-direct {v0, p0, p1}, Lokio/SegmentedByteString;-><init>(Lokio/Buffer;I)V

    return-object v0
.end method

.method public timeout()Lokio/Timeout;
    .locals 1

    .line 1668
    sget-object v0, Lokio/Timeout;->NONE:Lokio/Timeout;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1801
    invoke-virtual {p0}, Lokio/Buffer;->snapshot()Lokio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lokio/ByteString;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method writableSegment(I)Lokio/Segment;
    .locals 3
    .param p1, "minimumCapacity"    # I

    .line 1290
    const/4 v0, 0x1

    if-lt p1, v0, :cond_3

    const/16 v0, 0x2000

    if-gt p1, v0, :cond_3

    .line 1292
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v1, :cond_0

    .line 1293
    invoke-static {}, Lokio/SegmentPool;->take()Lokio/Segment;

    move-result-object v0

    iput-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1294
    iput-object v0, v0, Lokio/Segment;->prev:Lokio/Segment;

    iput-object v0, v0, Lokio/Segment;->next:Lokio/Segment;

    return-object v0

    .line 1297
    :cond_0
    iget-object v1, v1, Lokio/Segment;->prev:Lokio/Segment;

    .line 1298
    .local v1, "tail":Lokio/Segment;
    iget v2, v1, Lokio/Segment;->limit:I

    add-int/2addr v2, p1

    if-gt v2, v0, :cond_1

    iget-boolean v0, v1, Lokio/Segment;->owner:Z

    if-nez v0, :cond_2

    .line 1299
    :cond_1
    invoke-static {}, Lokio/SegmentPool;->take()Lokio/Segment;

    move-result-object v0

    invoke-virtual {v1, v0}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    move-result-object v1

    .line 1301
    :cond_2
    return-object v1

    .line 1290
    .end local v1    # "tail":Lokio/Segment;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public write(Ljava/nio/ByteBuffer;)I
    .locals 6
    .param p1, "source"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1114
    if-eqz p1, :cond_1

    .line 1116
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 1117
    .local v0, "byteCount":I
    move v1, v0

    .line 1118
    .local v1, "remaining":I
    :goto_0
    if-lez v1, :cond_0

    .line 1119
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v2

    .line 1121
    .local v2, "tail":Lokio/Segment;
    iget v3, v2, Lokio/Segment;->limit:I

    rsub-int v3, v3, 0x2000

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1122
    .local v3, "toCopy":I
    iget-object v4, v2, Lokio/Segment;->data:[B

    iget v5, v2, Lokio/Segment;->limit:I

    invoke-virtual {p1, v4, v5, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 1124
    sub-int/2addr v1, v3

    .line 1125
    iget v4, v2, Lokio/Segment;->limit:I

    add-int/2addr v4, v3

    iput v4, v2, Lokio/Segment;->limit:I

    .line 1126
    .end local v2    # "tail":Lokio/Segment;
    .end local v3    # "toCopy":I
    goto :goto_0

    .line 1128
    :cond_0
    iget-wide v2, p0, Lokio/Buffer;->size:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    iput-wide v2, p0, Lokio/Buffer;->size:J

    .line 1129
    return v0

    .line 1114
    .end local v0    # "byteCount":I
    .end local v1    # "remaining":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public write(Lokio/ByteString;)Lokio/Buffer;
    .locals 2
    .param p1, "byteString"    # Lokio/ByteString;

    .line 947
    if-eqz p1, :cond_0

    .line 948
    invoke-virtual {p1, p0}, Lokio/ByteString;->write(Lokio/Buffer;)V

    .line 949
    return-object p0

    .line 947
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "byteString == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public write([B)Lokio/Buffer;
    .locals 2
    .param p1, "source"    # [B

    .line 1090
    if-eqz p1, :cond_0

    .line 1091
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object v0

    return-object v0

    .line 1090
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public write([BII)Lokio/Buffer;
    .locals 7
    .param p1, "source"    # [B
    .param p2, "offset"    # I
    .param p3, "byteCount"    # I

    .line 1095
    if-eqz p1, :cond_1

    .line 1096
    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v5, p3

    invoke-static/range {v1 .. v6}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 1098
    add-int v0, p2, p3

    .line 1099
    .local v0, "limit":I
    :goto_0
    if-ge p2, v0, :cond_0

    .line 1100
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v1

    .line 1102
    .local v1, "tail":Lokio/Segment;
    sub-int v2, v0, p2

    iget v3, v1, Lokio/Segment;->limit:I

    rsub-int v3, v3, 0x2000

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 1103
    .local v2, "toCopy":I
    iget-object v3, v1, Lokio/Segment;->data:[B

    iget v4, v1, Lokio/Segment;->limit:I

    invoke-static {p1, p2, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1105
    add-int/2addr p2, v2

    .line 1106
    iget v3, v1, Lokio/Segment;->limit:I

    add-int/2addr v3, v2

    iput v3, v1, Lokio/Segment;->limit:I

    .line 1107
    .end local v1    # "tail":Lokio/Segment;
    .end local v2    # "toCopy":I
    goto :goto_0

    .line 1109
    :cond_0
    iget-wide v1, p0, Lokio/Buffer;->size:J

    int-to-long v3, p3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lokio/Buffer;->size:J

    .line 1110
    return-object p0

    .line 1095
    .end local v0    # "limit":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public bridge synthetic write(Lokio/ByteString;)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1}, Lokio/Buffer;->write(Lokio/ByteString;)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public write(Lokio/Source;J)Lokio/BufferedSink;
    .locals 5
    .param p1, "source"    # Lokio/Source;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1142
    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_1

    .line 1143
    invoke-interface {p1, p0, p2, p3}, Lokio/Source;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .line 1144
    .local v0, "read":J
    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 1145
    sub-long/2addr p2, v0

    .line 1146
    .end local v0    # "read":J
    goto :goto_0

    .line 1144
    .restart local v0    # "read":J
    :cond_0
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 1147
    .end local v0    # "read":J
    :cond_1
    return-object p0
.end method

.method public bridge synthetic write([B)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1}, Lokio/Buffer;->write([B)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic write([BII)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1, p2, p3}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public write(Lokio/Buffer;J)V
    .locals 6
    .param p1, "source"    # Lokio/Buffer;
    .param p2, "byteCount"    # J

    .line 1355
    if-eqz p1, :cond_7

    .line 1356
    if-eq p1, p0, :cond_6

    .line 1357
    iget-wide v0, p1, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 1359
    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_5

    .line 1361
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    iget v0, v0, Lokio/Segment;->limit:I

    iget-object v1, p1, Lokio/Buffer;->head:Lokio/Segment;

    iget v1, v1, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    cmp-long v2, p2, v0

    if-gez v2, :cond_3

    .line 1362
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lokio/Segment;->prev:Lokio/Segment;

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    .line 1363
    .local v0, "tail":Lokio/Segment;
    :goto_1
    if-eqz v0, :cond_2

    iget-boolean v1, v0, Lokio/Segment;->owner:Z

    if-eqz v1, :cond_2

    iget v1, v0, Lokio/Segment;->limit:I

    int-to-long v1, v1

    add-long/2addr v1, p2

    iget-boolean v3, v0, Lokio/Segment;->shared:Z

    if-eqz v3, :cond_1

    .line 1364
    const/4 v3, 0x0

    goto :goto_2

    :cond_1
    iget v3, v0, Lokio/Segment;->pos:I

    :goto_2
    int-to-long v3, v3

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x2000

    cmp-long v5, v1, v3

    if-gtz v5, :cond_2

    .line 1366
    iget-object v1, p1, Lokio/Buffer;->head:Lokio/Segment;

    long-to-int v2, p2

    invoke-virtual {v1, v0, v2}, Lokio/Segment;->writeTo(Lokio/Segment;I)V

    .line 1367
    iget-wide v1, p1, Lokio/Buffer;->size:J

    sub-long/2addr v1, p2

    iput-wide v1, p1, Lokio/Buffer;->size:J

    .line 1368
    iget-wide v1, p0, Lokio/Buffer;->size:J

    add-long/2addr v1, p2

    iput-wide v1, p0, Lokio/Buffer;->size:J

    .line 1369
    return-void

    .line 1373
    :cond_2
    iget-object v1, p1, Lokio/Buffer;->head:Lokio/Segment;

    long-to-int v2, p2

    invoke-virtual {v1, v2}, Lokio/Segment;->split(I)Lokio/Segment;

    move-result-object v1

    iput-object v1, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 1378
    .end local v0    # "tail":Lokio/Segment;
    :cond_3
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 1379
    .local v0, "segmentToMove":Lokio/Segment;
    iget v1, v0, Lokio/Segment;->limit:I

    iget v2, v0, Lokio/Segment;->pos:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    .line 1380
    .local v1, "movedByteCount":J
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v3

    iput-object v3, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 1381
    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v3, :cond_4

    .line 1382
    iput-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 1383
    iput-object v0, v0, Lokio/Segment;->prev:Lokio/Segment;

    iput-object v0, v0, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_3

    .line 1385
    :cond_4
    iget-object v3, v3, Lokio/Segment;->prev:Lokio/Segment;

    .line 1386
    .local v3, "tail":Lokio/Segment;
    invoke-virtual {v3, v0}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    move-result-object v3

    .line 1387
    invoke-virtual {v3}, Lokio/Segment;->compact()V

    .line 1389
    .end local v3    # "tail":Lokio/Segment;
    :goto_3
    iget-wide v3, p1, Lokio/Buffer;->size:J

    sub-long/2addr v3, v1

    iput-wide v3, p1, Lokio/Buffer;->size:J

    .line 1390
    iget-wide v3, p0, Lokio/Buffer;->size:J

    add-long/2addr v3, v1

    iput-wide v3, p0, Lokio/Buffer;->size:J

    .line 1391
    sub-long/2addr p2, v1

    .line 1392
    .end local v0    # "segmentToMove":Lokio/Segment;
    .end local v1    # "movedByteCount":J
    goto :goto_0

    .line 1393
    :cond_5
    return-void

    .line 1356
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == this"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1355
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw v0

    :goto_5
    goto :goto_4
.end method

.method public writeAll(Lokio/Source;)J
    .locals 9
    .param p1, "source"    # Lokio/Source;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1133
    if-eqz p1, :cond_1

    .line 1134
    const-wide/16 v0, 0x0

    .line 1135
    .local v0, "totalBytesRead":J
    :goto_0
    const-wide/16 v2, 0x2000

    invoke-interface {p1, p0, v2, v3}, Lokio/Source;->read(Lokio/Buffer;J)J

    move-result-wide v2

    move-wide v4, v2

    .local v4, "readCount":J
    const-wide/16 v6, -0x1

    cmp-long v8, v2, v6

    if-eqz v8, :cond_0

    .line 1136
    add-long/2addr v0, v4

    goto :goto_0

    .line 1138
    .end local v4    # "readCount":J
    :cond_0
    return-wide v0

    .line 1133
    .end local v0    # "totalBytesRead":J
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public writeByte(I)Lokio/Buffer;
    .locals 5
    .param p1, "b"    # I

    .line 1151
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v0

    .line 1152
    .local v0, "tail":Lokio/Segment;
    iget-object v1, v0, Lokio/Segment;->data:[B

    iget v2, v0, Lokio/Segment;->limit:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lokio/Segment;->limit:I

    int-to-byte v3, p1

    aput-byte v3, v1, v2

    .line 1153
    iget-wide v1, p0, Lokio/Buffer;->size:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lokio/Buffer;->size:J

    .line 1154
    return-object p0
.end method

.method public bridge synthetic writeByte(I)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeDecimalLong(J)Lokio/Buffer;
    .locals 11
    .param p1, "v"    # J

    .line 1211
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    .line 1213
    const/16 v0, 0x30

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    move-result-object v0

    return-object v0

    .line 1216
    :cond_0
    const/4 v2, 0x0

    .line 1217
    .local v2, "negative":Z
    cmp-long v3, p1, v0

    if-gez v3, :cond_2

    .line 1218
    neg-long p1, p1

    .line 1219
    cmp-long v3, p1, v0

    if-gez v3, :cond_1

    .line 1220
    const-string v0, "-9223372036854775808"

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    move-result-object v0

    return-object v0

    .line 1222
    :cond_1
    const/4 v2, 0x1

    .line 1226
    :cond_2
    const-wide/32 v3, 0x5f5e100

    const-wide/16 v5, 0xa

    cmp-long v7, p1, v3

    if-gez v7, :cond_a

    .line 1229
    const-wide/16 v3, 0x2710

    cmp-long v7, p1, v3

    if-gez v7, :cond_6

    .line 1230
    const-wide/16 v3, 0x64

    cmp-long v7, p1, v3

    if-gez v7, :cond_4

    cmp-long v3, p1, v5

    if-gez v3, :cond_3

    const/4 v3, 0x1

    goto/16 :goto_0

    :cond_3
    const/4 v3, 0x2

    goto/16 :goto_0

    .line 1231
    :cond_4
    const-wide/16 v3, 0x3e8

    cmp-long v7, p1, v3

    if-gez v7, :cond_5

    const/4 v3, 0x3

    goto/16 :goto_0

    :cond_5
    const/4 v3, 0x4

    goto/16 :goto_0

    .line 1233
    :cond_6
    const-wide/32 v3, 0xf4240

    cmp-long v7, p1, v3

    if-gez v7, :cond_8

    const-wide/32 v3, 0x186a0

    cmp-long v7, p1, v3

    if-gez v7, :cond_7

    const/4 v3, 0x5

    goto/16 :goto_0

    :cond_7
    const/4 v3, 0x6

    goto/16 :goto_0

    .line 1234
    :cond_8
    const-wide/32 v3, 0x989680

    cmp-long v7, p1, v3

    if-gez v7, :cond_9

    const/4 v3, 0x7

    goto/16 :goto_0

    :cond_9
    const/16 v3, 0x8

    goto/16 :goto_0

    .line 1236
    :cond_a
    const-wide v3, 0xe8d4a51000L

    cmp-long v7, p1, v3

    if-gez v7, :cond_e

    .line 1237
    const-wide v3, 0x2540be400L

    cmp-long v7, p1, v3

    if-gez v7, :cond_c

    const-wide/32 v3, 0x3b9aca00

    cmp-long v7, p1, v3

    if-gez v7, :cond_b

    const/16 v3, 0x9

    goto :goto_0

    :cond_b
    const/16 v3, 0xa

    goto :goto_0

    .line 1238
    :cond_c
    const-wide v3, 0x174876e800L

    cmp-long v7, p1, v3

    if-gez v7, :cond_d

    const/16 v3, 0xb

    goto :goto_0

    :cond_d
    const/16 v3, 0xc

    goto :goto_0

    .line 1240
    :cond_e
    const-wide v3, 0x38d7ea4c68000L

    cmp-long v7, p1, v3

    if-gez v7, :cond_11

    const-wide v3, 0x9184e72a000L

    cmp-long v7, p1, v3

    if-gez v7, :cond_f

    const/16 v3, 0xd

    goto :goto_0

    .line 1241
    :cond_f
    const-wide v3, 0x5af3107a4000L

    cmp-long v7, p1, v3

    if-gez v7, :cond_10

    const/16 v3, 0xe

    goto :goto_0

    :cond_10
    const/16 v3, 0xf

    goto :goto_0

    .line 1243
    :cond_11
    const-wide v3, 0x16345785d8a0000L

    cmp-long v7, p1, v3

    if-gez v7, :cond_13

    const-wide v3, 0x2386f26fc10000L

    cmp-long v7, p1, v3

    if-gez v7, :cond_12

    const/16 v3, 0x10

    goto :goto_0

    :cond_12
    const/16 v3, 0x11

    goto :goto_0

    .line 1244
    :cond_13
    const-wide v3, 0xde0b6b3a7640000L

    cmp-long v7, p1, v3

    if-gez v7, :cond_14

    const/16 v3, 0x12

    goto :goto_0

    :cond_14
    const/16 v3, 0x13

    :goto_0
    nop

    .line 1245
    .local v3, "width":I
    if-eqz v2, :cond_15

    .line 1246
    add-int/lit8 v3, v3, 0x1

    .line 1249
    :cond_15
    invoke-virtual {p0, v3}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v4

    .line 1250
    .local v4, "tail":Lokio/Segment;
    iget-object v7, v4, Lokio/Segment;->data:[B

    .line 1251
    .local v7, "data":[B
    iget v8, v4, Lokio/Segment;->limit:I

    add-int/2addr v8, v3

    .line 1252
    .local v8, "pos":I
    :goto_1
    cmp-long v9, p1, v0

    if-eqz v9, :cond_16

    .line 1253
    rem-long v9, p1, v5

    long-to-int v10, v9

    .line 1254
    .local v10, "digit":I
    add-int/lit8 v8, v8, -0x1

    sget-object v9, Lokio/Buffer;->DIGITS:[B

    aget-byte v9, v9, v10

    aput-byte v9, v7, v8

    .line 1255
    div-long/2addr p1, v5

    .line 1256
    .end local v10    # "digit":I
    goto :goto_1

    .line 1257
    :cond_16
    if-eqz v2, :cond_17

    .line 1258
    add-int/lit8 v8, v8, -0x1

    const/16 v0, 0x2d

    aput-byte v0, v7, v8

    .line 1261
    :cond_17
    iget v0, v4, Lokio/Segment;->limit:I

    add-int/2addr v0, v3

    iput v0, v4, Lokio/Segment;->limit:I

    .line 1262
    iget-wide v0, p0, Lokio/Buffer;->size:J

    int-to-long v5, v3

    add-long/2addr v0, v5

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 1263
    return-object p0
.end method

.method public bridge synthetic writeDecimalLong(J)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeDecimalLong(J)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeHexadecimalUnsignedLong(J)Lokio/Buffer;
    .locals 9
    .param p1, "v"    # J

    .line 1267
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    .line 1269
    const/16 v0, 0x30

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    move-result-object v0

    return-object v0

    .line 1272
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Long;->highestOneBit(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v0

    const/4 v1, 0x4

    div-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    .line 1274
    .local v0, "width":I
    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v2

    .line 1275
    .local v2, "tail":Lokio/Segment;
    iget-object v3, v2, Lokio/Segment;->data:[B

    .line 1276
    .local v3, "data":[B
    iget v4, v2, Lokio/Segment;->limit:I

    add-int/2addr v4, v0

    add-int/lit8 v4, v4, -0x1

    .local v4, "pos":I
    iget v5, v2, Lokio/Segment;->limit:I

    .local v5, "start":I
    :goto_0
    if-lt v4, v5, :cond_1

    .line 1277
    sget-object v6, Lokio/Buffer;->DIGITS:[B

    const-wide/16 v7, 0xf

    and-long/2addr v7, p1

    long-to-int v8, v7

    aget-byte v6, v6, v8

    aput-byte v6, v3, v4

    .line 1278
    ushr-long/2addr p1, v1

    .line 1276
    add-int/lit8 v4, v4, -0x1

    goto :goto_0

    .line 1280
    .end local v4    # "pos":I
    .end local v5    # "start":I
    :cond_1
    iget v1, v2, Lokio/Segment;->limit:I

    add-int/2addr v1, v0

    iput v1, v2, Lokio/Segment;->limit:I

    .line 1281
    iget-wide v4, p0, Lokio/Buffer;->size:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    iput-wide v4, p0, Lokio/Buffer;->size:J

    .line 1282
    return-object p0
.end method

.method public bridge synthetic writeHexadecimalUnsignedLong(J)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeHexadecimalUnsignedLong(J)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeInt(I)Lokio/Buffer;
    .locals 7
    .param p1, "i"    # I

    .line 1173
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v0

    .line 1174
    .local v0, "tail":Lokio/Segment;
    iget-object v1, v0, Lokio/Segment;->data:[B

    .line 1175
    .local v1, "data":[B
    iget v2, v0, Lokio/Segment;->limit:I

    .line 1176
    .local v2, "limit":I
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "limit":I
    .local v3, "limit":I
    ushr-int/lit8 v4, p1, 0x18

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v1, v2

    .line 1177
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "limit":I
    .restart local v2    # "limit":I
    ushr-int/lit8 v4, p1, 0x10

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v1, v3

    .line 1178
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "limit":I
    .restart local v3    # "limit":I
    ushr-int/lit8 v4, p1, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v1, v2

    .line 1179
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "limit":I
    .restart local v2    # "limit":I
    and-int/lit16 v4, p1, 0xff

    int-to-byte v4, v4

    aput-byte v4, v1, v3

    .line 1180
    iput v2, v0, Lokio/Segment;->limit:I

    .line 1181
    iget-wide v3, p0, Lokio/Buffer;->size:J

    const-wide/16 v5, 0x4

    add-long/2addr v3, v5

    iput-wide v3, p0, Lokio/Buffer;->size:J

    .line 1182
    return-object p0
.end method

.method public bridge synthetic writeInt(I)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeIntLe(I)Lokio/Buffer;
    .locals 1
    .param p1, "i"    # I

    .line 1186
    invoke-static {p1}, Lokio/Util;->reverseBytesInt(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeIntLe(I)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeIntLe(I)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeLong(J)Lokio/Buffer;
    .locals 9
    .param p1, "v"    # J

    .line 1190
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v1

    .line 1191
    .local v1, "tail":Lokio/Segment;
    iget-object v2, v1, Lokio/Segment;->data:[B

    .line 1192
    .local v2, "data":[B
    iget v3, v1, Lokio/Segment;->limit:I

    .line 1193
    .local v3, "limit":I
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "limit":I
    .local v4, "limit":I
    const/16 v5, 0x38

    ushr-long v5, p1, v5

    const-wide/16 v7, 0xff

    and-long/2addr v5, v7

    long-to-int v6, v5

    int-to-byte v5, v6

    aput-byte v5, v2, v3

    .line 1194
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "limit":I
    .restart local v3    # "limit":I
    const/16 v5, 0x30

    ushr-long v5, p1, v5

    and-long/2addr v5, v7

    long-to-int v6, v5

    int-to-byte v5, v6

    aput-byte v5, v2, v4

    .line 1195
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "limit":I
    .restart local v4    # "limit":I
    const/16 v5, 0x28

    ushr-long v5, p1, v5

    and-long/2addr v5, v7

    long-to-int v6, v5

    int-to-byte v5, v6

    aput-byte v5, v2, v3

    .line 1196
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "limit":I
    .restart local v3    # "limit":I
    const/16 v5, 0x20

    ushr-long v5, p1, v5

    and-long/2addr v5, v7

    long-to-int v6, v5

    int-to-byte v5, v6

    aput-byte v5, v2, v4

    .line 1197
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "limit":I
    .restart local v4    # "limit":I
    const/16 v5, 0x18

    ushr-long v5, p1, v5

    and-long/2addr v5, v7

    long-to-int v6, v5

    int-to-byte v5, v6

    aput-byte v5, v2, v3

    .line 1198
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "limit":I
    .restart local v3    # "limit":I
    const/16 v5, 0x10

    ushr-long v5, p1, v5

    and-long/2addr v5, v7

    long-to-int v6, v5

    int-to-byte v5, v6

    aput-byte v5, v2, v4

    .line 1199
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "limit":I
    .restart local v4    # "limit":I
    ushr-long v5, p1, v0

    and-long/2addr v5, v7

    long-to-int v0, v5

    int-to-byte v0, v0

    aput-byte v0, v2, v3

    .line 1200
    add-int/lit8 v0, v4, 0x1

    .end local v4    # "limit":I
    .local v0, "limit":I
    and-long v5, p1, v7

    long-to-int v3, v5

    int-to-byte v3, v3

    aput-byte v3, v2, v4

    .line 1201
    iput v0, v1, Lokio/Segment;->limit:I

    .line 1202
    iget-wide v3, p0, Lokio/Buffer;->size:J

    const-wide/16 v5, 0x8

    add-long/2addr v3, v5

    iput-wide v3, p0, Lokio/Buffer;->size:J

    .line 1203
    return-object p0
.end method

.method public bridge synthetic writeLong(J)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeLong(J)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeLongLe(J)Lokio/Buffer;
    .locals 2
    .param p1, "v"    # J

    .line 1207
    invoke-static {p1, p2}, Lokio/Util;->reverseBytesLong(J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->writeLong(J)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeLongLe(J)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeLongLe(J)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeShort(I)Lokio/Buffer;
    .locals 7
    .param p1, "s"    # I

    .line 1158
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v0

    .line 1159
    .local v0, "tail":Lokio/Segment;
    iget-object v1, v0, Lokio/Segment;->data:[B

    .line 1160
    .local v1, "data":[B
    iget v2, v0, Lokio/Segment;->limit:I

    .line 1161
    .local v2, "limit":I
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "limit":I
    .local v3, "limit":I
    ushr-int/lit8 v4, p1, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v1, v2

    .line 1162
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "limit":I
    .restart local v2    # "limit":I
    and-int/lit16 v4, p1, 0xff

    int-to-byte v4, v4

    aput-byte v4, v1, v3

    .line 1163
    iput v2, v0, Lokio/Segment;->limit:I

    .line 1164
    iget-wide v3, p0, Lokio/Buffer;->size:J

    const-wide/16 v5, 0x2

    add-long/2addr v3, v5

    iput-wide v3, p0, Lokio/Buffer;->size:J

    .line 1165
    return-object p0
.end method

.method public bridge synthetic writeShort(I)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeShort(I)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeShortLe(I)Lokio/Buffer;
    .locals 1
    .param p1, "s"    # I

    .line 1169
    int-to-short v0, p1

    invoke-static {v0}, Lokio/Util;->reverseBytesShort(S)S

    move-result v0

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeShort(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeShortLe(I)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeShortLe(I)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/Buffer;
    .locals 3
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "beginIndex"    # I
    .param p3, "endIndex"    # I
    .param p4, "charset"    # Ljava/nio/charset/Charset;

    .line 1074
    if-eqz p1, :cond_5

    .line 1075
    if-ltz p2, :cond_4

    .line 1076
    if-lt p3, p2, :cond_3

    .line 1079
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt p3, v0, :cond_2

    .line 1083
    if-eqz p4, :cond_1

    .line 1084
    sget-object v0, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p4, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2, p3}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    move-result-object v0

    return-object v0

    .line 1085
    :cond_0
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 1086
    .local v0, "data":[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-virtual {p0, v0, v1, v2}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object v1

    return-object v1

    .line 1083
    .end local v0    # "data":[B
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "charset == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1080
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "endIndex > string.length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " > "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1081
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1077
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "endIndex < beginIndex: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " < "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1075
    :cond_4
    new-instance v0, Ljava/lang/IllegalAccessError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "beginIndex < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1074
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "string == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/Buffer;
    .locals 2
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .line 1069
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0, p2}, Lokio/Buffer;->writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1, p2, p3, p4}, Lokio/Buffer;->writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public final writeTo(Ljava/io/OutputStream;)Lokio/Buffer;
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    iget-wide v0, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->writeTo(Ljava/io/OutputStream;J)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public final writeTo(Ljava/io/OutputStream;J)Lokio/Buffer;
    .locals 7
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 210
    if-eqz p1, :cond_2

    .line 211
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 213
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 214
    .local v0, "s":Lokio/Segment;
    :goto_0
    const-wide/16 v1, 0x0

    cmp-long v3, p2, v1

    if-lez v3, :cond_1

    .line 215
    iget v1, v0, Lokio/Segment;->limit:I

    iget v2, v0, Lokio/Segment;->pos:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v2, v1

    .line 216
    .local v2, "toCopy":I
    iget-object v1, v0, Lokio/Segment;->data:[B

    iget v3, v0, Lokio/Segment;->pos:I

    invoke-virtual {p1, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 218
    iget v1, v0, Lokio/Segment;->pos:I

    add-int/2addr v1, v2

    iput v1, v0, Lokio/Segment;->pos:I

    .line 219
    iget-wide v3, p0, Lokio/Buffer;->size:J

    int-to-long v5, v2

    sub-long/2addr v3, v5

    iput-wide v3, p0, Lokio/Buffer;->size:J

    .line 220
    int-to-long v3, v2

    sub-long/2addr p2, v3

    .line 222
    iget v1, v0, Lokio/Segment;->pos:I

    iget v3, v0, Lokio/Segment;->limit:I

    if-ne v1, v3, :cond_0

    .line 223
    move-object v1, v0

    .line 224
    .local v1, "toRecycle":Lokio/Segment;
    invoke-virtual {v1}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v3

    move-object v0, v3

    iput-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 225
    invoke-static {v1}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 227
    .end local v1    # "toRecycle":Lokio/Segment;
    .end local v2    # "toCopy":I
    :cond_0
    goto :goto_0

    .line 229
    :cond_1
    return-object p0

    .line 210
    .end local v0    # "s":Lokio/Segment;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "out == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public writeUtf8(Ljava/lang/String;)Lokio/Buffer;
    .locals 2
    .param p1, "string"    # Ljava/lang/String;

    .line 953
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeUtf8(Ljava/lang/String;II)Lokio/Buffer;
    .locals 12
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "beginIndex"    # I
    .param p3, "endIndex"    # I

    .line 957
    if-eqz p1, :cond_d

    .line 958
    if-ltz p2, :cond_c

    .line 959
    if-lt p3, p2, :cond_b

    .line 962
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt p3, v0, :cond_a

    .line 968
    move v0, p2

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_9

    .line 969
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 971
    .local v1, "c":I
    const/16 v2, 0x80

    if-ge v1, v2, :cond_2

    .line 972
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v3

    .line 973
    .local v3, "tail":Lokio/Segment;
    iget-object v4, v3, Lokio/Segment;->data:[B

    .line 974
    .local v4, "data":[B
    iget v5, v3, Lokio/Segment;->limit:I

    sub-int/2addr v5, v0

    .line 975
    .local v5, "segmentOffset":I
    rsub-int v6, v5, 0x2000

    invoke-static {p3, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 978
    .local v6, "runLimit":I
    add-int/lit8 v7, v0, 0x1

    .end local v0    # "i":I
    .local v7, "i":I
    add-int/2addr v0, v5

    int-to-byte v8, v1

    aput-byte v8, v4, v0

    .line 982
    :goto_1
    if-ge v7, v6, :cond_1

    .line 983
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 984
    if-lt v1, v2, :cond_0

    goto :goto_2

    .line 985
    :cond_0
    add-int/lit8 v0, v7, 0x1

    .end local v7    # "i":I
    .restart local v0    # "i":I
    add-int/2addr v7, v5

    int-to-byte v8, v1

    aput-byte v8, v4, v7

    move v7, v0

    goto :goto_1

    .line 988
    .end local v0    # "i":I
    .restart local v7    # "i":I
    :cond_1
    :goto_2
    add-int v0, v7, v5

    iget v2, v3, Lokio/Segment;->limit:I

    sub-int/2addr v0, v2

    .line 989
    .local v0, "runSize":I
    iget v2, v3, Lokio/Segment;->limit:I

    add-int/2addr v2, v0

    iput v2, v3, Lokio/Segment;->limit:I

    .line 990
    iget-wide v8, p0, Lokio/Buffer;->size:J

    int-to-long v10, v0

    add-long/2addr v8, v10

    iput-wide v8, p0, Lokio/Buffer;->size:J

    .line 992
    .end local v0    # "runSize":I
    .end local v3    # "tail":Lokio/Segment;
    .end local v4    # "data":[B
    .end local v5    # "segmentOffset":I
    .end local v6    # "runLimit":I
    move v0, v7

    goto/16 :goto_6

    .end local v7    # "i":I
    .local v0, "i":I
    :cond_2
    const/16 v3, 0x800

    if-ge v1, v3, :cond_3

    .line 994
    shr-int/lit8 v3, v1, 0x6

    or-int/lit16 v3, v3, 0xc0

    invoke-virtual {p0, v3}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 995
    and-int/lit8 v3, v1, 0x3f

    or-int/2addr v2, v3

    invoke-virtual {p0, v2}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 996
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_6

    .line 998
    :cond_3
    const v3, 0xd800

    const/16 v4, 0x3f

    if-lt v1, v3, :cond_8

    const v3, 0xdfff

    if-le v1, v3, :cond_4

    goto :goto_5

    .line 1008
    :cond_4
    add-int/lit8 v5, v0, 0x1

    if-ge v5, p3, :cond_5

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    goto :goto_3

    :cond_5
    const/4 v5, 0x0

    .line 1009
    .local v5, "low":I
    :goto_3
    const v6, 0xdbff

    if-gt v1, v6, :cond_7

    const v6, 0xdc00

    if-lt v5, v6, :cond_7

    if-le v5, v3, :cond_6

    goto :goto_4

    .line 1018
    :cond_6
    const/high16 v3, 0x10000

    const v6, -0xd801

    and-int/2addr v6, v1

    shl-int/lit8 v6, v6, 0xa

    const v7, -0xdc01

    and-int/2addr v7, v5

    or-int/2addr v6, v7

    add-int/2addr v6, v3

    .line 1021
    .local v6, "codePoint":I
    shr-int/lit8 v3, v6, 0x12

    or-int/lit16 v3, v3, 0xf0

    invoke-virtual {p0, v3}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1022
    shr-int/lit8 v3, v6, 0xc

    and-int/2addr v3, v4

    or-int/2addr v3, v2

    invoke-virtual {p0, v3}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1023
    shr-int/lit8 v3, v6, 0x6

    and-int/2addr v3, v4

    or-int/2addr v3, v2

    invoke-virtual {p0, v3}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1024
    and-int/lit8 v3, v6, 0x3f

    or-int/2addr v2, v3

    invoke-virtual {p0, v2}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1025
    add-int/lit8 v0, v0, 0x2

    goto :goto_6

    .line 1010
    .end local v6    # "codePoint":I
    :cond_7
    :goto_4
    invoke-virtual {p0, v4}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1011
    add-int/lit8 v0, v0, 0x1

    .line 1012
    goto/16 :goto_0

    .line 1000
    .end local v5    # "low":I
    :cond_8
    :goto_5
    shr-int/lit8 v3, v1, 0xc

    or-int/lit16 v3, v3, 0xe0

    invoke-virtual {p0, v3}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1001
    shr-int/lit8 v3, v1, 0x6

    and-int/2addr v3, v4

    or-int/2addr v3, v2

    invoke-virtual {p0, v3}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1002
    and-int/lit8 v3, v1, 0x3f

    or-int/2addr v2, v3

    invoke-virtual {p0, v2}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1003
    add-int/lit8 v0, v0, 0x1

    .line 1027
    .end local v1    # "c":I
    :goto_6
    goto/16 :goto_0

    .line 1029
    .end local v0    # "i":I
    :cond_9
    return-object p0

    .line 963
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "endIndex > string.length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " > "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 964
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 960
    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "endIndex < beginIndex: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " < "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 958
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "beginIndex < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 957
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "string == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_8

    :goto_7
    throw v0

    :goto_8
    goto :goto_7
.end method

.method public bridge synthetic writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic writeUtf8(Ljava/lang/String;II)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1, p2, p3}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeUtf8CodePoint(I)Lokio/Buffer;
    .locals 3
    .param p1, "codePoint"    # I

    .line 1033
    const/16 v0, 0x80

    if-ge p1, v0, :cond_0

    .line 1035
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    goto :goto_0

    .line 1037
    :cond_0
    const/16 v1, 0x800

    if-ge p1, v1, :cond_1

    .line 1039
    shr-int/lit8 v1, p1, 0x6

    or-int/lit16 v1, v1, 0xc0

    invoke-virtual {p0, v1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1040
    and-int/lit8 v1, p1, 0x3f

    or-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    goto :goto_0

    .line 1042
    :cond_1
    const/high16 v1, 0x10000

    const/16 v2, 0x3f

    if-ge p1, v1, :cond_3

    .line 1043
    const v1, 0xd800

    if-lt p1, v1, :cond_2

    const v1, 0xdfff

    if-gt p1, v1, :cond_2

    .line 1045
    invoke-virtual {p0, v2}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    goto :goto_0

    .line 1048
    :cond_2
    shr-int/lit8 v1, p1, 0xc

    or-int/lit16 v1, v1, 0xe0

    invoke-virtual {p0, v1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1049
    shr-int/lit8 v1, p1, 0x6

    and-int/2addr v1, v2

    or-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1050
    and-int/lit8 v1, p1, 0x3f

    or-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    goto :goto_0

    .line 1053
    :cond_3
    const v1, 0x10ffff

    if-gt p1, v1, :cond_4

    .line 1055
    shr-int/lit8 v1, p1, 0x12

    or-int/lit16 v1, v1, 0xf0

    invoke-virtual {p0, v1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1056
    shr-int/lit8 v1, p1, 0xc

    and-int/2addr v1, v2

    or-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1057
    shr-int/lit8 v1, p1, 0x6

    and-int/2addr v1, v2

    or-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1058
    and-int/lit8 v1, p1, 0x3f

    or-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1065
    :goto_0
    return-object p0

    .line 1061
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected code point: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1062
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic writeUtf8CodePoint(I)Lokio/BufferedSink;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeUtf8CodePoint(I)Lokio/Buffer;

    move-result-object p1

    return-object p1
.end method
