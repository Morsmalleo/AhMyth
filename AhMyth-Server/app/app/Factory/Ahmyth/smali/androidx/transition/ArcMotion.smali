.class public Landroidx/transition/ArcMotion;
.super Landroidx/transition/PathMotion;
.source "ArcMotion.java"


# static fields
.field private static final DEFAULT_MAX_ANGLE_DEGREES:F = 70.0f

.field private static final DEFAULT_MAX_TANGENT:F

.field private static final DEFAULT_MIN_ANGLE_DEGREES:F


# instance fields
.field private mMaximumAngle:F

.field private mMaximumTangent:F

.field private mMinimumHorizontalAngle:F

.field private mMinimumHorizontalTangent:F

.field private mMinimumVerticalAngle:F

.field private mMinimumVerticalTangent:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 55
    nop

    .line 56
    const-wide v0, 0x4041800000000000L    # 35.0

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->tan(D)D

    move-result-wide v0

    double-to-float v0, v0

    sput v0, Landroidx/transition/ArcMotion;->DEFAULT_MAX_TANGENT:F

    .line 55
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 65
    invoke-direct {p0}, Landroidx/transition/PathMotion;-><init>()V

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Landroidx/transition/ArcMotion;->mMinimumHorizontalAngle:F

    .line 59
    iput v0, p0, Landroidx/transition/ArcMotion;->mMinimumVerticalAngle:F

    .line 60
    const/high16 v1, 0x428c0000    # 70.0f

    iput v1, p0, Landroidx/transition/ArcMotion;->mMaximumAngle:F

    .line 61
    iput v0, p0, Landroidx/transition/ArcMotion;->mMinimumHorizontalTangent:F

    .line 62
    iput v0, p0, Landroidx/transition/ArcMotion;->mMinimumVerticalTangent:F

    .line 63
    sget v0, Landroidx/transition/ArcMotion;->DEFAULT_MAX_TANGENT:F

    iput v0, p0, Landroidx/transition/ArcMotion;->mMaximumTangent:F

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 71
    invoke-direct {p0, p1, p2}, Landroidx/transition/PathMotion;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Landroidx/transition/ArcMotion;->mMinimumHorizontalAngle:F

    .line 59
    iput v0, p0, Landroidx/transition/ArcMotion;->mMinimumVerticalAngle:F

    .line 60
    const/high16 v1, 0x428c0000    # 70.0f

    iput v1, p0, Landroidx/transition/ArcMotion;->mMaximumAngle:F

    .line 61
    iput v0, p0, Landroidx/transition/ArcMotion;->mMinimumHorizontalTangent:F

    .line 62
    iput v0, p0, Landroidx/transition/ArcMotion;->mMinimumVerticalTangent:F

    .line 63
    sget v2, Landroidx/transition/ArcMotion;->DEFAULT_MAX_TANGENT:F

    iput v2, p0, Landroidx/transition/ArcMotion;->mMaximumTangent:F

    .line 72
    sget-object v2, Landroidx/transition/Styleable;->ARC_MOTION:[I

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 73
    .local v2, "a":Landroid/content/res/TypedArray;
    move-object v3, p2

    check-cast v3, Lorg/xmlpull/v1/XmlPullParser;

    .line 74
    .local v3, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const-string v4, "minimumVerticalAngle"

    const/4 v5, 0x1

    invoke-static {v2, v3, v4, v5, v0}, Landroidx/core/content/res/TypedArrayUtils;->getNamedFloat(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result v4

    .line 77
    .local v4, "minimumVerticalAngle":F
    invoke-virtual {p0, v4}, Landroidx/transition/ArcMotion;->setMinimumVerticalAngle(F)V

    .line 78
    const-string v5, "minimumHorizontalAngle"

    const/4 v6, 0x0

    invoke-static {v2, v3, v5, v6, v0}, Landroidx/core/content/res/TypedArrayUtils;->getNamedFloat(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result v0

    .line 81
    .local v0, "minimumHorizontalAngle":F
    invoke-virtual {p0, v0}, Landroidx/transition/ArcMotion;->setMinimumHorizontalAngle(F)V

    .line 82
    const-string v5, "maximumAngle"

    const/4 v6, 0x2

    invoke-static {v2, v3, v5, v6, v1}, Landroidx/core/content/res/TypedArrayUtils;->getNamedFloat(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result v1

    .line 84
    .local v1, "maximumAngle":F
    invoke-virtual {p0, v1}, Landroidx/transition/ArcMotion;->setMaximumAngle(F)V

    .line 85
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 86
    return-void
.end method

.method private static toTangent(F)F
    .locals 2
    .param p0, "arcInDegrees"    # F

    .line 177
    const/4 v0, 0x0

    cmpg-float v0, p0, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x42b40000    # 90.0f

    cmpl-float v0, p0, v0

    if-gtz v0, :cond_0

    .line 180
    const/high16 v0, 0x40000000    # 2.0f

    div-float v0, p0, v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->tan(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0

    .line 178
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Arc must be between 0 and 90 degrees"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getMaximumAngle()F
    .locals 1

    .line 173
    iget v0, p0, Landroidx/transition/ArcMotion;->mMaximumAngle:F

    return v0
.end method

.method public getMinimumHorizontalAngle()F
    .locals 1

    .line 115
    iget v0, p0, Landroidx/transition/ArcMotion;->mMinimumHorizontalAngle:F

    return v0
.end method

.method public getMinimumVerticalAngle()F
    .locals 1

    .line 146
    iget v0, p0, Landroidx/transition/ArcMotion;->mMinimumVerticalAngle:F

    return v0
.end method

.method public getPath(FFFF)Landroid/graphics/Path;
    .locals 31
    .param p1, "startX"    # F
    .param p2, "startY"    # F
    .param p3, "endX"    # F
    .param p4, "endY"    # F

    .line 201
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    new-instance v3, Landroid/graphics/Path;

    invoke-direct {v3}, Landroid/graphics/Path;-><init>()V

    move-object v10, v3

    .line 202
    .local v10, "path":Landroid/graphics/Path;
    invoke-virtual {v10, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 206
    sub-float v11, p3, v1

    .line 207
    .local v11, "deltaX":F
    sub-float v12, p4, v2

    .line 210
    .local v12, "deltaY":F
    mul-float v3, v11, v11

    mul-float v4, v12, v12

    add-float v13, v3, v4

    .line 213
    .local v13, "h2":F
    add-float v3, v1, p3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v14, v3, v4

    .line 214
    .local v14, "dx":F
    add-float v3, v2, p4

    div-float v15, v3, v4

    .line 217
    .local v15, "dy":F
    const/high16 v3, 0x3e800000    # 0.25f

    mul-float v16, v13, v3

    .line 221
    .local v16, "midDist2":F
    cmpl-float v3, v2, p4

    if-lez v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    move/from16 v17, v3

    .line 223
    .local v17, "isMovingUpwards":Z
    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v3, v3, v5

    if-gez v3, :cond_2

    .line 229
    mul-float v3, v12, v4

    div-float v3, v13, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 230
    .local v3, "eDistY":F
    if-eqz v17, :cond_1

    .line 231
    add-float v5, p4, v3

    .line 232
    .local v5, "ey":F
    move/from16 v6, p3

    .local v6, "ex":F
    goto :goto_1

    .line 234
    .end local v5    # "ey":F
    .end local v6    # "ex":F
    :cond_1
    add-float v5, v2, v3

    .line 235
    .restart local v5    # "ey":F
    move/from16 v6, p1

    .line 238
    .restart local v6    # "ex":F
    :goto_1
    iget v7, v0, Landroidx/transition/ArcMotion;->mMinimumVerticalTangent:F

    mul-float v8, v16, v7

    mul-float v8, v8, v7

    .line 240
    .end local v3    # "eDistY":F
    .local v8, "minimumArcDist2":F
    move/from16 v18, v8

    goto :goto_3

    .line 242
    .end local v5    # "ey":F
    .end local v6    # "ex":F
    .end local v8    # "minimumArcDist2":F
    :cond_2
    mul-float v3, v11, v4

    div-float v3, v13, v3

    .line 243
    .local v3, "eDistX":F
    if-eqz v17, :cond_3

    .line 244
    add-float v5, v1, v3

    .line 245
    .local v5, "ex":F
    move/from16 v6, p2

    move/from16 v30, v6

    move v6, v5

    move/from16 v5, v30

    .local v6, "ey":F
    goto :goto_2

    .line 247
    .end local v5    # "ex":F
    .end local v6    # "ey":F
    :cond_3
    sub-float v5, p3, v3

    .line 248
    .restart local v5    # "ex":F
    move/from16 v6, p4

    move/from16 v30, v6

    move v6, v5

    move/from16 v5, v30

    .line 251
    .local v5, "ey":F
    .local v6, "ex":F
    :goto_2
    iget v7, v0, Landroidx/transition/ArcMotion;->mMinimumHorizontalTangent:F

    mul-float v8, v16, v7

    mul-float v8, v8, v7

    move/from16 v18, v8

    .line 254
    .end local v3    # "eDistX":F
    .local v18, "minimumArcDist2":F
    :goto_3
    sub-float v19, v14, v6

    .line 255
    .local v19, "arcDistX":F
    sub-float v20, v15, v5

    .line 256
    .local v20, "arcDistY":F
    mul-float v3, v19, v19

    mul-float v7, v20, v20

    add-float v21, v3, v7

    .line 258
    .local v21, "arcDist2":F
    iget v3, v0, Landroidx/transition/ArcMotion;->mMaximumTangent:F

    mul-float v7, v16, v3

    mul-float v22, v7, v3

    .line 260
    .local v22, "maximumArcDist2":F
    const/4 v3, 0x0

    .line 261
    .local v3, "newArcDistance2":F
    cmpg-float v7, v21, v18

    if-gez v7, :cond_4

    .line 262
    move/from16 v3, v18

    move/from16 v23, v3

    goto :goto_4

    .line 263
    :cond_4
    cmpl-float v7, v21, v22

    if-lez v7, :cond_5

    .line 264
    move/from16 v3, v22

    move/from16 v23, v3

    goto :goto_4

    .line 263
    :cond_5
    move/from16 v23, v3

    .line 266
    .end local v3    # "newArcDistance2":F
    .local v23, "newArcDistance2":F
    :goto_4
    const/4 v3, 0x0

    cmpl-float v3, v23, v3

    if-eqz v3, :cond_6

    .line 267
    div-float v3, v23, v21

    .line 268
    .local v3, "ratio2":F
    float-to-double v7, v3

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    double-to-float v7, v7

    .line 269
    .local v7, "ratio":F
    sub-float v8, v6, v14

    mul-float v8, v8, v7

    add-float v6, v14, v8

    .line 270
    sub-float v8, v5, v15

    mul-float v8, v8, v7

    add-float v5, v15, v8

    move/from16 v24, v5

    move/from16 v25, v6

    goto :goto_5

    .line 266
    .end local v3    # "ratio2":F
    .end local v7    # "ratio":F
    :cond_6
    move/from16 v24, v5

    move/from16 v25, v6

    .line 272
    .end local v5    # "ey":F
    .end local v6    # "ex":F
    .local v24, "ey":F
    .local v25, "ex":F
    :goto_5
    add-float v3, v1, v25

    div-float v26, v3, v4

    .line 273
    .local v26, "control1X":F
    add-float v3, v2, v24

    div-float v27, v3, v4

    .line 274
    .local v27, "control1Y":F
    add-float v3, v25, p3

    div-float v28, v3, v4

    .line 275
    .local v28, "control2X":F
    add-float v3, v24, p4

    div-float v29, v3, v4

    .line 276
    .local v29, "control2Y":F
    move-object v3, v10

    move/from16 v4, v26

    move/from16 v5, v27

    move/from16 v6, v28

    move/from16 v7, v29

    move/from16 v8, p3

    move/from16 v9, p4

    invoke-virtual/range {v3 .. v9}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 277
    return-object v10
.end method

.method public setMaximumAngle(F)V
    .locals 1
    .param p1, "angleInDegrees"    # F

    .line 159
    iput p1, p0, Landroidx/transition/ArcMotion;->mMaximumAngle:F

    .line 160
    invoke-static {p1}, Landroidx/transition/ArcMotion;->toTangent(F)F

    move-result v0

    iput v0, p0, Landroidx/transition/ArcMotion;->mMaximumTangent:F

    .line 161
    return-void
.end method

.method public setMinimumHorizontalAngle(F)V
    .locals 1
    .param p1, "angleInDegrees"    # F

    .line 100
    iput p1, p0, Landroidx/transition/ArcMotion;->mMinimumHorizontalAngle:F

    .line 101
    invoke-static {p1}, Landroidx/transition/ArcMotion;->toTangent(F)F

    move-result v0

    iput v0, p0, Landroidx/transition/ArcMotion;->mMinimumHorizontalTangent:F

    .line 102
    return-void
.end method

.method public setMinimumVerticalAngle(F)V
    .locals 1
    .param p1, "angleInDegrees"    # F

    .line 130
    iput p1, p0, Landroidx/transition/ArcMotion;->mMinimumVerticalAngle:F

    .line 131
    invoke-static {p1}, Landroidx/transition/ArcMotion;->toTangent(F)F

    move-result v0

    iput v0, p0, Landroidx/transition/ArcMotion;->mMinimumVerticalTangent:F

    .line 132
    return-void
.end method
