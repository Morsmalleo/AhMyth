.class public final Lokio/Utf8;
.super Ljava/lang/Object;
.source "Utf8.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    return-void
.end method

.method public static size(Ljava/lang/String;)J
    .locals 2
    .param p0, "string"    # Ljava/lang/String;

    .line 74
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {p0, v1, v0}, Lokio/Utf8;->size(Ljava/lang/String;II)J

    move-result-wide v0

    return-wide v0
.end method

.method public static size(Ljava/lang/String;II)J
    .locals 9
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "beginIndex"    # I
    .param p2, "endIndex"    # I

    .line 82
    if-eqz p0, :cond_b

    .line 83
    if-ltz p1, :cond_a

    .line 84
    if-lt p2, p1, :cond_9

    .line 87
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-gt p2, v0, :cond_8

    .line 92
    const-wide/16 v0, 0x0

    .line 93
    .local v0, "result":J
    move v2, p1

    .local v2, "i":I
    :goto_0
    if-ge v2, p2, :cond_7

    .line 94
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 96
    .local v3, "c":I
    const/16 v4, 0x80

    const-wide/16 v5, 0x1

    if-ge v3, v4, :cond_0

    .line 98
    add-long/2addr v0, v5

    .line 99
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 101
    :cond_0
    const/16 v4, 0x800

    if-ge v3, v4, :cond_1

    .line 103
    const-wide/16 v4, 0x2

    add-long/2addr v0, v4

    .line 104
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 106
    :cond_1
    const v4, 0xd800

    if-lt v3, v4, :cond_6

    const v4, 0xdfff

    if-le v3, v4, :cond_2

    goto :goto_3

    .line 112
    :cond_2
    add-int/lit8 v7, v2, 0x1

    if-ge v7, p2, :cond_3

    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    goto :goto_1

    :cond_3
    const/4 v7, 0x0

    .line 113
    .local v7, "low":I
    :goto_1
    const v8, 0xdbff

    if-gt v3, v8, :cond_5

    const v8, 0xdc00

    if-lt v7, v8, :cond_5

    if-le v7, v4, :cond_4

    goto :goto_2

    .line 120
    :cond_4
    const-wide/16 v4, 0x4

    add-long/2addr v0, v4

    .line 121
    add-int/lit8 v2, v2, 0x2

    goto :goto_4

    .line 115
    :cond_5
    :goto_2
    add-long/2addr v0, v5

    .line 116
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 108
    .end local v7    # "low":I
    :cond_6
    :goto_3
    const-wide/16 v4, 0x3

    add-long/2addr v0, v4

    .line 109
    add-int/lit8 v2, v2, 0x1

    .line 124
    .end local v3    # "c":I
    :goto_4
    goto :goto_0

    .line 126
    .end local v2    # "i":I
    :cond_7
    return-wide v0

    .line 88
    .end local v0    # "result":J
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "endIndex > string.length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " > "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 89
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "endIndex < beginIndex: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " < "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "beginIndex < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "string == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_6

    :goto_5
    throw v0

    :goto_6
    goto :goto_5
.end method
