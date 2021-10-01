.class public Lokio/ByteString;
.super Ljava/lang/Object;
.source "ByteString.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Comparable<",
        "Lokio/ByteString;",
        ">;"
    }
.end annotation


# static fields
.field public static final EMPTY:Lokio/ByteString;

.field static final HEX_DIGITS:[C

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field final data:[B

.field transient hashCode:I

.field transient utf8:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 53
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lokio/ByteString;->HEX_DIGITS:[C

    .line 58
    const/4 v0, 0x0

    new-array v0, v0, [B

    invoke-static {v0}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    return-void

    nop

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method constructor <init>([B)V
    .locals 0
    .param p1, "data"    # [B

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lokio/ByteString;->data:[B

    .line 66
    return-void
.end method

.method static codePointIndexToCharIndex(Ljava/lang/String;I)I
    .locals 5
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "codePointCount"    # I

    .line 513
    const/4 v0, 0x0

    .local v0, "i":I
    const/4 v1, 0x0

    .local v1, "j":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .local v2, "length":I
    :goto_0
    if-ge v0, v2, :cond_4

    .line 514
    if-ne v1, p1, :cond_0

    .line 515
    return v0

    .line 517
    :cond_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    .line 518
    .local v3, "c":I
    invoke-static {v3}, Ljava/lang/Character;->isISOControl(I)Z

    move-result v4

    if-eqz v4, :cond_1

    const/16 v4, 0xa

    if-eq v3, v4, :cond_1

    const/16 v4, 0xd

    if-ne v3, v4, :cond_2

    :cond_1
    const v4, 0xfffd

    if-ne v3, v4, :cond_3

    .line 520
    :cond_2
    const/4 v4, -0x1

    return v4

    .line 522
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 513
    invoke-static {v3}, Ljava/lang/Character;->charCount(I)I

    move-result v4

    add-int/2addr v0, v4

    goto :goto_0

    .line 524
    .end local v0    # "i":I
    .end local v1    # "j":I
    .end local v2    # "length":I
    .end local v3    # "c":I
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method

.method public static decodeBase64(Ljava/lang/String;)Lokio/ByteString;
    .locals 2
    .param p0, "base64"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 202
    if-eqz p0, :cond_1

    .line 203
    invoke-static {p0}, Lokio/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    .line 204
    .local v0, "decoded":[B
    if-eqz v0, :cond_0

    new-instance v1, Lokio/ByteString;

    invoke-direct {v1, v0}, Lokio/ByteString;-><init>([B)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1

    .line 202
    .end local v0    # "decoded":[B
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "base64 == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static decodeHex(Ljava/lang/String;)Lokio/ByteString;
    .locals 5
    .param p0, "hex"    # Ljava/lang/String;

    .line 220
    if-eqz p0, :cond_2

    .line 221
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_1

    .line 223
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    .line 224
    .local v0, "result":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 225
    mul-int/lit8 v2, v1, 0x2

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lokio/ByteString;->decodeHexDigit(C)I

    move-result v2

    shl-int/lit8 v2, v2, 0x4

    .line 226
    .local v2, "d1":I
    mul-int/lit8 v3, v1, 0x2

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lokio/ByteString;->decodeHexDigit(C)I

    move-result v3

    .line 227
    .local v3, "d2":I
    add-int v4, v2, v3

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 224
    .end local v2    # "d1":I
    .end local v3    # "d2":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 229
    .end local v1    # "i":I
    :cond_0
    invoke-static {v0}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v1

    return-object v1

    .line 221
    .end local v0    # "result":[B
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected hex string: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 220
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "hex == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method private static decodeHexDigit(C)I
    .locals 3
    .param p0, "c"    # C

    .line 233
    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    add-int/lit8 v0, p0, -0x30

    return v0

    .line 234
    :cond_0
    const/16 v0, 0x61

    if-lt p0, v0, :cond_1

    const/16 v0, 0x66

    if-gt p0, v0, :cond_1

    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    return v0

    .line 235
    :cond_1
    const/16 v0, 0x41

    if-lt p0, v0, :cond_2

    const/16 v0, 0x46

    if-gt p0, v0, :cond_2

    add-int/lit8 v0, p0, -0x41

    add-int/lit8 v0, v0, 0xa

    return v0

    .line 236
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected hex digit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private digest(Ljava/lang/String;)Lokio/ByteString;
    .locals 2
    .param p1, "algorithm"    # Ljava/lang/String;

    .line 156
    :try_start_0
    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    iget-object v1, p0, Lokio/ByteString;->data:[B

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    invoke-static {v0}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public static encodeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/ByteString;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .line 107
    if-eqz p0, :cond_1

    .line 108
    if-eqz p1, :cond_0

    .line 109
    new-instance v0, Lokio/ByteString;

    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lokio/ByteString;-><init>([B)V

    return-object v0

    .line 108
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "charset == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 107
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "s == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static encodeUtf8(Ljava/lang/String;)Lokio/ByteString;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .line 99
    if-eqz p0, :cond_0

    .line 100
    new-instance v0, Lokio/ByteString;

    sget-object v1, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lokio/ByteString;-><init>([B)V

    .line 101
    .local v0, "byteString":Lokio/ByteString;
    iput-object p0, v0, Lokio/ByteString;->utf8:Ljava/lang/String;

    .line 102
    return-object v0

    .line 99
    .end local v0    # "byteString":Lokio/ByteString;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "s == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private hmac(Ljava/lang/String;Lokio/ByteString;)Lokio/ByteString;
    .locals 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "key"    # Lokio/ByteString;

    .line 179
    :try_start_0
    invoke-static {p1}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v0

    .line 180
    .local v0, "mac":Ljavax/crypto/Mac;
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {p2}, Lokio/ByteString;->toByteArray()[B

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 181
    iget-object v1, p0, Lokio/ByteString;->data:[B

    invoke-virtual {v0, v1}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object v1

    invoke-static {v1}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v1
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 184
    .end local v0    # "mac":Ljavax/crypto/Mac;
    :catch_0
    move-exception v0

    .line 185
    .local v0, "e":Ljava/security/InvalidKeyException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 182
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    :catch_1
    move-exception v0

    .line 183
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public static of(Ljava/nio/ByteBuffer;)Lokio/ByteString;
    .locals 2
    .param p0, "data"    # Ljava/nio/ByteBuffer;

    .line 90
    if-eqz p0, :cond_0

    .line 92
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    new-array v0, v0, [B

    .line 93
    .local v0, "copy":[B
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 94
    new-instance v1, Lokio/ByteString;

    invoke-direct {v1, v0}, Lokio/ByteString;-><init>([B)V

    return-object v1

    .line 90
    .end local v0    # "copy":[B
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "data == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static varargs of([B)Lokio/ByteString;
    .locals 2
    .param p0, "data"    # [B

    .line 72
    if-eqz p0, :cond_0

    .line 73
    new-instance v0, Lokio/ByteString;

    invoke-virtual {p0}, [B->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    invoke-direct {v0, v1}, Lokio/ByteString;-><init>([B)V

    return-object v0

    .line 72
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "data == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static of([BII)Lokio/ByteString;
    .locals 7
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "byteCount"    # I

    .line 81
    if-eqz p0, :cond_0

    .line 82
    array-length v0, p0

    int-to-long v1, v0

    int-to-long v3, p1

    int-to-long v5, p2

    invoke-static/range {v1 .. v6}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 84
    new-array v0, p2, [B

    .line 85
    .local v0, "copy":[B
    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 86
    new-instance v1, Lokio/ByteString;

    invoke-direct {v1, v0}, Lokio/ByteString;-><init>([B)V

    return-object v1

    .line 81
    .end local v0    # "copy":[B
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "data == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static read(Ljava/io/InputStream;I)Lokio/ByteString;
    .locals 4
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 246
    if-eqz p0, :cond_3

    .line 247
    if-ltz p1, :cond_2

    .line 249
    new-array v0, p1, [B

    .line 250
    .local v0, "result":[B
    const/4 v1, 0x0

    .local v1, "offset":I
    :goto_0
    if-ge v1, p1, :cond_1

    .line 251
    sub-int v2, p1, v1

    invoke-virtual {p0, v0, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 252
    .local v2, "read":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 250
    add-int/2addr v1, v2

    goto :goto_0

    .line 252
    :cond_0
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 254
    .end local v1    # "offset":I
    .end local v2    # "read":I
    :cond_1
    new-instance v1, Lokio/ByteString;

    invoke-direct {v1, v0}, Lokio/ByteString;-><init>([B)V

    return-object v1

    .line 247
    .end local v0    # "result":[B
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "byteCount < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 246
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "in == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 4
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 528
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    .line 529
    .local v0, "dataLength":I
    invoke-static {p1, v0}, Lokio/ByteString;->read(Ljava/io/InputStream;I)Lokio/ByteString;

    move-result-object v1

    .line 531
    .local v1, "byteString":Lokio/ByteString;
    :try_start_0
    const-class v2, Lokio/ByteString;

    const-string v3, "data"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 532
    .local v2, "field":Ljava/lang/reflect/Field;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 533
    iget-object v3, v1, Lokio/ByteString;->data:[B

    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 538
    .end local v2    # "field":Ljava/lang/reflect/Field;
    nop

    .line 539
    return-void

    .line 536
    :catch_0
    move-exception v2

    .line 537
    .local v2, "e":Ljava/lang/IllegalAccessException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 534
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v2

    .line 535
    .local v2, "e":Ljava/lang/NoSuchFieldException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 542
    iget-object v0, p0, Lokio/ByteString;->data:[B

    array-length v0, v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 543
    iget-object v0, p0, Lokio/ByteString;->data:[B

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->write([B)V

    .line 544
    return-void
.end method


# virtual methods
.method public asByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .line 366
    iget-object v0, p0, Lokio/ByteString;->data:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public base64()Ljava/lang/String;
    .locals 1

    .line 131
    iget-object v0, p0, Lokio/ByteString;->data:[B

    invoke-static {v0}, Lokio/Base64;->encode([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public base64Url()Ljava/lang/String;
    .locals 1

    .line 194
    iget-object v0, p0, Lokio/ByteString;->data:[B

    invoke-static {v0}, Lokio/Base64;->encodeUrl([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 52
    check-cast p1, Lokio/ByteString;

    invoke-virtual {p0, p1}, Lokio/ByteString;->compareTo(Lokio/ByteString;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lokio/ByteString;)I
    .locals 8
    .param p1, "byteString"    # Lokio/ByteString;

    .line 473
    invoke-virtual {p0}, Lokio/ByteString;->size()I

    move-result v0

    .line 474
    .local v0, "sizeA":I
    invoke-virtual {p1}, Lokio/ByteString;->size()I

    move-result v1

    .line 475
    .local v1, "sizeB":I
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v3

    .local v3, "size":I
    :goto_0
    const/4 v4, -0x1

    const/4 v5, 0x1

    if-ge v2, v3, :cond_2

    .line 476
    invoke-virtual {p0, v2}, Lokio/ByteString;->getByte(I)B

    move-result v6

    and-int/lit16 v6, v6, 0xff

    .line 477
    .local v6, "byteA":I
    invoke-virtual {p1, v2}, Lokio/ByteString;->getByte(I)B

    move-result v7

    and-int/lit16 v7, v7, 0xff

    .line 478
    .local v7, "byteB":I
    if-ne v6, v7, :cond_0

    .line 475
    .end local v6    # "byteA":I
    .end local v7    # "byteB":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 479
    .restart local v6    # "byteA":I
    .restart local v7    # "byteB":I
    :cond_0
    if-ge v6, v7, :cond_1

    goto :goto_1

    :cond_1
    const/4 v4, 0x1

    :goto_1
    return v4

    .line 481
    .end local v2    # "i":I
    .end local v3    # "size":I
    .end local v6    # "byteA":I
    .end local v7    # "byteB":I
    :cond_2
    if-ne v0, v1, :cond_3

    const/4 v2, 0x0

    return v2

    .line 482
    :cond_3
    if-ge v0, v1, :cond_4

    goto :goto_2

    :cond_4
    const/4 v4, 0x1

    :goto_2
    return v4
.end method

.method public final endsWith(Lokio/ByteString;)Z
    .locals 3
    .param p1, "suffix"    # Lokio/ByteString;

    .line 409
    invoke-virtual {p0}, Lokio/ByteString;->size()I

    move-result v0

    invoke-virtual {p1}, Lokio/ByteString;->size()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Lokio/ByteString;->size()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, p1, v2, v1}, Lokio/ByteString;->rangeEquals(ILokio/ByteString;II)Z

    move-result v0

    return v0
.end method

.method public final endsWith([B)Z
    .locals 3
    .param p1, "suffix"    # [B

    .line 413
    invoke-virtual {p0}, Lokio/ByteString;->size()I

    move-result v0

    array-length v1, p1

    sub-int/2addr v0, v1

    array-length v1, p1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, p1, v2, v1}, Lokio/ByteString;->rangeEquals(I[BII)Z

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 461
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 462
    :cond_0
    instance-of v1, p1, Lokio/ByteString;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    move-object v1, p1

    check-cast v1, Lokio/ByteString;

    .line 463
    invoke-virtual {v1}, Lokio/ByteString;->size()I

    move-result v1

    iget-object v3, p0, Lokio/ByteString;->data:[B

    array-length v4, v3

    if-ne v1, v4, :cond_1

    move-object v1, p1

    check-cast v1, Lokio/ByteString;

    array-length v4, v3

    .line 464
    invoke-virtual {v1, v2, v3, v2, v4}, Lokio/ByteString;->rangeEquals(I[BII)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 462
    :goto_0
    return v0
.end method

.method public getByte(I)B
    .locals 1
    .param p1, "pos"    # I

    .line 340
    iget-object v0, p0, Lokio/ByteString;->data:[B

    aget-byte v0, v0, p1

    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 468
    iget v0, p0, Lokio/ByteString;->hashCode:I

    .line 469
    .local v0, "result":I
    if-eqz v0, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lokio/ByteString;->data:[B

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([B)I

    move-result v1

    iput v1, p0, Lokio/ByteString;->hashCode:I

    :goto_0
    return v1
.end method

.method public hex()Ljava/lang/String;
    .locals 9

    .line 209
    iget-object v0, p0, Lokio/ByteString;->data:[B

    array-length v1, v0

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [C

    .line 210
    .local v1, "result":[C
    const/4 v2, 0x0

    .line 211
    .local v2, "c":I
    array-length v3, v0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_0

    aget-byte v5, v0, v4

    .line 212
    .local v5, "b":B
    add-int/lit8 v6, v2, 0x1

    .end local v2    # "c":I
    .local v6, "c":I
    sget-object v7, Lokio/ByteString;->HEX_DIGITS:[C

    shr-int/lit8 v8, v5, 0x4

    and-int/lit8 v8, v8, 0xf

    aget-char v8, v7, v8

    aput-char v8, v1, v2

    .line 213
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "c":I
    .restart local v2    # "c":I
    and-int/lit8 v8, v5, 0xf

    aget-char v7, v7, v8

    aput-char v7, v1, v6

    .line 211
    .end local v5    # "b":B
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 215
    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method

.method public hmacSha1(Lokio/ByteString;)Lokio/ByteString;
    .locals 1
    .param p1, "key"    # Lokio/ByteString;

    .line 164
    const-string v0, "HmacSHA1"

    invoke-direct {p0, v0, p1}, Lokio/ByteString;->hmac(Ljava/lang/String;Lokio/ByteString;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public hmacSha256(Lokio/ByteString;)Lokio/ByteString;
    .locals 1
    .param p1, "key"    # Lokio/ByteString;

    .line 169
    const-string v0, "HmacSHA256"

    invoke-direct {p0, v0, p1}, Lokio/ByteString;->hmac(Ljava/lang/String;Lokio/ByteString;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public hmacSha512(Lokio/ByteString;)Lokio/ByteString;
    .locals 1
    .param p1, "key"    # Lokio/ByteString;

    .line 174
    const-string v0, "HmacSHA512"

    invoke-direct {p0, v0, p1}, Lokio/ByteString;->hmac(Ljava/lang/String;Lokio/ByteString;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final indexOf(Lokio/ByteString;)I
    .locals 2
    .param p1, "other"    # Lokio/ByteString;

    .line 417
    invoke-virtual {p1}, Lokio/ByteString;->internalArray()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lokio/ByteString;->indexOf([BI)I

    move-result v0

    return v0
.end method

.method public final indexOf(Lokio/ByteString;I)I
    .locals 1
    .param p1, "other"    # Lokio/ByteString;
    .param p2, "fromIndex"    # I

    .line 421
    invoke-virtual {p1}, Lokio/ByteString;->internalArray()[B

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lokio/ByteString;->indexOf([BI)I

    move-result v0

    return v0
.end method

.method public final indexOf([B)I
    .locals 1
    .param p1, "other"    # [B

    .line 425
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lokio/ByteString;->indexOf([BI)I

    move-result v0

    return v0
.end method

.method public indexOf([BI)I
    .locals 5
    .param p1, "other"    # [B
    .param p2, "fromIndex"    # I

    .line 429
    const/4 v0, 0x0

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 430
    move v1, p2

    .local v1, "i":I
    iget-object v2, p0, Lokio/ByteString;->data:[B

    array-length v2, v2

    array-length v3, p1

    sub-int/2addr v2, v3

    .local v2, "limit":I
    :goto_0
    if-gt v1, v2, :cond_1

    .line 431
    iget-object v3, p0, Lokio/ByteString;->data:[B

    array-length v4, p1

    invoke-static {v3, v1, p1, v0, v4}, Lokio/Util;->arrayRangeEquals([BI[BII)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 432
    return v1

    .line 430
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 435
    .end local v1    # "i":I
    .end local v2    # "limit":I
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method internalArray()[B
    .locals 1

    .line 359
    iget-object v0, p0, Lokio/ByteString;->data:[B

    return-object v0
.end method

.method public final lastIndexOf(Lokio/ByteString;)I
    .locals 2
    .param p1, "other"    # Lokio/ByteString;

    .line 439
    invoke-virtual {p1}, Lokio/ByteString;->internalArray()[B

    move-result-object v0

    invoke-virtual {p0}, Lokio/ByteString;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lokio/ByteString;->lastIndexOf([BI)I

    move-result v0

    return v0
.end method

.method public final lastIndexOf(Lokio/ByteString;I)I
    .locals 1
    .param p1, "other"    # Lokio/ByteString;
    .param p2, "fromIndex"    # I

    .line 443
    invoke-virtual {p1}, Lokio/ByteString;->internalArray()[B

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lokio/ByteString;->lastIndexOf([BI)I

    move-result v0

    return v0
.end method

.method public final lastIndexOf([B)I
    .locals 1
    .param p1, "other"    # [B

    .line 447
    invoke-virtual {p0}, Lokio/ByteString;->size()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lokio/ByteString;->lastIndexOf([BI)I

    move-result v0

    return v0
.end method

.method public lastIndexOf([BI)I
    .locals 4
    .param p1, "other"    # [B
    .param p2, "fromIndex"    # I

    .line 451
    iget-object v0, p0, Lokio/ByteString;->data:[B

    array-length v0, v0

    array-length v1, p1

    sub-int/2addr v0, v1

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 452
    move v0, p2

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 453
    iget-object v1, p0, Lokio/ByteString;->data:[B

    const/4 v2, 0x0

    array-length v3, p1

    invoke-static {v1, v0, p1, v2, v3}, Lokio/Util;->arrayRangeEquals([BI[BII)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 454
    return v0

    .line 452
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 457
    .end local v0    # "i":I
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public md5()Lokio/ByteString;
    .locals 1

    .line 136
    const-string v0, "MD5"

    invoke-direct {p0, v0}, Lokio/ByteString;->digest(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public rangeEquals(ILokio/ByteString;II)Z
    .locals 1
    .param p1, "offset"    # I
    .param p2, "other"    # Lokio/ByteString;
    .param p3, "otherOffset"    # I
    .param p4, "byteCount"    # I

    .line 386
    iget-object v0, p0, Lokio/ByteString;->data:[B

    invoke-virtual {p2, p3, v0, p1, p4}, Lokio/ByteString;->rangeEquals(I[BII)Z

    move-result v0

    return v0
.end method

.method public rangeEquals(I[BII)Z
    .locals 2
    .param p1, "offset"    # I
    .param p2, "other"    # [B
    .param p3, "otherOffset"    # I
    .param p4, "byteCount"    # I

    .line 395
    if-ltz p1, :cond_0

    iget-object v0, p0, Lokio/ByteString;->data:[B

    array-length v1, v0

    sub-int/2addr v1, p4

    if-gt p1, v1, :cond_0

    if-ltz p3, :cond_0

    array-length v1, p2

    sub-int/2addr v1, p4

    if-gt p3, v1, :cond_0

    .line 397
    invoke-static {v0, p1, p2, p3, p4}, Lokio/Util;->arrayRangeEquals([BI[BII)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 395
    :goto_0
    return v0
.end method

.method public sha1()Lokio/ByteString;
    .locals 1

    .line 141
    const-string v0, "SHA-1"

    invoke-direct {p0, v0}, Lokio/ByteString;->digest(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public sha256()Lokio/ByteString;
    .locals 1

    .line 146
    const-string v0, "SHA-256"

    invoke-direct {p0, v0}, Lokio/ByteString;->digest(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public sha512()Lokio/ByteString;
    .locals 1

    .line 151
    const-string v0, "SHA-512"

    invoke-direct {p0, v0}, Lokio/ByteString;->digest(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .line 347
    iget-object v0, p0, Lokio/ByteString;->data:[B

    array-length v0, v0

    return v0
.end method

.method public final startsWith(Lokio/ByteString;)Z
    .locals 2
    .param p1, "prefix"    # Lokio/ByteString;

    .line 401
    invoke-virtual {p1}, Lokio/ByteString;->size()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1, v1, v0}, Lokio/ByteString;->rangeEquals(ILokio/ByteString;II)Z

    move-result v0

    return v0
.end method

.method public final startsWith([B)Z
    .locals 2
    .param p1, "prefix"    # [B

    .line 405
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1, v1, v0}, Lokio/ByteString;->rangeEquals(I[BII)Z

    move-result v0

    return v0
.end method

.method public string(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .line 121
    if-eqz p1, :cond_0

    .line 122
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lokio/ByteString;->data:[B

    invoke-direct {v0, v1, p1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0

    .line 121
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "charset == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public substring(I)Lokio/ByteString;
    .locals 1
    .param p1, "beginIndex"    # I

    .line 312
    iget-object v0, p0, Lokio/ByteString;->data:[B

    array-length v0, v0

    invoke-virtual {p0, p1, v0}, Lokio/ByteString;->substring(II)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public substring(II)Lokio/ByteString;
    .locals 4
    .param p1, "beginIndex"    # I
    .param p2, "endIndex"    # I

    .line 321
    if-ltz p1, :cond_3

    .line 322
    iget-object v0, p0, Lokio/ByteString;->data:[B

    array-length v1, v0

    if-gt p2, v1, :cond_2

    .line 326
    sub-int v1, p2, p1

    .line 327
    .local v1, "subLen":I
    if-ltz v1, :cond_1

    .line 329
    if-nez p1, :cond_0

    array-length v2, v0

    if-ne p2, v2, :cond_0

    .line 330
    return-object p0

    .line 333
    :cond_0
    new-array v2, v1, [B

    .line 334
    .local v2, "copy":[B
    const/4 v3, 0x0

    invoke-static {v0, p1, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 335
    new-instance v0, Lokio/ByteString;

    invoke-direct {v0, v2}, Lokio/ByteString;-><init>([B)V

    return-object v0

    .line 327
    .end local v2    # "copy":[B
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "endIndex < beginIndex"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 323
    .end local v1    # "subLen":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "endIndex > length("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lokio/ByteString;->data:[B

    array-length v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 321
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "beginIndex < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toAsciiLowercase()Lokio/ByteString;
    .locals 7

    .line 264
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lokio/ByteString;->data:[B

    array-length v2, v1

    if-ge v0, v2, :cond_5

    .line 265
    aget-byte v2, v1, v0

    .line 266
    .local v2, "c":B
    const/16 v3, 0x41

    if-lt v2, v3, :cond_4

    const/16 v4, 0x5a

    if-le v2, v4, :cond_0

    goto :goto_3

    .line 270
    :cond_0
    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .line 271
    .local v1, "lowercase":[B
    add-int/lit8 v5, v0, 0x1

    .end local v0    # "i":I
    .local v5, "i":I
    add-int/lit8 v6, v2, 0x20

    int-to-byte v6, v6

    aput-byte v6, v1, v0

    .line 272
    :goto_1
    array-length v0, v1

    if-ge v5, v0, :cond_3

    .line 273
    aget-byte v2, v1, v5

    .line 274
    if-lt v2, v3, :cond_2

    if-le v2, v4, :cond_1

    goto :goto_2

    .line 275
    :cond_1
    add-int/lit8 v0, v2, 0x20

    int-to-byte v0, v0

    aput-byte v0, v1, v5

    .line 272
    :cond_2
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 277
    :cond_3
    new-instance v0, Lokio/ByteString;

    invoke-direct {v0, v1}, Lokio/ByteString;-><init>([B)V

    return-object v0

    .line 264
    .end local v1    # "lowercase":[B
    .end local v2    # "c":B
    .end local v5    # "i":I
    .restart local v0    # "i":I
    :cond_4
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 279
    .end local v0    # "i":I
    :cond_5
    return-object p0
.end method

.method public toAsciiUppercase()Lokio/ByteString;
    .locals 7

    .line 289
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lokio/ByteString;->data:[B

    array-length v2, v1

    if-ge v0, v2, :cond_5

    .line 290
    aget-byte v2, v1, v0

    .line 291
    .local v2, "c":B
    const/16 v3, 0x61

    if-lt v2, v3, :cond_4

    const/16 v4, 0x7a

    if-le v2, v4, :cond_0

    goto :goto_3

    .line 295
    :cond_0
    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .line 296
    .local v1, "lowercase":[B
    add-int/lit8 v5, v0, 0x1

    .end local v0    # "i":I
    .local v5, "i":I
    add-int/lit8 v6, v2, -0x20

    int-to-byte v6, v6

    aput-byte v6, v1, v0

    .line 297
    :goto_1
    array-length v0, v1

    if-ge v5, v0, :cond_3

    .line 298
    aget-byte v2, v1, v5

    .line 299
    if-lt v2, v3, :cond_2

    if-le v2, v4, :cond_1

    goto :goto_2

    .line 300
    :cond_1
    add-int/lit8 v0, v2, -0x20

    int-to-byte v0, v0

    aput-byte v0, v1, v5

    .line 297
    :cond_2
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 302
    :cond_3
    new-instance v0, Lokio/ByteString;

    invoke-direct {v0, v1}, Lokio/ByteString;-><init>([B)V

    return-object v0

    .line 289
    .end local v1    # "lowercase":[B
    .end local v2    # "c":B
    .end local v5    # "i":I
    .restart local v0    # "i":I
    :cond_4
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 304
    .end local v0    # "i":I
    :cond_5
    return-object p0
.end method

.method public toByteArray()[B
    .locals 1

    .line 354
    iget-object v0, p0, Lokio/ByteString;->data:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .line 490
    iget-object v0, p0, Lokio/ByteString;->data:[B

    array-length v0, v0

    if-nez v0, :cond_0

    .line 491
    const-string v0, "[size=0]"

    return-object v0

    .line 494
    :cond_0
    invoke-virtual {p0}, Lokio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v0

    .line 495
    .local v0, "text":Ljava/lang/String;
    const/16 v1, 0x40

    invoke-static {v0, v1}, Lokio/ByteString;->codePointIndexToCharIndex(Ljava/lang/String;I)I

    move-result v2

    .line 497
    .local v2, "i":I
    const/4 v3, -0x1

    const-string v4, "\u2026]"

    const-string v5, "[size="

    const-string v6, "]"

    const/4 v7, 0x0

    if-ne v2, v3, :cond_2

    .line 498
    iget-object v3, p0, Lokio/ByteString;->data:[B

    array-length v3, v3

    if-gt v3, v1, :cond_1

    .line 499
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[hex="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 500
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lokio/ByteString;->data:[B

    array-length v5, v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " hex="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v7, v1}, Lokio/ByteString;->substring(II)Lokio/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 498
    :goto_0
    return-object v1

    .line 503
    :cond_2
    invoke-virtual {v0, v7, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 504
    const-string v3, "\\"

    const-string v7, "\\\\"

    invoke-virtual {v1, v3, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 505
    const-string v3, "\n"

    const-string v7, "\\n"

    invoke-virtual {v1, v3, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 506
    const-string v3, "\r"

    const-string v7, "\\r"

    invoke-virtual {v1, v3, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 507
    .local v1, "safeText":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 508
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lokio/ByteString;->data:[B

    array-length v5, v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " text="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 509
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[text="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 507
    :goto_1
    return-object v3
.end method

.method public utf8()Ljava/lang/String;
    .locals 4

    .line 114
    iget-object v0, p0, Lokio/ByteString;->utf8:Ljava/lang/String;

    .line 116
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lokio/ByteString;->data:[B

    sget-object v3, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    iput-object v1, p0, Lokio/ByteString;->utf8:Ljava/lang/String;

    :goto_0
    return-object v1
.end method

.method public write(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 371
    if-eqz p1, :cond_0

    .line 372
    iget-object v0, p0, Lokio/ByteString;->data:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 373
    return-void

    .line 371
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "out == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method write(Lokio/Buffer;)V
    .locals 3
    .param p1, "buffer"    # Lokio/Buffer;

    .line 377
    iget-object v0, p0, Lokio/ByteString;->data:[B

    array-length v1, v0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    .line 378
    return-void
.end method
