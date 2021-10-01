.class public final Lokhttp3/HttpUrl;
.super Ljava/lang/Object;
.source "HttpUrl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/HttpUrl$Builder;
    }
.end annotation


# static fields
.field static final FORM_ENCODE_SET:Ljava/lang/String; = " \"\':;<=>@[]^`{}|/\\?#&!$(),~"

.field static final FRAGMENT_ENCODE_SET:Ljava/lang/String; = ""

.field static final FRAGMENT_ENCODE_SET_URI:Ljava/lang/String; = " \"#<>\\^`{|}"

.field private static final HEX_DIGITS:[C

.field static final PASSWORD_ENCODE_SET:Ljava/lang/String; = " \"\':;<=>@[]^`{}|/\\?#"

.field static final PATH_SEGMENT_ENCODE_SET:Ljava/lang/String; = " \"<>^`{}|/\\?#"

.field static final PATH_SEGMENT_ENCODE_SET_URI:Ljava/lang/String; = "[]"

.field static final QUERY_COMPONENT_ENCODE_SET:Ljava/lang/String; = " !\"#$&\'(),/:;<=>?@[]\\^`{|}~"

.field static final QUERY_COMPONENT_ENCODE_SET_URI:Ljava/lang/String; = "\\^`{|}"

.field static final QUERY_COMPONENT_REENCODE_SET:Ljava/lang/String; = " \"\'<>#&="

.field static final QUERY_ENCODE_SET:Ljava/lang/String; = " \"\'<>#"

.field static final USERNAME_ENCODE_SET:Ljava/lang/String; = " \"\':;<=>@[]^`{}|/\\?#"


# instance fields
.field private final fragment:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final host:Ljava/lang/String;

.field private final password:Ljava/lang/String;

.field private final pathSegments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final port:I

.field private final queryNamesAndValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final scheme:Ljava/lang/String;

.field private final url:Ljava/lang/String;

.field private final username:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 289
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lokhttp3/HttpUrl;->HEX_DIGITS:[C

    return-void

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
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method constructor <init>(Lokhttp3/HttpUrl$Builder;)V
    .locals 4
    .param p1, "builder"    # Lokhttp3/HttpUrl$Builder;

    .line 338
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 339
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    iput-object v0, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    .line 340
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lokhttp3/HttpUrl;->percentDecode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/HttpUrl;->username:Ljava/lang/String;

    .line 341
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    invoke-static {v0, v1}, Lokhttp3/HttpUrl;->percentDecode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/HttpUrl;->password:Ljava/lang/String;

    .line 342
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    iput-object v0, p0, Lokhttp3/HttpUrl;->host:Ljava/lang/String;

    .line 343
    invoke-virtual {p1}, Lokhttp3/HttpUrl$Builder;->effectivePort()I

    move-result v0

    iput v0, p0, Lokhttp3/HttpUrl;->port:I

    .line 344
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-direct {p0, v0, v1}, Lokhttp3/HttpUrl;->percentDecode(Ljava/util/List;Z)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/HttpUrl;->pathSegments:Ljava/util/List;

    .line 345
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 346
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    const/4 v3, 0x1

    invoke-direct {p0, v0, v3}, Lokhttp3/HttpUrl;->percentDecode(Ljava/util/List;Z)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    .line 347
    :cond_0
    move-object v0, v2

    :goto_0
    iput-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    .line 348
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 349
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    invoke-static {v0, v1}, Lokhttp3/HttpUrl;->percentDecode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 350
    :cond_1
    nop

    :goto_1
    iput-object v2, p0, Lokhttp3/HttpUrl;->fragment:Ljava/lang/String;

    .line 351
    invoke-virtual {p1}, Lokhttp3/HttpUrl$Builder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    .line 352
    return-void
.end method

.method static canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 16
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "limit"    # I
    .param p3, "encodeSet"    # Ljava/lang/String;
    .param p4, "alreadyEncoded"    # Z
    .param p5, "strict"    # Z
    .param p6, "plusIsSpace"    # Z
    .param p7, "asciiOnly"    # Z
    .param p8, "charset"    # Ljava/nio/charset/Charset;

    .line 1686
    move-object/from16 v10, p0

    move/from16 v11, p2

    move/from16 v0, p1

    move v12, v0

    .local v12, "i":I
    :goto_0
    if-ge v12, v11, :cond_7

    .line 1687
    invoke-virtual {v10, v12}, Ljava/lang/String;->codePointAt(I)I

    move-result v13

    .line 1688
    .local v13, "codePoint":I
    const/16 v0, 0x20

    if-lt v13, v0, :cond_5

    const/16 v0, 0x7f

    if-eq v13, v0, :cond_5

    const/16 v0, 0x80

    if-lt v13, v0, :cond_1

    if-nez p7, :cond_0

    goto :goto_1

    :cond_0
    move-object/from16 v14, p3

    goto :goto_2

    .line 1691
    :cond_1
    :goto_1
    move-object/from16 v14, p3

    invoke-virtual {v14, v13}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_6

    const/16 v0, 0x25

    if-ne v13, v0, :cond_2

    if-eqz p4, :cond_6

    if-eqz p5, :cond_2

    .line 1692
    invoke-static {v10, v12, v11}, Lokhttp3/HttpUrl;->percentEncoded(Ljava/lang/String;II)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    const/16 v0, 0x2b

    if-ne v13, v0, :cond_4

    if-eqz p6, :cond_4

    :cond_3
    goto :goto_2

    .line 1686
    :cond_4
    invoke-static {v13}, Ljava/lang/Character;->charCount(I)I

    move-result v0

    add-int/2addr v12, v0

    goto :goto_0

    .line 1688
    :cond_5
    move-object/from16 v14, p3

    .line 1695
    :cond_6
    :goto_2
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    move-object v15, v0

    .line 1696
    .local v15, "out":Lokio/Buffer;
    move/from16 v9, p1

    invoke-virtual {v15, v10, v9, v12}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    .line 1697
    move-object/from16 v1, p0

    move v2, v12

    move/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    invoke-static/range {v0 .. v9}, Lokhttp3/HttpUrl;->canonicalize(Lokio/Buffer;Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)V

    .line 1699
    invoke-virtual {v15}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1686
    .end local v13    # "codePoint":I
    .end local v15    # "out":Lokio/Buffer;
    :cond_7
    move-object/from16 v14, p3

    .line 1704
    .end local v12    # "i":I
    invoke-virtual/range {p0 .. p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;
    .locals 9
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "encodeSet"    # Ljava/lang/String;
    .param p2, "alreadyEncoded"    # Z
    .param p3, "strict"    # Z
    .param p4, "plusIsSpace"    # Z
    .param p5, "asciiOnly"    # Z

    .line 1758
    nop

    .line 1759
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 1758
    const/4 v1, 0x0

    const/4 v8, 0x0

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-static/range {v0 .. v8}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 9
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "encodeSet"    # Ljava/lang/String;
    .param p2, "alreadyEncoded"    # Z
    .param p3, "strict"    # Z
    .param p4, "plusIsSpace"    # Z
    .param p5, "asciiOnly"    # Z
    .param p6, "charset"    # Ljava/nio/charset/Charset;

    .line 1751
    nop

    .line 1752
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 1751
    const/4 v1, 0x0

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move-object v8, p6

    invoke-static/range {v0 .. v8}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static canonicalize(Lokio/Buffer;Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)V
    .locals 12
    .param p0, "out"    # Lokio/Buffer;
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "pos"    # I
    .param p3, "limit"    # I
    .param p4, "encodeSet"    # Ljava/lang/String;
    .param p5, "alreadyEncoded"    # Z
    .param p6, "strict"    # Z
    .param p7, "plusIsSpace"    # Z
    .param p8, "asciiOnly"    # Z
    .param p9, "charset"    # Ljava/nio/charset/Charset;

    .line 1710
    move-object v0, p0

    move-object v1, p1

    move v2, p3

    move-object/from16 v3, p9

    const/4 v4, 0x0

    .line 1712
    .local v4, "encodedCharBuffer":Lokio/Buffer;
    move v5, p2

    .local v5, "i":I
    :goto_0
    if-ge v5, v2, :cond_d

    .line 1713
    invoke-virtual {p1, v5}, Ljava/lang/String;->codePointAt(I)I

    move-result v6

    .line 1714
    .local v6, "codePoint":I
    if-eqz p5, :cond_1

    const/16 v7, 0x9

    if-eq v6, v7, :cond_0

    const/16 v7, 0xa

    if-eq v6, v7, :cond_0

    const/16 v7, 0xc

    if-eq v6, v7, :cond_0

    const/16 v7, 0xd

    if-ne v6, v7, :cond_1

    :cond_0
    move-object/from16 v7, p4

    goto/16 :goto_6

    .line 1717
    :cond_1
    const/16 v7, 0x2b

    if-ne v6, v7, :cond_3

    if-eqz p7, :cond_3

    .line 1719
    if-eqz p5, :cond_2

    const-string v7, "+"

    goto :goto_1

    :cond_2
    const-string v7, "%2B"

    :goto_1
    invoke-virtual {p0, v7}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    move-object/from16 v7, p4

    goto/16 :goto_6

    .line 1720
    :cond_3
    const/16 v7, 0x20

    const/16 v8, 0x25

    if-lt v6, v7, :cond_7

    const/16 v7, 0x7f

    if-eq v6, v7, :cond_7

    const/16 v7, 0x80

    if-lt v6, v7, :cond_5

    if-nez p8, :cond_4

    goto :goto_2

    :cond_4
    move-object/from16 v7, p4

    goto :goto_3

    .line 1723
    :cond_5
    :goto_2
    move-object/from16 v7, p4

    invoke-virtual {v7, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    const/4 v10, -0x1

    if-ne v9, v10, :cond_8

    if-ne v6, v8, :cond_6

    if-eqz p5, :cond_8

    if-eqz p6, :cond_6

    .line 1724
    invoke-static {p1, v5, p3}, Lokhttp3/HttpUrl;->percentEncoded(Ljava/lang/String;II)Z

    move-result v9

    if-nez v9, :cond_6

    goto :goto_3

    .line 1744
    :cond_6
    invoke-virtual {p0, v6}, Lokio/Buffer;->writeUtf8CodePoint(I)Lokio/Buffer;

    goto :goto_6

    .line 1720
    :cond_7
    move-object/from16 v7, p4

    .line 1726
    :cond_8
    :goto_3
    if-nez v4, :cond_9

    .line 1727
    new-instance v9, Lokio/Buffer;

    invoke-direct {v9}, Lokio/Buffer;-><init>()V

    move-object v4, v9

    .line 1730
    :cond_9
    if-eqz v3, :cond_b

    sget-object v9, Lokhttp3/internal/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v3, v9}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    goto :goto_4

    .line 1733
    :cond_a
    invoke-static {v6}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    add-int/2addr v9, v5

    invoke-virtual {v4, p1, v5, v9, v3}, Lokio/Buffer;->writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/Buffer;

    goto :goto_5

    .line 1731
    :cond_b
    :goto_4
    invoke-virtual {v4, v6}, Lokio/Buffer;->writeUtf8CodePoint(I)Lokio/Buffer;

    .line 1736
    :goto_5
    invoke-virtual {v4}, Lokio/Buffer;->exhausted()Z

    move-result v9

    if-nez v9, :cond_c

    .line 1737
    invoke-virtual {v4}, Lokio/Buffer;->readByte()B

    move-result v9

    and-int/lit16 v9, v9, 0xff

    .line 1738
    .local v9, "b":I
    invoke-virtual {p0, v8}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1739
    sget-object v10, Lokhttp3/HttpUrl;->HEX_DIGITS:[C

    shr-int/lit8 v11, v9, 0x4

    and-int/lit8 v11, v11, 0xf

    aget-char v11, v10, v11

    invoke-virtual {p0, v11}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1740
    and-int/lit8 v11, v9, 0xf

    aget-char v10, v10, v11

    invoke-virtual {p0, v10}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1741
    .end local v9    # "b":I
    goto :goto_5

    .line 1712
    :cond_c
    :goto_6
    invoke-static {v6}, Ljava/lang/Character;->charCount(I)I

    move-result v8

    add-int/2addr v5, v8

    goto/16 :goto_0

    .end local v6    # "codePoint":I
    :cond_d
    move-object/from16 v7, p4

    .line 1747
    .end local v5    # "i":I
    return-void
.end method

.method public static defaultPort(Ljava/lang/String;)I
    .locals 1
    .param p0, "scheme"    # Ljava/lang/String;

    .line 510
    const-string v0, "http"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 511
    const/16 v0, 0x50

    return v0

    .line 512
    :cond_0
    const-string v0, "https"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 513
    const/16 v0, 0x1bb

    return v0

    .line 515
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public static get(Ljava/lang/String;)Lokhttp3/HttpUrl;
    .locals 2
    .param p0, "url"    # Ljava/lang/String;

    .line 916
    new-instance v0, Lokhttp3/HttpUrl$Builder;

    invoke-direct {v0}, Lokhttp3/HttpUrl$Builder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Lokhttp3/HttpUrl$Builder;->parse(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v0

    return-object v0
.end method

.method public static get(Ljava/net/URI;)Lokhttp3/HttpUrl;
    .locals 1
    .param p0, "uri"    # Ljava/net/URI;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 928
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    return-object v0
.end method

.method public static get(Ljava/net/URL;)Lokhttp3/HttpUrl;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 924
    invoke-virtual {p0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    return-object v0
.end method

.method static namesAndValuesToQueryString(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .locals 5
    .param p0, "out"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 620
    .local p1, "namesAndValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "size":I
    :goto_0
    if-ge v0, v1, :cond_2

    .line 621
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 622
    .local v2, "name":Ljava/lang/String;
    add-int/lit8 v3, v0, 0x1

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 623
    .local v3, "value":Ljava/lang/String;
    if-lez v0, :cond_0

    const/16 v4, 0x26

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 624
    :cond_0
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 625
    if-eqz v3, :cond_1

    .line 626
    const/16 v4, 0x3d

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 627
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 620
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_1
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 630
    .end local v0    # "i":I
    .end local v1    # "size":I
    :cond_2
    return-void
.end method

.method public static parse(Ljava/lang/String;)Lokhttp3/HttpUrl;
    .locals 2
    .param p0, "url"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 904
    :try_start_0
    invoke-static {p0}, Lokhttp3/HttpUrl;->get(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 905
    :catch_0
    move-exception v0

    .line 906
    .local v0, "ignored":Ljava/lang/IllegalArgumentException;
    const/4 v1, 0x0

    return-object v1
.end method

.method static pathSegmentsToString(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .locals 3
    .param p0, "out"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 552
    .local p1, "pathSegments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "size":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 553
    const/16 v2, 0x2f

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 554
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 552
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 556
    .end local v0    # "i":I
    .end local v1    # "size":I
    :cond_0
    return-void
.end method

.method static percentDecode(Ljava/lang/String;IIZ)Ljava/lang/String;
    .locals 4
    .param p0, "encoded"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "limit"    # I
    .param p3, "plusIsSpace"    # Z

    .line 1623
    move v0, p1

    .local v0, "i":I
    :goto_0
    if-ge v0, p2, :cond_2

    .line 1624
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1625
    .local v1, "c":C
    const/16 v2, 0x25

    if-eq v1, v2, :cond_1

    const/16 v2, 0x2b

    if-ne v1, v2, :cond_0

    if-eqz p3, :cond_0

    goto :goto_1

    .line 1623
    .end local v1    # "c":C
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1627
    .restart local v1    # "c":C
    :cond_1
    :goto_1
    new-instance v2, Lokio/Buffer;

    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    .line 1628
    .local v2, "out":Lokio/Buffer;
    invoke-virtual {v2, p0, p1, v0}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    .line 1629
    invoke-static {v2, p0, v0, p2, p3}, Lokhttp3/HttpUrl;->percentDecode(Lokio/Buffer;Ljava/lang/String;IIZ)V

    .line 1630
    invoke-virtual {v2}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 1635
    .end local v0    # "i":I
    .end local v1    # "c":C
    .end local v2    # "out":Lokio/Buffer;
    :cond_2
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static percentDecode(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2
    .param p0, "encoded"    # Ljava/lang/String;
    .param p1, "plusIsSpace"    # Z

    .line 1609
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, p1}, Lokhttp3/HttpUrl;->percentDecode(Ljava/lang/String;IIZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private percentDecode(Ljava/util/List;Z)Ljava/util/List;
    .locals 5
    .param p2, "plusIsSpace"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1613
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 1614
    .local v0, "size":I
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 1615
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 1616
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1617
    .local v3, "s":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-static {v3, p2}, Lokhttp3/HttpUrl;->percentDecode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    :goto_1
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1615
    .end local v3    # "s":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1619
    .end local v2    # "i":I
    :cond_1
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method static percentDecode(Lokio/Buffer;Ljava/lang/String;IIZ)V
    .locals 5
    .param p0, "out"    # Lokio/Buffer;
    .param p1, "encoded"    # Ljava/lang/String;
    .param p2, "pos"    # I
    .param p3, "limit"    # I
    .param p4, "plusIsSpace"    # Z

    .line 1640
    move v0, p2

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_2

    .line 1641
    invoke-virtual {p1, v0}, Ljava/lang/String;->codePointAt(I)I

    move-result v1

    .line 1642
    .local v1, "codePoint":I
    const/16 v2, 0x25

    if-ne v1, v2, :cond_0

    add-int/lit8 v2, v0, 0x2

    if-ge v2, p3, :cond_0

    .line 1643
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lokhttp3/internal/Util;->decodeHexDigit(C)I

    move-result v2

    .line 1644
    .local v2, "d1":I
    add-int/lit8 v3, v0, 0x2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lokhttp3/internal/Util;->decodeHexDigit(C)I

    move-result v3

    .line 1645
    .local v3, "d2":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_1

    if-eq v3, v4, :cond_1

    .line 1646
    shl-int/lit8 v4, v2, 0x4

    add-int/2addr v4, v3

    invoke-virtual {p0, v4}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1647
    add-int/lit8 v0, v0, 0x2

    .line 1648
    goto :goto_1

    .line 1650
    .end local v2    # "d1":I
    .end local v3    # "d2":I
    :cond_0
    const/16 v2, 0x2b

    if-ne v1, v2, :cond_1

    if-eqz p4, :cond_1

    .line 1651
    const/16 v2, 0x20

    invoke-virtual {p0, v2}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1652
    goto :goto_1

    .line 1650
    :cond_1
    nop

    .line 1654
    invoke-virtual {p0, v1}, Lokio/Buffer;->writeUtf8CodePoint(I)Lokio/Buffer;

    .line 1640
    :goto_1
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_0

    .line 1656
    .end local v0    # "i":I
    .end local v1    # "codePoint":I
    :cond_2
    return-void
.end method

.method static percentEncoded(Ljava/lang/String;II)Z
    .locals 2
    .param p0, "encoded"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "limit"    # I

    .line 1659
    add-int/lit8 v0, p1, 0x2

    if-ge v0, p2, :cond_0

    .line 1660
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x25

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x1

    .line 1661
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lokhttp3/internal/Util;->decodeHexDigit(C)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x2

    .line 1662
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lokhttp3/internal/Util;->decodeHexDigit(C)I

    move-result v0

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1659
    :goto_0
    return v0
.end method

.method static queryStringToNamesAndValues(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p0, "encodedQuery"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 639
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 640
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "pos":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-gt v1, v2, :cond_3

    .line 641
    const/16 v2, 0x26

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 642
    .local v2, "ampersandOffset":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 644
    :cond_0
    const/16 v4, 0x3d

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 645
    .local v4, "equalsOffset":I
    if-eq v4, v3, :cond_2

    if-le v4, v2, :cond_1

    goto :goto_1

    .line 649
    :cond_1
    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 650
    add-int/lit8 v3, v4, 0x1

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 646
    :cond_2
    :goto_1
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 647
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 652
    :goto_2
    add-int/lit8 v1, v2, 0x1

    .line 653
    .end local v2    # "ampersandOffset":I
    .end local v4    # "equalsOffset":I
    goto :goto_0

    .line 654
    .end local v1    # "pos":I
    :cond_3
    return-object v0
.end method


# virtual methods
.method public encodedFragment()Ljava/lang/String;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 828
    iget-object v0, p0, Lokhttp3/HttpUrl;->fragment:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 829
    :cond_0
    iget-object v0, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 830
    .local v0, "fragmentStart":I
    iget-object v1, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public encodedPassword()Ljava/lang/String;
    .locals 3

    .line 445
    iget-object v0, p0, Lokhttp3/HttpUrl;->password:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    return-object v0

    .line 446
    :cond_0
    iget-object v0, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    const/16 v1, 0x3a

    iget-object v2, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x3

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 447
    .local v0, "passwordStart":I
    iget-object v1, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    const/16 v2, 0x40

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 448
    .local v1, "passwordEnd":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public encodedPath()Ljava/lang/String;
    .locals 4

    .line 546
    iget-object v0, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    iget-object v1, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x3

    const/16 v2, 0x2f

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 547
    .local v0, "pathStart":I
    iget-object v1, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const-string v3, "?#"

    invoke-static {v1, v0, v2, v3}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IILjava/lang/String;)I

    move-result v1

    .line 548
    .local v1, "pathEnd":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public encodedPathSegments()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 570
    iget-object v0, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    iget-object v1, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x3

    const/16 v2, 0x2f

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 571
    .local v0, "pathStart":I
    iget-object v1, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const-string v4, "?#"

    invoke-static {v1, v0, v3, v4}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IILjava/lang/String;)I

    move-result v1

    .line 572
    .local v1, "pathEnd":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 573
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move v4, v0

    .local v4, "i":I
    :goto_0
    if-ge v4, v1, :cond_0

    .line 574
    add-int/lit8 v4, v4, 0x1

    .line 575
    iget-object v5, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-static {v5, v4, v1, v2}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IIC)I

    move-result v5

    .line 576
    .local v5, "segmentEnd":I
    iget-object v6, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v6, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 577
    move v4, v5

    .line 578
    .end local v5    # "segmentEnd":I
    goto :goto_0

    .line 579
    .end local v4    # "i":I
    :cond_0
    return-object v3
.end method

.method public encodedQuery()Ljava/lang/String;
    .locals 4
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 613
    iget-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 614
    :cond_0
    iget-object v0, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 615
    .local v0, "queryStart":I
    iget-object v1, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x23

    invoke-static {v1, v0, v2, v3}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IIC)I

    move-result v1

    .line 616
    .local v1, "queryEnd":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public encodedUsername()Ljava/lang/String;
    .locals 4

    .line 412
    iget-object v0, p0, Lokhttp3/HttpUrl;->username:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    return-object v0

    .line 413
    :cond_0
    iget-object v0, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x3

    .line 414
    .local v0, "usernameStart":I
    iget-object v1, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const-string v3, ":@"

    invoke-static {v1, v0, v2, v3}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IILjava/lang/String;)I

    move-result v1

    .line 415
    .local v1, "usernameEnd":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "other"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 932
    instance-of v0, p1, Lokhttp3/HttpUrl;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lokhttp3/HttpUrl;

    iget-object v0, v0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    iget-object v1, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public fragment()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 846
    iget-object v0, p0, Lokhttp3/HttpUrl;->fragment:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 936
    iget-object v0, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public host()Ljava/lang/String;
    .locals 1

    .line 486
    iget-object v0, p0, Lokhttp3/HttpUrl;->host:Ljava/lang/String;

    return-object v0
.end method

.method public isHttps()Z
    .locals 2

    .line 397
    iget-object v0, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    const-string v1, "https"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public newBuilder()Lokhttp3/HttpUrl$Builder;
    .locals 3

    .line 872
    new-instance v0, Lokhttp3/HttpUrl$Builder;

    invoke-direct {v0}, Lokhttp3/HttpUrl$Builder;-><init>()V

    .line 873
    .local v0, "result":Lokhttp3/HttpUrl$Builder;
    iget-object v1, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    .line 874
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedUsername()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    .line 875
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedPassword()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    .line 876
    iget-object v1, p0, Lokhttp3/HttpUrl;->host:Ljava/lang/String;

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    .line 878
    iget v1, p0, Lokhttp3/HttpUrl;->port:I

    iget-object v2, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    invoke-static {v2}, Lokhttp3/HttpUrl;->defaultPort(Ljava/lang/String;)I

    move-result v2

    if-eq v1, v2, :cond_0

    iget v1, p0, Lokhttp3/HttpUrl;->port:I

    goto :goto_0

    :cond_0
    const/4 v1, -0x1

    :goto_0
    iput v1, v0, Lokhttp3/HttpUrl$Builder;->port:I

    .line 879
    iget-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 880
    iget-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedPathSegments()Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 881
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedQuery()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/HttpUrl$Builder;->encodedQuery(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    .line 882
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedFragment()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    .line 883
    return-object v0
.end method

.method public newBuilder(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 2
    .param p1, "link"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 892
    :try_start_0
    new-instance v0, Lokhttp3/HttpUrl$Builder;

    invoke-direct {v0}, Lokhttp3/HttpUrl$Builder;-><init>()V

    invoke-virtual {v0, p0, p1}, Lokhttp3/HttpUrl$Builder;->parse(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 893
    :catch_0
    move-exception v0

    .line 894
    .local v0, "ignored":Ljava/lang/IllegalArgumentException;
    const/4 v1, 0x0

    return-object v1
.end method

.method public password()Ljava/lang/String;
    .locals 1

    .line 463
    iget-object v0, p0, Lokhttp3/HttpUrl;->password:Ljava/lang/String;

    return-object v0
.end method

.method public pathSegments()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 594
    iget-object v0, p0, Lokhttp3/HttpUrl;->pathSegments:Ljava/util/List;

    return-object v0
.end method

.method public pathSize()I
    .locals 1

    .line 531
    iget-object v0, p0, Lokhttp3/HttpUrl;->pathSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public port()I
    .locals 1

    .line 502
    iget v0, p0, Lokhttp3/HttpUrl;->port:I

    return v0
.end method

.method public query()Ljava/lang/String;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 673
    iget-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 674
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 675
    .local v0, "result":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-static {v0, v1}, Lokhttp3/HttpUrl;->namesAndValuesToQueryString(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 676
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public queryParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 711
    iget-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 712
    :cond_0
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "size":I
    :goto_0
    if-ge v2, v0, :cond_2

    .line 713
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 714
    iget-object v1, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    add-int/lit8 v3, v2, 0x1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    return-object v1

    .line 712
    :cond_1
    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .line 717
    .end local v0    # "size":I
    .end local v2    # "i":I
    :cond_2
    return-object v1
.end method

.method public queryParameterName(I)Ljava/lang/String;
    .locals 2
    .param p1, "index"    # I

    .line 789
    iget-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 790
    mul-int/lit8 v1, p1, 0x2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 789
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public queryParameterNames()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 734
    iget-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0

    .line 735
    :cond_0
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 736
    .local v0, "result":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "size":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 737
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 736
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 739
    .end local v1    # "i":I
    .end local v2    # "size":I
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public queryParameterValue(I)Ljava/lang/String;
    .locals 2
    .param p1, "index"    # I

    .line 811
    iget-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 812
    mul-int/lit8 v1, p1, 0x2

    add-int/lit8 v1, v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 811
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public queryParameterValues(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 761
    iget-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 762
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 763
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "size":I
    :goto_0
    if-ge v1, v2, :cond_2

    .line 764
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 765
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    add-int/lit8 v4, v1, 0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 763
    :cond_1
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 768
    .end local v1    # "i":I
    .end local v2    # "size":I
    :cond_2
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public querySize()I
    .locals 1

    .line 694
    iget-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public redact()Ljava/lang/String;
    .locals 2

    .line 855
    const-string v0, "/..."

    invoke-virtual {p0, v0}, Lokhttp3/HttpUrl;->newBuilder(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    .line 856
    const-string v1, ""

    invoke-virtual {v0, v1}, Lokhttp3/HttpUrl$Builder;->username(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    .line 857
    invoke-virtual {v0, v1}, Lokhttp3/HttpUrl$Builder;->password(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    .line 858
    invoke-virtual {v0}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v0

    .line 859
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v0

    .line 855
    return-object v0
.end method

.method public resolve(Ljava/lang/String;)Lokhttp3/HttpUrl;
    .locals 2
    .param p1, "link"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 867
    invoke-virtual {p0, p1}, Lokhttp3/HttpUrl;->newBuilder(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    .line 868
    .local v0, "builder":Lokhttp3/HttpUrl$Builder;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public scheme()Ljava/lang/String;
    .locals 1

    .line 393
    iget-object v0, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 940
    iget-object v0, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    return-object v0
.end method

.method public topPrivateDomain()Ljava/lang/String;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 963
    iget-object v0, p0, Lokhttp3/HttpUrl;->host:Ljava/lang/String;

    invoke-static {v0}, Lokhttp3/internal/Util;->verifyAsIpAddress(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 964
    :cond_0
    invoke-static {}, Lokhttp3/internal/publicsuffix/PublicSuffixDatabase;->get()Lokhttp3/internal/publicsuffix/PublicSuffixDatabase;

    move-result-object v0

    iget-object v1, p0, Lokhttp3/HttpUrl;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lokhttp3/internal/publicsuffix/PublicSuffixDatabase;->getEffectiveTldPlusOne(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public uri()Ljava/net/URI;
    .locals 4

    .line 377
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl$Builder;->reencodeForUri()Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl$Builder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 379
    .local v0, "uri":Ljava/lang/String;
    :try_start_0
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 380
    :catch_0
    move-exception v1

    .line 383
    .local v1, "e":Ljava/net/URISyntaxException;
    :try_start_1
    const-string v2, "[\\u0000-\\u001F\\u007F-\\u009F\\p{javaWhitespace}]"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 384
    .local v2, "stripped":Ljava/lang/String;
    invoke-static {v2}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-object v3

    .line 385
    .end local v2    # "stripped":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 386
    .local v2, "e1":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public url()Ljava/net/URL;
    .locals 2

    .line 357
    :try_start_0
    new-instance v0, Ljava/net/URL;

    iget-object v1, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 358
    :catch_0
    move-exception v0

    .line 359
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public username()Ljava/lang/String;
    .locals 1

    .line 430
    iget-object v0, p0, Lokhttp3/HttpUrl;->username:Ljava/lang/String;

    return-object v0
.end method
