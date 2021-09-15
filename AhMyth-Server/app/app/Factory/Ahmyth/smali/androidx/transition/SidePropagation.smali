.class public Landroidx/transition/SidePropagation;
.super Landroidx/transition/VisibilityPropagation;
.source "SidePropagation.java"


# instance fields
.field private mPropagationSpeed:F

.field private mSide:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Landroidx/transition/VisibilityPropagation;-><init>()V

    .line 36
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Landroidx/transition/SidePropagation;->mPropagationSpeed:F

    .line 37
    const/16 v0, 0x50

    iput v0, p0, Landroidx/transition/SidePropagation;->mSide:I

    return-void
.end method

.method private distance(Landroid/view/View;IIIIIIII)I
    .locals 6
    .param p1, "sceneRoot"    # Landroid/view/View;
    .param p2, "viewX"    # I
    .param p3, "viewY"    # I
    .param p4, "epicenterX"    # I
    .param p5, "epicenterY"    # I
    .param p6, "left"    # I
    .param p7, "top"    # I
    .param p8, "right"    # I
    .param p9, "bottom"    # I

    .line 125
    iget v0, p0, Landroidx/transition/SidePropagation;->mSide:I

    const/4 v1, 0x5

    const/4 v2, 0x3

    const/4 v3, 0x0

    const/4 v4, 0x1

    const v5, 0x800003

    if-ne v0, v5, :cond_2

    .line 126
    invoke-static {p1}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    if-ne v0, v4, :cond_0

    const/4 v3, 0x1

    :cond_0
    move v0, v3

    .line 128
    .local v0, "isRtl":Z
    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x3

    :goto_0
    move v0, v1

    .line 129
    .local v0, "side":I
    goto :goto_1

    .end local v0    # "side":I
    :cond_2
    const v5, 0x800005

    if-ne v0, v5, :cond_5

    .line 130
    invoke-static {p1}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    if-ne v0, v4, :cond_3

    const/4 v3, 0x1

    :cond_3
    move v0, v3

    .line 132
    .local v0, "isRtl":Z
    if-eqz v0, :cond_4

    const/4 v1, 0x3

    :cond_4
    move v0, v1

    .line 133
    .local v0, "side":I
    goto :goto_1

    .line 134
    .end local v0    # "side":I
    :cond_5
    iget v0, p0, Landroidx/transition/SidePropagation;->mSide:I

    .line 136
    .restart local v0    # "side":I
    :goto_1
    const/4 v1, 0x0

    .line 137
    .local v1, "distance":I
    sparse-switch v0, :sswitch_data_0

    goto :goto_2

    .line 148
    :sswitch_0
    sub-int v2, p3, p7

    sub-int v3, p4, p2

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int v1, v2, v3

    goto :goto_2

    .line 142
    :sswitch_1
    sub-int v2, p9, p3

    sub-int v3, p4, p2

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int v1, v2, v3

    .line 143
    goto :goto_2

    .line 145
    :sswitch_2
    sub-int v2, p2, p6

    sub-int v3, p5, p3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int v1, v2, v3

    .line 146
    goto :goto_2

    .line 139
    :sswitch_3
    sub-int v2, p8, p2

    sub-int v3, p5, p3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int v1, v2, v3

    .line 140
    nop

    .line 151
    :goto_2
    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_3
        0x5 -> :sswitch_2
        0x30 -> :sswitch_1
        0x50 -> :sswitch_0
    .end sparse-switch
.end method

