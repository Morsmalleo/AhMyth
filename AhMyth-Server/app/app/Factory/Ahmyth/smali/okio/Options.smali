.class public final Lokio/Options;
.super Ljava/util/AbstractList;
.source "Options.java"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList<",
        "Lokio/ByteString;",
        ">;",
        "Ljava/util/RandomAccess;"
    }
.end annotation


# instance fields
.field final byteStrings:[Lokio/ByteString;

.field final trie:[I


# direct methods
.method private constructor <init>([Lokio/ByteString;[I)V
    .locals 0
    .param p1, "byteStrings"    # [Lokio/ByteString;
    .param p2, "trie"    # [I

    .line 30
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 31
    iput-object p1, p0, Lokio/Options;->byteStrings:[Lokio/ByteString;

    .line 32
    iput-object p2, p0, Lokio/Options;->trie:[I

    .line 33
    return-void
.end method

.method private static buildTrieRecursive(JLokio/Buffer;ILjava/util/List;IILjava/util/List;)V
    .locals 24
    .param p0, "nodeOffset"    # J
    .param p2, "node"    # Lokio/Buffer;
    .param p3, "byteStringOffset"    # I
    .param p5, "fromIndex"    # I
    .param p6, "toIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lokio/Buffer;",
            "I",
            "Ljava/util/List<",
            "Lokio/ByteString;",
            ">;II",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 123
    .local p4, "byteStrings":Ljava/util/List;, "Ljava/util/List<Lokio/ByteString;>;"
    .local p7, "indexes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object/from16 v0, p2

    move/from16 v1, p3

    move-object/from16 v10, p4

    move/from16 v2, p5

    move/from16 v11, p6

    move-object/from16 v12, p7

    if-ge v2, v11, :cond_11

    .line 124
    move/from16 v3, p5

    .local v3, "i":I
    :goto_0
    if-ge v3, v11, :cond_1

    .line 125
    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lokio/ByteString;

    invoke-virtual {v4}, Lokio/ByteString;->size()I

    move-result v4

    if-lt v4, v1, :cond_0

    .line 124
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 125
    :cond_0
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 128
    .end local v3    # "i":I
    :cond_1
    invoke-interface/range {p4 .. p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lokio/ByteString;

    .line 129
    .local v3, "from":Lokio/ByteString;
    add-int/lit8 v4, v11, -0x1

    invoke-interface {v10, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Lokio/ByteString;

    .line 130
    .local v13, "to":Lokio/ByteString;
    const/4 v4, -0x1

    .line 133
    .local v4, "prefixIndex":I
    invoke-virtual {v3}, Lokio/ByteString;->size()I

    move-result v5

    if-ne v1, v5, :cond_2

    .line 134
    invoke-interface {v12, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 135
    add-int/lit8 v2, v2, 0x1

    .line 136
    .end local p5    # "fromIndex":I
    .local v2, "fromIndex":I
    invoke-interface {v10, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v3, v5

    check-cast v3, Lokio/ByteString;

    move v14, v2

    move-object v15, v3

    move v9, v4

    goto :goto_1

    .line 133
    .end local v2    # "fromIndex":I
    .restart local p5    # "fromIndex":I
    :cond_2
    move v14, v2

    move-object v15, v3

    move v9, v4

    .line 139
    .end local v3    # "from":Lokio/ByteString;
    .end local v4    # "prefixIndex":I
    .end local p5    # "fromIndex":I
    .local v9, "prefixIndex":I
    .local v14, "fromIndex":I
    .local v15, "from":Lokio/ByteString;
    :goto_1
    invoke-virtual {v15, v1}, Lokio/ByteString;->getByte(I)B

    move-result v2

    invoke-virtual {v13, v1}, Lokio/ByteString;->getByte(I)B

    move-result v3

    const-wide/16 v16, -0x1

    const-wide/16 v4, 0x2

    if-eq v2, v3, :cond_c

    .line 141
    const/4 v2, 0x1

    .line 142
    .local v2, "selectChoiceCount":I
    add-int/lit8 v3, v14, 0x1

    move v8, v2

    .end local v2    # "selectChoiceCount":I
    .local v3, "i":I
    .local v8, "selectChoiceCount":I
    :goto_2
    if-ge v3, v11, :cond_4

    .line 143
    add-int/lit8 v2, v3, -0x1

    invoke-interface {v10, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lokio/ByteString;

    invoke-virtual {v2, v1}, Lokio/ByteString;->getByte(I)B

    move-result v2

    .line 144
    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lokio/ByteString;

    invoke-virtual {v6, v1}, Lokio/ByteString;->getByte(I)B

    move-result v6

    if-eq v2, v6, :cond_3

    .line 145
    add-int/lit8 v8, v8, 0x1

    .line 142
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 150
    .end local v3    # "i":I
    :cond_4
    invoke-static/range {p2 .. p2}, Lokio/Options;->intCount(Lokio/Buffer;)I

    move-result v2

    int-to-long v2, v2

    add-long v2, p0, v2

    add-long/2addr v2, v4

    mul-int/lit8 v4, v8, 0x2

    int-to-long v4, v4

    add-long v18, v2, v4

    .line 152
    .local v18, "childNodesOffset":J
    invoke-virtual {v0, v8}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 153
    invoke-virtual {v0, v9}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 155
    move v2, v14

    .local v2, "i":I
    :goto_3
    if-ge v2, v11, :cond_7

    .line 156
    invoke-interface {v10, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lokio/ByteString;

    invoke-virtual {v3, v1}, Lokio/ByteString;->getByte(I)B

    move-result v3

    .line 157
    .local v3, "rangeByte":B
    if-eq v2, v14, :cond_5

    add-int/lit8 v4, v2, -0x1

    invoke-interface {v10, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lokio/ByteString;

    invoke-virtual {v4, v1}, Lokio/ByteString;->getByte(I)B

    move-result v4

    if-eq v3, v4, :cond_6

    .line 158
    :cond_5
    and-int/lit16 v4, v3, 0xff

    invoke-virtual {v0, v4}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 155
    .end local v3    # "rangeByte":B
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 162
    .end local v2    # "i":I
    :cond_7
    new-instance v2, Lokio/Buffer;

    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    move-object v7, v2

    .line 163
    .local v7, "childNodes":Lokio/Buffer;
    move v2, v14

    move v6, v2

    .line 164
    .local v6, "rangeStart":I
    :goto_4
    if-ge v6, v11, :cond_b

    .line 165
    invoke-interface {v10, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lokio/ByteString;

    invoke-virtual {v2, v1}, Lokio/ByteString;->getByte(I)B

    move-result v5

    .line 166
    .local v5, "rangeByte":B
    move/from16 v2, p6

    .line 167
    .local v2, "rangeEnd":I
    add-int/lit8 v3, v6, 0x1

    .local v3, "i":I
    :goto_5
    if-ge v3, v11, :cond_9

    .line 168
    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lokio/ByteString;

    invoke-virtual {v4, v1}, Lokio/ByteString;->getByte(I)B

    move-result v4

    if-eq v5, v4, :cond_8

    .line 169
    move v2, v3

    .line 170
    move v4, v2

    goto :goto_6

    .line 167
    :cond_8
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_9
    move v4, v2

    .line 174
    .end local v2    # "rangeEnd":I
    .end local v3    # "i":I
    .local v4, "rangeEnd":I
    :goto_6
    add-int/lit8 v2, v6, 0x1

    if-ne v2, v4, :cond_a

    add-int/lit8 v2, v1, 0x1

    .line 175
    invoke-interface {v10, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lokio/ByteString;

    invoke-virtual {v3}, Lokio/ByteString;->size()I

    move-result v3

    if-ne v2, v3, :cond_a

    .line 177
    invoke-interface {v12, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v2}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    move/from16 v21, v4

    move/from16 v22, v5

    move/from16 v20, v6

    move-object/from16 p5, v7

    move/from16 v23, v8

    move v12, v9

    goto :goto_7

    .line 180
    :cond_a
    invoke-static {v7}, Lokio/Options;->intCount(Lokio/Buffer;)I

    move-result v2

    int-to-long v2, v2

    add-long v2, v18, v2

    mul-long v2, v2, v16

    long-to-int v3, v2

    invoke-virtual {v0, v3}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 181
    add-int/lit8 v20, v1, 0x1

    move-wide/from16 v2, v18

    move/from16 v21, v4

    .end local v4    # "rangeEnd":I
    .local v21, "rangeEnd":I
    move-object v4, v7

    move/from16 v22, v5

    .end local v5    # "rangeByte":B
    .local v22, "rangeByte":B
    move/from16 v5, v20

    move/from16 v20, v6

    .end local v6    # "rangeStart":I
    .local v20, "rangeStart":I
    move-object/from16 v6, p4

    move-object/from16 p5, v7

    .end local v7    # "childNodes":Lokio/Buffer;
    .local p5, "childNodes":Lokio/Buffer;
    move/from16 v7, v20

    move/from16 v23, v8

    .end local v8    # "selectChoiceCount":I
    .local v23, "selectChoiceCount":I
    move/from16 v8, v21

    move v12, v9

    .end local v9    # "prefixIndex":I
    .local v12, "prefixIndex":I
    move-object/from16 v9, p7

    invoke-static/range {v2 .. v9}, Lokio/Options;->buildTrieRecursive(JLokio/Buffer;ILjava/util/List;IILjava/util/List;)V

    .line 191
    :goto_7
    move/from16 v6, v21

    .line 192
    .end local v20    # "rangeStart":I
    .end local v21    # "rangeEnd":I
    .end local v22    # "rangeByte":B
    .restart local v6    # "rangeStart":I
    move-object/from16 v7, p5

    move v9, v12

    move/from16 v8, v23

    move-object/from16 v12, p7

    goto/16 :goto_4

    .line 194
    .end local v12    # "prefixIndex":I
    .end local v23    # "selectChoiceCount":I
    .end local p5    # "childNodes":Lokio/Buffer;
    .restart local v7    # "childNodes":Lokio/Buffer;
    .restart local v8    # "selectChoiceCount":I
    .restart local v9    # "prefixIndex":I
    :cond_b
    move/from16 v20, v6

    move-object/from16 p5, v7

    move/from16 v23, v8

    move v12, v9

    .end local v6    # "rangeStart":I
    .end local v7    # "childNodes":Lokio/Buffer;
    .end local v8    # "selectChoiceCount":I
    .end local v9    # "prefixIndex":I
    .restart local v12    # "prefixIndex":I
    .restart local v20    # "rangeStart":I
    .restart local v23    # "selectChoiceCount":I
    .restart local p5    # "childNodes":Lokio/Buffer;
    invoke-virtual/range {p5 .. p5}, Lokio/Buffer;->size()J

    move-result-wide v2

    move-object/from16 v4, p5

    .end local p5    # "childNodes":Lokio/Buffer;
    .local v4, "childNodes":Lokio/Buffer;
    invoke-virtual {v0, v4, v2, v3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 196
    .end local v4    # "childNodes":Lokio/Buffer;
    .end local v18    # "childNodesOffset":J
    .end local v20    # "rangeStart":I
    .end local v23    # "selectChoiceCount":I
    move/from16 v20, v12

    move-object/from16 v12, p7

    goto/16 :goto_a

    .line 198
    .end local v12    # "prefixIndex":I
    .restart local v9    # "prefixIndex":I
    :cond_c
    move v12, v9

    .end local v9    # "prefixIndex":I
    .restart local v12    # "prefixIndex":I
    const/4 v2, 0x0

    .line 199
    .local v2, "scanByteCount":I
    move/from16 v3, p3

    .restart local v3    # "i":I
    invoke-virtual {v15}, Lokio/ByteString;->size()I

    move-result v6

    invoke-virtual {v13}, Lokio/ByteString;->size()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    move v9, v2

    .end local v2    # "scanByteCount":I
    .local v6, "max":I
    .local v9, "scanByteCount":I
    :goto_8
    if-ge v3, v6, :cond_d

    .line 200
    invoke-virtual {v15, v3}, Lokio/ByteString;->getByte(I)B

    move-result v2

    invoke-virtual {v13, v3}, Lokio/ByteString;->getByte(I)B

    move-result v7

    if-ne v2, v7, :cond_d

    .line 201
    add-int/lit8 v9, v9, 0x1

    .line 199
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 208
    .end local v3    # "i":I
    .end local v6    # "max":I
    :cond_d
    invoke-static/range {p2 .. p2}, Lokio/Options;->intCount(Lokio/Buffer;)I

    move-result v2

    int-to-long v2, v2

    add-long v2, p0, v2

    add-long/2addr v2, v4

    int-to-long v4, v9

    add-long/2addr v2, v4

    const-wide/16 v4, 0x1

    add-long v18, v2, v4

    .line 210
    .restart local v18    # "childNodesOffset":J
    neg-int v2, v9

    invoke-virtual {v0, v2}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 211
    invoke-virtual {v0, v12}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 213
    move/from16 v2, p3

    .local v2, "i":I
    :goto_9
    add-int v3, v1, v9

    if-ge v2, v3, :cond_e

    .line 214
    invoke-virtual {v15, v2}, Lokio/ByteString;->getByte(I)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v0, v3}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 213
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 217
    .end local v2    # "i":I
    :cond_e
    add-int/lit8 v2, v14, 0x1

    if-ne v2, v11, :cond_10

    .line 219
    add-int v2, v1, v9

    invoke-interface {v10, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lokio/ByteString;

    invoke-virtual {v3}, Lokio/ByteString;->size()I

    move-result v3

    if-ne v2, v3, :cond_f

    .line 222
    move/from16 v20, v12

    move-object/from16 v12, p7

    .end local v12    # "prefixIndex":I
    .local v20, "prefixIndex":I
    invoke-interface {v12, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v2}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    goto :goto_a

    .line 220
    .end local v20    # "prefixIndex":I
    .restart local v12    # "prefixIndex":I
    :cond_f
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 225
    :cond_10
    move/from16 v20, v12

    move-object/from16 v12, p7

    .end local v12    # "prefixIndex":I
    .restart local v20    # "prefixIndex":I
    new-instance v2, Lokio/Buffer;

    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    move-object v8, v2

    .line 226
    .local v8, "childNodes":Lokio/Buffer;
    invoke-static {v8}, Lokio/Options;->intCount(Lokio/Buffer;)I

    move-result v2

    int-to-long v2, v2

    add-long v2, v18, v2

    mul-long v2, v2, v16

    long-to-int v3, v2

    invoke-virtual {v0, v3}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 227
    add-int v5, v1, v9

    move-wide/from16 v2, v18

    move-object v4, v8

    move-object/from16 v6, p4

    move v7, v14

    move-object/from16 p5, v8

    .end local v8    # "childNodes":Lokio/Buffer;
    .restart local p5    # "childNodes":Lokio/Buffer;
    move/from16 v8, p6

    move/from16 v16, v9

    .end local v9    # "scanByteCount":I
    .local v16, "scanByteCount":I
    move-object/from16 v9, p7

    invoke-static/range {v2 .. v9}, Lokio/Options;->buildTrieRecursive(JLokio/Buffer;ILjava/util/List;IILjava/util/List;)V

    .line 235
    invoke-virtual/range {p5 .. p5}, Lokio/Buffer;->size()J

    move-result-wide v2

    move-object/from16 v4, p5

    .end local p5    # "childNodes":Lokio/Buffer;
    .restart local v4    # "childNodes":Lokio/Buffer;
    invoke-virtual {v0, v4, v2, v3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 238
    .end local v4    # "childNodes":Lokio/Buffer;
    .end local v16    # "scanByteCount":I
    .end local v18    # "childNodesOffset":J
    :goto_a
    return-void

    .line 123
    .end local v13    # "to":Lokio/ByteString;
    .end local v14    # "fromIndex":I
    .end local v15    # "from":Lokio/ByteString;
    .end local v20    # "prefixIndex":I
    .local p5, "fromIndex":I
    :cond_11
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    goto :goto_c

    :goto_b
    throw v3

    :goto_c
    goto :goto_b
.end method

.method private static intCount(Lokio/Buffer;)I
    .locals 4
    .param p0, "trieBytes"    # Lokio/Buffer;

    .line 249
    invoke-virtual {p0}, Lokio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x4

    div-long/2addr v0, v2

    long-to-int v1, v0

    return v1
.end method

.method public static varargs of([Lokio/ByteString;)Lokio/Options;
    .locals 11
    .param p0, "byteStrings"    # [Lokio/ByteString;

    .line 36
    array-length v0, p0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 38
    new-instance v0, Lokio/Options;

    new-array v1, v1, [Lokio/ByteString;

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-direct {v0, v1, v2}, Lokio/Options;-><init>([Lokio/ByteString;[I)V

    return-object v0

    .line 43
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 44
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lokio/ByteString;>;"
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 45
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .local v2, "indexes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 47
    const/4 v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 49
    .end local v3    # "i":I
    :cond_1
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 50
    aget-object v4, p0, v3

    invoke-static {v0, v4}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v4

    .line 51
    .local v4, "sortedIndex":I
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 49
    .end local v4    # "sortedIndex":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 53
    .end local v3    # "i":I
    :cond_2
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lokio/ByteString;

    invoke-virtual {v1}, Lokio/ByteString;->size()I

    move-result v1

    if-eqz v1, :cond_a

    .line 60
    const/4 v1, 0x0

    .local v1, "a":I
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_7

    .line 61
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lokio/ByteString;

    .line 62
    .local v3, "prefix":Lokio/ByteString;
    add-int/lit8 v4, v1, 0x1

    .local v4, "b":I
    :goto_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_6

    .line 63
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lokio/ByteString;

    .line 64
    .local v5, "byteString":Lokio/ByteString;
    invoke-virtual {v5, v3}, Lokio/ByteString;->startsWith(Lokio/ByteString;)Z

    move-result v6

    if-nez v6, :cond_3

    goto :goto_5

    .line 65
    :cond_3
    invoke-virtual {v5}, Lokio/ByteString;->size()I

    move-result v6

    invoke-virtual {v3}, Lokio/ByteString;->size()I

    move-result v7

    if-eq v6, v7, :cond_5

    .line 68
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-le v6, v7, :cond_4

    .line 69
    invoke-interface {v0, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 70
    invoke-interface {v2, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_4

    .line 72
    :cond_4
    add-int/lit8 v4, v4, 0x1

    .line 74
    .end local v5    # "byteString":Lokio/ByteString;
    :goto_4
    goto :goto_3

    .line 66
    .restart local v5    # "byteString":Lokio/ByteString;
    :cond_5
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "duplicate option: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 60
    .end local v3    # "prefix":Lokio/ByteString;
    .end local v4    # "b":I
    .end local v5    # "byteString":Lokio/ByteString;
    :cond_6
    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 77
    .end local v1    # "a":I
    :cond_7
    new-instance v5, Lokio/Buffer;

    invoke-direct {v5}, Lokio/Buffer;-><init>()V

    .line 78
    .local v5, "trieBytes":Lokio/Buffer;
    const-wide/16 v3, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v9

    move-object v7, v0

    move-object v10, v2

    invoke-static/range {v3 .. v10}, Lokio/Options;->buildTrieRecursive(JLokio/Buffer;ILjava/util/List;IILjava/util/List;)V

    .line 80
    invoke-static {v5}, Lokio/Options;->intCount(Lokio/Buffer;)I

    move-result v1

    new-array v1, v1, [I

    .line 81
    .local v1, "trie":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    array-length v4, v1

    if-ge v3, v4, :cond_8

    .line 82
    invoke-virtual {v5}, Lokio/Buffer;->readInt()I

    move-result v4

    aput v4, v1, v3

    .line 81
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 84
    .end local v3    # "i":I
    :cond_8
    invoke-virtual {v5}, Lokio/Buffer;->exhausted()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 88
    new-instance v3, Lokio/Options;

    invoke-virtual {p0}, [Lokio/ByteString;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lokio/ByteString;

    invoke-direct {v3, v4, v1}, Lokio/Options;-><init>([Lokio/ByteString;[I)V

    return-object v3

    .line 85
    :cond_9
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 54
    .end local v1    # "trie":[I
    .end local v5    # "trieBytes":Lokio/Buffer;
    :cond_a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v3, "the empty byte string is not a supported option"

    invoke-direct {v1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_8

    :goto_7
    throw v1

    :goto_8
    goto :goto_7

    nop

    :array_0
    .array-data 4
        0x0
        -0x1
    .end array-data
.end method


# virtual methods
.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 26
    invoke-virtual {p0, p1}, Lokio/Options;->get(I)Lokio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public get(I)Lokio/ByteString;
    .locals 1
    .param p1, "i"    # I

    .line 241
    iget-object v0, p0, Lokio/Options;->byteStrings:[Lokio/ByteString;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public final size()I
    .locals 1

    .line 245
    iget-object v0, p0, Lokio/Options;->byteStrings:[Lokio/ByteString;

    array-length v0, v0

    return v0
.end method
