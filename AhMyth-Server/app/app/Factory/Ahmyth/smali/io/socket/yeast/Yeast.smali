.class public final Lio/socket/yeast/Yeast;
.super Ljava/lang/Object;
.source "Yeast.java"


# static fields
.field private static alphabet:[C

.field private static length:I

.field private static map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static prev:Ljava/lang/String;

.field private static seed:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_"

    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lio/socket/yeast/Yeast;->alphabet:[C

    .line 13
    array-length v0, v0

    sput v0, Lio/socket/yeast/Yeast;->length:I

    const/4 v0, 0x0

    .line 14
    sput v0, Lio/socket/yeast/Yeast;->seed:I

    .line 16
    new-instance v1, Ljava/util/HashMap;

    sget v2, Lio/socket/yeast/Yeast;->length:I

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    sput-object v1, Lio/socket/yeast/Yeast;->map:Ljava/util/Map;

    .line 18
    :goto_0
    sget v1, Lio/socket/yeast/Yeast;->length:I

    if-ge v0, v1, :cond_0

    .line 19
    sget-object v1, Lio/socket/yeast/Yeast;->map:Ljava/util/Map;

    sget-object v2, Lio/socket/yeast/Yeast;->alphabet:[C

    aget-char v2, v2, v0

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode(Ljava/lang/String;)J
    .locals 7

    .line 39
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    array-length v0, p0

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_0

    aget-char v4, p0, v3

    .line 40
    sget v5, Lio/socket/yeast/Yeast;->length:I

    int-to-long v5, v5

    mul-long v1, v1, v5

    sget-object v5, Lio/socket/yeast/Yeast;->map:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v1, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-wide v1
.end method

.method public static encode(J)Ljava/lang/String;
    .locals 5

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    :cond_0
    const/4 v1, 0x0

    .line 29
    sget-object v2, Lio/socket/yeast/Yeast;->alphabet:[C

    sget v3, Lio/socket/yeast/Yeast;->length:I

    int-to-long v3, v3

    rem-long v3, p0, v3

    long-to-int v4, v3

    aget-char v2, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 30
    sget v1, Lio/socket/yeast/Yeast;->length:I

    int-to-long v1, v1

    div-long/2addr p0, v1

    const-wide/16 v1, 0x0

    cmp-long v3, p0, v1

    if-gtz v3, :cond_0

    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static yeast()Ljava/lang/String;
    .locals 3

    .line 47
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/socket/yeast/Yeast;->encode(J)Ljava/lang/String;

    move-result-object v0

    .line 49
    sget-object v1, Lio/socket/yeast/Yeast;->prev:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    .line 50
    sput v1, Lio/socket/yeast/Yeast;->seed:I

    .line 51
    sput-object v0, Lio/socket/yeast/Yeast;->prev:Ljava/lang/String;

    return-object v0

    .line 55
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lio/socket/yeast/Yeast;->seed:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Lio/socket/yeast/Yeast;->seed:I

    int-to-long v1, v1

    invoke-static {v1, v2}, Lio/socket/yeast/Yeast;->encode(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
