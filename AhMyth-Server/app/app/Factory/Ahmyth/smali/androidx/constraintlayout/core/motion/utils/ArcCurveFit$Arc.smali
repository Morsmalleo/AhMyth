.class Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;
.super Ljava/lang/Object;
.source "ArcCurveFit.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/core/motion/utils/ArcCurveFit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Arc"
.end annotation


# static fields
.field private static final EPSILON:D = 0.001

.field private static final TAG:Ljava/lang/String; = "Arc"

.field private static ourPercent:[D


# instance fields
.field linear:Z

.field mArcDistance:D

.field mArcVelocity:D

.field mEllipseA:D

.field mEllipseB:D

.field mEllipseCenterX:D

.field mEllipseCenterY:D

.field mLut:[D

.field mOneOverDeltaTime:D

.field mTime1:D

.field mTime2:D

.field mTmpCosAngle:D

.field mTmpSinAngle:D

.field mVertical:Z

.field mX1:D

.field mX2:D

.field mY1:D

.field mY2:D


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 285
    const/16 v0, 0x5b

    new-array v0, v0, [D

    sput-object v0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    return-void
.end method

.method constructor <init>(IDDDDDD)V
    .locals 22
    .param p1, "mode"    # I
    .param p2, "t1"    # D
    .param p4, "t2"    # D
    .param p6, "x1"    # D
    .param p8, "y1"    # D
    .param p10, "x2"    # D
    .param p12, "y2"    # D

    .line 303
    move-object/from16 v9, p0

    move/from16 v10, p1

    move-wide/from16 v11, p2

    move-wide/from16 v13, p4

    move-wide/from16 v7, p6

    move-wide/from16 v5, p8

    move-wide/from16 v3, p10

    move-wide/from16 v1, p12

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 300
    const/4 v0, 0x0

    iput-boolean v0, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->linear:Z

    .line 304
    const/4 v15, 0x1

    if-ne v10, v15, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    .line 305
    iput-wide v11, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTime1:D

    .line 306
    iput-wide v13, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTime2:D

    .line 307
    const-wide/high16 v16, 0x3ff0000000000000L    # 1.0

    sub-double v18, v13, v11

    div-double v11, v16, v18

    iput-wide v11, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    .line 308
    const/4 v0, 0x3

    if-ne v0, v10, :cond_1

    .line 309
    iput-boolean v15, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->linear:Z

    .line 311
    :cond_1
    sub-double v11, v3, v7

    .line 312
    .local v11, "dx":D
    sub-double v13, v1, v5

    .line 313
    .local v13, "dy":D
    iget-boolean v0, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->linear:Z

    if-nez v0, :cond_7

    invoke-static {v11, v12}, Ljava/lang/Math;->abs(D)D

    move-result-wide v16

    const-wide v18, 0x3f50624dd2f1a9fcL    # 0.001

    cmpg-double v0, v16, v18

    if-ltz v0, :cond_7

    invoke-static {v13, v14}, Ljava/lang/Math;->abs(D)D

    move-result-wide v16

    cmpg-double v0, v16, v18

    if-gez v0, :cond_2

    move-wide/from16 v20, v11

    move-wide/from16 v18, v13

    move-wide v12, v3

    move-wide v14, v5

    move-wide v10, v7

    goto/16 :goto_3

    .line 325
    :cond_2
    const/16 v0, 0x65

    new-array v0, v0, [D

    iput-object v0, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mLut:[D

    .line 326
    iget-boolean v0, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    const/16 v16, -0x1

    if-eqz v0, :cond_3

    const/4 v15, -0x1

    :cond_3
    int-to-double v1, v15

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v1, v1, v11

    iput-wide v1, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseA:D

    .line 327
    if-eqz v0, :cond_4

    const/4 v15, 0x1

    goto :goto_0

    :cond_4
    const/4 v15, -0x1

    :goto_0
    int-to-double v1, v15

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v1, v1, v13

    iput-wide v1, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseB:D

    .line 328
    if-eqz v0, :cond_5

    move-wide v1, v3

    goto :goto_1

    :cond_5
    move-wide v1, v7

    :goto_1
    iput-wide v1, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseCenterX:D

    .line 329
    if-eqz v0, :cond_6

    move-wide v0, v5

    goto :goto_2

    :cond_6
    move-wide/from16 v0, p12

    :goto_2
    iput-wide v0, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseCenterY:D

    .line 330
    move-object/from16 v0, p0

    move-wide v15, v11

    move-wide/from16 v10, p12

    .end local v11    # "dx":D
    .local v15, "dx":D
    move-wide/from16 v1, p6

    move-wide/from16 v18, v13

    move-wide v12, v3

    .end local v13    # "dy":D
    .local v18, "dy":D
    move-wide/from16 v3, p8

    move-wide/from16 v20, v15

    move-wide v14, v5

    .end local v15    # "dx":D
    .local v20, "dx":D
    move-wide/from16 v5, p10

    move-wide v10, v7

    move-wide/from16 v7, p12

    invoke-direct/range {v0 .. v8}, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->buildTable(DDDD)V

    .line 331
    iget-wide v0, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mArcDistance:D

    iget-wide v2, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double v0, v0, v2

    iput-wide v0, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mArcVelocity:D

    .line 332
    return-void

    .line 313
    .end local v18    # "dy":D
    .end local v20    # "dx":D
    .restart local v11    # "dx":D
    .restart local v13    # "dy":D
    :cond_7
    move-wide/from16 v20, v11

    move-wide/from16 v18, v13

    move-wide v12, v3

    move-wide v14, v5

    move-wide v10, v7

    .line 314
    .end local v11    # "dx":D
    .end local v13    # "dy":D
    .restart local v18    # "dy":D
    .restart local v20    # "dx":D
    :goto_3
    const/4 v0, 0x1

    iput-boolean v0, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->linear:Z

    .line 315
    iput-wide v10, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mX1:D

    .line 316
    iput-wide v12, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mX2:D

    .line 317
    iput-wide v14, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mY1:D

    .line 318
    move-wide/from16 v0, p12

    iput-wide v0, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mY2:D

    .line 319
    move-wide/from16 v4, v18

    move-wide/from16 v2, v20

    .end local v18    # "dy":D
    .end local v20    # "dx":D
    .local v2, "dx":D
    .local v4, "dy":D
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v6

    iput-wide v6, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mArcDistance:D

    .line 320
    iget-wide v10, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double v6, v6, v10

    iput-wide v6, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mArcVelocity:D

    .line 321
    iget-wide v6, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTime2:D

    iget-wide v10, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTime1:D

    sub-double v16, v6, v10

    div-double v0, v2, v16

    iput-wide v0, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseCenterX:D

    .line 322
    sub-double/2addr v6, v10

    div-double v0, v4, v6

    iput-wide v0, v9, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseCenterY:D

    .line 323
    return-void
.end method

.method private buildTable(DDDD)V
    .locals 27
    .param p1, "x1"    # D
    .param p3, "y1"    # D
    .param p5, "x2"    # D
    .param p7, "y2"    # D

    .line 397
    move-object/from16 v0, p0

    sub-double v1, p5, p1

    .line 398
    .local v1, "a":D
    sub-double v3, p3, p7

    .line 399
    .local v3, "b":D
    const-wide/16 v5, 0x0

    .local v5, "lx":D
    const-wide/16 v7, 0x0

    .line 400
    .local v7, "ly":D
    const-wide/16 v9, 0x0

    .line 401
    .local v9, "dist":D
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    sget-object v12, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    array-length v13, v12

    if-ge v11, v13, :cond_1

    .line 402
    const-wide v13, 0x4056800000000000L    # 90.0

    move-wide v15, v9

    .end local v9    # "dist":D
    .local v15, "dist":D
    int-to-double v9, v11

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v9, v9, v13

    array-length v12, v12

    add-int/lit8 v12, v12, -0x1

    int-to-double v12, v12

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v9, v12

    invoke-static {v9, v10}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v9

    .line 403
    .local v9, "angle":D
    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    .line 404
    .local v12, "s":D
    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v17

    .line 405
    .local v17, "c":D
    mul-double v19, v1, v12

    .line 406
    .local v19, "px":D
    mul-double v21, v3, v17

    .line 407
    .local v21, "py":D
    if-lez v11, :cond_0

    .line 408
    move-wide/from16 v23, v1

    .end local v1    # "a":D
    .local v23, "a":D
    sub-double v1, v19, v5

    move-wide/from16 v25, v3

    .end local v3    # "b":D
    .local v25, "b":D
    sub-double v3, v21, v7

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v1

    add-double/2addr v1, v15

    .line 409
    .end local v15    # "dist":D
    .local v1, "dist":D
    sget-object v3, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    aput-wide v1, v3, v11

    move-wide v15, v1

    goto :goto_1

    .line 407
    .end local v23    # "a":D
    .end local v25    # "b":D
    .local v1, "a":D
    .restart local v3    # "b":D
    .restart local v15    # "dist":D
    :cond_0
    move-wide/from16 v23, v1

    move-wide/from16 v25, v3

    .line 411
    .end local v1    # "a":D
    .end local v3    # "b":D
    .restart local v23    # "a":D
    .restart local v25    # "b":D
    :goto_1
    move-wide/from16 v5, v19

    .line 412
    move-wide/from16 v7, v21

    .line 401
    .end local v9    # "angle":D
    .end local v12    # "s":D
    .end local v17    # "c":D
    .end local v19    # "px":D
    .end local v21    # "py":D
    add-int/lit8 v11, v11, 0x1

    move-wide v9, v15

    move-wide/from16 v1, v23

    move-wide/from16 v3, v25

    goto :goto_0

    .end local v15    # "dist":D
    .end local v23    # "a":D
    .end local v25    # "b":D
    .restart local v1    # "a":D
    .restart local v3    # "b":D
    .local v9, "dist":D
    :cond_1
    move-wide/from16 v23, v1

    move-wide/from16 v25, v3

    move-wide v15, v9

    .line 415
    .end local v1    # "a":D
    .end local v3    # "b":D
    .end local v9    # "dist":D
    .end local v11    # "i":I
    .restart local v15    # "dist":D
    .restart local v23    # "a":D
    .restart local v25    # "b":D
    nop

    .end local v15    # "dist":D
    .restart local v9    # "dist":D
    iput-wide v9, v0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mArcDistance:D

    .line 417
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    sget-object v2, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    array-length v3, v2

    if-ge v1, v3, :cond_2

    .line 418
    aget-wide v3, v2, v1

    div-double/2addr v3, v9

    aput-wide v3, v2, v1

    .line 417
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 420
    .end local v1    # "i":I
    :cond_2
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_3
    iget-object v2, v0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mLut:[D

    array-length v3, v2

    if-ge v1, v3, :cond_5

    .line 421
    int-to-double v3, v1

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    int-to-double v11, v2

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    invoke-static {v11, v12}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v3, v11

    .line 422
    .local v3, "pos":D
    sget-object v2, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    invoke-static {v2, v3, v4}, Ljava/util/Arrays;->binarySearch([DD)I

    move-result v2

    .line 423
    .local v2, "index":I
    if-ltz v2, :cond_3

    .line 424
    iget-object v11, v0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mLut:[D

    int-to-double v12, v2

    sget-object v14, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    array-length v14, v14

    add-int/lit8 v14, v14, -0x1

    int-to-double v14, v14

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v12, v14

    aput-wide v12, v11, v1

    goto :goto_4

    .line 425
    :cond_3
    const/4 v11, -0x1

    if-ne v2, v11, :cond_4

    .line 426
    iget-object v11, v0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mLut:[D

    const-wide/16 v12, 0x0

    aput-wide v12, v11, v1

    goto :goto_4

    .line 428
    :cond_4
    neg-int v11, v2

    add-int/lit8 v11, v11, -0x2

    .line 429
    .local v11, "p1":I
    neg-int v12, v2

    add-int/lit8 v12, v12, -0x1

    .line 431
    .local v12, "p2":I
    int-to-double v13, v11

    sget-object v15, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    aget-wide v16, v15, v11

    sub-double v16, v3, v16

    aget-wide v18, v15, v12

    aget-wide v20, v15, v11

    sub-double v18, v18, v20

    div-double v16, v16, v18

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    add-double v13, v13, v16

    array-length v15, v15

    add-int/lit8 v15, v15, -0x1

    move-wide/from16 v16, v3

    move v4, v2

    .end local v2    # "index":I
    .end local v3    # "pos":D
    .local v4, "index":I
    .local v16, "pos":D
    int-to-double v2, v15

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v13, v2

    .line 433
    .local v13, "ans":D
    iget-object v2, v0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mLut:[D

    aput-wide v13, v2, v1

    .line 420
    .end local v4    # "index":I
    .end local v11    # "p1":I
    .end local v12    # "p2":I
    .end local v13    # "ans":D
    .end local v16    # "pos":D
    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 436
    .end local v1    # "i":I
    :cond_5
    return-void
.end method


# virtual methods
.method getDX()D
    .locals 8

    .line 351
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseA:D

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTmpCosAngle:D

    mul-double v0, v0, v2

    .line 352
    .local v0, "vx":D
    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseB:D

    neg-double v2, v2

    iget-wide v4, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTmpSinAngle:D

    mul-double v2, v2, v4

    .line 353
    .local v2, "vy":D
    iget-wide v4, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mArcVelocity:D

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v6

    div-double/2addr v4, v6

    .line 354
    .local v4, "norm":D
    iget-boolean v6, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v6, :cond_0

    neg-double v6, v0

    mul-double v6, v6, v4

    goto :goto_0

    :cond_0
    mul-double v6, v0, v4

    :goto_0
    return-wide v6
.end method

.method getDY()D
    .locals 8

    .line 358
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseA:D

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTmpCosAngle:D

    mul-double v0, v0, v2

    .line 359
    .local v0, "vx":D
    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseB:D

    neg-double v2, v2

    iget-wide v4, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTmpSinAngle:D

    mul-double v2, v2, v4

    .line 360
    .local v2, "vy":D
    iget-wide v4, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mArcVelocity:D

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v6

    div-double/2addr v4, v6

    .line 361
    .local v4, "norm":D
    iget-boolean v6, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v6, :cond_0

    neg-double v6, v2

    mul-double v6, v6, v4

    goto :goto_0

    :cond_0
    mul-double v6, v2, v4

    :goto_0
    return-wide v6
.end method

.method public getLinearDX(D)D
    .locals 2
    .param p1, "t"    # D

    .line 375
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseCenterX:D

    return-wide v0
.end method

.method public getLinearDY(D)D
    .locals 2
    .param p1, "t"    # D

    .line 379
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseCenterY:D

    return-wide v0
.end method

.method public getLinearX(D)D
    .locals 4
    .param p1, "t"    # D

    .line 365
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTime1:D

    sub-double v0, p1, v0

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double v0, v0, v2

    .line 366
    .end local p1    # "t":D
    .local v0, "t":D
    iget-wide p1, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mX1:D

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mX2:D

    sub-double/2addr v2, p1

    mul-double v2, v2, v0

    add-double/2addr p1, v2

    return-wide p1
.end method

.method public getLinearY(D)D
    .locals 4
    .param p1, "t"    # D

    .line 370
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTime1:D

    sub-double v0, p1, v0

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double v0, v0, v2

    .line 371
    .end local p1    # "t":D
    .local v0, "t":D
    iget-wide p1, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mY1:D

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mY2:D

    sub-double/2addr v2, p1

    mul-double v2, v2, v0

    add-double/2addr p1, v2

    return-wide p1
.end method

.method getX()D
    .locals 6

    .line 343
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseCenterX:D

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseA:D

    iget-wide v4, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTmpSinAngle:D

    mul-double v2, v2, v4

    add-double/2addr v0, v2

    return-wide v0
.end method

.method getY()D
    .locals 6

    .line 347
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseCenterY:D

    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mEllipseB:D

    iget-wide v4, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTmpCosAngle:D

    mul-double v2, v2, v4

    add-double/2addr v0, v2

    return-wide v0
.end method

.method lookup(D)D
    .locals 12
    .param p1, "v"    # D

    .line 383
    const-wide/16 v0, 0x0

    cmpg-double v2, p1, v0

    if-gtz v2, :cond_0

    .line 384
    return-wide v0

    .line 386
    :cond_0
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    cmpl-double v2, p1, v0

    if-ltz v2, :cond_1

    .line 387
    return-wide v0

    .line 389
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mLut:[D

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    int-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v1, v1, p1

    .line 390
    .local v1, "pos":D
    double-to-int v3, v1

    .line 391
    .local v3, "iv":I
    double-to-int v4, v1

    int-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    sub-double v4, v1, v4

    .line 393
    .local v4, "off":D
    aget-wide v6, v0, v3

    add-int/lit8 v8, v3, 0x1

    aget-wide v8, v0, v8

    aget-wide v10, v0, v3

    sub-double/2addr v8, v10

    mul-double v8, v8, v4

    add-double/2addr v6, v8

    return-wide v6
.end method

.method setPoint(D)V
    .locals 6
    .param p1, "time"    # D

    .line 335
    iget-boolean v0, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTime2:D

    sub-double/2addr v0, p1

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTime1:D

    sub-double v0, p1, v0

    :goto_0
    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double v0, v0, v2

    .line 336
    .local v0, "percent":D
    const-wide v2, 0x3ff921fb54442d18L    # 1.5707963267948966

    invoke-virtual {p0, v0, v1}, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->lookup(D)D

    move-result-wide v4

    mul-double v4, v4, v2

    .line 338
    .local v4, "angle":D
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    iput-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTmpSinAngle:D

    .line 339
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    iput-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit$Arc;->mTmpCosAngle:D

    .line 340
    return-void
.end method
