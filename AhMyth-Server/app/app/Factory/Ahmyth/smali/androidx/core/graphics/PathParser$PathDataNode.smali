.class public Landroidx/core/graphics/PathParser$PathDataNode;
.super Ljava/lang/Object;
.source "PathParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/graphics/PathParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PathDataNode"
.end annotation


# instance fields
.field public mParams:[F

.field public mType:C


# direct methods
.method constructor <init>(C[F)V
    .locals 0
    .param p1, "type"    # C
    .param p2, "params"    # [F

    .line 352
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 353
    iput-char p1, p0, Landroidx/core/graphics/PathParser$PathDataNode;->mType:C

    .line 354
    iput-object p2, p0, Landroidx/core/graphics/PathParser$PathDataNode;->mParams:[F

    .line 355
    return-void
.end method

.method constructor <init>(Landroidx/core/graphics/PathParser$PathDataNode;)V
    .locals 3
    .param p1, "n"    # Landroidx/core/graphics/PathParser$PathDataNode;

    .line 357
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 358
    iget-char v0, p1, Landroidx/core/graphics/PathParser$PathDataNode;->mType:C

    iput-char v0, p0, Landroidx/core/graphics/PathParser$PathDataNode;->mType:C

    .line 359
    iget-object v0, p1, Landroidx/core/graphics/PathParser$PathDataNode;->mParams:[F

    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Landroidx/core/graphics/PathParser;->copyOfRange([FII)[F

    move-result-object v0

    iput-object v0, p0, Landroidx/core/graphics/PathParser$PathDataNode;->mParams:[F

    .line 360
    return-void
.end method

.method private static addCommand(Landroid/graphics/Path;[FCC[F)V
    .locals 25
    .param p0, "path"    # Landroid/graphics/Path;
    .param p1, "current"    # [F
    .param p2, "previousCmd"    # C
    .param p3, "cmd"    # C
    .param p4, "val"    # [F

    .line 398
    move-object/from16 v10, p0

    move-object/from16 v11, p4

    const/4 v0, 0x2

    .line 399
    .local v0, "incr":I
    const/4 v12, 0x0

    aget v1, p1, v12

    .line 400
    .local v1, "currentX":F
    const/4 v13, 0x1

    aget v2, p1, v13

    .line 401
    .local v2, "currentY":F
    const/4 v14, 0x2

    aget v3, p1, v14

    .line 402
    .local v3, "ctrlPointX":F
    const/4 v15, 0x3

    aget v4, p1, v15

    .line 403
    .local v4, "ctrlPointY":F
    const/16 v16, 0x4

    aget v5, p1, v16

    .line 404
    .local v5, "currentSegmentStartX":F
    const/16 v17, 0x5

    aget v6, p1, v17

    .line 408
    .local v6, "currentSegmentStartY":F
    sparse-switch p3, :sswitch_data_0

    move/from16 v18, v0

    goto :goto_0

    .line 411
    :sswitch_0
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Path;->close()V

    .line 415
    move v1, v5

    .line 416
    move v2, v6

    .line 417
    move v3, v5

    .line 418
    move v4, v6

    .line 419
    invoke-virtual {v10, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 420
    move/from16 v18, v0

    goto :goto_0

    .line 443
    :sswitch_1
    const/4 v0, 0x4

    .line 444
    move/from16 v18, v0

    goto :goto_0

    .line 427
    :sswitch_2
    const/4 v0, 0x2

    .line 428
    move/from16 v18, v0

    goto :goto_0

    .line 433
    :sswitch_3
    const/4 v0, 0x1

    .line 434
    move/from16 v18, v0

    goto :goto_0

    .line 437
    :sswitch_4
    const/4 v0, 0x6

    .line 438
    move/from16 v18, v0

    goto :goto_0

    .line 447
    :sswitch_5
    const/4 v0, 0x7

    move/from16 v18, v0

    .line 451
    .end local v0    # "incr":I
    .local v18, "incr":I
    :goto_0
    const/4 v0, 0x0

    move/from16 v9, p2

    move v8, v0

    move v7, v1

    move/from16 v19, v3

    move/from16 v20, v4

    move/from16 v21, v5

    move/from16 v22, v6

    move v6, v2

    .end local v1    # "currentX":F
    .end local v2    # "currentY":F
    .end local v3    # "ctrlPointX":F
    .end local v4    # "ctrlPointY":F
    .end local v5    # "currentSegmentStartX":F
    .end local p2    # "previousCmd":C
    .local v6, "currentY":F
    .local v7, "currentX":F
    .local v8, "k":I
    .local v9, "previousCmd":C
    .local v19, "ctrlPointX":F
    .local v20, "ctrlPointY":F
    .local v21, "currentSegmentStartX":F
    .local v22, "currentSegmentStartY":F
    :goto_1
    array-length v0, v11

    if-ge v8, v0, :cond_e

    .line 452
    const/16 v0, 0x54

    const/16 v1, 0x53

    const/16 v2, 0x51

    const/16 v3, 0x43

    const/16 v4, 0x74

    const/16 v5, 0x73

    const/16 v15, 0x71

    const/16 v14, 0x63

    const/high16 v23, 0x40000000    # 2.0f

    const/4 v13, 0x0

    sparse-switch p3, :sswitch_data_1

    move v12, v6

    move v14, v7

    move/from16 v24, v8

    move v15, v9

    .end local v6    # "currentY":F
    .end local v7    # "currentX":F
    .end local v8    # "k":I
    .end local v9    # "previousCmd":C
    .local v12, "currentY":F
    .local v14, "currentX":F
    .local v15, "previousCmd":C
    .local v24, "k":I
    goto/16 :goto_a

    .line 500
    .end local v12    # "currentY":F
    .end local v14    # "currentX":F
    .end local v15    # "previousCmd":C
    .end local v24    # "k":I
    .restart local v6    # "currentY":F
    .restart local v7    # "currentX":F
    .restart local v8    # "k":I
    .restart local v9    # "previousCmd":C
    :sswitch_6
    add-int/lit8 v0, v8, 0x0

    aget v0, v11, v0

    invoke-virtual {v10, v13, v0}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 501
    add-int/lit8 v0, v8, 0x0

    aget v0, v11, v0

    add-float/2addr v6, v0

    .line 502
    move/from16 v24, v8

    move v15, v9

    goto/16 :goto_a

    .line 572
    :sswitch_7
    const/4 v1, 0x0

    .line 573
    .local v1, "reflectiveCtrlPointX":F
    const/4 v3, 0x0

    .line 574
    .local v3, "reflectiveCtrlPointY":F
    if-eq v9, v15, :cond_0

    if-eq v9, v4, :cond_0

    if-eq v9, v2, :cond_0

    if-ne v9, v0, :cond_1

    .line 576
    :cond_0
    sub-float v1, v7, v19

    .line 577
    sub-float v3, v6, v20

    .line 579
    :cond_1
    add-int/lit8 v0, v8, 0x0

    aget v0, v11, v0

    add-int/lit8 v2, v8, 0x1

    aget v2, v11, v2

    invoke-virtual {v10, v1, v3, v0, v2}, Landroid/graphics/Path;->rQuadTo(FFFF)V

    .line 581
    add-float v0, v7, v1

    .line 582
    .end local v19    # "ctrlPointX":F
    .local v0, "ctrlPointX":F
    add-float v2, v6, v3

    .line 583
    .end local v20    # "ctrlPointY":F
    .local v2, "ctrlPointY":F
    add-int/lit8 v4, v8, 0x0

    aget v4, v11, v4

    add-float/2addr v7, v4

    .line 584
    add-int/lit8 v4, v8, 0x1

    aget v4, v11, v4

    add-float/2addr v6, v4

    .line 585
    move/from16 v19, v0

    move/from16 v20, v2

    move/from16 v24, v8

    move v15, v9

    goto/16 :goto_a

    .line 526
    .end local v0    # "ctrlPointX":F
    .end local v1    # "reflectiveCtrlPointX":F
    .end local v2    # "ctrlPointY":F
    .end local v3    # "reflectiveCtrlPointY":F
    .restart local v19    # "ctrlPointX":F
    .restart local v20    # "ctrlPointY":F
    :sswitch_8
    const/4 v0, 0x0

    .line 527
    .local v0, "reflectiveCtrlPointX":F
    const/4 v2, 0x0

    .line 528
    .local v2, "reflectiveCtrlPointY":F
    if-eq v9, v14, :cond_3

    if-eq v9, v5, :cond_3

    if-eq v9, v3, :cond_3

    if-ne v9, v1, :cond_2

    goto :goto_2

    :cond_2
    move v13, v0

    move v14, v2

    goto :goto_3

    .line 530
    :cond_3
    :goto_2
    sub-float v0, v7, v19

    .line 531
    sub-float v2, v6, v20

    move v13, v0

    move v14, v2

    .line 533
    .end local v0    # "reflectiveCtrlPointX":F
    .end local v2    # "reflectiveCtrlPointY":F
    .local v13, "reflectiveCtrlPointX":F
    .local v14, "reflectiveCtrlPointY":F
    :goto_3
    add-int/lit8 v0, v8, 0x0

    aget v3, v11, v0

    add-int/lit8 v0, v8, 0x1

    aget v4, v11, v0

    add-int/lit8 v0, v8, 0x2

    aget v5, v11, v0

    add-int/lit8 v0, v8, 0x3

    aget v15, v11, v0

    move-object/from16 v0, p0

    move v1, v13

    move v2, v14

    move v12, v6

    .end local v6    # "currentY":F
    .restart local v12    # "currentY":F
    move v6, v15

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 537
    add-int/lit8 v0, v8, 0x0

    aget v0, v11, v0

    add-float/2addr v0, v7

    .line 538
    .end local v19    # "ctrlPointX":F
    .local v0, "ctrlPointX":F
    add-int/lit8 v1, v8, 0x1

    aget v1, v11, v1

    add-float v6, v12, v1

    .line 539
    .end local v20    # "ctrlPointY":F
    .local v6, "ctrlPointY":F
    add-int/lit8 v1, v8, 0x2

    aget v1, v11, v1

    add-float/2addr v7, v1

    .line 540
    add-int/lit8 v1, v8, 0x3

    aget v1, v11, v1

    add-float/2addr v1, v12

    .line 541
    .end local v12    # "currentY":F
    .local v1, "currentY":F
    move/from16 v19, v0

    move/from16 v20, v6

    move/from16 v24, v8

    move v15, v9

    move v6, v1

    goto/16 :goto_a

    .line 558
    .end local v0    # "ctrlPointX":F
    .end local v1    # "currentY":F
    .end local v13    # "reflectiveCtrlPointX":F
    .end local v14    # "reflectiveCtrlPointY":F
    .local v6, "currentY":F
    .restart local v19    # "ctrlPointX":F
    .restart local v20    # "ctrlPointY":F
    :sswitch_9
    move v12, v6

    .end local v6    # "currentY":F
    .restart local v12    # "currentY":F
    add-int/lit8 v0, v8, 0x0

    aget v0, v11, v0

    add-int/lit8 v1, v8, 0x1

    aget v1, v11, v1

    add-int/lit8 v2, v8, 0x2

    aget v2, v11, v2

    add-int/lit8 v3, v8, 0x3

    aget v3, v11, v3

    invoke-virtual {v10, v0, v1, v2, v3}, Landroid/graphics/Path;->rQuadTo(FFFF)V

    .line 559
    add-int/lit8 v0, v8, 0x0

    aget v0, v11, v0

    add-float/2addr v0, v7

    .line 560
    .end local v19    # "ctrlPointX":F
    .restart local v0    # "ctrlPointX":F
    add-int/lit8 v1, v8, 0x1

    aget v1, v11, v1

    add-float v6, v12, v1

    .line 561
    .end local v20    # "ctrlPointY":F
    .local v6, "ctrlPointY":F
    add-int/lit8 v1, v8, 0x2

    aget v1, v11, v1

    add-float/2addr v7, v1

    .line 562
    add-int/lit8 v1, v8, 0x3

    aget v1, v11, v1

    add-float/2addr v1, v12

    .line 563
    .end local v12    # "currentY":F
    .restart local v1    # "currentY":F
    move/from16 v19, v0

    move/from16 v20, v6

    move/from16 v24, v8

    move v15, v9

    move v6, v1

    goto/16 :goto_a

    .line 454
    .end local v0    # "ctrlPointX":F
    .end local v1    # "currentY":F
    .local v6, "currentY":F
    .restart local v19    # "ctrlPointX":F
    .restart local v20    # "ctrlPointY":F
    :sswitch_a
    move v12, v6

    .end local v6    # "currentY":F
    .restart local v12    # "currentY":F
    add-int/lit8 v0, v8, 0x0

    aget v0, v11, v0

    add-float/2addr v7, v0

    .line 455
    add-int/lit8 v0, v8, 0x1

    aget v0, v11, v0

    add-float v6, v12, v0

    .line 456
    .end local v12    # "currentY":F
    .restart local v6    # "currentY":F
    if-lez v8, :cond_4

    .line 460
    add-int/lit8 v0, v8, 0x0

    aget v0, v11, v0

    add-int/lit8 v1, v8, 0x1

    aget v1, v11, v1

    invoke-virtual {v10, v0, v1}, Landroid/graphics/Path;->rLineTo(FF)V

    move/from16 v24, v8

    move v15, v9

    goto/16 :goto_a

    .line 462
    :cond_4
    add-int/lit8 v0, v8, 0x0

    aget v0, v11, v0

    add-int/lit8 v1, v8, 0x1

    aget v1, v11, v1

    invoke-virtual {v10, v0, v1}, Landroid/graphics/Path;->rMoveTo(FF)V

    .line 463
    move v0, v7

    .line 464
    .end local v21    # "currentSegmentStartX":F
    .local v0, "currentSegmentStartX":F
    move v1, v6

    .line 466
    .end local v22    # "currentSegmentStartY":F
    .local v1, "currentSegmentStartY":F
    move/from16 v21, v0

    move/from16 v22, v1

    move/from16 v24, v8

    move v15, v9

    goto/16 :goto_a

    .line 482
    .end local v0    # "currentSegmentStartX":F
    .end local v1    # "currentSegmentStartY":F
    .restart local v21    # "currentSegmentStartX":F
    .restart local v22    # "currentSegmentStartY":F
    :sswitch_b
    move v12, v6

    .end local v6    # "currentY":F
    .restart local v12    # "currentY":F
    add-int/lit8 v0, v8, 0x0

    aget v0, v11, v0

    add-int/lit8 v1, v8, 0x1

    aget v1, v11, v1

    invoke-virtual {v10, v0, v1}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 483
    add-int/lit8 v0, v8, 0x0

    aget v0, v11, v0

    add-float/2addr v7, v0

    .line 484
    add-int/lit8 v0, v8, 0x1

    aget v0, v11, v0

    add-float v6, v12, v0

    .line 485
    .end local v12    # "currentY":F
    .restart local v6    # "currentY":F
    move/from16 v24, v8

    move v15, v9

    goto/16 :goto_a

    .line 492
    :sswitch_c
    move v12, v6

    .end local v6    # "currentY":F
    .restart local v12    # "currentY":F
    add-int/lit8 v0, v8, 0x0

    aget v0, v11, v0

    invoke-virtual {v10, v0, v13}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 493
    add-int/lit8 v0, v8, 0x0

    aget v0, v11, v0

    add-float/2addr v7, v0

    .line 494
    move/from16 v24, v8

    move v15, v9

    goto/16 :goto_a

    .line 508
    .end local v12    # "currentY":F
    .restart local v6    # "currentY":F
    :sswitch_d
    move v12, v6

    .end local v6    # "currentY":F
    .restart local v12    # "currentY":F
    add-int/lit8 v0, v8, 0x0

    aget v1, v11, v0

    add-int/lit8 v0, v8, 0x1

    aget v2, v11, v0

    add-int/lit8 v0, v8, 0x2

    aget v3, v11, v0

    add-int/lit8 v0, v8, 0x3

    aget v4, v11, v0

    add-int/lit8 v0, v8, 0x4

    aget v5, v11, v0

    add-int/lit8 v0, v8, 0x5

    aget v6, v11, v0

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 511
    add-int/lit8 v0, v8, 0x2

    aget v0, v11, v0

    add-float/2addr v0, v7

    .line 512
    .end local v19    # "ctrlPointX":F
    .local v0, "ctrlPointX":F
    add-int/lit8 v1, v8, 0x3

    aget v1, v11, v1

    add-float v6, v12, v1

    .line 513
    .end local v20    # "ctrlPointY":F
    .local v6, "ctrlPointY":F
    add-int/lit8 v1, v8, 0x4

    aget v1, v11, v1

    add-float/2addr v7, v1

    .line 514
    add-int/lit8 v1, v8, 0x5

    aget v1, v11, v1

    add-float/2addr v1, v12

    .line 516
    .end local v12    # "currentY":F
    .local v1, "currentY":F
    move/from16 v19, v0

    move/from16 v20, v6

    move/from16 v24, v8

    move v15, v9

    move v6, v1

    goto/16 :goto_a

    .line 603
    .end local v0    # "ctrlPointX":F
    .end local v1    # "currentY":F
    .local v6, "currentY":F
    .restart local v19    # "ctrlPointX":F
    .restart local v20    # "ctrlPointY":F
    :sswitch_e
    move v12, v6

    .end local v6    # "currentY":F
    .restart local v12    # "currentY":F
    add-int/lit8 v0, v8, 0x5

    aget v0, v11, v0

    add-float v3, v0, v7

    add-int/lit8 v0, v8, 0x6

    aget v0, v11, v0

    add-float v4, v0, v12

    add-int/lit8 v0, v8, 0x0

    aget v5, v11, v0

    add-int/lit8 v0, v8, 0x1

    aget v6, v11, v0

    add-int/lit8 v0, v8, 0x2

    aget v14, v11, v0

    add-int/lit8 v0, v8, 0x3

    aget v0, v11, v0

    cmpl-float v0, v0, v13

    if-eqz v0, :cond_5

    const/4 v15, 0x1

    goto :goto_4

    :cond_5
    const/4 v15, 0x0

    :goto_4
    add-int/lit8 v0, v8, 0x4

    aget v0, v11, v0

    cmpl-float v0, v0, v13

    if-eqz v0, :cond_6

    const/4 v13, 0x1

    goto :goto_5

    :cond_6
    const/4 v13, 0x0

    :goto_5
    move-object/from16 v0, p0

    move v1, v7

    move v2, v12

    move v10, v7

    .end local v7    # "currentX":F
    .local v10, "currentX":F
    move v7, v14

    move/from16 v24, v8

    .end local v8    # "k":I
    .restart local v24    # "k":I
    move v8, v15

    move v14, v9

    .end local v9    # "previousCmd":C
    .local v14, "previousCmd":C
    move v9, v13

    invoke-static/range {v0 .. v9}, Landroidx/core/graphics/PathParser$PathDataNode;->drawArc(Landroid/graphics/Path;FFFFFFFZZ)V

    .line 613
    add-int/lit8 v8, v24, 0x5

    aget v0, v11, v8

    add-float v7, v10, v0

    .line 614
    .end local v10    # "currentX":F
    .restart local v7    # "currentX":F
    add-int/lit8 v8, v24, 0x6

    aget v0, v11, v8

    add-float v6, v12, v0

    .line 615
    .end local v12    # "currentY":F
    .restart local v6    # "currentY":F
    move v0, v7

    .line 616
    .end local v19    # "ctrlPointX":F
    .restart local v0    # "ctrlPointX":F
    move v1, v6

    .line 617
    .end local v20    # "ctrlPointY":F
    .local v1, "ctrlPointY":F
    move-object/from16 v10, p0

    move/from16 v19, v0

    move/from16 v20, v1

    move v15, v14

    goto/16 :goto_a

    .line 504
    .end local v0    # "ctrlPointX":F
    .end local v1    # "ctrlPointY":F
    .end local v14    # "previousCmd":C
    .end local v24    # "k":I
    .restart local v8    # "k":I
    .restart local v9    # "previousCmd":C
    .restart local v19    # "ctrlPointX":F
    .restart local v20    # "ctrlPointY":F
    :sswitch_f
    move v12, v6

    move v10, v7

    move/from16 v24, v8

    move v14, v9

    .end local v6    # "currentY":F
    .end local v7    # "currentX":F
    .end local v8    # "k":I
    .end local v9    # "previousCmd":C
    .restart local v10    # "currentX":F
    .restart local v12    # "currentY":F
    .restart local v14    # "previousCmd":C
    .restart local v24    # "k":I
    add-int/lit8 v8, v24, 0x0

    aget v0, v11, v8

    move v9, v10

    move-object/from16 v10, p0

    .end local v10    # "currentX":F
    .local v9, "currentX":F
    invoke-virtual {v10, v9, v0}, Landroid/graphics/Path;->lineTo(FF)V

    .line 505
    add-int/lit8 v8, v24, 0x0

    aget v0, v11, v8

    .line 506
    .end local v12    # "currentY":F
    .local v0, "currentY":F
    move v6, v0

    move v7, v9

    move v15, v14

    goto/16 :goto_a

    .line 587
    .end local v0    # "currentY":F
    .end local v14    # "previousCmd":C
    .end local v24    # "k":I
    .restart local v6    # "currentY":F
    .restart local v7    # "currentX":F
    .restart local v8    # "k":I
    .local v9, "previousCmd":C
    :sswitch_10
    move v12, v6

    move/from16 v24, v8

    move v14, v9

    move v9, v7

    .end local v6    # "currentY":F
    .end local v7    # "currentX":F
    .end local v8    # "k":I
    .local v9, "currentX":F
    .restart local v12    # "currentY":F
    .restart local v14    # "previousCmd":C
    .restart local v24    # "k":I
    move v1, v9

    .line 588
    .local v1, "reflectiveCtrlPointX":F
    move v3, v12

    .line 589
    .restart local v3    # "reflectiveCtrlPointY":F
    if-eq v14, v15, :cond_7

    if-eq v14, v4, :cond_7

    if-eq v14, v2, :cond_7

    if-ne v14, v0, :cond_8

    .line 591
    :cond_7
    mul-float v7, v9, v23

    sub-float v1, v7, v19

    .line 592
    mul-float v6, v12, v23

    sub-float v3, v6, v20

    .line 594
    :cond_8
    add-int/lit8 v8, v24, 0x0

    aget v0, v11, v8

    add-int/lit8 v8, v24, 0x1

    aget v2, v11, v8

    invoke-virtual {v10, v1, v3, v0, v2}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 596
    move v0, v1

    .line 597
    .end local v19    # "ctrlPointX":F
    .local v0, "ctrlPointX":F
    move v2, v3

    .line 598
    .end local v20    # "ctrlPointY":F
    .local v2, "ctrlPointY":F
    add-int/lit8 v8, v24, 0x0

    aget v4, v11, v8

    .line 599
    .end local v9    # "currentX":F
    .local v4, "currentX":F
    add-int/lit8 v8, v24, 0x1

    aget v5, v11, v8

    .line 600
    .end local v12    # "currentY":F
    .local v5, "currentY":F
    move/from16 v19, v0

    move/from16 v20, v2

    move v7, v4

    move v6, v5

    move v15, v14

    goto/16 :goto_a

    .line 543
    .end local v0    # "ctrlPointX":F
    .end local v1    # "reflectiveCtrlPointX":F
    .end local v2    # "ctrlPointY":F
    .end local v3    # "reflectiveCtrlPointY":F
    .end local v4    # "currentX":F
    .end local v5    # "currentY":F
    .end local v14    # "previousCmd":C
    .end local v24    # "k":I
    .restart local v6    # "currentY":F
    .restart local v7    # "currentX":F
    .restart local v8    # "k":I
    .local v9, "previousCmd":C
    .restart local v19    # "ctrlPointX":F
    .restart local v20    # "ctrlPointY":F
    :sswitch_11
    move v12, v6

    move/from16 v24, v8

    move v15, v9

    move v9, v7

    .end local v6    # "currentY":F
    .end local v7    # "currentX":F
    .end local v8    # "k":I
    .local v9, "currentX":F
    .restart local v12    # "currentY":F
    .restart local v15    # "previousCmd":C
    .restart local v24    # "k":I
    move v0, v9

    .line 544
    .local v0, "reflectiveCtrlPointX":F
    move v2, v12

    .line 545
    .local v2, "reflectiveCtrlPointY":F
    if-eq v15, v14, :cond_a

    if-eq v15, v5, :cond_a

    if-eq v15, v3, :cond_a

    if-ne v15, v1, :cond_9

    goto :goto_6

    :cond_9
    move v7, v0

    move v8, v2

    goto :goto_7

    .line 547
    :cond_a
    :goto_6
    mul-float v7, v9, v23

    sub-float v0, v7, v19

    .line 548
    mul-float v6, v12, v23

    sub-float v2, v6, v20

    move v7, v0

    move v8, v2

    .line 550
    .end local v0    # "reflectiveCtrlPointX":F
    .end local v2    # "reflectiveCtrlPointY":F
    .local v7, "reflectiveCtrlPointX":F
    .local v8, "reflectiveCtrlPointY":F
    :goto_7
    add-int/lit8 v0, v24, 0x0

    aget v3, v11, v0

    add-int/lit8 v0, v24, 0x1

    aget v4, v11, v0

    add-int/lit8 v0, v24, 0x2

    aget v5, v11, v0

    add-int/lit8 v0, v24, 0x3

    aget v6, v11, v0

    move-object/from16 v0, p0

    move v1, v7

    move v2, v8

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 552
    add-int/lit8 v0, v24, 0x0

    aget v0, v11, v0

    .line 553
    .end local v19    # "ctrlPointX":F
    .local v0, "ctrlPointX":F
    add-int/lit8 v1, v24, 0x1

    aget v1, v11, v1

    .line 554
    .end local v20    # "ctrlPointY":F
    .local v1, "ctrlPointY":F
    add-int/lit8 v2, v24, 0x2

    aget v2, v11, v2

    .line 555
    .end local v9    # "currentX":F
    .local v2, "currentX":F
    add-int/lit8 v3, v24, 0x3

    aget v3, v11, v3

    .line 556
    .end local v12    # "currentY":F
    .local v3, "currentY":F
    move/from16 v19, v0

    move/from16 v20, v1

    move v7, v2

    move v6, v3

    goto/16 :goto_a

    .line 565
    .end local v0    # "ctrlPointX":F
    .end local v1    # "ctrlPointY":F
    .end local v2    # "currentX":F
    .end local v3    # "currentY":F
    .end local v15    # "previousCmd":C
    .end local v24    # "k":I
    .restart local v6    # "currentY":F
    .local v7, "currentX":F
    .local v8, "k":I
    .local v9, "previousCmd":C
    .restart local v19    # "ctrlPointX":F
    .restart local v20    # "ctrlPointY":F
    :sswitch_12
    move v12, v6

    move/from16 v24, v8

    move v15, v9

    move v9, v7

    .end local v6    # "currentY":F
    .end local v7    # "currentX":F
    .end local v8    # "k":I
    .local v9, "currentX":F
    .restart local v12    # "currentY":F
    .restart local v15    # "previousCmd":C
    .restart local v24    # "k":I
    add-int/lit8 v8, v24, 0x0

    aget v0, v11, v8

    add-int/lit8 v8, v24, 0x1

    aget v1, v11, v8

    add-int/lit8 v8, v24, 0x2

    aget v2, v11, v8

    add-int/lit8 v8, v24, 0x3

    aget v3, v11, v8

    invoke-virtual {v10, v0, v1, v2, v3}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 566
    add-int/lit8 v8, v24, 0x0

    aget v0, v11, v8

    .line 567
    .end local v19    # "ctrlPointX":F
    .restart local v0    # "ctrlPointX":F
    add-int/lit8 v8, v24, 0x1

    aget v1, v11, v8

    .line 568
    .end local v20    # "ctrlPointY":F
    .restart local v1    # "ctrlPointY":F
    add-int/lit8 v8, v24, 0x2

    aget v2, v11, v8

    .line 569
    .end local v9    # "currentX":F
    .restart local v2    # "currentX":F
    add-int/lit8 v8, v24, 0x3

    aget v3, v11, v8

    .line 570
    .end local v12    # "currentY":F
    .restart local v3    # "currentY":F
    move/from16 v19, v0

    move/from16 v20, v1

    move v7, v2

    move v6, v3

    goto/16 :goto_a

    .line 468
    .end local v0    # "ctrlPointX":F
    .end local v1    # "ctrlPointY":F
    .end local v2    # "currentX":F
    .end local v3    # "currentY":F
    .end local v15    # "previousCmd":C
    .end local v24    # "k":I
    .restart local v6    # "currentY":F
    .restart local v7    # "currentX":F
    .restart local v8    # "k":I
    .local v9, "previousCmd":C
    .restart local v19    # "ctrlPointX":F
    .restart local v20    # "ctrlPointY":F
    :sswitch_13
    move v12, v6

    move/from16 v24, v8

    move v15, v9

    move v9, v7

    .end local v6    # "currentY":F
    .end local v7    # "currentX":F
    .end local v8    # "k":I
    .local v9, "currentX":F
    .restart local v12    # "currentY":F
    .restart local v15    # "previousCmd":C
    .restart local v24    # "k":I
    add-int/lit8 v8, v24, 0x0

    aget v0, v11, v8

    .line 469
    .end local v9    # "currentX":F
    .local v0, "currentX":F
    add-int/lit8 v8, v24, 0x1

    aget v1, v11, v8

    .line 470
    .end local v12    # "currentY":F
    .local v1, "currentY":F
    if-lez v24, :cond_b

    .line 474
    add-int/lit8 v8, v24, 0x0

    aget v2, v11, v8

    add-int/lit8 v8, v24, 0x1

    aget v3, v11, v8

    invoke-virtual {v10, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    move v7, v0

    move v6, v1

    goto/16 :goto_a

    .line 476
    :cond_b
    add-int/lit8 v8, v24, 0x0

    aget v2, v11, v8

    add-int/lit8 v8, v24, 0x1

    aget v3, v11, v8

    invoke-virtual {v10, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 477
    move v2, v0

    .line 478
    .end local v21    # "currentSegmentStartX":F
    .local v2, "currentSegmentStartX":F
    move v3, v1

    .line 480
    .end local v22    # "currentSegmentStartY":F
    .local v3, "currentSegmentStartY":F
    move v7, v0

    move v6, v1

    move/from16 v21, v2

    move/from16 v22, v3

    goto/16 :goto_a

    .line 487
    .end local v0    # "currentX":F
    .end local v1    # "currentY":F
    .end local v2    # "currentSegmentStartX":F
    .end local v3    # "currentSegmentStartY":F
    .end local v15    # "previousCmd":C
    .end local v24    # "k":I
    .restart local v6    # "currentY":F
    .restart local v7    # "currentX":F
    .restart local v8    # "k":I
    .local v9, "previousCmd":C
    .restart local v21    # "currentSegmentStartX":F
    .restart local v22    # "currentSegmentStartY":F
    :sswitch_14
    move v12, v6

    move/from16 v24, v8

    move v15, v9

    move v9, v7

    .end local v6    # "currentY":F
    .end local v7    # "currentX":F
    .end local v8    # "k":I
    .local v9, "currentX":F
    .restart local v12    # "currentY":F
    .restart local v15    # "previousCmd":C
    .restart local v24    # "k":I
    add-int/lit8 v8, v24, 0x0

    aget v0, v11, v8

    add-int/lit8 v8, v24, 0x1

    aget v1, v11, v8

    invoke-virtual {v10, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 488
    add-int/lit8 v8, v24, 0x0

    aget v0, v11, v8

    .line 489
    .end local v9    # "currentX":F
    .restart local v0    # "currentX":F
    add-int/lit8 v8, v24, 0x1

    aget v1, v11, v8

    .line 490
    .end local v12    # "currentY":F
    .restart local v1    # "currentY":F
    move v7, v0

    move v6, v1

    goto/16 :goto_a

    .line 496
    .end local v0    # "currentX":F
    .end local v1    # "currentY":F
    .end local v15    # "previousCmd":C
    .end local v24    # "k":I
    .restart local v6    # "currentY":F
    .restart local v7    # "currentX":F
    .restart local v8    # "k":I
    .local v9, "previousCmd":C
    :sswitch_15
    move v12, v6

    move/from16 v24, v8

    move v15, v9

    move v9, v7

    .end local v6    # "currentY":F
    .end local v7    # "currentX":F
    .end local v8    # "k":I
    .local v9, "currentX":F
    .restart local v12    # "currentY":F
    .restart local v15    # "previousCmd":C
    .restart local v24    # "k":I
    add-int/lit8 v8, v24, 0x0

    aget v0, v11, v8

    invoke-virtual {v10, v0, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 497
    add-int/lit8 v8, v24, 0x0

    aget v0, v11, v8

    .line 498
    .end local v9    # "currentX":F
    .restart local v0    # "currentX":F
    move v7, v0

    goto/16 :goto_a

    .line 518
    .end local v0    # "currentX":F
    .end local v12    # "currentY":F
    .end local v15    # "previousCmd":C
    .end local v24    # "k":I
    .restart local v6    # "currentY":F
    .restart local v7    # "currentX":F
    .restart local v8    # "k":I
    .local v9, "previousCmd":C
    :sswitch_16
    move v12, v6

    move/from16 v24, v8

    move v15, v9

    move v9, v7

    .end local v6    # "currentY":F
    .end local v7    # "currentX":F
    .end local v8    # "k":I
    .local v9, "currentX":F
    .restart local v12    # "currentY":F
    .restart local v15    # "previousCmd":C
    .restart local v24    # "k":I
    add-int/lit8 v8, v24, 0x0

    aget v1, v11, v8

    add-int/lit8 v8, v24, 0x1

    aget v2, v11, v8

    add-int/lit8 v8, v24, 0x2

    aget v3, v11, v8

    add-int/lit8 v8, v24, 0x3

    aget v4, v11, v8

    add-int/lit8 v8, v24, 0x4

    aget v5, v11, v8

    add-int/lit8 v8, v24, 0x5

    aget v6, v11, v8

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 520
    add-int/lit8 v8, v24, 0x4

    aget v0, v11, v8

    .line 521
    .end local v9    # "currentX":F
    .restart local v0    # "currentX":F
    add-int/lit8 v8, v24, 0x5

    aget v1, v11, v8

    .line 522
    .end local v12    # "currentY":F
    .restart local v1    # "currentY":F
    add-int/lit8 v8, v24, 0x2

    aget v2, v11, v8

    .line 523
    .end local v19    # "ctrlPointX":F
    .local v2, "ctrlPointX":F
    add-int/lit8 v8, v24, 0x3

    aget v3, v11, v8

    .line 524
    .end local v20    # "ctrlPointY":F
    .local v3, "ctrlPointY":F
    move v7, v0

    move v6, v1

    move/from16 v19, v2

    move/from16 v20, v3

    goto :goto_a

    .line 619
    .end local v0    # "currentX":F
    .end local v1    # "currentY":F
    .end local v2    # "ctrlPointX":F
    .end local v3    # "ctrlPointY":F
    .end local v15    # "previousCmd":C
    .end local v24    # "k":I
    .restart local v6    # "currentY":F
    .restart local v7    # "currentX":F
    .restart local v8    # "k":I
    .local v9, "previousCmd":C
    .restart local v19    # "ctrlPointX":F
    .restart local v20    # "ctrlPointY":F
    :sswitch_17
    move v12, v6

    move/from16 v24, v8

    move v15, v9

    move v9, v7

    .end local v6    # "currentY":F
    .end local v7    # "currentX":F
    .end local v8    # "k":I
    .local v9, "currentX":F
    .restart local v12    # "currentY":F
    .restart local v15    # "previousCmd":C
    .restart local v24    # "k":I
    add-int/lit8 v8, v24, 0x5

    aget v3, v11, v8

    add-int/lit8 v8, v24, 0x6

    aget v4, v11, v8

    add-int/lit8 v8, v24, 0x0

    aget v5, v11, v8

    add-int/lit8 v8, v24, 0x1

    aget v6, v11, v8

    add-int/lit8 v8, v24, 0x2

    aget v7, v11, v8

    add-int/lit8 v8, v24, 0x3

    aget v0, v11, v8

    cmpl-float v0, v0, v13

    if-eqz v0, :cond_c

    const/4 v8, 0x1

    goto :goto_8

    :cond_c
    const/4 v8, 0x0

    :goto_8
    add-int/lit8 v0, v24, 0x4

    aget v0, v11, v0

    cmpl-float v0, v0, v13

    if-eqz v0, :cond_d

    const/4 v13, 0x1

    goto :goto_9

    :cond_d
    const/4 v13, 0x0

    :goto_9
    move-object/from16 v0, p0

    move v1, v9

    move v2, v12

    move v14, v9

    .end local v9    # "currentX":F
    .local v14, "currentX":F
    move v9, v13

    invoke-static/range {v0 .. v9}, Landroidx/core/graphics/PathParser$PathDataNode;->drawArc(Landroid/graphics/Path;FFFFFFFZZ)V

    .line 629
    add-int/lit8 v8, v24, 0x5

    aget v0, v11, v8

    .line 630
    .end local v14    # "currentX":F
    .restart local v0    # "currentX":F
    add-int/lit8 v8, v24, 0x6

    aget v1, v11, v8

    .line 631
    .end local v12    # "currentY":F
    .restart local v1    # "currentY":F
    move v2, v0

    .line 632
    .end local v19    # "ctrlPointX":F
    .restart local v2    # "ctrlPointX":F
    move v3, v1

    move v7, v0

    move v6, v1

    move/from16 v19, v2

    move/from16 v20, v3

    .line 635
    .end local v0    # "currentX":F
    .end local v1    # "currentY":F
    .end local v2    # "ctrlPointX":F
    .restart local v6    # "currentY":F
    .restart local v7    # "currentX":F
    .restart local v19    # "ctrlPointX":F
    :goto_a
    move/from16 v9, p3

    .line 451
    .end local v15    # "previousCmd":C
    .local v9, "previousCmd":C
    add-int v8, v24, v18

    const/4 v12, 0x0

    const/4 v13, 0x1

    const/4 v14, 0x2

    const/4 v15, 0x3

    .end local v24    # "k":I
    .restart local v8    # "k":I
    goto/16 :goto_1

    :cond_e
    move v12, v6

    move v14, v7

    .line 637
    .end local v6    # "currentY":F
    .end local v7    # "currentX":F
    .end local v8    # "k":I
    .restart local v12    # "currentY":F
    .restart local v14    # "currentX":F
    const/4 v0, 0x0

    aput v14, p1, v0

    .line 638
    const/4 v0, 0x1

    aput v12, p1, v0

    .line 639
    const/4 v0, 0x2

    aput v19, p1, v0

    .line 640
    const/4 v0, 0x3

    aput v20, p1, v0

    .line 641
    aput v21, p1, v16

    .line 642
    aput v22, p1, v17

    .line 643
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x41 -> :sswitch_5
        0x43 -> :sswitch_4
        0x48 -> :sswitch_3
        0x4c -> :sswitch_2
        0x4d -> :sswitch_2
        0x51 -> :sswitch_1
        0x53 -> :sswitch_1
        0x54 -> :sswitch_2
        0x56 -> :sswitch_3
        0x5a -> :sswitch_0
        0x61 -> :sswitch_5
        0x63 -> :sswitch_4
        0x68 -> :sswitch_3
        0x6c -> :sswitch_2
        0x6d -> :sswitch_2
        0x71 -> :sswitch_1
        0x73 -> :sswitch_1
        0x74 -> :sswitch_2
        0x76 -> :sswitch_3
        0x7a -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        0x41 -> :sswitch_17
        0x43 -> :sswitch_16
        0x48 -> :sswitch_15
        0x4c -> :sswitch_14
        0x4d -> :sswitch_13
        0x51 -> :sswitch_12
        0x53 -> :sswitch_11
        0x54 -> :sswitch_10
        0x56 -> :sswitch_f
        0x61 -> :sswitch_e
        0x63 -> :sswitch_d
        0x68 -> :sswitch_c
        0x6c -> :sswitch_b
        0x6d -> :sswitch_a
        0x71 -> :sswitch_9
        0x73 -> :sswitch_8
        0x74 -> :sswitch_7
        0x76 -> :sswitch_6
    .end sparse-switch
.end method

.method private static arcToBezier(Landroid/graphics/Path;DDDDDDDDD)V
    .locals 62
    .param p0, "p"    # Landroid/graphics/Path;
    .param p1, "cx"    # D
    .param p3, "cy"    # D
    .param p5, "a"    # D
    .param p7, "b"    # D
    .param p9, "e1x"    # D
    .param p11, "e1y"    # D
    .param p13, "theta"    # D
    .param p15, "start"    # D
    .param p17, "sweep"    # D

    .line 750
    move-wide/from16 v0, p5

    const-wide/high16 v2, 0x4010000000000000L    # 4.0

    mul-double v4, p17, v2

    const-wide v6, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v4, v4

    .line 752
    .local v4, "numSegments":I
    move-wide/from16 v5, p15

    .line 753
    .local v5, "eta1":D
    invoke-static/range {p13 .. p14}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    .line 754
    .local v7, "cosTheta":D
    invoke-static/range {p13 .. p14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    .line 755
    .local v9, "sinTheta":D
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v11

    .line 756
    .local v11, "cosEta1":D
    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v13

    .line 757
    .local v13, "sinEta1":D
    neg-double v2, v0

    mul-double v2, v2, v7

    mul-double v2, v2, v13

    mul-double v17, p7, v9

    mul-double v17, v17, v11

    sub-double v2, v2, v17

    .line 758
    .local v2, "ep1x":D
    move-wide/from16 v17, v2

    .end local v2    # "ep1x":D
    .local v17, "ep1x":D
    neg-double v2, v0

    mul-double v2, v2, v9

    mul-double v2, v2, v13

    mul-double v19, p7, v7

    mul-double v19, v19, v11

    add-double v2, v2, v19

    .line 760
    .local v2, "ep1y":D
    move-wide/from16 v19, v2

    .end local v2    # "ep1y":D
    .local v19, "ep1y":D
    int-to-double v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double v2, p17, v2

    .line 761
    .local v2, "anglePerSegment":D
    const/16 v21, 0x0

    move-wide/from16 v23, v5

    move/from16 v15, v21

    move-wide/from16 v5, p9

    move-wide/from16 v21, v17

    move-wide/from16 v17, p11

    .end local p9    # "e1x":D
    .end local p11    # "e1y":D
    .local v5, "e1x":D
    .local v15, "i":I
    .local v17, "e1y":D
    .local v21, "ep1x":D
    .local v23, "eta1":D
    :goto_0
    if-ge v15, v4, :cond_0

    .line 762
    add-double v27, v23, v2

    .line 763
    .local v27, "eta2":D
    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->sin(D)D

    move-result-wide v29

    .line 764
    .local v29, "sinEta2":D
    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->cos(D)D

    move-result-wide v31

    .line 765
    .local v31, "cosEta2":D
    mul-double v33, v0, v7

    mul-double v33, v33, v31

    add-double v33, p1, v33

    mul-double v35, p7, v9

    mul-double v35, v35, v29

    move-wide/from16 v37, v2

    .end local v2    # "anglePerSegment":D
    .local v37, "anglePerSegment":D
    sub-double v2, v33, v35

    .line 766
    .local v2, "e2x":D
    mul-double v33, v0, v9

    mul-double v33, v33, v31

    add-double v33, p3, v33

    mul-double v35, p7, v7

    mul-double v35, v35, v29

    move-wide/from16 v39, v11

    .end local v11    # "cosEta1":D
    .local v39, "cosEta1":D
    add-double v11, v33, v35

    .line 767
    .local v11, "e2y":D
    move-wide/from16 v33, v13

    .end local v13    # "sinEta1":D
    .local v33, "sinEta1":D
    neg-double v13, v0

    mul-double v13, v13, v7

    mul-double v13, v13, v29

    mul-double v35, p7, v9

    mul-double v35, v35, v31

    sub-double v13, v13, v35

    .line 768
    .local v13, "ep2x":D
    move-wide/from16 p9, v11

    .end local v11    # "e2y":D
    .local p9, "e2y":D
    neg-double v11, v0

    mul-double v11, v11, v9

    mul-double v11, v11, v29

    mul-double v35, p7, v7

    mul-double v35, v35, v31

    add-double v11, v11, v35

    .line 769
    .local v11, "ep2y":D
    sub-double v35, v27, v23

    const-wide/high16 v41, 0x4000000000000000L    # 2.0

    div-double v35, v35, v41

    invoke-static/range {v35 .. v36}, Ljava/lang/Math;->tan(D)D

    move-result-wide v35

    .line 770
    .local v35, "tanDiff2":D
    sub-double v41, v27, v23

    .line 771
    invoke-static/range {v41 .. v42}, Ljava/lang/Math;->sin(D)D

    move-result-wide v41

    const-wide/high16 v43, 0x4008000000000000L    # 3.0

    mul-double v45, v35, v43

    mul-double v45, v45, v35

    const-wide/high16 v25, 0x4010000000000000L    # 4.0

    add-double v45, v45, v25

    invoke-static/range {v45 .. v46}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v45

    const-wide/high16 v47, 0x3ff0000000000000L    # 1.0

    sub-double v45, v45, v47

    mul-double v41, v41, v45

    div-double v41, v41, v43

    .line 772
    .local v41, "alpha":D
    mul-double v43, v41, v21

    add-double v0, v5, v43

    .line 773
    .local v0, "q1x":D
    mul-double v43, v41, v19

    move/from16 v16, v4

    move-wide/from16 p11, v5

    .end local v4    # "numSegments":I
    .end local v5    # "e1x":D
    .local v16, "numSegments":I
    .local p11, "e1x":D
    add-double v4, v17, v43

    .line 774
    .local v4, "q1y":D
    mul-double v43, v41, v13

    move-wide/from16 v45, v7

    .end local v7    # "cosTheta":D
    .local v45, "cosTheta":D
    sub-double v6, v2, v43

    .line 775
    .local v6, "q2x":D
    mul-double v43, v41, v11

    move-wide/from16 v47, v9

    move-wide/from16 v8, p9

    move-wide/from16 p9, v11

    .end local v9    # "sinTheta":D
    .end local v11    # "ep2y":D
    .local v8, "e2y":D
    .local v47, "sinTheta":D
    .local p9, "ep2y":D
    sub-double v10, v8, v43

    .line 778
    .local v10, "q2y":D
    const/4 v12, 0x0

    move/from16 v43, v15

    move-object/from16 v15, p0

    .end local v15    # "i":I
    .local v43, "i":I
    invoke-virtual {v15, v12, v12}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 780
    double-to-float v12, v0

    move-wide/from16 v56, v0

    .end local v0    # "q1x":D
    .local v56, "q1x":D
    double-to-float v0, v4

    double-to-float v1, v6

    move-wide/from16 v58, v4

    .end local v4    # "q1y":D
    .local v58, "q1y":D
    double-to-float v4, v10

    double-to-float v5, v2

    move-wide/from16 v60, v6

    .end local v6    # "q2x":D
    .local v60, "q2x":D
    double-to-float v6, v8

    move-object/from16 v49, p0

    move/from16 v50, v12

    move/from16 v51, v0

    move/from16 v52, v1

    move/from16 v53, v4

    move/from16 v54, v5

    move/from16 v55, v6

    invoke-virtual/range {v49 .. v55}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 786
    move-wide/from16 v23, v27

    .line 787
    move-wide v5, v2

    .line 788
    .end local p11    # "e1x":D
    .restart local v5    # "e1x":D
    move-wide/from16 v17, v8

    .line 789
    move-wide/from16 v21, v13

    .line 790
    move-wide/from16 v19, p9

    .line 761
    .end local v2    # "e2x":D
    .end local v8    # "e2y":D
    .end local v10    # "q2y":D
    .end local v13    # "ep2x":D
    .end local v27    # "eta2":D
    .end local v29    # "sinEta2":D
    .end local v31    # "cosEta2":D
    .end local v35    # "tanDiff2":D
    .end local v41    # "alpha":D
    .end local v56    # "q1x":D
    .end local v58    # "q1y":D
    .end local v60    # "q2x":D
    .end local p9    # "ep2y":D
    add-int/lit8 v0, v43, 0x1

    move v15, v0

    move/from16 v4, v16

    move-wide/from16 v13, v33

    move-wide/from16 v2, v37

    move-wide/from16 v11, v39

    move-wide/from16 v7, v45

    move-wide/from16 v9, v47

    move-wide/from16 v0, p5

    .end local v43    # "i":I
    .local v0, "i":I
    goto/16 :goto_0

    .line 792
    .end local v0    # "i":I
    .end local v16    # "numSegments":I
    .end local v33    # "sinEta1":D
    .end local v37    # "anglePerSegment":D
    .end local v39    # "cosEta1":D
    .end local v45    # "cosTheta":D
    .end local v47    # "sinTheta":D
    .local v2, "anglePerSegment":D
    .local v4, "numSegments":I
    .restart local v7    # "cosTheta":D
    .restart local v9    # "sinTheta":D
    .local v11, "cosEta1":D
    .local v13, "sinEta1":D
    :cond_0
    return-void
.end method

.method private static drawArc(Landroid/graphics/Path;FFFFFFFZZ)V
    .locals 73
    .param p0, "p"    # Landroid/graphics/Path;
    .param p1, "x0"    # F
    .param p2, "y0"    # F
    .param p3, "x1"    # F
    .param p4, "y1"    # F
    .param p5, "a"    # F
    .param p6, "b"    # F
    .param p7, "theta"    # F
    .param p8, "isMoreThanHalf"    # Z
    .param p9, "isPositiveArc"    # Z

    .line 657
    move/from16 v10, p1

    move/from16 v11, p2

    move/from16 v12, p3

    move/from16 v13, p4

    move/from16 v14, p5

    move/from16 v15, p6

    move/from16 v9, p9

    move/from16 v8, p7

    float-to-double v0, v8

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v35

    .line 659
    .local v35, "thetaD":D
    invoke-static/range {v35 .. v36}, Ljava/lang/Math;->cos(D)D

    move-result-wide v37

    .line 660
    .local v37, "cosTheta":D
    invoke-static/range {v35 .. v36}, Ljava/lang/Math;->sin(D)D

    move-result-wide v39

    .line 663
    .local v39, "sinTheta":D
    float-to-double v0, v10

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v37

    float-to-double v2, v11

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v39

    add-double/2addr v0, v2

    float-to-double v2, v14

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double v41, v0, v2

    .line 664
    .local v41, "x0p":D
    neg-float v0, v10

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v39

    float-to-double v2, v11

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v37

    add-double/2addr v0, v2

    float-to-double v2, v15

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double v43, v0, v2

    .line 665
    .local v43, "y0p":D
    float-to-double v0, v12

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v37

    float-to-double v2, v13

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v39

    add-double/2addr v0, v2

    float-to-double v2, v14

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double v45, v0, v2

    .line 666
    .local v45, "x1p":D
    neg-float v0, v12

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v39

    float-to-double v2, v13

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v37

    add-double/2addr v0, v2

    float-to-double v2, v15

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double v47, v0, v2

    .line 669
    .local v47, "y1p":D
    sub-double v49, v41, v45

    .line 670
    .local v49, "dx":D
    sub-double v51, v43, v47

    .line 671
    .local v51, "dy":D
    add-double v0, v41, v45

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    div-double v53, v0, v2

    .line 672
    .local v53, "xm":D
    add-double v0, v43, v47

    div-double v55, v0, v2

    .line 674
    .local v55, "ym":D
    mul-double v0, v49, v49

    mul-double v2, v51, v51

    add-double v6, v0, v2

    .line 675
    .local v6, "dsq":D
    const-string v0, "PathParser"

    const-wide/16 v1, 0x0

    cmpl-double v3, v6, v1

    if-nez v3, :cond_0

    .line 676
    const-string v1, " Points are coincident"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 677
    return-void

    .line 679
    :cond_0
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    div-double/2addr v3, v6

    const-wide/high16 v16, 0x3fd0000000000000L    # 0.25

    sub-double v57, v3, v16

    .line 680
    .local v57, "disc":D
    cmpg-double v3, v57, v1

    if-gez v3, :cond_1

    .line 681
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Points are too far apart "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 682
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    const-wide v2, 0x3ffffff583a53b8eL    # 1.99999

    div-double/2addr v0, v2

    double-to-float v5, v0

    .line 683
    .local v5, "adjust":F
    mul-float v16, v14, v5

    mul-float v17, v15, v5

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v18, v5

    .end local v5    # "adjust":F
    .local v18, "adjust":F
    move/from16 v5, v16

    move-wide/from16 v59, v6

    .end local v6    # "dsq":D
    .local v59, "dsq":D
    move/from16 v6, v17

    move/from16 v7, p7

    move/from16 v8, p8

    move v12, v9

    move/from16 v9, p9

    invoke-static/range {v0 .. v9}, Landroidx/core/graphics/PathParser$PathDataNode;->drawArc(Landroid/graphics/Path;FFFFFFFZZ)V

    .line 685
    return-void

    .line 687
    .end local v18    # "adjust":F
    .end local v59    # "dsq":D
    .restart local v6    # "dsq":D
    :cond_1
    move-wide/from16 v59, v6

    move v12, v9

    .end local v6    # "dsq":D
    .restart local v59    # "dsq":D
    invoke-static/range {v57 .. v58}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    .line 688
    .local v3, "s":D
    mul-double v5, v3, v49

    .line 689
    .local v5, "sdx":D
    mul-double v7, v3, v51

    .line 692
    .local v7, "sdy":D
    move/from16 v0, p8

    if-ne v0, v12, :cond_2

    .line 693
    sub-double v16, v53, v7

    .line 694
    .local v16, "cx":D
    add-double v18, v55, v5

    .local v18, "cy":D
    goto :goto_0

    .line 696
    .end local v16    # "cx":D
    .end local v18    # "cy":D
    :cond_2
    add-double v16, v53, v7

    .line 697
    .restart local v16    # "cx":D
    sub-double v18, v55, v5

    .line 700
    .restart local v18    # "cy":D
    :goto_0
    sub-double v1, v43, v18

    move-wide/from16 v61, v3

    .end local v3    # "s":D
    .local v61, "s":D
    sub-double v3, v41, v16

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v1

    .line 702
    .local v1, "eta0":D
    sub-double v3, v47, v18

    move-wide/from16 v63, v5

    .end local v5    # "sdx":D
    .local v63, "sdx":D
    sub-double v5, v45, v16

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v3

    .line 704
    .local v3, "eta1":D
    sub-double v5, v3, v1

    .line 705
    .local v5, "sweep":D
    const-wide/16 v20, 0x0

    cmpl-double v9, v5, v20

    if-ltz v9, :cond_3

    const/4 v9, 0x1

    goto :goto_1

    :cond_3
    const/4 v9, 0x0

    :goto_1
    if-eq v12, v9, :cond_5

    .line 706
    const-wide v22, 0x401921fb54442d18L    # 6.283185307179586

    const-wide/16 v20, 0x0

    cmpl-double v9, v5, v20

    if-lez v9, :cond_4

    .line 707
    sub-double v5, v5, v22

    goto :goto_2

    .line 709
    :cond_4
    add-double v5, v5, v22

    .line 713
    :cond_5
    :goto_2
    move-wide/from16 v65, v3

    .end local v3    # "eta1":D
    .local v65, "eta1":D
    float-to-double v3, v14

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v16, v16, v3

    .line 714
    float-to-double v3, v15

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v3, v3, v18

    .line 715
    .end local v18    # "cy":D
    .local v3, "cy":D
    move-wide/from16 v67, v16

    .line 716
    .local v67, "tcx":D
    mul-double v18, v16, v37

    mul-double v20, v3, v39

    sub-double v69, v18, v20

    .end local v16    # "cx":D
    .local v69, "cx":D
    move-wide/from16 v17, v69

    .line 717
    mul-double v19, v67, v39

    mul-double v21, v3, v37

    add-double v3, v19, v21

    move-wide/from16 v19, v3

    .line 719
    move-wide/from16 v71, v3

    .end local v3    # "cy":D
    .local v71, "cy":D
    float-to-double v3, v14

    move-wide/from16 v21, v3

    float-to-double v3, v15

    move-wide/from16 v23, v3

    float-to-double v3, v10

    move-wide/from16 v25, v3

    float-to-double v3, v11

    move-wide/from16 v27, v3

    move-object/from16 v16, p0

    move-wide/from16 v29, v35

    move-wide/from16 v31, v1

    move-wide/from16 v33, v5

    invoke-static/range {v16 .. v34}, Landroidx/core/graphics/PathParser$PathDataNode;->arcToBezier(Landroid/graphics/Path;DDDDDDDDD)V

    .line 720
    return-void
.end method

.method public static nodesToPath([Landroidx/core/graphics/PathParser$PathDataNode;Landroid/graphics/Path;)V
    .locals 5
    .param p0, "node"    # [Landroidx/core/graphics/PathParser$PathDataNode;
    .param p1, "path"    # Landroid/graphics/Path;

    .line 369
    const/4 v0, 0x6

    new-array v0, v0, [F

    .line 370
    .local v0, "current":[F
    const/16 v1, 0x6d

    .line 371
    .local v1, "previousCommand":C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_0

    .line 372
    aget-object v3, p0, v2

    iget-char v3, v3, Landroidx/core/graphics/PathParser$PathDataNode;->mType:C

    aget-object v4, p0, v2

    iget-object v4, v4, Landroidx/core/graphics/PathParser$PathDataNode;->mParams:[F

    invoke-static {p1, v0, v1, v3, v4}, Landroidx/core/graphics/PathParser$PathDataNode;->addCommand(Landroid/graphics/Path;[FCC[F)V

    .line 373
    aget-object v3, p0, v2

    iget-char v1, v3, Landroidx/core/graphics/PathParser$PathDataNode;->mType:C

    .line 371
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 375
    .end local v2    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public interpolatePathDataNode(Landroidx/core/graphics/PathParser$PathDataNode;Landroidx/core/graphics/PathParser$PathDataNode;F)V
    .locals 4
    .param p1, "nodeFrom"    # Landroidx/core/graphics/PathParser$PathDataNode;
    .param p2, "nodeTo"    # Landroidx/core/graphics/PathParser$PathDataNode;
    .param p3, "fraction"    # F

    .line 388
    iget-char v0, p1, Landroidx/core/graphics/PathParser$PathDataNode;->mType:C

    iput-char v0, p0, Landroidx/core/graphics/PathParser$PathDataNode;->mType:C

    .line 389
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p1, Landroidx/core/graphics/PathParser$PathDataNode;->mParams:[F

    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 390
    iget-object v2, p0, Landroidx/core/graphics/PathParser$PathDataNode;->mParams:[F

    aget v1, v1, v0

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float/2addr v3, p3

    mul-float v1, v1, v3

    iget-object v3, p2, Landroidx/core/graphics/PathParser$PathDataNode;->mParams:[F

    aget v3, v3, v0

    mul-float v3, v3, p3

    add-float/2addr v1, v3

    aput v1, v2, v0

    .line 389
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 393
    .end local v0    # "i":I
    :cond_0
    return-void
.end method