.method private getMaxDistance(Landroid/view/ViewGroup;)I
    .locals 1
    .param p1, "sceneRoot"    # Landroid/view/ViewGroup;

    .line 155
    iget v0, p0, Landroidx/transition/SidePropagation;->mSide:I

    sparse-switch v0, :sswitch_data_0

    .line 162
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    return v0

    .line 160
    :sswitch_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_0
        0x5 -> :sswitch_0
        0x800003 -> :sswitch_0
        0x800005 -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public getStartDelay(Landroid/view/ViewGroup;Landroidx/transition/Transition;Landroidx/transition/TransitionValues;Landroidx/transition/TransitionValues;)J
    .locals 26
    .param p1, "sceneRoot"    # Landroid/view/ViewGroup;
    .param p2, "transition"    # Landroidx/transition/Transition;
    .param p3, "startValues"    # Landroidx/transition/TransitionValues;
    .param p4, "endValues"    # Landroidx/transition/TransitionValues;

    .line 76
    move-object/from16 v10, p0

    move-object/from16 v11, p3

    const-wide/16 v12, 0x0

    if-nez v11, :cond_0

    if-nez p4, :cond_0

    .line 77
    return-wide v12

    .line 79
    :cond_0
    const/4 v0, 0x1

    .line 80
    .local v0, "directionMultiplier":I
    invoke-virtual/range {p2 .. p2}, Landroidx/transition/Transition;->getEpicenter()Landroid/graphics/Rect;

    move-result-object v14

    .line 82
    .local v14, "epicenter":Landroid/graphics/Rect;
    if-eqz p4, :cond_2

    invoke-virtual {v10, v11}, Landroidx/transition/SidePropagation;->getViewVisibility(Landroidx/transition/TransitionValues;)I

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 86
    :cond_1
    move-object/from16 v1, p4

    move v15, v0

    move-object v9, v1

    .local v1, "positionValues":Landroidx/transition/TransitionValues;
    goto :goto_1

    .line 83
    .end local v1    # "positionValues":Landroidx/transition/TransitionValues;
    :cond_2
    :goto_0
    move-object/from16 v1, p3

    .line 84
    .restart local v1    # "positionValues":Landroidx/transition/TransitionValues;
    const/4 v0, -0x1

    move v15, v0

    move-object v9, v1

    .line 89
    .end local v0    # "directionMultiplier":I
    .end local v1    # "positionValues":Landroidx/transition/TransitionValues;
    .local v9, "positionValues":Landroidx/transition/TransitionValues;
    .local v15, "directionMultiplier":I
    :goto_1
    invoke-virtual {v10, v9}, Landroidx/transition/SidePropagation;->getViewX(Landroidx/transition/TransitionValues;)I

    move-result v16

    .line 90
    .local v16, "viewCenterX":I
    invoke-virtual {v10, v9}, Landroidx/transition/SidePropagation;->getViewY(Landroidx/transition/TransitionValues;)I

    move-result v17

    .line 92
    .local v17, "viewCenterY":I
    const/4 v0, 0x2

    new-array v8, v0, [I

    .line 93
    .local v8, "loc":[I
    move-object/from16 v7, p1

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 94
    const/4 v1, 0x0

    aget v1, v8, v1

    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getTranslationX()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    add-int v18, v1, v2

    .line 95
    .local v18, "left":I
    const/4 v1, 0x1

    aget v1, v8, v1

    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getTranslationY()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    add-int v19, v1, v2

    .line 96
    .local v19, "top":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    add-int v20, v18, v1

    .line 97
    .local v20, "right":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v1

    add-int v21, v19, v1

    .line 101
    .local v21, "bottom":I
    if-eqz v14, :cond_3

    .line 102
    invoke-virtual {v14}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    .line 103
    .local v0, "epicenterX":I
    invoke-virtual {v14}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    move/from16 v22, v0

    move/from16 v23, v1

    .local v1, "epicenterY":I
    goto :goto_2

    .line 105
    .end local v0    # "epicenterX":I
    .end local v1    # "epicenterY":I
    :cond_3
    add-int v1, v18, v20

    div-int/2addr v1, v0

    .line 106
    .local v1, "epicenterX":I
    add-int v2, v19, v21

    div-int/lit8 v0, v2, 0x2

    move/from16 v23, v0

    move/from16 v22, v1

    .line 109
    .end local v1    # "epicenterX":I
    .local v22, "epicenterX":I
    .local v23, "epicenterY":I
    :goto_2
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v16

    move/from16 v3, v17

    move/from16 v4, v22

    move/from16 v5, v23

    move/from16 v6, v18

    move/from16 v7, v19

    move-object/from16 v24, v8

    .end local v8    # "loc":[I
    .local v24, "loc":[I
    move/from16 v8, v20

    move-object/from16 v25, v9

    .end local v9    # "positionValues":Landroidx/transition/TransitionValues;
    .local v25, "positionValues":Landroidx/transition/TransitionValues;
    move/from16 v9, v21

    invoke-direct/range {v0 .. v9}, Landroidx/transition/SidePropagation;->distance(Landroid/view/View;IIIIIIII)I

    move-result v0

    int-to-float v0, v0

    .line 111
    .local v0, "distance":F
    invoke-direct/range {p0 .. p1}, Landroidx/transition/SidePropagation;->getMaxDistance(Landroid/view/ViewGroup;)I

    move-result v1

    int-to-float v1, v1

    .line 112
    .local v1, "maxDistance":F
    div-float v2, v0, v1

    .line 114
    .local v2, "distanceFraction":F
    invoke-virtual/range {p2 .. p2}, Landroidx/transition/Transition;->getDuration()J

    move-result-wide v3

    .line 115
    .local v3, "duration":J
    cmp-long v5, v3, v12

    if-gez v5, :cond_4

    .line 116
    const-wide/16 v3, 0x12c

    .line 119
    :cond_4
    int-to-long v5, v15

    mul-long v5, v5, v3

    long-to-float v5, v5

    iget v6, v10, Landroidx/transition/SidePropagation;->mPropagationSpeed:F

    div-float/2addr v5, v6

    mul-float v5, v5, v2

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    int-to-long v5, v5

    return-wide v5
.end method

.method public setPropagationSpeed(F)V
    .locals 2
    .param p1, "propagationSpeed"    # F

    .line 67
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 70
    iput p1, p0, Landroidx/transition/SidePropagation;->mPropagationSpeed:F

    .line 71
    return-void

    .line 68
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "propagationSpeed may not be 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSide(I)V
    .locals 0
    .param p1, "side"    # I

    .line 51
    iput p1, p0, Landroidx/transition/SidePropagation;->mSide:I

    .line 52
    return-void
.end method
