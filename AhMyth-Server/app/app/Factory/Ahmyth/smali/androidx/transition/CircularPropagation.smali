.class public Landroidx/transition/CircularPropagation;
.super Landroidx/transition/VisibilityPropagation;
.source "CircularPropagation.java"


# instance fields
.field private mPropagationSpeed:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Landroidx/transition/VisibilityPropagation;-><init>()V

    .line 35
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Landroidx/transition/CircularPropagation;->mPropagationSpeed:F

    return-void
.end method

.method private static distance(FFFF)F
    .locals 4
    .param p0, "x1"    # F
    .param p1, "y1"    # F
    .param p2, "x2"    # F
    .param p3, "y2"    # F

    .line 101
    sub-float v0, p2, p0

    .line 102
    .local v0, "x":F
    sub-float v1, p3, p1

    .line 103
    .local v1, "y":F
    mul-float v2, v0, v0

    mul-float v3, v1, v1

    add-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v2, v2

    return v2
.end method


# virtual methods
.method public getStartDelay(Landroid/view/ViewGroup;Landroidx/transition/Transition;Landroidx/transition/TransitionValues;Landroidx/transition/TransitionValues;)J
    .locals 18
    .param p1, "sceneRoot"    # Landroid/view/ViewGroup;
    .param p2, "transition"    # Landroidx/transition/Transition;
    .param p3, "startValues"    # Landroidx/transition/TransitionValues;
    .param p4, "endValues"    # Landroidx/transition/TransitionValues;

    .line 59
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    const-wide/16 v2, 0x0

    if-nez v1, :cond_0

    if-nez p4, :cond_0

    .line 60
    return-wide v2

    .line 62
    :cond_0
    const/4 v4, 0x1

    .line 64
    .local v4, "directionMultiplier":I
    if-eqz p4, :cond_2

    invoke-virtual {v0, v1}, Landroidx/transition/CircularPropagation;->getViewVisibility(Landroidx/transition/TransitionValues;)I

    move-result v5

    if-nez v5, :cond_1

    goto :goto_0

    .line 68
    :cond_1
    move-object/from16 v5, p4

    .local v5, "positionValues":Landroidx/transition/TransitionValues;
    goto :goto_1

    .line 65
    .end local v5    # "positionValues":Landroidx/transition/TransitionValues;
    :cond_2
    :goto_0
    move-object/from16 v5, p3

    .line 66
    .restart local v5    # "positionValues":Landroidx/transition/TransitionValues;
    const/4 v4, -0x1

    .line 71
    :goto_1
    invoke-virtual {v0, v5}, Landroidx/transition/CircularPropagation;->getViewX(Landroidx/transition/TransitionValues;)I

    move-result v6

    .line 72
    .local v6, "viewCenterX":I
    invoke-virtual {v0, v5}, Landroidx/transition/CircularPropagation;->getViewY(Landroidx/transition/TransitionValues;)I

    move-result v7

    .line 74
    .local v7, "viewCenterY":I
    invoke-virtual/range {p2 .. p2}, Landroidx/transition/Transition;->getEpicenter()Landroid/graphics/Rect;

    move-result-object v8

    .line 77
    .local v8, "epicenter":Landroid/graphics/Rect;
    if-eqz v8, :cond_3

    .line 78
    invoke-virtual {v8}, Landroid/graphics/Rect;->centerX()I

    move-result v9

    .line 79
    .local v9, "epicenterX":I
    invoke-virtual {v8}, Landroid/graphics/Rect;->centerY()I

    move-result v10

    move-object/from16 v11, p1

    .local v10, "epicenterY":I
    goto :goto_2

    .line 81
    .end local v9    # "epicenterX":I
    .end local v10    # "epicenterY":I
    :cond_3
    const/4 v9, 0x2

    new-array v10, v9, [I

    .line 82
    .local v10, "loc":[I
    move-object/from16 v11, p1

    invoke-virtual {v11, v10}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 83
    const/4 v12, 0x0

    aget v12, v10, v12

    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v13

    div-int/2addr v13, v9

    add-int/2addr v12, v13

    int-to-float v12, v12

    .line 84
    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getTranslationX()F

    move-result v13

    add-float/2addr v12, v13

    .line 83
    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v12

    .line 85
    .local v12, "epicenterX":I
    const/4 v13, 0x1

    aget v13, v10, v13

    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v14

    div-int/2addr v14, v9

    add-int/2addr v13, v14

    int-to-float v9, v13

    .line 86
    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getTranslationY()F

    move-result v13

    add-float/2addr v9, v13

    .line 85
    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    move v10, v9

    move v9, v12

    .line 88
    .end local v12    # "epicenterX":I
    .restart local v9    # "epicenterX":I
    .local v10, "epicenterY":I
    :goto_2
    int-to-float v12, v6

    int-to-float v13, v7

    int-to-float v14, v9

    int-to-float v15, v10

    invoke-static {v12, v13, v14, v15}, Landroidx/transition/CircularPropagation;->distance(FFFF)F

    move-result v12

    .line 89
    .local v12, "distance":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v13

    int-to-float v13, v13

    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v14

    int-to-float v14, v14

    const/4 v15, 0x0

    invoke-static {v15, v15, v13, v14}, Landroidx/transition/CircularPropagation;->distance(FFFF)F

    move-result v13

    .line 90
    .local v13, "maxDistance":F
    div-float v14, v12, v13

    .line 92
    .local v14, "distanceFraction":F
    invoke-virtual/range {p2 .. p2}, Landroidx/transition/Transition;->getDuration()J

    move-result-wide v15

    .line 93
    .local v15, "duration":J
    cmp-long v17, v15, v2

    if-gez v17, :cond_4

    .line 94
    const-wide/16 v15, 0x12c

    .line 97
    :cond_4
    int-to-long v2, v4

    mul-long v2, v2, v15

    long-to-float v2, v2

    iget v3, v0, Landroidx/transition/CircularPropagation;->mPropagationSpeed:F

    div-float/2addr v2, v3

    mul-float v2, v2, v14

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-long v2, v2

    return-wide v2
.end method

.method public setPropagationSpeed(F)V
    .locals 2
    .param p1, "propagationSpeed"    # F

    .line 50
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 53
    iput p1, p0, Landroidx/transition/CircularPropagation;->mPropagationSpeed:F

    .line 54
    return-void

    .line 51
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "propagationSpeed may not be 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
