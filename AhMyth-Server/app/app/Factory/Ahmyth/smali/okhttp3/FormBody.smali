.class public final Lokhttp3/FormBody;
.super Lokhttp3/RequestBody;
.source "FormBody.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/FormBody$Builder;
    }
.end annotation


# static fields
.field private static final CONTENT_TYPE:Lokhttp3/MediaType;


# instance fields
.field private final encodedNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final encodedValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "application/x-www-form-urlencoded"

    .line 30
    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    sput-object v0, Lokhttp3/FormBody;->CONTENT_TYPE:Lokhttp3/MediaType;

    return-void
.end method

.method constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 35
    invoke-direct {p0}, Lokhttp3/RequestBody;-><init>()V

    .line 36
    invoke-static {p1}, Lokhttp3/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/FormBody;->encodedNames:Ljava/util/List;

    .line 37
    invoke-static {p2}, Lokhttp3/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/FormBody;->encodedValues:Ljava/util/List;

    return-void
.end method

.method private writeOrCountBytes(Lokio/BufferedSink;Z)J
    .locals 3

    if-eqz p2, :cond_0

    .line 84
    new-instance p1, Lokio/Buffer;

    invoke-direct {p1}, Lokio/Buffer;-><init>()V

    goto :goto_0

    .line 86
    :cond_0
    invoke-interface {p1}, Lokio/BufferedSink;->buffer()Lokio/Buffer;

    move-result-object p1

    :goto_0
    const/4 v0, 0x0

    .line 89
    iget-object v1, p0, Lokhttp3/FormBody;->encodedNames:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    :goto_1
    if-ge v0, v1, :cond_2

    if-lez v0, :cond_1

    const/16 v2, 0x26

    .line 90
    invoke-virtual {p1, v2}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 91
    :cond_1
    iget-object v2, p0, Lokhttp3/FormBody;->encodedNames:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    const/16 v2, 0x3d

    .line 92
    invoke-virtual {p1, v2}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 93
    iget-object v2, p0, Lokhttp3/FormBody;->encodedValues:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    if-eqz p2, :cond_3

    .line 97
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    move-result-wide v0

    .line 98
    invoke-virtual {p1}, Lokio/Buffer;->clear()V

    goto :goto_2

    :cond_3
    const-wide/16 v0, 0x0

    :goto_2
    return-wide v0
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 66
    invoke-direct {p0, v0, v1}, Lokhttp3/FormBody;->writeOrCountBytes(Lokio/BufferedSink;Z)J

    move-result-wide v0

    return-wide v0
.end method

.method public contentType()Lokhttp3/MediaType;
    .locals 1

    .line 62
    sget-object v0, Lokhttp3/FormBody;->CONTENT_TYPE:Lokhttp3/MediaType;

    return-object v0
.end method

.method public encodedName(I)Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lokhttp3/FormBody;->encodedNames:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public encodedValue(I)Ljava/lang/String;
    .locals 1

    .line 54
    iget-object v0, p0, Lokhttp3/FormBody;->encodedValues:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public name(I)Ljava/lang/String;
    .locals 1

    .line 50
    invoke-virtual {p0, p1}, Lokhttp3/FormBody;->encodedName(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lokhttp3/HttpUrl;->percentDecode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public size()I
    .locals 1

    .line 42
    iget-object v0, p0, Lokhttp3/FormBody;->encodedNames:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public value(I)Ljava/lang/String;
    .locals 1

    .line 58
    invoke-virtual {p0, p1}, Lokhttp3/FormBody;->encodedValue(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lokhttp3/HttpUrl;->percentDecode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public writeTo(Lokio/BufferedSink;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 70
    invoke-direct {p0, p1, v0}, Lokhttp3/FormBody;->writeOrCountBytes(Lokio/BufferedSink;Z)J

    return-void
.end method
