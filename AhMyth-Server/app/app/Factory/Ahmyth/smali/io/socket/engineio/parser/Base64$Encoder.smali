.class Lio/socket/engineio/parser/Base64$Encoder;
.super Lio/socket/engineio/parser/Base64$Coder;
.source "Base64.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/engineio/parser/Base64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Encoder"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final ENCODE:[B

.field private static final ENCODE_WEBSAFE:[B

.field public static final LINE_GROUPS:I = 0x13


# instance fields
.field private final alphabet:[B

.field private count:I

.field public final do_cr:Z

.field public final do_newline:Z

.field public final do_padding:Z

.field private final tail:[B

.field tailLen:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 490
    const-class v0, Lio/socket/engineio/parser/Base64;

    .line 501
    const/16 v0, 0x40

    new-array v1, v0, [B

    fill-array-data v1, :array_0

    sput-object v1, Lio/socket/engineio/parser/Base64$Encoder;->ENCODE:[B

    .line 511
    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, Lio/socket/engineio/parser/Base64$Encoder;->ENCODE_WEBSAFE:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2bt
        0x2ft
    .end array-data

    :array_1
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2dt
        0x5ft
    .end array-data
.end method

.method public constructor <init>(I[B)V
    .locals 4
    .param p1, "flags"    # I
    .param p2, "output"    # [B

    .line 524
    invoke-direct {p0}, Lio/socket/engineio/parser/Base64$Coder;-><init>()V

    .line 525
    iput-object p2, p0, Lio/socket/engineio/parser/Base64$Encoder;->output:[B

    .line 526
    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lio/socket/engineio/parser/Base64$Encoder;->do_padding:Z

    .line 527
    and-int/lit8 v0, p1, 0x2

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    iput-boolean v0, p0, Lio/socket/engineio/parser/Base64$Encoder;->do_newline:Z

    .line 528
    and-int/lit8 v3, p1, 0x4

    if-eqz v3, :cond_2

    goto :goto_2

    :cond_2
    const/4 v2, 0x0

    :goto_2
    iput-boolean v2, p0, Lio/socket/engineio/parser/Base64$Encoder;->do_cr:Z

    .line 529
    and-int/lit8 v2, p1, 0x8

    if-nez v2, :cond_3

    sget-object v2, Lio/socket/engineio/parser/Base64$Encoder;->ENCODE:[B

    goto :goto_3

    :cond_3
    sget-object v2, Lio/socket/engineio/parser/Base64$Encoder;->ENCODE_WEBSAFE:[B

    :goto_3
    iput-object v2, p0, Lio/socket/engineio/parser/Base64$Encoder;->alphabet:[B

    .line 530
    const/4 v2, 0x2

    new-array v2, v2, [B

    iput-object v2, p0, Lio/socket/engineio/parser/Base64$Encoder;->tail:[B

    .line 531
    iput v1, p0, Lio/socket/engineio/parser/Base64$Encoder;->tailLen:I

    .line 532
    if-eqz v0, :cond_4

    const/16 v0, 0x13

    goto :goto_4

    :cond_4
    const/4 v0, -0x1

    :goto_4
    iput v0, p0, Lio/socket/engineio/parser/Base64$Encoder;->count:I

    .line 533
    return-void
.end method


# virtual methods
.method public maxOutputSize(I)I
    .locals 1
    .param p1, "len"    # I

    .line 539
    mul-int/lit8 v0, p1, 0x8

    div-int/lit8 v0, v0, 0x5

    add-int/lit8 v0, v0, 0xa

    return v0
.end method

.method public process([BIIZ)Z
    .locals 19
    .param p1, "input"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .param p4, "finish"    # Z

    .line 543
    move-object/from16 v0, p0

    iget-object v1, v0, Lio/socket/engineio/parser/Base64$Encoder;->alphabet:[B

    .line 544
    .local v1, "alphabet":[B
    iget-object v2, v0, Lio/socket/engineio/parser/Base64$Encoder;->output:[B

    .line 545
    .local v2, "output":[B
    const/4 v3, 0x0

    .line 546
    .local v3, "op":I
    iget v4, v0, Lio/socket/engineio/parser/Base64$Encoder;->count:I

    .line 547
    .local v4, "count":I
    move/from16 v5, p2

    .line 548
    .local v5, "p":I
    add-int v6, p3, p2

    .line 549
    .end local p3    # "len":I
    .local v6, "len":I
    const/4 v7, -0x1

    .line 553
    .local v7, "v":I
    iget v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->tailLen:I

    const/4 v9, 0x0

    const/4 v10, 0x2

    const/4 v11, 0x1

    if-eq v8, v11, :cond_1

    if-eq v8, v10, :cond_0

    goto :goto_0

    .line 568
    :cond_0
    add-int/lit8 v8, v5, 0x1

    if-gt v8, v6, :cond_2

    .line 570
    iget-object v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->tail:[B

    aget-byte v12, v8, v9

    and-int/lit16 v12, v12, 0xff

    shl-int/lit8 v12, v12, 0x10

    aget-byte v8, v8, v11

    and-int/lit16 v8, v8, 0xff

    shl-int/lit8 v8, v8, 0x8

    or-int/2addr v8, v12

    add-int/lit8 v12, v5, 0x1

    .end local v5    # "p":I
    .local v12, "p":I
    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    or-int v7, v8, v5

    .line 573
    iput v9, v0, Lio/socket/engineio/parser/Base64$Encoder;->tailLen:I

    move v5, v12

    goto :goto_0

    .line 558
    .end local v12    # "p":I
    .restart local v5    # "p":I
    :cond_1
    add-int/lit8 v8, v5, 0x2

    if-gt v8, v6, :cond_2

    .line 561
    iget-object v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->tail:[B

    aget-byte v8, v8, v9

    and-int/lit16 v8, v8, 0xff

    shl-int/lit8 v8, v8, 0x10

    add-int/lit8 v12, v5, 0x1

    .end local v5    # "p":I
    .restart local v12    # "p":I
    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    or-int/2addr v5, v8

    add-int/lit8 v8, v12, 0x1

    .end local v12    # "p":I
    .local v8, "p":I
    aget-byte v12, p1, v12

    and-int/lit16 v12, v12, 0xff

    or-int v7, v5, v12

    .line 564
    iput v9, v0, Lio/socket/engineio/parser/Base64$Encoder;->tailLen:I

    move v5, v8

    .line 577
    .end local v8    # "p":I
    .restart local v5    # "p":I
    :cond_2
    :goto_0
    const/4 v8, -0x1

    const/16 v9, 0xd

    const/16 v12, 0xa

    if-eq v7, v8, :cond_4

    .line 578
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .local v8, "op":I
    shr-int/lit8 v13, v7, 0x12

    and-int/lit8 v13, v13, 0x3f

    aget-byte v13, v1, v13

    aput-byte v13, v2, v3

    .line 579
    add-int/lit8 v3, v8, 0x1

    .end local v8    # "op":I
    .restart local v3    # "op":I
    shr-int/lit8 v13, v7, 0xc

    and-int/lit8 v13, v13, 0x3f

    aget-byte v13, v1, v13

    aput-byte v13, v2, v8

    .line 580
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .restart local v8    # "op":I
    shr-int/lit8 v13, v7, 0x6

    and-int/lit8 v13, v13, 0x3f

    aget-byte v13, v1, v13

    aput-byte v13, v2, v3

    .line 581
    add-int/lit8 v3, v8, 0x1

    .end local v8    # "op":I
    .restart local v3    # "op":I
    and-int/lit8 v13, v7, 0x3f

    aget-byte v13, v1, v13

    aput-byte v13, v2, v8

    .line 582
    add-int/lit8 v4, v4, -0x1

    if-nez v4, :cond_4

    .line 583
    iget-boolean v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->do_cr:Z

    if-eqz v8, :cond_3

    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .restart local v8    # "op":I
    aput-byte v9, v2, v3

    move v3, v8

    .line 584
    .end local v8    # "op":I
    .restart local v3    # "op":I
    :cond_3
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .restart local v8    # "op":I
    aput-byte v12, v2, v3

    .line 585
    const/16 v4, 0x13

    move v3, v8

    .line 592
    .end local v8    # "op":I
    .restart local v3    # "op":I
    :cond_4
    :goto_1
    add-int/lit8 v8, v5, 0x3

    if-gt v8, v6, :cond_6

    .line 593
    aget-byte v8, p1, v5

    and-int/lit16 v8, v8, 0xff

    shl-int/lit8 v8, v8, 0x10

    add-int/lit8 v13, v5, 0x1

    aget-byte v13, p1, v13

    and-int/lit16 v13, v13, 0xff

    shl-int/lit8 v13, v13, 0x8

    or-int/2addr v8, v13

    add-int/lit8 v13, v5, 0x2

    aget-byte v13, p1, v13

    and-int/lit16 v13, v13, 0xff

    or-int v7, v8, v13

    .line 596
    shr-int/lit8 v8, v7, 0x12

    and-int/lit8 v8, v8, 0x3f

    aget-byte v8, v1, v8

    aput-byte v8, v2, v3

    .line 597
    add-int/lit8 v8, v3, 0x1

    shr-int/lit8 v13, v7, 0xc

    and-int/lit8 v13, v13, 0x3f

    aget-byte v13, v1, v13

    aput-byte v13, v2, v8

    .line 598
    add-int/lit8 v8, v3, 0x2

    shr-int/lit8 v13, v7, 0x6

    and-int/lit8 v13, v13, 0x3f

    aget-byte v13, v1, v13

    aput-byte v13, v2, v8

    .line 599
    add-int/lit8 v8, v3, 0x3

    and-int/lit8 v13, v7, 0x3f

    aget-byte v13, v1, v13

    aput-byte v13, v2, v8

    .line 600
    add-int/lit8 v5, v5, 0x3

    .line 601
    add-int/lit8 v3, v3, 0x4

    .line 602
    add-int/lit8 v4, v4, -0x1

    if-nez v4, :cond_4

    .line 603
    iget-boolean v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->do_cr:Z

    if-eqz v8, :cond_5

    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .restart local v8    # "op":I
    aput-byte v9, v2, v3

    move v3, v8

    .line 604
    .end local v8    # "op":I
    .restart local v3    # "op":I
    :cond_5
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .restart local v8    # "op":I
    aput-byte v12, v2, v3

    .line 605
    const/16 v4, 0x13

    move v3, v8

    goto :goto_1

    .line 608
    .end local v8    # "op":I
    .restart local v3    # "op":I
    :cond_6
    if-eqz p4, :cond_16

    .line 613
    iget v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->tailLen:I

    sub-int v13, v5, v8

    add-int/lit8 v14, v6, -0x1

    const/16 v15, 0x3d

    if-ne v13, v14, :cond_b

    .line 614
    const/4 v10, 0x0

    .line 615
    .local v10, "t":I
    if-lez v8, :cond_7

    iget-object v13, v0, Lio/socket/engineio/parser/Base64$Encoder;->tail:[B

    add-int/lit8 v14, v10, 0x1

    .end local v10    # "t":I
    .local v14, "t":I
    aget-byte v10, v13, v10

    goto :goto_2

    .end local v14    # "t":I
    .restart local v10    # "t":I
    :cond_7
    add-int/lit8 v13, v5, 0x1

    .end local v5    # "p":I
    .local v13, "p":I
    aget-byte v5, p1, v5

    move v14, v10

    move v10, v5

    move v5, v13

    .end local v10    # "t":I
    .end local v13    # "p":I
    .restart local v5    # "p":I
    .restart local v14    # "t":I
    :goto_2
    and-int/lit16 v10, v10, 0xff

    shl-int/lit8 v7, v10, 0x4

    .line 616
    sub-int/2addr v8, v14

    iput v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->tailLen:I

    .line 617
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .restart local v8    # "op":I
    shr-int/lit8 v10, v7, 0x6

    and-int/lit8 v10, v10, 0x3f

    aget-byte v10, v1, v10

    aput-byte v10, v2, v3

    .line 618
    add-int/lit8 v3, v8, 0x1

    .end local v8    # "op":I
    .restart local v3    # "op":I
    and-int/lit8 v10, v7, 0x3f

    aget-byte v10, v1, v10

    aput-byte v10, v2, v8

    .line 619
    iget-boolean v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->do_padding:Z

    if-eqz v8, :cond_8

    .line 620
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .restart local v8    # "op":I
    aput-byte v15, v2, v3

    .line 621
    add-int/lit8 v3, v8, 0x1

    .end local v8    # "op":I
    .restart local v3    # "op":I
    aput-byte v15, v2, v8

    .line 623
    :cond_8
    iget-boolean v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->do_newline:Z

    if-eqz v8, :cond_a

    .line 624
    iget-boolean v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->do_cr:Z

    if-eqz v8, :cond_9

    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .restart local v8    # "op":I
    aput-byte v9, v2, v3

    move v3, v8

    .line 625
    .end local v8    # "op":I
    .restart local v3    # "op":I
    :cond_9
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .restart local v8    # "op":I
    aput-byte v12, v2, v3

    move v3, v8

    .line 627
    .end local v8    # "op":I
    .end local v14    # "t":I
    .restart local v3    # "op":I
    :cond_a
    goto/16 :goto_5

    :cond_b
    sub-int v13, v5, v8

    add-int/lit8 v14, v6, -0x2

    if-ne v13, v14, :cond_11

    .line 628
    const/4 v13, 0x0

    .line 629
    .local v13, "t":I
    if-le v8, v11, :cond_c

    iget-object v14, v0, Lio/socket/engineio/parser/Base64$Encoder;->tail:[B

    add-int/lit8 v16, v13, 0x1

    .end local v13    # "t":I
    .local v16, "t":I
    aget-byte v13, v14, v13

    goto :goto_3

    .end local v16    # "t":I
    .restart local v13    # "t":I
    :cond_c
    add-int/lit8 v14, v5, 0x1

    .end local v5    # "p":I
    .local v14, "p":I
    aget-byte v5, p1, v5

    move/from16 v16, v13

    move v13, v5

    move v5, v14

    .end local v13    # "t":I
    .end local v14    # "p":I
    .restart local v5    # "p":I
    .restart local v16    # "t":I
    :goto_3
    and-int/lit16 v13, v13, 0xff

    shl-int/2addr v13, v12

    if-lez v8, :cond_d

    iget-object v14, v0, Lio/socket/engineio/parser/Base64$Encoder;->tail:[B

    add-int/lit8 v17, v16, 0x1

    .end local v16    # "t":I
    .local v17, "t":I
    aget-byte v14, v14, v16

    move/from16 v16, v17

    goto :goto_4

    .end local v17    # "t":I
    .restart local v16    # "t":I
    :cond_d
    add-int/lit8 v14, v5, 0x1

    .end local v5    # "p":I
    .restart local v14    # "p":I
    aget-byte v5, p1, v5

    move/from16 v18, v14

    move v14, v5

    move/from16 v5, v18

    .end local v14    # "p":I
    .restart local v5    # "p":I
    :goto_4
    and-int/lit16 v14, v14, 0xff

    shl-int/lit8 v10, v14, 0x2

    or-int v7, v13, v10

    .line 631
    sub-int v8, v8, v16

    iput v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->tailLen:I

    .line 632
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .restart local v8    # "op":I
    shr-int/lit8 v10, v7, 0xc

    and-int/lit8 v10, v10, 0x3f

    aget-byte v10, v1, v10

    aput-byte v10, v2, v3

    .line 633
    add-int/lit8 v3, v8, 0x1

    .end local v8    # "op":I
    .restart local v3    # "op":I
    shr-int/lit8 v10, v7, 0x6

    and-int/lit8 v10, v10, 0x3f

    aget-byte v10, v1, v10

    aput-byte v10, v2, v8

    .line 634
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .restart local v8    # "op":I
    and-int/lit8 v10, v7, 0x3f

    aget-byte v10, v1, v10

    aput-byte v10, v2, v3

    .line 635
    iget-boolean v3, v0, Lio/socket/engineio/parser/Base64$Encoder;->do_padding:Z

    if-eqz v3, :cond_e

    .line 636
    add-int/lit8 v3, v8, 0x1

    .end local v8    # "op":I
    .restart local v3    # "op":I
    aput-byte v15, v2, v8

    move v8, v3

    .line 638
    .end local v3    # "op":I
    .restart local v8    # "op":I
    :cond_e
    iget-boolean v3, v0, Lio/socket/engineio/parser/Base64$Encoder;->do_newline:Z

    if-eqz v3, :cond_10

    .line 639
    iget-boolean v3, v0, Lio/socket/engineio/parser/Base64$Encoder;->do_cr:Z

    if-eqz v3, :cond_f

    add-int/lit8 v3, v8, 0x1

    .end local v8    # "op":I
    .restart local v3    # "op":I
    aput-byte v9, v2, v8

    move v8, v3

    .line 640
    .end local v3    # "op":I
    .restart local v8    # "op":I
    :cond_f
    add-int/lit8 v3, v8, 0x1

    .end local v8    # "op":I
    .restart local v3    # "op":I
    aput-byte v12, v2, v8

    move v8, v3

    .line 642
    .end local v3    # "op":I
    .end local v16    # "t":I
    .restart local v8    # "op":I
    :cond_10
    move v3, v8

    goto :goto_5

    .end local v8    # "op":I
    .restart local v3    # "op":I
    :cond_11
    iget-boolean v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->do_newline:Z

    if-eqz v8, :cond_13

    if-lez v3, :cond_13

    const/16 v8, 0x13

    if-eq v4, v8, :cond_13

    .line 643
    iget-boolean v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->do_cr:Z

    if-eqz v8, :cond_12

    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .restart local v8    # "op":I
    aput-byte v9, v2, v3

    move v3, v8

    .line 644
    .end local v8    # "op":I
    .restart local v3    # "op":I
    :cond_12
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "op":I
    .restart local v8    # "op":I
    aput-byte v12, v2, v3

    move v3, v8

    .line 646
    .end local v8    # "op":I
    .restart local v3    # "op":I
    :cond_13
    :goto_5
    iget v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->tailLen:I

    if-nez v8, :cond_15

    .line 647
    if-ne v5, v6, :cond_14

    goto :goto_6

    :cond_14
    new-instance v8, Ljava/lang/AssertionError;

    invoke-direct {v8}, Ljava/lang/AssertionError;-><init>()V

    throw v8

    .line 646
    :cond_15
    new-instance v8, Ljava/lang/AssertionError;

    invoke-direct {v8}, Ljava/lang/AssertionError;-><init>()V

    throw v8

    .line 651
    :cond_16
    add-int/lit8 v8, v6, -0x1

    if-ne v5, v8, :cond_17

    .line 652
    iget-object v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->tail:[B

    iget v9, v0, Lio/socket/engineio/parser/Base64$Encoder;->tailLen:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v0, Lio/socket/engineio/parser/Base64$Encoder;->tailLen:I

    aget-byte v10, p1, v5

    aput-byte v10, v8, v9

    goto :goto_6

    .line 653
    :cond_17
    add-int/lit8 v8, v6, -0x2

    if-ne v5, v8, :cond_18

    .line 654
    iget-object v8, v0, Lio/socket/engineio/parser/Base64$Encoder;->tail:[B

    iget v9, v0, Lio/socket/engineio/parser/Base64$Encoder;->tailLen:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v0, Lio/socket/engineio/parser/Base64$Encoder;->tailLen:I

    aget-byte v12, p1, v5

    aput-byte v12, v8, v9

    .line 655
    add-int/lit8 v9, v10, 0x1

    iput v9, v0, Lio/socket/engineio/parser/Base64$Encoder;->tailLen:I

    add-int/lit8 v9, v5, 0x1

    aget-byte v9, p1, v9

    aput-byte v9, v8, v10

    .line 658
    :cond_18
    :goto_6
    iput v3, v0, Lio/socket/engineio/parser/Base64$Encoder;->op:I

    .line 659
    iput v4, v0, Lio/socket/engineio/parser/Base64$Encoder;->count:I

    .line 660
    return v11
.end method
