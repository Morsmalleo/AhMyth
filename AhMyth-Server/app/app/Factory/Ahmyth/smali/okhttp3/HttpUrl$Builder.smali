.class public final Lokhttp3/HttpUrl$Builder;
.super Ljava/lang/Object;
.source "HttpUrl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/HttpUrl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/HttpUrl$Builder$ParseResult;
    }
.end annotation


# instance fields
.field encodedFragment:Ljava/lang/String;

.field encodedPassword:Ljava/lang/String;

.field final encodedPathSegments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field encodedQueryNamesAndValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field encodedUsername:Ljava/lang/String;

.field host:Ljava/lang/String;

.field port:I

.field scheme:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 958
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 950
    iput-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    .line 951
    iput-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    const/4 v1, -0x1

    .line 953
    iput v1, p0, Lokhttp3/HttpUrl$Builder;->port:I

    .line 954
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    .line 959
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addPathSegments(Ljava/lang/String;Z)Lokhttp3/HttpUrl$Builder;
    .locals 8

    const/4 v0, 0x0

    const/4 v3, 0x0

    .line 1061
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const-string v2, "/\\"

    invoke-static {p1, v3, v1, v2}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IILjava/lang/String;)I

    move-result v7

    .line 1062
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v7, v1, :cond_1

    const/4 v1, 0x1

    const/4 v5, 0x1

    goto :goto_0

    :cond_1
    const/4 v5, 0x0

    :goto_0
    move-object v1, p0

    move-object v2, p1

    move v4, v7

    move v6, p2

    .line 1063
    invoke-direct/range {v1 .. v6}, Lokhttp3/HttpUrl$Builder;->push(Ljava/lang/String;IIZZ)V

    add-int/lit8 v3, v7, 0x1

    .line 1065
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-le v3, v1, :cond_0

    return-object p0
.end method

