.class public Landroidx/constraintlayout/core/motion/utils/Oscillator;
.super Ljava/lang/Object;
.source "Oscillator.java"


# static fields
.field public static final BOUNCE:I = 0x6

.field public static final COS_WAVE:I = 0x5

.field public static final CUSTOM:I = 0x7

.field public static final REVERSE_SAW_WAVE:I = 0x4

.field public static final SAW_WAVE:I = 0x3

.field public static final SIN_WAVE:I = 0x0

.field public static final SQUARE_WAVE:I = 0x1

.field public static TAG:Ljava/lang/String; = null

.field public static final TRIANGLE_WAVE:I = 0x2


# instance fields
.field PI2:D

.field mArea:[D

.field mCustomCurve:Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;

.field mCustomType:Ljava/lang/String;

.field private mNormalized:Z

.field mPeriod:[F

.field mPosition:[D

.field mType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    const-string v0, "Oscillator"

    sput-object v0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x0

    new-array v1, v0, [F

    iput-object v1, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPeriod:[F

    .line 28
    new-array v1, v0, [D

    iput-object v1, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPosition:[D

    .line 41
    const-wide v1, 0x401921fb54442d18L    # 6.283185307179586

    iput-wide v1, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->PI2:D

    .line 42
    iput-boolean v0, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mNormalized:Z

    .line 45
    return-void
.end method


# virtual methods
.method public addPoint(DF)V
    .locals 5
    .param p1, "position"    # D
    .param p3, "period"    # F

    .line 61
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPeriod:[F

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    .line 62
    .local v0, "len":I
    iget-object v1, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPosition:[D

    invoke-static {v1, p1, p2}, Ljava/util/Arrays;->binarySearch([DD)I

    move-result v1

    .line 63
    .local v1, "j":I
    if-gez v1, :cond_0

    .line 64
    neg-int v2, v1

    add-int/lit8 v1, v2, -0x1

    .line 66
    :cond_0
    iget-object v2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPosition:[D

    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v2

    iput-object v2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPosition:[D

    .line 67
    iget-object v2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPeriod:[F

    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v2

    iput-object v2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPeriod:[F

    .line 68
    new-array v2, v0, [D

    iput-object v2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mArea:[D

    .line 69
    iget-object v2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPosition:[D

    add-int/lit8 v3, v1, 0x1

    sub-int v4, v0, v1

    add-int/lit8 v4, v4, -0x1

    invoke-static {v2, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 70
    iget-object v2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPosition:[D

    aput-wide p1, v2, v1

    .line 71
    iget-object v2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPeriod:[F

    aput p3, v2, v1

    .line 72
    const/4 v2, 0x0

    iput-boolean v2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mNormalized:Z

    .line 73
    return-void
.end method

.method getDP(D)D
    .locals 18
    .param p1, "time"    # D

    .line 148
    move-object/from16 v0, p0

    const-wide/16 v1, 0x0

    cmpg-double v3, p1, v1

    if-gtz v3, :cond_0

    .line 149
    const-wide v3, 0x3ee4f8b588e368f1L    # 1.0E-5

    .end local p1    # "time":D
    .local v3, "time":D
    goto :goto_0

    .line 150
    .end local v3    # "time":D
    .restart local p1    # "time":D
    :cond_0
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    cmpl-double v5, p1, v3

    if-ltz v5, :cond_1

    .line 151
    const-wide v3, 0x3feffffde7210be9L    # 0.999999

    .end local p1    # "time":D
    .restart local v3    # "time":D
    goto :goto_0

    .line 150
    .end local v3    # "time":D
    .restart local p1    # "time":D
    :cond_1
    move-wide/from16 v3, p1

    .line 153
    .end local p1    # "time":D
    .restart local v3    # "time":D
    :goto_0
    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPosition:[D

    invoke-static {v5, v3, v4}, Ljava/util/Arrays;->binarySearch([DD)I

    move-result v5

    .line 154
    .local v5, "index":I
    const-wide/16 v6, 0x0

    .line 155
    .local v6, "p":D
    if-lez v5, :cond_2

    .line 156
    return-wide v1

    .line 158
    :cond_2
    if-eqz v5, :cond_3

    .line 159
    neg-int v1, v5

    add-int/lit8 v5, v1, -0x1

    .line 160
    move-wide v1, v3

    .line 161
    .local v1, "t":D
    iget-object v8, v0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPeriod:[F

    aget v9, v8, v5

    add-int/lit8 v10, v5, -0x1

    aget v10, v8, v10

    sub-float/2addr v9, v10

    float-to-double v9, v9

    iget-object v11, v0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPosition:[D

    aget-wide v12, v11, v5

    add-int/lit8 v14, v5, -0x1

    aget-wide v14, v11, v14

    sub-double/2addr v12, v14

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v9, v12

    .line 162
    .local v9, "m":D
    mul-double v12, v9, v1

    add-int/lit8 v14, v5, -0x1

    aget v8, v8, v14

    float-to-double v14, v8

    add-int/lit8 v8, v5, -0x1

    aget-wide v16, v11, v8

    mul-double v16, v16, v9

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    sub-double v14, v14, v16

    add-double v6, v12, v14

    .line 164
    .end local v1    # "t":D
    .end local v9    # "m":D
    :cond_3
    return-wide v6
.end method

.method getP(D)D
    .locals 19
    .param p1, "time"    # D

    .line 103
    move-object/from16 v0, p0

    const-wide/16 v1, 0x0

    cmpg-double v3, p1, v1

    if-gez v3, :cond_0

    .line 104
    const-wide/16 v1, 0x0

    .end local p1    # "time":D
    .local v1, "time":D
    goto :goto_0

    .line 105
    .end local v1    # "time":D
    .restart local p1    # "time":D
    :cond_0
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    cmpl-double v3, p1, v1

    if-lez v3, :cond_1

    .line 106
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .end local p1    # "time":D
    .restart local v1    # "time":D
    goto :goto_0

    .line 105
    .end local v1    # "time":D
    .restart local p1    # "time":D
    :cond_1
    move-wide/from16 v1, p1

    .line 108
    .end local p1    # "time":D
    .restart local v1    # "time":D
    :goto_0
    iget-object v3, v0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPosition:[D

    invoke-static {v3, v1, v2}, Ljava/util/Arrays;->binarySearch([DD)I

    move-result v3

    .line 109
    .local v3, "index":I
    const-wide/16 v4, 0x0

    .line 110
    .local v4, "p":D
    if-lez v3, :cond_2

    .line 111
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    move-wide/from16 p1, v1

    goto :goto_1

    .line 112
    :cond_2
    if-eqz v3, :cond_3

    .line 113
    neg-int v6, v3

    add-int/lit8 v3, v6, -0x1

    .line 114
    move-wide v6, v1

    .line 115
    .local v6, "t":D
    iget-object v8, v0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPeriod:[F

    aget v9, v8, v3

    add-int/lit8 v10, v3, -0x1

    aget v10, v8, v10

    sub-float/2addr v9, v10

    float-to-double v9, v9

    iget-object v11, v0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPosition:[D

    aget-wide v12, v11, v3

    add-int/lit8 v14, v3, -0x1

    aget-wide v14, v11, v14

    sub-double/2addr v12, v14

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v9, v12

    .line 116
    .local v9, "m":D
    iget-object v12, v0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mArea:[D

    add-int/lit8 v13, v3, -0x1

    aget-wide v13, v12, v13

    add-int/lit8 v12, v3, -0x1

    aget v8, v8, v12

    move-wide/from16 p1, v1

    .end local v1    # "time":D
    .restart local p1    # "time":D
    float-to-double v0, v8

    add-int/lit8 v2, v3, -0x1

    aget-wide v15, v11, v2

    mul-double v15, v15, v9

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v0, v15

    add-int/lit8 v2, v3, -0x1

    aget-wide v15, v11, v2

    sub-double v15, v6, v15

    mul-double v0, v0, v15

    add-double/2addr v13, v0

    mul-double v0, v6, v6

    add-int/lit8 v2, v3, -0x1

    aget-wide v15, v11, v2

    add-int/lit8 v2, v3, -0x1

    aget-wide v17, v11, v2

    mul-double v15, v15, v17

    sub-double/2addr v0, v15

    mul-double v0, v0, v9

    const-wide/high16 v11, 0x4000000000000000L    # 2.0

    div-double/2addr v0, v11

    add-double v4, v13, v0

    goto :goto_1

    .line 112
    .end local v6    # "t":D
    .end local v9    # "m":D
    .end local p1    # "time":D
    .restart local v1    # "time":D
    :cond_3
    move-wide/from16 p1, v1

    .line 120
    .end local v1    # "time":D
    .restart local p1    # "time":D
    :goto_1
    return-wide v4
.end method

.method public getSlope(DDD)D
    .locals 16
    .param p1, "time"    # D
    .param p3, "phase"    # D
    .param p5, "dphase"    # D

    .line 168
    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p2}, Landroidx/constraintlayout/core/motion/utils/Oscillator;->getP(D)D

    move-result-wide v1

    add-double v1, p3, v1

    .line 170
    .local v1, "angle":D
    invoke-virtual/range {p0 .. p2}, Landroidx/constraintlayout/core/motion/utils/Oscillator;->getDP(D)D

    move-result-wide v3

    add-double v3, v3, p5

    .line 171
    .local v3, "dangle_dtime":D
    iget v5, v0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mType:I

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    const-wide/high16 v8, 0x4010000000000000L    # 4.0

    packed-switch v5, :pswitch_data_0

    .line 174
    iget-wide v5, v0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->PI2:D

    mul-double v7, v5, v3

    mul-double v5, v5, v1

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    mul-double v7, v7, v5

    return-wide v7

    .line 188
    :pswitch_0
    iget-object v5, v0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mCustomCurve:Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    rem-double v6, v1, v6

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v7, v8}, Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;->getSlope(DI)D

    move-result-wide v5

    return-wide v5

    .line 186
    :pswitch_1
    mul-double v10, v3, v8

    mul-double v12, v1, v8

    add-double/2addr v12, v6

    rem-double/2addr v12, v8

    sub-double/2addr v12, v6

    mul-double v10, v10, v12

    return-wide v10

    .line 184
    :pswitch_2
    iget-wide v5, v0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->PI2:D

    neg-double v7, v5

    mul-double v7, v7, v3

    mul-double v5, v5, v1

    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v5

    mul-double v7, v7, v5

    return-wide v7

    .line 182
    :pswitch_3
    neg-double v8, v3

    mul-double v8, v8, v6

    return-wide v8

    .line 180
    :pswitch_4
    mul-double v6, v6, v3

    return-wide v6

    .line 178
    :pswitch_5
    mul-double v10, v3, v8

    mul-double v12, v1, v8

    const-wide/high16 v14, 0x4008000000000000L    # 3.0

    add-double/2addr v12, v14

    rem-double/2addr v12, v8

    sub-double/2addr v12, v6

    invoke-static {v12, v13}, Ljava/lang/Math;->signum(D)D

    move-result-wide v5

    mul-double v10, v10, v5

    return-wide v10

    .line 176
    :pswitch_6
    const-wide/16 v5, 0x0

    return-wide v5

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getValue(DD)D
    .locals 11
    .param p1, "time"    # D
    .param p3, "phase"    # D

    .line 124
    invoke-virtual {p0, p1, p2}, Landroidx/constraintlayout/core/motion/utils/Oscillator;->getP(D)D

    move-result-wide v0

    add-double/2addr v0, p3

    .line 125
    .local v0, "angle":D
    iget v2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mType:I

    const-wide/high16 v3, 0x4010000000000000L    # 4.0

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    packed-switch v2, :pswitch_data_0

    .line 128
    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->PI2:D

    mul-double v2, v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    return-wide v2

    .line 143
    :pswitch_0
    iget-object v2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mCustomCurve:Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;

    rem-double v3, v0, v7

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;->getPos(DI)D

    move-result-wide v2

    return-wide v2

    .line 140
    :pswitch_1
    mul-double v9, v0, v3

    rem-double/2addr v9, v3

    sub-double/2addr v9, v5

    invoke-static {v9, v10}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    sub-double v2, v7, v2

    .line 141
    .local v2, "x":D
    mul-double v4, v2, v2

    sub-double/2addr v7, v4

    return-wide v7

    .line 138
    .end local v2    # "x":D
    :pswitch_2
    iget-wide v2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->PI2:D

    add-double v4, p3, v0

    mul-double v2, v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    return-wide v2

    .line 136
    :pswitch_3
    mul-double v2, v0, v5

    add-double/2addr v2, v7

    rem-double/2addr v2, v5

    sub-double/2addr v7, v2

    return-wide v7

    .line 134
    :pswitch_4
    mul-double v2, v0, v5

    add-double/2addr v2, v7

    rem-double/2addr v2, v5

    sub-double/2addr v2, v7

    return-wide v2

    .line 132
    :pswitch_5
    mul-double v9, v0, v3

    add-double/2addr v9, v7

    rem-double/2addr v9, v3

    sub-double/2addr v9, v5

    invoke-static {v9, v10}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    sub-double/2addr v7, v2

    return-wide v7

    .line 130
    :pswitch_6
    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    rem-double v4, v0, v7

    sub-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->signum(D)D

    move-result-wide v2

    return-wide v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public normalize()V
    .locals 14

    .line 79
    const-wide/16 v0, 0x0

    .line 80
    .local v0, "totalArea":D
    const-wide/16 v2, 0x0

    .line 81
    .local v2, "totalCount":D
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPeriod:[F

    array-length v6, v5

    if-ge v4, v6, :cond_0

    .line 82
    aget v5, v5, v4

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v2, v5

    .line 81
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 84
    .end local v4    # "i":I
    :cond_0
    const/4 v4, 0x1

    .restart local v4    # "i":I
    :goto_1
    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPeriod:[F

    array-length v6, v5

    const/high16 v7, 0x40000000    # 2.0f

    if-ge v4, v6, :cond_1

    .line 85
    add-int/lit8 v6, v4, -0x1

    aget v6, v5, v6

    aget v5, v5, v4

    add-float/2addr v6, v5

    div-float/2addr v6, v7

    .line 86
    .local v6, "h":F
    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPosition:[D

    aget-wide v7, v5, v4

    add-int/lit8 v9, v4, -0x1

    aget-wide v9, v5, v9

    sub-double/2addr v7, v9

    .line 87
    .local v7, "w":D
    float-to-double v9, v6

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v9, v9, v7

    add-double/2addr v0, v9

    .line 84
    .end local v6    # "h":F
    .end local v7    # "w":D
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 90
    .end local v4    # "i":I
    :cond_1
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_2
    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPeriod:[F

    array-length v6, v5

    if-ge v4, v6, :cond_2

    .line 91
    aget v6, v5, v4

    float-to-double v8, v6

    div-double v10, v2, v0

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v8, v8, v10

    double-to-float v6, v8

    aput v6, v5, v4

    .line 90
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 93
    .end local v4    # "i":I
    :cond_2
    iget-object v4, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mArea:[D

    const/4 v5, 0x0

    const-wide/16 v8, 0x0

    aput-wide v8, v4, v5

    .line 94
    const/4 v4, 0x1

    .restart local v4    # "i":I
    :goto_3
    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPeriod:[F

    array-length v6, v5

    if-ge v4, v6, :cond_3

    .line 95
    add-int/lit8 v6, v4, -0x1

    aget v6, v5, v6

    aget v5, v5, v4

    add-float/2addr v6, v5

    div-float/2addr v6, v7

    .line 96
    .restart local v6    # "h":F
    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPosition:[D

    aget-wide v8, v5, v4

    add-int/lit8 v10, v4, -0x1

    aget-wide v10, v5, v10

    sub-double/2addr v8, v10

    .line 97
    .local v8, "w":D
    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mArea:[D

    add-int/lit8 v10, v4, -0x1

    aget-wide v10, v5, v10

    float-to-double v12, v6

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v12, v12, v8

    add-double/2addr v10, v12

    aput-wide v10, v5, v4

    .line 94
    .end local v6    # "h":F
    .end local v8    # "w":D
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 99
    .end local v4    # "i":I
    :cond_3
    const/4 v4, 0x1

    iput-boolean v4, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mNormalized:Z

    .line 100
    return-void
.end method

.method public setType(ILjava/lang/String;)V
    .locals 1
    .param p1, "type"    # I
    .param p2, "customType"    # Ljava/lang/String;

    .line 53
    iput p1, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mType:I

    .line 54
    iput-object p2, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mCustomType:Ljava/lang/String;

    .line 55
    if-eqz p2, :cond_0

    .line 56
    invoke-static {p2}, Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;->buildWave(Ljava/lang/String;)Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;

    move-result-object v0

    iput-object v0, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mCustomCurve:Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;

    .line 58
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "pos ="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPosition:[D

    invoke-static {v1}, Ljava/util/Arrays;->toString([D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " period="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/constraintlayout/core/motion/utils/Oscillator;->mPeriod:[F

    invoke-static {v1}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
