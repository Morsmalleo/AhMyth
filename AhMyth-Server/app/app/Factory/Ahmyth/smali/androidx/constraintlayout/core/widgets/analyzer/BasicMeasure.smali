.class public Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;
.super Ljava/lang/Object;
.source "BasicMeasure.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;,
        Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    }
.end annotation


# static fields
.field public static final AT_MOST:I = -0x80000000

.field private static final DEBUG:Z = false

.field public static final EXACTLY:I = 0x40000000

.field public static final FIXED:I = -0x3

.field public static final MATCH_PARENT:I = -0x1

.field private static final MODE_SHIFT:I = 0x1e

.field public static final UNSPECIFIED:I = 0x0

.field public static final WRAP_CONTENT:I = -0x2


# instance fields
.field private constraintWidgetContainer:Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

.field private mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

.field private final mVariableDimensionsWidgets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/core/widgets/ConstraintWidget;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;)V
    .locals 1
    .param p1, "constraintWidgetContainer"    # Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    .line 53
    new-instance v0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-direct {v0}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    .line 71
    iput-object p1, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->constraintWidgetContainer:Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    .line 72
    return-void
.end method

.method private measure(Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Z
    .locals 8
    .param p1, "measurer"    # Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .param p2, "widget"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .param p3, "measureStrategy"    # I

    .line 443
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-virtual {p2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v1

    iput-object v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->horizontalBehavior:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    .line 444
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-virtual {p2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v1

    iput-object v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->verticalBehavior:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    .line 445
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-virtual {p2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v1

    iput v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->horizontalDimension:I

    .line 446
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-virtual {p2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v1

    iput v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->verticalDimension:I

    .line 447
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->measuredNeedsSolverPass:Z

    .line 448
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    iput p3, v0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->measureStrategy:I

    .line 450
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    iget-object v0, v0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->horizontalBehavior:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v2, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    const/4 v3, 0x1

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 451
    .local v0, "horizontalMatchConstraints":Z
    :goto_0
    iget-object v2, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    iget-object v2, v2, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->verticalBehavior:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v2, v4, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    .line 452
    .local v2, "verticalMatchConstraints":Z
    :goto_1
    const/4 v4, 0x0

    if-eqz v0, :cond_2

    iget v5, p2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v5, v5, v4

    if-lez v5, :cond_2

    const/4 v5, 0x1

    goto :goto_2

    :cond_2
    const/4 v5, 0x0

    .line 453
    .local v5, "horizontalUseRatio":Z
    :goto_2
    if-eqz v2, :cond_3

    iget v6, p2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v4, v6, v4

    if-lez v4, :cond_3

    const/4 v4, 0x1

    goto :goto_3

    :cond_3
    const/4 v4, 0x0

    .line 455
    .local v4, "verticalUseRatio":Z
    :goto_3
    const/4 v6, 0x4

    if-eqz v5, :cond_4

    .line 456
    iget-object v7, p2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    aget v1, v7, v1

    if-ne v1, v6, :cond_4

    .line 457
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    sget-object v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    iput-object v7, v1, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->horizontalBehavior:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    .line 460
    :cond_4
    if-eqz v4, :cond_5

    .line 461
    iget-object v1, p2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    aget v1, v1, v3

    if-ne v1, v6, :cond_5

    .line 462
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    sget-object v3, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    iput-object v3, v1, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->verticalBehavior:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    .line 466
    :cond_5
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    invoke-interface {p1, p2, v1}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;->measure(Landroidx/constraintlayout/core/widgets/ConstraintWidget;Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;)V

    .line 467
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    iget v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->measuredWidth:I

    invoke-virtual {p2, v1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setWidth(I)V

    .line 468
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    iget v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->measuredHeight:I

    invoke-virtual {p2, v1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setHeight(I)V

    .line 469
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    iget-boolean v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->measuredHasBaseline:Z

    invoke-virtual {p2, v1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setHasBaseline(Z)V

    .line 470
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    iget v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->measuredBaseline:I

    invoke-virtual {p2, v1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setBaselineDistance(I)V

    .line 471
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    sget v3, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->SELF_DIMENSIONS:I

    iput v3, v1, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->measureStrategy:I

    .line 472
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;

    iget-boolean v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->measuredNeedsSolverPass:Z

    return v1
.end method

.method private measureChildren(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;)V
    .locals 13
    .param p1, "layout"    # Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    .line 75
    iget-object v0, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 76
    .local v0, "childCount":I
    const/16 v1, 0x40

    invoke-virtual {p1, v1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->optimizeFor(I)Z

    move-result v1

    .line 77
    .local v1, "optimize":Z
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v2

    .line 78
    .local v2, "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v0, :cond_b

    .line 79
    iget-object v4, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 80
    .local v4, "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    instance-of v5, v4, Landroidx/constraintlayout/core/widgets/Guideline;

    if-eqz v5, :cond_0

    .line 81
    goto/16 :goto_1

    .line 83
    :cond_0
    instance-of v5, v4, Landroidx/constraintlayout/core/widgets/Barrier;

    if-eqz v5, :cond_1

    .line 84
    goto/16 :goto_1

    .line 86
    :cond_1
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInVirtualLayout()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 87
    goto/16 :goto_1

    .line 90
    :cond_2
    if-eqz v1, :cond_3

    iget-object v5, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/core/widgets/analyzer/HorizontalWidgetRun;

    if-eqz v5, :cond_3

    iget-object v5, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/core/widgets/analyzer/VerticalWidgetRun;

    if-eqz v5, :cond_3

    iget-object v5, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/core/widgets/analyzer/HorizontalWidgetRun;

    iget-object v5, v5, Landroidx/constraintlayout/core/widgets/analyzer/HorizontalWidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget-boolean v5, v5, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->resolved:Z

    if-eqz v5, :cond_3

    iget-object v5, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/core/widgets/analyzer/VerticalWidgetRun;

    iget-object v5, v5, Landroidx/constraintlayout/core/widgets/analyzer/VerticalWidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget-boolean v5, v5, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->resolved:Z

    if-eqz v5, :cond_3

    .line 93
    goto/16 :goto_1

    .line 96
    :cond_3
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getDimensionBehaviour(I)Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v6

    .line 97
    .local v6, "widthBehavior":Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;
    const/4 v7, 0x1

    invoke-virtual {v4, v7}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getDimensionBehaviour(I)Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v8

    .line 99
    .local v8, "heightBehavior":Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;
    sget-object v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v6, v9, :cond_4

    iget v9, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    if-eq v9, v7, :cond_4

    sget-object v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v8, v9, :cond_4

    iget v9, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    if-eq v9, v7, :cond_4

    const/4 v5, 0x1

    .line 104
    .local v5, "skip":Z
    :cond_4
    if-nez v5, :cond_8

    invoke-virtual {p1, v7}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->optimizeFor(I)Z

    move-result v7

    if-eqz v7, :cond_8

    instance-of v7, v4, Landroidx/constraintlayout/core/widgets/VirtualLayout;

    if-nez v7, :cond_8

    .line 106
    sget-object v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v6, v7, :cond_5

    iget v7, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    if-nez v7, :cond_5

    sget-object v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v8, v7, :cond_5

    .line 109
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v7

    if-nez v7, :cond_5

    .line 110
    const/4 v5, 0x1

    .line 113
    :cond_5
    sget-object v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v8, v7, :cond_6

    iget v7, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    if-nez v7, :cond_6

    sget-object v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v6, v7, :cond_6

    .line 116
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v7

    if-nez v7, :cond_6

    .line 117
    const/4 v5, 0x1

    .line 121
    :cond_6
    sget-object v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v6, v7, :cond_7

    sget-object v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v8, v7, :cond_8

    :cond_7
    iget v7, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mDimensionRatio:F

    const/4 v9, 0x0

    cmpl-float v7, v7, v9

    if-lez v7, :cond_8

    .line 124
    const/4 v5, 0x1

    .line 128
    :cond_8
    if-eqz v5, :cond_9

    .line 131
    goto :goto_1

    .line 134
    :cond_9
    sget v7, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->SELF_DIMENSIONS:I

    invoke-direct {p0, v2, v4, v7}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->measure(Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Z

    .line 135
    iget-object v7, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mMetrics:Landroidx/constraintlayout/core/Metrics;

    if-eqz v7, :cond_a

    .line 136
    iget-object v7, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mMetrics:Landroidx/constraintlayout/core/Metrics;

    iget-wide v9, v7, Landroidx/constraintlayout/core/Metrics;->measuredWidgets:J

    const-wide/16 v11, 0x1

    add-long/2addr v9, v11

    iput-wide v9, v7, Landroidx/constraintlayout/core/Metrics;->measuredWidgets:J

    .line 78
    .end local v4    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v5    # "skip":Z
    .end local v6    # "widthBehavior":Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;
    .end local v8    # "heightBehavior":Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;
    :cond_a
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 139
    .end local v3    # "i":I
    :cond_b
    invoke-interface {v2}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;->didMeasures()V

    .line 140
    return-void
.end method

.method private solveLinearSystem(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;Ljava/lang/String;III)V
    .locals 3
    .param p1, "layout"    # Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;
    .param p2, "reason"    # Ljava/lang/String;
    .param p3, "pass"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I

    .line 148
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMinWidth()I

    move-result v0

    .line 149
    .local v0, "minWidth":I
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMinHeight()I

    move-result v1

    .line 150
    .local v1, "minHeight":I
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setMinWidth(I)V

    .line 151
    invoke-virtual {p1, v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setMinHeight(I)V

    .line 152
    invoke-virtual {p1, p4}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setWidth(I)V

    .line 153
    invoke-virtual {p1, p5}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setHeight(I)V

    .line 154
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setMinWidth(I)V

    .line 155
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setMinHeight(I)V

    .line 159
    iget-object v2, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->constraintWidgetContainer:Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    invoke-virtual {v2, p3}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setPass(I)V

    .line 160
    iget-object v2, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->constraintWidgetContainer:Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->layout()V

    .line 165
    return-void
.end method


# virtual methods
.method public solverMeasure(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;IIIIIIIII)J
    .locals 34
    .param p1, "layout"    # Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;
    .param p2, "optimizationLevel"    # I
    .param p3, "paddingX"    # I
    .param p4, "paddingY"    # I
    .param p5, "widthMode"    # I
    .param p6, "widthSize"    # I
    .param p7, "heightMode"    # I
    .param p8, "heightSize"    # I
    .param p9, "lastMeasureWidth"    # I
    .param p10, "lastMeasureHeight"    # I

    .line 186
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move/from16 v8, p2

    move/from16 v9, p5

    move/from16 v10, p7

    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v11

    .line 187
    .local v11, "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    const-wide/16 v12, 0x0

    .line 189
    .local v12, "layoutTime":J
    iget-object v0, v7, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v14

    .line 190
    .local v14, "childCount":I
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getWidth()I

    move-result v15

    .line 191
    .local v15, "startingWidth":I
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getHeight()I

    move-result v16

    .line 193
    .local v16, "startingHeight":I
    const/16 v0, 0x80

    invoke-static {v8, v0}, Landroidx/constraintlayout/core/widgets/Optimizer;->enabled(II)Z

    move-result v5

    .line 194
    .local v5, "optimizeWrap":Z
    if-nez v5, :cond_1

    const/16 v0, 0x40

    invoke-static {v8, v0}, Landroidx/constraintlayout/core/widgets/Optimizer;->enabled(II)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 196
    .local v0, "optimize":Z
    :goto_1
    if-eqz v0, :cond_b

    .line 197
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    if-ge v1, v14, :cond_a

    .line 198
    iget-object v2, v7, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 199
    .local v2, "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v3

    sget-object v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v4, :cond_2

    const/4 v3, 0x1

    goto :goto_3

    :cond_2
    const/4 v3, 0x0

    .line 200
    .local v3, "matchWidth":Z
    :goto_3
    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v4

    move/from16 v19, v0

    .end local v0    # "optimize":Z
    .local v19, "optimize":Z
    sget-object v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v4, v0, :cond_3

    const/4 v0, 0x1

    goto :goto_4

    :cond_3
    const/4 v0, 0x0

    .line 201
    .local v0, "matchHeight":Z
    :goto_4
    if-eqz v3, :cond_4

    if-eqz v0, :cond_4

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getDimensionRatio()F

    move-result v4

    const/16 v20, 0x0

    cmpl-float v4, v4, v20

    if-lez v4, :cond_4

    const/4 v4, 0x1

    goto :goto_5

    :cond_4
    const/4 v4, 0x0

    .line 202
    .local v4, "ratio":Z
    :goto_5
    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v20

    if-eqz v20, :cond_5

    if-eqz v4, :cond_5

    .line 203
    const/16 v19, 0x0

    .line 204
    move/from16 v0, v19

    goto :goto_8

    .line 206
    :cond_5
    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInVerticalChain()Z

    move-result v20

    if-eqz v20, :cond_6

    if-eqz v4, :cond_6

    .line 207
    const/16 v19, 0x0

    .line 208
    move/from16 v0, v19

    goto :goto_8

    .line 210
    :cond_6
    move/from16 v20, v0

    .end local v0    # "matchHeight":Z
    .local v20, "matchHeight":Z
    instance-of v0, v2, Landroidx/constraintlayout/core/widgets/VirtualLayout;

    if-eqz v0, :cond_7

    .line 211
    const/4 v0, 0x0

    .line 212
    .end local v19    # "optimize":Z
    .local v0, "optimize":Z
    goto :goto_8

    .line 214
    .end local v0    # "optimize":Z
    .restart local v19    # "optimize":Z
    :cond_7
    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v0

    if-nez v0, :cond_9

    .line 215
    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInVerticalChain()Z

    move-result v0

    if-eqz v0, :cond_8

    goto :goto_6

    .line 197
    .end local v2    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v3    # "matchWidth":Z
    .end local v4    # "ratio":Z
    .end local v20    # "matchHeight":Z
    :cond_8
    add-int/lit8 v1, v1, 0x1

    move/from16 v0, v19

    goto :goto_2

    .line 216
    .restart local v2    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v3    # "matchWidth":Z
    .restart local v4    # "ratio":Z
    .restart local v20    # "matchHeight":Z
    :cond_9
    :goto_6
    const/4 v0, 0x0

    .line 217
    .end local v19    # "optimize":Z
    .restart local v0    # "optimize":Z
    goto :goto_8

    .line 197
    .end local v2    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v3    # "matchWidth":Z
    .end local v4    # "ratio":Z
    .end local v20    # "matchHeight":Z
    :cond_a
    move/from16 v19, v0

    .end local v0    # "optimize":Z
    .restart local v19    # "optimize":Z
    goto :goto_7

    .line 196
    .end local v1    # "i":I
    .end local v19    # "optimize":Z
    .restart local v0    # "optimize":Z
    :cond_b
    move/from16 v19, v0

    .line 222
    .end local v0    # "optimize":Z
    .restart local v19    # "optimize":Z
    :goto_7
    move/from16 v0, v19

    .end local v19    # "optimize":Z
    .restart local v0    # "optimize":Z
    :goto_8
    const-wide/16 v19, 0x1

    if-eqz v0, :cond_c

    sget-object v1, Landroidx/constraintlayout/core/LinearSystem;->sMetrics:Landroidx/constraintlayout/core/Metrics;

    if-eqz v1, :cond_c

    .line 223
    sget-object v1, Landroidx/constraintlayout/core/LinearSystem;->sMetrics:Landroidx/constraintlayout/core/Metrics;

    iget-wide v2, v1, Landroidx/constraintlayout/core/Metrics;->measures:J

    add-long v2, v2, v19

    iput-wide v2, v1, Landroidx/constraintlayout/core/Metrics;->measures:J

    .line 226
    :cond_c
    const/4 v1, 0x0

    .line 228
    .local v1, "allSolved":Z
    const/high16 v2, 0x40000000    # 2.0f

    if-ne v9, v2, :cond_d

    if-eq v10, v2, :cond_e

    :cond_d
    if-eqz v5, :cond_f

    :cond_e
    const/4 v3, 0x1

    goto :goto_9

    :cond_f
    const/4 v3, 0x0

    :goto_9
    and-int v21, v0, v3

    .line 230
    .end local v0    # "optimize":Z
    .local v21, "optimize":Z
    const/4 v0, 0x0

    .line 232
    .local v0, "computations":I
    if-eqz v21, :cond_18

    .line 236
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMaxWidth()I

    move-result v3

    move/from16 v4, p6

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 237
    .end local p6    # "widthSize":I
    .local v3, "widthSize":I
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMaxHeight()I

    move-result v4

    move/from16 v2, p8

    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 239
    .end local p8    # "heightSize":I
    .local v2, "heightSize":I
    const/high16 v4, 0x40000000    # 2.0f

    if-ne v9, v4, :cond_10

    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getWidth()I

    move-result v4

    if-eq v4, v3, :cond_10

    .line 240
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setWidth(I)V

    .line 241
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->invalidateGraph()V

    .line 243
    :cond_10
    const/high16 v4, 0x40000000    # 2.0f

    if-ne v10, v4, :cond_11

    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getHeight()I

    move-result v4

    if-eq v4, v2, :cond_11

    .line 244
    invoke-virtual {v7, v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setHeight(I)V

    .line 245
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->invalidateGraph()V

    .line 247
    :cond_11
    const/high16 v4, 0x40000000    # 2.0f

    if-ne v9, v4, :cond_12

    if-ne v10, v4, :cond_12

    .line 248
    invoke-virtual {v7, v5}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->directMeasure(Z)Z

    move-result v1

    .line 249
    const/4 v0, 0x2

    move/from16 p6, v3

    const/4 v3, 0x0

    const/4 v4, 0x1

    goto :goto_b

    .line 251
    :cond_12
    invoke-virtual {v7, v5}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->directMeasureSetup(Z)Z

    move-result v1

    .line 252
    const/high16 v4, 0x40000000    # 2.0f

    if-ne v9, v4, :cond_13

    .line 253
    move/from16 p6, v3

    const/4 v3, 0x0

    .end local v3    # "widthSize":I
    .restart local p6    # "widthSize":I
    invoke-virtual {v7, v5, v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->directMeasureWithOrientation(ZI)Z

    move-result v18

    and-int v1, v1, v18

    .line 254
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 252
    .end local p6    # "widthSize":I
    .restart local v3    # "widthSize":I
    :cond_13
    move/from16 p6, v3

    const/4 v3, 0x0

    .line 256
    .end local v3    # "widthSize":I
    .restart local p6    # "widthSize":I
    :goto_a
    if-ne v10, v4, :cond_14

    .line 257
    const/4 v4, 0x1

    invoke-virtual {v7, v5, v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->directMeasureWithOrientation(ZI)Z

    move-result v17

    and-int v1, v1, v17

    .line 258
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 256
    :cond_14
    const/4 v4, 0x1

    .line 261
    :goto_b
    if-eqz v1, :cond_17

    .line 262
    const/high16 v3, 0x40000000    # 2.0f

    if-ne v9, v3, :cond_15

    goto :goto_c

    :cond_15
    const/4 v4, 0x0

    :goto_c
    if-ne v10, v3, :cond_16

    const/4 v3, 0x1

    goto :goto_d

    :cond_16
    const/4 v3, 0x0

    :goto_d
    invoke-virtual {v7, v4, v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->updateFromRuns(ZZ)V

    .line 275
    :cond_17
    move/from16 v17, p6

    move v4, v0

    move/from16 v23, v1

    move/from16 v22, v2

    const/4 v3, 0x1

    goto :goto_e

    .line 232
    .end local v2    # "heightSize":I
    .restart local p8    # "heightSize":I
    :cond_18
    move/from16 v4, p6

    move/from16 v2, p8

    const/4 v3, 0x1

    move/from16 v23, v1

    move/from16 v22, v2

    move/from16 v17, v4

    move v4, v0

    .line 275
    .end local v0    # "computations":I
    .end local v1    # "allSolved":Z
    .end local p6    # "widthSize":I
    .end local p8    # "heightSize":I
    .local v4, "computations":I
    .local v17, "widthSize":I
    .local v22, "heightSize":I
    .local v23, "allSolved":Z
    :goto_e
    if-eqz v23, :cond_1a

    const/4 v0, 0x2

    if-eq v4, v0, :cond_19

    goto :goto_f

    :cond_19
    move/from16 v24, v4

    move/from16 v27, v5

    move-object/from16 v31, v11

    move-wide/from16 v28, v12

    move/from16 v25, v14

    goto/16 :goto_25

    .line 276
    :cond_1a
    :goto_f
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getOptimizationLevel()I

    move-result v2

    .line 277
    .local v2, "optimizations":I
    if-lez v14, :cond_1b

    .line 278
    invoke-direct/range {p0 .. p1}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->measureChildren(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;)V

    .line 284
    :cond_1b
    invoke-virtual/range {p0 .. p1}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->updateHierarchy(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;)V

    .line 287
    iget-object v0, v6, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 290
    .local v1, "sizeDependentWidgetsCount":I
    if-lez v14, :cond_1c

    .line 291
    const/16 v24, 0x0

    const-string v25, "First pass"

    move-object/from16 v0, p0

    move/from16 v26, v1

    .end local v1    # "sizeDependentWidgetsCount":I
    .local v26, "sizeDependentWidgetsCount":I
    move-object/from16 v1, p1

    move v8, v2

    .end local v2    # "optimizations":I
    .local v8, "optimizations":I
    move-object/from16 v2, v25

    const/16 v18, 0x0

    const/16 v25, 0x1

    move/from16 v3, v24

    move/from16 v24, v4

    .end local v4    # "computations":I
    .local v24, "computations":I
    move v4, v15

    move/from16 v27, v5

    .end local v5    # "optimizeWrap":Z
    .local v27, "optimizeWrap":Z
    move/from16 v5, v16

    invoke-direct/range {v0 .. v5}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->solveLinearSystem(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;Ljava/lang/String;III)V

    goto :goto_10

    .line 290
    .end local v8    # "optimizations":I
    .end local v24    # "computations":I
    .end local v26    # "sizeDependentWidgetsCount":I
    .end local v27    # "optimizeWrap":Z
    .restart local v1    # "sizeDependentWidgetsCount":I
    .restart local v2    # "optimizations":I
    .restart local v4    # "computations":I
    .restart local v5    # "optimizeWrap":Z
    :cond_1c
    move/from16 v26, v1

    move v8, v2

    move/from16 v24, v4

    move/from16 v27, v5

    const/16 v18, 0x0

    const/16 v25, 0x1

    .line 298
    .end local v1    # "sizeDependentWidgetsCount":I
    .end local v2    # "optimizations":I
    .end local v4    # "computations":I
    .end local v5    # "optimizeWrap":Z
    .restart local v8    # "optimizations":I
    .restart local v24    # "computations":I
    .restart local v26    # "sizeDependentWidgetsCount":I
    .restart local v27    # "optimizeWrap":Z
    :goto_10
    move/from16 v5, v26

    .end local v26    # "sizeDependentWidgetsCount":I
    .local v5, "sizeDependentWidgetsCount":I
    if-lez v5, :cond_36

    .line 299
    const/4 v0, 0x0

    .line 300
    .local v0, "needSolverPass":Z
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v1

    sget-object v2, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v1, v2, :cond_1d

    const/4 v4, 0x1

    goto :goto_11

    :cond_1d
    const/4 v4, 0x0

    :goto_11
    move/from16 v26, v4

    .line 302
    .local v26, "containerWrapWidth":Z
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v1

    sget-object v2, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v1, v2, :cond_1e

    const/4 v4, 0x1

    goto :goto_12

    :cond_1e
    const/4 v4, 0x0

    :goto_12
    move/from16 v18, v4

    .line 304
    .local v18, "containerWrapHeight":Z
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getWidth()I

    move-result v1

    iget-object v2, v6, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->constraintWidgetContainer:Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMinWidth()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 305
    .local v1, "minWidth":I
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getHeight()I

    move-result v2

    iget-object v3, v6, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->constraintWidgetContainer:Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getMinHeight()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 310
    .local v2, "minHeight":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_13
    if-ge v3, v5, :cond_25

    .line 311
    iget-object v4, v6, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 312
    .local v4, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    instance-of v9, v4, Landroidx/constraintlayout/core/widgets/VirtualLayout;

    if-nez v9, :cond_1f

    .line 313
    move-wide/from16 v28, v12

    move/from16 v25, v14

    goto/16 :goto_19

    .line 315
    :cond_1f
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v9

    .line 316
    .local v9, "preWidth":I
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v10

    .line 317
    .local v10, "preHeight":I
    move/from16 v25, v14

    .end local v14    # "childCount":I
    .local v25, "childCount":I
    sget v14, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->TRY_GIVEN_DIMENSIONS:I

    invoke-direct {v6, v11, v4, v14}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->measure(Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Z

    move-result v14

    or-int/2addr v0, v14

    .line 318
    iget-object v14, v7, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mMetrics:Landroidx/constraintlayout/core/Metrics;

    if-eqz v14, :cond_20

    .line 319
    iget-object v14, v7, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mMetrics:Landroidx/constraintlayout/core/Metrics;

    move-wide/from16 v28, v12

    .end local v12    # "layoutTime":J
    .local v28, "layoutTime":J
    iget-wide v12, v14, Landroidx/constraintlayout/core/Metrics;->measuredMatchWidgets:J

    add-long v12, v12, v19

    iput-wide v12, v14, Landroidx/constraintlayout/core/Metrics;->measuredMatchWidgets:J

    goto :goto_14

    .line 318
    .end local v28    # "layoutTime":J
    .restart local v12    # "layoutTime":J
    :cond_20
    move-wide/from16 v28, v12

    .line 321
    .end local v12    # "layoutTime":J
    .restart local v28    # "layoutTime":J
    :goto_14
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v12

    .line 322
    .local v12, "measuredWidth":I
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v13

    .line 323
    .local v13, "measuredHeight":I
    if-eq v12, v9, :cond_22

    .line 324
    invoke-virtual {v4, v12}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setWidth(I)V

    .line 325
    if-eqz v26, :cond_21

    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getRight()I

    move-result v14

    if-le v14, v1, :cond_21

    .line 326
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getRight()I

    move-result v14

    move/from16 p6, v0

    .end local v0    # "needSolverPass":Z
    .local p6, "needSolverPass":Z
    sget-object v0, Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;

    .line 327
    invoke-virtual {v4, v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v0

    add-int/2addr v14, v0

    .line 328
    .local v14, "w":I
    invoke-static {v1, v14}, Ljava/lang/Math;->max(II)I

    move-result v0

    move v1, v0

    .end local v1    # "minWidth":I
    .local v0, "minWidth":I
    goto :goto_15

    .line 325
    .end local v14    # "w":I
    .end local p6    # "needSolverPass":Z
    .local v0, "needSolverPass":Z
    .restart local v1    # "minWidth":I
    :cond_21
    move/from16 p6, v0

    .line 330
    .end local v0    # "needSolverPass":Z
    .restart local p6    # "needSolverPass":Z
    :goto_15
    const/4 v0, 0x1

    .end local p6    # "needSolverPass":Z
    .restart local v0    # "needSolverPass":Z
    goto :goto_16

    .line 323
    :cond_22
    move/from16 p6, v0

    .line 332
    :goto_16
    if-eq v13, v10, :cond_24

    .line 333
    invoke-virtual {v4, v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setHeight(I)V

    .line 334
    if-eqz v18, :cond_23

    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getBottom()I

    move-result v14

    if-le v14, v2, :cond_23

    .line 335
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getBottom()I

    move-result v14

    move/from16 p6, v0

    .end local v0    # "needSolverPass":Z
    .restart local p6    # "needSolverPass":Z
    sget-object v0, Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;

    .line 336
    invoke-virtual {v4, v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v0

    add-int/2addr v14, v0

    .line 337
    .local v14, "h":I
    invoke-static {v2, v14}, Ljava/lang/Math;->max(II)I

    move-result v0

    move v2, v0

    .end local v2    # "minHeight":I
    .local v0, "minHeight":I
    goto :goto_17

    .line 334
    .end local v14    # "h":I
    .end local p6    # "needSolverPass":Z
    .local v0, "needSolverPass":Z
    .restart local v2    # "minHeight":I
    :cond_23
    move/from16 p6, v0

    .line 339
    .end local v0    # "needSolverPass":Z
    .restart local p6    # "needSolverPass":Z
    :goto_17
    const/4 v0, 0x1

    .end local p6    # "needSolverPass":Z
    .restart local v0    # "needSolverPass":Z
    goto :goto_18

    .line 332
    :cond_24
    move/from16 p6, v0

    .line 341
    :goto_18
    move-object v14, v4

    check-cast v14, Landroidx/constraintlayout/core/widgets/VirtualLayout;

    .line 342
    .local v14, "virtualLayout":Landroidx/constraintlayout/core/widgets/VirtualLayout;
    invoke-virtual {v14}, Landroidx/constraintlayout/core/widgets/VirtualLayout;->needSolverPass()Z

    move-result v30

    or-int v0, v0, v30

    .line 310
    .end local v4    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v9    # "preWidth":I
    .end local v10    # "preHeight":I
    .end local v12    # "measuredWidth":I
    .end local v13    # "measuredHeight":I
    .end local v14    # "virtualLayout":Landroidx/constraintlayout/core/widgets/VirtualLayout;
    :goto_19
    add-int/lit8 v3, v3, 0x1

    move/from16 v9, p5

    move/from16 v10, p7

    move/from16 v14, v25

    move-wide/from16 v12, v28

    goto/16 :goto_13

    .end local v25    # "childCount":I
    .end local v28    # "layoutTime":J
    .local v12, "layoutTime":J
    .local v14, "childCount":I
    :cond_25
    move-wide/from16 v28, v12

    move/from16 v25, v14

    .line 346
    .end local v3    # "i":I
    .end local v12    # "layoutTime":J
    .end local v14    # "childCount":I
    .restart local v25    # "childCount":I
    .restart local v28    # "layoutTime":J
    const/4 v9, 0x2

    .line 347
    .local v9, "maxIterations":I
    const/4 v3, 0x0

    move v10, v3

    .local v10, "j":I
    :goto_1a
    if-ge v10, v9, :cond_35

    .line 348
    const/4 v3, 0x0

    move v12, v0

    move v13, v1

    move v14, v2

    .end local v0    # "needSolverPass":Z
    .end local v1    # "minWidth":I
    .end local v2    # "minHeight":I
    .restart local v3    # "i":I
    .local v12, "needSolverPass":Z
    .local v13, "minWidth":I
    .local v14, "minHeight":I
    :goto_1b
    if-ge v3, v5, :cond_33

    .line 349
    iget-object v0, v6, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 350
    .local v0, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    instance-of v1, v0, Landroidx/constraintlayout/core/widgets/Helper;

    if-eqz v1, :cond_26

    instance-of v1, v0, Landroidx/constraintlayout/core/widgets/VirtualLayout;

    if-eqz v1, :cond_2a

    :cond_26
    instance-of v1, v0, Landroidx/constraintlayout/core/widgets/Guideline;

    if-eqz v1, :cond_27

    .line 351
    goto :goto_1c

    .line 353
    :cond_27
    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_28

    .line 354
    goto :goto_1c

    .line 356
    :cond_28
    if-eqz v21, :cond_29

    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/core/widgets/analyzer/HorizontalWidgetRun;

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/HorizontalWidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget-boolean v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->resolved:Z

    if-eqz v1, :cond_29

    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/core/widgets/analyzer/VerticalWidgetRun;

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/VerticalWidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget-boolean v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->resolved:Z

    if-eqz v1, :cond_29

    .line 358
    goto :goto_1c

    .line 360
    :cond_29
    instance-of v1, v0, Landroidx/constraintlayout/core/widgets/VirtualLayout;

    if-eqz v1, :cond_2b

    .line 361
    nop

    .line 348
    .end local v0    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_2a
    :goto_1c
    move/from16 p6, v5

    move-object/from16 v31, v11

    goto/16 :goto_23

    .line 364
    .restart local v0    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_2b
    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v1

    .line 365
    .local v1, "preWidth":I
    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v2

    .line 366
    .local v2, "preHeight":I
    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getBaselineDistance()I

    move-result v4

    .line 368
    .local v4, "preBaselineDistance":I
    sget v30, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->TRY_GIVEN_DIMENSIONS:I

    .line 369
    .local v30, "measureStrategy":I
    move/from16 p6, v5

    .end local v5    # "sizeDependentWidgetsCount":I
    .local p6, "sizeDependentWidgetsCount":I
    add-int/lit8 v5, v9, -0x1

    if-ne v10, v5, :cond_2c

    .line 370
    sget v30, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measure;->USE_GIVEN_DIMENSIONS:I

    move/from16 v5, v30

    goto :goto_1d

    .line 369
    :cond_2c
    move/from16 v5, v30

    .line 372
    .end local v30    # "measureStrategy":I
    .local v5, "measureStrategy":I
    :goto_1d
    invoke-direct {v6, v11, v0, v5}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->measure(Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Z

    move-result v30

    .line 376
    .local v30, "hasMeasure":Z
    or-int v12, v12, v30

    .line 380
    move/from16 p8, v5

    .end local v5    # "measureStrategy":I
    .local p8, "measureStrategy":I
    iget-object v5, v7, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mMetrics:Landroidx/constraintlayout/core/Metrics;

    if-eqz v5, :cond_2d

    .line 381
    iget-object v5, v7, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mMetrics:Landroidx/constraintlayout/core/Metrics;

    move-object/from16 v31, v11

    move/from16 v32, v12

    .end local v11    # "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .end local v12    # "needSolverPass":Z
    .local v31, "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .local v32, "needSolverPass":Z
    iget-wide v11, v5, Landroidx/constraintlayout/core/Metrics;->measuredMatchWidgets:J

    add-long v11, v11, v19

    iput-wide v11, v5, Landroidx/constraintlayout/core/Metrics;->measuredMatchWidgets:J

    goto :goto_1e

    .line 380
    .end local v31    # "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .end local v32    # "needSolverPass":Z
    .restart local v11    # "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .restart local v12    # "needSolverPass":Z
    :cond_2d
    move-object/from16 v31, v11

    move/from16 v32, v12

    .line 384
    .end local v11    # "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .end local v12    # "needSolverPass":Z
    .restart local v31    # "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .restart local v32    # "needSolverPass":Z
    :goto_1e
    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getWidth()I

    move-result v5

    .line 385
    .local v5, "measuredWidth":I
    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHeight()I

    move-result v11

    .line 387
    .local v11, "measuredHeight":I
    if-eq v5, v1, :cond_2f

    .line 388
    invoke-virtual {v0, v5}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setWidth(I)V

    .line 389
    if-eqz v26, :cond_2e

    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getRight()I

    move-result v12

    if-le v12, v13, :cond_2e

    .line 390
    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getRight()I

    move-result v12

    move/from16 v33, v1

    .end local v1    # "preWidth":I
    .local v33, "preWidth":I
    sget-object v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;

    .line 391
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    add-int/2addr v12, v1

    .line 392
    .local v12, "w":I
    invoke-static {v13, v12}, Ljava/lang/Math;->max(II)I

    move-result v13

    goto :goto_1f

    .line 389
    .end local v12    # "w":I
    .end local v33    # "preWidth":I
    .restart local v1    # "preWidth":I
    :cond_2e
    move/from16 v33, v1

    .line 397
    .end local v1    # "preWidth":I
    .restart local v33    # "preWidth":I
    :goto_1f
    const/4 v12, 0x1

    .end local v32    # "needSolverPass":Z
    .local v12, "needSolverPass":Z
    goto :goto_20

    .line 387
    .end local v12    # "needSolverPass":Z
    .end local v33    # "preWidth":I
    .restart local v1    # "preWidth":I
    .restart local v32    # "needSolverPass":Z
    :cond_2f
    move/from16 v33, v1

    .end local v1    # "preWidth":I
    .restart local v33    # "preWidth":I
    move/from16 v12, v32

    .line 399
    .end local v32    # "needSolverPass":Z
    .restart local v12    # "needSolverPass":Z
    :goto_20
    if-eq v11, v2, :cond_31

    .line 400
    invoke-virtual {v0, v11}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->setHeight(I)V

    .line 401
    if-eqz v18, :cond_30

    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getBottom()I

    move-result v1

    if-le v1, v14, :cond_30

    .line 402
    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getBottom()I

    move-result v1

    move/from16 v32, v2

    .end local v2    # "preHeight":I
    .local v32, "preHeight":I
    sget-object v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;

    .line 403
    invoke-virtual {v0, v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/core/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    add-int/2addr v1, v2

    .line 404
    .local v1, "h":I
    invoke-static {v14, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    move v14, v2

    .end local v14    # "minHeight":I
    .local v2, "minHeight":I
    goto :goto_21

    .line 401
    .end local v1    # "h":I
    .end local v32    # "preHeight":I
    .local v2, "preHeight":I
    .restart local v14    # "minHeight":I
    :cond_30
    move/from16 v32, v2

    .line 409
    .end local v2    # "preHeight":I
    .restart local v32    # "preHeight":I
    :goto_21
    const/4 v12, 0x1

    goto :goto_22

    .line 399
    .end local v32    # "preHeight":I
    .restart local v2    # "preHeight":I
    :cond_31
    move/from16 v32, v2

    .line 411
    .end local v2    # "preHeight":I
    .restart local v32    # "preHeight":I
    :goto_22
    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->hasBaseline()Z

    move-result v1

    if-eqz v1, :cond_32

    invoke-virtual {v0}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getBaselineDistance()I

    move-result v1

    if-eq v4, v1, :cond_32

    .line 415
    const/4 v1, 0x1

    move v12, v1

    .line 348
    .end local v0    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v4    # "preBaselineDistance":I
    .end local v5    # "measuredWidth":I
    .end local v11    # "measuredHeight":I
    .end local v30    # "hasMeasure":Z
    .end local v32    # "preHeight":I
    .end local v33    # "preWidth":I
    .end local p8    # "measureStrategy":I
    :cond_32
    :goto_23
    add-int/lit8 v3, v3, 0x1

    move/from16 v5, p6

    move-object/from16 v11, v31

    goto/16 :goto_1b

    .end local v31    # "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .end local p6    # "sizeDependentWidgetsCount":I
    .local v5, "sizeDependentWidgetsCount":I
    .local v11, "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    :cond_33
    move/from16 p6, v5

    move-object/from16 v31, v11

    .line 418
    .end local v3    # "i":I
    .end local v5    # "sizeDependentWidgetsCount":I
    .end local v11    # "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .restart local v31    # "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .restart local p6    # "sizeDependentWidgetsCount":I
    if-eqz v12, :cond_34

    .line 419
    add-int/lit8 v3, v10, 0x1

    const-string v2, "intermediate pass"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v4, v15

    move/from16 v11, p6

    .end local p6    # "sizeDependentWidgetsCount":I
    .local v11, "sizeDependentWidgetsCount":I
    move/from16 v5, v16

    invoke-direct/range {v0 .. v5}, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->solveLinearSystem(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;Ljava/lang/String;III)V

    .line 420
    const/4 v0, 0x0

    .line 347
    .end local v12    # "needSolverPass":Z
    .local v0, "needSolverPass":Z
    add-int/lit8 v10, v10, 0x1

    move v5, v11

    move v1, v13

    move v2, v14

    move-object/from16 v11, v31

    goto/16 :goto_1a

    .line 418
    .end local v0    # "needSolverPass":Z
    .end local v11    # "sizeDependentWidgetsCount":I
    .restart local v12    # "needSolverPass":Z
    .restart local p6    # "sizeDependentWidgetsCount":I
    :cond_34
    move/from16 v11, p6

    .end local p6    # "sizeDependentWidgetsCount":I
    .restart local v11    # "sizeDependentWidgetsCount":I
    goto :goto_24

    .line 347
    .end local v12    # "needSolverPass":Z
    .end local v13    # "minWidth":I
    .end local v14    # "minHeight":I
    .end local v31    # "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .restart local v0    # "needSolverPass":Z
    .local v1, "minWidth":I
    .local v2, "minHeight":I
    .restart local v5    # "sizeDependentWidgetsCount":I
    .local v11, "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    :cond_35
    move-object/from16 v31, v11

    move v11, v5

    .end local v5    # "sizeDependentWidgetsCount":I
    .local v11, "sizeDependentWidgetsCount":I
    .restart local v31    # "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    goto :goto_24

    .line 298
    .end local v0    # "needSolverPass":Z
    .end local v1    # "minWidth":I
    .end local v2    # "minHeight":I
    .end local v9    # "maxIterations":I
    .end local v10    # "j":I
    .end local v18    # "containerWrapHeight":Z
    .end local v25    # "childCount":I
    .end local v26    # "containerWrapWidth":Z
    .end local v28    # "layoutTime":J
    .end local v31    # "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .restart local v5    # "sizeDependentWidgetsCount":I
    .local v11, "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    .local v12, "layoutTime":J
    .local v14, "childCount":I
    :cond_36
    move-object/from16 v31, v11

    move-wide/from16 v28, v12

    move/from16 v25, v14

    move v11, v5

    .line 426
    .end local v5    # "sizeDependentWidgetsCount":I
    .end local v12    # "layoutTime":J
    .end local v14    # "childCount":I
    .local v11, "sizeDependentWidgetsCount":I
    .restart local v25    # "childCount":I
    .restart local v28    # "layoutTime":J
    .restart local v31    # "measurer":Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure$Measurer;
    :goto_24
    invoke-virtual {v7, v8}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->setOptimizationLevel(I)V

    .line 431
    .end local v8    # "optimizations":I
    .end local v11    # "sizeDependentWidgetsCount":I
    :goto_25
    return-wide v28
.end method

.method public updateHierarchy(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;)V
    .locals 5
    .param p1, "layout"    # Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    .line 56
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 57
    iget-object v0, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 58
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 59
    iget-object v2, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 60
    .local v2, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v3

    sget-object v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v3, v4, :cond_0

    .line 61
    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v3

    sget-object v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v4, :cond_1

    .line 62
    :cond_0
    iget-object v3, p0, Landroidx/constraintlayout/core/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .end local v2    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 65
    .end local v1    # "i":I
    :cond_2
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->invalidateGraph()V

    .line 66
    return-void
.end method