.method private static canonicalizeHost(Ljava/lang/String;II)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 1557
    invoke-static {p0, p1, p2, v0}, Lokhttp3/HttpUrl;->percentDecode(Ljava/lang/String;IIZ)Ljava/lang/String;

    move-result-object p0

    const-string p1, ":"

    .line 1560
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "["

    .line 1562
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "]"

    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1563
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    const/4 p2, 0x1

    sub-int/2addr p1, p2

    invoke-static {p0, p2, p1}, Lokhttp3/HttpUrl$Builder;->decodeIpv6(Ljava/lang/String;II)Ljava/net/InetAddress;

    move-result-object p0

    goto :goto_0

    .line 1564
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    invoke-static {p0, v0, p1}, Lokhttp3/HttpUrl$Builder;->decodeIpv6(Ljava/lang/String;II)Ljava/net/InetAddress;

    move-result-object p0

    :goto_0
    if-nez p0, :cond_1

    const/4 p0, 0x0

    return-object p0

    .line 1566
    :cond_1
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object p0

    .line 1567
    array-length p1, p0

    const/16 p2, 0x10

    if-ne p1, p2, :cond_2

    invoke-static {p0}, Lokhttp3/HttpUrl$Builder;->inet6AddressToAscii([B)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1568
    :cond_2
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0

    .line 1571
    :cond_3
    invoke-static {p0}, Lokhttp3/internal/Util;->domainToAscii(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static decodeIpv4Suffix(Ljava/lang/String;II[BI)Z
    .locals 7

    move v0, p4

    :goto_0
    const/4 v1, 0x0

    if-ge p1, p2, :cond_8

    .line 1651
    array-length v2, p3

    if-ne v0, v2, :cond_0

    return v1

    :cond_0
    if-eq v0, p4, :cond_2

    .line 1655
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2e

    if-eq v2, v3, :cond_1

    return v1

    :cond_1
    add-int/lit8 p1, p1, 0x1

    :cond_2
    move v2, p1

    const/4 v3, 0x0

    :goto_1
    if-ge v2, p2, :cond_6

    .line 1663
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x30

    if-lt v4, v5, :cond_6

    const/16 v6, 0x39

    if-le v4, v6, :cond_3

    goto :goto_2

    :cond_3
    if-nez v3, :cond_4

    if-eq p1, v2, :cond_4

    return v1

    :cond_4
    mul-int/lit8 v3, v3, 0xa

    add-int/2addr v3, v4

    sub-int/2addr v3, v5

    const/16 v4, 0xff

    if-le v3, v4, :cond_5

    return v1

    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_6
    :goto_2
    sub-int p1, v2, p1

    if-nez p1, :cond_7

    return v1

    :cond_7
    add-int/lit8 p1, v0, 0x1

    int-to-byte v1, v3

    .line 1673
    aput-byte v1, p3, v0

    move v0, p1

    move p1, v2

    goto :goto_0

    :cond_8
    add-int/lit8 p4, p4, 0x4

    if-eq v0, p4, :cond_9

    return v1

    :cond_9
    const/4 p0, 0x1

    return p0
.end method

.method private static decodeIpv6(Ljava/lang/String;II)Ljava/net/InetAddress;
    .locals 11

    const/16 v0, 0x10

    new-array v1, v0, [B

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v6, -0x1

    :goto_0
    const/4 v7, 0x0

    if-ge p1, p2, :cond_c

    if-ne v4, v0, :cond_0

    return-object v7

    :cond_0
    add-int/lit8 v8, p1, 0x2

    if-gt v8, p2, :cond_3

    const-string v9, "::"

    const/4 v10, 0x2

    .line 1585
    invoke-virtual {p0, p1, v9, v3, v10}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v9

    if-eqz v9, :cond_3

    if-eq v5, v2, :cond_1

    return-object v7

    :cond_1
    add-int/lit8 v4, v4, 0x2

    move v5, v4

    if-ne v8, p2, :cond_2

    goto :goto_6

    :cond_2
    move v6, v8

    goto :goto_2

    :cond_3
    if-eqz v4, :cond_7

    const-string v8, ":"

    const/4 v9, 0x1

    .line 1594
    invoke-virtual {p0, p1, v8, v3, v9}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v8

    if-eqz v8, :cond_4

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_4
    const-string v8, "."

    .line 1596
    invoke-virtual {p0, p1, v8, v3, v9}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result p1

    if-eqz p1, :cond_6

    add-int/lit8 p1, v4, -0x2

    .line 1598
    invoke-static {p0, v6, p2, v1, p1}, Lokhttp3/HttpUrl$Builder;->decodeIpv4Suffix(Ljava/lang/String;II[BI)Z

    move-result p0

    if-nez p0, :cond_5

    return-object v7

    :cond_5
    add-int/lit8 v4, v4, 0x2

    goto :goto_6

    :cond_6
    return-object v7

    :cond_7
    :goto_1
    move v6, p1

    :goto_2
    move p1, v6

    const/4 v8, 0x0

    :goto_3
    if-ge p1, p2, :cond_9

    .line 1610
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 1611
    invoke-static {v9}, Lokhttp3/HttpUrl;->decodeHexDigit(C)I

    move-result v9

    if-ne v9, v2, :cond_8

    goto :goto_4

    :cond_8
    shl-int/lit8 v8, v8, 0x4

    add-int/2addr v8, v9

    add-int/lit8 p1, p1, 0x1

    goto :goto_3

    :cond_9
    :goto_4
    sub-int v9, p1, v6

    if-eqz v9, :cond_b

    const/4 v10, 0x4

    if-le v9, v10, :cond_a

    goto :goto_5

    :cond_a
    add-int/lit8 v7, v4, 0x1

    ushr-int/lit8 v9, v8, 0x8

    and-int/lit16 v9, v9, 0xff

    int-to-byte v9, v9

    .line 1619
    aput-byte v9, v1, v4

    add-int/lit8 v4, v7, 0x1

    and-int/lit16 v8, v8, 0xff

    int-to-byte v8, v8

    .line 1620
    aput-byte v8, v1, v7

    goto :goto_0

    :cond_b
    :goto_5
    return-object v7

    :cond_c
    :goto_6
    if-eq v4, v0, :cond_e

    if-ne v5, v2, :cond_d

    return-object v7

    :cond_d
    sub-int p0, v4, v5

    rsub-int/lit8 p1, p0, 0x10

    .line 1634
    invoke-static {v1, v5, v1, p1, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sub-int/2addr v0, v4

    add-int/2addr v0, v5

    .line 1635
    invoke-static {v1, v5, v0, v3}, Ljava/util/Arrays;->fill([BIIB)V

    .line 1639
    :cond_e
    :try_start_0
    invoke-static {v1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object p0
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 1641
    :catch_0
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    goto :goto_8

    :goto_7
    throw p0

    :goto_8
    goto :goto_7
.end method

.method private static inet6AddressToAscii([B)Ljava/lang/String;
    .locals 8

    const/4 v0, 0x0

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 1684
    :goto_0
    array-length v4, p0

    const/16 v5, 0x10

    if-ge v2, v4, :cond_2

    move v4, v2

    :goto_1
    if-ge v4, v5, :cond_0

    .line 1686
    aget-byte v6, p0, v4

    if-nez v6, :cond_0

    add-int/lit8 v6, v4, 0x1

    aget-byte v6, p0, v6

    if-nez v6, :cond_0

    add-int/lit8 v4, v4, 0x2

    goto :goto_1

    :cond_0
    sub-int v5, v4, v2

    if-le v5, v3, :cond_1

    move v1, v2

    move v3, v5

    :cond_1
    add-int/lit8 v2, v4, 0x2

    goto :goto_0

    .line 1697
    :cond_2
    new-instance v2, Lokio/Buffer;

    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    .line 1698
    :cond_3
    :goto_2
    array-length v4, p0

    if-ge v0, v4, :cond_6

    const/16 v4, 0x3a

    if-ne v0, v1, :cond_4

    .line 1700
    invoke-virtual {v2, v4}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    add-int/2addr v0, v3

    if-ne v0, v5, :cond_3

    .line 1702
    invoke-virtual {v2, v4}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    goto :goto_2

    :cond_4
    if-lez v0, :cond_5

    .line 1704
    invoke-virtual {v2, v4}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1705
    :cond_5
    aget-byte v4, p0, v0

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    add-int/lit8 v6, v0, 0x1

    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    or-int/2addr v4, v6

    int-to-long v6, v4

    .line 1706
    invoke-virtual {v2, v6, v7}, Lokio/Buffer;->writeHexadecimalUnsignedLong(J)Lokio/Buffer;

    add-int/lit8 v0, v0, 0x2

    goto :goto_2

    .line 1710
    :cond_6
    invoke-virtual {v2}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private isDot(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "."

    .line 1462
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "%2e"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private isDotDot(Ljava/lang/String;)Z
    .locals 1

    const-string v0, ".."

    .line 1466
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "%2e."

    .line 1467
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ".%2e"

    .line 1468
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "%2e%2e"

    .line 1469
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private static parsePort(Ljava/lang/String;II)I
    .locals 9

    const/4 v0, -0x1

    :try_start_0
    const-string v4, ""

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object v1, p0

    move v2, p1

    move v3, p2

    .line 1716
    invoke-static/range {v1 .. v8}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p0

    .line 1717
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    if-lez p0, :cond_0

    const p1, 0xffff

    if-gt p0, p1, :cond_0

    return p0

    :catch_0
    :cond_0
    return v0
.end method

.method private pop()V
    .locals 3

    .line 1483
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1486
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_0

    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1487
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v2, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1489
    :cond_0
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method

.method private static portColonOffset(Ljava/lang/String;II)I
    .locals 2

    :goto_0
    if-ge p1, p2, :cond_3

    .line 1541
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x3a

    if-eq v0, v1, :cond_2

    const/16 v1, 0x5b

    if-eq v0, v1, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    if-ge p1, p2, :cond_1

    .line 1544
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5d

    if-ne v0, v1, :cond_0

    :cond_1
    :goto_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_2
    return p1

    :cond_3
    return p2
.end method

.method private push(Ljava/lang/String;IIZZ)V
    .locals 8

    const-string v3, " \"<>^`{}|/\\?#"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v0, p1

    move v1, p2

    move v2, p3

    move v4, p5

    .line 1442
    invoke-static/range {v0 .. v7}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p1

    .line 1444
    invoke-direct {p0, p1}, Lokhttp3/HttpUrl$Builder;->isDot(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    return-void

    .line 1447
    :cond_0
    invoke-direct {p0, p1}, Lokhttp3/HttpUrl$Builder;->isDotDot(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 1448
    invoke-direct {p0}, Lokhttp3/HttpUrl$Builder;->pop()V

    return-void

    .line 1451
    :cond_1
    iget-object p2, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 1452
    iget-object p2, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    invoke-interface {p2, p3, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1454
    :cond_2
    iget-object p2, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    if-eqz p4, :cond_3

    .line 1457
    iget-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    const-string p2, ""

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    return-void
.end method

.method private removeAllCanonicalQueryParameters(Ljava/lang/String;)V
    .locals 3

    .line 1180
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    :goto_0
    if-ltz v0, :cond_1

    .line 1181
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1182
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    add-int/lit8 v2, v0, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1183
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1184
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x0

    .line 1185
    iput-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    return-void

    :cond_0
    add-int/lit8 v0, v0, -0x2

    goto :goto_0

    :cond_1
    return-void
.end method

.method private resolvePath(Ljava/lang/String;II)V
    .locals 10

    if-ne p2, p3, :cond_0

    return-void

    .line 1418
    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    const-string v2, ""

    const/4 v3, 0x1

    if-eq v0, v1, :cond_2

    const/16 v1, 0x5c

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 1426
    :cond_1
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, v3

    invoke-interface {v0, v1, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 1421
    :cond_2
    :goto_0
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1422
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_3
    :goto_1
    move v6, p2

    if-ge v6, p3, :cond_5

    const-string p2, "/\\"

    .line 1431
    invoke-static {p1, v6, p3, p2}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IILjava/lang/String;)I

    move-result p2

    if-ge p2, p3, :cond_4

    const/4 v0, 0x1

    goto :goto_2

    :cond_4
    const/4 v0, 0x0

    :goto_2
    const/4 v9, 0x1

    move-object v4, p0

    move-object v5, p1

    move v7, p2

    move v8, v0

    .line 1433
    invoke-direct/range {v4 .. v9}, Lokhttp3/HttpUrl$Builder;->push(Ljava/lang/String;IIZZ)V

    if-eqz v0, :cond_3

    :goto_3
    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_5
    return-void
.end method

.method private static schemeDelimiterOffset(Ljava/lang/String;II)I
    .locals 7

    sub-int v0, p2, p1

    const/4 v1, -0x1

    const/4 v2, 0x2

    if-ge v0, v2, :cond_0

    return v1

    .line 1500
    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x5a

    const/16 v3, 0x7a

    const/16 v4, 0x41

    const/16 v5, 0x61

    if-lt v0, v5, :cond_1

    if-le v0, v3, :cond_2

    :cond_1
    if-lt v0, v4, :cond_7

    if-le v0, v2, :cond_2

    goto :goto_1

    :cond_2
    :goto_0
    add-int/lit8 p1, p1, 0x1

    if-ge p1, p2, :cond_7

    .line 1504
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-lt v0, v5, :cond_3

    if-le v0, v3, :cond_2

    :cond_3
    if-lt v0, v4, :cond_4

    if-le v0, v2, :cond_2

    :cond_4
    const/16 v6, 0x30

    if-lt v0, v6, :cond_5

    const/16 v6, 0x39

    if-le v0, v6, :cond_2

    :cond_5
    const/16 v6, 0x2b

    if-eq v0, v6, :cond_2

    const/16 v6, 0x2d

    if-eq v0, v6, :cond_2

    const/16 v6, 0x2e

    if-ne v0, v6, :cond_6

    goto :goto_0

    :cond_6
    const/16 p0, 0x3a

    if-ne v0, p0, :cond_7

    return p1

    :cond_7
    :goto_1
    return v1
.end method

.method private static slashCount(Ljava/lang/String;II)I
    .locals 3

    const/4 v0, 0x0

    :goto_0
    if-ge p1, p2, :cond_1

    .line 1527
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x5c

    if-eq v1, v2, :cond_0

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method


# virtual methods
.method public addEncodedPathSegment(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 6

    if-eqz p1, :cond_0

    const/4 v2, 0x0

    .line 1042
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lokhttp3/HttpUrl$Builder;->push(Ljava/lang/String;IIZZ)V

    return-object p0

    .line 1040
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "encodedPathSegment == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addEncodedPathSegments(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    .line 1055
    invoke-direct {p0, p1, v0}, Lokhttp3/HttpUrl$Builder;->addPathSegments(Ljava/lang/String;Z)Lokhttp3/HttpUrl$Builder;

    move-result-object p1

    return-object p1

    .line 1053
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "encodedPathSegments == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addEncodedQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 7

    if-eqz p1, :cond_2

    .line 1141
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    .line 1142
    :cond_0
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x1

    const-string v2, " \"\'<>#&="

    move-object v1, p1

    .line 1143
    invoke-static/range {v1 .. v6}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p1

    .line 1142
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1144
    iget-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-eqz p2, :cond_1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x1

    const-string v1, " \"\'<>#&="

    move-object v0, p2

    .line 1145
    invoke-static/range {v0 .. v5}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    .line 1144
    :goto_0
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0

    .line 1140
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "encodedName == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addPathSegment(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 6

    if-eqz p1, :cond_0

    const/4 v2, 0x0

    .line 1025
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lokhttp3/HttpUrl$Builder;->push(Ljava/lang/String;IIZZ)V

    return-object p0

    .line 1024
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "pathSegment == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addPathSegments(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 1035
    invoke-direct {p0, p1, v0}, Lokhttp3/HttpUrl$Builder;->addPathSegments(Ljava/lang/String;Z)Lokhttp3/HttpUrl$Builder;

    move-result-object p1

    return-object p1

    .line 1034
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "pathSegments == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 7

    if-eqz p1, :cond_2

    .line 1129
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    .line 1130
    :cond_0
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x1

    const-string v2, " \"\'<>#&="

    move-object v1, p1

    .line 1131
    invoke-static/range {v1 .. v6}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p1

    .line 1130
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1132
    iget-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-eqz p2, :cond_1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x1

    const-string v1, " \"\'<>#&="

    move-object v0, p2

    .line 1133
    invoke-static/range {v0 .. v5}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    .line 1132
    :goto_0
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0

    .line 1128
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "name == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public build()Lokhttp3/HttpUrl;
    .locals 2

    .line 1233
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 1234
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1235
    new-instance v0, Lokhttp3/HttpUrl;

    invoke-direct {v0, p0}, Lokhttp3/HttpUrl;-><init>(Lokhttp3/HttpUrl$Builder;)V

    return-object v0

    .line 1234
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "host == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1233
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "scheme == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method effectivePort()I
    .locals 2

    .line 1020
    iget v0, p0, Lokhttp3/HttpUrl$Builder;->port:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    invoke-static {v0}, Lokhttp3/HttpUrl;->defaultPort(Ljava/lang/String;)I

    move-result v0

    :goto_0
    return v0
.end method

.method public encodedFragment(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 6

    if-eqz p1, :cond_0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v1, ""

    move-object v0, p1

    .line 1201
    invoke-static/range {v0 .. v5}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    return-object p0
.end method

.method public encodedPassword(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 6

    if-eqz p1, :cond_0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const-string v1, " \"\':;<=>@[]^`{}|/\\?#"

    move-object v0, p1

    .line 996
    invoke-static/range {v0 .. v5}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    return-object p0

    .line 995
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "encodedPassword == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public encodedPath(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 3

    if-eqz p1, :cond_1

    const-string v0, "/"

    .line 1103
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 1106
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Lokhttp3/HttpUrl$Builder;->resolvePath(Ljava/lang/String;II)V

    return-object p0

    .line 1104
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected encodedPath: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1102
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "encodedPath == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public encodedQuery(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 6

    if-eqz p1, :cond_0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x1

    const-string v1, " \"\'<>#"

    move-object v0, p1

    .line 1121
    invoke-static/range {v0 .. v5}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p1

    .line 1120
    invoke-static {p1}, Lokhttp3/HttpUrl;->queryStringToNamesAndValues(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    return-object p0
.end method

.method public encodedUsername(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 6

    if-eqz p1, :cond_0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const-string v1, " \"\':;<=>@[]^`{}|/\\?#"

    move-object v0, p1

    .line 983
    invoke-static/range {v0 .. v5}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    return-object p0

    .line 982
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "encodedUsername == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public fragment(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 6

    if-eqz p1, :cond_0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v1, ""

    move-object v0, p1

    .line 1194
    invoke-static/range {v0 .. v5}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    return-object p0
.end method

.method public host(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 3

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    .line 1007
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {p1, v0, v1}, Lokhttp3/HttpUrl$Builder;->canonicalizeHost(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1009
    iput-object v0, p0, Lokhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    return-object p0

    .line 1008
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected host: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1006
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "host == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method parse(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder$ParseResult;
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v9, p2

    .line 1291
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v8, 0x0

    invoke-static {v9, v8, v2}, Lokhttp3/internal/Util;->skipLeadingAsciiWhitespace(Ljava/lang/String;II)I

    move-result v10

    .line 1292
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v9, v10, v2}, Lokhttp3/internal/Util;->skipTrailingAsciiWhitespace(Ljava/lang/String;II)I

    move-result v11

    .line 1295
    invoke-static {v9, v10, v11}, Lokhttp3/HttpUrl$Builder;->schemeDelimiterOffset(Ljava/lang/String;II)I

    move-result v2

    const/4 v12, -0x1

    if-eq v2, v12, :cond_2

    const/4 v3, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x6

    const-string v5, "https:"

    move-object/from16 v2, p2

    move v4, v10

    .line 1297
    invoke-virtual/range {v2 .. v7}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "https"

    .line 1298
    iput-object v2, v0, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    add-int/lit8 v10, v10, 0x6

    goto :goto_0

    :cond_0
    const/4 v3, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x5

    const-string v5, "http:"

    move-object/from16 v2, p2

    move v4, v10

    .line 1300
    invoke-virtual/range {v2 .. v7}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "http"

    .line 1301
    iput-object v2, v0, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    add-int/lit8 v10, v10, 0x5

    goto :goto_0

    .line 1304
    :cond_1
    sget-object v1, Lokhttp3/HttpUrl$Builder$ParseResult;->UNSUPPORTED_SCHEME:Lokhttp3/HttpUrl$Builder$ParseResult;

    return-object v1

    :cond_2
    if-eqz v1, :cond_12

    .line 1307
    iget-object v2, v1, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    iput-object v2, v0, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    .line 1315
    :goto_0
    invoke-static {v9, v10, v11}, Lokhttp3/HttpUrl$Builder;->slashCount(Ljava/lang/String;II)I

    move-result v2

    const/4 v3, 0x2

    const/16 v13, 0x3f

    const/16 v14, 0x23

    if-ge v2, v3, :cond_5

    if-eqz v1, :cond_5

    .line 1316
    iget-object v3, v1, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    iget-object v4, v0, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_1

    .line 1379
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lokhttp3/HttpUrl;->encodedUsername()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lokhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    .line 1380
    invoke-virtual/range {p1 .. p1}, Lokhttp3/HttpUrl;->encodedPassword()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    .line 1381
    iget-object v2, v1, Lokhttp3/HttpUrl;->host:Ljava/lang/String;

    iput-object v2, v0, Lokhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    .line 1382
    iget v2, v1, Lokhttp3/HttpUrl;->port:I

    iput v2, v0, Lokhttp3/HttpUrl$Builder;->port:I

    .line 1383
    iget-object v2, v0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 1384
    iget-object v2, v0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-virtual/range {p1 .. p1}, Lokhttp3/HttpUrl;->encodedPathSegments()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    if-eq v10, v11, :cond_4

    .line 1385
    invoke-virtual {v9, v10}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v14, :cond_f

    .line 1386
    :cond_4
    invoke-virtual/range {p1 .. p1}, Lokhttp3/HttpUrl;->encodedQuery()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/HttpUrl$Builder;->encodedQuery(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    goto/16 :goto_6

    :cond_5
    :goto_1
    add-int/2addr v10, v2

    move v2, v10

    const/4 v10, 0x0

    const/16 v16, 0x0

    :goto_2
    const-string v1, "@/\\?#"

    .line 1329
    invoke-static {v9, v2, v11, v1}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IILjava/lang/String;)I

    move-result v8

    if-eq v8, v11, :cond_6

    .line 1331
    invoke-virtual {v9, v8}, Ljava/lang/String;->charAt(I)C

    move-result v1

    goto :goto_3

    :cond_6
    const/4 v1, -0x1

    :goto_3
    if-eq v1, v12, :cond_b

    if-eq v1, v14, :cond_b

    const/16 v3, 0x2f

    if-eq v1, v3, :cond_b

    const/16 v3, 0x5c

    if-eq v1, v3, :cond_b

    if-eq v1, v13, :cond_b

    const/16 v3, 0x40

    if-eq v1, v3, :cond_7

    goto/16 :goto_5

    :cond_7
    const-string v7, "%40"

    if-nez v10, :cond_a

    const/16 v1, 0x3a

    .line 1337
    invoke-static {v9, v2, v8, v1}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IIC)I

    move-result v6

    const/4 v5, 0x1

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x1

    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    move-object/from16 v1, p2

    move v3, v6

    move v15, v6

    move/from16 v6, v17

    move-object v14, v7

    move/from16 v7, v18

    move v13, v8

    move/from16 v8, v19

    .line 1339
    invoke-static/range {v1 .. v8}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object v1

    if-eqz v16, :cond_8

    .line 1341
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v0, Lokhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_8
    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    if-eq v15, v13, :cond_9

    add-int/lit8 v2, v15, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    move-object/from16 v1, p2

    move v3, v13

    .line 1346
    invoke-static/range {v1 .. v8}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    const/4 v10, 0x1

    :cond_9
    const/16 v16, 0x1

    goto :goto_4

    :cond_a
    move-object v14, v7

    move v13, v8

    .line 1351
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v0, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    move-object/from16 v1, p2

    move v3, v13

    invoke-static/range {v1 .. v8}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    :goto_4
    add-int/lit8 v2, v13, 0x1

    :goto_5
    const/16 v13, 0x3f

    const/16 v14, 0x23

    goto/16 :goto_2

    :cond_b
    move v13, v8

    .line 1363
    invoke-static {v9, v2, v13}, Lokhttp3/HttpUrl$Builder;->portColonOffset(Ljava/lang/String;II)I

    move-result v1

    add-int/lit8 v3, v1, 0x1

    if-ge v3, v13, :cond_c

    .line 1365
    invoke-static {v9, v2, v1}, Lokhttp3/HttpUrl$Builder;->canonicalizeHost(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    .line 1366
    invoke-static {v9, v3, v13}, Lokhttp3/HttpUrl$Builder;->parsePort(Ljava/lang/String;II)I

    move-result v1

    iput v1, v0, Lokhttp3/HttpUrl$Builder;->port:I

    if-ne v1, v12, :cond_d

    .line 1367
    sget-object v1, Lokhttp3/HttpUrl$Builder$ParseResult;->INVALID_PORT:Lokhttp3/HttpUrl$Builder$ParseResult;

    return-object v1

    .line 1369
    :cond_c
    invoke-static {v9, v2, v1}, Lokhttp3/HttpUrl$Builder;->canonicalizeHost(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    .line 1370
    iget-object v1, v0, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    invoke-static {v1}, Lokhttp3/HttpUrl;->defaultPort(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lokhttp3/HttpUrl$Builder;->port:I

    .line 1372
    :cond_d
    iget-object v1, v0, Lokhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    if-nez v1, :cond_e

    sget-object v1, Lokhttp3/HttpUrl$Builder$ParseResult;->INVALID_HOST:Lokhttp3/HttpUrl$Builder$ParseResult;

    return-object v1

    :cond_e
    move v10, v13

    :cond_f
    :goto_6
    const-string v1, "?#"

    .line 1391
    invoke-static {v9, v10, v11, v1}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IILjava/lang/String;)I

    move-result v1

    .line 1392
    invoke-direct {v0, v9, v10, v1}, Lokhttp3/HttpUrl$Builder;->resolvePath(Ljava/lang/String;II)V

    if-ge v1, v11, :cond_10

    .line 1396
    invoke-virtual {v9, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x3f

    if-ne v2, v3, :cond_10

    const/16 v2, 0x23

    .line 1397
    invoke-static {v9, v1, v11, v2}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IIC)I

    move-result v10

    add-int/lit8 v2, v1, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x1

    const-string v4, " \"\'<>#"

    move-object/from16 v1, p2

    move v3, v10

    .line 1398
    invoke-static/range {v1 .. v8}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lokhttp3/HttpUrl;->queryStringToNamesAndValues(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    move v1, v10

    :cond_10
    if-ge v1, v11, :cond_11

    .line 1404
    invoke-virtual {v9, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x23

    if-ne v2, v3, :cond_11

    const/4 v2, 0x1

    add-int/2addr v2, v1

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v4, ""

    move-object/from16 v1, p2

    move v3, v11

    .line 1405
    invoke-static/range {v1 .. v8}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    .line 1409
    :cond_11
    sget-object v1, Lokhttp3/HttpUrl$Builder$ParseResult;->SUCCESS:Lokhttp3/HttpUrl$Builder$ParseResult;

    return-object v1

    .line 1309
    :cond_12
    sget-object v1, Lokhttp3/HttpUrl$Builder$ParseResult;->MISSING_SCHEME:Lokhttp3/HttpUrl$Builder$ParseResult;

    return-object v1
.end method

.method public password(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 6

    if-eqz p1, :cond_0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const-string v1, " \"\':;<=>@[]^`{}|/\\?#"

    move-object v0, p1

    .line 990
    invoke-static/range {v0 .. v5}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    return-object p0

    .line 989
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "password == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public port(I)Lokhttp3/HttpUrl$Builder;
    .locals 3

    if-lez p1, :cond_0

    const v0, 0xffff

    if-gt p1, v0, :cond_0

    .line 1015
    iput p1, p0, Lokhttp3/HttpUrl$Builder;->port:I

    return-object p0

    .line 1014
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected port: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public query(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 6

    if-eqz p1, :cond_0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x1

    const-string v1, " \"\'<>#"

    move-object v0, p1

    .line 1112
    invoke-static/range {v0 .. v5}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lokhttp3/HttpUrl;->queryStringToNamesAndValues(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    return-object p0
.end method

.method reencodeForUri()Lokhttp3/HttpUrl$Builder;
    .locals 10

    .line 1211
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 1212
    iget-object v3, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    .line 1213
    iget-object v3, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    const/4 v6, 0x1

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x1

    const-string v5, "[]"

    .line 1214
    invoke-static/range {v4 .. v9}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object v4

    .line 1213
    invoke-interface {v3, v2, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1216
    :cond_0
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-eqz v0, :cond_2

    .line 1217
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_1
    if-ge v1, v0, :cond_2

    .line 1218
    iget-object v2, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 1220
    iget-object v2, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    const/4 v5, 0x1

    const/4 v6, 0x1

    const/4 v7, 0x1

    const/4 v8, 0x1

    const-string v4, "\\^`{|}"

    .line 1221
    invoke-static/range {v3 .. v8}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object v3

    .line 1220
    invoke-interface {v2, v1, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1225
    :cond_2
    iget-object v2, p0, Lokhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    if-eqz v2, :cond_3

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v3, " \"#<>\\^`{|}"

    .line 1226
    invoke-static/range {v2 .. v7}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    :cond_3
    return-object p0
.end method

.method public removeAllEncodedQueryParameters(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 7

    if-eqz p1, :cond_1

    .line 1173
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x1

    const-string v2, " \"\'<>#&="

    move-object v1, p1

    .line 1175
    invoke-static/range {v1 .. v6}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p1

    .line 1174
    invoke-direct {p0, p1}, Lokhttp3/HttpUrl$Builder;->removeAllCanonicalQueryParameters(Ljava/lang/String;)V

    return-object p0

    .line 1172
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "encodedName == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public removeAllQueryParameters(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 7

    if-eqz p1, :cond_1

    .line 1164
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x1

    const-string v2, " \"\'<>#&="

    move-object v1, p1

    .line 1165
    invoke-static/range {v1 .. v6}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p1

    .line 1167
    invoke-direct {p0, p1}, Lokhttp3/HttpUrl$Builder;->removeAllCanonicalQueryParameters(Ljava/lang/String;)V

    return-object p0

    .line 1163
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "name == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public removePathSegment(I)Lokhttp3/HttpUrl$Builder;
    .locals 1

    .line 1094
    iget-object v0, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1095
    iget-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1096
    iget-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    const-string v0, ""

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object p0
.end method

.method public scheme(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 3

    if-eqz p1, :cond_2

    const-string v0, "http"

    .line 965
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 966
    iput-object v0, p0, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v0, "https"

    .line 967
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 968
    iput-object v0, p0, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    :goto_0
    return-object p0

    .line 970
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected scheme: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 964
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "scheme == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setEncodedPathSegment(ILjava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 8

    if-eqz p2, :cond_1

    const/4 v1, 0x0

    .line 1085
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    const-string v3, " \"<>^`{}|/\\?#"

    move-object v0, p2

    .line 1084
    invoke-static/range {v0 .. v7}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object v0

    .line 1086
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v1, p1, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1087
    invoke-direct {p0, v0}, Lokhttp3/HttpUrl$Builder;->isDot(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-direct {p0, v0}, Lokhttp3/HttpUrl$Builder;->isDotDot(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    return-object p0

    .line 1088
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "unexpected path segment: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1082
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "encodedPathSegment == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setEncodedQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 0

    .line 1157
    invoke-virtual {p0, p1}, Lokhttp3/HttpUrl$Builder;->removeAllEncodedQueryParameters(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    .line 1158
    invoke-virtual {p0, p1, p2}, Lokhttp3/HttpUrl$Builder;->addEncodedQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    return-object p0
.end method

.method public setPathSegment(ILjava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 8

    if-eqz p2, :cond_1

    const/4 v1, 0x0

    .line 1072
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    const-string v3, " \"<>^`{}|/\\?#"

    move-object v0, p2

    .line 1071
    invoke-static/range {v0 .. v7}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object v0

    .line 1073
    invoke-direct {p0, v0}, Lokhttp3/HttpUrl$Builder;->isDot(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0, v0}, Lokhttp3/HttpUrl$Builder;->isDotDot(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1076
    iget-object p2, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {p2, p1, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-object p0

    .line 1074
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "unexpected path segment: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1070
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "pathSegment == null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 0

    .line 1151
    invoke-virtual {p0, p1}, Lokhttp3/HttpUrl$Builder;->removeAllQueryParameters(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    .line 1152
    invoke-virtual {p0, p1, p2}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1239
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1240
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "://"

    .line 1241
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1243
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/16 v2, 0x3a

    if-eqz v1, :cond_0

    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 1244
    :cond_0
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1245
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1246
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1247
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    const/16 v1, 0x40

    .line 1249
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1252
    :cond_2
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v3, -0x1

    if-eq v1, v3, :cond_3

    const/16 v1, 0x5b

    .line 1254
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1255
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x5d

    .line 1256
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1258
    :cond_3
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1261
    :goto_0
    invoke-virtual {p0}, Lokhttp3/HttpUrl$Builder;->effectivePort()I

    move-result v1

    .line 1262
    iget-object v3, p0, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    invoke-static {v3}, Lokhttp3/HttpUrl;->defaultPort(Ljava/lang/String;)I

    move-result v3

    if-eq v1, v3, :cond_4

    .line 1263
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1264
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1267
    :cond_4
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-static {v0, v1}, Lokhttp3/HttpUrl;->pathSegmentsToString(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 1269
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-eqz v1, :cond_5

    const/16 v1, 0x3f

    .line 1270
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1271
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-static {v0, v1}, Lokhttp3/HttpUrl;->namesAndValuesToQueryString(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 1274
    :cond_5
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    if-eqz v1, :cond_6

    const/16 v1, 0x23

    .line 1275
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1276
    iget-object v1, p0, Lokhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1279
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public username(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .locals 6

    if-eqz p1, :cond_0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const-string v1, " \"\':;<=>@[]^`{}|/\\?#"

    move-object v0, p1

    .line 977
    invoke-static/range {v0 .. v5}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    return-object p0

    .line 976
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "username == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
