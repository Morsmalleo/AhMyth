.class public Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;
.super Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
.source "ChainRun.java"


# instance fields
.field private chainStyle:I

.field widgets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)V
    .locals 1
    .param p1, "widget"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .param p2, "orientation"    # I

    .line 36
    invoke-direct {p0, p1}, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;-><init>(Landroidx/constraintlayout/core/widgets/ConstraintWidget;)V

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    .line 37
    iput p2, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    .line 38
    invoke-direct {p0}, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->build()V

    .line 39
    return-void
.end method

.method private build()V
    .locals 7

    .line 78
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 79
    .local v0, "current":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    invoke-virtual {v0, v1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getPreviousChainMember(I)Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v1

    .line 80
    .local v1, "previous":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_0
    if-eqz v1, :cond_0

    .line 81
    move-object v0, v1

    .line 82
    iget v2, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    invoke-virtual {v0, v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getPreviousChainMember(I)Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v1

    goto :goto_0

    .line 84
    :cond_0
    iput-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 85
    iget-object v2, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    iget v3, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    invoke-virtual {v0, v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getRun(I)Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    iget v2, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    invoke-virtual {v0, v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getNextChainMember(I)Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v2

    .line 87
    .local v2, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_1
    if-eqz v2, :cond_1

    .line 88
    move-object v0, v2

    .line 89
    iget-object v3, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    iget v4, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    invoke-virtual {v0, v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getRun(I)Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    iget v3, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    invoke-virtual {v0, v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getNextChainMember(I)Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v2

    goto :goto_1

    .line 92
    :cond_1
    iget-object v3, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 93
    .local v4, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    iget v6, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    if-nez v6, :cond_2

    .line 94
    iget-object v5, v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iput-object p0, v5, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->horizontalChainRun:Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;

    goto :goto_3

    .line 95
    :cond_2
    iget v6, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    if-ne v6, v5, :cond_3

    .line 96
    iget-object v5, v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iput-object p0, v5, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->verticalChainRun:Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;

    .line 98
    .end local v4    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    :cond_3
    :goto_3
    goto :goto_2

    .line 99
    :cond_4
    iget v3, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    if-nez v3, :cond_5

    iget-object v3, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getParent()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->isRtl()Z

    move-result v3

    if-eqz v3, :cond_5

    const/4 v3, 0x1

    goto :goto_4

    :cond_5
    const/4 v3, 0x0

    .line 100
    .local v3, "isInRtl":Z
    :goto_4
    if-eqz v3, :cond_6

    iget-object v4, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le v4, v5, :cond_6

    .line 101
    iget-object v4, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v6, v5

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iput-object v4, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 103
    :cond_6
    iget v4, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    if-nez v4, :cond_7

    iget-object v4, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalChainStyle()I

    move-result v4

    goto :goto_5

    :cond_7
    iget-object v4, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalChainStyle()I

    move-result v4

    :goto_5
    iput v4, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->chainStyle:I

    .line 104
    return-void
.end method

.method private getFirstVisibleWidget()Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .locals 4

    .line 491
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 492
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 493
    .local v1, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    iget-object v2, v1, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_0

    .line 494
    iget-object v2, v1, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    return-object v2

    .line 491
    .end local v1    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 497
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private getLastVisibleWidget()Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .locals 4

    .line 501
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 502
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 503
    .local v1, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    iget-object v2, v1, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_0

    .line 504
    iget-object v2, v1, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    return-object v2

    .line 501
    .end local v1    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 507
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method apply()V
    .locals 13

    .line 513
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 514
    .local v1, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->apply()V

    .line 515
    .end local v1    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    goto :goto_0

    .line 516
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 517
    .local v0, "count":I
    const/4 v1, 0x1

    if-ge v0, v1, :cond_1

    .line 518
    return-void

    .line 522
    :cond_1
    iget-object v2, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    iget-object v2, v2, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 523
    .local v2, "firstWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v4, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    add-int/lit8 v5, v0, -0x1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 525
    .local v4, "lastWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget v5, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    if-nez v5, :cond_6

    .line 526
    iget-object v1, v2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 527
    .local v1, "startAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v5, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 528
    .local v5, "endAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    invoke-virtual {p0, v1, v3}, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->getTarget(Landroidx/constraintlayout/core/widgets/ConstraintAnchor;I)Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    move-result-object v6

    .line 529
    .local v6, "startTarget":Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;
    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v7

    .line 530
    .local v7, "startMargin":I
    invoke-direct {p0}, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->getFirstVisibleWidget()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v8

    .line 531
    .local v8, "firstVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    if-eqz v8, :cond_2

    .line 532
    iget-object v9, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v7

    .line 534
    :cond_2
    if-eqz v6, :cond_3

    .line 535
    iget-object v9, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {p0, v9, v6, v7}, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->addTarget(Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;I)V

    .line 537
    :cond_3
    invoke-virtual {p0, v5, v3}, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->getTarget(Landroidx/constraintlayout/core/widgets/ConstraintAnchor;I)Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    move-result-object v3

    .line 538
    .local v3, "endTarget":Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;
    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v9

    .line 539
    .local v9, "endMargin":I
    invoke-direct {p0}, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->getLastVisibleWidget()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v10

    .line 540
    .local v10, "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    if-eqz v10, :cond_4

    .line 541
    iget-object v11, v10, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v11}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v9

    .line 543
    :cond_4
    if-eqz v3, :cond_5

    .line 544
    iget-object v11, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    neg-int v12, v9

    invoke-virtual {p0, v11, v3, v12}, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->addTarget(Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;I)V

    .line 546
    .end local v1    # "startAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v3    # "endTarget":Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;
    .end local v5    # "endAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v6    # "startTarget":Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;
    .end local v7    # "startMargin":I
    .end local v8    # "firstVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v9    # "endMargin":I
    .end local v10    # "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_5
    goto :goto_1

    .line 547
    :cond_6
    iget-object v3, v2, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 548
    .local v3, "startAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v5, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 549
    .restart local v5    # "endAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    invoke-virtual {p0, v3, v1}, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->getTarget(Landroidx/constraintlayout/core/widgets/ConstraintAnchor;I)Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    move-result-object v6

    .line 550
    .restart local v6    # "startTarget":Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;
    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v7

    .line 551
    .restart local v7    # "startMargin":I
    invoke-direct {p0}, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->getFirstVisibleWidget()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v8

    .line 552
    .restart local v8    # "firstVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    if-eqz v8, :cond_7

    .line 553
    iget-object v9, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v7

    .line 555
    :cond_7
    if-eqz v6, :cond_8

    .line 556
    iget-object v9, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {p0, v9, v6, v7}, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->addTarget(Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;I)V

    .line 558
    :cond_8
    invoke-virtual {p0, v5, v1}, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->getTarget(Landroidx/constraintlayout/core/widgets/ConstraintAnchor;I)Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    move-result-object v1

    .line 559
    .local v1, "endTarget":Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;
    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v9

    .line 560
    .restart local v9    # "endMargin":I
    invoke-direct {p0}, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->getLastVisibleWidget()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v10

    .line 561
    .restart local v10    # "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    if-eqz v10, :cond_9

    .line 562
    iget-object v11, v10, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v11}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v9

    .line 564
    :cond_9
    if-eqz v1, :cond_a

    .line 565
    iget-object v11, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    neg-int v12, v9

    invoke-virtual {p0, v11, v1, v12}, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->addTarget(Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;I)V

    .line 568
    .end local v1    # "endTarget":Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;
    .end local v3    # "startAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v5    # "endAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v6    # "startTarget":Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;
    .end local v7    # "startMargin":I
    .end local v8    # "firstVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v9    # "endMargin":I
    .end local v10    # "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_a
    :goto_1
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iput-object p0, v1, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->updateDelegate:Landroidx/constraintlayout/core/widgets/analyzer/Dependency;

    .line 569
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iput-object p0, v1, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->updateDelegate:Landroidx/constraintlayout/core/widgets/analyzer/Dependency;

    .line 570
    return-void
.end method

.method public applyToWidget()V
    .locals 2

    .line 484
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 485
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 486
    .local v1, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->applyToWidget()V

    .line 484
    .end local v1    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 488
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method clear()V
    .locals 2

    .line 109
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->runGroup:Landroidx/constraintlayout/core/widgets/analyzer/RunGroup;

    .line 110
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 111
    .local v1, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->clear()V

    .line 112
    .end local v1    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    goto :goto_0

    .line 113
    :cond_0
    return-void
.end method

.method public getWrapDimension()J
    .locals 7

    .line 66
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 67
    .local v0, "count":I
    const-wide/16 v1, 0x0

    .line 68
    .local v1, "wrapDimension":J
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v0, :cond_0

    .line 69
    iget-object v4, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 70
    .local v4, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    iget-object v5, v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v5, v5, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    int-to-long v5, v5

    add-long/2addr v1, v5

    .line 71
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->getWrapDimension()J

    move-result-wide v5

    add-long/2addr v1, v5

    .line 72
    iget-object v5, v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v5, v5, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    int-to-long v5, v5

    add-long/2addr v1, v5

    .line 68
    .end local v4    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 74
    .end local v3    # "i":I
    :cond_0
    return-wide v1
.end method

.method reset()V
    .locals 2

    .line 117
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolved:Z

    .line 118
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iput-boolean v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolved:Z

    .line 119
    return-void
.end method

.method supportsWrapComputation()Z
    .locals 4

    .line 55
    iget-object v0, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 56
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 57
    iget-object v2, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 58
    .local v2, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->supportsWrapComputation()Z

    move-result v3

    if-nez v3, :cond_0

    .line 59
    const/4 v3, 0x0

    return v3

    .line 56
    .end local v2    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 62
    .end local v1    # "i":I
    :cond_1
    const/4 v1, 0x1

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ChainRun "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .local v0, "log":Ljava/lang/StringBuilder;
    iget v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    if-nez v1, :cond_0

    const-string v1, "horizontal : "

    goto :goto_0

    :cond_0
    const-string v1, "vertical : "

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    iget-object v1, p0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 46
    .local v2, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    const-string v3, "<"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    const-string v3, "> "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .end local v2    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    goto :goto_1

    .line 50
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public update(Landroidx/constraintlayout/core/widgets/analyzer/Dependency;)V
    .locals 27
    .param p1, "dependency"    # Landroidx/constraintlayout/core/widgets/analyzer/Dependency;

    .line 123
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget-boolean v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v1, :cond_59

    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget-boolean v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolved:Z

    if-nez v1, :cond_0

    goto/16 :goto_2c

    .line 127
    :cond_0
    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getParent()Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    move-result-object v1

    .line 128
    .local v1, "parent":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    const/4 v2, 0x0

    .line 129
    .local v2, "isInRtl":Z
    instance-of v3, v1, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    if-eqz v3, :cond_1

    .line 130
    move-object v3, v1

    check-cast v3, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->isRtl()Z

    move-result v2

    .line 132
    :cond_1
    iget-object v3, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v3, v3, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->value:I

    iget-object v4, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v4, v4, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->value:I

    sub-int/2addr v3, v4

    .line 133
    .local v3, "distance":I
    const/4 v4, 0x0

    .line 134
    .local v4, "size":I
    const/4 v5, 0x0

    .line 135
    .local v5, "numMatchConstraints":I
    const/4 v6, 0x0

    .line 136
    .local v6, "weights":F
    const/4 v7, 0x0

    .line 137
    .local v7, "numVisibleWidgets":I
    iget-object v8, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 139
    .local v8, "count":I
    const/4 v9, -0x1

    .line 140
    .local v9, "firstVisibleWidget":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    const/16 v11, 0x8

    if-ge v10, v8, :cond_3

    .line 141
    iget-object v12, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 142
    .local v12, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    iget-object v13, v12, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v13}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v13

    if-ne v13, v11, :cond_2

    .line 143
    nop

    .line 140
    .end local v12    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 145
    .restart local v12    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    :cond_2
    move v9, v10

    .line 149
    .end local v10    # "i":I
    .end local v12    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    :cond_3
    const/4 v10, -0x1

    .line 150
    .local v10, "lastVisibleWidget":I
    add-int/lit8 v12, v8, -0x1

    .local v12, "i":I
    :goto_1
    if-ltz v12, :cond_5

    .line 151
    iget-object v13, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v13, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 152
    .local v13, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v14}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v14

    if-ne v14, v11, :cond_4

    .line 153
    nop

    .line 150
    .end local v13    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    add-int/lit8 v12, v12, -0x1

    goto :goto_1

    .line 155
    .restart local v13    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    :cond_4
    move v10, v12

    .line 158
    .end local v12    # "i":I
    .end local v13    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    :cond_5
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_2
    const/4 v15, 0x2

    if-ge v12, v15, :cond_12

    .line 159
    const/16 v17, 0x0

    move/from16 v15, v17

    .local v15, "i":I
    :goto_3
    if-ge v15, v8, :cond_10

    .line 160
    iget-object v13, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v13, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 161
    .restart local v13    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v14}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v14

    if-ne v14, v11, :cond_6

    .line 162
    move-object/from16 v19, v1

    goto/16 :goto_7

    .line 164
    :cond_6
    add-int/lit8 v7, v7, 0x1

    .line 165
    if-lez v15, :cond_7

    if-lt v15, v9, :cond_7

    .line 166
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v14, v14, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    add-int/2addr v4, v14

    .line 168
    :cond_7
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget v14, v14, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->value:I

    .line 169
    .local v14, "dimension":I
    iget-object v11, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimensionBehavior:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-object/from16 v19, v1

    .end local v1    # "parent":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v19, "parent":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    sget-object v1, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v11, v1, :cond_8

    const/4 v1, 0x1

    goto :goto_4

    :cond_8
    const/4 v1, 0x0

    .line 170
    .local v1, "treatAsFixed":Z
    :goto_4
    if-eqz v1, :cond_a

    .line 171
    iget v11, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    if-nez v11, :cond_9

    iget-object v11, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iget-object v11, v11, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/core/widgets/analyzer/HorizontalWidgetRun;

    iget-object v11, v11, Landroidx/constraintlayout/core/widgets/analyzer/HorizontalWidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget-boolean v11, v11, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->resolved:Z

    if-nez v11, :cond_9

    .line 172
    return-void

    .line 174
    :cond_9
    iget v11, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    move/from16 v20, v1

    const/4 v1, 0x1

    .end local v1    # "treatAsFixed":Z
    .local v20, "treatAsFixed":Z
    if-ne v11, v1, :cond_c

    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/core/widgets/analyzer/VerticalWidgetRun;

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/VerticalWidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget-boolean v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->resolved:Z

    if-nez v1, :cond_c

    .line 175
    return-void

    .line 177
    .end local v20    # "treatAsFixed":Z
    .restart local v1    # "treatAsFixed":Z
    :cond_a
    move/from16 v20, v1

    .end local v1    # "treatAsFixed":Z
    .restart local v20    # "treatAsFixed":Z
    iget v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->matchConstraintsType:I

    const/4 v11, 0x1

    if-ne v1, v11, :cond_b

    if-nez v12, :cond_b

    .line 178
    const/4 v1, 0x1

    .line 179
    .end local v20    # "treatAsFixed":Z
    .restart local v1    # "treatAsFixed":Z
    iget-object v11, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget v14, v11, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->wrapValue:I

    .line 180
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 181
    .end local v1    # "treatAsFixed":Z
    .restart local v20    # "treatAsFixed":Z
    :cond_b
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget-boolean v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->resolved:Z

    if-eqz v1, :cond_c

    .line 182
    const/4 v1, 0x1

    .end local v20    # "treatAsFixed":Z
    .restart local v1    # "treatAsFixed":Z
    goto :goto_5

    .line 184
    .end local v1    # "treatAsFixed":Z
    .restart local v20    # "treatAsFixed":Z
    :cond_c
    move/from16 v1, v20

    .end local v20    # "treatAsFixed":Z
    .restart local v1    # "treatAsFixed":Z
    :goto_5
    if-nez v1, :cond_e

    .line 185
    add-int/lit8 v5, v5, 0x1

    .line 186
    iget-object v11, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iget-object v11, v11, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mWeight:[F

    move/from16 v20, v1

    .end local v1    # "treatAsFixed":Z
    .restart local v20    # "treatAsFixed":Z
    iget v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    aget v1, v11, v1

    .line 187
    .local v1, "weight":F
    const/4 v11, 0x0

    cmpl-float v21, v1, v11

    if-ltz v21, :cond_d

    .line 188
    add-float/2addr v6, v1

    .line 190
    .end local v1    # "weight":F
    :cond_d
    goto :goto_6

    .line 191
    .end local v20    # "treatAsFixed":Z
    .local v1, "treatAsFixed":Z
    :cond_e
    move/from16 v20, v1

    .end local v1    # "treatAsFixed":Z
    .restart local v20    # "treatAsFixed":Z
    add-int/2addr v4, v14

    .line 193
    :goto_6
    add-int/lit8 v1, v8, -0x1

    if-ge v15, v1, :cond_f

    if-ge v15, v10, :cond_f

    .line 194
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    neg-int v1, v1

    add-int/2addr v4, v1

    .line 159
    .end local v13    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    .end local v14    # "dimension":I
    .end local v20    # "treatAsFixed":Z
    :cond_f
    :goto_7
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v1, v19

    const/16 v11, 0x8

    goto/16 :goto_3

    .end local v19    # "parent":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v1, "parent":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_10
    move-object/from16 v19, v1

    .line 197
    .end local v1    # "parent":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v15    # "i":I
    .restart local v19    # "parent":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    if-lt v4, v3, :cond_13

    if-nez v5, :cond_11

    .line 198
    goto :goto_8

    .line 201
    :cond_11
    const/4 v7, 0x0

    .line 202
    const/4 v5, 0x0

    .line 203
    const/4 v4, 0x0

    .line 204
    const/4 v6, 0x0

    .line 158
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v1, v19

    const/16 v11, 0x8

    goto/16 :goto_2

    .end local v19    # "parent":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v1    # "parent":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_12
    move-object/from16 v19, v1

    .line 207
    .end local v1    # "parent":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v12    # "j":I
    .restart local v19    # "parent":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_13
    :goto_8
    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->value:I

    .line 208
    .local v1, "position":I
    if-eqz v2, :cond_14

    .line 209
    iget-object v11, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v1, v11, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->value:I

    .line 211
    :cond_14
    const/high16 v11, 0x3f000000    # 0.5f

    if-le v4, v3, :cond_16

    .line 212
    const/high16 v12, 0x40000000    # 2.0f

    if-eqz v2, :cond_15

    .line 213
    sub-int v13, v4, v3

    int-to-float v13, v13

    div-float/2addr v13, v12

    add-float/2addr v13, v11

    float-to-int v12, v13

    add-int/2addr v1, v12

    goto :goto_9

    .line 215
    :cond_15
    sub-int v13, v4, v3

    int-to-float v13, v13

    div-float/2addr v13, v12

    add-float/2addr v13, v11

    float-to-int v12, v13

    sub-int/2addr v1, v12

    .line 218
    :cond_16
    :goto_9
    const/4 v12, 0x0

    .line 219
    .local v12, "matchConstraintsDimension":I
    if-lez v5, :cond_25

    .line 220
    sub-int v13, v3, v4

    int-to-float v13, v13

    int-to-float v14, v5

    div-float/2addr v13, v14

    add-float/2addr v13, v11

    float-to-int v12, v13

    .line 222
    const/4 v13, 0x0

    .line 223
    .local v13, "appliedLimits":I
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_a
    if-ge v14, v8, :cond_1e

    .line 224
    iget-object v15, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v15, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 225
    .local v15, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    iget-object v11, v15, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v11}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v11

    move/from16 v21, v1

    const/16 v1, 0x8

    .end local v1    # "position":I
    .local v21, "position":I
    if-ne v11, v1, :cond_17

    .line 226
    move/from16 v25, v2

    move/from16 v22, v4

    move/from16 v23, v6

    move/from16 v24, v12

    goto/16 :goto_d

    .line 228
    :cond_17
    iget-object v1, v15, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimensionBehavior:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v11, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v1, v11, :cond_1d

    iget-object v1, v15, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget-boolean v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->resolved:Z

    if-nez v1, :cond_1d

    .line 229
    move v1, v12

    .line 230
    .local v1, "dimension":I
    const/4 v11, 0x0

    cmpl-float v18, v6, v11

    if-lez v18, :cond_18

    .line 231
    iget-object v11, v15, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iget-object v11, v11, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mWeight:[F

    move/from16 v22, v1

    .end local v1    # "dimension":I
    .local v22, "dimension":I
    iget v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    aget v1, v11, v1

    .line 232
    .local v1, "weight":F
    sub-int v11, v3, v4

    int-to-float v11, v11

    mul-float v11, v11, v1

    div-float/2addr v11, v6

    const/high16 v20, 0x3f000000    # 0.5f

    add-float v11, v11, v20

    float-to-int v11, v11

    move v1, v11

    .end local v22    # "dimension":I
    .local v11, "dimension":I
    goto :goto_b

    .line 230
    .end local v11    # "dimension":I
    .local v1, "dimension":I
    :cond_18
    move/from16 v22, v1

    .line 236
    :goto_b
    move v11, v1

    .line 237
    .local v11, "value":I
    move/from16 v22, v4

    .end local v4    # "size":I
    .local v22, "size":I
    iget v4, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    if-nez v4, :cond_19

    .line 238
    iget-object v4, v15, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iget v4, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMaxWidth:I

    .line 239
    .local v4, "max":I
    move/from16 v23, v4

    .end local v4    # "max":I
    .local v23, "max":I
    iget-object v4, v15, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iget v4, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMinWidth:I

    move/from16 v26, v6

    move v6, v4

    move/from16 v4, v23

    move/from16 v23, v26

    .local v4, "min":I
    goto :goto_c

    .line 241
    .end local v4    # "min":I
    .end local v23    # "max":I
    :cond_19
    iget-object v4, v15, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iget v4, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMaxHeight:I

    .line 242
    .local v4, "max":I
    move/from16 v23, v4

    .end local v4    # "max":I
    .restart local v23    # "max":I
    iget-object v4, v15, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iget v4, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mMatchConstraintMinHeight:I

    move/from16 v26, v6

    move v6, v4

    move/from16 v4, v23

    move/from16 v23, v26

    .line 244
    .restart local v4    # "max":I
    .local v6, "min":I
    .local v23, "weights":F
    :goto_c
    move/from16 v24, v12

    .end local v12    # "matchConstraintsDimension":I
    .local v24, "matchConstraintsDimension":I
    iget v12, v15, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->matchConstraintsType:I

    move/from16 v25, v2

    const/4 v2, 0x1

    .end local v2    # "isInRtl":Z
    .local v25, "isInRtl":Z
    if-ne v12, v2, :cond_1a

    .line 245
    iget-object v2, v15, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget v2, v2, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->wrapValue:I

    invoke-static {v11, v2}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 247
    :cond_1a
    invoke-static {v6, v11}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 248
    .end local v11    # "value":I
    .local v2, "value":I
    if-lez v4, :cond_1b

    .line 249
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 251
    :cond_1b
    if-eq v2, v1, :cond_1c

    .line 252
    add-int/lit8 v13, v13, 0x1

    .line 253
    move v1, v2

    .line 255
    :cond_1c
    iget-object v11, v15, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    invoke-virtual {v11, v1}, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->resolve(I)V

    goto :goto_d

    .line 228
    .end local v1    # "dimension":I
    .end local v22    # "size":I
    .end local v23    # "weights":F
    .end local v24    # "matchConstraintsDimension":I
    .end local v25    # "isInRtl":Z
    .local v2, "isInRtl":Z
    .local v4, "size":I
    .local v6, "weights":F
    .restart local v12    # "matchConstraintsDimension":I
    :cond_1d
    move/from16 v25, v2

    move/from16 v22, v4

    move/from16 v23, v6

    move/from16 v24, v12

    .line 223
    .end local v2    # "isInRtl":Z
    .end local v4    # "size":I
    .end local v6    # "weights":F
    .end local v12    # "matchConstraintsDimension":I
    .end local v15    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    .restart local v22    # "size":I
    .restart local v23    # "weights":F
    .restart local v24    # "matchConstraintsDimension":I
    .restart local v25    # "isInRtl":Z
    :goto_d
    add-int/lit8 v14, v14, 0x1

    move/from16 v1, v21

    move/from16 v4, v22

    move/from16 v6, v23

    move/from16 v12, v24

    move/from16 v2, v25

    const/high16 v11, 0x3f000000    # 0.5f

    goto/16 :goto_a

    .end local v21    # "position":I
    .end local v22    # "size":I
    .end local v23    # "weights":F
    .end local v24    # "matchConstraintsDimension":I
    .end local v25    # "isInRtl":Z
    .local v1, "position":I
    .restart local v2    # "isInRtl":Z
    .restart local v4    # "size":I
    .restart local v6    # "weights":F
    .restart local v12    # "matchConstraintsDimension":I
    :cond_1e
    move/from16 v21, v1

    move/from16 v25, v2

    move/from16 v22, v4

    move/from16 v23, v6

    move/from16 v24, v12

    .line 258
    .end local v1    # "position":I
    .end local v2    # "isInRtl":Z
    .end local v4    # "size":I
    .end local v6    # "weights":F
    .end local v12    # "matchConstraintsDimension":I
    .end local v14    # "i":I
    .restart local v21    # "position":I
    .restart local v22    # "size":I
    .restart local v23    # "weights":F
    .restart local v24    # "matchConstraintsDimension":I
    .restart local v25    # "isInRtl":Z
    if-lez v13, :cond_23

    .line 259
    sub-int/2addr v5, v13

    .line 261
    const/4 v1, 0x0

    .line 262
    .end local v22    # "size":I
    .local v1, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_e
    if-ge v2, v8, :cond_22

    .line 263
    iget-object v4, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 264
    .local v4, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    iget-object v6, v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v6}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v6

    const/16 v11, 0x8

    if-ne v6, v11, :cond_1f

    .line 265
    goto :goto_f

    .line 267
    :cond_1f
    if-lez v2, :cond_20

    if-lt v2, v9, :cond_20

    .line 268
    iget-object v6, v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v6, v6, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    add-int/2addr v1, v6

    .line 270
    :cond_20
    iget-object v6, v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget v6, v6, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->value:I

    add-int/2addr v1, v6

    .line 271
    add-int/lit8 v6, v8, -0x1

    if-ge v2, v6, :cond_21

    if-ge v2, v10, :cond_21

    .line 272
    iget-object v6, v4, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v6, v6, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    neg-int v6, v6

    add-int/2addr v1, v6

    .line 262
    .end local v4    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    :cond_21
    :goto_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    :cond_22
    move v4, v1

    goto :goto_10

    .line 258
    .end local v1    # "size":I
    .end local v2    # "i":I
    .restart local v22    # "size":I
    :cond_23
    move/from16 v4, v22

    .line 276
    .end local v22    # "size":I
    .local v4, "size":I
    :goto_10
    iget v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->chainStyle:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_24

    if-nez v13, :cond_24

    .line 277
    const/4 v1, 0x0

    iput v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->chainStyle:I

    .line 281
    .end local v13    # "appliedLimits":I
    :cond_24
    move/from16 v12, v24

    goto :goto_11

    .line 219
    .end local v21    # "position":I
    .end local v23    # "weights":F
    .end local v24    # "matchConstraintsDimension":I
    .end local v25    # "isInRtl":Z
    .local v1, "position":I
    .local v2, "isInRtl":Z
    .restart local v6    # "weights":F
    .restart local v12    # "matchConstraintsDimension":I
    :cond_25
    move/from16 v21, v1

    move/from16 v25, v2

    move/from16 v22, v4

    move/from16 v23, v6

    .line 281
    .end local v1    # "position":I
    .end local v2    # "isInRtl":Z
    .end local v6    # "weights":F
    .restart local v21    # "position":I
    .restart local v23    # "weights":F
    .restart local v25    # "isInRtl":Z
    :goto_11
    if-le v4, v3, :cond_26

    .line 282
    const/4 v1, 0x2

    iput v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->chainStyle:I

    goto :goto_12

    .line 281
    :cond_26
    const/4 v1, 0x2

    .line 285
    :goto_12
    if-lez v7, :cond_27

    if-nez v5, :cond_27

    if-ne v9, v10, :cond_27

    .line 287
    iput v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->chainStyle:I

    .line 290
    :cond_27
    iget v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->chainStyle:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_38

    .line 291
    const/4 v1, 0x0

    .line 292
    .local v1, "gap":I
    if-le v7, v2, :cond_28

    .line 293
    sub-int v6, v3, v4

    add-int/lit8 v11, v7, -0x1

    div-int v1, v6, v11

    goto :goto_13

    .line 294
    :cond_28
    if-ne v7, v2, :cond_29

    .line 295
    sub-int v2, v3, v4

    const/4 v6, 0x2

    div-int/lit8 v1, v2, 0x2

    .line 297
    :cond_29
    :goto_13
    if-lez v5, :cond_2a

    .line 298
    const/4 v1, 0x0

    .line 300
    :cond_2a
    const/4 v2, 0x0

    move v6, v2

    move/from16 v2, v21

    .end local v21    # "position":I
    .local v2, "position":I
    .local v6, "i":I
    :goto_14
    if-ge v6, v8, :cond_37

    .line 301
    move v11, v6

    .line 302
    .local v11, "index":I
    if-eqz v25, :cond_2b

    .line 303
    add-int/lit8 v13, v6, 0x1

    sub-int v11, v8, v13

    .line 305
    :cond_2b
    iget-object v13, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v13, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 306
    .local v13, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v14}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v14

    const/16 v15, 0x8

    if-ne v14, v15, :cond_2c

    .line 307
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v14, v2}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 308
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v14, v2}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 309
    move/from16 v16, v1

    goto/16 :goto_1a

    .line 311
    :cond_2c
    if-lez v6, :cond_2e

    .line 312
    if-eqz v25, :cond_2d

    .line 313
    sub-int/2addr v2, v1

    goto :goto_15

    .line 315
    :cond_2d
    add-int/2addr v2, v1

    .line 318
    :cond_2e
    :goto_15
    if-lez v6, :cond_30

    if-lt v6, v9, :cond_30

    .line 319
    if-eqz v25, :cond_2f

    .line 320
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v14, v14, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    sub-int/2addr v2, v14

    goto :goto_16

    .line 322
    :cond_2f
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v14, v14, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    add-int/2addr v2, v14

    .line 326
    :cond_30
    :goto_16
    if-eqz v25, :cond_31

    .line 327
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v14, v2}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    goto :goto_17

    .line 329
    :cond_31
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v14, v2}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 332
    :goto_17
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget v14, v14, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->value:I

    .line 333
    .local v14, "dimension":I
    iget-object v15, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimensionBehavior:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move/from16 v16, v1

    .end local v1    # "gap":I
    .local v16, "gap":I
    sget-object v1, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v15, v1, :cond_32

    iget v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->matchConstraintsType:I

    const/4 v15, 0x1

    if-ne v1, v15, :cond_32

    .line 335
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget v14, v1, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->wrapValue:I

    .line 337
    :cond_32
    if-eqz v25, :cond_33

    .line 338
    sub-int/2addr v2, v14

    goto :goto_18

    .line 340
    :cond_33
    add-int/2addr v2, v14

    .line 343
    :goto_18
    if-eqz v25, :cond_34

    .line 344
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v1, v2}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    goto :goto_19

    .line 346
    :cond_34
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v1, v2}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 348
    :goto_19
    const/4 v1, 0x1

    iput-boolean v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->resolved:Z

    .line 349
    add-int/lit8 v1, v8, -0x1

    if-ge v6, v1, :cond_36

    if-ge v6, v10, :cond_36

    .line 350
    if-eqz v25, :cond_35

    .line 351
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    neg-int v1, v1

    sub-int/2addr v2, v1

    goto :goto_1a

    .line 353
    :cond_35
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    neg-int v1, v1

    add-int/2addr v2, v1

    .line 300
    .end local v11    # "index":I
    .end local v13    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    .end local v14    # "dimension":I
    :cond_36
    :goto_1a
    add-int/lit8 v6, v6, 0x1

    move/from16 v1, v16

    goto/16 :goto_14

    .end local v16    # "gap":I
    .restart local v1    # "gap":I
    :cond_37
    move/from16 v16, v1

    .line 357
    .end local v1    # "gap":I
    .end local v6    # "i":I
    move v1, v2

    goto/16 :goto_2b

    .end local v2    # "position":I
    .restart local v21    # "position":I
    :cond_38
    if-nez v1, :cond_46

    .line 358
    sub-int v1, v3, v4

    add-int/lit8 v2, v7, 0x1

    div-int/2addr v1, v2

    .line 359
    .restart local v1    # "gap":I
    if-lez v5, :cond_39

    .line 360
    const/4 v1, 0x0

    .line 362
    :cond_39
    const/4 v2, 0x0

    move v6, v2

    move/from16 v2, v21

    .end local v21    # "position":I
    .restart local v2    # "position":I
    .restart local v6    # "i":I
    :goto_1b
    if-ge v6, v8, :cond_45

    .line 363
    move v11, v6

    .line 364
    .restart local v11    # "index":I
    if-eqz v25, :cond_3a

    .line 365
    add-int/lit8 v13, v6, 0x1

    sub-int v11, v8, v13

    .line 367
    :cond_3a
    iget-object v13, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v13, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 368
    .restart local v13    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v14}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v14

    const/16 v15, 0x8

    if-ne v14, v15, :cond_3b

    .line 369
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v14, v2}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 370
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v14, v2}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 371
    move/from16 v16, v1

    goto :goto_21

    .line 373
    :cond_3b
    if-eqz v25, :cond_3c

    .line 374
    sub-int/2addr v2, v1

    goto :goto_1c

    .line 376
    :cond_3c
    add-int/2addr v2, v1

    .line 378
    :goto_1c
    if-lez v6, :cond_3e

    if-lt v6, v9, :cond_3e

    .line 379
    if-eqz v25, :cond_3d

    .line 380
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v14, v14, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    sub-int/2addr v2, v14

    goto :goto_1d

    .line 382
    :cond_3d
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v14, v14, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    add-int/2addr v2, v14

    .line 386
    :cond_3e
    :goto_1d
    if-eqz v25, :cond_3f

    .line 387
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v14, v2}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    goto :goto_1e

    .line 389
    :cond_3f
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v14, v2}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 392
    :goto_1e
    iget-object v14, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget v14, v14, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->value:I

    .line 393
    .restart local v14    # "dimension":I
    iget-object v15, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimensionBehavior:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move/from16 v16, v1

    .end local v1    # "gap":I
    .restart local v16    # "gap":I
    sget-object v1, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v15, v1, :cond_40

    iget v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->matchConstraintsType:I

    const/4 v15, 0x1

    if-ne v1, v15, :cond_40

    .line 395
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->wrapValue:I

    invoke-static {v14, v1}, Ljava/lang/Math;->min(II)I

    move-result v14

    .line 398
    :cond_40
    if-eqz v25, :cond_41

    .line 399
    sub-int/2addr v2, v14

    goto :goto_1f

    .line 401
    :cond_41
    add-int/2addr v2, v14

    .line 404
    :goto_1f
    if-eqz v25, :cond_42

    .line 405
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v1, v2}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    goto :goto_20

    .line 407
    :cond_42
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v1, v2}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 409
    :goto_20
    add-int/lit8 v1, v8, -0x1

    if-ge v6, v1, :cond_44

    if-ge v6, v10, :cond_44

    .line 410
    if-eqz v25, :cond_43

    .line 411
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    neg-int v1, v1

    sub-int/2addr v2, v1

    goto :goto_21

    .line 413
    :cond_43
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v1, v1, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    neg-int v1, v1

    add-int/2addr v2, v1

    .line 362
    .end local v11    # "index":I
    .end local v13    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    .end local v14    # "dimension":I
    :cond_44
    :goto_21
    add-int/lit8 v6, v6, 0x1

    move/from16 v1, v16

    goto/16 :goto_1b

    .end local v16    # "gap":I
    .restart local v1    # "gap":I
    :cond_45
    move/from16 v16, v1

    .line 417
    .end local v1    # "gap":I
    .end local v6    # "i":I
    move v1, v2

    goto/16 :goto_2b

    .end local v2    # "position":I
    .restart local v21    # "position":I
    :cond_46
    const/4 v2, 0x2

    if-ne v1, v2, :cond_58

    .line 418
    iget v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->orientation:I

    if-nez v1, :cond_47

    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getHorizontalBiasPercent()F

    move-result v1

    goto :goto_22

    :cond_47
    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 419
    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVerticalBiasPercent()F

    move-result v1

    :goto_22
    nop

    .line 420
    .local v1, "bias":F
    if-eqz v25, :cond_48

    .line 421
    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v1, v2, v1

    .line 423
    :cond_48
    sub-int v2, v3, v4

    int-to-float v2, v2

    mul-float v2, v2, v1

    const/high16 v6, 0x3f000000    # 0.5f

    add-float/2addr v2, v6

    float-to-int v2, v2

    .line 424
    .local v2, "gap":I
    if-ltz v2, :cond_49

    if-lez v5, :cond_4a

    .line 425
    :cond_49
    const/4 v2, 0x0

    .line 427
    :cond_4a
    if-eqz v25, :cond_4b

    .line 428
    sub-int v6, v21, v2

    .end local v21    # "position":I
    .local v6, "position":I
    goto :goto_23

    .line 430
    .end local v6    # "position":I
    .restart local v21    # "position":I
    :cond_4b
    add-int v6, v21, v2

    .line 432
    .end local v21    # "position":I
    .restart local v6    # "position":I
    :goto_23
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_24
    if-ge v11, v8, :cond_57

    .line 433
    move v13, v11

    .line 434
    .local v13, "index":I
    if-eqz v25, :cond_4c

    .line 435
    add-int/lit8 v14, v11, 0x1

    sub-int v13, v8, v14

    .line 437
    :cond_4c
    iget-object v14, v0, Landroidx/constraintlayout/core/widgets/analyzer/ChainRun;->widgets:Ljava/util/ArrayList;

    invoke-virtual {v14, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;

    .line 438
    .local v14, "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    iget-object v15, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {v15}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v15

    const/16 v0, 0x8

    if-ne v15, v0, :cond_4d

    .line 439
    iget-object v15, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v15, v6}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 440
    iget-object v15, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v15, v6}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 441
    move/from16 v16, v1

    const/4 v1, 0x1

    goto :goto_2a

    .line 443
    :cond_4d
    if-lez v11, :cond_4f

    if-lt v11, v9, :cond_4f

    .line 444
    if-eqz v25, :cond_4e

    .line 445
    iget-object v15, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v15, v15, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    sub-int/2addr v6, v15

    goto :goto_25

    .line 447
    :cond_4e
    iget-object v15, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v15, v15, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    add-int/2addr v6, v15

    .line 450
    :cond_4f
    :goto_25
    if-eqz v25, :cond_50

    .line 451
    iget-object v15, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v15, v6}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    goto :goto_26

    .line 453
    :cond_50
    iget-object v15, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v15, v6}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 456
    :goto_26
    iget-object v15, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget v15, v15, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->value:I

    .line 457
    .local v15, "dimension":I
    iget-object v0, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimensionBehavior:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move/from16 v16, v1

    .end local v1    # "bias":F
    .local v16, "bias":F
    sget-object v1, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v0, v1, :cond_51

    iget v0, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->matchConstraintsType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_52

    .line 459
    iget-object v0, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;

    iget v15, v0, Landroidx/constraintlayout/core/widgets/analyzer/DimensionDependency;->wrapValue:I

    goto :goto_27

    .line 457
    :cond_51
    const/4 v1, 0x1

    .line 461
    :cond_52
    :goto_27
    if-eqz v25, :cond_53

    .line 462
    sub-int/2addr v6, v15

    goto :goto_28

    .line 464
    :cond_53
    add-int/2addr v6, v15

    .line 467
    :goto_28
    if-eqz v25, :cond_54

    .line 468
    iget-object v0, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v0, v6}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    goto :goto_29

    .line 470
    :cond_54
    iget-object v0, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    invoke-virtual {v0, v6}, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 472
    :goto_29
    add-int/lit8 v0, v8, -0x1

    if-ge v11, v0, :cond_56

    if-ge v11, v10, :cond_56

    .line 473
    if-eqz v25, :cond_55

    .line 474
    iget-object v0, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v0, v0, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    neg-int v0, v0

    sub-int/2addr v6, v0

    goto :goto_2a

    .line 476
    :cond_55
    iget-object v0, v14, Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;

    iget v0, v0, Landroidx/constraintlayout/core/widgets/analyzer/DependencyNode;->margin:I

    neg-int v0, v0

    add-int/2addr v6, v0

    .line 432
    .end local v13    # "index":I
    .end local v14    # "run":Landroidx/constraintlayout/core/widgets/analyzer/WidgetRun;
    .end local v15    # "dimension":I
    :cond_56
    :goto_2a
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v16

    goto/16 :goto_24

    .end local v16    # "bias":F
    .restart local v1    # "bias":F
    :cond_57
    move/from16 v16, v1

    .end local v1    # "bias":F
    .restart local v16    # "bias":F
    move v1, v6

    goto :goto_2b

    .line 417
    .end local v2    # "gap":I
    .end local v6    # "position":I
    .end local v11    # "i":I
    .end local v16    # "bias":F
    .restart local v21    # "position":I
    :cond_58
    move/from16 v1, v21

    .line 481
    .end local v21    # "position":I
    .local v1, "position":I
    :goto_2b
    return-void

    .line 124
    .end local v1    # "position":I
    .end local v3    # "distance":I
    .end local v4    # "size":I
    .end local v5    # "numMatchConstraints":I
    .end local v7    # "numVisibleWidgets":I
    .end local v8    # "count":I
    .end local v9    # "firstVisibleWidget":I
    .end local v10    # "lastVisibleWidget":I
    .end local v12    # "matchConstraintsDimension":I
    .end local v19    # "parent":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v23    # "weights":F
    .end local v25    # "isInRtl":Z
    :cond_59
    :goto_2c
    return-void
.end method
