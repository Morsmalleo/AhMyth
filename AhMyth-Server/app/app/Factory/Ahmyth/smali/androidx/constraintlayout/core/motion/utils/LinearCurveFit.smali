.class public Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;
.super Landroidx/constraintlayout/core/motion/utils/CurveFit;
.source "LinearCurveFit.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "LinearCurveFit"


# instance fields
.field private mExtrapolate:Z

.field mSlopeTemp:[D

.field private mT:[D

.field private mTotalLength:D

.field private mY:[[D


# direct methods
.method public constructor <init>([D[[D)V
    .locals 21
    .param p1, "time"    # [D
    .param p2, "y"    # [[D

    .line 32
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct/range {p0 .. p0}, Landroidx/constraintlayout/core/motion/utils/CurveFit;-><init>()V

    .line 28
    const-wide/high16 v3, 0x7ff8000000000000L    # Double.NaN

    iput-wide v3, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mTotalLength:D

    .line 29
    const/4 v3, 0x1

    iput-boolean v3, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mExtrapolate:Z

    .line 33
    array-length v3, v1

    .line 34
    .local v3, "N":I
    const/4 v4, 0x0

    aget-object v5, v2, v4

    array-length v5, v5

    .line 35
    .local v5, "dim":I
    new-array v6, v5, [D

    iput-object v6, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mSlopeTemp:[D

    .line 36
    iput-object v1, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    .line 37
    iput-object v2, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    .line 38
    const/4 v6, 0x2

    if-le v5, v6, :cond_2

    .line 39
    const-wide/16 v6, 0x0

    .line 40
    .local v6, "sum":D
    const-wide/16 v8, 0x0

    .local v8, "lastx":D
    const-wide/16 v10, 0x0

    .line 41
    .local v10, "lasty":D
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    array-length v13, v1

    if-ge v12, v13, :cond_1

    .line 42
    aget-object v13, v2, v12

    aget-wide v14, v13, v4

    .line 43
    .local v14, "px":D
    aget-object v13, v2, v12

    aget-wide v16, v13, v4

    .line 44
    .local v16, "py":D
    if-lez v12, :cond_0

    .line 45
    move/from16 v18, v5

    .end local v5    # "dim":I
    .local v18, "dim":I
    sub-double v4, v14, v8

    move-wide/from16 v19, v14

    .end local v14    # "px":D
    .local v19, "px":D
    sub-double v13, v16, v10

    invoke-static {v4, v5, v13, v14}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v4

    add-double/2addr v6, v4

    goto :goto_1

    .line 44
    .end local v18    # "dim":I
    .end local v19    # "px":D
    .restart local v5    # "dim":I
    .restart local v14    # "px":D
    :cond_0
    move/from16 v18, v5

    move-wide/from16 v19, v14

    .line 47
    .end local v5    # "dim":I
    .end local v14    # "px":D
    .restart local v18    # "dim":I
    .restart local v19    # "px":D
    :goto_1
    move-wide/from16 v8, v19

    .line 48
    move-wide/from16 v10, v16

    .line 41
    .end local v16    # "py":D
    .end local v19    # "px":D
    add-int/lit8 v12, v12, 0x1

    move/from16 v5, v18

    const/4 v4, 0x0

    goto :goto_0

    .end local v18    # "dim":I
    .restart local v5    # "dim":I
    :cond_1
    move/from16 v18, v5

    .line 50
    .end local v5    # "dim":I
    .end local v12    # "i":I
    .restart local v18    # "dim":I
    const-wide/16 v4, 0x0

    iput-wide v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mTotalLength:D

    goto :goto_2

    .line 38
    .end local v6    # "sum":D
    .end local v8    # "lastx":D
    .end local v10    # "lasty":D
    .end local v18    # "dim":I
    .restart local v5    # "dim":I
    :cond_2
    move/from16 v18, v5

    .line 52
    .end local v5    # "dim":I
    .restart local v18    # "dim":I
    :goto_2
    return-void
.end method

.method private getLength2D(D)D
    .locals 34
    .param p1, "t"    # D

    .line 62
    move-object/from16 v0, p0

    iget-wide v1, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mTotalLength:D

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_0

    .line 63
    return-wide v2

    .line 65
    :cond_0
    iget-object v1, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    array-length v4, v1

    .line 66
    .local v4, "n":I
    const/4 v5, 0x0

    aget-wide v6, v1, v5

    cmpg-double v8, p1, v6

    if-gtz v8, :cond_1

    .line 67
    return-wide v2

    .line 69
    :cond_1
    add-int/lit8 v6, v4, -0x1

    aget-wide v6, v1, v6

    cmpl-double v1, p1, v6

    if-ltz v1, :cond_2

    .line 70
    iget-wide v1, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mTotalLength:D

    return-wide v1

    .line 72
    :cond_2
    const-wide/16 v6, 0x0

    .line 73
    .local v6, "sum":D
    const-wide/16 v8, 0x0

    .local v8, "last_x":D
    const-wide/16 v10, 0x0

    .line 75
    .local v10, "last_y":D
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    add-int/lit8 v12, v4, -0x1

    if-ge v1, v12, :cond_6

    .line 76
    iget-object v12, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v13, v12, v1

    aget-wide v14, v13, v5

    .line 77
    .local v14, "px":D
    aget-object v12, v12, v1

    const/4 v13, 0x1

    aget-wide v16, v12, v13

    .line 78
    .local v16, "py":D
    if-lez v1, :cond_3

    .line 79
    sub-double v2, v14, v8

    move-wide/from16 v20, v14

    .end local v14    # "px":D
    .local v20, "px":D
    sub-double v13, v16, v10

    invoke-static {v2, v3, v13, v14}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v2

    add-double/2addr v6, v2

    goto :goto_1

    .line 78
    .end local v20    # "px":D
    .restart local v14    # "px":D
    :cond_3
    move-wide/from16 v20, v14

    .line 81
    .end local v14    # "px":D
    .restart local v20    # "px":D
    :goto_1
    move-wide/from16 v8, v20

    .line 82
    move-wide/from16 v10, v16

    .line 83
    iget-object v2, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    aget-wide v13, v2, v1

    cmpl-double v3, p1, v13

    if-nez v3, :cond_4

    .line 84
    return-wide v6

    .line 86
    :cond_4
    add-int/lit8 v3, v1, 0x1

    aget-wide v13, v2, v3

    cmpg-double v3, p1, v13

    if-gez v3, :cond_5

    .line 87
    add-int/lit8 v3, v1, 0x1

    aget-wide v13, v2, v3

    aget-wide v18, v2, v1

    sub-double v13, v13, v18

    .line 88
    .local v13, "h":D
    aget-wide v18, v2, v1

    sub-double v2, p1, v18

    div-double/2addr v2, v13

    .line 89
    .local v2, "x":D
    iget-object v15, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v18, v15, v1

    aget-wide v22, v18, v5

    .line 90
    .local v22, "x1":D
    add-int/lit8 v18, v1, 0x1

    aget-object v18, v15, v18

    aget-wide v24, v18, v5

    .line 91
    .local v24, "x2":D
    aget-object v5, v15, v1

    const/4 v12, 0x1

    aget-wide v18, v5, v12

    .line 92
    .local v18, "y1":D
    add-int/lit8 v5, v1, 0x1

    aget-object v5, v15, v5

    aget-wide v26, v5, v12

    .line 94
    .local v26, "y2":D
    const-wide/high16 v28, 0x3ff0000000000000L    # 1.0

    sub-double v30, v28, v2

    mul-double v30, v30, v18

    mul-double v32, v26, v2

    add-double v30, v30, v32

    move v12, v4

    .end local v4    # "n":I
    .local v12, "n":I
    sub-double v4, v16, v30

    .line 95
    .end local v16    # "py":D
    .local v4, "py":D
    sub-double v28, v28, v2

    mul-double v28, v28, v22

    mul-double v15, v24, v2

    add-double v28, v28, v15

    move-wide/from16 v30, v2

    .end local v2    # "x":D
    .local v30, "x":D
    sub-double v2, v20, v28

    .line 96
    .end local v20    # "px":D
    .local v2, "px":D
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v15

    add-double/2addr v6, v15

    .line 98
    return-wide v6

    .line 86
    .end local v2    # "px":D
    .end local v12    # "n":I
    .end local v13    # "h":D
    .end local v18    # "y1":D
    .end local v22    # "x1":D
    .end local v24    # "x2":D
    .end local v26    # "y2":D
    .end local v30    # "x":D
    .local v4, "n":I
    .restart local v16    # "py":D
    .restart local v20    # "px":D
    :cond_5
    move v12, v4

    .line 75
    .end local v4    # "n":I
    .end local v16    # "py":D
    .end local v20    # "px":D
    .restart local v12    # "n":I
    add-int/lit8 v1, v1, 0x1

    const-wide/16 v2, 0x0

    goto :goto_0

    .line 101
    .end local v1    # "i":I
    .end local v12    # "n":I
    .restart local v4    # "n":I
    :cond_6
    const-wide/16 v1, 0x0

    return-wide v1
.end method


# virtual methods
.method public getPos(DI)D
    .locals 18
    .param p1, "t"    # D
    .param p3, "j"    # I

    .line 211
    move-object/from16 v0, p0

    move/from16 v1, p3

    iget-object v2, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    array-length v3, v2

    .line 212
    .local v3, "n":I
    iget-boolean v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mExtrapolate:Z

    const/4 v5, 0x0

    if-eqz v4, :cond_1

    .line 213
    aget-wide v6, v2, v5

    cmpg-double v4, p1, v6

    if-gtz v4, :cond_0

    .line 214
    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v4, v4, v5

    aget-wide v6, v4, v1

    aget-wide v8, v2, v5

    sub-double v8, p1, v8

    aget-wide v4, v2, v5

    invoke-virtual {v0, v4, v5, v1}, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->getSlope(DI)D

    move-result-wide v4

    mul-double v8, v8, v4

    add-double/2addr v6, v8

    return-wide v6

    .line 216
    :cond_0
    add-int/lit8 v4, v3, -0x1

    aget-wide v4, v2, v4

    cmpl-double v6, p1, v4

    if-ltz v6, :cond_3

    .line 217
    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    add-int/lit8 v5, v3, -0x1

    aget-object v4, v4, v5

    aget-wide v5, v4, v1

    add-int/lit8 v4, v3, -0x1

    aget-wide v7, v2, v4

    sub-double v7, p1, v7

    add-int/lit8 v4, v3, -0x1

    aget-wide v9, v2, v4

    invoke-virtual {v0, v9, v10, v1}, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->getSlope(DI)D

    move-result-wide v9

    mul-double v7, v7, v9

    add-double/2addr v5, v7

    return-wide v5

    .line 220
    :cond_1
    aget-wide v6, v2, v5

    cmpg-double v4, p1, v6

    if-gtz v4, :cond_2

    .line 221
    iget-object v2, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v2, v2, v5

    aget-wide v4, v2, v1

    return-wide v4

    .line 223
    :cond_2
    add-int/lit8 v4, v3, -0x1

    aget-wide v4, v2, v4

    cmpl-double v2, p1, v4

    if-ltz v2, :cond_3

    .line 224
    iget-object v2, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    add-int/lit8 v4, v3, -0x1

    aget-object v2, v2, v4

    aget-wide v4, v2, v1

    return-wide v4

    .line 228
    :cond_3
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    add-int/lit8 v4, v3, -0x1

    if-ge v2, v4, :cond_6

    .line 229
    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    aget-wide v5, v4, v2

    cmpl-double v7, p1, v5

    if-nez v7, :cond_4

    .line 230
    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v4, v4, v2

    aget-wide v5, v4, v1

    return-wide v5

    .line 232
    :cond_4
    add-int/lit8 v5, v2, 0x1

    aget-wide v5, v4, v5

    cmpg-double v7, p1, v5

    if-gez v7, :cond_5

    .line 233
    add-int/lit8 v5, v2, 0x1

    aget-wide v5, v4, v5

    aget-wide v7, v4, v2

    sub-double/2addr v5, v7

    .line 234
    .local v5, "h":D
    aget-wide v7, v4, v2

    sub-double v7, p1, v7

    div-double/2addr v7, v5

    .line 235
    .local v7, "x":D
    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v9, v4, v2

    aget-wide v10, v9, v1

    .line 236
    .local v10, "y1":D
    add-int/lit8 v9, v2, 0x1

    aget-object v4, v4, v9

    aget-wide v12, v4, v1

    .line 237
    .local v12, "y2":D
    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v14, v7

    mul-double v14, v14, v10

    mul-double v16, v12, v7

    add-double v14, v14, v16

    return-wide v14

    .line 228
    .end local v5    # "h":D
    .end local v7    # "x":D
    .end local v10    # "y1":D
    .end local v12    # "y2":D
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 241
    .end local v2    # "i":I
    :cond_6
    const-wide/16 v4, 0x0

    return-wide v4
.end method

.method public getPos(D[D)V
    .locals 17
    .param p1, "t"    # D
    .param p3, "v"    # [D

    .line 105
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    array-length v2, v1

    .line 106
    .local v2, "n":I
    iget-object v3, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    const/4 v4, 0x0

    aget-object v3, v3, v4

    array-length v3, v3

    .line 107
    .local v3, "dim":I
    iget-boolean v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mExtrapolate:Z

    if-eqz v5, :cond_3

    .line 108
    aget-wide v5, v1, v4

    cmpg-double v7, p1, v5

    if-gtz v7, :cond_1

    .line 109
    aget-wide v5, v1, v4

    iget-object v1, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mSlopeTemp:[D

    invoke-virtual {v0, v5, v6, v1}, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->getSlope(D[D)V

    .line 110
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 111
    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v5, v5, v4

    aget-wide v6, v5, v1

    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    aget-wide v8, v5, v4

    sub-double v8, p1, v8

    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mSlopeTemp:[D

    aget-wide v10, v5, v1

    mul-double v8, v8, v10

    add-double/2addr v6, v8

    aput-wide v6, p3, v1

    .line 110
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 113
    .end local v1    # "j":I
    :cond_0
    return-void

    .line 115
    :cond_1
    add-int/lit8 v4, v2, -0x1

    aget-wide v4, v1, v4

    cmpl-double v6, p1, v4

    if-ltz v6, :cond_7

    .line 116
    add-int/lit8 v4, v2, -0x1

    aget-wide v4, v1, v4

    iget-object v1, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mSlopeTemp:[D

    invoke-virtual {v0, v4, v5, v1}, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->getSlope(D[D)V

    .line 117
    const/4 v1, 0x0

    .restart local v1    # "j":I
    :goto_1
    if-ge v1, v3, :cond_2

    .line 118
    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    add-int/lit8 v5, v2, -0x1

    aget-object v4, v4, v5

    aget-wide v5, v4, v1

    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    add-int/lit8 v7, v2, -0x1

    aget-wide v7, v4, v7

    sub-double v7, p1, v7

    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mSlopeTemp:[D

    aget-wide v9, v4, v1

    mul-double v7, v7, v9

    add-double/2addr v5, v7

    aput-wide v5, p3, v1

    .line 117
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 120
    .end local v1    # "j":I
    :cond_2
    return-void

    .line 123
    :cond_3
    aget-wide v5, v1, v4

    cmpg-double v7, p1, v5

    if-gtz v7, :cond_5

    .line 124
    const/4 v1, 0x0

    .restart local v1    # "j":I
    :goto_2
    if-ge v1, v3, :cond_4

    .line 125
    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v5, v5, v4

    aget-wide v6, v5, v1

    aput-wide v6, p3, v1

    .line 124
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 127
    .end local v1    # "j":I
    :cond_4
    return-void

    .line 129
    :cond_5
    add-int/lit8 v4, v2, -0x1

    aget-wide v4, v1, v4

    cmpl-double v1, p1, v4

    if-ltz v1, :cond_7

    .line 130
    const/4 v1, 0x0

    .restart local v1    # "j":I
    :goto_3
    if-ge v1, v3, :cond_6

    .line 131
    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    add-int/lit8 v5, v2, -0x1

    aget-object v4, v4, v5

    aget-wide v5, v4, v1

    aput-wide v5, p3, v1

    .line 130
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 133
    .end local v1    # "j":I
    :cond_6
    return-void

    .line 137
    :cond_7
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    add-int/lit8 v4, v2, -0x1

    if-ge v1, v4, :cond_b

    .line 138
    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    aget-wide v5, v4, v1

    cmpl-double v4, p1, v5

    if-nez v4, :cond_8

    .line 139
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_5
    if-ge v4, v3, :cond_8

    .line 140
    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v5, v5, v1

    aget-wide v6, v5, v4

    aput-wide v6, p3, v4

    .line 139
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 143
    .end local v4    # "j":I
    :cond_8
    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    add-int/lit8 v5, v1, 0x1

    aget-wide v5, v4, v5

    cmpg-double v7, p1, v5

    if-gez v7, :cond_a

    .line 144
    add-int/lit8 v5, v1, 0x1

    aget-wide v5, v4, v5

    aget-wide v7, v4, v1

    sub-double/2addr v5, v7

    .line 145
    .local v5, "h":D
    aget-wide v7, v4, v1

    sub-double v7, p1, v7

    div-double/2addr v7, v5

    .line 146
    .local v7, "x":D
    const/4 v4, 0x0

    .restart local v4    # "j":I
    :goto_6
    if-ge v4, v3, :cond_9

    .line 147
    iget-object v9, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v10, v9, v1

    aget-wide v11, v10, v4

    .line 148
    .local v11, "y1":D
    add-int/lit8 v10, v1, 0x1

    aget-object v9, v9, v10

    aget-wide v13, v9, v4

    .line 150
    .local v13, "y2":D
    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v9, v7

    mul-double v9, v9, v11

    mul-double v15, v13, v7

    add-double/2addr v9, v15

    aput-wide v9, p3, v4

    .line 146
    .end local v11    # "y1":D
    .end local v13    # "y2":D
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 152
    .end local v4    # "j":I
    :cond_9
    return-void

    .line 137
    .end local v5    # "h":D
    .end local v7    # "x":D
    :cond_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 155
    .end local v1    # "i":I
    :cond_b
    return-void
.end method

.method public getPos(D[F)V
    .locals 17
    .param p1, "t"    # D
    .param p3, "v"    # [F

    .line 158
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    array-length v2, v1

    .line 159
    .local v2, "n":I
    iget-object v3, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    const/4 v4, 0x0

    aget-object v3, v3, v4

    array-length v3, v3

    .line 160
    .local v3, "dim":I
    iget-boolean v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mExtrapolate:Z

    if-eqz v5, :cond_3

    .line 161
    aget-wide v5, v1, v4

    cmpg-double v7, p1, v5

    if-gtz v7, :cond_1

    .line 162
    aget-wide v5, v1, v4

    iget-object v1, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mSlopeTemp:[D

    invoke-virtual {v0, v5, v6, v1}, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->getSlope(D[D)V

    .line 163
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 164
    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v5, v5, v4

    aget-wide v6, v5, v1

    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    aget-wide v8, v5, v4

    sub-double v8, p1, v8

    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mSlopeTemp:[D

    aget-wide v10, v5, v1

    mul-double v8, v8, v10

    add-double/2addr v6, v8

    double-to-float v5, v6

    aput v5, p3, v1

    .line 163
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 166
    .end local v1    # "j":I
    :cond_0
    return-void

    .line 168
    :cond_1
    add-int/lit8 v4, v2, -0x1

    aget-wide v4, v1, v4

    cmpl-double v6, p1, v4

    if-ltz v6, :cond_7

    .line 169
    add-int/lit8 v4, v2, -0x1

    aget-wide v4, v1, v4

    iget-object v1, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mSlopeTemp:[D

    invoke-virtual {v0, v4, v5, v1}, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->getSlope(D[D)V

    .line 170
    const/4 v1, 0x0

    .restart local v1    # "j":I
    :goto_1
    if-ge v1, v3, :cond_2

    .line 171
    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    add-int/lit8 v5, v2, -0x1

    aget-object v4, v4, v5

    aget-wide v5, v4, v1

    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    add-int/lit8 v7, v2, -0x1

    aget-wide v7, v4, v7

    sub-double v7, p1, v7

    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mSlopeTemp:[D

    aget-wide v9, v4, v1

    mul-double v7, v7, v9

    add-double/2addr v5, v7

    double-to-float v4, v5

    aput v4, p3, v1

    .line 170
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 173
    .end local v1    # "j":I
    :cond_2
    return-void

    .line 176
    :cond_3
    aget-wide v5, v1, v4

    cmpg-double v7, p1, v5

    if-gtz v7, :cond_5

    .line 177
    const/4 v1, 0x0

    .restart local v1    # "j":I
    :goto_2
    if-ge v1, v3, :cond_4

    .line 178
    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v5, v5, v4

    aget-wide v6, v5, v1

    double-to-float v5, v6

    aput v5, p3, v1

    .line 177
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 180
    .end local v1    # "j":I
    :cond_4
    return-void

    .line 182
    :cond_5
    add-int/lit8 v4, v2, -0x1

    aget-wide v4, v1, v4

    cmpl-double v1, p1, v4

    if-ltz v1, :cond_7

    .line 183
    const/4 v1, 0x0

    .restart local v1    # "j":I
    :goto_3
    if-ge v1, v3, :cond_6

    .line 184
    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    add-int/lit8 v5, v2, -0x1

    aget-object v4, v4, v5

    aget-wide v5, v4, v1

    double-to-float v4, v5

    aput v4, p3, v1

    .line 183
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 186
    .end local v1    # "j":I
    :cond_6
    return-void

    .line 190
    :cond_7
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    add-int/lit8 v4, v2, -0x1

    if-ge v1, v4, :cond_b

    .line 191
    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    aget-wide v5, v4, v1

    cmpl-double v4, p1, v5

    if-nez v4, :cond_8

    .line 192
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_5
    if-ge v4, v3, :cond_8

    .line 193
    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v5, v5, v1

    aget-wide v6, v5, v4

    double-to-float v5, v6

    aput v5, p3, v4

    .line 192
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 196
    .end local v4    # "j":I
    :cond_8
    iget-object v4, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    add-int/lit8 v5, v1, 0x1

    aget-wide v5, v4, v5

    cmpg-double v7, p1, v5

    if-gez v7, :cond_a

    .line 197
    add-int/lit8 v5, v1, 0x1

    aget-wide v5, v4, v5

    aget-wide v7, v4, v1

    sub-double/2addr v5, v7

    .line 198
    .local v5, "h":D
    aget-wide v7, v4, v1

    sub-double v7, p1, v7

    div-double/2addr v7, v5

    .line 199
    .local v7, "x":D
    const/4 v4, 0x0

    .restart local v4    # "j":I
    :goto_6
    if-ge v4, v3, :cond_9

    .line 200
    iget-object v9, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v10, v9, v1

    aget-wide v11, v10, v4

    .line 201
    .local v11, "y1":D
    add-int/lit8 v10, v1, 0x1

    aget-object v9, v9, v10

    aget-wide v13, v9, v4

    .line 203
    .local v13, "y2":D
    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v9, v7

    mul-double v9, v9, v11

    mul-double v15, v13, v7

    add-double/2addr v9, v15

    double-to-float v9, v9

    aput v9, p3, v4

    .line 199
    .end local v11    # "y1":D
    .end local v13    # "y2":D
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 205
    .end local v4    # "j":I
    :cond_9
    return-void

    .line 190
    .end local v5    # "h":D
    .end local v7    # "x":D
    :cond_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 208
    .end local v1    # "i":I
    :cond_b
    return-void
.end method

.method public getSlope(DI)D
    .locals 17
    .param p1, "t"    # D
    .param p3, "j"    # I

    .line 270
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    array-length v2, v1

    .line 272
    .local v2, "n":I
    const/4 v3, 0x0

    aget-wide v4, v1, v3

    cmpg-double v6, p1, v4

    if-gez v6, :cond_0

    .line 273
    aget-wide v3, v1, v3

    .end local p1    # "t":D
    .local v3, "t":D
    goto :goto_0

    .line 274
    .end local v3    # "t":D
    .restart local p1    # "t":D
    :cond_0
    add-int/lit8 v3, v2, -0x1

    aget-wide v3, v1, v3

    cmpl-double v5, p1, v3

    if-ltz v5, :cond_1

    .line 275
    add-int/lit8 v3, v2, -0x1

    aget-wide v3, v1, v3

    .end local p1    # "t":D
    .restart local v3    # "t":D
    goto :goto_0

    .line 274
    .end local v3    # "t":D
    .restart local p1    # "t":D
    :cond_1
    move-wide/from16 v3, p1

    .line 277
    .end local p1    # "t":D
    .restart local v3    # "t":D
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    add-int/lit8 v5, v2, -0x1

    if-ge v1, v5, :cond_3

    .line 278
    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    add-int/lit8 v6, v1, 0x1

    aget-wide v6, v5, v6

    cmpg-double v8, v3, v6

    if-gtz v8, :cond_2

    .line 279
    add-int/lit8 v6, v1, 0x1

    aget-wide v6, v5, v6

    aget-wide v8, v5, v1

    sub-double/2addr v6, v8

    .line 280
    .local v6, "h":D
    aget-wide v8, v5, v1

    sub-double v8, v3, v8

    div-double/2addr v8, v6

    .line 281
    .local v8, "x":D
    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v10, v5, v1

    aget-wide v11, v10, p3

    .line 282
    .local v11, "y1":D
    add-int/lit8 v10, v1, 0x1

    aget-object v5, v5, v10

    aget-wide v13, v5, p3

    .line 283
    .local v13, "y2":D
    sub-double v15, v13, v11

    div-double/2addr v15, v6

    return-wide v15

    .line 277
    .end local v6    # "h":D
    .end local v8    # "x":D
    .end local v11    # "y1":D
    .end local v13    # "y2":D
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 286
    .end local v1    # "i":I
    :cond_3
    const-wide/16 v5, 0x0

    return-wide v5
.end method

.method public getSlope(D[D)V
    .locals 17
    .param p1, "t"    # D
    .param p3, "v"    # [D

    .line 245
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    array-length v2, v1

    .line 246
    .local v2, "n":I
    iget-object v3, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    const/4 v4, 0x0

    aget-object v3, v3, v4

    array-length v3, v3

    .line 247
    .local v3, "dim":I
    aget-wide v5, v1, v4

    cmpg-double v7, p1, v5

    if-gtz v7, :cond_0

    .line 248
    aget-wide v4, v1, v4

    .end local p1    # "t":D
    .local v4, "t":D
    goto :goto_0

    .line 249
    .end local v4    # "t":D
    .restart local p1    # "t":D
    :cond_0
    add-int/lit8 v4, v2, -0x1

    aget-wide v4, v1, v4

    cmpl-double v6, p1, v4

    if-ltz v6, :cond_1

    .line 250
    add-int/lit8 v4, v2, -0x1

    aget-wide v4, v1, v4

    .end local p1    # "t":D
    .restart local v4    # "t":D
    goto :goto_0

    .line 249
    .end local v4    # "t":D
    .restart local p1    # "t":D
    :cond_1
    move-wide/from16 v4, p1

    .line 253
    .end local p1    # "t":D
    .restart local v4    # "t":D
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    add-int/lit8 v6, v2, -0x1

    if-ge v1, v6, :cond_4

    .line 254
    iget-object v6, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    add-int/lit8 v7, v1, 0x1

    aget-wide v7, v6, v7

    cmpg-double v9, v4, v7

    if-gtz v9, :cond_3

    .line 255
    add-int/lit8 v7, v1, 0x1

    aget-wide v7, v6, v7

    aget-wide v9, v6, v1

    sub-double/2addr v7, v9

    .line 256
    .local v7, "h":D
    aget-wide v9, v6, v1

    sub-double v9, v4, v9

    div-double/2addr v9, v7

    .line 257
    .local v9, "x":D
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_2
    if-ge v6, v3, :cond_2

    .line 258
    iget-object v11, v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mY:[[D

    aget-object v12, v11, v1

    aget-wide v13, v12, v6

    .line 259
    .local v13, "y1":D
    add-int/lit8 v12, v1, 0x1

    aget-object v11, v11, v12

    aget-wide v15, v11, v6

    .line 261
    .local v15, "y2":D
    sub-double v11, v15, v13

    div-double/2addr v11, v7

    aput-wide v11, p3, v6

    .line 257
    .end local v13    # "y1":D
    .end local v15    # "y2":D
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 263
    .end local v6    # "j":I
    :cond_2
    goto :goto_3

    .line 253
    .end local v7    # "h":D
    .end local v9    # "x":D
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 266
    .end local v1    # "i":I
    :cond_4
    :goto_3
    return-void
.end method

.method public getTimePoints()[D
    .locals 1

    .line 291
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;->mT:[D

    return-object v0
.end method
