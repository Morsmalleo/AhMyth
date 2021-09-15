.class Landroidx/fragment/app/DefaultSpecialEffectsController;
.super Landroidx/fragment/app/SpecialEffectsController;
.source "DefaultSpecialEffectsController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;,
        Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;,
        Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;)V
    .locals 0
    .param p1, "container"    # Landroid/view/ViewGroup;

    .line 52
    invoke-direct {p0, p1}, Landroidx/fragment/app/SpecialEffectsController;-><init>(Landroid/view/ViewGroup;)V

    .line 53
    return-void
.end method

.method private startAnimations(Ljava/util/List;Ljava/util/List;ZLjava/util/Map;)V
    .locals 22
    .param p3, "startedAnyTransition"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            ">;Z",
            "Ljava/util/Map<",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 132
    .local p1, "animationInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;>;"
    .local p2, "awaitingContainerChanges":Ljava/util/List;, "Ljava/util/List<Landroidx/fragment/app/SpecialEffectsController$Operation;>;"
    .local p4, "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    move-object/from16 v7, p0

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/DefaultSpecialEffectsController;->getContainer()Landroid/view/ViewGroup;

    move-result-object v8

    .line 133
    .local v8, "container":Landroid/view/ViewGroup;
    invoke-virtual {v8}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v9

    .line 134
    .local v9, "context":Landroid/content/Context;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v10, v0

    .line 137
    .local v10, "animationsToRun":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;>;"
    const/4 v0, 0x0

    .line 138
    .local v0, "startedAnyAnimator":Z
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "FragmentManager"

    const/4 v3, 0x2

    if-eqz v1, :cond_7

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;

    .line 139
    .local v12, "animationInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;
    invoke-virtual {v12}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->isVisibilityUnchanged()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 141
    invoke-virtual {v12}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->completeSpecialEffect()V

    .line 142
    move-object/from16 v5, p4

    goto :goto_0

    .line 144
    :cond_0
    invoke-virtual {v12, v9}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->getAnimation(Landroid/content/Context;)Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    move-result-object v13

    .line 145
    .local v13, "anim":Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;
    if-nez v13, :cond_1

    .line 147
    invoke-virtual {v12}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->completeSpecialEffect()V

    .line 148
    move-object/from16 v5, p4

    goto :goto_0

    .line 150
    :cond_1
    iget-object v14, v13, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;->animator:Landroid/animation/Animator;

    .line 151
    .local v14, "animator":Landroid/animation/Animator;
    if-nez v14, :cond_2

    .line 153
    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    move-object/from16 v5, p4

    goto :goto_0

    .line 158
    :cond_2
    invoke-virtual {v12}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->getOperation()Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-result-object v15

    .line 159
    .local v15, "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    invoke-virtual {v15}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v6

    .line 160
    .local v6, "fragment":Landroidx/fragment/app/Fragment;
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v5, p4

    invoke-interface {v5, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v16

    .line 161
    .local v16, "startedTransition":Z
    if-eqz v16, :cond_4

    .line 162
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 163
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Ignoring Animator set on "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " as this Fragment was involved in a Transition."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    :cond_3
    invoke-virtual {v12}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->completeSpecialEffect()V

    .line 167
    goto :goto_0

    .line 171
    :cond_4
    const/16 v17, 0x1

    .line 172
    .end local v0    # "startedAnyAnimator":Z
    .local v17, "startedAnyAnimator":Z
    invoke-virtual {v15}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFinalState()Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    move-result-object v0

    sget-object v1, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->GONE:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    if-ne v0, v1, :cond_5

    const/4 v0, 0x1

    goto :goto_1

    :cond_5
    const/4 v0, 0x0

    :goto_1
    move/from16 v18, v0

    .line 173
    .local v18, "isHideOperation":Z
    if-eqz v18, :cond_6

    .line 177
    move-object/from16 v4, p2

    invoke-interface {v4, v15}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_2

    .line 173
    :cond_6
    move-object/from16 v4, p2

    .line 179
    :goto_2
    iget-object v3, v6, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 180
    .local v3, "viewToAnimate":Landroid/view/View;
    invoke-virtual {v8, v3}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 181
    new-instance v2, Landroidx/fragment/app/DefaultSpecialEffectsController$2;

    move-object v0, v2

    move-object/from16 v1, p0

    move-object/from16 v19, v11

    move-object v11, v2

    move-object v2, v8

    move-object/from16 v20, v3

    .end local v3    # "viewToAnimate":Landroid/view/View;
    .local v20, "viewToAnimate":Landroid/view/View;
    move/from16 v4, v18

    move-object v5, v15

    move-object/from16 v21, v6

    .end local v6    # "fragment":Landroidx/fragment/app/Fragment;
    .local v21, "fragment":Landroidx/fragment/app/Fragment;
    move-object v6, v12

    invoke-direct/range {v0 .. v6}, Landroidx/fragment/app/DefaultSpecialEffectsController$2;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroid/view/ViewGroup;Landroid/view/View;ZLandroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;)V

    invoke-virtual {v14, v11}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 193
    move-object/from16 v0, v20

    .end local v20    # "viewToAnimate":Landroid/view/View;
    .local v0, "viewToAnimate":Landroid/view/View;
    invoke-virtual {v14, v0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 194
    invoke-virtual {v14}, Landroid/animation/Animator;->start()V

    .line 196
    invoke-virtual {v12}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->getSignal()Landroidx/core/os/CancellationSignal;

    move-result-object v1

    .line 197
    .local v1, "signal":Landroidx/core/os/CancellationSignal;
    new-instance v2, Landroidx/fragment/app/DefaultSpecialEffectsController$3;

    invoke-direct {v2, v7, v14}, Landroidx/fragment/app/DefaultSpecialEffectsController$3;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroid/animation/Animator;)V

    invoke-virtual {v1, v2}, Landroidx/core/os/CancellationSignal;->setOnCancelListener(Landroidx/core/os/CancellationSignal$OnCancelListener;)V

    .line 203
    .end local v0    # "viewToAnimate":Landroid/view/View;
    .end local v1    # "signal":Landroidx/core/os/CancellationSignal;
    .end local v12    # "animationInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;
    .end local v13    # "anim":Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;
    .end local v14    # "animator":Landroid/animation/Animator;
    .end local v15    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .end local v16    # "startedTransition":Z
    .end local v18    # "isHideOperation":Z
    .end local v21    # "fragment":Landroidx/fragment/app/Fragment;
    move/from16 v0, v17

    move-object/from16 v11, v19

    goto/16 :goto_0

    .line 206
    .end local v17    # "startedAnyAnimator":Z
    .local v0, "startedAnyAnimator":Z
    :cond_7
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;

    .line 208
    .local v4, "animationInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;
    invoke-virtual {v4}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->getOperation()Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-result-object v5

    .line 209
    .local v5, "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    invoke-virtual {v5}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v6

    .line 210
    .restart local v6    # "fragment":Landroidx/fragment/app/Fragment;
    const-string v11, "Ignoring Animation set on "

    if-eqz p3, :cond_9

    .line 211
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->isLoggingEnabled(I)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 212
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v11, " as Animations cannot run alongside Transitions."

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    :cond_8
    invoke-virtual {v4}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->completeSpecialEffect()V

    .line 216
    goto :goto_3

    .line 219
    :cond_9
    if-eqz v0, :cond_b

    .line 220
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->isLoggingEnabled(I)Z

    move-result v12

    if-eqz v12, :cond_a

    .line 221
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v11, " as Animations cannot run alongside Animators."

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    :cond_a
    invoke-virtual {v4}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->completeSpecialEffect()V

    .line 225
    goto :goto_3

    .line 229
    :cond_b
    iget-object v11, v6, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 230
    .local v11, "viewToAnimate":Landroid/view/View;
    nop

    .line 231
    invoke-virtual {v4, v9}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->getAnimation(Landroid/content/Context;)Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    move-result-object v12

    invoke-static {v12}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    iget-object v12, v12, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;->animation:Landroid/view/animation/Animation;

    .line 230
    invoke-static {v12}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/view/animation/Animation;

    .line 232
    .local v12, "anim":Landroid/view/animation/Animation;
    invoke-virtual {v5}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFinalState()Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    move-result-object v13

    .line 233
    .local v13, "finalState":Landroidx/fragment/app/SpecialEffectsController$Operation$State;
    sget-object v14, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->REMOVED:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    if-eq v13, v14, :cond_c

    .line 236
    invoke-virtual {v11, v12}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 240
    invoke-virtual {v4}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->completeSpecialEffect()V

    goto :goto_4

    .line 242
    :cond_c
    invoke-virtual {v8, v11}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 243
    new-instance v14, Landroidx/fragment/app/FragmentAnim$EndViewTransitionAnimation;

    invoke-direct {v14, v12, v8, v11}, Landroidx/fragment/app/FragmentAnim$EndViewTransitionAnimation;-><init>(Landroid/view/animation/Animation;Landroid/view/ViewGroup;Landroid/view/View;)V

    .line 245
    .local v14, "animation":Landroid/view/animation/Animation;
    new-instance v15, Landroidx/fragment/app/DefaultSpecialEffectsController$4;

    invoke-direct {v15, v7, v8, v11, v4}, Landroidx/fragment/app/DefaultSpecialEffectsController$4;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroid/view/ViewGroup;Landroid/view/View;Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;)V

    invoke-virtual {v14, v15}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 268
    invoke-virtual {v11, v14}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 271
    .end local v14    # "animation":Landroid/view/animation/Animation;
    :goto_4
    invoke-virtual {v4}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->getSignal()Landroidx/core/os/CancellationSignal;

    move-result-object v14

    .line 272
    .local v14, "signal":Landroidx/core/os/CancellationSignal;
    new-instance v15, Landroidx/fragment/app/DefaultSpecialEffectsController$5;

    invoke-direct {v15, v7, v11, v8, v4}, Landroidx/fragment/app/DefaultSpecialEffectsController$5;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroid/view/View;Landroid/view/ViewGroup;Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;)V

    invoke-virtual {v14, v15}, Landroidx/core/os/CancellationSignal;->setOnCancelListener(Landroidx/core/os/CancellationSignal$OnCancelListener;)V

    .line 280
    .end local v4    # "animationInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;
    .end local v5    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .end local v6    # "fragment":Landroidx/fragment/app/Fragment;
    .end local v11    # "viewToAnimate":Landroid/view/View;
    .end local v12    # "anim":Landroid/view/animation/Animation;
    .end local v13    # "finalState":Landroidx/fragment/app/SpecialEffectsController$Operation$State;
    .end local v14    # "signal":Landroidx/core/os/CancellationSignal;
    goto/16 :goto_3

    .line 281
    :cond_d
    return-void
