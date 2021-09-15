.class public Landroidx/transition/PatternPathMotion;
.super Landroidx/transition/PathMotion;
.source "PatternPathMotion.java"


# instance fields
.field private mOriginalPatternPath:Landroid/graphics/Path;

.field private final mPatternPath:Landroid/graphics/Path;

.field private final mTempMatrix:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 54
    invoke-direct {p0}, Landroidx/transition/PathMotion;-><init>()V

    .line 47
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Landroidx/transition/PatternPathMotion;->mPatternPath:Landroid/graphics/Path;

    .line 49
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Landroidx/transition/PatternPathMotion;->mTempMatrix:Landroid/graphics/Matrix;

    .line 55
    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 56
    iput-object v0, p0, Landroidx/transition/PatternPathMotion;->mOriginalPatternPath:Landroid/graphics/Path;

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 61
    invoke-direct {p0}, Landroidx/transition/PathMotion;-><init>()V

    .line 47
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Landroidx/transition/PatternPathMotion;->mPatternPath:Landroid/graphics/Path;

    .line 49
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Landroidx/transition/PatternPathMotion;->mTempMatrix:Landroid/graphics/Matrix;

    .line 62
    sget-object v0, Landroidx/transition/Styleable;->PATTERN_PATH_MOTION:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 64
    .local v0, "a":Landroid/content/res/TypedArray;
    :try_start_0
    move-object v1, p2

    check-cast v1, Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "patternPathData"

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Landroidx/core/content/res/TypedArrayUtils;->getNamedString(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, "pathData":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 69
    invoke-static {v1}, Landroidx/core/graphics/PathParser;->createPathFromPathData(Ljava/lang/String;)Landroid/graphics/Path;

    move-result-object v2

    .line 70
    .local v2, "pattern":Landroid/graphics/Path;
    invoke-virtual {p0, v2}, Landroidx/transition/PatternPathMotion;->setPatternPath(Landroid/graphics/Path;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    .end local v1    # "pathData":Ljava/lang/String;
    .end local v2    # "pattern":Landroid/graphics/Path;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 73
    nop

    .line 74
    return-void

    .line 67
    .restart local v1    # "pathData":Ljava/lang/String;
    :cond_0
    :try_start_1
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "pathData must be supplied for patternPathMotion"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local v0    # "a":Landroid/content/res/TypedArray;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "attrs":Landroid/util/AttributeSet;
    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    .end local v1    # "pathData":Ljava/lang/String;
    .restart local v0    # "a":Landroid/content/res/TypedArray;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "attrs":Landroid/util/AttributeSet;
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 73
    throw v1
.end method

.method public constructor <init>(Landroid/graphics/Path;)V
    .locals 1
    .param p1, "patternPath"    # Landroid/graphics/Path;

    .line 84
    invoke-direct {p0}, Landroidx/transition/PathMotion;-><init>()V

    .line 47
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Landroidx/transition/PatternPathMotion;->mPatternPath:Landroid/graphics/Path;

    .line 49
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Landroidx/transition/PatternPathMotion;->mTempMatrix:Landroid/graphics/Matrix;

    .line 85
    invoke-virtual {p0, p1}, Landroidx/transition/PatternPathMotion;->setPatternPath(Landroid/graphics/Path;)V

    .line 86
    return-void
.end method

.method private static distance(FF)F
    .locals 2
    .param p0, "x"    # F
    .param p1, "y"    # F

    .line 149
    mul-float v0, p0, p0

    mul-float v1, p1, p1

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method


# virtual methods
.method public getPath(FFFF)Landroid/graphics/Path;
    .locals 8
    .param p1, "startX"    # F
    .param p2, "startY"    # F
    .param p3, "endX"    # F
    .param p4, "endY"    # F

    .line 135
    sub-float v0, p3, p1

    .line 136
    .local v0, "dx":F
    sub-float v1, p4, p2

    .line 137
    .local v1, "dy":F
    invoke-static {v0, v1}, Landroidx/transition/PatternPathMotion;->distance(FF)F

    move-result v2

    .line 138
    .local v2, "length":F
    float-to-double v3, v1

    float-to-double v5, v0

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v3

    .line 140
    .local v3, "angle":D
    iget-object v5, p0, Landroidx/transition/PatternPathMotion;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v5, v2, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 141
    iget-object v5, p0, Landroidx/transition/PatternPathMotion;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-static {v3, v4}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v6

    double-to-float v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 142
    iget-object v5, p0, Landroidx/transition/PatternPathMotion;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v5, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 143
    new-instance v5, Landroid/graphics/Path;

    invoke-direct {v5}, Landroid/graphics/Path;-><init>()V

    .line 144
    .local v5, "path":Landroid/graphics/Path;
    iget-object v6, p0, Landroidx/transition/PatternPathMotion;->mPatternPath:Landroid/graphics/Path;

    iget-object v7, p0, Landroidx/transition/PatternPathMotion;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v6, v7, v5}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 145
    return-object v5
.end method

.method public getPatternPath()Landroid/graphics/Path;
    .locals 1

    .line 96
    iget-object v0, p0, Landroidx/transition/PatternPathMotion;->mOriginalPatternPath:Landroid/graphics/Path;

    return-object v0
.end method

.method public setPatternPath(Landroid/graphics/Path;)V
    .locals 18
    .param p1, "patternPath"    # Landroid/graphics/Path;

    .line 107
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    new-instance v2, Landroid/graphics/PathMeasure;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    .line 108
    .local v2, "pathMeasure":Landroid/graphics/PathMeasure;
    invoke-virtual {v2}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v4

    .line 109
    .local v4, "length":F
    const/4 v5, 0x2

    new-array v5, v5, [F

    .line 110
    .local v5, "pos":[F
    const/4 v6, 0x0

    invoke-virtual {v2, v4, v5, v6}, Landroid/graphics/PathMeasure;->getPosTan(F[F[F)Z

    .line 111
    aget v7, v5, v3

    .line 112
    .local v7, "endX":F
    const/4 v8, 0x1

    aget v9, v5, v8

    .line 113
    .local v9, "endY":F
    const/4 v10, 0x0

    invoke-virtual {v2, v10, v5, v6}, Landroid/graphics/PathMeasure;->getPosTan(F[F[F)Z

    .line 114
    aget v3, v5, v3

    .line 115
    .local v3, "startX":F
    aget v6, v5, v8

    .line 117
    .local v6, "startY":F
    cmpl-float v8, v3, v7

    if-nez v8, :cond_1

    cmpl-float v8, v6, v9

    if-eqz v8, :cond_0

    goto :goto_0

    .line 118
    :cond_0
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v10, "pattern must not end at the starting point"

    invoke-direct {v8, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 121
    :cond_1
    :goto_0
    iget-object v8, v0, Landroidx/transition/PatternPathMotion;->mTempMatrix:Landroid/graphics/Matrix;

    neg-float v10, v3

    neg-float v11, v6

    invoke-virtual {v8, v10, v11}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 122
    sub-float v8, v7, v3

    .line 123
    .local v8, "dx":F
    sub-float v10, v9, v6

    .line 124
    .local v10, "dy":F
    invoke-static {v8, v10}, Landroidx/transition/PatternPathMotion;->distance(FF)F

    move-result v11

    .line 125
    .local v11, "distance":F
    const/high16 v12, 0x3f800000    # 1.0f

    div-float/2addr v12, v11

    .line 126
    .local v12, "scale":F
    iget-object v13, v0, Landroidx/transition/PatternPathMotion;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v13, v12, v12}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 127
    float-to-double v13, v10

    move-object v15, v2

    move/from16 v16, v3

    .end local v2    # "pathMeasure":Landroid/graphics/PathMeasure;
    .end local v3    # "startX":F
    .local v15, "pathMeasure":Landroid/graphics/PathMeasure;
    .local v16, "startX":F
    float-to-double v2, v8

    invoke-static {v13, v14, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v2

    .line 128
    .local v2, "angle":D
    iget-object v13, v0, Landroidx/transition/PatternPathMotion;->mTempMatrix:Landroid/graphics/Matrix;

    move v14, v4

    move-object/from16 v17, v5

    .end local v4    # "length":F
    .end local v5    # "pos":[F
    .local v14, "length":F
    .local v17, "pos":[F
    neg-double v4, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v4

    double-to-float v4, v4

    invoke-virtual {v13, v4}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 129
    iget-object v4, v0, Landroidx/transition/PatternPathMotion;->mTempMatrix:Landroid/graphics/Matrix;

    iget-object v5, v0, Landroidx/transition/PatternPathMotion;->mPatternPath:Landroid/graphics/Path;

    invoke-virtual {v1, v4, v5}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 130
    iput-object v1, v0, Landroidx/transition/PatternPathMotion;->mOriginalPatternPath:Landroid/graphics/Path;

    .line 131
    return-void
.end method
