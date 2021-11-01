.class public final Landroid/support/v4/widget/ScrollerCompat;
.super Ljava/lang/Object;
.source "ScrollerCompat.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field mScroller:Landroid/widget/OverScroller;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V
    .locals 1

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Landroid/widget/OverScroller;

    if-eqz p2, :cond_0

    invoke-direct {v0, p1, p2}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    goto :goto_0

    :cond_0
    invoke-direct {v0, p1}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;)V

    :goto_0
    iput-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    return-void
.end method

.method public static create(Landroid/content/Context;)Landroid/support/v4/widget/ScrollerCompat;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 41
    invoke-static {p0, v0}, Landroid/support/v4/widget/ScrollerCompat;->create(Landroid/content/Context;Landroid/view/animation/Interpolator;)Landroid/support/v4/widget/ScrollerCompat;

    move-result-object p0

    return-object p0
.end method

.method public static create(Landroid/content/Context;Landroid/view/animation/Interpolator;)Landroid/support/v4/widget/ScrollerCompat;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 49
    new-instance v0, Landroid/support/v4/widget/ScrollerCompat;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/widget/ScrollerCompat;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    return-object v0
.end method


# virtual methods
.method public abortAnimation()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 273
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    return-void
.end method

.method public computeScrollOffset()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 142
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    move-result v0

    return v0
.end method

.method public fling(IIIIIIII)V
    .locals 10
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    move-object v0, p0

    .line 210
    iget-object v1, v0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    invoke-virtual/range {v1 .. v9}, Landroid/widget/OverScroller;->fling(IIIIIIII)V

    return-void
.end method

.method public fling(IIIIIIIIII)V
    .locals 12
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    move-object v0, p0

    .line 242
    iget-object v1, v0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    move v2, p1

    move v3, p2

    move v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    invoke-virtual/range {v1 .. v11}, Landroid/widget/OverScroller;->fling(IIIIIIIIII)V

    return-void
.end method

.method public getCurrVelocity()F
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 130
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrVelocity()F

    move-result v0

    return v0
.end method

.method public getCurrX()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 82
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrX()I

    move-result v0

    return v0
.end method

.method public getCurrY()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 94
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrY()I

    move-result v0

    return v0
.end method

.method public getFinalX()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 104
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getFinalX()I

    move-result v0

    return v0
.end method

.method public getFinalY()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 114
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getFinalY()I

    move-result v0

    return v0
.end method

.method public isFinished()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 70
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v0

    return v0
.end method

.method public isOverScrolled()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 334
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->isOverScrolled()Z

    move-result v0

    return v0
.end method

.method public notifyHorizontalEdgeReached(III)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 294
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/OverScroller;->notifyHorizontalEdgeReached(III)V

    return-void
.end method

.method public notifyVerticalEdgeReached(III)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 314
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/OverScroller;->notifyVerticalEdgeReached(III)V

    return-void
.end method

.method public springBack(IIIIII)Z
    .locals 7
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 262
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Landroid/widget/OverScroller;->springBack(IIIIII)Z

    move-result p1

    return p1
.end method

.method public startScroll(IIII)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 163
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/OverScroller;->startScroll(IIII)V

    return-void
.end method

.method public startScroll(IIIII)V
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 183
    iget-object v0, p0, Landroid/support/v4/widget/ScrollerCompat;->mScroller:Landroid/widget/OverScroller;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    return-void
.end method