.end method

.method private startTransitions(Ljava/util/List;Ljava/util/List;ZLandroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/fragment/app/SpecialEffectsController$Operation;)Ljava/util/Map;
    .locals 38
    .param p3, "isPop"    # Z
    .param p4, "firstOut"    # Landroidx/fragment/app/SpecialEffectsController$Operation;
    .param p5, "lastIn"    # Landroidx/fragment/app/SpecialEffectsController$Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            ">;Z",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            ")",
            "Ljava/util/Map<",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 288
    .local p1, "transitionInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;>;"
    .local p2, "awaitingContainerChanges":Ljava/util/List;, "Ljava/util/List<Landroidx/fragment/app/SpecialEffectsController$Operation;>;"
    move-object/from16 v6, p0

    move/from16 v7, p3

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v10, v0

    .line 290
    .local v10, "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    const/4 v0, 0x0

    .line 291
    .local v0, "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-object v15, v0

    .end local v0    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .local v15, "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .line 292
    .local v0, "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    invoke-virtual {v0}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->isVisibilityUnchanged()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 294
    goto :goto_0

    .line 296
    :cond_0
    invoke-virtual {v0}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getHandlingImpl()Landroidx/fragment/app/FragmentTransitionImpl;

    move-result-object v2

    .line 297
    .local v2, "handlingImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    if-nez v15, :cond_1

    .line 298
    move-object v3, v2

    move-object v15, v3

    .end local v15    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .local v3, "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    goto :goto_1

    .line 299
    .end local v3    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .restart local v15    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    :cond_1
    if-eqz v2, :cond_3

    if-ne v15, v2, :cond_2

    goto :goto_1

    .line 300
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Mixing framework transitions and AndroidX transitions is not allowed. Fragment "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    invoke-virtual {v0}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getOperation()Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " returned Transition "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    invoke-virtual {v0}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getTransition()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " which uses a different Transition  type than other Fragments."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 306
    .end local v0    # "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    .end local v2    # "handlingImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    :cond_3
    :goto_1
    goto :goto_0

    .line 307
    :cond_4
    const/4 v14, 0x0

    if-nez v15, :cond_6

    .line 309
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .line 310
    .local v1, "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    invoke-virtual {v1}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getOperation()Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-result-object v2

    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v10, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    invoke-virtual {v1}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->completeSpecialEffect()V

    .line 312
    .end local v1    # "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    goto :goto_2

    .line 313
    :cond_5
    return-object v10

    .line 319
    :cond_6
    new-instance v0, Landroid/view/View;

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/DefaultSpecialEffectsController;->getContainer()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    move-object v13, v0

    .line 322
    .local v13, "nonExistentView":Landroid/view/View;
    const/4 v0, 0x0

    .line 323
    .local v0, "sharedElementTransition":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 324
    .local v1, "firstOutEpicenterView":Landroid/view/View;
    const/4 v2, 0x0

    .line 325
    .local v2, "hasLastInEpicenter":Z
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    move-object v12, v3

    .line 326
    .local v12, "lastInEpicenterRect":Landroid/graphics/Rect;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object v11, v3

    .line 327
    .local v11, "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object v5, v3

    .line 328
    .local v5, "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    new-instance v3, Landroidx/collection/ArrayMap;

    invoke-direct {v3}, Landroidx/collection/ArrayMap;-><init>()V

    move-object v4, v3

    .line 329
    .local v4, "sharedElementNameMapping":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    move-object v3, v1

    move/from16 v20, v2

    .end local v1    # "firstOutEpicenterView":Landroid/view/View;
    .end local v2    # "hasLastInEpicenter":Z
    .local v3, "firstOutEpicenterView":Landroid/view/View;
    .local v20, "hasLastInEpicenter":Z
    :goto_3
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v21, v1

    check-cast v21, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .line 330
    .local v21, "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    invoke-virtual/range {v21 .. v21}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->hasSharedElementTransition()Z

    move-result v22

    .line 332
    .local v22, "hasSharedElementTransition":Z
    if-eqz v22, :cond_19

    if-eqz v8, :cond_19

    if-eqz v9, :cond_19

    .line 334
    nop

    .line 336
    invoke-virtual/range {v21 .. v21}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getSharedElementTransition()Ljava/lang/Object;

    move-result-object v1

    .line 335
    invoke-virtual {v15, v1}, Landroidx/fragment/app/FragmentTransitionImpl;->cloneTransition(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 334
    invoke-virtual {v15, v1}, Landroidx/fragment/app/FragmentTransitionImpl;->wrapTransitionInSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 339
    .end local v0    # "sharedElementTransition":Ljava/lang/Object;
    .local v1, "sharedElementTransition":Ljava/lang/Object;
    invoke-virtual/range {p5 .. p5}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 340
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getSharedElementSourceNames()Ljava/util/ArrayList;

    move-result-object v0

    .line 343
    .local v0, "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {p4 .. p4}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v16

    .line 344
    invoke-virtual/range {v16 .. v16}, Landroidx/fragment/app/Fragment;->getSharedElementSourceNames()Ljava/util/ArrayList;

    move-result-object v14

    .line 345
    .local v14, "firstOutSourceNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {p4 .. p4}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v16

    .line 346
    invoke-virtual/range {v16 .. v16}, Landroidx/fragment/app/Fragment;->getSharedElementTargetNames()Ljava/util/ArrayList;

    move-result-object v2

    .line 349
    .local v2, "firstOutTargetNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/16 v16, 0x0

    move-object/from16 v23, v1

    move/from16 v1, v16

    .local v1, "index":I
    .local v23, "sharedElementTransition":Ljava/lang/Object;
    :goto_4
    move-object/from16 v16, v3

    .end local v3    # "firstOutEpicenterView":Landroid/view/View;
    .local v16, "firstOutEpicenterView":Landroid/view/View;
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_8

    .line 350
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 351
    .local v3, "nameIndex":I
    move-object/from16 v24, v2

    .end local v2    # "firstOutTargetNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local v24, "firstOutTargetNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, -0x1

    if-eq v3, v2, :cond_7

    .line 354
    invoke-virtual {v14, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 349
    .end local v3    # "nameIndex":I
    :cond_7
    add-int/lit8 v1, v1, 0x1

    move-object/from16 v3, v16

    move-object/from16 v2, v24

    goto :goto_4

    .end local v24    # "firstOutTargetNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v2    # "firstOutTargetNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_8
    move-object/from16 v24, v2

    .line 357
    .end local v1    # "index":I
    .end local v2    # "firstOutTargetNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v24    # "firstOutTargetNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {p5 .. p5}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 358
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getSharedElementTargetNames()Ljava/util/ArrayList;

    move-result-object v3

    .line 361
    .local v3, "enteringNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-nez v7, :cond_9

    .line 364
    invoke-virtual/range {p4 .. p4}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getExitTransitionCallback()Landroidx/core/app/SharedElementCallback;

    move-result-object v1

    .line 365
    .local v1, "exitingCallback":Landroidx/core/app/SharedElementCallback;
    invoke-virtual/range {p5 .. p5}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getEnterTransitionCallback()Landroidx/core/app/SharedElementCallback;

    move-result-object v2

    move-object/from16 v37, v2

    move-object v2, v1

    move-object/from16 v1, v37

    .local v2, "enteringCallback":Landroidx/core/app/SharedElementCallback;
    goto :goto_5

    .line 369
    .end local v1    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    .end local v2    # "enteringCallback":Landroidx/core/app/SharedElementCallback;
    :cond_9
    invoke-virtual/range {p4 .. p4}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getEnterTransitionCallback()Landroidx/core/app/SharedElementCallback;

    move-result-object v1

    .line 370
    .restart local v1    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    invoke-virtual/range {p5 .. p5}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getExitTransitionCallback()Landroidx/core/app/SharedElementCallback;

    move-result-object v2

    move-object/from16 v37, v2

    move-object v2, v1

    move-object/from16 v1, v37

    .line 372
    .local v1, "enteringCallback":Landroidx/core/app/SharedElementCallback;
    .local v2, "exitingCallback":Landroidx/core/app/SharedElementCallback;
    :goto_5
    move-object/from16 v25, v14

    .end local v14    # "firstOutSourceNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local v25, "firstOutSourceNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v14

    .line 373
    .local v14, "numSharedElements":I
    const/16 v26, 0x0

    move/from16 v9, v26

    .local v9, "i":I
    :goto_6
    if-ge v9, v14, :cond_a

    .line 374
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v26

    move/from16 v27, v14

    .end local v14    # "numSharedElements":I
    .local v27, "numSharedElements":I
    move-object/from16 v14, v26

    check-cast v14, Ljava/lang/String;

    .line 375
    .local v14, "exitingName":Ljava/lang/String;
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v26

    move-object/from16 v8, v26

    check-cast v8, Ljava/lang/String;

    .line 376
    .local v8, "enteringName":Ljava/lang/String;
    invoke-virtual {v4, v14, v8}, Landroidx/collection/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    .end local v8    # "enteringName":Ljava/lang/String;
    .end local v14    # "exitingName":Ljava/lang/String;
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v8, p4

    move/from16 v14, v27

    goto :goto_6

    .end local v27    # "numSharedElements":I
    .local v14, "numSharedElements":I
    :cond_a
    move/from16 v27, v14

    .line 381
    .end local v9    # "i":I
    .end local v14    # "numSharedElements":I
    .restart local v27    # "numSharedElements":I
    new-instance v8, Landroidx/collection/ArrayMap;

    invoke-direct {v8}, Landroidx/collection/ArrayMap;-><init>()V

    .line 382
    .local v8, "firstOutViews":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    invoke-virtual/range {p4 .. p4}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v9

    iget-object v9, v9, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v6, v8, v9}, Landroidx/fragment/app/DefaultSpecialEffectsController;->findNamedViews(Ljava/util/Map;Landroid/view/View;)V

    .line 383
    invoke-virtual {v8, v0}, Landroidx/collection/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    .line 384
    if-eqz v2, :cond_e

    .line 386
    invoke-virtual {v2, v0, v8}, Landroidx/core/app/SharedElementCallback;->onMapSharedElements(Ljava/util/List;Ljava/util/Map;)V

    .line 387
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v14, 0x1

    sub-int/2addr v9, v14

    .restart local v9    # "i":I
    :goto_7
    if-ltz v9, :cond_d

    .line 388
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 389
    .local v14, "name":Ljava/lang/String;
    invoke-virtual {v8, v14}, Landroidx/collection/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Landroid/view/View;

    .line 390
    .local v26, "view":Landroid/view/View;
    if-nez v26, :cond_b

    .line 391
    invoke-virtual {v4, v14}, Landroidx/collection/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v29, v2

    goto :goto_8

    .line 392
    :cond_b
    move-object/from16 v28, v0

    .end local v0    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local v28, "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static/range {v26 .. v26}, Landroidx/core/view/ViewCompat;->getTransitionName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 393
    invoke-virtual {v4, v14}, Landroidx/collection/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 394
    .local v0, "targetValue":Ljava/lang/String;
    move-object/from16 v29, v2

    .end local v2    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    .local v29, "exitingCallback":Landroidx/core/app/SharedElementCallback;
    invoke-static/range {v26 .. v26}, Landroidx/core/view/ViewCompat;->getTransitionName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2, v0}, Landroidx/collection/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8

    .line 392
    .end local v0    # "targetValue":Ljava/lang/String;
    .end local v29    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    .restart local v2    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    :cond_c
    move-object/from16 v29, v2

    .line 387
    .end local v2    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    .end local v14    # "name":Ljava/lang/String;
    .end local v26    # "view":Landroid/view/View;
    .restart local v29    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    :goto_8
    add-int/lit8 v9, v9, -0x1

    move-object/from16 v0, v28

    move-object/from16 v2, v29

    goto :goto_7

    .end local v28    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v29    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    .local v0, "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v2    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    :cond_d
    move-object/from16 v28, v0

    move-object/from16 v29, v2

    .end local v0    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    .end local v9    # "i":I
    .restart local v28    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v29    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    goto :goto_9

    .line 400
    .end local v28    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v29    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    .restart local v0    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v2    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    :cond_e
    move-object/from16 v28, v0

    move-object/from16 v29, v2

    .end local v0    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    .restart local v28    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v29    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    invoke-virtual {v8}, Landroidx/collection/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroidx/collection/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    .line 405
    :goto_9
    new-instance v0, Landroidx/collection/ArrayMap;

    invoke-direct {v0}, Landroidx/collection/ArrayMap;-><init>()V

    move-object v9, v0

    .line 406
    .local v9, "lastInViews":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    invoke-virtual/range {p5 .. p5}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v6, v9, v0}, Landroidx/fragment/app/DefaultSpecialEffectsController;->findNamedViews(Ljava/util/Map;Landroid/view/View;)V

    .line 407
    invoke-virtual {v9, v3}, Landroidx/collection/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    .line 408
    invoke-virtual {v4}, Landroidx/collection/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroidx/collection/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    .line 409
    if-eqz v1, :cond_14

    .line 411
    invoke-virtual {v1, v3, v9}, Landroidx/core/app/SharedElementCallback;->onMapSharedElements(Ljava/util/List;Ljava/util/Map;)V

    .line 412
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    .local v0, "i":I
    :goto_a
    if-ltz v0, :cond_13

    .line 413
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 414
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v9, v2}, Landroidx/collection/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/view/View;

    .line 415
    .local v14, "view":Landroid/view/View;
    if-nez v14, :cond_10

    .line 416
    move-object/from16 v26, v1

    .end local v1    # "enteringCallback":Landroidx/core/app/SharedElementCallback;
    .local v26, "enteringCallback":Landroidx/core/app/SharedElementCallback;
    invoke-static {v4, v2}, Landroidx/fragment/app/FragmentTransition;->findKeyForValue(Landroidx/collection/ArrayMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 418
    .local v1, "key":Ljava/lang/String;
    if-eqz v1, :cond_f

    .line 419
    invoke-virtual {v4, v1}, Landroidx/collection/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 421
    .end local v1    # "key":Ljava/lang/String;
    :cond_f
    goto :goto_b

    .end local v26    # "enteringCallback":Landroidx/core/app/SharedElementCallback;
    .local v1, "enteringCallback":Landroidx/core/app/SharedElementCallback;
    :cond_10
    move-object/from16 v26, v1

    .end local v1    # "enteringCallback":Landroidx/core/app/SharedElementCallback;
    .restart local v26    # "enteringCallback":Landroidx/core/app/SharedElementCallback;
    invoke-static {v14}, Landroidx/core/view/ViewCompat;->getTransitionName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 422
    invoke-static {v4, v2}, Landroidx/fragment/app/FragmentTransition;->findKeyForValue(Landroidx/collection/ArrayMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 424
    .local v1, "key":Ljava/lang/String;
    if-eqz v1, :cond_11

    .line 425
    nop

    .line 426
    move-object/from16 v30, v2

    .end local v2    # "name":Ljava/lang/String;
    .local v30, "name":Ljava/lang/String;
    invoke-static {v14}, Landroidx/core/view/ViewCompat;->getTransitionName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    .line 425
    invoke-virtual {v4, v1, v2}, Landroidx/collection/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b

    .line 424
    .end local v30    # "name":Ljava/lang/String;
    .restart local v2    # "name":Ljava/lang/String;
    :cond_11
    move-object/from16 v30, v2

    .end local v2    # "name":Ljava/lang/String;
    .restart local v30    # "name":Ljava/lang/String;
    goto :goto_b

    .line 421
    .end local v1    # "key":Ljava/lang/String;
    .end local v30    # "name":Ljava/lang/String;
    .restart local v2    # "name":Ljava/lang/String;
    :cond_12
    move-object/from16 v30, v2

    .line 412
    .end local v2    # "name":Ljava/lang/String;
    .end local v14    # "view":Landroid/view/View;
    :goto_b
    add-int/lit8 v0, v0, -0x1

    move-object/from16 v1, v26

    goto :goto_a

    .end local v26    # "enteringCallback":Landroidx/core/app/SharedElementCallback;
    .local v1, "enteringCallback":Landroidx/core/app/SharedElementCallback;
    :cond_13
    move-object/from16 v26, v1

    .end local v0    # "i":I
    .end local v1    # "enteringCallback":Landroidx/core/app/SharedElementCallback;
    .restart local v26    # "enteringCallback":Landroidx/core/app/SharedElementCallback;
    goto :goto_c

    .line 432
    .end local v26    # "enteringCallback":Landroidx/core/app/SharedElementCallback;
    .restart local v1    # "enteringCallback":Landroidx/core/app/SharedElementCallback;
    :cond_14
    move-object/from16 v26, v1

    .end local v1    # "enteringCallback":Landroidx/core/app/SharedElementCallback;
    .restart local v26    # "enteringCallback":Landroidx/core/app/SharedElementCallback;
    invoke-static {v4, v9}, Landroidx/fragment/app/FragmentTransition;->retainValues(Landroidx/collection/ArrayMap;Landroidx/collection/ArrayMap;)V

    .line 437
    :goto_c
    invoke-virtual {v4}, Landroidx/collection/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {v6, v8, v0}, Landroidx/fragment/app/DefaultSpecialEffectsController;->retainMatchingViews(Landroidx/collection/ArrayMap;Ljava/util/Collection;)V

    .line 438
    invoke-virtual {v4}, Landroidx/collection/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v6, v9, v0}, Landroidx/fragment/app/DefaultSpecialEffectsController;->retainMatchingViews(Landroidx/collection/ArrayMap;Ljava/util/Collection;)V

    .line 440
    invoke-virtual {v4}, Landroidx/collection/ArrayMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 443
    const/4 v0, 0x0

    .line 444
    .end local v23    # "sharedElementTransition":Ljava/lang/Object;
    .local v0, "sharedElementTransition":Ljava/lang/Object;
    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 445
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    move-object/from16 v33, v4

    move-object/from16 v30, v5

    move-object v14, v10

    move-object v10, v11

    move-object/from16 v34, v12

    move-object v2, v13

    move-object/from16 v35, v15

    move-object/from16 v3, v16

    const/4 v4, 0x0

    move-object/from16 v15, p4

    move-object/from16 v13, p5

    goto/16 :goto_f

    .line 449
    .end local v0    # "sharedElementTransition":Ljava/lang/Object;
    .restart local v23    # "sharedElementTransition":Ljava/lang/Object;
    :cond_15
    nop

    .line 450
    invoke-virtual/range {p5 .. p5}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    invoke-virtual/range {p4 .. p4}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 449
    const/4 v2, 0x1

    invoke-static {v0, v1, v7, v8, v2}, Landroidx/fragment/app/FragmentTransition;->callSharedElementStartEnd(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLandroidx/collection/ArrayMap;Z)V

    .line 454
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/DefaultSpecialEffectsController;->getContainer()Landroid/view/ViewGroup;

    move-result-object v14

    new-instance v1, Landroidx/fragment/app/DefaultSpecialEffectsController$6;

    move-object/from16 v30, v28

    .end local v28    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local v30, "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object v0, v1

    move-object/from16 v7, v23

    move-object/from16 v23, v26

    move-object/from16 v26, v10

    move-object v10, v1

    .end local v10    # "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    .local v7, "sharedElementTransition":Ljava/lang/Object;
    .local v23, "enteringCallback":Landroidx/core/app/SharedElementCallback;
    .local v26, "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    move-object/from16 v1, p0

    move-object/from16 v28, v29

    const/16 v29, 0x1

    .end local v29    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    .local v28, "exitingCallback":Landroidx/core/app/SharedElementCallback;
    move-object/from16 v2, p5

    move-object/from16 v32, v3

    move-object/from16 v31, v16

    .end local v3    # "enteringNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v16    # "firstOutEpicenterView":Landroid/view/View;
    .local v31, "firstOutEpicenterView":Landroid/view/View;
    .local v32, "enteringNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v3, p4

    move-object/from16 v33, v4

    .end local v4    # "sharedElementNameMapping":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Ljava/lang/String;>;"
    .local v33, "sharedElementNameMapping":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Ljava/lang/String;>;"
    move/from16 v4, p3

    move-object/from16 v16, v13

    move-object v13, v5

    .end local v5    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local v13, "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local v16, "nonExistentView":Landroid/view/View;
    move-object v5, v9

    invoke-direct/range {v0 .. v5}, Landroidx/fragment/app/DefaultSpecialEffectsController$6;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/fragment/app/SpecialEffectsController$Operation;ZLandroidx/collection/ArrayMap;)V

    invoke-static {v14, v10}, Landroidx/core/view/OneShotPreDrawListener;->add(Landroid/view/View;Ljava/lang/Runnable;)Landroidx/core/view/OneShotPreDrawListener;

    .line 463
    invoke-virtual {v8}, Landroidx/collection/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 466
    invoke-virtual/range {v30 .. v30}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_16

    .line 467
    move-object/from16 v0, v30

    const/4 v1, 0x0

    .end local v30    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local v0, "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v1, v2

    check-cast v1, Ljava/lang/String;

    .line 468
    .local v1, "epicenterViewName":Ljava/lang/String;
    invoke-virtual {v8, v1}, Landroidx/collection/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/view/View;

    .line 469
    .end local v31    # "firstOutEpicenterView":Landroid/view/View;
    .local v3, "firstOutEpicenterView":Landroid/view/View;
    invoke-virtual {v15, v7, v3}, Landroidx/fragment/app/FragmentTransitionImpl;->setEpicenter(Ljava/lang/Object;Landroid/view/View;)V

    goto :goto_d

    .line 466
    .end local v0    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v1    # "epicenterViewName":Ljava/lang/String;
    .end local v3    # "firstOutEpicenterView":Landroid/view/View;
    .restart local v30    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v31    # "firstOutEpicenterView":Landroid/view/View;
    :cond_16
    move-object/from16 v0, v30

    .end local v30    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v0    # "exitingNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v3, v31

    .line 473
    .end local v31    # "firstOutEpicenterView":Landroid/view/View;
    .restart local v3    # "firstOutEpicenterView":Landroid/view/View;
    :goto_d
    invoke-virtual {v9}, Landroidx/collection/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 476
    invoke-virtual/range {v32 .. v32}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_17

    .line 477
    move-object/from16 v1, v32

    const/4 v2, 0x0

    .end local v32    # "enteringNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local v1, "enteringNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 478
    .local v4, "epicenterViewName":Ljava/lang/String;
    invoke-virtual {v9, v4}, Landroidx/collection/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 479
    .local v5, "lastInEpicenterView":Landroid/view/View;
    if-eqz v5, :cond_18

    .line 480
    const/16 v20, 0x1

    .line 484
    move-object v10, v15

    .line 485
    .local v10, "impl":Landroidx/fragment/app/FragmentTransitionImpl;
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/DefaultSpecialEffectsController;->getContainer()Landroid/view/ViewGroup;

    move-result-object v14

    new-instance v2, Landroidx/fragment/app/DefaultSpecialEffectsController$7;

    invoke-direct {v2, v6, v10, v5, v12}, Landroidx/fragment/app/DefaultSpecialEffectsController$7;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroidx/fragment/app/FragmentTransitionImpl;Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-static {v14, v2}, Landroidx/core/view/OneShotPreDrawListener;->add(Landroid/view/View;Ljava/lang/Runnable;)Landroidx/core/view/OneShotPreDrawListener;

    goto :goto_e

    .line 476
    .end local v1    # "enteringNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v4    # "epicenterViewName":Ljava/lang/String;
    .end local v5    # "lastInEpicenterView":Landroid/view/View;
    .end local v10    # "impl":Landroidx/fragment/app/FragmentTransitionImpl;
    .restart local v32    # "enteringNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_17
    move-object/from16 v1, v32

    .line 498
    .end local v32    # "enteringNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v1    # "enteringNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_18
    :goto_e
    move-object/from16 v2, v16

    .end local v16    # "nonExistentView":Landroid/view/View;
    .local v2, "nonExistentView":Landroid/view/View;
    invoke-virtual {v15, v7, v2, v11}, Landroidx/fragment/app/FragmentTransitionImpl;->setSharedElementTargets(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 503
    const/4 v4, 0x0

    const/4 v14, 0x0

    const/4 v5, 0x0

    const/16 v16, 0x0

    move-object v10, v11

    .end local v11    # "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local v10, "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    move-object v11, v15

    move-object/from16 v34, v12

    .end local v12    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .local v34, "lastInEpicenterRect":Landroid/graphics/Rect;
    move-object v12, v7

    move-object/from16 v30, v13

    .end local v13    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local v30, "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    move-object v13, v4

    const/4 v4, 0x0

    move-object/from16 v35, v15

    .end local v15    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .local v35, "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    move-object v15, v5

    move-object/from16 v17, v7

    move-object/from16 v18, v30

    invoke-virtual/range {v11 .. v18}, Landroidx/fragment/app/FragmentTransitionImpl;->scheduleRemoveTargets(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 508
    invoke-static/range {v29 .. v29}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    move-object/from16 v15, p4

    move-object/from16 v14, v26

    .end local v26    # "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    .local v14, "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    invoke-interface {v14, v15, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 509
    invoke-static/range {v29 .. v29}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    move-object/from16 v13, p5

    invoke-interface {v14, v13, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v7

    goto :goto_f

    .line 332
    .end local v1    # "enteringNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "nonExistentView":Landroid/view/View;
    .end local v7    # "sharedElementTransition":Ljava/lang/Object;
    .end local v8    # "firstOutViews":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    .end local v9    # "lastInViews":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    .end local v14    # "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    .end local v23    # "enteringCallback":Landroidx/core/app/SharedElementCallback;
    .end local v24    # "firstOutTargetNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v25    # "firstOutSourceNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v27    # "numSharedElements":I
    .end local v28    # "exitingCallback":Landroidx/core/app/SharedElementCallback;
    .end local v30    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v33    # "sharedElementNameMapping":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v34    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .end local v35    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .local v0, "sharedElementTransition":Ljava/lang/Object;
    .local v4, "sharedElementNameMapping":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Ljava/lang/String;>;"
    .local v5, "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local v10, "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    .restart local v11    # "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v12    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .local v13, "nonExistentView":Landroid/view/View;
    .restart local v15    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    :cond_19
    move-object/from16 v31, v3

    move-object/from16 v33, v4

    move-object/from16 v30, v5

    move-object v14, v10

    move-object v10, v11

    move-object/from16 v34, v12

    move-object v2, v13

    move-object/from16 v35, v15

    const/4 v4, 0x0

    move-object v15, v8

    move-object v13, v9

    .line 512
    .end local v3    # "firstOutEpicenterView":Landroid/view/View;
    .end local v4    # "sharedElementNameMapping":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v11    # "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v12    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .end local v13    # "nonExistentView":Landroid/view/View;
    .end local v15    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .end local v21    # "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    .end local v22    # "hasSharedElementTransition":Z
    .restart local v2    # "nonExistentView":Landroid/view/View;
    .local v10, "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v14    # "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    .restart local v30    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v31    # "firstOutEpicenterView":Landroid/view/View;
    .restart local v33    # "sharedElementNameMapping":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v34    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .restart local v35    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    move-object/from16 v3, v31

    .end local v31    # "firstOutEpicenterView":Landroid/view/View;
    .restart local v3    # "firstOutEpicenterView":Landroid/view/View;
    :goto_f
    move/from16 v7, p3

    move-object v11, v10

    move-object v9, v13

    move-object v10, v14

    move-object v8, v15

    move-object/from16 v5, v30

    move-object/from16 v4, v33

    move-object/from16 v12, v34

    move-object/from16 v15, v35

    const/4 v14, 0x0

    move-object v13, v2

    goto/16 :goto_3

    .line 513
    .end local v2    # "nonExistentView":Landroid/view/View;
    .end local v14    # "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    .end local v30    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v33    # "sharedElementNameMapping":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v34    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .end local v35    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .restart local v4    # "sharedElementNameMapping":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local v10, "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    .restart local v11    # "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v12    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .restart local v13    # "nonExistentView":Landroid/view/View;
    .restart local v15    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    :cond_1a
    move-object/from16 v31, v3

    move-object/from16 v33, v4

    move-object/from16 v30, v5

    move-object v14, v10

    move-object v10, v11

    move-object/from16 v34, v12

    move-object v2, v13

    move-object/from16 v35, v15

    const/4 v4, 0x0

    const/16 v29, 0x1

    move-object v15, v8

    move-object v13, v9

    .end local v3    # "firstOutEpicenterView":Landroid/view/View;
    .end local v4    # "sharedElementNameMapping":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v11    # "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v12    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .end local v13    # "nonExistentView":Landroid/view/View;
    .end local v15    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .restart local v2    # "nonExistentView":Landroid/view/View;
    .local v10, "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v14    # "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    .restart local v30    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v31    # "firstOutEpicenterView":Landroid/view/View;
    .restart local v33    # "sharedElementNameMapping":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v34    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .restart local v35    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 515
    .local v1, "enteringViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v3, 0x0

    .line 517
    .local v3, "mergedTransition":Ljava/lang/Object;
    const/4 v5, 0x0

    .line 519
    .local v5, "mergedNonOverlappingTransition":Ljava/lang/Object;
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_10
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_27

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .line 520
    .local v8, "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    invoke-virtual {v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->isVisibilityUnchanged()Z

    move-result v9

    if-eqz v9, :cond_1b

    .line 522
    invoke-virtual {v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getOperation()Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-result-object v9

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-interface {v14, v9, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 523
    invoke-virtual {v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->completeSpecialEffect()V

    .line 524
    goto :goto_10

    .line 526
    :cond_1b
    invoke-virtual {v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getTransition()Ljava/lang/Object;

    move-result-object v9

    move-object/from16 v12, v35

    .end local v35    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .local v12, "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    invoke-virtual {v12, v9}, Landroidx/fragment/app/FragmentTransitionImpl;->cloneTransition(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 527
    .local v9, "transition":Ljava/lang/Object;
    invoke-virtual {v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getOperation()Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-result-object v11

    .line 528
    .local v11, "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    if-eqz v0, :cond_1d

    if-eq v11, v15, :cond_1c

    if-ne v11, v13, :cond_1d

    :cond_1c
    const/16 v16, 0x1

    goto :goto_11

    :cond_1d
    const/16 v16, 0x0

    :goto_11
    move/from16 v19, v16

    .line 530
    .local v19, "involvedInSharedElementTransition":Z
    if-nez v9, :cond_1f

    .line 532
    if-nez v19, :cond_1e

    .line 536
    move-object/from16 v21, v7

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-interface {v14, v11, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 537
    invoke-virtual {v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->completeSpecialEffect()V

    goto :goto_12

    .line 532
    :cond_1e
    move-object/from16 v21, v7

    .line 606
    .end local v8    # "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    .end local v9    # "transition":Ljava/lang/Object;
    .end local v11    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .end local v19    # "involvedInSharedElementTransition":Z
    :goto_12
    move-object/from16 v25, v2

    move-object/from16 v26, v10

    move-object v2, v14

    move-object v10, v15

    move-object/from16 v4, v30

    move-object/from16 v13, v34

    move-object/from16 v15, p2

    move-object v14, v12

    move-object/from16 v12, v31

    goto/16 :goto_16

    .line 541
    .restart local v8    # "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    .restart local v9    # "transition":Ljava/lang/Object;
    .restart local v11    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .restart local v19    # "involvedInSharedElementTransition":Z
    :cond_1f
    move-object/from16 v21, v7

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 542
    .local v7, "transitioningViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    nop

    .line 543
    invoke-virtual {v11}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v4

    iget-object v4, v4, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 542
    invoke-virtual {v6, v7, v4}, Landroidx/fragment/app/DefaultSpecialEffectsController;->captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V

    .line 544
    if-eqz v19, :cond_21

    .line 546
    if-ne v11, v15, :cond_20

    .line 547
    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    move-object/from16 v4, v30

    goto :goto_13

    .line 549
    :cond_20
    move-object/from16 v4, v30

    .end local v30    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local v4, "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    goto :goto_13

    .line 544
    .end local v4    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v30    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    :cond_21
    move-object/from16 v4, v30

    .line 552
    .end local v30    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v4    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    :goto_13
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v16

    if-eqz v16, :cond_22

    .line 553
    invoke-virtual {v12, v9, v2}, Landroidx/fragment/app/FragmentTransitionImpl;->addTarget(Ljava/lang/Object;Landroid/view/View;)V

    move-object/from16 v25, v2

    move-object/from16 v26, v10

    move-object v2, v14

    move-object v10, v15

    move-object/from16 v15, p2

    move-object v14, v12

    goto/16 :goto_14

    .line 555
    :cond_22
    invoke-virtual {v12, v9, v7}, Landroidx/fragment/app/FragmentTransitionImpl;->addTargets(Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 556
    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v23, 0x0

    move-object/from16 v24, v11

    .end local v11    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .local v24, "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    move-object v11, v12

    move-object/from16 v36, v12

    .end local v12    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .local v36, "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    move-object v12, v9

    move-object v13, v9

    move-object/from16 v25, v2

    move-object v2, v14

    .end local v14    # "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    .local v2, "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    .local v25, "nonExistentView":Landroid/view/View;
    move-object v14, v7

    move-object/from16 v26, v10

    move-object v10, v15

    .end local v10    # "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local v26, "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    move-object/from16 v15, v16

    move-object/from16 v16, v17

    move-object/from16 v17, v18

    move-object/from16 v18, v23

    invoke-virtual/range {v11 .. v18}, Landroidx/fragment/app/FragmentTransitionImpl;->scheduleRemoveTargets(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 559
    invoke-virtual/range {v24 .. v24}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFinalState()Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    move-result-object v11

    sget-object v12, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->GONE:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    if-ne v11, v12, :cond_23

    .line 563
    move-object/from16 v15, p2

    move-object/from16 v11, v24

    .end local v24    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .restart local v11    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    invoke-interface {v15, v11}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 566
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 568
    .local v12, "transitioningViewsToHide":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v11}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v13

    iget-object v13, v13, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 569
    nop

    .line 570
    invoke-virtual {v11}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v13

    iget-object v13, v13, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 569
    move-object/from16 v14, v36

    .end local v36    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .local v14, "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    invoke-virtual {v14, v9, v13, v12}, Landroidx/fragment/app/FragmentTransitionImpl;->scheduleHideFragmentView(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 577
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/DefaultSpecialEffectsController;->getContainer()Landroid/view/ViewGroup;

    move-result-object v13

    move-object/from16 v16, v12

    .end local v12    # "transitioningViewsToHide":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local v16, "transitioningViewsToHide":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    new-instance v12, Landroidx/fragment/app/DefaultSpecialEffectsController$8;

    invoke-direct {v12, v6, v7}, Landroidx/fragment/app/DefaultSpecialEffectsController$8;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Ljava/util/ArrayList;)V

    invoke-static {v13, v12}, Landroidx/core/view/OneShotPreDrawListener;->add(Landroid/view/View;Ljava/lang/Runnable;)Landroidx/core/view/OneShotPreDrawListener;

    goto :goto_14

    .line 559
    .end local v11    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .end local v14    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .end local v16    # "transitioningViewsToHide":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v24    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .restart local v36    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    :cond_23
    move-object/from16 v15, p2

    move-object/from16 v11, v24

    move-object/from16 v14, v36

    .line 586
    .end local v24    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .end local v36    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .restart local v11    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .restart local v14    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    :goto_14
    invoke-virtual {v11}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFinalState()Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    move-result-object v12

    sget-object v13, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->VISIBLE:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    if-ne v12, v13, :cond_25

    .line 587
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 588
    if-eqz v20, :cond_24

    .line 589
    move-object/from16 v13, v34

    .end local v34    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .local v13, "lastInEpicenterRect":Landroid/graphics/Rect;
    invoke-virtual {v14, v9, v13}, Landroidx/fragment/app/FragmentTransitionImpl;->setEpicenter(Ljava/lang/Object;Landroid/graphics/Rect;)V

    move-object/from16 v12, v31

    goto :goto_15

    .line 588
    .end local v13    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .restart local v34    # "lastInEpicenterRect":Landroid/graphics/Rect;
    :cond_24
    move-object/from16 v13, v34

    .end local v34    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .restart local v13    # "lastInEpicenterRect":Landroid/graphics/Rect;
    move-object/from16 v12, v31

    goto :goto_15

    .line 592
    .end local v13    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .restart local v34    # "lastInEpicenterRect":Landroid/graphics/Rect;
    :cond_25
    move-object/from16 v13, v34

    .end local v34    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .restart local v13    # "lastInEpicenterRect":Landroid/graphics/Rect;
    move-object/from16 v12, v31

    .end local v31    # "firstOutEpicenterView":Landroid/view/View;
    .local v12, "firstOutEpicenterView":Landroid/view/View;
    invoke-virtual {v14, v9, v12}, Landroidx/fragment/app/FragmentTransitionImpl;->setEpicenter(Ljava/lang/Object;Landroid/view/View;)V

    .line 594
    :goto_15
    move-object/from16 v16, v7

    .end local v7    # "transitioningViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local v16, "transitioningViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-static/range {v29 .. v29}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-interface {v2, v11, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 596
    invoke-virtual {v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->isOverlapAllowed()Z

    move-result v7

    move-object/from16 v17, v8

    .end local v8    # "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    .local v17, "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    const/4 v8, 0x0

    if-eqz v7, :cond_26

    .line 598
    invoke-virtual {v14, v3, v9, v8}, Landroidx/fragment/app/FragmentTransitionImpl;->mergeTransitionsTogether(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_16

    .line 602
    :cond_26
    invoke-virtual {v14, v5, v9, v8}, Landroidx/fragment/app/FragmentTransitionImpl;->mergeTransitionsTogether(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 606
    .end local v9    # "transition":Ljava/lang/Object;
    .end local v11    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .end local v16    # "transitioningViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v17    # "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    .end local v19    # "involvedInSharedElementTransition":Z
    :goto_16
    move-object/from16 v30, v4

    move-object v15, v10

    move-object/from16 v31, v12

    move-object/from16 v34, v13

    move-object/from16 v35, v14

    move-object/from16 v7, v21

    move-object/from16 v10, v26

    const/4 v4, 0x0

    move-object/from16 v13, p5

    move-object v14, v2

    move-object/from16 v2, v25

    goto/16 :goto_10

    .line 610
    .end local v4    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v12    # "firstOutEpicenterView":Landroid/view/View;
    .end local v13    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .end local v25    # "nonExistentView":Landroid/view/View;
    .end local v26    # "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local v2, "nonExistentView":Landroid/view/View;
    .restart local v10    # "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local v14, "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    .restart local v30    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v31    # "firstOutEpicenterView":Landroid/view/View;
    .restart local v34    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .restart local v35    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    :cond_27
    move-object/from16 v25, v2

    move-object/from16 v26, v10

    move-object v2, v14

    move-object v10, v15

    move-object/from16 v4, v30

    move-object/from16 v12, v31

    move-object/from16 v13, v34

    move-object/from16 v14, v35

    move-object/from16 v15, p2

    .end local v10    # "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v30    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v31    # "firstOutEpicenterView":Landroid/view/View;
    .end local v34    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .end local v35    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .local v2, "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    .restart local v4    # "sharedElementLastInViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v12    # "firstOutEpicenterView":Landroid/view/View;
    .restart local v13    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .local v14, "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .restart local v25    # "nonExistentView":Landroid/view/View;
    .restart local v26    # "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v14, v3, v5, v0}, Landroidx/fragment/app/FragmentTransitionImpl;->mergeTransitionsInSequence(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 614
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_17
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_30

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .line 615
    .restart local v8    # "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    invoke-virtual {v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->isVisibilityUnchanged()Z

    move-result v9

    if-eqz v9, :cond_28

    .line 617
    goto :goto_17

    .line 619
    :cond_28
    invoke-virtual {v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getTransition()Ljava/lang/Object;

    move-result-object v9

    .line 620
    .restart local v9    # "transition":Ljava/lang/Object;
    invoke-virtual {v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getOperation()Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-result-object v11

    .line 621
    .restart local v11    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    if-eqz v0, :cond_2a

    if-eq v11, v10, :cond_29

    move-object/from16 v17, v5

    move-object/from16 v5, p5

    .end local v5    # "mergedNonOverlappingTransition":Ljava/lang/Object;
    .local v17, "mergedNonOverlappingTransition":Ljava/lang/Object;
    if-ne v11, v5, :cond_2b

    goto :goto_18

    .end local v17    # "mergedNonOverlappingTransition":Ljava/lang/Object;
    .restart local v5    # "mergedNonOverlappingTransition":Ljava/lang/Object;
    :cond_29
    move-object/from16 v17, v5

    move-object/from16 v5, p5

    .end local v5    # "mergedNonOverlappingTransition":Ljava/lang/Object;
    .restart local v17    # "mergedNonOverlappingTransition":Ljava/lang/Object;
    :goto_18
    const/16 v16, 0x1

    goto :goto_19

    .end local v17    # "mergedNonOverlappingTransition":Ljava/lang/Object;
    .restart local v5    # "mergedNonOverlappingTransition":Ljava/lang/Object;
    :cond_2a
    move-object/from16 v17, v5

    move-object/from16 v5, p5

    .end local v5    # "mergedNonOverlappingTransition":Ljava/lang/Object;
    .restart local v17    # "mergedNonOverlappingTransition":Ljava/lang/Object;
    :cond_2b
    const/16 v16, 0x0

    .line 623
    .local v16, "involvedInSharedElementTransition":Z
    :goto_19
    if-nez v9, :cond_2d

    if-eqz v16, :cond_2c

    goto :goto_1a

    :cond_2c
    move-object/from16 v18, v7

    goto :goto_1c

    .line 626
    :cond_2d
    :goto_1a
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/DefaultSpecialEffectsController;->getContainer()Landroid/view/ViewGroup;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Landroidx/core/view/ViewCompat;->isLaidOut(Landroid/view/View;)Z

    move-result v18

    if-nez v18, :cond_2f

    .line 627
    const/16 v18, 0x2

    invoke-static/range {v18 .. v18}, Landroidx/fragment/app/FragmentManager;->isLoggingEnabled(I)Z

    move-result v18

    if-eqz v18, :cond_2e

    .line 628
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v18, v7

    const-string v7, "SpecialEffectsController: Container "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 629
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/DefaultSpecialEffectsController;->getContainer()Landroid/view/ViewGroup;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v7, " has not been laid out. Completing operation "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 628
    const-string v7, "FragmentManager"

    invoke-static {v7, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1b

    .line 627
    :cond_2e
    move-object/from16 v18, v7

    .line 633
    :goto_1b
    invoke-virtual {v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->completeSpecialEffect()V

    goto :goto_1c

    .line 635
    :cond_2f
    move-object/from16 v18, v7

    .line 636
    invoke-virtual {v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getOperation()Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v5

    .line 638
    invoke-virtual {v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getSignal()Landroidx/core/os/CancellationSignal;

    move-result-object v7

    move-object/from16 v19, v9

    .end local v9    # "transition":Ljava/lang/Object;
    .local v19, "transition":Ljava/lang/Object;
    new-instance v9, Landroidx/fragment/app/DefaultSpecialEffectsController$9;

    invoke-direct {v9, v6, v8}, Landroidx/fragment/app/DefaultSpecialEffectsController$9;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;)V

    .line 635
    invoke-virtual {v14, v5, v3, v7, v9}, Landroidx/fragment/app/FragmentTransitionImpl;->setListenerForTransitionEnd(Landroidx/fragment/app/Fragment;Ljava/lang/Object;Landroidx/core/os/CancellationSignal;Ljava/lang/Runnable;)V

    .line 647
    .end local v8    # "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    .end local v11    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .end local v16    # "involvedInSharedElementTransition":Z
    .end local v19    # "transition":Ljava/lang/Object;
    :goto_1c
    move-object/from16 v5, v17

    move-object/from16 v7, v18

    goto/16 :goto_17

    .line 650
    .end local v17    # "mergedNonOverlappingTransition":Ljava/lang/Object;
    .restart local v5    # "mergedNonOverlappingTransition":Ljava/lang/Object;
    :cond_30
    move-object/from16 v17, v5

    .end local v5    # "mergedNonOverlappingTransition":Ljava/lang/Object;
    .restart local v17    # "mergedNonOverlappingTransition":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/DefaultSpecialEffectsController;->getContainer()Landroid/view/ViewGroup;

    move-result-object v5

    invoke-static {v5}, Landroidx/core/view/ViewCompat;->isLaidOut(Landroid/view/View;)Z

    move-result v5

    if-nez v5, :cond_31

    .line 651
    return-object v2

    .line 655
    :cond_31
    const/4 v5, 0x4

    invoke-static {v1, v5}, Landroidx/fragment/app/FragmentTransition;->setViewVisibility(Ljava/util/ArrayList;I)V

    .line 656
    nop

    .line 657
    invoke-virtual {v14, v4}, Landroidx/fragment/app/FragmentTransitionImpl;->prepareSetNameOverridesReordered(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v5

    .line 659
    .local v5, "inNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/DefaultSpecialEffectsController;->getContainer()Landroid/view/ViewGroup;

    move-result-object v7

    invoke-virtual {v14, v7, v3}, Landroidx/fragment/app/FragmentTransitionImpl;->beginDelayedTransition(Landroid/view/ViewGroup;Ljava/lang/Object;)V

    .line 660
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/DefaultSpecialEffectsController;->getContainer()Landroid/view/ViewGroup;

    move-result-object v7

    move-object v11, v14

    move-object v8, v12

    .end local v12    # "firstOutEpicenterView":Landroid/view/View;
    .local v8, "firstOutEpicenterView":Landroid/view/View;
    move-object v12, v7

    move-object v7, v13

    .end local v13    # "lastInEpicenterRect":Landroid/graphics/Rect;
    .local v7, "lastInEpicenterRect":Landroid/graphics/Rect;
    move-object/from16 v13, v26

    move-object v9, v14

    .end local v14    # "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    .local v9, "transitionImpl":Landroidx/fragment/app/FragmentTransitionImpl;
    move-object v14, v4

    move-object v15, v5

    move-object/from16 v16, v33

    invoke-virtual/range {v11 .. v16}, Landroidx/fragment/app/FragmentTransitionImpl;->setNameOverridesReordered(Landroid/view/View;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/Map;)V

    .line 664
    const/4 v11, 0x0

    invoke-static {v1, v11}, Landroidx/fragment/app/FragmentTransition;->setViewVisibility(Ljava/util/ArrayList;I)V

    .line 665
    move-object/from16 v11, v26

    .end local v26    # "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local v11, "sharedElementFirstOutViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v9, v0, v11, v4}, Landroidx/fragment/app/FragmentTransitionImpl;->swapSharedElementTargets(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 667
    return-object v2
.end method


# virtual methods
.method applyContainerChanges(Landroidx/fragment/app/SpecialEffectsController$Operation;)V
    .locals 2
    .param p1, "operation"    # Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 742
    invoke-virtual {p1}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 743
    .local v0, "view":Landroid/view/View;
    invoke-virtual {p1}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFinalState()Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->applyState(Landroid/view/View;)V

    .line 744
    return-void
.end method

.method captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 5
    .param p2, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 697
    .local p1, "transitioningViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    instance-of v0, p2, Landroid/view/ViewGroup;

    if-eqz v0, :cond_3

    .line 698
    move-object v0, p2

    check-cast v0, Landroid/view/ViewGroup;

    .line 699
    .local v0, "viewGroup":Landroid/view/ViewGroup;
    invoke-static {v0}, Landroidx/core/view/ViewGroupCompat;->isTransitionGroup(Landroid/view/ViewGroup;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 700
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 701
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 704
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 705
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 706
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 707
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_1

    .line 708
    invoke-virtual {p0, p1, v3}, Landroidx/fragment/app/DefaultSpecialEffectsController;->captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V

    .line 705
    .end local v3    # "child":Landroid/view/View;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 712
    .end local v0    # "viewGroup":Landroid/view/ViewGroup;
    .end local v1    # "count":I
    .end local v2    # "i":I
    :cond_2
    :goto_1
    goto :goto_2

    .line 713
    :cond_3
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 714
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 717
    :cond_4
    :goto_2
    return-void
.end method

.method executeOperations(Ljava/util/List;Z)V
    .locals 12
    .param p2, "isPop"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            ">;Z)V"
        }
    .end annotation

    .line 59
    .local p1, "operations":Ljava/util/List;, "Ljava/util/List<Landroidx/fragment/app/SpecialEffectsController$Operation;>;"
    const/4 v0, 0x0

    .line 60
    .local v0, "firstOut":Landroidx/fragment/app/SpecialEffectsController$Operation;
    const/4 v1, 0x0

    .line 61
    .local v1, "lastIn":Landroidx/fragment/app/SpecialEffectsController$Operation;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 62
    .local v3, "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    invoke-virtual {v3}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v4

    iget-object v4, v4, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    invoke-static {v4}, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->from(Landroid/view/View;)Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    move-result-object v4

    .line 63
    .local v4, "currentState":Landroidx/fragment/app/SpecialEffectsController$Operation$State;
    sget-object v5, Landroidx/fragment/app/DefaultSpecialEffectsController$10;->$SwitchMap$androidx$fragment$app$SpecialEffectsController$Operation$State:[I

    invoke-virtual {v3}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFinalState()Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    goto :goto_1

    .line 73
    :pswitch_0
    sget-object v5, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->VISIBLE:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    if-eq v4, v5, :cond_0

    .line 75
    move-object v1, v3

    goto :goto_1

    .line 67
    :pswitch_1
    sget-object v5, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->VISIBLE:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    if-ne v4, v5, :cond_0

    if-nez v0, :cond_0

    .line 69
    move-object v0, v3

    .line 79
    .end local v3    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .end local v4    # "currentState":Landroidx/fragment/app/SpecialEffectsController$Operation$State;
    :cond_0
    :goto_1
    goto :goto_0

    .line 83
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .local v2, "animations":Ljava/util/List;, "Ljava/util/List<Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object v9, v3

    .line 85
    .local v9, "transitions":Ljava/util/List;, "Ljava/util/List<Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v10, v3

    .line 87
    .local v10, "awaitingContainerChanges":Ljava/util/List;, "Ljava/util/List<Landroidx/fragment/app/SpecialEffectsController$Operation;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v11, 0x1

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 89
    .local v4, "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    new-instance v5, Landroidx/core/os/CancellationSignal;

    invoke-direct {v5}, Landroidx/core/os/CancellationSignal;-><init>()V

    .line 90
    .local v5, "animCancellationSignal":Landroidx/core/os/CancellationSignal;
    invoke-virtual {v4, v5}, Landroidx/fragment/app/SpecialEffectsController$Operation;->markStartedSpecialEffect(Landroidx/core/os/CancellationSignal;)V

    .line 92
    new-instance v6, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;

    invoke-direct {v6, v4, v5, p2}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;-><init>(Landroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/core/os/CancellationSignal;Z)V

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    new-instance v6, Landroidx/core/os/CancellationSignal;

    invoke-direct {v6}, Landroidx/core/os/CancellationSignal;-><init>()V

    .line 96
    .local v6, "transitionCancellationSignal":Landroidx/core/os/CancellationSignal;
    invoke-virtual {v4, v6}, Landroidx/fragment/app/SpecialEffectsController$Operation;->markStartedSpecialEffect(Landroidx/core/os/CancellationSignal;)V

    .line 98
    new-instance v7, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .line 99
    const/4 v8, 0x0

    if-eqz p2, :cond_2

    if-ne v4, v0, :cond_3

    goto :goto_3

    :cond_2
    if-ne v4, v1, :cond_3

    :goto_3
    goto :goto_4

    :cond_3
    const/4 v11, 0x0

    :goto_4
    invoke-direct {v7, v4, v6, p2, v11}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;-><init>(Landroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/core/os/CancellationSignal;ZZ)V

    .line 98
    invoke-interface {v9, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    new-instance v7, Landroidx/fragment/app/DefaultSpecialEffectsController$1;

    invoke-direct {v7, p0, v10, v4}, Landroidx/fragment/app/DefaultSpecialEffectsController$1;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Ljava/util/List;Landroidx/fragment/app/SpecialEffectsController$Operation;)V

    invoke-virtual {v4, v7}, Landroidx/fragment/app/SpecialEffectsController$Operation;->addCompletionListener(Ljava/lang/Runnable;)V

    .line 112
    .end local v4    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .end local v5    # "animCancellationSignal":Landroidx/core/os/CancellationSignal;
    .end local v6    # "transitionCancellationSignal":Landroidx/core/os/CancellationSignal;
    goto :goto_2

    .line 115
    :cond_4
    move-object v3, p0

    move-object v4, v9

    move-object v5, v10

    move v6, p2

    move-object v7, v0

    move-object v8, v1

    invoke-direct/range {v3 .. v8}, Landroidx/fragment/app/DefaultSpecialEffectsController;->startTransitions(Ljava/util/List;Ljava/util/List;ZLandroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/fragment/app/SpecialEffectsController$Operation;)Ljava/util/Map;

    move-result-object v3

    .line 117
    .local v3, "startedTransitions":Ljava/util/Map;, "Ljava/util/Map<Landroidx/fragment/app/SpecialEffectsController$Operation;Ljava/lang/Boolean;>;"
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v4

    .line 120
    .local v4, "startedAnyTransition":Z
    invoke-direct {p0, v2, v10, v4, v3}, Landroidx/fragment/app/DefaultSpecialEffectsController;->startAnimations(Ljava/util/List;Ljava/util/List;ZLjava/util/Map;)V

    .line 123
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 124
    .local v6, "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    invoke-virtual {p0, v6}, Landroidx/fragment/app/DefaultSpecialEffectsController;->applyContainerChanges(Landroidx/fragment/app/SpecialEffectsController$Operation;)V

    .line 125
    .end local v6    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    goto :goto_5

    .line 126
    :cond_5
    invoke-interface {v10}, Ljava/util/List;->clear()V

    .line 127
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method findNamedViews(Ljava/util/Map;Landroid/view/View;)V
    .locals 6
    .param p2, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 724
    .local p1, "namedViews":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroid/view/View;>;"
    invoke-static {p2}, Landroidx/core/view/ViewCompat;->getTransitionName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v0

    .line 725
    .local v0, "transitionName":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 726
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 728
    :cond_0
    instance-of v1, p2, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    .line 729
    move-object v1, p2

    check-cast v1, Landroid/view/ViewGroup;

    .line 730
    .local v1, "viewGroup":Landroid/view/ViewGroup;
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    .line 731
    .local v2, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_2

    .line 732
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 733
    .local v4, "child":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_1

    .line 734
    invoke-virtual {p0, p1, v4}, Landroidx/fragment/app/DefaultSpecialEffectsController;->findNamedViews(Ljava/util/Map;Landroid/view/View;)V

    .line 731
    .end local v4    # "child":Landroid/view/View;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 738
    .end local v1    # "viewGroup":Landroid/view/ViewGroup;
    .end local v2    # "count":I
    .end local v3    # "i":I
    :cond_2
    return-void
.end method

.method retainMatchingViews(Landroidx/collection/ArrayMap;Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/collection/ArrayMap<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 679
    .local p1, "sharedElementViews":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    .local p2, "transitionNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-virtual {p1}, Landroidx/collection/ArrayMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 680
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Landroid/view/View;>;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 681
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 682
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/view/View;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-static {v2}, Landroidx/core/view/ViewCompat;->getTransitionName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 683
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 685
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/view/View;>;"
    :cond_0
    goto :goto_0

    .line 686
    :cond_1
    return-void
.end method
