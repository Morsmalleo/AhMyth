.class public final Lokio/HashingSink;
.super Lokio/ForwardingSink;
.source "HashingSink.java"


# instance fields
.field private final mac:Ljavax/crypto/Mac;

.field private final messageDigest:Ljava/security/MessageDigest;


# direct methods
.method private constructor <init>(Lokio/Sink;Ljava/lang/String;)V
    .locals 0

    .line 73
    invoke-direct {p0, p1}, Lokio/ForwardingSink;-><init>(Lokio/Sink;)V

    .line 75
    :try_start_0
    invoke-static {p2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p1

    iput-object p1, p0, Lokio/HashingSink;->messageDigest:Ljava/security/MessageDigest;

    const/4 p1, 0x0

    .line 76
    iput-object p1, p0, Lokio/HashingSink;->mac:Ljavax/crypto/Mac;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 78
    :catch_0
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    throw p1
.end method

.method private constructor <init>(Lokio/Sink;Lokio/ByteString;Ljava/lang/String;)V
    .locals 1

    .line 83
    invoke-direct {p0, p1}, Lokio/ForwardingSink;-><init>(Lokio/Sink;)V

    .line 85
    :try_start_0
    invoke-static {p3}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object p1

    iput-object p1, p0, Lokio/HashingSink;->mac:Ljavax/crypto/Mac;

    .line 86
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {p2}, Lokio/ByteString;->toByteArray()[B

    move-result-object p2

    invoke-direct {v0, p2, p3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {p1, v0}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    const/4 p1, 0x0

    .line 87
    iput-object p1, p0, Lokio/HashingSink;->messageDigest:Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 91
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    .line 89
    :catch_1
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    throw p1
.end method

.method public static hmacSha1(Lokio/Sink;Lokio/ByteString;)Lokio/HashingSink;
    .locals 2

    .line 64
    new-instance v0, Lokio/HashingSink;

    const-string v1, "HmacSHA1"

    invoke-direct {v0, p0, p1, v1}, Lokio/HashingSink;-><init>(Lokio/Sink;Lokio/ByteString;Ljava/lang/String;)V

    return-object v0
.end method

.method public static hmacSha256(Lokio/Sink;Lokio/ByteString;)Lokio/HashingSink;
    .locals 2

    .line 69
    new-instance v0, Lokio/HashingSink;

    const-string v1, "HmacSHA256"

    invoke-direct {v0, p0, p1, v1}, Lokio/HashingSink;-><init>(Lokio/Sink;Lokio/ByteString;Ljava/lang/String;)V

    return-object v0
.end method

.method public static md5(Lokio/Sink;)Lokio/HashingSink;
    .locals 2

    .line 49
    new-instance v0, Lokio/HashingSink;

    const-string v1, "MD5"

    invoke-direct {v0, p0, v1}, Lokio/HashingSink;-><init>(Lokio/Sink;Ljava/lang/String;)V

    return-object v0
.end method

.method public static sha1(Lokio/Sink;)Lokio/HashingSink;
    .locals 2

    .line 54
    new-instance v0, Lokio/HashingSink;

    const-string v1, "SHA-1"

    invoke-direct {v0, p0, v1}, Lokio/HashingSink;-><init>(Lokio/Sink;Ljava/lang/String;)V

    return-object v0
.end method

.method public static sha256(Lokio/Sink;)Lokio/HashingSink;
    .locals 2

    .line 59
    new-instance v0, Lokio/HashingSink;

    const-string v1, "SHA-256"

    invoke-direct {v0, p0, v1}, Lokio/HashingSink;-><init>(Lokio/Sink;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public hash()Lokio/ByteString;
    .locals 1

    .line 121
    iget-object v0, p0, Lokio/HashingSink;->messageDigest:Ljava/security/MessageDigest;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lokio/HashingSink;->mac:Ljavax/crypto/Mac;

    invoke-virtual {v0}, Ljavax/crypto/Mac;->doFinal()[B

    move-result-object v0

    .line 122
    :goto_0
    invoke-static {v0}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public write(Lokio/Buffer;J)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 96
    iget-wide v0, p1, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 100
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    const-wide/16 v1, 0x0

    :goto_0
    cmp-long v3, v1, p2

    if-gez v3, :cond_1

    sub-long v3, p2, v1

    .line 101
    iget v5, v0, Lokio/Segment;->limit:I

    iget v6, v0, Lokio/Segment;->pos:I

    sub-int/2addr v5, v6

    int-to-long v5, v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v4, v3

    .line 102
    iget-object v3, p0, Lokio/HashingSink;->messageDigest:Ljava/security/MessageDigest;

    if-eqz v3, :cond_0

    .line 103
    iget-object v5, v0, Lokio/Segment;->data:[B

    iget v6, v0, Lokio/Segment;->pos:I

    invoke-virtual {v3, v5, v6, v4}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_1

    .line 105
    :cond_0
    iget-object v3, p0, Lokio/HashingSink;->mac:Ljavax/crypto/Mac;

    iget-object v5, v0, Lokio/Segment;->data:[B

    iget v6, v0, Lokio/Segment;->pos:I

    invoke-virtual {v3, v5, v6, v4}, Ljavax/crypto/Mac;->update([BII)V

    :goto_1
    int-to-long v3, v4

    add-long/2addr v1, v3

    .line 100
    iget-object v0, v0, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_0

    .line 111
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lokio/ForwardingSink;->write(Lokio/Buffer;J)V

    return-void
.end method
