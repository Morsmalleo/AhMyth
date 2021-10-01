.class public final Lio/socket/parser/IOParser$Decoder;
.super Ljava/lang/Object;
.source "IOParser.java"

# interfaces
.implements Lio/socket/parser/Parser$Decoder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/parser/IOParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Decoder"
.end annotation


# instance fields
.field private onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

.field reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    const/4 v0, 0x0

    iput-object v0, p0, Lio/socket/parser/IOParser$Decoder;->reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;

    .line 88
    return-void
.end method

.method private static decodeString(Ljava/lang/String;)Lio/socket/parser/Packet;
    .locals 10
    .param p0, "str"    # Ljava/lang/String;

    .line 124
    const/4 v0, 0x0

    .line 125
    .local v0, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 127
    .local v1, "length":I
    new-instance v2, Lio/socket/parser/Packet;

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v4

    invoke-direct {v2, v4}, Lio/socket/parser/Packet;-><init>(I)V

    .line 129
    .local v2, "p":Lio/socket/parser/Packet;, "Lio/socket/parser/Packet<Ljava/lang/Object;>;"
    iget v4, v2, Lio/socket/parser/Packet;->type:I

    if-ltz v4, :cond_d

    iget v4, v2, Lio/socket/parser/Packet;->type:I

    sget-object v5, Lio/socket/parser/Parser;->types:[Ljava/lang/String;

    array-length v5, v5

    const/4 v6, 0x1

    sub-int/2addr v5, v6

    if-gt v4, v5, :cond_d

    .line 133
    const/4 v4, 0x5

    iget v5, v2, Lio/socket/parser/Packet;->type:I

    if-eq v4, v5, :cond_0

    const/4 v4, 0x6

    iget v5, v2, Lio/socket/parser/Packet;->type:I

    if-ne v4, v5, :cond_2

    .line 134
    :cond_0
    const-string v4, "-"

    invoke-virtual {p0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_c

    add-int/lit8 v4, v0, 0x1

    if-le v1, v4, :cond_c

    .line 137
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    .local v4, "attachments":Ljava/lang/StringBuilder;
    :goto_0
    add-int/2addr v0, v6

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v7, 0x2d

    if-eq v5, v7, :cond_1

    .line 139
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 141
    :cond_1
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v2, Lio/socket/parser/Packet;->attachments:I

    .line 144
    .end local v4    # "attachments":Ljava/lang/StringBuilder;
    :cond_2
    add-int/lit8 v4, v0, 0x1

    if-le v1, v4, :cond_5

    const/16 v4, 0x2f

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v4, v5, :cond_5

    .line 145
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .local v4, "nsp":Ljava/lang/StringBuilder;
    :goto_1
    add-int/2addr v0, v6

    .line 148
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 149
    .local v5, "c":C
    const/16 v7, 0x2c

    if-ne v7, v5, :cond_3

    goto :goto_2

    .line 150
    :cond_3
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 151
    add-int/lit8 v7, v0, 0x1

    if-ne v7, v1, :cond_4

    .line 153
    .end local v5    # "c":C
    :goto_2
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    .line 154
    .end local v4    # "nsp":Ljava/lang/StringBuilder;
    goto :goto_3

    .line 152
    .restart local v4    # "nsp":Ljava/lang/StringBuilder;
    :cond_4
    goto :goto_1

    .line 155
    .end local v4    # "nsp":Ljava/lang/StringBuilder;
    :cond_5
    const-string v4, "/"

    iput-object v4, v2, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    .line 158
    :goto_3
    add-int/lit8 v4, v0, 0x1

    const-string v5, "invalid payload"

    if-le v1, v4, :cond_8

    .line 159
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    .line 160
    .local v4, "next":Ljava/lang/Character;
    invoke-virtual {v4}, Ljava/lang/Character;->charValue()C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v7

    const/4 v8, -0x1

    if-le v7, v8, :cond_8

    .line 161
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 163
    .local v7, "id":Ljava/lang/StringBuilder;
    :goto_4
    add-int/2addr v0, v6

    .line 164
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 165
    .local v8, "c":C
    invoke-static {v8}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v9

    if-gez v9, :cond_6

    .line 166
    add-int/lit8 v0, v0, -0x1

    .line 167
    goto :goto_5

    .line 169
    :cond_6
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 170
    add-int/lit8 v9, v0, 0x1

    if-ne v9, v1, :cond_7

    .line 173
    .end local v8    # "c":C
    :goto_5
    :try_start_0
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    iput v8, v2, Lio/socket/parser/Packet;->id:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    goto :goto_6

    .line 174
    :catch_0
    move-exception v3

    .line 175
    .local v3, "e":Ljava/lang/NumberFormatException;
    new-instance v6, Lio/socket/parser/DecodingException;

    invoke-direct {v6, v5}, Lio/socket/parser/DecodingException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 171
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    :cond_7
    goto :goto_4

    .line 180
    .end local v4    # "next":Ljava/lang/Character;
    .end local v7    # "id":Ljava/lang/StringBuilder;
    :cond_8
    :goto_6
    add-int/lit8 v4, v0, 0x1

    if-le v1, v4, :cond_a

    .line 182
    add-int/lit8 v0, v0, 0x1

    :try_start_1
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    .line 183
    new-instance v4, Lorg/json/JSONTokener;

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v2, Lio/socket/parser/Packet;->data:Ljava/lang/Object;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 187
    nop

    .line 188
    iget v4, v2, Lio/socket/parser/Packet;->type:I

    iget-object v7, v2, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    invoke-static {v4, v7}, Lio/socket/parser/IOParser$Decoder;->isPayloadValid(ILjava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    goto :goto_7

    .line 189
    :cond_9
    new-instance v3, Lio/socket/parser/DecodingException;

    invoke-direct {v3, v5}, Lio/socket/parser/DecodingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 184
    :catch_1
    move-exception v3

    .line 185
    .local v3, "e":Lorg/json/JSONException;
    invoke-static {}, Lio/socket/parser/IOParser;->access$000()Ljava/util/logging/Logger;

    move-result-object v4

    sget-object v6, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v7, "An error occured while retrieving data from JSONTokener"

    invoke-virtual {v4, v6, v7, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 186
    new-instance v4, Lio/socket/parser/DecodingException;

    invoke-direct {v4, v5}, Lio/socket/parser/DecodingException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 193
    .end local v3    # "e":Lorg/json/JSONException;
    :cond_a
    :goto_7
    invoke-static {}, Lio/socket/parser/IOParser;->access$000()Ljava/util/logging/Logger;

    move-result-object v4

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 194
    invoke-static {}, Lio/socket/parser/IOParser;->access$000()Ljava/util/logging/Logger;

    move-result-object v4

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p0, v5, v3

    aput-object v2, v5, v6

    const-string v3, "decoded %s as %s"

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 196
    :cond_b
    return-object v2

    .line 135
    :cond_c
    new-instance v3, Lio/socket/parser/DecodingException;

    const-string v4, "illegal attachments"

    invoke-direct {v3, v4}, Lio/socket/parser/DecodingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 130
    :cond_d
    new-instance v3, Lio/socket/parser/DecodingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unknown packet type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v2, Lio/socket/parser/Packet;->type:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lio/socket/parser/DecodingException;-><init>(Ljava/lang/String;)V

    goto :goto_9

    :goto_8
    throw v3

    :goto_9
    goto :goto_8
.end method

.method private static isPayloadValid(ILjava/lang/Object;)Z
    .locals 3
    .param p0, "type"    # I
    .param p1, "payload"    # Ljava/lang/Object;

    .line 200
    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_0

    .line 215
    return v1

    .line 213
    :pswitch_0
    instance-of v0, p1, Lorg/json/JSONArray;

    return v0

    .line 208
    :pswitch_1
    instance-of v2, p1, Lorg/json/JSONArray;

    if-eqz v2, :cond_0

    move-object v2, p1

    check-cast v2, Lorg/json/JSONArray;

    .line 209
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_0

    move-object v2, p1

    check-cast v2, Lorg/json/JSONArray;

    .line 210
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 208
    :goto_0
    return v0

    .line 205
    :pswitch_2
    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    return v0

    .line 203
    :pswitch_3
    instance-of v0, p1, Lorg/json/JSONObject;

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .locals 3
    .param p1, "obj"    # Ljava/lang/String;

    .line 92
    invoke-static {p1}, Lio/socket/parser/IOParser$Decoder;->decodeString(Ljava/lang/String;)Lio/socket/parser/Packet;

    move-result-object v0

    .line 93
    .local v0, "packet":Lio/socket/parser/Packet;
    iget v1, v0, Lio/socket/parser/Packet;->type:I

    const/4 v2, 0x5

    if-eq v2, v1, :cond_1

    const/4 v1, 0x6

    iget v2, v0, Lio/socket/parser/Packet;->type:I

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 102
    :cond_0
    iget-object v1, p0, Lio/socket/parser/IOParser$Decoder;->onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

    if-eqz v1, :cond_2

    .line 103
    invoke-interface {v1, v0}, Lio/socket/parser/Parser$Decoder$Callback;->call(Lio/socket/parser/Packet;)V

    goto :goto_1

    .line 94
    :cond_1
    :goto_0
    new-instance v1, Lio/socket/parser/IOParser$BinaryReconstructor;

    invoke-direct {v1, v0}, Lio/socket/parser/IOParser$BinaryReconstructor;-><init>(Lio/socket/parser/Packet;)V

    iput-object v1, p0, Lio/socket/parser/IOParser$Decoder;->reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;

    .line 96
    iget-object v1, v1, Lio/socket/parser/IOParser$BinaryReconstructor;->reconPack:Lio/socket/parser/Packet;

    iget v1, v1, Lio/socket/parser/Packet;->attachments:I

    if-nez v1, :cond_2

    .line 97
    iget-object v1, p0, Lio/socket/parser/IOParser$Decoder;->onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

    if-eqz v1, :cond_2

    .line 98
    invoke-interface {v1, v0}, Lio/socket/parser/Parser$Decoder$Callback;->call(Lio/socket/parser/Packet;)V

    .line 106
    :cond_2
    :goto_1
    return-void
.end method

.method public add([B)V
    .locals 2
    .param p1, "obj"    # [B

    .line 110
    iget-object v0, p0, Lio/socket/parser/IOParser$Decoder;->reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;

    if-eqz v0, :cond_1

    .line 113
    invoke-virtual {v0, p1}, Lio/socket/parser/IOParser$BinaryReconstructor;->takeBinaryData([B)Lio/socket/parser/Packet;

    move-result-object v0

    .line 114
    .local v0, "packet":Lio/socket/parser/Packet;
    if-eqz v0, :cond_0

    .line 115
    const/4 v1, 0x0

    iput-object v1, p0, Lio/socket/parser/IOParser$Decoder;->reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;

    .line 116
    iget-object v1, p0, Lio/socket/parser/IOParser$Decoder;->onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

    if-eqz v1, :cond_0

    .line 117
    invoke-interface {v1, v0}, Lio/socket/parser/Parser$Decoder$Callback;->call(Lio/socket/parser/Packet;)V

    .line 121
    .end local v0    # "packet":Lio/socket/parser/Packet;
    :cond_0
    return-void

    .line 111
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "got binary data when not reconstructing a packet"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public destroy()V
    .locals 1

    .line 221
    iget-object v0, p0, Lio/socket/parser/IOParser$Decoder;->reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;

    if-eqz v0, :cond_0

    .line 222
    invoke-virtual {v0}, Lio/socket/parser/IOParser$BinaryReconstructor;->finishReconstruction()V

    .line 224
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lio/socket/parser/IOParser$Decoder;->onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

    .line 225
    return-void
.end method

.method public onDecoded(Lio/socket/parser/Parser$Decoder$Callback;)V
    .locals 0
    .param p1, "callback"    # Lio/socket/parser/Parser$Decoder$Callback;

    .line 229
    iput-object p1, p0, Lio/socket/parser/IOParser$Decoder;->onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

    .line 230
    return-void
.end method
