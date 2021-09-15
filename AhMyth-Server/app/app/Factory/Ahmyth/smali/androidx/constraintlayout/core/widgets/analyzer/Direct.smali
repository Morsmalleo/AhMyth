.class public Landroidx/constraintlayout/core/widgets/analyzer/Direct;
.super Ljava/lang/Object;
.source "Direct.java"


# static fields
.field private static final APPLY_MATCH_PARENT:Z = false

.field private static final DEBUG:Z = false

.field private static final EARLY_TERMINATION:Z = true

.field private static hcount:I

.field private static measure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

.field private static vcount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    new-instance v0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-direct {v0}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;-><init>()V

    sput-object v0, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->measure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    .line 49
    const/4 v0, 0x0

    sput v0, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->hcount:I

    .line 50
    sput v0, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->vcount:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static canMeasure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;)Z
    .locals 11
    .param p0, "level"    # I
    .param p1, "layout"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 763
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v0

    .line 764
    .local v0, "horizontalBehaviour":Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v1

    .line 765
    .local v1, "verticalBehaviour":Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getParent()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getParent()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 766
    .local v2, "parent":Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;
    :goto_0
    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v5

    sget-object v6, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v5, v6, :cond_1

    const/4 v5, 0x1

    goto :goto_1

    :cond_1
    const/4 v5, 0x0

    .line 767
    .local v5, "isParentHorizontalFixed":Z
    :goto_1
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v6

    sget-object v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v6, v7, :cond_2

    const/4 v6, 0x1

    goto :goto_2

    :cond_2
    const/4 v6, 0x0

    .line 768
    .local v6, "isParentVerticalFixed":Z
    :goto_2
    sget-object v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    const/4 v8, 0x0

    if-eq v0, v7, :cond_5

    .line 769
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isResolvedHorizontally()Z

    move-result v7

    if-nez v7, :cond_5

    sget-object v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v0, v7, :cond_5

    sget-object v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v0, v7, :cond_3

    iget v7, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    if-nez v7, :cond_3

    iget v7, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v7, v7, v8

    if-nez v7, :cond_3

    .line 775
    invoke-virtual {p1, v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->hasDanglingDimension(I)Z

    move-result v7

    if-nez v7, :cond_5

    :cond_3
    sget-object v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v0, v7, :cond_4

    iget v7, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    if-ne v7, v4, :cond_4

    .line 778
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v7

    invoke-virtual {p1, v3, v7}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->hasResolvedTargets(II)Z

    move-result v7

    if-eqz v7, :cond_4

    goto :goto_3

    :cond_4
    const/4 v7, 0x0

    goto :goto_4

    :cond_5
    :goto_3
    const/4 v7, 0x1

    .line 779
    .local v7, "isHorizontalFixed":Z
    :goto_4
    sget-object v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v1, v9, :cond_8

    .line 780
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isResolvedVertically()Z

    move-result v9

    if-nez v9, :cond_8

    sget-object v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v1, v9, :cond_8

    sget-object v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v1, v9, :cond_6

    iget v9, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    if-nez v9, :cond_6

    iget v9, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v9, v9, v8

    if-nez v9, :cond_6

    .line 786
    invoke-virtual {p1, v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->hasDanglingDimension(I)Z

    move-result v9

    if-nez v9, :cond_8

    :cond_6
    sget-object v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v0, v9, :cond_7

    iget v9, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    if-ne v9, v4, :cond_7

    .line 789
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v9

    invoke-virtual {p1, v4, v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->hasResolvedTargets(II)Z

    move-result v9

    if-eqz v9, :cond_7

    goto :goto_5

    :cond_7
    const/4 v9, 0x0

    goto :goto_6

    :cond_8
    :goto_5
    const/4 v9, 0x1

    .line 790
    .local v9, "isVerticalFixed":Z
    :goto_6
    iget v10, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v8, v10, v8

    if-lez v8, :cond_a

    if-nez v7, :cond_9

    if-eqz v9, :cond_a

    .line 791
    :cond_9
    return v4

    .line 799
    :cond_a
    if-eqz v7, :cond_b

    if-eqz v9, :cond_b

    const/4 v3, 0x1

    :cond_b
    return v3
.end method

.method private static horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V
    .locals 18
    .param p0, "level"    # I
    .param p1, "layout"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .param p2, "measurer"    # Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .param p3, "isRtl"    # Z

    .line 310
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isHorizontalSolvingPassDone()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 314
    return-void

    .line 316
    :cond_0
    sget v3, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->hcount:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    sput v3, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->hcount:I

    .line 321
    instance-of v3, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    if-nez v3, :cond_1

    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v3

    if-eqz v3, :cond_1

    add-int/lit8 v3, p0, 0x1

    invoke-static {v3, v0}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->canMeasure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 322
    new-instance v3, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-direct {v3}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;-><init>()V

    .line 323
    .local v3, "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    add-int/lit8 v5, p0, 0x1

    sget v6, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->SELF_DIMENSIONS:I

    invoke-static {v5, v0, v1, v3, v6}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->measure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;I)Z

    .line 326
    .end local v3    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    :cond_1
    sget-object v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;

    invoke-virtual {v0, v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    move-result-object v3

    .line 327
    .local v3, "left":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    sget-object v5, Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;

    invoke-virtual {v0, v5}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    move-result-object v5

    .line 328
    .local v5, "right":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v6

    .line 329
    .local v6, "l":I
    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v7

    .line 331
    .local v7, "r":I
    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getDependents()Ljava/util/HashSet;

    move-result-object v8

    if-eqz v8, :cond_d

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v8

    if-eqz v8, :cond_d

    .line 332
    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getDependents()Ljava/util/HashSet;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_d

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 333
    .local v12, "first":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v13, v12, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 334
    .local v13, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    const/4 v14, 0x0

    .line 335
    .local v14, "x1":I
    const/4 v15, 0x0

    .line 336
    .local v15, "x2":I
    add-int/lit8 v4, p0, 0x1

    invoke-static {v4, v13}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->canMeasure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;)Z

    move-result v4

    .line 337
    .local v4, "canMeasure":Z
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v16

    if-eqz v16, :cond_2

    if-eqz v4, :cond_2

    .line 338
    new-instance v16, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-direct/range {v16 .. v16}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;-><init>()V

    move-object/from16 v17, v16

    .line 339
    .local v17, "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    add-int/lit8 v11, p0, 0x1

    sget v9, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->SELF_DIMENSIONS:I

    move-object/from16 v10, v17

    .end local v17    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    .local v10, "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    invoke-static {v11, v13, v1, v10, v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->measure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;I)Z

    .line 342
    .end local v10    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    :cond_2
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v9

    sget-object v10, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v9, v10, :cond_8

    if-eqz v4, :cond_3

    goto/16 :goto_2

    .line 368
    :cond_3
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v9

    sget-object v10, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v9, v10, :cond_c

    iget v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMaxWidth:I

    if-ltz v9, :cond_c

    iget v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMinWidth:I

    if-ltz v9, :cond_c

    .line 370
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v9

    const/16 v10, 0x8

    if-eq v9, v10, :cond_4

    iget v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    if-nez v9, :cond_c

    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getDimensionRatio()F

    move-result v9

    const/4 v10, 0x0

    cmpl-float v9, v9, v10

    if-nez v9, :cond_c

    .line 371
    :cond_4
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v9

    if-nez v9, :cond_c

    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInVirtualLayout()Z

    move-result v9

    if-nez v9, :cond_c

    .line 372
    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v12, v9, :cond_5

    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v9, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v9, :cond_5

    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v9, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v9

    if-nez v9, :cond_6

    :cond_5
    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v12, v9, :cond_7

    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v9, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v9, :cond_7

    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v9, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 373
    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v9

    if-eqz v9, :cond_7

    :cond_6
    const/4 v9, 0x1

    goto :goto_1

    :cond_7
    const/4 v9, 0x0

    .line 374
    .local v9, "bothConnected":Z
    :goto_1
    if-eqz v9, :cond_c

    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v10

    if-nez v10, :cond_c

    .line 375
    add-int/lit8 v10, p0, 0x1

    invoke-static {v10, v0, v1, v13, v2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->solveHorizontalMatchConstraint(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;Z)V

    goto :goto_3

    .line 344
    .end local v9    # "bothConnected":Z
    :cond_8
    :goto_2
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v9

    if-eqz v9, :cond_9

    .line 349
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 351
    :cond_9
    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v12, v9, :cond_a

    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v9, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-nez v9, :cond_a

    .line 352
    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v9

    add-int/2addr v9, v6

    .line 353
    .end local v14    # "x1":I
    .local v9, "x1":I
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v10

    add-int/2addr v10, v9

    .line 354
    .end local v15    # "x2":I
    .local v10, "x2":I
    invoke-virtual {v13, v9, v10}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalHorizontal(II)V

    .line 355
    add-int/lit8 v11, p0, 0x1

    invoke-static {v11, v13, v1, v2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    goto :goto_3

    .line 356
    .end local v9    # "x1":I
    .end local v10    # "x2":I
    .restart local v14    # "x1":I
    .restart local v15    # "x2":I
    :cond_a
    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v12, v9, :cond_b

    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v9, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-nez v9, :cond_b

    .line 357
    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v9

    sub-int v9, v6, v9

    .line 358
    .end local v15    # "x2":I
    .local v9, "x2":I
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v10

    sub-int v10, v9, v10

    .line 359
    .end local v14    # "x1":I
    .local v10, "x1":I
    invoke-virtual {v13, v10, v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalHorizontal(II)V

    .line 360
    add-int/lit8 v11, p0, 0x1

    invoke-static {v11, v13, v1, v2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    goto :goto_3

    .line 361
    .end local v9    # "x2":I
    .end local v10    # "x1":I
    .restart local v14    # "x1":I
    .restart local v15    # "x2":I
    :cond_b
    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v12, v9, :cond_c

    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v9, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v9, :cond_c

    iget-object v9, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v9, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 362
    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v9

    if-eqz v9, :cond_c

    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v9

    if-nez v9, :cond_c

    .line 363
    add-int/lit8 v9, p0, 0x1

    invoke-static {v9, v1, v13, v2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->solveHorizontalCenterConstraints(ILandroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;Z)V

    .line 378
    .end local v4    # "canMeasure":Z
    .end local v12    # "first":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v13    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v14    # "x1":I
    .end local v15    # "x2":I
    :cond_c
    :goto_3
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 380
    :cond_d
    instance-of v4, v0, Landroidx/constraintlayout/core/widgets/Guideline;

    if-eqz v4, :cond_e

    .line 381
    return-void

    .line 383
    :cond_e
    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getDependents()Ljava/util/HashSet;

    move-result-object v4

    if-eqz v4, :cond_1c

    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 384
    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getDependents()Ljava/util/HashSet;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 385
    .local v8, "first":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v9, v8, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 386
    .local v9, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    add-int/lit8 v10, p0, 0x1

    invoke-static {v10, v9}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->canMeasure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;)Z

    move-result v10

    .line 387
    .local v10, "canMeasure":Z
    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v11

    if-eqz v11, :cond_f

    if-eqz v10, :cond_f

    .line 388
    new-instance v11, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-direct {v11}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;-><init>()V

    .line 389
    .local v11, "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    add-int/lit8 v12, p0, 0x1

    sget v13, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->SELF_DIMENSIONS:I

    invoke-static {v12, v9, v1, v11, v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->measure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;I)Z

    .line 392
    .end local v11    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    :cond_f
    const/4 v11, 0x0

    .line 393
    .local v11, "x1":I
    const/4 v12, 0x0

    .line 394
    .local v12, "x2":I
    iget-object v13, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v8, v13, :cond_10

    iget-object v13, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v13, v13, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v13, :cond_10

    iget-object v13, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v13, v13, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v13

    if-nez v13, :cond_11

    :cond_10
    iget-object v13, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v8, v13, :cond_12

    iget-object v13, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v13, v13, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v13, :cond_12

    iget-object v13, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v13, v13, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 395
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v13

    if-eqz v13, :cond_12

    :cond_11
    const/4 v13, 0x1

    goto :goto_5

    :cond_12
    const/4 v13, 0x0

    .line 396
    .local v13, "bothConnected":Z
    :goto_5
    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v14

    sget-object v15, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v14, v15, :cond_17

    if-eqz v10, :cond_13

    const/16 v15, 0x8

    const/16 v17, 0x0

    goto :goto_7

    .line 418
    :cond_13
    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v14

    sget-object v15, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v14, v15, :cond_16

    iget v14, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMaxWidth:I

    if-ltz v14, :cond_16

    iget v14, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMinWidth:I

    if-ltz v14, :cond_16

    .line 420
    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v14

    const/16 v15, 0x8

    if-eq v14, v15, :cond_15

    iget v14, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    if-nez v14, :cond_14

    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getDimensionRatio()F

    move-result v14

    const/16 v17, 0x0

    cmpl-float v14, v14, v17

    if-nez v14, :cond_1b

    goto :goto_6

    :cond_14
    const/16 v17, 0x0

    goto/16 :goto_8

    :cond_15
    const/16 v17, 0x0

    .line 421
    :goto_6
    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v14

    if-nez v14, :cond_1b

    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInVirtualLayout()Z

    move-result v14

    if-nez v14, :cond_1b

    .line 422
    if-eqz v13, :cond_1b

    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v14

    if-nez v14, :cond_1b

    .line 423
    add-int/lit8 v14, p0, 0x1

    invoke-static {v14, v0, v1, v9, v2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->solveHorizontalMatchConstraint(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;Z)V

    goto :goto_8

    .line 418
    :cond_16
    const/16 v15, 0x8

    const/16 v17, 0x0

    goto :goto_8

    .line 396
    :cond_17
    const/16 v15, 0x8

    const/16 v17, 0x0

    .line 398
    :goto_7
    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v14

    if-eqz v14, :cond_18

    .line 403
    goto/16 :goto_4

    .line 405
    :cond_18
    iget-object v14, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v8, v14, :cond_19

    iget-object v14, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v14, v14, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-nez v14, :cond_19

    .line 406
    iget-object v14, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v14}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v14

    add-int/2addr v14, v7

    .line 407
    .end local v11    # "x1":I
    .restart local v14    # "x1":I
    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v11

    add-int/2addr v11, v14

    .line 408
    .end local v12    # "x2":I
    .local v11, "x2":I
    invoke-virtual {v9, v14, v11}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalHorizontal(II)V

    .line 409
    add-int/lit8 v12, p0, 0x1

    invoke-static {v12, v9, v1, v2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    goto :goto_8

    .line 410
    .end local v14    # "x1":I
    .local v11, "x1":I
    .restart local v12    # "x2":I
    :cond_19
    iget-object v14, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v8, v14, :cond_1a

    iget-object v14, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v14, v14, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-nez v14, :cond_1a

    .line 411
    iget-object v14, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v14}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v14

    sub-int v12, v7, v14

    .line 412
    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v14

    sub-int v11, v12, v14

    .line 413
    invoke-virtual {v9, v11, v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalHorizontal(II)V

    .line 414
    add-int/lit8 v14, p0, 0x1

    invoke-static {v14, v9, v1, v2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    goto :goto_8

    .line 415
    :cond_1a
    if-eqz v13, :cond_1b

    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v14

    if-nez v14, :cond_1b

    .line 416
    add-int/lit8 v14, p0, 0x1

    invoke-static {v14, v1, v9, v2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->solveHorizontalCenterConstraints(ILandroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;Z)V

    .line 426
    .end local v8    # "first":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v9    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v10    # "canMeasure":Z
    .end local v11    # "x1":I
    .end local v12    # "x2":I
    .end local v13    # "bothConnected":Z
    :cond_1b
    :goto_8
    goto/16 :goto_4

    .line 428
    :cond_1c
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->markHorizontalSolvingPassDone()V

    .line 429
    return-void
.end method

.method public static ls(I)Ljava/lang/String;
    .locals 3
    .param p0, "level"    # I

    .line 293
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 294
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p0, :cond_0

    .line 295
    const-string v2, "  "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 297
    .end local v1    # "i":I
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "+-("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static solveBarrier(ILandroidx/constraintlayout/core/widgets/Barrier;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;IZ)V
    .locals 1
    .param p0, "level"    # I
    .param p1, "barrier"    # Landroidx/constraintlayout/core/widgets/Barrier;
    .param p2, "measurer"    # Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .param p3, "orientation"    # I
    .param p4, "isRtl"    # Z

    .line 278
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/Barrier;->allSolved()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 279
    if-nez p3, :cond_0

    .line 280
    add-int/lit8 v0, p0, 0x1

    invoke-static {v0, p1, p2, p4}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    goto :goto_0

    .line 282
    :cond_0
    add-int/lit8 v0, p0, 0x1

    invoke-static {v0, p1, p2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    .line 285
    :cond_1
    :goto_0
    return-void
.end method

.method public static solveChain(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;Landroidx/constraintlayout/core/LinearSystem;IILandroidx/constraintlayout/core/widgets/ChainHead;ZZZ)Z
    .locals 27
    .param p0, "container"    # Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;
    .param p1, "system"    # Landroidx/constraintlayout/core/LinearSystem;
    .param p2, "orientation"    # I
    .param p3, "offset"    # I
    .param p4, "chainHead"    # Landroidx/constraintlayout/core/widgets/ChainHead;
    .param p5, "isChainSpread"    # Z
    .param p6, "isChainSpreadInside"    # Z
    .param p7, "isChainPacked"    # Z

    .line 822
    const/4 v0, 0x0

    if-eqz p7, :cond_0

    .line 823
    return v0

    .line 825
    :cond_0
    if-nez p2, :cond_1

    .line 826
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->isResolvedHorizontally()Z

    move-result v1

    if-nez v1, :cond_2

    .line 827
    return v0

    .line 830
    :cond_1
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->isResolvedVertically()Z

    move-result v1

    if-nez v1, :cond_2

    .line 831
    return v0

    .line 834
    :cond_2
    const/4 v1, 0x0

    .line 835
    .local v1, "level":I
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->isRtl()Z

    move-result v2

    .line 837
    .local v2, "isRtl":Z
    invoke-virtual/range {p4 .. p4}, Landroidx/constraintlayout/core/widgets/ChainHead;->getFirst()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v3

    .line 838
    .local v3, "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    invoke-virtual/range {p4 .. p4}, Landroidx/constraintlayout/core/widgets/ChainHead;->getLast()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v4

    .line 839
    .local v4, "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    invoke-virtual/range {p4 .. p4}, Landroidx/constraintlayout/core/widgets/ChainHead;->getFirstVisibleWidget()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v5

    .line 840
    .local v5, "firstVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    invoke-virtual/range {p4 .. p4}, Landroidx/constraintlayout/core/widgets/ChainHead;->getLastVisibleWidget()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v6

    .line 841
    .local v6, "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    invoke-virtual/range {p4 .. p4}, Landroidx/constraintlayout/core/widgets/ChainHead;->getHead()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v7

    .line 843
    .local v7, "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move-object v8, v3

    .line 845
    .local v8, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    const/4 v9, 0x0

    .line 847
    .local v9, "done":Z
    iget-object v10, v3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v10, v10, p3

    .line 848
    .local v10, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v11, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v12, p3, 0x1

    aget-object v11, v11, v12

    .line 849
    .local v11, "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v12, v10, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v12, :cond_28

    iget-object v12, v11, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-nez v12, :cond_3

    move-object/from16 v26, v3

    move-object/from16 v22, v4

    move-object/from16 v25, v7

    move-object/from16 v24, v10

    goto/16 :goto_12

    .line 852
    :cond_3
    iget-object v12, v10, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v12

    if-eqz v12, :cond_27

    iget-object v12, v11, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v12

    if-nez v12, :cond_4

    move-object/from16 v26, v3

    move-object/from16 v22, v4

    move-object/from16 v25, v7

    move-object/from16 v24, v10

    goto/16 :goto_11

    .line 856
    :cond_4
    if-eqz v5, :cond_26

    if-nez v6, :cond_5

    move-object/from16 v26, v3

    move-object/from16 v22, v4

    move-object/from16 v25, v7

    move-object/from16 v24, v10

    goto/16 :goto_10

    .line 860
    :cond_5
    iget-object v12, v10, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v12

    iget-object v13, v5, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v13, v13, p3

    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v13

    add-int/2addr v12, v13

    .line 861
    .local v12, "startPoint":I
    iget-object v13, v11, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v13

    iget-object v14, v6, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v15, p3, 0x1

    aget-object v14, v14, v15

    invoke-virtual {v14}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v14

    sub-int/2addr v13, v14

    .line 863
    .local v13, "endPoint":I
    sub-int v14, v13, v12

    .line 864
    .local v14, "distance":I
    if-gtz v14, :cond_6

    .line 865
    return v0

    .line 867
    :cond_6
    const/4 v15, 0x0

    .line 868
    .local v15, "totalSize":I
    new-instance v16, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-direct/range {v16 .. v16}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;-><init>()V

    move-object/from16 v17, v16

    .line 870
    .local v17, "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    const/16 v16, 0x0

    .line 871
    .local v16, "numWidgets":I
    const/16 v18, 0x0

    move/from16 v19, v16

    move/from16 v20, v18

    .line 873
    .end local v16    # "numWidgets":I
    .local v19, "numWidgets":I
    .local v20, "numVisibleWidgets":I
    :goto_0
    if-nez v9, :cond_10

    .line 874
    add-int/lit8 v0, v1, 0x1

    invoke-static {v0, v8}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->canMeasure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;)Z

    move-result v0

    .line 875
    .local v0, "canMeasure":Z
    if-nez v0, :cond_7

    .line 876
    const/16 v16, 0x0

    return v16

    .line 878
    :cond_7
    const/16 v16, 0x0

    move/from16 v21, v0

    .end local v0    # "canMeasure":Z
    .local v21, "canMeasure":Z
    iget-object v0, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v0, v0, p2

    move-object/from16 v22, v4

    .end local v4    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v22, "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    sget-object v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v0, v4, :cond_8

    .line 879
    return v16

    .line 882
    :cond_8
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 883
    add-int/lit8 v0, v1, 0x1

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v4

    move/from16 v23, v9

    .end local v9    # "done":Z
    .local v23, "done":Z
    sget v9, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->SELF_DIMENSIONS:I

    move-object/from16 v24, v10

    move-object/from16 v10, v17

    .end local v17    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    .local v10, "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    .local v24, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    invoke-static {v0, v8, v4, v10, v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->measure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;I)Z

    goto :goto_1

    .line 882
    .end local v23    # "done":Z
    .end local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v9    # "done":Z
    .local v10, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v17    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    :cond_9
    move/from16 v23, v9

    move-object/from16 v24, v10

    move-object/from16 v10, v17

    .line 886
    .end local v9    # "done":Z
    .end local v17    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    .local v10, "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    .restart local v23    # "done":Z
    .restart local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :goto_1
    iget-object v0, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v0, v0, p3

    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v0

    add-int/2addr v15, v0

    .line 887
    if-nez p2, :cond_a

    .line 888
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v0

    add-int/2addr v15, v0

    goto :goto_2

    .line 890
    :cond_a
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    add-int/2addr v15, v0

    .line 892
    :goto_2
    iget-object v0, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v0, v0, v4

    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v0

    add-int/2addr v15, v0

    .line 894
    move/from16 v0, v19

    .end local v19    # "numWidgets":I
    .local v0, "numWidgets":I
    add-int/lit8 v19, v0, 0x1

    .line 895
    .end local v0    # "numWidgets":I
    .restart local v19    # "numWidgets":I
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v0

    const/16 v4, 0x8

    if-eq v0, v4, :cond_b

    .line 896
    move/from16 v4, v20

    .end local v20    # "numVisibleWidgets":I
    .local v4, "numVisibleWidgets":I
    add-int/lit8 v20, v4, 0x1

    .end local v4    # "numVisibleWidgets":I
    .restart local v20    # "numVisibleWidgets":I
    goto :goto_3

    .line 895
    :cond_b
    move/from16 v4, v20

    .line 901
    :goto_3
    iget-object v0, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v0, v0, v4

    iget-object v0, v0, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 902
    .local v0, "nextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    if-eqz v0, :cond_d

    .line 903
    iget-object v4, v0, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 904
    .local v4, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v9, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v9, v9, p3

    iget-object v9, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v9, :cond_c

    iget-object v9, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v9, v9, p3

    iget-object v9, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v9, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    if-eq v9, v8, :cond_e

    .line 906
    :cond_c
    const/4 v4, 0x0

    goto :goto_4

    .line 909
    .end local v4    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_d
    const/4 v4, 0x0

    .line 911
    .restart local v4    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_e
    :goto_4
    if-eqz v4, :cond_f

    .line 912
    move-object v8, v4

    move/from16 v9, v23

    goto :goto_5

    .line 914
    :cond_f
    const/4 v9, 0x1

    .line 916
    .end local v0    # "nextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v21    # "canMeasure":Z
    .end local v23    # "done":Z
    .restart local v9    # "done":Z
    :goto_5
    move-object/from16 v17, v10

    move-object/from16 v4, v22

    move-object/from16 v10, v24

    const/4 v0, 0x0

    goto/16 :goto_0

    .line 918
    .end local v22    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v4, "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v10, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v17    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    :cond_10
    move-object/from16 v22, v4

    move/from16 v23, v9

    move-object/from16 v24, v10

    move-object/from16 v10, v17

    move/from16 v0, v19

    move/from16 v4, v20

    .end local v9    # "done":Z
    .end local v17    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    .end local v19    # "numWidgets":I
    .end local v20    # "numVisibleWidgets":I
    .local v0, "numWidgets":I
    .local v4, "numVisibleWidgets":I
    .local v10, "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    .restart local v22    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v23    # "done":Z
    .restart local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    if-nez v4, :cond_11

    .line 919
    const/4 v9, 0x0

    return v9

    .line 922
    :cond_11
    const/4 v9, 0x0

    if-eq v4, v0, :cond_12

    .line 923
    return v9

    .line 926
    :cond_12
    if-ge v14, v15, :cond_13

    .line 927
    return v9

    .line 930
    :cond_13
    sub-int v9, v14, v15

    .line 931
    .local v9, "gap":I
    move/from16 v17, v0

    .end local v0    # "numWidgets":I
    .local v17, "numWidgets":I
    if-eqz p5, :cond_14

    .line 932
    add-int/lit8 v20, v4, 0x1

    div-int v9, v9, v20

    move-object/from16 v21, v8

    const/4 v8, 0x1

    goto :goto_6

    .line 933
    :cond_14
    if-eqz p6, :cond_16

    .line 934
    const/4 v0, 0x2

    if-le v4, v0, :cond_15

    .line 935
    div-int v0, v9, v4

    move-object/from16 v21, v8

    const/4 v8, 0x1

    .end local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v21, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    add-int/lit8 v9, v0, -0x1

    goto :goto_6

    .line 934
    .end local v21    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_15
    move-object/from16 v21, v8

    const/4 v8, 0x1

    .end local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v21    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    goto :goto_6

    .line 933
    .end local v21    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_16
    move-object/from16 v21, v8

    const/4 v8, 0x1

    .line 939
    .end local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v21    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_6
    if-ne v4, v8, :cond_19

    .line 941
    if-nez p2, :cond_17

    .line 942
    invoke-virtual {v7}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalBiasPercent()F

    move-result v0

    .local v0, "bias":F
    goto :goto_7

    .line 944
    .end local v0    # "bias":F
    :cond_17
    invoke-virtual {v7}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalBiasPercent()F

    move-result v0

    .line 946
    .restart local v0    # "bias":F
    :goto_7
    const/high16 v8, 0x3f000000    # 0.5f

    move-object/from16 v25, v7

    .end local v7    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v25, "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    int-to-float v7, v12

    add-float/2addr v7, v8

    int-to-float v8, v9

    mul-float v8, v8, v0

    add-float/2addr v7, v8

    float-to-int v7, v7

    .line 947
    .local v7, "p1":I
    if-nez p2, :cond_18

    .line 948
    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v8

    add-int/2addr v8, v7

    invoke-virtual {v5, v7, v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalHorizontal(II)V

    goto :goto_8

    .line 950
    :cond_18
    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v8

    add-int/2addr v8, v7

    invoke-virtual {v5, v7, v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalVertical(II)V

    .line 952
    :goto_8
    add-int/lit8 v8, v1, 0x1

    move/from16 v16, v0

    .end local v0    # "bias":F
    .local v16, "bias":F
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v0

    invoke-static {v8, v5, v0, v2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    .line 953
    const/4 v0, 0x1

    return v0

    .line 956
    .end local v16    # "bias":F
    .end local v25    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v7, "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_19
    move-object/from16 v25, v7

    .end local v7    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v25    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    if-eqz p5, :cond_22

    .line 957
    const/4 v0, 0x0

    .line 959
    .end local v23    # "done":Z
    .local v0, "done":Z
    add-int v7, v12, v9

    .line 960
    .local v7, "current":I
    move-object v8, v3

    .line 961
    .end local v21    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_9
    if-nez v0, :cond_21

    .line 962
    move/from16 v19, v0

    .end local v0    # "done":Z
    .local v19, "done":Z
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v0

    move-object/from16 v26, v3

    const/16 v3, 0x8

    .end local v3    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v26, "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    if-ne v0, v3, :cond_1b

    .line 963
    if-nez p2, :cond_1a

    .line 964
    invoke-virtual {v8, v7, v7}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalHorizontal(II)V

    .line 965
    add-int/lit8 v0, v1, 0x1

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v3

    invoke-static {v0, v8, v3, v2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    goto :goto_b

    .line 967
    :cond_1a
    invoke-virtual {v8, v7, v7}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalVertical(II)V

    .line 968
    add-int/lit8 v0, v1, 0x1

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v3

    invoke-static {v0, v8, v3}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    goto :goto_b

    .line 971
    :cond_1b
    iget-object v0, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v0, v0, p3

    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v0

    add-int/2addr v7, v0

    .line 972
    if-nez p2, :cond_1c

    .line 973
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v0

    add-int/2addr v0, v7

    invoke-virtual {v8, v7, v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalHorizontal(II)V

    .line 974
    add-int/lit8 v0, v1, 0x1

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v3

    invoke-static {v0, v8, v3, v2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    .line 975
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v0

    add-int/2addr v7, v0

    goto :goto_a

    .line 977
    :cond_1c
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    add-int/2addr v0, v7

    invoke-virtual {v8, v7, v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalVertical(II)V

    .line 978
    add-int/lit8 v0, v1, 0x1

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v3

    invoke-static {v0, v8, v3}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    .line 979
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    add-int/2addr v7, v0

    .line 981
    :goto_a
    iget-object v0, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v3, p3, 0x1

    aget-object v0, v0, v3

    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v0

    add-int/2addr v7, v0

    .line 982
    add-int/2addr v7, v9

    .line 985
    :goto_b
    move-object/from16 v0, p1

    const/4 v3, 0x0

    invoke-virtual {v8, v0, v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->addToSolver(Landroidx/constraintlayout/core/LinearSystem;Z)V

    .line 988
    iget-object v3, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v21, p3, 0x1

    aget-object v3, v3, v21

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 989
    .local v3, "nextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    if-eqz v3, :cond_1e

    .line 990
    iget-object v0, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 991
    .local v0, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move-object/from16 v21, v3

    .end local v3    # "nextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v21, "nextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v3, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v3, v3, p3

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v3, :cond_1d

    iget-object v3, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v3, v3, p3

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    if-eq v3, v8, :cond_1f

    .line 993
    :cond_1d
    const/4 v0, 0x0

    goto :goto_c

    .line 996
    .end local v0    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v21    # "nextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v3    # "nextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :cond_1e
    move-object/from16 v21, v3

    .end local v3    # "nextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v21    # "nextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    const/4 v0, 0x0

    .line 998
    .restart local v0    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_1f
    :goto_c
    if-eqz v0, :cond_20

    .line 999
    move-object v8, v0

    move/from16 v3, v19

    goto :goto_d

    .line 1001
    :cond_20
    const/4 v3, 0x1

    .line 1003
    .end local v19    # "done":Z
    .end local v21    # "nextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v3, "done":Z
    :goto_d
    move v0, v3

    move-object/from16 v3, v26

    goto/16 :goto_9

    .line 961
    .end local v26    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v0, "done":Z
    .local v3, "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_21
    move/from16 v19, v0

    move-object/from16 v26, v3

    .line 1004
    .end local v0    # "done":Z
    .end local v3    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v7    # "current":I
    .restart local v19    # "done":Z
    .restart local v26    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    const/4 v0, 0x1

    goto :goto_f

    .end local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v19    # "done":Z
    .end local v26    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v3    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v21, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v23    # "done":Z
    :cond_22
    move-object/from16 v26, v3

    .end local v3    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v26    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    if-eqz p6, :cond_25

    .line 1005
    const/4 v0, 0x2

    if-ne v4, v0, :cond_24

    .line 1006
    if-nez p2, :cond_23

    .line 1007
    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v0

    add-int/2addr v0, v12

    invoke-virtual {v5, v12, v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalHorizontal(II)V

    .line 1008
    invoke-virtual {v6}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v0

    sub-int v0, v13, v0

    invoke-virtual {v6, v0, v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalHorizontal(II)V

    .line 1009
    add-int/lit8 v0, v1, 0x1

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v3

    invoke-static {v0, v5, v3, v2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    .line 1010
    add-int/lit8 v0, v1, 0x1

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v3

    invoke-static {v0, v6, v3, v2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    goto :goto_e

    .line 1012
    :cond_23
    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    add-int/2addr v0, v12

    invoke-virtual {v5, v12, v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalVertical(II)V

    .line 1013
    invoke-virtual {v6}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    sub-int v0, v13, v0

    invoke-virtual {v6, v0, v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalVertical(II)V

    .line 1014
    add-int/lit8 v0, v1, 0x1

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v3

    invoke-static {v0, v5, v3}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    .line 1015
    add-int/lit8 v0, v1, 0x1

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v3

    invoke-static {v0, v6, v3}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    .line 1017
    :goto_e
    const/4 v0, 0x1

    return v0

    .line 1019
    :cond_24
    const/4 v0, 0x0

    return v0

    .line 1004
    :cond_25
    const/4 v0, 0x1

    move-object/from16 v8, v21

    move/from16 v19, v23

    .line 1021
    .end local v21    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v23    # "done":Z
    .restart local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v19    # "done":Z
    :goto_f
    return v0

    .line 856
    .end local v12    # "startPoint":I
    .end local v13    # "endPoint":I
    .end local v14    # "distance":I
    .end local v15    # "totalSize":I
    .end local v17    # "numWidgets":I
    .end local v19    # "done":Z
    .end local v22    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v25    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v26    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v3    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v4, "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v7, "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v9, "done":Z
    .local v10, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :cond_26
    move-object/from16 v26, v3

    move-object/from16 v22, v4

    move-object/from16 v25, v7

    move-object/from16 v24, v10

    .line 857
    .end local v3    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v4    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v7    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v10    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v22    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v25    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v26    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_10
    return v0

    .line 852
    .end local v22    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v25    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v26    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v3    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v4    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v7    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v10    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :cond_27
    move-object/from16 v26, v3

    move-object/from16 v22, v4

    move-object/from16 v25, v7

    move-object/from16 v24, v10

    .line 853
    .end local v3    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v4    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v7    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v10    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v22    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v25    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v26    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_11
    return v0

    .line 849
    .end local v22    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v25    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v26    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v3    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v4    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v7    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v10    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :cond_28
    move-object/from16 v26, v3

    move-object/from16 v22, v4

    move-object/from16 v25, v7

    move-object/from16 v24, v10

    .line 850
    .end local v3    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v4    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v7    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v10    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v22    # "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v25    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v26    # "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_12
    return v0
.end method

.method private static solveHorizontalCenterConstraints(ILandroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;Z)V
    .locals 11
    .param p0, "level"    # I
    .param p1, "measurer"    # Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .param p2, "widget"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .param p3, "isRtl"    # Z

    .line 599
    invoke-virtual {p2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalBiasPercent()F

    move-result v0

    .line 600
    .local v0, "bias":F
    iget-object v1, p2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v1

    .line 601
    .local v1, "start":I
    iget-object v2, p2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v2

    .line 602
    .local v2, "end":I
    iget-object v3, p2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    add-int/2addr v3, v1

    .line 603
    .local v3, "s1":I
    iget-object v4, p2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    sub-int v4, v2, v4

    .line 604
    .local v4, "s2":I
    if-ne v1, v2, :cond_0

    .line 605
    const/high16 v0, 0x3f000000    # 0.5f

    .line 606
    move v3, v1

    .line 607
    move v4, v2

    .line 609
    :cond_0
    invoke-virtual {p2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v5

    .line 610
    .local v5, "width":I
    sub-int v6, v4, v3

    sub-int/2addr v6, v5

    .line 611
    .local v6, "distance":I
    if-le v3, v4, :cond_1

    .line 612
    sub-int v7, v3, v4

    sub-int v6, v7, v5

    .line 615
    :cond_1
    if-lez v6, :cond_2

    .line 616
    const/high16 v7, 0x3f000000    # 0.5f

    int-to-float v8, v6

    mul-float v8, v8, v0

    add-float/2addr v8, v7

    float-to-int v7, v8

    .local v7, "d1":I
    goto :goto_0

    .line 618
    .end local v7    # "d1":I
    :cond_2
    int-to-float v7, v6

    mul-float v7, v7, v0

    float-to-int v7, v7

    .line 620
    .restart local v7    # "d1":I
    :goto_0
    add-int v8, v3, v7

    .line 621
    .local v8, "x1":I
    add-int v9, v8, v5

    .line 622
    .local v9, "x2":I
    if-le v3, v4, :cond_3

    .line 623
    add-int v8, v3, v7

    .line 624
    sub-int v9, v8, v5

    .line 626
    :cond_3
    invoke-virtual {p2, v8, v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalHorizontal(II)V

    .line 627
    add-int/lit8 v10, p0, 0x1

    invoke-static {v10, p2, p1, p3}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    .line 628
    return-void
.end method

.method private static solveHorizontalMatchConstraint(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;Z)V
    .locals 9
    .param p0, "level"    # I
    .param p1, "layout"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .param p2, "measurer"    # Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .param p3, "widget"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .param p4, "isRtl"    # Z

    .line 682
    invoke-virtual {p3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalBiasPercent()F

    move-result v0

    .line 683
    .local v0, "bias":F
    iget-object v1, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v1

    iget-object v2, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    add-int/2addr v1, v2

    .line 684
    .local v1, "s1":I
    iget-object v2, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v2

    iget-object v3, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    sub-int/2addr v2, v3

    .line 685
    .local v2, "s2":I
    if-lt v2, v1, :cond_4

    .line 686
    invoke-virtual {p3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v3

    .line 687
    .local v3, "width":I
    invoke-virtual {p3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    const/high16 v6, 0x3f000000    # 0.5f

    if-eq v4, v5, :cond_3

    .line 688
    iget v4, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_1

    .line 689
    const/4 v4, 0x0

    .line 690
    .local v4, "parentWidth":I
    instance-of v5, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    if-eqz v5, :cond_0

    .line 691
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v4

    goto :goto_0

    .line 693
    :cond_0
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getParent()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v4

    .line 695
    :goto_0
    invoke-virtual {p3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalBiasPercent()F

    move-result v5

    mul-float v5, v5, v6

    int-to-float v7, v4

    mul-float v5, v5, v7

    float-to-int v3, v5

    .end local v4    # "parentWidth":I
    goto :goto_1

    .line 696
    :cond_1
    iget v4, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    if-nez v4, :cond_2

    .line 697
    sub-int v3, v2, v1

    goto :goto_2

    .line 696
    :cond_2
    :goto_1
    nop

    .line 699
    :goto_2
    iget v4, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMinWidth:I

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 700
    iget v4, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMaxWidth:I

    if-lez v4, :cond_3

    .line 701
    iget v4, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMaxWidth:I

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 704
    :cond_3
    sub-int v4, v2, v1

    sub-int/2addr v4, v3

    .line 705
    .local v4, "distance":I
    int-to-float v5, v4

    mul-float v5, v5, v0

    add-float/2addr v5, v6

    float-to-int v5, v5

    .line 706
    .local v5, "d1":I
    add-int v6, v1, v5

    .line 707
    .local v6, "x1":I
    add-int v7, v6, v3

    .line 708
    .local v7, "x2":I
    invoke-virtual {p3, v6, v7}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalHorizontal(II)V

    .line 709
    add-int/lit8 v8, p0, 0x1

    invoke-static {v8, p3, p2, p4}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    .line 711
    .end local v3    # "width":I
    .end local v4    # "distance":I
    .end local v5    # "d1":I
    .end local v6    # "x1":I
    .end local v7    # "x2":I
    :cond_4
    return-void
.end method

.method private static solveVerticalCenterConstraints(ILandroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;)V
    .locals 11
    .param p0, "level"    # I
    .param p1, "measurer"    # Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .param p2, "widget"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 640
    invoke-virtual {p2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalBiasPercent()F

    move-result v0

    .line 641
    .local v0, "bias":F
    iget-object v1, p2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v1

    .line 642
    .local v1, "start":I
    iget-object v2, p2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v2

    .line 643
    .local v2, "end":I
    iget-object v3, p2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    add-int/2addr v3, v1

    .line 644
    .local v3, "s1":I
    iget-object v4, p2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    sub-int v4, v2, v4

    .line 645
    .local v4, "s2":I
    if-ne v1, v2, :cond_0

    .line 646
    const/high16 v0, 0x3f000000    # 0.5f

    .line 647
    move v3, v1

    .line 648
    move v4, v2

    .line 650
    :cond_0
    invoke-virtual {p2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v5

    .line 651
    .local v5, "height":I
    sub-int v6, v4, v3

    sub-int/2addr v6, v5

    .line 652
    .local v6, "distance":I
    if-le v3, v4, :cond_1

    .line 653
    sub-int v7, v3, v4

    sub-int v6, v7, v5

    .line 656
    :cond_1
    if-lez v6, :cond_2

    .line 657
    const/high16 v7, 0x3f000000    # 0.5f

    int-to-float v8, v6

    mul-float v8, v8, v0

    add-float/2addr v8, v7

    float-to-int v7, v8

    .local v7, "d1":I
    goto :goto_0

    .line 659
    .end local v7    # "d1":I
    :cond_2
    int-to-float v7, v6

    mul-float v7, v7, v0

    float-to-int v7, v7

    .line 661
    .restart local v7    # "d1":I
    :goto_0
    add-int v8, v3, v7

    .line 662
    .local v8, "y1":I
    add-int v9, v8, v5

    .line 663
    .local v9, "y2":I
    if-le v3, v4, :cond_3

    .line 664
    sub-int v8, v3, v7

    .line 665
    sub-int v9, v8, v5

    .line 667
    :cond_3
    invoke-virtual {p2, v8, v9}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalVertical(II)V

    .line 668
    add-int/lit8 v10, p0, 0x1

    invoke-static {v10, p2, p1}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    .line 669
    return-void
.end method

.method private static solveVerticalMatchConstraint(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;)V
    .locals 9
    .param p0, "level"    # I
    .param p1, "layout"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .param p2, "measurer"    # Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .param p3, "widget"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 723
    invoke-virtual {p3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalBiasPercent()F

    move-result v0

    .line 724
    .local v0, "bias":F
    iget-object v1, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v1

    iget-object v2, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    add-int/2addr v1, v2

    .line 725
    .local v1, "s1":I
    iget-object v2, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v2

    iget-object v3, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    sub-int/2addr v2, v3

    .line 726
    .local v2, "s2":I
    if-lt v2, v1, :cond_4

    .line 727
    invoke-virtual {p3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v3

    .line 728
    .local v3, "height":I
    invoke-virtual {p3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    const/high16 v6, 0x3f000000    # 0.5f

    if-eq v4, v5, :cond_3

    .line 729
    iget v4, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_1

    .line 730
    const/4 v4, 0x0

    .line 731
    .local v4, "parentHeight":I
    instance-of v5, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    if-eqz v5, :cond_0

    .line 732
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v4

    goto :goto_0

    .line 734
    :cond_0
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getParent()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v4

    .line 736
    :goto_0
    mul-float v5, v0, v6

    int-to-float v7, v4

    mul-float v5, v5, v7

    float-to-int v3, v5

    .end local v4    # "parentHeight":I
    goto :goto_1

    .line 737
    :cond_1
    iget v4, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    if-nez v4, :cond_2

    .line 738
    sub-int v3, v2, v1

    goto :goto_2

    .line 737
    :cond_2
    :goto_1
    nop

    .line 740
    :goto_2
    iget v4, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMinHeight:I

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 741
    iget v4, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMaxHeight:I

    if-lez v4, :cond_3

    .line 742
    iget v4, p3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMaxHeight:I

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 745
    :cond_3
    sub-int v4, v2, v1

    sub-int/2addr v4, v3

    .line 746
    .local v4, "distance":I
    int-to-float v5, v4

    mul-float v5, v5, v0

    add-float/2addr v5, v6

    float-to-int v5, v5

    .line 747
    .local v5, "d1":I
    add-int v6, v1, v5

    .line 748
    .local v6, "y1":I
    add-int v7, v6, v3

    .line 749
    .local v7, "y2":I
    invoke-virtual {p3, v6, v7}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalVertical(II)V

    .line 750
    add-int/lit8 v8, p0, 0x1

    invoke-static {v8, p3, p2}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    .line 752
    .end local v3    # "height":I
    .end local v4    # "distance":I
    .end local v5    # "d1":I
    .end local v6    # "y1":I
    .end local v7    # "y2":I
    :cond_4
    return-void
.end method

.method public static solvingPass(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V
    .locals 18
    .param p0, "layout"    # Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;
    .param p1, "measurer"    # Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    .line 59
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v2

    .line 60
    .local v2, "horizontal":Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v3

    .line 61
    .local v3, "vertical":Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;
    const/4 v4, 0x0

    sput v4, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->hcount:I

    .line 62
    sput v4, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->vcount:I

    .line 63
    const-wide/16 v5, 0x0

    .line 68
    .local v5, "time":J
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->resetFinalResolution()V

    .line 69
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getChildren()Ljava/util/ArrayList;

    move-result-object v7

    .line 70
    .local v7, "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 74
    .local v8, "count":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    if-ge v9, v8, :cond_0

    .line 75
    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 76
    .local v10, "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    invoke-virtual {v10}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->resetFinalResolution()V

    .line 74
    .end local v10    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 79
    .end local v9    # "i":I
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->isRtl()Z

    move-result v9

    .line 86
    .local v9, "isRtl":Z
    sget-object v10, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v2, v10, :cond_1

    .line 87
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getWidth()I

    move-result v10

    invoke-virtual {v0, v4, v10}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setFinalHorizontal(II)V

    goto :goto_1

    .line 89
    :cond_1
    invoke-virtual {v0, v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setFinalLeft(I)V

    .line 97
    :goto_1
    const/4 v10, 0x0

    .line 98
    .local v10, "hasGuideline":Z
    const/4 v11, 0x0

    .line 99
    .local v11, "hasBarrier":Z
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_2
    const/4 v15, 0x1

    if-ge v12, v8, :cond_8

    .line 100
    invoke-virtual {v7, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v4, v16

    check-cast v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 101
    .local v4, "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    instance-of v13, v4, Landroidx/constraintlayout/core/widgets/Guideline;

    if-eqz v13, :cond_6

    .line 102
    move-object v13, v4

    check-cast v13, Landroidx/constraintlayout/core/widgets/Guideline;

    .line 103
    .local v13, "guideline":Landroidx/constraintlayout/core/widgets/Guideline;
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getOrientation()I

    move-result v14

    if-ne v14, v15, :cond_5

    .line 104
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getRelativeBegin()I

    move-result v14

    const/4 v15, -0x1

    if-eq v14, v15, :cond_2

    .line 105
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getRelativeBegin()I

    move-result v14

    invoke-virtual {v13, v14}, Landroidx/constraintlayout/core/widgets/Guideline;->setFinalValue(I)V

    goto :goto_3

    .line 106
    :cond_2
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getRelativeEnd()I

    move-result v14

    if-eq v14, v15, :cond_3

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->isResolvedHorizontally()Z

    move-result v14

    if-eqz v14, :cond_3

    .line 107
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getWidth()I

    move-result v14

    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getRelativeEnd()I

    move-result v15

    sub-int/2addr v14, v15

    invoke-virtual {v13, v14}, Landroidx/constraintlayout/core/widgets/Guideline;->setFinalValue(I)V

    goto :goto_3

    .line 108
    :cond_3
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->isResolvedHorizontally()Z

    move-result v14

    if-eqz v14, :cond_4

    .line 109
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getRelativePercent()F

    move-result v14

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getWidth()I

    move-result v15

    int-to-float v15, v15

    mul-float v14, v14, v15

    const/high16 v15, 0x3f000000    # 0.5f

    add-float/2addr v14, v15

    float-to-int v14, v14

    .line 110
    .local v14, "position":I
    invoke-virtual {v13, v14}, Landroidx/constraintlayout/core/widgets/Guideline;->setFinalValue(I)V

    .line 112
    .end local v14    # "position":I
    :cond_4
    :goto_3
    const/4 v10, 0x1

    .line 114
    .end local v13    # "guideline":Landroidx/constraintlayout/core/widgets/Guideline;
    :cond_5
    goto :goto_4

    :cond_6
    instance-of v13, v4, Landroidx/constraintlayout/core/widgets/Barrier;

    if-eqz v13, :cond_5

    .line 115
    move-object v13, v4

    check-cast v13, Landroidx/constraintlayout/core/widgets/Barrier;

    .line 116
    .local v13, "barrier":Landroidx/constraintlayout/core/widgets/Barrier;
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Barrier;->getOrientation()I

    move-result v14

    if-nez v14, :cond_7

    .line 117
    const/4 v11, 0x1

    .line 99
    .end local v4    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v13    # "barrier":Landroidx/constraintlayout/core/widgets/Barrier;
    :cond_7
    :goto_4
    add-int/lit8 v12, v12, 0x1

    const/4 v4, 0x0

    goto :goto_2

    .line 121
    .end local v12    # "i":I
    :cond_8
    if-eqz v10, :cond_a

    .line 125
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_5
    if-ge v4, v8, :cond_a

    .line 126
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 127
    .local v12, "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    instance-of v13, v12, Landroidx/constraintlayout/core/widgets/Guideline;

    if-eqz v13, :cond_9

    .line 128
    move-object v13, v12

    check-cast v13, Landroidx/constraintlayout/core/widgets/Guideline;

    .line 129
    .local v13, "guideline":Landroidx/constraintlayout/core/widgets/Guideline;
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getOrientation()I

    move-result v14

    if-ne v14, v15, :cond_9

    .line 130
    const/4 v14, 0x0

    invoke-static {v14, v13, v1, v9}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    .line 125
    .end local v12    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v13    # "guideline":Landroidx/constraintlayout/core/widgets/Guideline;
    :cond_9
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 144
    .end local v4    # "i":I
    :cond_a
    const/4 v4, 0x0

    invoke-static {v4, v0, v1, v9}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    .line 147
    if-eqz v11, :cond_c

    .line 151
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_6
    if-ge v4, v8, :cond_c

    .line 152
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 153
    .restart local v12    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    instance-of v13, v12, Landroidx/constraintlayout/core/widgets/Barrier;

    if-eqz v13, :cond_b

    .line 154
    move-object v13, v12

    check-cast v13, Landroidx/constraintlayout/core/widgets/Barrier;

    .line 155
    .local v13, "barrier":Landroidx/constraintlayout/core/widgets/Barrier;
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Barrier;->getOrientation()I

    move-result v14

    if-nez v14, :cond_b

    .line 156
    const/4 v14, 0x0

    invoke-static {v14, v13, v1, v14, v9}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->solveBarrier(ILandroidx/constraintlayout/core/widgets/Barrier;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;IZ)V

    .line 151
    .end local v12    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v13    # "barrier":Landroidx/constraintlayout/core/widgets/Barrier;
    :cond_b
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 170
    .end local v4    # "i":I
    :cond_c
    sget-object v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v4, :cond_d

    .line 171
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getHeight()I

    move-result v4

    const/4 v12, 0x0

    invoke-virtual {v0, v12, v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setFinalVertical(II)V

    goto :goto_7

    .line 173
    :cond_d
    const/4 v12, 0x0

    invoke-virtual {v0, v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setFinalTop(I)V

    .line 177
    :goto_7
    const/4 v4, 0x0

    .line 178
    .end local v10    # "hasGuideline":Z
    .local v4, "hasGuideline":Z
    const/4 v10, 0x0

    .line 179
    .end local v11    # "hasBarrier":Z
    .local v10, "hasBarrier":Z
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_8
    if-ge v11, v8, :cond_15

    .line 180
    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 181
    .restart local v12    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    instance-of v13, v12, Landroidx/constraintlayout/core/widgets/Guideline;

    if-eqz v13, :cond_13

    .line 182
    move-object v13, v12

    check-cast v13, Landroidx/constraintlayout/core/widgets/Guideline;

    .line 183
    .local v13, "guideline":Landroidx/constraintlayout/core/widgets/Guideline;
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getOrientation()I

    move-result v14

    if-nez v14, :cond_11

    .line 184
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getRelativeBegin()I

    move-result v14

    const/4 v15, -0x1

    if-eq v14, v15, :cond_e

    .line 185
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getRelativeBegin()I

    move-result v14

    invoke-virtual {v13, v14}, Landroidx/constraintlayout/core/widgets/Guideline;->setFinalValue(I)V

    const/high16 v15, 0x3f000000    # 0.5f

    goto :goto_9

    .line 186
    :cond_e
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getRelativeEnd()I

    move-result v14

    if-eq v14, v15, :cond_f

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->isResolvedVertically()Z

    move-result v14

    if-eqz v14, :cond_f

    .line 187
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getHeight()I

    move-result v14

    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getRelativeEnd()I

    move-result v17

    sub-int v14, v14, v17

    invoke-virtual {v13, v14}, Landroidx/constraintlayout/core/widgets/Guideline;->setFinalValue(I)V

    const/high16 v15, 0x3f000000    # 0.5f

    goto :goto_9

    .line 188
    :cond_f
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->isResolvedVertically()Z

    move-result v14

    if-eqz v14, :cond_10

    .line 189
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getRelativePercent()F

    move-result v14

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getHeight()I

    move-result v15

    int-to-float v15, v15

    mul-float v14, v14, v15

    const/high16 v15, 0x3f000000    # 0.5f

    add-float/2addr v14, v15

    float-to-int v14, v14

    .line 190
    .restart local v14    # "position":I
    invoke-virtual {v13, v14}, Landroidx/constraintlayout/core/widgets/Guideline;->setFinalValue(I)V

    goto :goto_9

    .line 188
    .end local v14    # "position":I
    :cond_10
    const/high16 v15, 0x3f000000    # 0.5f

    .line 192
    :goto_9
    const/4 v4, 0x1

    goto :goto_a

    .line 183
    :cond_11
    const/high16 v15, 0x3f000000    # 0.5f

    .line 194
    .end local v13    # "guideline":Landroidx/constraintlayout/core/widgets/Guideline;
    :cond_12
    :goto_a
    goto :goto_b

    :cond_13
    const/high16 v15, 0x3f000000    # 0.5f

    instance-of v13, v12, Landroidx/constraintlayout/core/widgets/Barrier;

    if-eqz v13, :cond_12

    .line 195
    move-object v13, v12

    check-cast v13, Landroidx/constraintlayout/core/widgets/Barrier;

    .line 196
    .local v13, "barrier":Landroidx/constraintlayout/core/widgets/Barrier;
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Barrier;->getOrientation()I

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_14

    .line 197
    const/4 v10, 0x1

    .line 179
    .end local v12    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v13    # "barrier":Landroidx/constraintlayout/core/widgets/Barrier;
    :cond_14
    :goto_b
    add-int/lit8 v11, v11, 0x1

    const/4 v15, 0x1

    goto :goto_8

    .line 201
    .end local v11    # "i":I
    :cond_15
    if-eqz v4, :cond_17

    .line 205
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_c
    if-ge v11, v8, :cond_17

    .line 206
    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 207
    .restart local v12    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    instance-of v13, v12, Landroidx/constraintlayout/core/widgets/Guideline;

    if-eqz v13, :cond_16

    .line 208
    move-object v13, v12

    check-cast v13, Landroidx/constraintlayout/core/widgets/Guideline;

    .line 209
    .local v13, "guideline":Landroidx/constraintlayout/core/widgets/Guideline;
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Guideline;->getOrientation()I

    move-result v14

    if-nez v14, :cond_16

    .line 210
    const/4 v14, 0x1

    invoke-static {v14, v13, v1}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    .line 205
    .end local v12    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v13    # "guideline":Landroidx/constraintlayout/core/widgets/Guideline;
    :cond_16
    add-int/lit8 v11, v11, 0x1

    goto :goto_c

    .line 224
    .end local v11    # "i":I
    :cond_17
    const/4 v11, 0x0

    invoke-static {v11, v0, v1}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    .line 227
    if-eqz v10, :cond_1a

    .line 231
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_d
    if-ge v11, v8, :cond_1a

    .line 232
    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 233
    .restart local v12    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    instance-of v13, v12, Landroidx/constraintlayout/core/widgets/Barrier;

    if-eqz v13, :cond_18

    .line 234
    move-object v13, v12

    check-cast v13, Landroidx/constraintlayout/core/widgets/Barrier;

    .line 235
    .local v13, "barrier":Landroidx/constraintlayout/core/widgets/Barrier;
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/Barrier;->getOrientation()I

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_19

    .line 236
    const/4 v14, 0x0

    invoke-static {v14, v13, v1, v15, v9}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->solveBarrier(ILandroidx/constraintlayout/core/widgets/Barrier;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;IZ)V

    goto :goto_e

    .line 233
    .end local v13    # "barrier":Landroidx/constraintlayout/core/widgets/Barrier;
    :cond_18
    const/4 v15, 0x1

    .line 231
    .end local v12    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_19
    :goto_e
    add-int/lit8 v11, v11, 0x1

    goto :goto_d

    .line 246
    .end local v11    # "i":I
    :cond_1a
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_f
    if-ge v11, v8, :cond_1f

    .line 247
    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 248
    .restart local v12    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v13

    if-eqz v13, :cond_1d

    const/4 v13, 0x0

    invoke-static {v13, v12}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->canMeasure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;)Z

    move-result v14

    if-eqz v14, :cond_1e

    .line 249
    sget-object v14, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->measure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    sget v15, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->SELF_DIMENSIONS:I

    invoke-static {v13, v12, v1, v14, v15}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->measure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;I)Z

    .line 250
    instance-of v14, v12, Landroidx/constraintlayout/core/widgets/Guideline;

    if-eqz v14, :cond_1c

    .line 251
    move-object v14, v12

    check-cast v14, Landroidx/constraintlayout/core/widgets/Guideline;

    invoke-virtual {v14}, Landroidx/constraintlayout/core/widgets/Guideline;->getOrientation()I

    move-result v14

    if-nez v14, :cond_1b

    .line 252
    invoke-static {v13, v12, v1}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    goto :goto_10

    .line 254
    :cond_1b
    invoke-static {v13, v12, v1, v9}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    goto :goto_10

    .line 257
    :cond_1c
    invoke-static {v13, v12, v1, v9}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->horizontalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Z)V

    .line 258
    invoke-static {v13, v12, v1}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    goto :goto_10

    .line 248
    :cond_1d
    const/4 v13, 0x0

    .line 246
    .end local v12    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_1e
    :goto_10
    add-int/lit8 v11, v11, 0x1

    goto :goto_f

    .line 268
    .end local v11    # "i":I
    :cond_1f
    return-void
.end method

.method private static verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V
    .locals 18
    .param p0, "level"    # I
    .param p1, "layout"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .param p2, "measurer"    # Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    .line 440
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isVerticalSolvingPassDone()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 444
    return-void

    .line 446
    :cond_0
    sget v2, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->vcount:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    sput v2, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->vcount:I

    .line 451
    instance-of v2, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    if-nez v2, :cond_1

    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v2

    if-eqz v2, :cond_1

    add-int/lit8 v2, p0, 0x1

    invoke-static {v2, v0}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->canMeasure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 452
    new-instance v2, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-direct {v2}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;-><init>()V

    .line 453
    .local v2, "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    add-int/lit8 v4, p0, 0x1

    sget v5, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->SELF_DIMENSIONS:I

    invoke-static {v4, v0, v1, v2, v5}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->measure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;I)Z

    .line 456
    .end local v2    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    :cond_1
    sget-object v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;

    invoke-virtual {v0, v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    move-result-object v2

    .line 457
    .local v2, "top":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    sget-object v4, Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;

    invoke-virtual {v0, v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    move-result-object v4

    .line 458
    .local v4, "bottom":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v5

    .line 459
    .local v5, "t":I
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v6

    .line 461
    .local v6, "b":I
    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getDependents()Ljava/util/HashSet;

    move-result-object v7

    const/16 v9, 0x8

    if-eqz v7, :cond_d

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v7

    if-eqz v7, :cond_d

    .line 462
    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getDependents()Ljava/util/HashSet;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_d

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 463
    .local v11, "first":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v12, v11, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 464
    .local v12, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    const/4 v13, 0x0

    .line 465
    .local v13, "y1":I
    const/4 v14, 0x0

    .line 466
    .local v14, "y2":I
    add-int/lit8 v15, p0, 0x1

    invoke-static {v15, v12}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->canMeasure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;)Z

    move-result v15

    .line 467
    .local v15, "canMeasure":Z
    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v16

    if-eqz v16, :cond_2

    if-eqz v15, :cond_2

    .line 468
    new-instance v16, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-direct/range {v16 .. v16}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;-><init>()V

    move-object/from16 v17, v16

    .line 469
    .local v17, "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    add-int/lit8 v3, p0, 0x1

    sget v10, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->SELF_DIMENSIONS:I

    move-object/from16 v8, v17

    .end local v17    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    .local v8, "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    invoke-static {v3, v12, v1, v8, v10}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->measure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;I)Z

    .line 472
    .end local v8    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    :cond_2
    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v3

    sget-object v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v8, :cond_8

    if-eqz v15, :cond_3

    goto :goto_2

    .line 498
    :cond_3
    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v3

    sget-object v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v8, :cond_c

    iget v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMaxHeight:I

    if-ltz v3, :cond_c

    iget v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMinHeight:I

    if-ltz v3, :cond_c

    .line 500
    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v3

    if-eq v3, v9, :cond_4

    iget v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    if-nez v3, :cond_c

    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getDimensionRatio()F

    move-result v3

    const/4 v8, 0x0

    cmpl-float v3, v3, v8

    if-nez v3, :cond_c

    .line 501
    :cond_4
    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInVerticalChain()Z

    move-result v3

    if-nez v3, :cond_c

    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInVirtualLayout()Z

    move-result v3

    if-nez v3, :cond_c

    .line 502
    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v11, v3, :cond_5

    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v3, :cond_5

    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v3

    if-nez v3, :cond_6

    :cond_5
    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v11, v3, :cond_7

    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v3, :cond_7

    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 503
    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v3

    if-eqz v3, :cond_7

    :cond_6
    const/4 v3, 0x1

    goto :goto_1

    :cond_7
    const/4 v3, 0x0

    .line 504
    .local v3, "bothConnected":Z
    :goto_1
    if-eqz v3, :cond_c

    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInVerticalChain()Z

    move-result v8

    if-nez v8, :cond_c

    .line 505
    add-int/lit8 v8, p0, 0x1

    invoke-static {v8, v0, v1, v12}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->solveVerticalMatchConstraint(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;)V

    goto :goto_3

    .line 474
    .end local v3    # "bothConnected":Z
    :cond_8
    :goto_2
    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 479
    const/4 v3, 0x1

    goto/16 :goto_0

    .line 481
    :cond_9
    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v11, v3, :cond_a

    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-nez v3, :cond_a

    .line 482
    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    add-int/2addr v3, v5

    .line 483
    .end local v13    # "y1":I
    .local v3, "y1":I
    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v8

    add-int/2addr v8, v3

    .line 484
    .end local v14    # "y2":I
    .local v8, "y2":I
    invoke-virtual {v12, v3, v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalVertical(II)V

    .line 485
    add-int/lit8 v10, p0, 0x1

    invoke-static {v10, v12, v1}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    goto :goto_3

    .line 486
    .end local v3    # "y1":I
    .end local v8    # "y2":I
    .restart local v13    # "y1":I
    .restart local v14    # "y2":I
    :cond_a
    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v11, v3, :cond_b

    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-nez v3, :cond_b

    .line 487
    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    sub-int v3, v5, v3

    .line 488
    .end local v14    # "y2":I
    .local v3, "y2":I
    invoke-virtual {v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v8

    sub-int v8, v3, v8

    .line 489
    .end local v13    # "y1":I
    .local v8, "y1":I
    invoke-virtual {v12, v8, v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalVertical(II)V

    .line 490
    add-int/lit8 v10, p0, 0x1

    invoke-static {v10, v12, v1}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    goto :goto_3

    .line 491
    .end local v3    # "y2":I
    .end local v8    # "y1":I
    .restart local v13    # "y1":I
    .restart local v14    # "y2":I
    :cond_b
    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v11, v3, :cond_c

    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v3, :cond_c

    iget-object v3, v12, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 492
    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v3

    if-eqz v3, :cond_c

    .line 493
    add-int/lit8 v3, p0, 0x1

    invoke-static {v3, v1, v12}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->solveVerticalCenterConstraints(ILandroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;)V

    .line 508
    .end local v11    # "first":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v12    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v13    # "y1":I
    .end local v14    # "y2":I
    .end local v15    # "canMeasure":Z
    :cond_c
    :goto_3
    const/4 v3, 0x1

    goto/16 :goto_0

    .line 510
    :cond_d
    instance-of v3, v0, Landroidx/constraintlayout/core/widgets/Guideline;

    if-eqz v3, :cond_e

    .line 511
    return-void

    .line 513
    :cond_e
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getDependents()Ljava/util/HashSet;

    move-result-object v3

    if-eqz v3, :cond_1c

    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 514
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getDependents()Ljava/util/HashSet;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 515
    .local v7, "first":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v8, v7, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 516
    .local v8, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    add-int/lit8 v10, p0, 0x1

    invoke-static {v10, v8}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->canMeasure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;)Z

    move-result v10

    .line 517
    .local v10, "canMeasure":Z
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v11

    if-eqz v11, :cond_f

    if-eqz v10, :cond_f

    .line 518
    new-instance v11, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-direct {v11}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;-><init>()V

    .line 519
    .local v11, "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    add-int/lit8 v12, p0, 0x1

    sget v13, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->SELF_DIMENSIONS:I

    invoke-static {v12, v8, v1, v11, v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->measure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;I)Z

    .line 522
    .end local v11    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    :cond_f
    const/4 v11, 0x0

    .line 523
    .local v11, "y1":I
    const/4 v12, 0x0

    .line 524
    .local v12, "y2":I
    iget-object v13, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v7, v13, :cond_10

    iget-object v13, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v13, v13, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v13, :cond_10

    iget-object v13, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v13, v13, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v13

    if-nez v13, :cond_11

    :cond_10
    iget-object v13, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v7, v13, :cond_12

    iget-object v13, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v13, v13, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v13, :cond_12

    iget-object v13, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v13, v13, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 525
    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v13

    if-eqz v13, :cond_12

    :cond_11
    const/4 v13, 0x1

    goto :goto_5

    :cond_12
    const/4 v13, 0x0

    .line 526
    .local v13, "bothConnected":Z
    :goto_5
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v14

    sget-object v15, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v14, v15, :cond_17

    if-eqz v10, :cond_13

    const/4 v15, 0x0

    goto :goto_7

    .line 548
    :cond_13
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v14

    sget-object v15, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v14, v15, :cond_16

    iget v14, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMaxHeight:I

    if-ltz v14, :cond_16

    iget v14, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMinHeight:I

    if-ltz v14, :cond_16

    .line 550
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v14

    if-eq v14, v9, :cond_15

    iget v14, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    if-nez v14, :cond_14

    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getDimensionRatio()F

    move-result v14

    const/4 v15, 0x0

    cmpl-float v14, v14, v15

    if-nez v14, :cond_1b

    goto :goto_6

    :cond_14
    const/4 v15, 0x0

    goto/16 :goto_8

    :cond_15
    const/4 v15, 0x0

    .line 551
    :goto_6
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInVerticalChain()Z

    move-result v14

    if-nez v14, :cond_1b

    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInVirtualLayout()Z

    move-result v14

    if-nez v14, :cond_1b

    .line 552
    if-eqz v13, :cond_1b

    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInVerticalChain()Z

    move-result v14

    if-nez v14, :cond_1b

    .line 553
    add-int/lit8 v14, p0, 0x1

    invoke-static {v14, v0, v1, v8}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->solveVerticalMatchConstraint(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;)V

    goto :goto_8

    .line 548
    :cond_16
    const/4 v15, 0x0

    goto :goto_8

    .line 526
    :cond_17
    const/4 v15, 0x0

    .line 528
    :goto_7
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v14

    if-eqz v14, :cond_18

    .line 533
    goto/16 :goto_4

    .line 535
    :cond_18
    iget-object v14, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v7, v14, :cond_19

    iget-object v14, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v14, v14, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-nez v14, :cond_19

    .line 536
    iget-object v14, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v14}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v14

    add-int/2addr v14, v6

    .line 537
    .end local v11    # "y1":I
    .local v14, "y1":I
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v11

    add-int/2addr v11, v14

    .line 538
    .end local v12    # "y2":I
    .local v11, "y2":I
    invoke-virtual {v8, v14, v11}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalVertical(II)V

    .line 539
    add-int/lit8 v12, p0, 0x1

    invoke-static {v12, v8, v1}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    goto :goto_8

    .line 540
    .end local v14    # "y1":I
    .local v11, "y1":I
    .restart local v12    # "y2":I
    :cond_19
    iget-object v14, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v7, v14, :cond_1a

    iget-object v14, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v14, v14, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-nez v14, :cond_1a

    .line 541
    iget-object v14, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v14}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v14

    sub-int v12, v6, v14

    .line 542
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v14

    sub-int v11, v12, v14

    .line 543
    invoke-virtual {v8, v11, v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalVertical(II)V

    .line 544
    add-int/lit8 v14, p0, 0x1

    invoke-static {v14, v8, v1}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V

    goto :goto_8

    .line 545
    :cond_1a
    if-eqz v13, :cond_1b

    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInVerticalChain()Z

    move-result v14

    if-nez v14, :cond_1b

    .line 546
    add-int/lit8 v14, p0, 0x1

    invoke-static {v14, v1, v8}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->solveVerticalCenterConstraints(ILandroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;)V

    .line 556
    .end local v7    # "first":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v10    # "canMeasure":Z
    .end local v11    # "y1":I
    .end local v12    # "y2":I
    .end local v13    # "bothConnected":Z
    :cond_1b
    :goto_8
    goto/16 :goto_4

    .line 559
    :cond_1c
    sget-object v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;->BASELINE:Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;

    invoke-virtual {v0, v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    move-result-object v3

    .line 560
    .local v3, "baseline":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getDependents()Ljava/util/HashSet;

    move-result-object v7

    if-eqz v7, :cond_21

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->hasFinalValue()Z

    move-result v7

    if-eqz v7, :cond_21

    .line 561
    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getFinalValue()I

    move-result v7

    .line 562
    .local v7, "baselineValue":I
    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getDependents()Ljava/util/HashSet;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_9
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_21

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 563
    .local v9, "first":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v10, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 564
    .local v10, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    add-int/lit8 v11, p0, 0x1

    invoke-static {v11, v10}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->canMeasure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;)Z

    move-result v11

    .line 565
    .local v11, "canMeasure":Z
    invoke-virtual {v10}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v12

    if-eqz v12, :cond_1d

    if-eqz v11, :cond_1d

    .line 566
    new-instance v12, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-direct {v12}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;-><init>()V

    .line 567
    .local v12, "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    add-int/lit8 v13, p0, 0x1

    sget v14, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->SELF_DIMENSIONS:I

    invoke-static {v13, v10, v1, v12, v14}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->measure(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;I)Z

    .line 569
    .end local v12    # "measure":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;
    :cond_1d
    invoke-virtual {v10}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v12

    sget-object v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v12, v13, :cond_1e

    if-eqz v11, :cond_20

    .line 571
    :cond_1e
    invoke-virtual {v10}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isMeasureRequested()Z

    move-result v12

    if-eqz v12, :cond_1f

    .line 576
    goto :goto_9

    .line 578
    :cond_1f
    iget-object v12, v10, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-ne v9, v12, :cond_20

    .line 579
    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v12

    add-int/2addr v12, v7

    invoke-virtual {v10, v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setFinalBaseline(I)V

    .line 580
    add-int/lit8 v12, p0, 0x1

    :try_start_0
    invoke-static {v12, v10, v1}, Landroidx/constraintlayout/core/widgets/analyzer/Direct;->verticalSolvingPass(ILandroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 583
    .end local v9    # "first":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v10    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v11    # "canMeasure":Z
    :cond_20
    goto :goto_9

    .line 585
    .end local v7    # "baselineValue":I
    :cond_21
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->markVerticalSolvingPassDone()V

    .line 586
    return-void

    .line 580
    .end local v2    # "top":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v3    # "baseline":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v4    # "bottom":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v5    # "t":I
    .end local v6    # "b":I
    .end local p0    # "level":I
    .end local p1    # "layout":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local p2    # "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    :catchall_0
    move-exception v0

    move-object v1, v0

    goto :goto_b

    :goto_a
    throw v1

    :goto_b
    goto :goto_a
.end method
