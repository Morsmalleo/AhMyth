.class public Landroidx/constraintlayout/core/widgets/Chain;
.super Ljava/lang/Object;
.source "Chain.java"


# static fields
.field private static final DEBUG:Z = false

.field public static final USE_CHAIN_OPTIMIZATION:Z = false


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static applyChainConstraints(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;Landroidx/constraintlayout/core/LinearSystem;IILandroidx/constraintlayout/core/widgets/ChainHead;)V
    .locals 44
    .param p0, "container"    # Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;
    .param p1, "system"    # Landroidx/constraintlayout/core/LinearSystem;
    .param p2, "orientation"    # I
    .param p3, "offset"    # I
    .param p4, "chainHead"    # Landroidx/constraintlayout/core/widgets/ChainHead;

    .line 83
    move-object/from16 v0, p0

    move-object/from16 v10, p1

    move/from16 v11, p2

    move-object/from16 v12, p4

    iget-object v13, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mFirst:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 84
    .local v13, "first":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v14, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mLast:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 85
    .local v14, "last":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v15, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mFirstVisibleWidget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 86
    .local v15, "firstVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v9, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mLastVisibleWidget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 87
    .local v9, "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v8, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mHead:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 89
    .local v8, "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move-object v1, v13

    .line 90
    .local v1, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    const/4 v2, 0x0

    .line 91
    .local v2, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    const/4 v3, 0x0

    .line 93
    .local v3, "done":Z
    iget v4, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mTotalWeight:F

    .line 94
    .local v4, "totalWeights":F
    iget-object v7, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mFirstMatchConstraintWidget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 95
    .local v7, "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v6, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mLastMatchConstraintWidget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 97
    .local v6, "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v5, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mListDimensionBehaviors:[Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v5, v5, v11

    move-object/from16 v16, v1

    .end local v1    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v16, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    sget-object v1, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    move-object/from16 v17, v2

    .end local v2    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v17, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    if-ne v5, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    move/from16 v19, v1

    .line 98
    .local v19, "isWrapContent":Z
    const/4 v1, 0x0

    .line 99
    .local v1, "isChainSpread":Z
    const/4 v5, 0x0

    .line 100
    .local v5, "isChainSpreadInside":Z
    const/16 v20, 0x0

    .line 102
    .local v20, "isChainPacked":Z
    if-nez v11, :cond_4

    .line 103
    iget v2, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    if-nez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    move v1, v2

    .line 104
    iget v2, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    move/from16 v23, v1

    const/4 v1, 0x1

    .end local v1    # "isChainSpread":Z
    .local v23, "isChainSpread":Z
    if-ne v2, v1, :cond_2

    const/4 v1, 0x1

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    .line 105
    .end local v5    # "isChainSpreadInside":Z
    .local v1, "isChainSpreadInside":Z
    :goto_2
    iget v2, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    const/4 v5, 0x2

    if-ne v2, v5, :cond_3

    const/4 v2, 0x1

    goto :goto_3

    :cond_3
    const/4 v2, 0x0

    :goto_3
    move/from16 v22, v3

    move-object/from16 v5, v16

    move-object/from16 v20, v17

    move/from16 v16, v1

    move/from16 v17, v2

    .end local v20    # "isChainPacked":Z
    .local v2, "isChainPacked":Z
    goto :goto_7

    .line 107
    .end local v2    # "isChainPacked":Z
    .end local v23    # "isChainSpread":Z
    .local v1, "isChainSpread":Z
    .restart local v5    # "isChainSpreadInside":Z
    .restart local v20    # "isChainPacked":Z
    :cond_4
    iget v2, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mVerticalChainStyle:I

    if-nez v2, :cond_5

    const/4 v2, 0x1

    goto :goto_4

    :cond_5
    const/4 v2, 0x0

    :goto_4
    move v1, v2

    .line 108
    iget v2, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mVerticalChainStyle:I

    move/from16 v23, v1

    const/4 v1, 0x1

    .end local v1    # "isChainSpread":Z
    .restart local v23    # "isChainSpread":Z
    if-ne v2, v1, :cond_6

    const/4 v1, 0x1

    goto :goto_5

    :cond_6
    const/4 v1, 0x0

    .line 109
    .end local v5    # "isChainSpreadInside":Z
    .local v1, "isChainSpreadInside":Z
    :goto_5
    iget v2, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mVerticalChainStyle:I

    const/4 v5, 0x2

    if-ne v2, v5, :cond_7

    const/4 v2, 0x1

    goto :goto_6

    :cond_7
    const/4 v2, 0x0

    :goto_6
    move/from16 v22, v3

    move-object/from16 v5, v16

    move-object/from16 v20, v17

    move/from16 v16, v1

    move/from16 v17, v2

    .line 125
    .end local v1    # "isChainSpreadInside":Z
    .end local v3    # "done":Z
    .local v5, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v16, "isChainSpreadInside":Z
    .local v17, "isChainPacked":Z
    .local v20, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v22, "done":Z
    :goto_7
    if-nez v22, :cond_16

    .line 126
    iget-object v1, v5, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v1, v1, p3

    .line 128
    .local v1, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    const/16 v25, 0x4

    .line 129
    .local v25, "strength":I
    if-eqz v17, :cond_8

    .line 130
    const/16 v25, 0x1

    .line 132
    :cond_8
    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v26

    .line 133
    .local v26, "margin":I
    iget-object v3, v5, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v3, v3, v11

    sget-object v2, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v2, :cond_9

    iget-object v2, v5, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    aget v2, v2, v11

    if-nez v2, :cond_9

    const/4 v2, 0x1

    goto :goto_8

    :cond_9
    const/4 v2, 0x0

    .line 136
    .local v2, "isSpreadOnly":Z
    :goto_8
    iget-object v3, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v3, :cond_a

    if-eq v5, v13, :cond_a

    .line 137
    iget-object v3, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    add-int v26, v26, v3

    move/from16 v3, v26

    goto :goto_9

    .line 140
    :cond_a
    move/from16 v3, v26

    .end local v26    # "margin":I
    .local v3, "margin":I
    :goto_9
    if-eqz v17, :cond_b

    if-eq v5, v13, :cond_b

    if-eq v5, v15, :cond_b

    .line 141
    const/16 v25, 0x8

    .line 144
    :cond_b
    move/from16 v26, v4

    .end local v4    # "totalWeights":F
    .local v26, "totalWeights":F
    iget-object v4, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v4, :cond_f

    .line 145
    if-ne v5, v15, :cond_c

    .line 146
    iget-object v4, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    move-object/from16 v29, v6

    .end local v6    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v29, "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v6, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    move-object/from16 v30, v7

    const/4 v7, 0x6

    .end local v7    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v30, "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    invoke-virtual {v10, v4, v6, v3, v7}, Landroidx/constraintlayout/core/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)V

    goto :goto_a

    .line 149
    .end local v29    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v30    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v6    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v7    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_c
    move-object/from16 v29, v6

    move-object/from16 v30, v7

    .end local v6    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v7    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v29    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v30    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v4, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v6, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    const/16 v7, 0x8

    invoke-virtual {v10, v4, v6, v3, v7}, Landroidx/constraintlayout/core/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)V

    .line 152
    :goto_a
    if-eqz v2, :cond_d

    if-nez v17, :cond_d

    .line 153
    const/16 v25, 0x5

    .line 155
    :cond_d
    if-ne v5, v15, :cond_e

    if-eqz v17, :cond_e

    invoke-virtual {v5, v11}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->isInBarrier(I)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 156
    const/4 v4, 0x5

    .end local v25    # "strength":I
    .local v4, "strength":I
    goto :goto_b

    .line 158
    .end local v4    # "strength":I
    .restart local v25    # "strength":I
    :cond_e
    move/from16 v4, v25

    .end local v25    # "strength":I
    .restart local v4    # "strength":I
    :goto_b
    iget-object v6, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v7, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    invoke-virtual {v10, v6, v7, v3, v4}, Landroidx/constraintlayout/core/LinearSystem;->addEquality(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)Landroidx/constraintlayout/core/ArrayRow;

    move/from16 v25, v4

    goto :goto_c

    .line 144
    .end local v4    # "strength":I
    .end local v29    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v30    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v6    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v7    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v25    # "strength":I
    :cond_f
    move-object/from16 v29, v6

    move-object/from16 v30, v7

    .line 162
    .end local v6    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v7    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v29    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v30    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_c
    if-eqz v19, :cond_11

    .line 163
    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v4

    const/16 v6, 0x8

    if-eq v4, v6, :cond_10

    iget-object v4, v5, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v4, v4, v11

    sget-object v6, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v4, v6, :cond_10

    .line 165
    iget-object v4, v5, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v6, p3, 0x1

    aget-object v4, v4, v6

    iget-object v4, v4, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v6, v5, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v6, v6, p3

    iget-object v6, v6, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    move-object/from16 v24, v1

    const/4 v1, 0x0

    const/4 v7, 0x5

    .end local v1    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v24, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    invoke-virtual {v10, v4, v6, v1, v7}, Landroidx/constraintlayout/core/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)V

    goto :goto_d

    .line 163
    .end local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v1    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :cond_10
    move-object/from16 v24, v1

    .line 169
    .end local v1    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :goto_d
    iget-object v1, v5, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v1, v1, p3

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v4, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    iget-object v4, v4, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    const/16 v6, 0x8

    const/4 v7, 0x0

    invoke-virtual {v10, v1, v4, v7, v6}, Landroidx/constraintlayout/core/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)V

    goto :goto_e

    .line 162
    .end local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v1    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :cond_11
    move-object/from16 v24, v1

    .line 175
    .end local v1    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :goto_e
    iget-object v1, v5, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v1, v1, v4

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 176
    .local v1, "nextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    if-eqz v1, :cond_14

    .line 177
    iget-object v4, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 178
    .end local v20    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v4, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v6, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v6, v6, p3

    iget-object v6, v6, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v6, :cond_13

    iget-object v6, v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v6, v6, p3

    iget-object v6, v6, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    if-eq v6, v5, :cond_12

    goto :goto_f

    :cond_12
    move-object/from16 v20, v4

    goto :goto_10

    .line 179
    :cond_13
    :goto_f
    const/4 v4, 0x0

    move-object/from16 v20, v4

    goto :goto_10

    .line 182
    .end local v4    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v20    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_14
    const/4 v4, 0x0

    move-object/from16 v20, v4

    .line 184
    :goto_10
    if-eqz v20, :cond_15

    .line 185
    move-object/from16 v4, v20

    move-object v5, v4

    .end local v5    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v4, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    goto :goto_11

    .line 187
    .end local v4    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v5    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_15
    const/4 v4, 0x1

    move/from16 v22, v4

    .line 189
    .end local v1    # "nextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v2    # "isSpreadOnly":Z
    .end local v3    # "margin":I
    .end local v24    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v25    # "strength":I
    :goto_11
    move/from16 v4, v26

    move-object/from16 v6, v29

    move-object/from16 v7, v30

    goto/16 :goto_7

    .line 192
    .end local v26    # "totalWeights":F
    .end local v29    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v30    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v4, "totalWeights":F
    .restart local v6    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v7    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_16
    move/from16 v26, v4

    move-object/from16 v29, v6

    move-object/from16 v30, v7

    .end local v4    # "totalWeights":F
    .end local v6    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v7    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v26    # "totalWeights":F
    .restart local v29    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v30    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    if-eqz v9, :cond_1a

    iget-object v2, v14, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v3, p3, 0x1

    aget-object v2, v2, v3

    iget-object v2, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v2, :cond_1a

    .line 193
    iget-object v2, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v3, p3, 0x1

    aget-object v2, v2, v3

    .line 194
    .local v2, "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v3, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v3, v3, v11

    sget-object v4, Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/core/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v4, :cond_17

    iget-object v3, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    aget v3, v3, v11

    if-nez v3, :cond_17

    const/4 v3, 0x1

    goto :goto_12

    :cond_17
    const/4 v3, 0x0

    .line 196
    .local v3, "isSpreadOnly":Z
    :goto_12
    if-eqz v3, :cond_18

    if-nez v17, :cond_18

    iget-object v4, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    if-ne v4, v0, :cond_18

    .line 197
    iget-object v4, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v6, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v7

    neg-int v7, v7

    const/4 v1, 0x5

    invoke-virtual {v10, v4, v6, v7, v1}, Landroidx/constraintlayout/core/LinearSystem;->addEquality(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)Landroidx/constraintlayout/core/ArrayRow;

    goto :goto_13

    .line 199
    :cond_18
    if-eqz v17, :cond_19

    iget-object v1, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    if-ne v1, v0, :cond_19

    .line 200
    iget-object v1, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v4, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v6

    neg-int v6, v6

    const/4 v7, 0x4

    invoke-virtual {v10, v1, v4, v6, v7}, Landroidx/constraintlayout/core/LinearSystem;->addEquality(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)Landroidx/constraintlayout/core/ArrayRow;

    .line 203
    :cond_19
    :goto_13
    iget-object v1, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v4, v14, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v6, p3, 0x1

    aget-object v4, v4, v6

    iget-object v4, v4, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    .line 204
    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v6

    neg-int v6, v6

    .line 203
    const/4 v7, 0x6

    invoke-virtual {v10, v1, v4, v6, v7}, Landroidx/constraintlayout/core/LinearSystem;->addLowerThan(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)V

    .line 209
    .end local v2    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v3    # "isSpreadOnly":Z
    :cond_1a
    if-eqz v19, :cond_1b

    .line 210
    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v2, p3, 0x1

    aget-object v1, v1, v2

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v2, v14, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v3, p3, 0x1

    aget-object v2, v2, v3

    iget-object v2, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v3, v14, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v3, v3, v4

    .line 212
    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    .line 210
    const/16 v4, 0x8

    invoke-virtual {v10, v1, v2, v3, v4}, Landroidx/constraintlayout/core/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)V

    .line 216
    :cond_1b
    iget-object v7, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mWeightedMatchConstraintsWidgets:Ljava/util/ArrayList;

    .line 217
    .local v7, "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    if-eqz v7, :cond_23

    .line 218
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 219
    .local v1, "count":I
    const/4 v2, 0x1

    if-le v1, v2, :cond_22

    .line 220
    const/4 v3, 0x0

    .line 221
    .local v3, "lastMatch":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    const/4 v4, 0x0

    .line 223
    .local v4, "lastWeight":F
    iget-boolean v6, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mHasUndefinedWeights:Z

    if-eqz v6, :cond_1c

    iget-boolean v6, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mHasComplexMatchWeights:Z

    if-nez v6, :cond_1c

    .line 224
    iget v6, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mWidgetsMatchCount:I

    int-to-float v6, v6

    .end local v26    # "totalWeights":F
    .local v6, "totalWeights":F
    goto :goto_14

    .line 227
    .end local v6    # "totalWeights":F
    .restart local v26    # "totalWeights":F
    :cond_1c
    move/from16 v6, v26

    .end local v26    # "totalWeights":F
    .restart local v6    # "totalWeights":F
    :goto_14
    const/16 v21, 0x0

    move/from16 v2, v21

    .local v2, "i":I
    :goto_15
    if-ge v2, v1, :cond_21

    .line 228
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v24

    move-object/from16 v0, v24

    check-cast v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 229
    .local v0, "match":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move/from16 v24, v1

    .end local v1    # "count":I
    .local v24, "count":I
    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mWeight:[F

    aget v1, v1, v11

    .line 231
    .local v1, "currentWeight":F
    const/16 v26, 0x0

    cmpg-float v28, v1, v26

    if-gez v28, :cond_1e

    .line 232
    move/from16 v28, v1

    .end local v1    # "currentWeight":F
    .local v28, "currentWeight":F
    iget-boolean v1, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mHasComplexMatchWeights:Z

    if-eqz v1, :cond_1d

    .line 233
    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v26, p3, 0x1

    aget-object v1, v1, v26

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    move-object/from16 v39, v5

    .end local v5    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v39, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v5, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v5, v5, p3

    iget-object v5, v5, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    move-object/from16 v40, v7

    const/4 v7, 0x4

    const/4 v12, 0x0

    .end local v7    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .local v40, "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    invoke-virtual {v10, v1, v5, v12, v7}, Landroidx/constraintlayout/core/LinearSystem;->addEquality(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)Landroidx/constraintlayout/core/ArrayRow;

    .line 235
    move-object/from16 v18, v8

    const/4 v8, 0x0

    goto/16 :goto_18

    .line 237
    .end local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .restart local v5    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v7    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    :cond_1d
    move-object/from16 v39, v5

    move-object/from16 v40, v7

    const/4 v7, 0x4

    .end local v5    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v7    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .restart local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    const/high16 v1, 0x3f800000    # 1.0f

    .end local v28    # "currentWeight":F
    .restart local v1    # "currentWeight":F
    goto :goto_16

    .line 231
    .end local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .restart local v5    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v7    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    :cond_1e
    move/from16 v28, v1

    move-object/from16 v39, v5

    move-object/from16 v40, v7

    const/4 v7, 0x4

    .line 239
    .end local v5    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v7    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .restart local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    :goto_16
    cmpl-float v5, v1, v26

    if-nez v5, :cond_1f

    .line 240
    iget-object v5, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v12, p3, 0x1

    aget-object v5, v5, v12

    iget-object v5, v5, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v12, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v12, v12, p3

    iget-object v12, v12, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    move-object/from16 v18, v8

    const/16 v7, 0x8

    const/4 v8, 0x0

    .end local v8    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v18, "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    invoke-virtual {v10, v5, v12, v8, v7}, Landroidx/constraintlayout/core/LinearSystem;->addEquality(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)Landroidx/constraintlayout/core/ArrayRow;

    .line 242
    goto :goto_18

    .line 245
    .end local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v8    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_1f
    move-object/from16 v18, v8

    const/4 v8, 0x0

    .end local v8    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    if-eqz v3, :cond_20

    .line 246
    iget-object v5, v3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v5, v5, p3

    iget-object v5, v5, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    .line 247
    .local v5, "begin":Landroidx/constraintlayout/core/SolverVariable;
    iget-object v7, v3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v12, p3, 0x1

    aget-object v7, v7, v12

    iget-object v7, v7, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    .line 248
    .local v7, "end":Landroidx/constraintlayout/core/SolverVariable;
    iget-object v12, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v12, v12, p3

    iget-object v12, v12, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    .line 249
    .local v12, "nextBegin":Landroidx/constraintlayout/core/SolverVariable;
    iget-object v8, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v26, p3, 0x1

    aget-object v8, v8, v26

    iget-object v8, v8, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    .line 250
    .local v8, "nextEnd":Landroidx/constraintlayout/core/SolverVariable;
    move-object/from16 v26, v3

    .end local v3    # "lastMatch":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v26, "lastMatch":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/core/LinearSystem;->createRow()Landroidx/constraintlayout/core/ArrayRow;

    move-result-object v3

    .line 251
    .local v3, "row":Landroidx/constraintlayout/core/ArrayRow;
    move-object/from16 v31, v3

    move/from16 v32, v4

    move/from16 v33, v6

    move/from16 v34, v1

    move-object/from16 v35, v5

    move-object/from16 v36, v7

    move-object/from16 v37, v12

    move-object/from16 v38, v8

    invoke-virtual/range {v31 .. v38}, Landroidx/constraintlayout/core/ArrayRow;->createRowEqualMatchDimensions(FFFLandroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;)Landroidx/constraintlayout/core/ArrayRow;

    .line 253
    invoke-virtual {v10, v3}, Landroidx/constraintlayout/core/LinearSystem;->addConstraint(Landroidx/constraintlayout/core/ArrayRow;)V

    goto :goto_17

    .line 245
    .end local v5    # "begin":Landroidx/constraintlayout/core/SolverVariable;
    .end local v7    # "end":Landroidx/constraintlayout/core/SolverVariable;
    .end local v8    # "nextEnd":Landroidx/constraintlayout/core/SolverVariable;
    .end local v12    # "nextBegin":Landroidx/constraintlayout/core/SolverVariable;
    .end local v26    # "lastMatch":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v3, "lastMatch":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_20
    move-object/from16 v26, v3

    .line 256
    .end local v3    # "lastMatch":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v26    # "lastMatch":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_17
    move-object v3, v0

    .line 257
    .end local v26    # "lastMatch":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v3    # "lastMatch":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move v4, v1

    .line 227
    .end local v0    # "match":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v1    # "currentWeight":F
    :goto_18
    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    move-object/from16 v12, p4

    move-object/from16 v8, v18

    move/from16 v1, v24

    move-object/from16 v5, v39

    move-object/from16 v7, v40

    goto/16 :goto_15

    .end local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v24    # "count":I
    .end local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .local v1, "count":I
    .local v5, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v7, "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .local v8, "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_21
    move/from16 v24, v1

    move-object/from16 v26, v3

    move-object/from16 v39, v5

    move-object/from16 v40, v7

    move-object/from16 v18, v8

    .end local v1    # "count":I
    .end local v3    # "lastMatch":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v5    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v7    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .end local v8    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v24    # "count":I
    .restart local v26    # "lastMatch":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    move/from16 v26, v6

    goto :goto_19

    .line 219
    .end local v2    # "i":I
    .end local v4    # "lastWeight":F
    .end local v6    # "totalWeights":F
    .end local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v24    # "count":I
    .end local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .restart local v1    # "count":I
    .restart local v5    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v7    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .restart local v8    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v26, "totalWeights":F
    :cond_22
    move/from16 v24, v1

    move-object/from16 v39, v5

    move-object/from16 v40, v7

    move-object/from16 v18, v8

    .end local v1    # "count":I
    .end local v5    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v7    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .end local v8    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v24    # "count":I
    .restart local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    goto :goto_19

    .line 217
    .end local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v24    # "count":I
    .end local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .restart local v5    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v7    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .restart local v8    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_23
    move-object/from16 v39, v5

    move-object/from16 v40, v7

    move-object/from16 v18, v8

    .line 274
    .end local v5    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v7    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .end local v8    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    :goto_19
    if-eqz v15, :cond_2b

    if-eq v15, v9, :cond_25

    if-eqz v17, :cond_24

    goto :goto_1a

    :cond_24
    move-object v0, v9

    move-object/from16 v32, v29

    move-object/from16 v31, v39

    move-object/from16 v33, v40

    move-object/from16 v29, v18

    goto/16 :goto_20

    .line 275
    :cond_25
    :goto_1a
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v1, v1, p3

    .line 276
    .local v1, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v2, v14, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v3, p3, 0x1

    aget-object v2, v2, v3

    .line 277
    .local v2, "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v3, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v3, :cond_26

    iget-object v3, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    goto :goto_1b

    :cond_26
    const/4 v3, 0x0

    :goto_1b
    move-object v12, v3

    .line 278
    .local v12, "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    iget-object v3, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v3, :cond_27

    iget-object v3, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    goto :goto_1c

    :cond_27
    const/4 v3, 0x0

    :goto_1c
    move-object/from16 v21, v3

    .line 279
    .local v21, "endTarget":Landroidx/constraintlayout/core/SolverVariable;
    iget-object v3, v15, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v8, v3, p3

    .line 280
    .end local v1    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v8, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    if-eqz v9, :cond_28

    .line 281
    iget-object v1, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v3, p3, 0x1

    aget-object v2, v1, v3

    move-object v7, v2

    goto :goto_1d

    .line 280
    :cond_28
    move-object v7, v2

    .line 283
    .end local v2    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v7, "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :goto_1d
    if-eqz v12, :cond_2a

    if-eqz v21, :cond_2a

    .line 284
    const/high16 v1, 0x3f000000    # 0.5f

    .line 285
    .local v1, "bias":F
    if-nez v11, :cond_29

    .line 286
    move-object/from16 v6, v18

    .end local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v6, "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget v1, v6, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mHorizontalBiasPercent:F

    move/from16 v18, v1

    goto :goto_1e

    .line 288
    .end local v6    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_29
    move-object/from16 v6, v18

    .end local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v6    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget v1, v6, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mVerticalBiasPercent:F

    move/from16 v18, v1

    .line 290
    .end local v1    # "bias":F
    .local v18, "bias":F
    :goto_1e
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v24

    .line 291
    .local v24, "beginMargin":I
    invoke-virtual {v7}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v25

    .line 292
    .local v25, "endMargin":I
    iget-object v2, v8, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v5, v7, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    const/16 v27, 0x7

    move-object/from16 v1, p1

    move-object v3, v12

    move/from16 v4, v24

    move-object/from16 v28, v5

    move-object/from16 v31, v39

    .end local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v31, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move/from16 v5, v18

    move-object/from16 v32, v29

    move-object/from16 v29, v6

    .end local v6    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v29, "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v32, "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move-object/from16 v6, v21

    move-object/from16 v34, v7

    move-object/from16 v33, v40

    .end local v7    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .local v33, "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .local v34, "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    move-object/from16 v7, v28

    move-object/from16 v28, v8

    .end local v8    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v28, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    move/from16 v8, v25

    move-object v0, v9

    .end local v9    # "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v0, "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move/from16 v9, v27

    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/core/LinearSystem;->addCentering(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;IFLandroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)V

    goto :goto_1f

    .line 283
    .end local v0    # "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v24    # "beginMargin":I
    .end local v25    # "endMargin":I
    .end local v28    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v31    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v32    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v33    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .end local v34    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v7    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v8    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v9    # "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v18, "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v29, "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    :cond_2a
    move-object/from16 v34, v7

    move-object/from16 v28, v8

    move-object v0, v9

    move-object/from16 v32, v29

    move-object/from16 v31, v39

    move-object/from16 v33, v40

    move-object/from16 v29, v18

    .line 295
    .end local v7    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v8    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v9    # "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v12    # "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    .end local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v21    # "endTarget":Landroidx/constraintlayout/core/SolverVariable;
    .end local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .restart local v0    # "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v29, "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v31    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v32    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v33    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    :goto_1f
    move-object/from16 v12, p4

    goto/16 :goto_3d

    .line 274
    .end local v0    # "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v31    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v32    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v33    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .restart local v9    # "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v29, "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    :cond_2b
    move-object v0, v9

    move-object/from16 v32, v29

    move-object/from16 v31, v39

    move-object/from16 v33, v40

    move-object/from16 v29, v18

    .line 295
    .end local v9    # "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v18    # "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v39    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v40    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    .restart local v0    # "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v29, "head":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v31    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v32    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v33    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    :goto_20
    if-eqz v23, :cond_3e

    if-eqz v15, :cond_3e

    .line 297
    move-object v1, v15

    .line 298
    .end local v31    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v1, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move-object v2, v15

    .line 299
    .local v2, "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move-object/from16 v12, p4

    iget v3, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mWidgetsMatchCount:I

    if-lez v3, :cond_2c

    iget v3, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mWidgetsCount:I

    iget v4, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mWidgetsMatchCount:I

    if-ne v3, v4, :cond_2c

    const/16 v28, 0x1

    goto :goto_21

    :cond_2c
    const/16 v28, 0x0

    :goto_21
    move/from16 v18, v28

    move-object v8, v1

    move-object v9, v2

    .line 300
    .end local v1    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v2    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v8, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v9, "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v18, "applyFixedEquality":Z
    :goto_22
    if-eqz v8, :cond_3d

    .line 301
    iget-object v1, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    aget-object v1, v1, v11

    move-object v7, v1

    .line 302
    .end local v20    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v7, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_23
    if-eqz v7, :cond_2d

    invoke-virtual {v7}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v1

    const/16 v3, 0x8

    if-ne v1, v3, :cond_2e

    .line 303
    iget-object v1, v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    aget-object v7, v1, v11

    goto :goto_23

    .line 302
    :cond_2d
    const/16 v3, 0x8

    .line 305
    :cond_2e
    if-nez v7, :cond_30

    if-ne v8, v0, :cond_2f

    goto :goto_24

    :cond_2f
    move-object/from16 v39, v7

    move-object/from16 v40, v8

    move-object/from16 v41, v9

    goto/16 :goto_2d

    .line 306
    :cond_30
    :goto_24
    iget-object v1, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v6, v1, p3

    .line 307
    .local v6, "beginAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v5, v6, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    .line 308
    .local v5, "begin":Landroidx/constraintlayout/core/SolverVariable;
    iget-object v1, v6, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v1, :cond_31

    iget-object v1, v6, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    goto :goto_25

    :cond_31
    const/4 v1, 0x0

    .line 309
    .local v1, "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    :goto_25
    if-eq v9, v8, :cond_32

    .line 310
    iget-object v2, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v2, v2, v4

    iget-object v1, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    move-object/from16 v20, v1

    goto :goto_27

    .line 311
    :cond_32
    if-ne v8, v15, :cond_34

    .line 312
    iget-object v2, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v2, v2, p3

    iget-object v2, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v2, :cond_33

    iget-object v2, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v2, v2, p3

    iget-object v2, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    goto :goto_26

    :cond_33
    const/4 v2, 0x0

    :goto_26
    move-object v1, v2

    move-object/from16 v20, v1

    goto :goto_27

    .line 311
    :cond_34
    move-object/from16 v20, v1

    .line 315
    .end local v1    # "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    .local v20, "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    :goto_27
    const/4 v1, 0x0

    .line 316
    .local v1, "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    const/4 v2, 0x0

    .line 317
    .local v2, "beginNext":Landroidx/constraintlayout/core/SolverVariable;
    const/4 v4, 0x0

    .line 318
    .local v4, "beginNextTarget":Landroidx/constraintlayout/core/SolverVariable;
    invoke-virtual {v6}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v21

    .line 319
    .local v21, "beginMargin":I
    iget-object v3, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v24, p3, 0x1

    aget-object v3, v3, v24

    invoke-virtual {v3}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    .line 321
    .local v3, "nextMargin":I
    if-eqz v7, :cond_35

    .line 322
    move-object/from16 v24, v1

    .end local v1    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v24, "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v1, v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v1, v1, p3

    .line 323
    .end local v24    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v1    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v2, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    move-object/from16 v24, v1

    move-object/from16 v25, v2

    goto :goto_28

    .line 325
    :cond_35
    move-object/from16 v24, v1

    .end local v1    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v24    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v1, v14, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v25, p3, 0x1

    aget-object v1, v1, v25

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 326
    .end local v24    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v1    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    if-eqz v1, :cond_36

    .line 327
    iget-object v2, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    move-object/from16 v24, v1

    move-object/from16 v25, v2

    goto :goto_28

    .line 326
    :cond_36
    move-object/from16 v24, v1

    move-object/from16 v25, v2

    .line 330
    .end local v1    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v2    # "beginNext":Landroidx/constraintlayout/core/SolverVariable;
    .restart local v24    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v25, "beginNext":Landroidx/constraintlayout/core/SolverVariable;
    :goto_28
    iget-object v1, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v2, p3, 0x1

    aget-object v1, v1, v2

    iget-object v4, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    .line 332
    if-eqz v24, :cond_37

    .line 333
    invoke-virtual/range {v24 .. v24}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    add-int/2addr v3, v1

    move/from16 v28, v3

    goto :goto_29

    .line 332
    :cond_37
    move/from16 v28, v3

    .line 335
    .end local v3    # "nextMargin":I
    .local v28, "nextMargin":I
    :goto_29
    iget-object v1, v9, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v2, p3, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    add-int v21, v21, v1

    .line 336
    if-eqz v5, :cond_3b

    if-eqz v20, :cond_3b

    if-eqz v25, :cond_3b

    if-eqz v4, :cond_3b

    .line 337
    move/from16 v1, v21

    .line 338
    .local v1, "margin1":I
    if-ne v8, v15, :cond_38

    .line 339
    iget-object v2, v15, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v2, v2, p3

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    move/from16 v31, v1

    goto :goto_2a

    .line 338
    :cond_38
    move/from16 v31, v1

    .line 341
    .end local v1    # "margin1":I
    .local v31, "margin1":I
    :goto_2a
    move/from16 v1, v28

    .line 342
    .local v1, "margin2":I
    if-ne v8, v0, :cond_39

    .line 343
    iget-object v2, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v3, p3, 0x1

    aget-object v2, v2, v3

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    move/from16 v34, v1

    goto :goto_2b

    .line 342
    :cond_39
    move/from16 v34, v1

    .line 345
    .end local v1    # "margin2":I
    .local v34, "margin2":I
    :goto_2b
    const/4 v1, 0x5

    .line 346
    .local v1, "strength":I
    if-eqz v18, :cond_3a

    .line 347
    const/16 v1, 0x8

    move/from16 v36, v1

    goto :goto_2c

    .line 346
    :cond_3a
    move/from16 v36, v1

    .line 349
    .end local v1    # "strength":I
    .local v36, "strength":I
    :goto_2c
    const/high16 v37, 0x3f000000    # 0.5f

    move-object/from16 v1, p1

    move-object v2, v5

    move-object/from16 v3, v20

    move-object/from16 v27, v4

    .end local v4    # "beginNextTarget":Landroidx/constraintlayout/core/SolverVariable;
    .local v27, "beginNextTarget":Landroidx/constraintlayout/core/SolverVariable;
    move/from16 v4, v31

    move-object/from16 v38, v5

    .end local v5    # "begin":Landroidx/constraintlayout/core/SolverVariable;
    .local v38, "begin":Landroidx/constraintlayout/core/SolverVariable;
    move/from16 v5, v37

    move-object/from16 v37, v6

    .end local v6    # "beginAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v37, "beginAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    move-object/from16 v6, v25

    move-object/from16 v39, v7

    .end local v7    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v39, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move-object/from16 v7, v27

    move-object/from16 v40, v8

    .end local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v40, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move/from16 v8, v34

    move-object/from16 v41, v9

    .end local v9    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v41, "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move/from16 v9, v36

    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/core/LinearSystem;->addCentering(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;IFLandroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)V

    goto :goto_2d

    .line 336
    .end local v27    # "beginNextTarget":Landroidx/constraintlayout/core/SolverVariable;
    .end local v31    # "margin1":I
    .end local v34    # "margin2":I
    .end local v36    # "strength":I
    .end local v37    # "beginAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v38    # "begin":Landroidx/constraintlayout/core/SolverVariable;
    .end local v39    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v40    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v41    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v4    # "beginNextTarget":Landroidx/constraintlayout/core/SolverVariable;
    .restart local v5    # "begin":Landroidx/constraintlayout/core/SolverVariable;
    .restart local v6    # "beginAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v7    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v9    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_3b
    move-object/from16 v27, v4

    move-object/from16 v38, v5

    move-object/from16 v37, v6

    move-object/from16 v39, v7

    move-object/from16 v40, v8

    move-object/from16 v41, v9

    .line 354
    .end local v4    # "beginNextTarget":Landroidx/constraintlayout/core/SolverVariable;
    .end local v5    # "begin":Landroidx/constraintlayout/core/SolverVariable;
    .end local v6    # "beginAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v7    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v9    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v20    # "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    .end local v21    # "beginMargin":I
    .end local v24    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v25    # "beginNext":Landroidx/constraintlayout/core/SolverVariable;
    .end local v28    # "nextMargin":I
    .restart local v39    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v40    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v41    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_2d
    invoke-virtual/range {v40 .. v40}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v1

    const/16 v9, 0x8

    if-eq v1, v9, :cond_3c

    .line 355
    move-object/from16 v1, v40

    .end local v41    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v1, "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    goto :goto_2e

    .line 354
    .end local v1    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v41    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_3c
    move-object/from16 v1, v41

    .line 357
    .end local v41    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v1    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_2e
    move-object/from16 v8, v39

    move-object v9, v1

    move-object/from16 v20, v39

    .end local v40    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    goto/16 :goto_22

    .line 300
    .end local v1    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v39    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v9    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v20, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_3d
    move-object/from16 v40, v8

    move-object/from16 v41, v9

    .line 359
    .end local v8    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v9    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v18    # "applyFixedEquality":Z
    .restart local v40    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move-object/from16 v31, v40

    goto/16 :goto_3d

    .line 295
    .end local v40    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v31, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_3e
    move-object/from16 v12, p4

    const/16 v9, 0x8

    .line 359
    if-eqz v16, :cond_50

    if-eqz v15, :cond_50

    .line 361
    move-object v1, v15

    .line 362
    .end local v31    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v1, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move-object v2, v15

    .line 363
    .local v2, "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget v3, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mWidgetsMatchCount:I

    if-lez v3, :cond_3f

    iget v3, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mWidgetsCount:I

    iget v4, v12, Landroidx/constraintlayout/core/widgets/ChainHead;->mWidgetsMatchCount:I

    if-ne v3, v4, :cond_3f

    const/16 v28, 0x1

    goto :goto_2f

    :cond_3f
    const/16 v28, 0x0

    :goto_2f
    move/from16 v18, v28

    move-object v7, v1

    move-object v8, v2

    .line 364
    .end local v1    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v2    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v7, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v8, "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v18    # "applyFixedEquality":Z
    :goto_30
    if-eqz v7, :cond_4b

    .line 365
    iget-object v1, v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    aget-object v1, v1, v11

    .line 366
    .end local v20    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v1, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_31
    if-eqz v1, :cond_40

    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v2

    if-ne v2, v9, :cond_40

    .line 367
    iget-object v2, v1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    aget-object v1, v2, v11

    goto :goto_31

    .line 369
    :cond_40
    if-eq v7, v15, :cond_49

    if-eq v7, v0, :cond_49

    if-eqz v1, :cond_49

    .line 370
    if-ne v1, v0, :cond_41

    .line 371
    const/4 v1, 0x0

    move-object v6, v1

    goto :goto_32

    .line 370
    :cond_41
    move-object v6, v1

    .line 373
    .end local v1    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v6, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_32
    iget-object v1, v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v5, v1, p3

    .line 374
    .local v5, "beginAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v4, v5, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    .line 375
    .local v4, "begin":Landroidx/constraintlayout/core/SolverVariable;
    iget-object v1, v5, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v1, :cond_42

    iget-object v1, v5, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    goto :goto_33

    :cond_42
    const/4 v1, 0x0

    .line 376
    .local v1, "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    :goto_33
    iget-object v2, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v3, p3, 0x1

    aget-object v2, v2, v3

    iget-object v3, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    .line 377
    .end local v1    # "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    .local v3, "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    const/4 v1, 0x0

    .line 378
    .local v1, "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    const/4 v2, 0x0

    .line 379
    .local v2, "beginNext":Landroidx/constraintlayout/core/SolverVariable;
    const/16 v20, 0x0

    .line 380
    .local v20, "beginNextTarget":Landroidx/constraintlayout/core/SolverVariable;
    invoke-virtual {v5}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v21

    .line 381
    .restart local v21    # "beginMargin":I
    iget-object v9, v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v24, p3, 0x1

    aget-object v9, v9, v24

    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v9

    .line 383
    .local v9, "nextMargin":I
    if-eqz v6, :cond_44

    .line 384
    move-object/from16 v24, v1

    .end local v1    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v24    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v1, v6, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v1, v1, p3

    .line 385
    .end local v24    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v1    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v2, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    .line 386
    move-object/from16 v24, v2

    .end local v2    # "beginNext":Landroidx/constraintlayout/core/SolverVariable;
    .local v24, "beginNext":Landroidx/constraintlayout/core/SolverVariable;
    iget-object v2, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v2, :cond_43

    iget-object v2, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    goto :goto_34

    :cond_43
    const/4 v2, 0x0

    :goto_34
    move-object/from16 v20, v2

    move-object/from16 v25, v24

    move-object/from16 v24, v1

    .end local v20    # "beginNextTarget":Landroidx/constraintlayout/core/SolverVariable;
    .local v2, "beginNextTarget":Landroidx/constraintlayout/core/SolverVariable;
    goto :goto_35

    .line 388
    .end local v24    # "beginNext":Landroidx/constraintlayout/core/SolverVariable;
    .local v2, "beginNext":Landroidx/constraintlayout/core/SolverVariable;
    .restart local v20    # "beginNextTarget":Landroidx/constraintlayout/core/SolverVariable;
    :cond_44
    move-object/from16 v24, v1

    .end local v1    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v24, "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v1, v1, p3

    .line 389
    .end local v24    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v1    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    if-eqz v1, :cond_45

    .line 390
    iget-object v2, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    .line 392
    :cond_45
    move-object/from16 v24, v1

    .end local v1    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v24    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v1, v7, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v25, p3, 0x1

    aget-object v1, v1, v25

    iget-object v1, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    move-object/from16 v20, v1

    move-object/from16 v25, v2

    .line 395
    .end local v2    # "beginNext":Landroidx/constraintlayout/core/SolverVariable;
    .restart local v25    # "beginNext":Landroidx/constraintlayout/core/SolverVariable;
    :goto_35
    if-eqz v24, :cond_46

    .line 396
    invoke-virtual/range {v24 .. v24}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    add-int/2addr v9, v1

    move/from16 v27, v9

    goto :goto_36

    .line 395
    :cond_46
    move/from16 v27, v9

    .line 398
    .end local v9    # "nextMargin":I
    .local v27, "nextMargin":I
    :goto_36
    iget-object v1, v8, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v2, p3, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    add-int v21, v21, v1

    .line 399
    const/4 v1, 0x4

    .line 400
    .local v1, "strength":I
    if-eqz v18, :cond_47

    .line 401
    const/16 v1, 0x8

    move/from16 v28, v1

    goto :goto_37

    .line 400
    :cond_47
    move/from16 v28, v1

    .line 403
    .end local v1    # "strength":I
    .local v28, "strength":I
    :goto_37
    if-eqz v4, :cond_48

    if-eqz v3, :cond_48

    if-eqz v25, :cond_48

    if-eqz v20, :cond_48

    .line 404
    const/high16 v9, 0x3f000000    # 0.5f

    move-object/from16 v1, p1

    move-object v2, v4

    move-object/from16 v31, v3

    .end local v3    # "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    .local v31, "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    move-object/from16 v34, v4

    .end local v4    # "begin":Landroidx/constraintlayout/core/SolverVariable;
    .local v34, "begin":Landroidx/constraintlayout/core/SolverVariable;
    move/from16 v4, v21

    move-object/from16 v36, v5

    .end local v5    # "beginAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v36, "beginAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    move v5, v9

    move-object/from16 v37, v6

    .end local v6    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v37, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move-object/from16 v6, v25

    move-object/from16 v38, v7

    .end local v7    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v38, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move-object/from16 v7, v20

    move-object/from16 v39, v8

    .end local v8    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v39, "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move/from16 v8, v27

    const/16 v11, 0x8

    move/from16 v9, v28

    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/core/LinearSystem;->addCentering(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;IFLandroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)V

    goto :goto_38

    .line 403
    .end local v31    # "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    .end local v34    # "begin":Landroidx/constraintlayout/core/SolverVariable;
    .end local v36    # "beginAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v37    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v38    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v39    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v3    # "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    .restart local v4    # "begin":Landroidx/constraintlayout/core/SolverVariable;
    .restart local v5    # "beginAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v6    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v7    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v8    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_48
    move-object/from16 v31, v3

    move-object/from16 v34, v4

    move-object/from16 v36, v5

    move-object/from16 v37, v6

    move-object/from16 v38, v7

    move-object/from16 v39, v8

    const/16 v11, 0x8

    .line 409
    .end local v3    # "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    .end local v4    # "begin":Landroidx/constraintlayout/core/SolverVariable;
    .end local v5    # "beginAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v6    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v7    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v8    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v20    # "beginNextTarget":Landroidx/constraintlayout/core/SolverVariable;
    .end local v21    # "beginMargin":I
    .end local v24    # "beginNextAnchor":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v25    # "beginNext":Landroidx/constraintlayout/core/SolverVariable;
    .end local v27    # "nextMargin":I
    .end local v28    # "strength":I
    .restart local v37    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v38    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v39    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_38
    move-object/from16 v20, v37

    goto :goto_39

    .line 369
    .end local v37    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v38    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v39    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v1, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v7    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v8    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_49
    move-object/from16 v38, v7

    move-object/from16 v39, v8

    const/16 v11, 0x8

    .line 409
    .end local v7    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v8    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v38    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v39    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    move-object/from16 v20, v1

    .end local v1    # "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v20, "next":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_39
    invoke-virtual/range {v38 .. v38}, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->getVisibility()I

    move-result v1

    if-eq v1, v11, :cond_4a

    .line 410
    move-object/from16 v1, v38

    move-object v8, v1

    .end local v39    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v1, "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    goto :goto_3a

    .line 409
    .end local v1    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v39    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_4a
    move-object/from16 v8, v39

    .line 412
    .end local v39    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v8    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :goto_3a
    move-object/from16 v7, v20

    move/from16 v11, p2

    const/16 v9, 0x8

    .end local v38    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v7    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    goto/16 :goto_30

    .line 414
    :cond_4b
    move-object/from16 v38, v7

    move-object/from16 v39, v8

    .end local v7    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v8    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v38    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .restart local v39    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v1, v15, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v11, v1, p3

    .line 415
    .local v11, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v1, v13, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v1, v1, p3

    iget-object v9, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 416
    .local v9, "beginTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v2, p3, 0x1

    aget-object v8, v1, v2

    .line 417
    .local v8, "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v1, v14, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v2, p3, 0x1

    aget-object v1, v1, v2

    iget-object v7, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    .line 418
    .local v7, "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    const/4 v6, 0x5

    .line 419
    .local v6, "endPointsStrength":I
    if-eqz v9, :cond_4e

    .line 420
    if-eq v15, v0, :cond_4c

    .line 421
    iget-object v1, v11, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v2, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    invoke-virtual {v11}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    invoke-virtual {v10, v1, v2, v3, v6}, Landroidx/constraintlayout/core/LinearSystem;->addEquality(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)Landroidx/constraintlayout/core/ArrayRow;

    move/from16 v27, v6

    move-object/from16 v42, v7

    move-object/from16 v43, v8

    move-object/from16 v21, v9

    goto :goto_3b

    .line 422
    :cond_4c
    if-eqz v7, :cond_4d

    .line 423
    iget-object v2, v11, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v3, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    invoke-virtual {v11}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    iget-object v1, v8, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v5, v7, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    .line 424
    invoke-virtual {v8}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v24

    .line 423
    move-object/from16 v25, v1

    move-object/from16 v1, p1

    move-object/from16 v21, v5

    const/high16 v5, 0x3f000000    # 0.5f

    move/from16 v27, v6

    .end local v6    # "endPointsStrength":I
    .local v27, "endPointsStrength":I
    move-object/from16 v6, v25

    move-object/from16 v42, v7

    .end local v7    # "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v42, "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    move-object/from16 v7, v21

    move-object/from16 v43, v8

    .end local v8    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v43, "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    move/from16 v8, v24

    move-object/from16 v21, v9

    .end local v9    # "beginTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v21, "beginTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    move/from16 v9, v27

    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/core/LinearSystem;->addCentering(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;IFLandroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)V

    goto :goto_3b

    .line 422
    .end local v21    # "beginTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v27    # "endPointsStrength":I
    .end local v42    # "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v43    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v6    # "endPointsStrength":I
    .restart local v7    # "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v8    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v9    # "beginTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :cond_4d
    move/from16 v27, v6

    move-object/from16 v42, v7

    move-object/from16 v43, v8

    move-object/from16 v21, v9

    .end local v6    # "endPointsStrength":I
    .end local v7    # "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v8    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v9    # "beginTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v21    # "beginTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v27    # "endPointsStrength":I
    .restart local v42    # "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v43    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    goto :goto_3b

    .line 419
    .end local v21    # "beginTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v27    # "endPointsStrength":I
    .end local v42    # "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v43    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v6    # "endPointsStrength":I
    .restart local v7    # "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v8    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v9    # "beginTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :cond_4e
    move/from16 v27, v6

    move-object/from16 v42, v7

    move-object/from16 v43, v8

    move-object/from16 v21, v9

    .line 427
    .end local v6    # "endPointsStrength":I
    .end local v7    # "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v8    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v9    # "beginTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v21    # "beginTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v27    # "endPointsStrength":I
    .restart local v42    # "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v43    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :goto_3b
    move-object/from16 v1, v42

    .end local v42    # "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v1, "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    if-eqz v1, :cond_4f

    if-eq v15, v0, :cond_4f

    .line 428
    move-object/from16 v2, v43

    .end local v43    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v2, "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v3, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v4, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    invoke-virtual {v2}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v5

    neg-int v5, v5

    move/from16 v6, v27

    .end local v27    # "endPointsStrength":I
    .restart local v6    # "endPointsStrength":I
    invoke-virtual {v10, v3, v4, v5, v6}, Landroidx/constraintlayout/core/LinearSystem;->addEquality(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)Landroidx/constraintlayout/core/ArrayRow;

    goto :goto_3c

    .line 427
    .end local v2    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v6    # "endPointsStrength":I
    .restart local v27    # "endPointsStrength":I
    .restart local v43    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :cond_4f
    move/from16 v6, v27

    move-object/from16 v2, v43

    .line 434
    .end local v1    # "endTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v11    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v18    # "applyFixedEquality":Z
    .end local v21    # "beginTarget":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v27    # "endPointsStrength":I
    .end local v39    # "previousVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v43    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :goto_3c
    move-object/from16 v31, v38

    .end local v38    # "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v31, "widget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    :cond_50
    :goto_3d
    if-nez v23, :cond_51

    if-eqz v16, :cond_59

    :cond_51
    if-eqz v15, :cond_59

    if-eq v15, v0, :cond_59

    .line 435
    iget-object v1, v15, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v1, v1, p3

    .line 436
    .local v1, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    if-nez v0, :cond_52

    .line 437
    move-object v9, v15

    move-object v0, v9

    .line 439
    :cond_52
    iget-object v2, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v3, p3, 0x1

    aget-object v2, v2, v3

    .line 440
    .restart local v2    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v3, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v3, :cond_53

    iget-object v3, v1, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    goto :goto_3e

    :cond_53
    const/4 v3, 0x0

    :goto_3e
    move-object v11, v3

    .line 441
    .local v11, "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    iget-object v3, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v3, :cond_54

    iget-object v3, v2, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    goto :goto_3f

    :cond_54
    const/4 v3, 0x0

    .line 442
    .local v3, "endTarget":Landroidx/constraintlayout/core/SolverVariable;
    :goto_3f
    if-eq v14, v0, :cond_56

    .line 443
    iget-object v4, v14, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v5, p3, 0x1

    aget-object v4, v4, v5

    .line 444
    .local v4, "realEnd":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    iget-object v5, v4, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    if-eqz v5, :cond_55

    iget-object v5, v4, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    move-object/from16 v35, v5

    goto :goto_40

    :cond_55
    const/16 v35, 0x0

    :goto_40
    move-object/from16 v3, v35

    move-object/from16 v18, v3

    goto :goto_41

    .line 442
    .end local v4    # "realEnd":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :cond_56
    move-object/from16 v18, v3

    .line 446
    .end local v3    # "endTarget":Landroidx/constraintlayout/core/SolverVariable;
    .local v18, "endTarget":Landroidx/constraintlayout/core/SolverVariable;
    :goto_41
    if-ne v15, v0, :cond_57

    .line 447
    iget-object v3, v15, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    aget-object v1, v3, p3

    .line 448
    iget-object v3, v15, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v2, v3, v4

    move-object v9, v1

    move-object v8, v2

    goto :goto_42

    .line 446
    :cond_57
    move-object v9, v1

    move-object v8, v2

    .line 450
    .end local v1    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v2    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v8    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v9, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :goto_42
    if-eqz v11, :cond_58

    if-eqz v18, :cond_58

    .line 451
    const/high16 v21, 0x3f000000    # 0.5f

    .line 452
    .local v21, "bias":F
    invoke-virtual {v9}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v24

    .line 453
    .local v24, "beginMargin":I
    iget-object v1, v0, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/core/widgets/ConstraintAnchor;

    add-int/lit8 v2, p3, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->getMargin()I

    move-result v25

    .line 454
    .local v25, "endMargin":I
    iget-object v2, v9, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    iget-object v7, v8, Landroidx/constraintlayout/core/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/core/SolverVariable;

    const/16 v27, 0x5

    move-object/from16 v1, p1

    move-object v3, v11

    move/from16 v4, v24

    move/from16 v5, v21

    move-object/from16 v6, v18

    move-object/from16 v28, v8

    .end local v8    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v28, "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    move/from16 v8, v25

    move-object/from16 v34, v9

    .end local v9    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .local v34, "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    move/from16 v9, v27

    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/core/LinearSystem;->addCentering(Landroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;IFLandroidx/constraintlayout/core/SolverVariable;Landroidx/constraintlayout/core/SolverVariable;II)V

    goto :goto_43

    .line 450
    .end local v21    # "bias":F
    .end local v24    # "beginMargin":I
    .end local v25    # "endMargin":I
    .end local v28    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v34    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v8    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .restart local v9    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    :cond_58
    move-object/from16 v28, v8

    move-object/from16 v34, v9

    .line 458
    .end local v8    # "end":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v9    # "begin":Landroidx/constraintlayout/core/widgets/ConstraintAnchor;
    .end local v11    # "beginTarget":Landroidx/constraintlayout/core/SolverVariable;
    .end local v18    # "endTarget":Landroidx/constraintlayout/core/SolverVariable;
    :cond_59
    :goto_43
    move-object v9, v0

    .end local v0    # "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .local v9, "lastVisibleWidget":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    return-void
.end method

.method public static applyChainConstraints(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;Landroidx/constraintlayout/core/LinearSystem;Ljava/util/ArrayList;I)V
    .locals 6
    .param p0, "constraintWidgetContainer"    # Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;
    .param p1, "system"    # Landroidx/constraintlayout/core/LinearSystem;
    .param p3, "orientation"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;",
            "Landroidx/constraintlayout/core/LinearSystem;",
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/core/widgets/ConstraintWidget;",
            ">;I)V"
        }
    .end annotation

    .line 47
    .local p2, "widgets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    const/4 v0, 0x0

    .line 48
    .local v0, "offset":I
    const/4 v1, 0x0

    .line 49
    .local v1, "chainsSize":I
    const/4 v2, 0x0

    .line 50
    .local v2, "chainsArray":[Landroidx/constraintlayout/core/widgets/ChainHead;
    if-nez p3, :cond_0

    .line 51
    const/4 v0, 0x0

    .line 52
    iget v1, p0, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    .line 53
    iget-object v2, p0, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroidx/constraintlayout/core/widgets/ChainHead;

    goto :goto_0

    .line 55
    :cond_0
    const/4 v0, 0x2

    .line 56
    iget v1, p0, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    .line 57
    iget-object v2, p0, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroidx/constraintlayout/core/widgets/ChainHead;

    .line 60
    :goto_0
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v1, :cond_3

    .line 61
    aget-object v4, v2, v3

    .line 64
    .local v4, "first":Landroidx/constraintlayout/core/widgets/ChainHead;
    invoke-virtual {v4}, Landroidx/constraintlayout/core/widgets/ChainHead;->define()V

    .line 65
    if-eqz p2, :cond_1

    if-eqz p2, :cond_2

    iget-object v5, v4, Landroidx/constraintlayout/core/widgets/ChainHead;->mFirst:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 66
    :cond_1
    invoke-static {p0, p1, p3, v0, v4}, Landroidx/constraintlayout/core/widgets/Chain;->applyChainConstraints(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;Landroidx/constraintlayout/core/LinearSystem;IILandroidx/constraintlayout/core/widgets/ChainHead;)V

    .line 60
    .end local v4    # "first":Landroidx/constraintlayout/core/widgets/ChainHead;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 69
    .end local v3    # "i":I
    :cond_3
    return-void
.end method
