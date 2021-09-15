.class public Landroidx/constraintlayout/core/parser/CLParser;
.super Ljava/lang/Object;
.source "CLParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/core/parser/CLParser$TYPE;
    }
.end annotation


# static fields
.field static DEBUG:Z


# instance fields
.field private hasComment:Z

.field private lineNumber:I

.field private mContent:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    const/4 v0, 0x0

    sput-boolean v0, Landroidx/constraintlayout/core/parser/CLParser;->DEBUG:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "content"    # Ljava/lang/String;

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/constraintlayout/core/parser/CLParser;->hasComment:Z

    .line 33
    iput-object p1, p0, Landroidx/constraintlayout/core/parser/CLParser;->mContent:Ljava/lang/String;

    .line 34
    return-void
.end method

.method private createElement(Landroidx/constraintlayout/core/parser/CLElement;ILandroidx/constraintlayout/core/parser/CLParser$TYPE;Z[C)Landroidx/constraintlayout/core/parser/CLElement;
    .locals 4
    .param p1, "currentElement"    # Landroidx/constraintlayout/core/parser/CLElement;
    .param p2, "position"    # I
    .param p3, "type"    # Landroidx/constraintlayout/core/parser/CLParser$TYPE;
    .param p4, "applyStart"    # Z
    .param p5, "content"    # [C

    .line 230
    const/4 v0, 0x0

    .line 231
    .local v0, "newElement":Landroidx/constraintlayout/core/parser/CLElement;
    sget-boolean v1, Landroidx/constraintlayout/core/parser/CLParser;->DEBUG:Z

    if-eqz v1, :cond_0

    .line 232
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CREATE "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-char v3, p5, p2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 234
    :cond_0
    sget-object v1, Landroidx/constraintlayout/core/parser/CLParser$1;->$SwitchMap$androidx$constraintlayout$core$parser$CLParser$TYPE:[I

    invoke-virtual {p3}, Landroidx/constraintlayout/core/parser/CLParser$TYPE;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 258
    :pswitch_0
    invoke-static {p5}, Landroidx/constraintlayout/core/parser/CLToken;->allocate([C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object v0

    .line 260
    goto :goto_0

    .line 254
    :pswitch_1
    invoke-static {p5}, Landroidx/constraintlayout/core/parser/CLKey;->allocate([C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object v0

    .line 256
    goto :goto_0

    .line 250
    :pswitch_2
    invoke-static {p5}, Landroidx/constraintlayout/core/parser/CLNumber;->allocate([C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object v0

    .line 252
    goto :goto_0

    .line 246
    :pswitch_3
    invoke-static {p5}, Landroidx/constraintlayout/core/parser/CLString;->allocate([C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object v0

    .line 248
    goto :goto_0

    .line 241
    :pswitch_4
    invoke-static {p5}, Landroidx/constraintlayout/core/parser/CLArray;->allocate([C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object v0

    .line 242
    add-int/lit8 p2, p2, 0x1

    .line 244
    goto :goto_0

    .line 236
    :pswitch_5
    invoke-static {p5}, Landroidx/constraintlayout/core/parser/CLObject;->allocate([C)Landroidx/constraintlayout/core/parser/CLObject;

    move-result-object v0

    .line 237
    add-int/lit8 p2, p2, 0x1

    .line 239
    nop

    .line 263
    :goto_0
    if-nez v0, :cond_1

    .line 264
    const/4 v1, 0x0

    return-object v1

    .line 266
    :cond_1
    iget v1, p0, Landroidx/constraintlayout/core/parser/CLParser;->lineNumber:I

    invoke-virtual {v0, v1}, Landroidx/constraintlayout/core/parser/CLElement;->setLine(I)V

    .line 267
    if-eqz p4, :cond_2

    .line 268
    int-to-long v1, p2

    invoke-virtual {v0, v1, v2}, Landroidx/constraintlayout/core/parser/CLElement;->setStart(J)V

    .line 270
    :cond_2
    instance-of v1, p1, Landroidx/constraintlayout/core/parser/CLContainer;

    if-eqz v1, :cond_3

    .line 271
    move-object v1, p1

    check-cast v1, Landroidx/constraintlayout/core/parser/CLContainer;

    .line 272
    .local v1, "container":Landroidx/constraintlayout/core/parser/CLContainer;
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/core/parser/CLElement;->setContainer(Landroidx/constraintlayout/core/parser/CLContainer;)V

    .line 274
    .end local v1    # "container":Landroidx/constraintlayout/core/parser/CLContainer;
    :cond_3
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getNextJsonElement(ICLandroidx/constraintlayout/core/parser/CLElement;[C)Landroidx/constraintlayout/core/parser/CLElement;
    .locals 9
    .param p1, "position"    # I
    .param p2, "c"    # C
    .param p3, "currentElement"    # Landroidx/constraintlayout/core/parser/CLElement;
    .param p4, "content"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/constraintlayout/core/parser/CLParsingException;
        }
    .end annotation

    .line 159
    sparse-switch p2, :sswitch_data_0

    .line 214
    instance-of v0, p3, Landroidx/constraintlayout/core/parser/CLContainer;

    if-eqz v0, :cond_2

    instance-of v0, p3, Landroidx/constraintlayout/core/parser/CLObject;

    if-nez v0, :cond_2

    .line 215
    sget-object v4, Landroidx/constraintlayout/core/parser/CLParser$TYPE;->TOKEN:Landroidx/constraintlayout/core/parser/CLParser$TYPE;

    const/4 v5, 0x1

    move-object v1, p0

    move-object v2, p3

    move v3, p1

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Landroidx/constraintlayout/core/parser/CLParser;->createElement(Landroidx/constraintlayout/core/parser/CLElement;ILandroidx/constraintlayout/core/parser/CLParser$TYPE;Z[C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object p3

    .line 216
    move-object v0, p3

    check-cast v0, Landroidx/constraintlayout/core/parser/CLToken;

    .line 217
    .local v0, "token":Landroidx/constraintlayout/core/parser/CLToken;
    int-to-long v1, p1

    invoke-virtual {v0, p2, v1, v2}, Landroidx/constraintlayout/core/parser/CLToken;->validate(CJ)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 220
    .end local v0    # "token":Landroidx/constraintlayout/core/parser/CLToken;
    goto/16 :goto_0

    .line 170
    :sswitch_0
    sget-object v3, Landroidx/constraintlayout/core/parser/CLParser$TYPE;->OBJECT:Landroidx/constraintlayout/core/parser/CLParser$TYPE;

    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p3

    move v2, p1

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Landroidx/constraintlayout/core/parser/CLParser;->createElement(Landroidx/constraintlayout/core/parser/CLElement;ILandroidx/constraintlayout/core/parser/CLParser$TYPE;Z[C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object p3

    .line 172
    goto/16 :goto_0

    .line 179
    :sswitch_1
    add-int/lit8 v0, p1, -0x1

    int-to-long v0, v0

    invoke-virtual {p3, v0, v1}, Landroidx/constraintlayout/core/parser/CLElement;->setEnd(J)V

    .line 180
    invoke-virtual {p3}, Landroidx/constraintlayout/core/parser/CLElement;->getContainer()Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object p3

    .line 181
    int-to-long v0, p1

    invoke-virtual {p3, v0, v1}, Landroidx/constraintlayout/core/parser/CLElement;->setEnd(J)V

    .line 182
    goto/16 :goto_0

    .line 174
    :sswitch_2
    sget-object v5, Landroidx/constraintlayout/core/parser/CLParser$TYPE;->ARRAY:Landroidx/constraintlayout/core/parser/CLParser$TYPE;

    const/4 v6, 0x1

    move-object v2, p0

    move-object v3, p3

    move v4, p1

    move-object v7, p4

    invoke-direct/range {v2 .. v7}, Landroidx/constraintlayout/core/parser/CLParser;->createElement(Landroidx/constraintlayout/core/parser/CLElement;ILandroidx/constraintlayout/core/parser/CLParser$TYPE;Z[C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object p3

    .line 176
    goto/16 :goto_0

    .line 192
    :sswitch_3
    add-int/lit8 v0, p1, 0x1

    array-length v1, p4

    if-ge v0, v1, :cond_3

    add-int/lit8 v0, p1, 0x1

    aget-char v0, p4, v0

    const/16 v1, 0x2f

    if-ne v0, v1, :cond_3

    .line 193
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/constraintlayout/core/parser/CLParser;->hasComment:Z

    goto/16 :goto_0

    .line 210
    :sswitch_4
    sget-object v4, Landroidx/constraintlayout/core/parser/CLParser$TYPE;->NUMBER:Landroidx/constraintlayout/core/parser/CLParser$TYPE;

    const/4 v5, 0x1

    move-object v1, p0

    move-object v2, p3

    move v3, p1

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Landroidx/constraintlayout/core/parser/CLParser;->createElement(Landroidx/constraintlayout/core/parser/CLElement;ILandroidx/constraintlayout/core/parser/CLParser$TYPE;Z[C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object p3

    .line 212
    goto :goto_0

    .line 185
    :sswitch_5
    instance-of v0, p3, Landroidx/constraintlayout/core/parser/CLObject;

    if-eqz v0, :cond_0

    .line 186
    sget-object v4, Landroidx/constraintlayout/core/parser/CLParser$TYPE;->KEY:Landroidx/constraintlayout/core/parser/CLParser$TYPE;

    const/4 v5, 0x1

    move-object v1, p0

    move-object v2, p3

    move v3, p1

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Landroidx/constraintlayout/core/parser/CLParser;->createElement(Landroidx/constraintlayout/core/parser/CLElement;ILandroidx/constraintlayout/core/parser/CLParser$TYPE;Z[C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object p3

    goto :goto_0

    .line 188
    :cond_0
    sget-object v3, Landroidx/constraintlayout/core/parser/CLParser$TYPE;->STRING:Landroidx/constraintlayout/core/parser/CLParser$TYPE;

    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p3

    move v2, p1

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Landroidx/constraintlayout/core/parser/CLParser;->createElement(Landroidx/constraintlayout/core/parser/CLElement;ILandroidx/constraintlayout/core/parser/CLParser$TYPE;Z[C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object p3

    .line 190
    goto :goto_0

    .line 168
    :sswitch_6
    goto :goto_0

    .line 218
    .restart local v0    # "token":Landroidx/constraintlayout/core/parser/CLToken;
    :cond_1
    new-instance v1, Landroidx/constraintlayout/core/parser/CLParsingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "incorrect token <"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v3, "> at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Landroidx/constraintlayout/core/parser/CLParser;->lineNumber:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Landroidx/constraintlayout/core/parser/CLParsingException;-><init>(Ljava/lang/String;Landroidx/constraintlayout/core/parser/CLElement;)V

    throw v1

    .line 221
    .end local v0    # "token":Landroidx/constraintlayout/core/parser/CLToken;
    :cond_2
    sget-object v6, Landroidx/constraintlayout/core/parser/CLParser$TYPE;->KEY:Landroidx/constraintlayout/core/parser/CLParser$TYPE;

    const/4 v7, 0x1

    move-object v3, p0

    move-object v4, p3

    move v5, p1

    move-object v8, p4

    invoke-direct/range {v3 .. v8}, Landroidx/constraintlayout/core/parser/CLParser;->createElement(Landroidx/constraintlayout/core/parser/CLElement;ILandroidx/constraintlayout/core/parser/CLParser$TYPE;Z[C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object p3

    .line 225
    :cond_3
    :goto_0
    return-object p3

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_6
        0xa -> :sswitch_6
        0xd -> :sswitch_6
        0x20 -> :sswitch_6
        0x22 -> :sswitch_5
        0x27 -> :sswitch_5
        0x2b -> :sswitch_4
        0x2c -> :sswitch_6
        0x2d -> :sswitch_4
        0x2e -> :sswitch_4
        0x2f -> :sswitch_3
        0x30 -> :sswitch_4
        0x31 -> :sswitch_4
        0x32 -> :sswitch_4
        0x33 -> :sswitch_4
        0x34 -> :sswitch_4
        0x35 -> :sswitch_4
        0x36 -> :sswitch_4
        0x37 -> :sswitch_4
        0x38 -> :sswitch_4
        0x39 -> :sswitch_4
        0x3a -> :sswitch_6
        0x5b -> :sswitch_2
        0x5d -> :sswitch_1
        0x7b -> :sswitch_0
        0x7d -> :sswitch_1
    .end sparse-switch
.end method

.method public static parse(Ljava/lang/String;)Landroidx/constraintlayout/core/parser/CLObject;
    .locals 1
    .param p0, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/constraintlayout/core/parser/CLParsingException;
        }
    .end annotation

    .line 29
    new-instance v0, Landroidx/constraintlayout/core/parser/CLParser;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/core/parser/CLParser;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroidx/constraintlayout/core/parser/CLParser;->parse()Landroidx/constraintlayout/core/parser/CLObject;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public parse()Landroidx/constraintlayout/core/parser/CLObject;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/constraintlayout/core/parser/CLParsingException;
        }
    .end annotation

    .line 37
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 39
    .local v1, "root":Landroidx/constraintlayout/core/parser/CLObject;
    iget-object v2, v0, Landroidx/constraintlayout/core/parser/CLParser;->mContent:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 40
    .local v2, "content":[C
    const/4 v3, 0x0

    .line 42
    .local v3, "currentElement":Landroidx/constraintlayout/core/parser/CLElement;
    array-length v4, v2

    .line 45
    .local v4, "length":I
    const/4 v5, 0x1

    iput v5, v0, Landroidx/constraintlayout/core/parser/CLParser;->lineNumber:I

    .line 47
    const/4 v6, -0x1

    .line 48
    .local v6, "startIndex":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    const/16 v8, 0xa

    if-ge v7, v4, :cond_2

    .line 49
    aget-char v9, v2, v7

    .line 50
    .local v9, "c":C
    const/16 v10, 0x7b

    if-ne v9, v10, :cond_0

    .line 51
    move v6, v7

    .line 52
    goto :goto_1

    .line 54
    :cond_0
    if-ne v9, v8, :cond_1

    .line 55
    iget v8, v0, Landroidx/constraintlayout/core/parser/CLParser;->lineNumber:I

    add-int/2addr v8, v5

    iput v8, v0, Landroidx/constraintlayout/core/parser/CLParser;->lineNumber:I

    .line 48
    .end local v9    # "c":C
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 58
    .end local v7    # "i":I
    :cond_2
    :goto_1
    const/4 v7, -0x1

    if-eq v6, v7, :cond_20

    .line 63
    invoke-static {v2}, Landroidx/constraintlayout/core/parser/CLObject;->allocate([C)Landroidx/constraintlayout/core/parser/CLObject;

    move-result-object v1

    .line 64
    iget v7, v0, Landroidx/constraintlayout/core/parser/CLParser;->lineNumber:I

    invoke-virtual {v1, v7}, Landroidx/constraintlayout/core/parser/CLObject;->setLine(I)V

    .line 65
    int-to-long v9, v6

    invoke-virtual {v1, v9, v10}, Landroidx/constraintlayout/core/parser/CLObject;->setStart(J)V

    .line 66
    move-object v3, v1

    .line 68
    add-int/lit8 v7, v6, 0x1

    .restart local v7    # "i":I
    :goto_2
    if-ge v7, v4, :cond_1c

    .line 69
    aget-char v9, v2, v7

    .line 70
    .restart local v9    # "c":C
    if-ne v9, v8, :cond_3

    .line 71
    iget v10, v0, Landroidx/constraintlayout/core/parser/CLParser;->lineNumber:I

    add-int/2addr v10, v5

    iput v10, v0, Landroidx/constraintlayout/core/parser/CLParser;->lineNumber:I

    .line 73
    :cond_3
    iget-boolean v10, v0, Landroidx/constraintlayout/core/parser/CLParser;->hasComment:Z

    if-eqz v10, :cond_5

    .line 74
    if-ne v9, v8, :cond_4

    .line 75
    const/4 v10, 0x0

    iput-boolean v10, v0, Landroidx/constraintlayout/core/parser/CLParser;->hasComment:Z

    goto :goto_3

    .line 74
    :cond_4
    move v15, v6

    const/16 v5, 0xa

    goto/16 :goto_a

    .line 83
    :cond_5
    :goto_3
    if-nez v3, :cond_6

    .line 84
    move v15, v6

    goto/16 :goto_b

    .line 86
    :cond_6
    invoke-virtual {v3}, Landroidx/constraintlayout/core/parser/CLElement;->isDone()Z

    move-result v10

    if-eqz v10, :cond_7

    .line 87
    invoke-direct {v0, v7, v9, v3, v2}, Landroidx/constraintlayout/core/parser/CLParser;->getNextJsonElement(ICLandroidx/constraintlayout/core/parser/CLElement;[C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object v3

    move v15, v6

    move v6, v9

    const/16 v5, 0xa

    goto/16 :goto_9

    .line 88
    :cond_7
    instance-of v10, v3, Landroidx/constraintlayout/core/parser/CLObject;

    const/16 v11, 0x7d

    if-eqz v10, :cond_9

    .line 89
    if-ne v9, v11, :cond_8

    .line 90
    add-int/lit8 v10, v7, -0x1

    int-to-long v10, v10

    invoke-virtual {v3, v10, v11}, Landroidx/constraintlayout/core/parser/CLElement;->setEnd(J)V

    move v15, v6

    move v6, v9

    const/16 v5, 0xa

    goto/16 :goto_9

    .line 92
    :cond_8
    invoke-direct {v0, v7, v9, v3, v2}, Landroidx/constraintlayout/core/parser/CLParser;->getNextJsonElement(ICLandroidx/constraintlayout/core/parser/CLElement;[C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object v3

    move v15, v6

    move v6, v9

    const/16 v5, 0xa

    goto/16 :goto_9

    .line 94
    :cond_9
    instance-of v10, v3, Landroidx/constraintlayout/core/parser/CLArray;

    const/16 v12, 0x5d

    if-eqz v10, :cond_b

    .line 95
    if-ne v9, v12, :cond_a

    .line 96
    add-int/lit8 v10, v7, -0x1

    int-to-long v10, v10

    invoke-virtual {v3, v10, v11}, Landroidx/constraintlayout/core/parser/CLElement;->setEnd(J)V

    move v15, v6

    move v6, v9

    const/16 v5, 0xa

    goto/16 :goto_9

    .line 98
    :cond_a
    invoke-direct {v0, v7, v9, v3, v2}, Landroidx/constraintlayout/core/parser/CLParser;->getNextJsonElement(ICLandroidx/constraintlayout/core/parser/CLElement;[C)Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object v3

    move v15, v6

    move v6, v9

    const/16 v5, 0xa

    goto/16 :goto_9

    .line 100
    :cond_b
    instance-of v10, v3, Landroidx/constraintlayout/core/parser/CLString;

    const-wide/16 v13, 0x1

    if-eqz v10, :cond_d

    .line 101
    iget-wide v10, v3, Landroidx/constraintlayout/core/parser/CLElement;->start:J

    long-to-int v11, v10

    aget-char v10, v2, v11

    .line 102
    .local v10, "ck":C
    if-ne v10, v9, :cond_c

    .line 103
    iget-wide v11, v3, Landroidx/constraintlayout/core/parser/CLElement;->start:J

    add-long/2addr v11, v13

    invoke-virtual {v3, v11, v12}, Landroidx/constraintlayout/core/parser/CLElement;->setStart(J)V

    .line 104
    add-int/lit8 v11, v7, -0x1

    int-to-long v11, v11

    invoke-virtual {v3, v11, v12}, Landroidx/constraintlayout/core/parser/CLElement;->setEnd(J)V

    .line 106
    .end local v10    # "ck":C
    :cond_c
    move v15, v6

    move v6, v9

    const/16 v5, 0xa

    goto/16 :goto_9

    .line 107
    :cond_d
    instance-of v10, v3, Landroidx/constraintlayout/core/parser/CLToken;

    if-eqz v10, :cond_f

    .line 108
    move-object v10, v3

    check-cast v10, Landroidx/constraintlayout/core/parser/CLToken;

    .line 109
    .local v10, "token":Landroidx/constraintlayout/core/parser/CLToken;
    move v15, v6

    .end local v6    # "startIndex":I
    .local v15, "startIndex":I
    int-to-long v5, v7

    invoke-virtual {v10, v9, v5, v6}, Landroidx/constraintlayout/core/parser/CLToken;->validate(CJ)Z

    move-result v5

    if-eqz v5, :cond_e

    goto :goto_4

    .line 110
    :cond_e
    new-instance v5, Landroidx/constraintlayout/core/parser/CLParsingException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "parsing incorrect token "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Landroidx/constraintlayout/core/parser/CLToken;->content()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " at line "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v8, v0, Landroidx/constraintlayout/core/parser/CLParser;->lineNumber:I

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v10}, Landroidx/constraintlayout/core/parser/CLParsingException;-><init>(Ljava/lang/String;Landroidx/constraintlayout/core/parser/CLElement;)V

    throw v5

    .line 107
    .end local v10    # "token":Landroidx/constraintlayout/core/parser/CLToken;
    .end local v15    # "startIndex":I
    .restart local v6    # "startIndex":I
    :cond_f
    move v15, v6

    .line 114
    .end local v6    # "startIndex":I
    .restart local v15    # "startIndex":I
    :goto_4
    instance-of v5, v3, Landroidx/constraintlayout/core/parser/CLKey;

    if-nez v5, :cond_11

    instance-of v5, v3, Landroidx/constraintlayout/core/parser/CLString;

    if-eqz v5, :cond_10

    goto :goto_5

    :cond_10
    move v6, v9

    goto :goto_7

    .line 115
    :cond_11
    :goto_5
    iget-wide v5, v3, Landroidx/constraintlayout/core/parser/CLElement;->start:J

    long-to-int v6, v5

    aget-char v5, v2, v6

    .line 116
    .local v5, "ck":C
    const/16 v6, 0x27

    if-eq v5, v6, :cond_13

    const/16 v6, 0x22

    if-ne v5, v6, :cond_12

    goto :goto_6

    :cond_12
    move v6, v9

    goto :goto_7

    :cond_13
    :goto_6
    if-ne v5, v9, :cond_14

    .line 117
    move v6, v9

    .end local v9    # "c":C
    .local v6, "c":C
    iget-wide v8, v3, Landroidx/constraintlayout/core/parser/CLElement;->start:J

    add-long/2addr v8, v13

    invoke-virtual {v3, v8, v9}, Landroidx/constraintlayout/core/parser/CLElement;->setStart(J)V

    .line 118
    add-int/lit8 v8, v7, -0x1

    int-to-long v8, v8

    invoke-virtual {v3, v8, v9}, Landroidx/constraintlayout/core/parser/CLElement;->setEnd(J)V

    goto :goto_7

    .line 116
    .end local v6    # "c":C
    .restart local v9    # "c":C
    :cond_14
    move v6, v9

    .line 121
    .end local v5    # "ck":C
    .end local v9    # "c":C
    .restart local v6    # "c":C
    :goto_7
    invoke-virtual {v3}, Landroidx/constraintlayout/core/parser/CLElement;->isDone()Z

    move-result v5

    if-nez v5, :cond_18

    .line 122
    if-eq v6, v11, :cond_15

    if-eq v6, v12, :cond_15

    const/16 v5, 0x2c

    if-eq v6, v5, :cond_15

    const/16 v5, 0x20

    if-eq v6, v5, :cond_15

    const/16 v5, 0x9

    if-eq v6, v5, :cond_15

    const/16 v5, 0xd

    if-eq v6, v5, :cond_15

    const/16 v5, 0xa

    if-eq v6, v5, :cond_16

    const/16 v8, 0x3a

    if-ne v6, v8, :cond_19

    goto :goto_8

    :cond_15
    const/16 v5, 0xa

    .line 123
    :cond_16
    :goto_8
    add-int/lit8 v8, v7, -0x1

    int-to-long v8, v8

    invoke-virtual {v3, v8, v9}, Landroidx/constraintlayout/core/parser/CLElement;->setEnd(J)V

    .line 124
    if-eq v6, v11, :cond_17

    if-ne v6, v12, :cond_19

    .line 125
    :cond_17
    invoke-virtual {v3}, Landroidx/constraintlayout/core/parser/CLElement;->getContainer()Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object v3

    .line 126
    add-int/lit8 v8, v7, -0x1

    int-to-long v8, v8

    invoke-virtual {v3, v8, v9}, Landroidx/constraintlayout/core/parser/CLElement;->setEnd(J)V

    .line 127
    instance-of v8, v3, Landroidx/constraintlayout/core/parser/CLKey;

    if-eqz v8, :cond_19

    .line 128
    invoke-virtual {v3}, Landroidx/constraintlayout/core/parser/CLElement;->getContainer()Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object v3

    .line 129
    add-int/lit8 v8, v7, -0x1

    int-to-long v8, v8

    invoke-virtual {v3, v8, v9}, Landroidx/constraintlayout/core/parser/CLElement;->setEnd(J)V

    goto :goto_9

    .line 121
    :cond_18
    const/16 v5, 0xa

    .line 136
    :cond_19
    :goto_9
    invoke-virtual {v3}, Landroidx/constraintlayout/core/parser/CLElement;->isDone()Z

    move-result v8

    if-eqz v8, :cond_1b

    instance-of v8, v3, Landroidx/constraintlayout/core/parser/CLKey;

    if-eqz v8, :cond_1a

    move-object v8, v3

    check-cast v8, Landroidx/constraintlayout/core/parser/CLKey;

    iget-object v8, v8, Landroidx/constraintlayout/core/parser/CLKey;->mElements:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_1b

    .line 137
    :cond_1a
    invoke-virtual {v3}, Landroidx/constraintlayout/core/parser/CLElement;->getContainer()Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object v3

    .line 68
    .end local v6    # "c":C
    :cond_1b
    :goto_a
    add-int/lit8 v7, v7, 0x1

    move v6, v15

    const/4 v5, 0x1

    const/16 v8, 0xa

    goto/16 :goto_2

    .end local v15    # "startIndex":I
    .local v6, "startIndex":I
    :cond_1c
    move v15, v6

    .line 142
    .end local v6    # "startIndex":I
    .end local v7    # "i":I
    .restart local v15    # "startIndex":I
    :goto_b
    if-eqz v3, :cond_1e

    invoke-virtual {v3}, Landroidx/constraintlayout/core/parser/CLElement;->isDone()Z

    move-result v5

    if-nez v5, :cond_1e

    .line 143
    instance-of v5, v3, Landroidx/constraintlayout/core/parser/CLString;

    if-eqz v5, :cond_1d

    .line 144
    iget-wide v5, v3, Landroidx/constraintlayout/core/parser/CLElement;->start:J

    long-to-int v6, v5

    const/4 v5, 0x1

    add-int/2addr v6, v5

    int-to-long v6, v6

    invoke-virtual {v3, v6, v7}, Landroidx/constraintlayout/core/parser/CLElement;->setStart(J)V

    goto :goto_c

    .line 143
    :cond_1d
    const/4 v5, 0x1

    .line 146
    :goto_c
    add-int/lit8 v6, v4, -0x1

    int-to-long v6, v6

    invoke-virtual {v3, v6, v7}, Landroidx/constraintlayout/core/parser/CLElement;->setEnd(J)V

    .line 147
    invoke-virtual {v3}, Landroidx/constraintlayout/core/parser/CLElement;->getContainer()Landroidx/constraintlayout/core/parser/CLElement;

    move-result-object v3

    goto :goto_b

    .line 150
    :cond_1e
    sget-boolean v5, Landroidx/constraintlayout/core/parser/CLParser;->DEBUG:Z

    if-eqz v5, :cond_1f

    .line 151
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Root: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroidx/constraintlayout/core/parser/CLObject;->toJSON()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 154
    :cond_1f
    return-object v1

    .line 59
    .end local v15    # "startIndex":I
    .restart local v6    # "startIndex":I
    :cond_20
    move v15, v6

    .end local v6    # "startIndex":I
    .restart local v15    # "startIndex":I
    new-instance v5, Landroidx/constraintlayout/core/parser/CLParsingException;

    const/4 v6, 0x0

    const-string v7, "invalid json content"

    invoke-direct {v5, v7, v6}, Landroidx/constraintlayout/core/parser/CLParsingException;-><init>(Ljava/lang/String;Landroidx/constraintlayout/core/parser/CLElement;)V

    goto :goto_e

    :goto_d
    throw v5

    :goto_e
    goto :goto_d
.end method
