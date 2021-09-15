.class public Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;
.super Ljava/lang/Object;
.source "VelocityMatrix.java"


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field mDRotate:F

.field mDScaleX:F

.field mDScaleY:F

.field mDTranslateX:F

.field mDTranslateY:F

.field mRotate:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    const-string v0, "VelocityMatrix"

    sput-object v0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public applyTransform(FFII[F)V
    .locals 16
    .param p1, "locationX"    # F
    .param p2, "locationY"    # F
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "mAnchorDpDt"    # [F

    .line 97
    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    const/4 v3, 0x0

    aget v4, p5, v3

    .line 98
    .local v4, "dx":F
    const/4 v5, 0x1

    aget v6, p5, v5

    .line 99
    .local v6, "dy":F
    const/high16 v7, 0x3f000000    # 0.5f

    sub-float v8, p1, v7

    const/high16 v9, 0x40000000    # 2.0f

    mul-float v8, v8, v9

    .line 100
    .local v8, "offx":F
    sub-float v7, p2, v7

    mul-float v7, v7, v9

    .line 101
    .local v7, "offy":F
    iget v9, v0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDTranslateX:F

    add-float/2addr v4, v9

    .line 102
    iget v9, v0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDTranslateY:F

    add-float/2addr v6, v9

    .line 103
    iget v9, v0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDScaleX:F

    mul-float v9, v9, v8

    add-float/2addr v4, v9

    .line 104
    iget v9, v0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDScaleY:F

    mul-float v9, v9, v7

    add-float/2addr v6, v9

    .line 105
    iget v9, v0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mRotate:F

    float-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v9

    double-to-float v9, v9

    .line 106
    .local v9, "r":F
    iget v10, v0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDRotate:F

    float-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v10

    double-to-float v10, v10

    .line 107
    .local v10, "dr":F
    neg-int v11, v1

    int-to-float v11, v11

    mul-float v11, v11, v8

    float-to-double v11, v11

    float-to-double v13, v9

    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v13

    invoke-static {v11, v12}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v11, v11, v13

    int-to-float v13, v2

    mul-float v13, v13, v7

    float-to-double v13, v13

    move v15, v6

    .end local v6    # "dy":F
    .local v15, "dy":F
    float-to-double v5, v9

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v13, v13, v5

    sub-double/2addr v11, v13

    double-to-float v5, v11

    mul-float v5, v5, v10

    add-float/2addr v4, v5

    .line 108
    int-to-float v5, v1

    mul-float v5, v5, v8

    float-to-double v5, v5

    float-to-double v11, v9

    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    move-result-wide v11

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v5, v5, v11

    int-to-float v11, v2

    mul-float v11, v11, v7

    float-to-double v11, v11

    float-to-double v13, v9

    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v13

    invoke-static {v11, v12}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v11, v11, v13

    sub-double/2addr v5, v11

    double-to-float v5, v5

    mul-float v5, v5, v10

    add-float v6, v15, v5

    .line 109
    .end local v15    # "dy":F
    .restart local v6    # "dy":F
    aput v4, p5, v3

    .line 110
    const/4 v3, 0x1

    aput v6, p5, v3

    .line 111
    return-void
.end method

.method public clear()V
    .locals 1

    .line 30
    const/4 v0, 0x0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDRotate:F

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDTranslateY:F

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDTranslateX:F

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDScaleY:F

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDScaleX:F

    .line 31
    return-void
.end method

.method public setRotationVelocity(Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;F)V
    .locals 1
    .param p1, "osc_r"    # Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;
    .param p2, "position"    # F

    .line 61
    if-eqz p1, :cond_0

    .line 62
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;->getSlope(F)F

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDRotate:F

    .line 64
    :cond_0
    return-void
.end method

.method public setRotationVelocity(Landroidx/constraintlayout/core/motion/utils/SplineSet;F)V
    .locals 1
    .param p1, "rot"    # Landroidx/constraintlayout/core/motion/utils/SplineSet;
    .param p2, "position"    # F

    .line 34
    if-eqz p1, :cond_0

    .line 35
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/core/motion/utils/SplineSet;->getSlope(F)F

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDRotate:F

    .line 36
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/core/motion/utils/SplineSet;->get(F)F

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mRotate:F

    .line 38
    :cond_0
    return-void
.end method

.method public setScaleVelocity(Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;F)V
    .locals 1
    .param p1, "osc_sx"    # Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;
    .param p2, "osc_sy"    # Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;
    .param p3, "position"    # F

    .line 78
    if-eqz p1, :cond_0

    .line 79
    invoke-virtual {p1, p3}, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;->getSlope(F)F

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDScaleX:F

    .line 81
    :cond_0
    if-eqz p2, :cond_1

    .line 82
    invoke-virtual {p2, p3}, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;->getSlope(F)F

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDScaleY:F

    .line 84
    :cond_1
    return-void
.end method

.method public setScaleVelocity(Landroidx/constraintlayout/core/motion/utils/SplineSet;Landroidx/constraintlayout/core/motion/utils/SplineSet;F)V
    .locals 1
    .param p1, "scale_x"    # Landroidx/constraintlayout/core/motion/utils/SplineSet;
    .param p2, "scale_y"    # Landroidx/constraintlayout/core/motion/utils/SplineSet;
    .param p3, "position"    # F

    .line 52
    if-eqz p1, :cond_0

    .line 53
    invoke-virtual {p1, p3}, Landroidx/constraintlayout/core/motion/utils/SplineSet;->getSlope(F)F

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDScaleX:F

    .line 55
    :cond_0
    if-eqz p2, :cond_1

    .line 56
    invoke-virtual {p2, p3}, Landroidx/constraintlayout/core/motion/utils/SplineSet;->getSlope(F)F

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDScaleY:F

    .line 58
    :cond_1
    return-void
.end method

.method public setTranslationVelocity(Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;F)V
    .locals 1
    .param p1, "osc_x"    # Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;
    .param p2, "osc_y"    # Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;
    .param p3, "position"    # F

    .line 68
    if-eqz p1, :cond_0

    .line 69
    invoke-virtual {p1, p3}, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;->getSlope(F)F

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDTranslateX:F

    .line 72
    :cond_0
    if-eqz p2, :cond_1

    .line 73
    invoke-virtual {p2, p3}, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;->getSlope(F)F

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDTranslateY:F

    .line 75
    :cond_1
    return-void
.end method

.method public setTranslationVelocity(Landroidx/constraintlayout/core/motion/utils/SplineSet;Landroidx/constraintlayout/core/motion/utils/SplineSet;F)V
    .locals 1
    .param p1, "trans_x"    # Landroidx/constraintlayout/core/motion/utils/SplineSet;
    .param p2, "trans_y"    # Landroidx/constraintlayout/core/motion/utils/SplineSet;
    .param p3, "position"    # F

    .line 42
    if-eqz p1, :cond_0

    .line 43
    invoke-virtual {p1, p3}, Landroidx/constraintlayout/core/motion/utils/SplineSet;->getSlope(F)F

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDTranslateX:F

    .line 45
    :cond_0
    if-eqz p2, :cond_1

    .line 46
    invoke-virtual {p2, p3}, Landroidx/constraintlayout/core/motion/utils/SplineSet;->getSlope(F)F

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/motion/utils/VelocityMatrix;->mDTranslateY:F

    .line 48
    :cond_1
    return-void
.end method
