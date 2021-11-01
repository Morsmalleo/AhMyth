.class public Lio/socket/engineio/parser/Parser;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/engineio/parser/Parser$DecodePayloadCallback;,
        Lio/socket/engineio/parser/Parser$EncodeCallback;
    }
.end annotation


# static fields
.field private static final MAX_INT_CHAR_LENGTH:I

.field public static final PROTOCOL:I = 0x3

.field private static err:Lio/socket/engineio/parser/Packet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/socket/engineio/parser/Packet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final packets:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final packetslist:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const v0, 0x7fffffff

    .line 15
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lio/socket/engineio/parser/Parser;->MAX_INT_CHAR_LENGTH:I

    .line 19
    new-instance v0, Lio/socket/engineio/parser/Parser$1;

    invoke-direct {v0}, Lio/socket/engineio/parser/Parser$1;-><init>()V

    sput-object v0, Lio/socket/engineio/parser/Parser;->packets:Ljava/util/Map;

    .line 29
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lio/socket/engineio/parser/Parser;->packetslist:Ljava/util/Map;

    .line 31
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 32
    sget-object v2, Lio/socket/engineio/parser/Parser;->packetslist:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 36
    :cond_0
    new-instance v0, Lio/socket/engineio/parser/Packet;

    const-string v1, "error"

    const-string v2, "parser error"

    invoke-direct {v0, v1, v2}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)[B
    .locals 0

    .line 13
    invoke-static {p0}, Lio/socket/engineio/parser/Parser;->stringToByteArray(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0
.end method

.method private static byteArrayToString([B)Ljava/lang/String;
    .locals 4

    .line 261
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 262
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    .line 263
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 265
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static decodePacket(Ljava/lang/String;)Lio/socket/engineio/parser/Packet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lio/socket/engineio/parser/Packet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 75
    invoke-static {p0, v0}, Lio/socket/engineio/parser/Parser;->decodePacket(Ljava/lang/String;Z)Lio/socket/engineio/parser/Packet;

    move-result-object p0

    return-object p0
.end method

.method public static decodePacket(Ljava/lang/String;Z)Lio/socket/engineio/parser/Packet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lio/socket/engineio/parser/Packet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 81
    :try_start_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, -0x1

    :goto_0
    if-eqz p1, :cond_0

    .line 88
    :try_start_1
    invoke-static {p0}, Lio/socket/utf8/UTF8;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Lio/socket/utf8/UTF8Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 90
    :catch_1
    sget-object p0, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    return-object p0

    :cond_0
    :goto_1
    if-ltz v0, :cond_3

    .line 94
    sget-object p1, Lio/socket/engineio/parser/Parser;->packetslist:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    if-lt v0, v1, :cond_1

    goto :goto_2

    .line 98
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_2

    .line 99
    new-instance v1, Lio/socket/engineio/parser/Packet;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p1, p0}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1

    .line 101
    :cond_2
    new-instance p0, Lio/socket/engineio/parser/Packet;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-direct {p0, p1}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;)V

    return-object p0

    .line 95
    :cond_3
    :goto_2
    sget-object p0, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    return-object p0
.end method

.method public static decodePacket([B)Lio/socket/engineio/parser/Packet;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Lio/socket/engineio/parser/Packet<",
            "[B>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 106
    aget-byte v1, p0, v0

    .line 107
    array-length v2, p0

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    new-array v4, v2, [B

    .line 108
    invoke-static {p0, v3, v4, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 109
    new-instance p0, Lio/socket/engineio/parser/Packet;

    sget-object v0, Lio/socket/engineio/parser/Parser;->packetslist:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0, v4}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-object p0
.end method

.method public static decodePayload(Ljava/lang/String;Lio/socket/engineio/parser/Parser$DecodePayloadCallback;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lio/socket/engineio/parser/Parser$DecodePayloadCallback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p0, :cond_6

    .line 153
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    goto/16 :goto_2

    .line 158
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_4

    .line 160
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x3a

    if-eq v6, v5, :cond_1

    .line 163
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 167
    :cond_1
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    add-int/lit8 v5, v4, 0x1

    add-int v6, v5, v2

    .line 175
    :try_start_1
    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    .line 181
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_3

    .line 182
    invoke-static {v5, v1}, Lio/socket/engineio/parser/Parser;->decodePacket(Ljava/lang/String;Z)Lio/socket/engineio/parser/Packet;

    move-result-object v5

    .line 183
    sget-object v6, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    iget-object v6, v6, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    iget-object v7, v5, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    sget-object v6, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    iget-object v6, v6, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    iget-object v7, v5, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 184
    sget-object p0, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    invoke-interface {p1, p0, v0, v1}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    return-void

    :cond_2
    add-int v6, v4, v2

    .line 188
    invoke-interface {p1, v5, v6, v3}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    move-result v5

    if-nez v5, :cond_3

    return-void

    :cond_3
    add-int/2addr v4, v2

    .line 193
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    :goto_1
    add-int/2addr v4, v1

    goto :goto_0

    .line 177
    :catch_0
    sget-object p0, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    invoke-interface {p1, p0, v0, v1}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    return-void

    .line 169
    :catch_1
    sget-object p0, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    invoke-interface {p1, p0, v0, v1}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    return-void

    .line 197
    :cond_4
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-lez p0, :cond_5

    .line 198
    sget-object p0, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    invoke-interface {p1, p0, v0, v1}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    :cond_5
    return-void

    .line 154
    :cond_6
    :goto_2
    sget-object p0, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    invoke-interface {p1, p0, v0, v1}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    return-void
.end method

.method public static decodePayload([BLio/socket/engineio/parser/Parser$DecodePayloadCallback;)V
    .locals 10

    .line 203
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 204
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 206
    :goto_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lez v1, :cond_5

    .line 207
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 208
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v4

    const/16 v5, 0xff

    and-int/2addr v4, v5

    if-nez v4, :cond_0

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    :goto_1
    const/4 v6, 0x1

    .line 211
    :goto_2
    invoke-virtual {p0, v6}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v7

    and-int/2addr v7, v5

    if-ne v7, v5, :cond_1

    const/4 v5, 0x0

    goto :goto_3

    .line 214
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    sget v9, Lio/socket/engineio/parser/Parser;->MAX_INT_CHAR_LENGTH:I

    if-le v8, v9, :cond_4

    const/4 v5, 0x1

    :goto_3
    if-eqz v5, :cond_2

    .line 223
    sget-object p0, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    invoke-interface {p1, p0, v2, v3}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    return-void

    .line 226
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    add-int/2addr v2, v3

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 227
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 229
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 231
    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    add-int/2addr v1, v3

    .line 232
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 233
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    new-array v2, v2, [B

    .line 234
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    if-eqz v4, :cond_3

    .line 236
    invoke-static {v2}, Lio/socket/engineio/parser/Parser;->byteArrayToString([B)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 238
    :cond_3
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    :goto_4
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 241
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 242
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object p0

    goto :goto_0

    .line 218
    :cond_4
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 245
    :cond_5
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p0

    :goto_5
    if-ge v2, p0, :cond_8

    .line 247
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 248
    instance-of v4, v1, Ljava/lang/String;

    if-eqz v4, :cond_6

    .line 251
    check-cast v1, Ljava/lang/String;

    invoke-static {v1, v3}, Lio/socket/engineio/parser/Parser;->decodePacket(Ljava/lang/String;Z)Lio/socket/engineio/parser/Packet;

    move-result-object v1

    invoke-interface {p1, v1, v2, p0}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    goto :goto_6

    .line 252
    :cond_6
    instance-of v4, v1, [B

    if-eqz v4, :cond_7

    .line 255
    check-cast v1, [B

    check-cast v1, [B

    invoke-static {v1}, Lio/socket/engineio/parser/Parser;->decodePacket([B)Lio/socket/engineio/parser/Packet;

    move-result-object v1

    invoke-interface {p1, v1, v2, p0}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    :cond_7
    :goto_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_8
    return-void
.end method

.method private static encodeByteArray(Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/socket/engineio/parser/Packet<",
            "[B>;",
            "Lio/socket/engineio/parser/Parser$EncodeCallback<",
            "[B>;)V"
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    check-cast v0, [B

    .line 68
    array-length v1, v0

    const/4 v2, 0x1

    add-int/2addr v1, v2

    new-array v1, v1, [B

    .line 69
    sget-object v3, Lio/socket/engineio/parser/Parser;->packets:Ljava/util/Map;

    iget-object p0, p0, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    invoke-interface {v3, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->byteValue()B

    move-result p0

    const/4 v3, 0x0

    aput-byte p0, v1, v3

    .line 70
    array-length p0, v0

    invoke-static {v0, v3, v1, v2, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 71
    invoke-interface {p1, v1}, Lio/socket/engineio/parser/Parser$EncodeCallback;->call(Ljava/lang/Object;)V

    return-void
.end method

.method public static encodePacket(Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 42
    invoke-static {p0, v0, p1}, Lio/socket/engineio/parser/Parser;->encodePacket(Lio/socket/engineio/parser/Packet;ZLio/socket/engineio/parser/Parser$EncodeCallback;)V

    return-void
.end method

.method public static encodePacket(Lio/socket/engineio/parser/Packet;ZLio/socket/engineio/parser/Parser$EncodeCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    instance-of v0, v0, [B

    if-eqz v0, :cond_0

    .line 51
    invoke-static {p0, p2}, Lio/socket/engineio/parser/Parser;->encodeByteArray(Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V

    return-void

    .line 55
    :cond_0
    sget-object v0, Lio/socket/engineio/parser/Parser;->packets:Ljava/util/Map;

    iget-object v1, p0, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 57
    iget-object v1, p0, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    if-eqz v1, :cond_2

    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p0, p0, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    if-eqz p1, :cond_1

    invoke-static {p0}, Lio/socket/utf8/UTF8;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_1
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 63
    :cond_2
    invoke-interface {p2, v0}, Lio/socket/engineio/parser/Parser$EncodeCallback;->call(Ljava/lang/Object;)V

    return-void
.end method

.method public static encodePayload([Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lio/socket/engineio/parser/Packet;",
            "Lio/socket/engineio/parser/Parser$EncodeCallback<",
            "[B>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .line 113
    array-length v0, p0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    new-array p0, v1, [B

    .line 114
    invoke-interface {p1, p0}, Lio/socket/engineio/parser/Parser$EncodeCallback;->call(Ljava/lang/Object;)V

    return-void

    .line 118
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    array-length v2, p0

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 120
    array-length v2, p0

    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, p0, v1

    .line 121
    new-instance v4, Lio/socket/engineio/parser/Parser$2;

    invoke-direct {v4, v0}, Lio/socket/engineio/parser/Parser$2;-><init>(Ljava/util/ArrayList;)V

    const/4 v5, 0x1

    invoke-static {v3, v5, v4}, Lio/socket/engineio/parser/Parser;->encodePacket(Lio/socket/engineio/parser/Packet;ZLio/socket/engineio/parser/Parser$EncodeCallback;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 149
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-array p0, p0, [[B

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [[B

    invoke-static {p0}, Lio/socket/engineio/parser/Buffer;->concat([[B)[B

    move-result-object p0

    invoke-interface {p1, p0}, Lio/socket/engineio/parser/Parser$EncodeCallback;->call(Ljava/lang/Object;)V

    return-void
.end method

.method private static stringToByteArray(Ljava/lang/String;)[B
    .locals 4

    .line 269
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 270
    new-array v1, v0, [B

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 272
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method
