.class public final Lokhttp3/internal/http2/Header;
.super Ljava/lang/Object;
.source "Header.java"


# static fields
.field public static final PSEUDO_PREFIX:Lokio/ByteString;

.field public static final RESPONSE_STATUS:Lokio/ByteString;

.field public static final TARGET_AUTHORITY:Lokio/ByteString;

.field public static final TARGET_METHOD:Lokio/ByteString;

.field public static final TARGET_PATH:Lokio/ByteString;

.field public static final TARGET_SCHEME:Lokio/ByteString;


# instance fields
.field final hpackSize:I

.field public final name:Lokio/ByteString;

.field public final value:Lokio/ByteString;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, ":"

    .line 24
    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http2/Header;->PSEUDO_PREFIX:Lokio/ByteString;

    const-string v0, ":status"

    .line 25
    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http2/Header;->RESPONSE_STATUS:Lokio/ByteString;

    const-string v0, ":method"

    .line 26
    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http2/Header;->TARGET_METHOD:Lokio/ByteString;

    const-string v0, ":path"

    .line 27
    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http2/Header;->TARGET_PATH:Lokio/ByteString;

    const-string v0, ":scheme"

    .line 28
    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http2/Header;->TARGET_SCHEME:Lokio/ByteString;

    const-string v0, ":authority"

    .line 29
    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http2/Header;->TARGET_AUTHORITY:Lokio/ByteString;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 39
    invoke-static {p1}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object p1

    invoke-static {p2}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lokhttp3/internal/http2/Header;-><init>(Lokio/ByteString;Lokio/ByteString;)V

    return-void
.end method

.method public constructor <init>(Lokio/ByteString;Ljava/lang/String;)V
    .locals 0

    .line 43
    invoke-static {p2}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lokhttp3/internal/http2/Header;-><init>(Lokio/ByteString;Lokio/ByteString;)V

    return-void
.end method

.method public constructor <init>(Lokio/ByteString;Lokio/ByteString;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lokhttp3/internal/http2/Header;->name:Lokio/ByteString;

    .line 48
    iput-object p2, p0, Lokhttp3/internal/http2/Header;->value:Lokio/ByteString;

    .line 49
    invoke-virtual {p1}, Lokio/ByteString;->size()I

    move-result p1

    add-int/lit8 p1, p1, 0x20

    invoke-virtual {p2}, Lokio/ByteString;->size()I

    move-result p2

    add-int/2addr p1, p2

    iput p1, p0, Lokhttp3/internal/http2/Header;->hpackSize:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 53
    instance-of v0, p1, Lokhttp3/internal/http2/Header;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 54
    check-cast p1, Lokhttp3/internal/http2/Header;

    .line 55
    iget-object v0, p0, Lokhttp3/internal/http2/Header;->name:Lokio/ByteString;

    iget-object v2, p1, Lokhttp3/internal/http2/Header;->name:Lokio/ByteString;

    invoke-virtual {v0, v2}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lokhttp3/internal/http2/Header;->value:Lokio/ByteString;

    iget-object p1, p1, Lokhttp3/internal/http2/Header;->value:Lokio/ByteString;

    .line 56
    invoke-virtual {v0, p1}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 63
    iget-object v0, p0, Lokhttp3/internal/http2/Header;->name:Lokio/ByteString;

    invoke-virtual {v0}, Lokio/ByteString;->hashCode()I

    move-result v0

    const/16 v1, 0x20f

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 64
    iget-object v0, p0, Lokhttp3/internal/http2/Header;->value:Lokio/ByteString;

    invoke-virtual {v0}, Lokio/ByteString;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    .line 69
    iget-object v1, p0, Lokhttp3/internal/http2/Header;->name:Lokio/ByteString;

    invoke-virtual {v1}, Lokio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-object v1, p0, Lokhttp3/internal/http2/Header;->value:Lokio/ByteString;

    invoke-virtual {v1}, Lokio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "%s: %s"

    invoke-static {v1, v0}, Lokhttp3/internal/Util;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
