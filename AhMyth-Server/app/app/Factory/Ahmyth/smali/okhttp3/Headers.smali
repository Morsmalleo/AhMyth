.class public final Lokhttp3/Headers;
.super Ljava/lang/Object;
.source "Headers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/Headers$Builder;
    }
.end annotation


# instance fields
.field private final namesAndValues:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lokhttp3/Headers$Builder;)V
    .locals 2
    .param p1, "builder"    # Lokhttp3/Headers$Builder;

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iget-object v0, p1, Lokhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    iget-object v1, p1, Lokhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lokhttp3/Headers;->namesAndValues:[Ljava/lang/String;

    .line 55
    return-void
.end method

.method private constructor <init>([Ljava/lang/String;)V
    .locals 0
    .param p1, "namesAndValues"    # [Ljava/lang/String;

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lokhttp3/Headers;->namesAndValues:[Ljava/lang/String;

    .line 59
    return-void
.end method

.method static checkName(Ljava/lang/String;)V
    .locals 7
    .param p0, "name"    # Ljava/lang/String;

    .line 256
    if-eqz p0, :cond_3

    .line 257
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 258
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .local v1, "length":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 259
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 260
    .local v2, "c":C
    const/16 v3, 0x20

    if-le v2, v3, :cond_0

    const/16 v3, 0x7f

    if-ge v2, v3, :cond_0

    .line 258
    .end local v2    # "c":C
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 261
    .restart local v2    # "c":C
    :cond_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 262
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v4, v6

    const/4 v5, 0x2

    aput-object p0, v4, v5

    .line 261
    const-string v5, "Unexpected char %#04x at %d in header name: %s"

    invoke-static {v5, v4}, Lokhttp3/internal/Util;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 265
    .end local v0    # "i":I
    .end local v1    # "length":I
    .end local v2    # "c":C
    :cond_1
    return-void

    .line 257
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "name is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 256
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "name == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method static checkValue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;

    .line 268
    if-eqz p0, :cond_3

    .line 269
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .local v1, "length":I
    :goto_0
    if-ge v0, v1, :cond_2

    .line 270
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 271
    .local v2, "c":C
    const/16 v3, 0x1f

    if-gt v2, v3, :cond_0

    const/16 v3, 0x9

    if-ne v2, v3, :cond_1

    :cond_0
    const/16 v3, 0x7f

    if-ge v2, v3, :cond_1

    .line 269
    .end local v2    # "c":C
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 272
    .restart local v2    # "c":C
    :cond_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 273
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v4, v6

    const/4 v5, 0x2

    aput-object p1, v4, v5

    const/4 v5, 0x3

    aput-object p0, v4, v5

    .line 272
    const-string v5, "Unexpected char %#04x at %d in %s value: %s"

    invoke-static {v5, v4}, Lokhttp3/internal/Util;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 276
    .end local v0    # "i":I
    .end local v1    # "length":I
    .end local v2    # "c":C
    :cond_2
    return-void

    .line 268
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "value for name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " == null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method private static get([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "namesAndValues"    # [Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;

    .line 194
    array-length v0, p0

    add-int/lit8 v0, v0, -0x2

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 195
    aget-object v1, p0, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 196
    add-int/lit8 v1, v0, 0x1

    aget-object v1, p0, v1

    return-object v1

    .line 194
    :cond_0
    add-int/lit8 v0, v0, -0x2

    goto :goto_0

    .line 199
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static of(Ljava/util/Map;)Lokhttp3/Headers;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lokhttp3/Headers;"
        }
    .end annotation

    .line 234
    .local p0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p0, :cond_2

    .line 237
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    .line 238
    .local v0, "namesAndValues":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 239
    .local v1, "i":I
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 240
    .local v3, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 243
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 244
    .local v4, "name":Ljava/lang/String;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 245
    .local v5, "value":Ljava/lang/String;
    invoke-static {v4}, Lokhttp3/Headers;->checkName(Ljava/lang/String;)V

    .line 246
    invoke-static {v5, v4}, Lokhttp3/Headers;->checkValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    aput-object v4, v0, v1

    .line 248
    add-int/lit8 v6, v1, 0x1

    aput-object v5, v0, v6

    .line 249
    nop

    .end local v3    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x2

    .line 250
    goto :goto_0

    .line 241
    .restart local v3    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v4, "Headers cannot be null"

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 252
    .end local v3    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    new-instance v2, Lokhttp3/Headers;

    invoke-direct {v2, v0}, Lokhttp3/Headers;-><init>([Ljava/lang/String;)V

    return-object v2

    .line 234
    .end local v0    # "namesAndValues":[Ljava/lang/String;
    .end local v1    # "i":I
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "headers == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public static varargs of([Ljava/lang/String;)Lokhttp3/Headers;
    .locals 3
    .param p0, "namesAndValues"    # [Ljava/lang/String;

    .line 207
    if-eqz p0, :cond_4

    .line 208
    array-length v0, p0

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_3

    .line 213
    invoke-virtual {p0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    move-object p0, v0

    check-cast p0, [Ljava/lang/String;

    .line 214
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 215
    aget-object v1, p0, v0

    if-eqz v1, :cond_0

    .line 216
    aget-object v1, p0, v0

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p0, v0

    .line 214
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 215
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Headers cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 220
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_2

    .line 221
    aget-object v1, p0, v0

    .line 222
    .local v1, "name":Ljava/lang/String;
    add-int/lit8 v2, v0, 0x1

    aget-object v2, p0, v2

    .line 223
    .local v2, "value":Ljava/lang/String;
    invoke-static {v1}, Lokhttp3/Headers;->checkName(Ljava/lang/String;)V

    .line 224
    invoke-static {v2, v1}, Lokhttp3/Headers;->checkValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    add-int/lit8 v0, v0, 0x2

    goto :goto_1

    .line 227
    .end local v0    # "i":I
    :cond_2
    new-instance v0, Lokhttp3/Headers;

    invoke-direct {v0, p0}, Lokhttp3/Headers;-><init>([Ljava/lang/String;)V

    return-object v0

    .line 209
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Expected alternating header names and values"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 207
    :cond_4
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "namesAndValues == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2
.end method


# virtual methods
.method public byteCount()J
    .locals 6

    .line 121
    iget-object v0, p0, Lokhttp3/Headers;->namesAndValues:[Ljava/lang/String;

    array-length v1, v0

    mul-int/lit8 v1, v1, 0x2

    int-to-long v1, v1

    .line 123
    .local v1, "result":J
    const/4 v3, 0x0

    .local v3, "i":I
    array-length v0, v0

    .local v0, "size":I
    :goto_0
    if-ge v3, v0, :cond_0

    .line 124
    iget-object v4, p0, Lokhttp3/Headers;->namesAndValues:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v1, v4

    .line 123
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 127
    .end local v0    # "size":I
    .end local v3    # "i":I
    :cond_0
    return-wide v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "other"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 163
    instance-of v0, p1, Lokhttp3/Headers;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lokhttp3/Headers;

    iget-object v0, v0, Lokhttp3/Headers;->namesAndValues:[Ljava/lang/String;

    iget-object v1, p0, Lokhttp3/Headers;->namesAndValues:[Ljava/lang/String;

    .line 164
    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 163
    :goto_0
    return v0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 63
    iget-object v0, p0, Lokhttp3/Headers;->namesAndValues:[Ljava/lang/String;

    invoke-static {v0, p1}, Lokhttp3/Headers;->get([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDate(Ljava/lang/String;)Ljava/util/Date;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 71
    invoke-virtual {p0, p1}, Lokhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-static {v0}, Lokhttp3/internal/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public hashCode()I
    .locals 1

    .line 168
    iget-object v0, p0, Lokhttp3/Headers;->namesAndValues:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public name(I)Ljava/lang/String;
    .locals 2
    .param p1, "index"    # I

    .line 82
    iget-object v0, p0, Lokhttp3/Headers;->namesAndValues:[Ljava/lang/String;

    mul-int/lit8 v1, p1, 0x2

    aget-object v0, v0, v1

    return-object v0
.end method

.method public names()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 92
    new-instance v0, Ljava/util/TreeSet;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    .line 93
    .local v0, "result":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Lokhttp3/Headers;->size()I

    move-result v2

    .local v2, "size":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 94
    invoke-virtual {p0, v1}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 93
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 96
    .end local v1    # "i":I
    .end local v2    # "size":I
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public newBuilder()Lokhttp3/Headers$Builder;
    .locals 3

    .line 131
    new-instance v0, Lokhttp3/Headers$Builder;

    invoke-direct {v0}, Lokhttp3/Headers$Builder;-><init>()V

    .line 132
    .local v0, "result":Lokhttp3/Headers$Builder;
    iget-object v1, v0, Lokhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    iget-object v2, p0, Lokhttp3/Headers;->namesAndValues:[Ljava/lang/String;

    invoke-static {v1, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 133
    return-object v0
.end method

.method public size()I
    .locals 1

    .line 77
    iget-object v0, p0, Lokhttp3/Headers;->namesAndValues:[Ljava/lang/String;

    array-length v0, v0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public toMultimap()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 180
    new-instance v0, Ljava/util/TreeMap;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 181
    .local v0, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Lokhttp3/Headers;->size()I

    move-result v2

    .local v2, "size":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 182
    invoke-virtual {p0, v1}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 183
    .local v3, "name":Ljava/lang/String;
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 184
    .local v4, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v4, :cond_0

    .line 185
    new-instance v5, Ljava/util/ArrayList;

    const/4 v6, 0x2

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    move-object v4, v5

    .line 186
    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    :cond_0
    invoke-virtual {p0, v1}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 190
    .end local v1    # "i":I
    .end local v2    # "size":I
    :cond_1
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 172
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .local v0, "result":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Lokhttp3/Headers;->size()I

    move-result v2

    .local v2, "size":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 174
    invoke-virtual {p0, v1}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v1}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 176
    .end local v1    # "i":I
    .end local v2    # "size":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public value(I)Ljava/lang/String;
    .locals 2
    .param p1, "index"    # I

    .line 87
    iget-object v0, p0, Lokhttp3/Headers;->namesAndValues:[Ljava/lang/String;

    mul-int/lit8 v1, p1, 0x2

    add-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public values(Ljava/lang/String;)Ljava/util/List;
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

    .line 101
    const/4 v0, 0x0

    .line 102
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Lokhttp3/Headers;->size()I

    move-result v2

    .local v2, "size":I
    :goto_0
    if-ge v1, v2, :cond_2

    .line 103
    invoke-virtual {p0, v1}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 104
    if-nez v0, :cond_0

    new-instance v3, Ljava/util/ArrayList;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object v0, v3

    .line 105
    :cond_0
    invoke-virtual {p0, v1}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 108
    .end local v1    # "i":I
    .end local v2    # "size":I
    :cond_2
    if-eqz v0, :cond_3

    .line 109
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    goto :goto_1

    .line 110
    :cond_3
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    .line 108
    :goto_1
    return-object v1
.end method
