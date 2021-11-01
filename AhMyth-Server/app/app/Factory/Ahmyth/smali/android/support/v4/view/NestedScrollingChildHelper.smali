.class public Landroid/support/v4/view/NestedScrollingChildHelper;
.super Ljava/lang/Object;
.source "NestedScrollingChildHelper.java"


# instance fields
.field private mIsNestedScrollingEnabled:Z

.field private mNestedScrollingParentNonTouch:Landroid/view/ViewParent;

.field private mNestedScrollingParentTouch:Landroid/view/ViewParent;

.field private mTempNestedScrollConsumed:[I

.field private final mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    return-void
.end method

.method private getNestedScrollingParentForType(I)Landroid/view/ViewParent;
    .locals 1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 387
    :cond_0
    iget-object p1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParentNonTouch:Landroid/view/ViewParent;

    return-object p1

    .line 385
    :cond_1
    iget-object p1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParentTouch:Landroid/view/ViewParent;

    return-object p1
.end method

.method private setNestedScrollingParentForType(ILandroid/view/ViewParent;)V
    .locals 1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 398
    :cond_0
    iput-object p2, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParentNonTouch:Landroid/view/ViewParent;

    goto :goto_0

    .line 395
    :cond_1
    iput-object p2, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mNestedScrollingParentTouch:Landroid/view/ViewParent;

    :goto_0
    return-void
.end method


# virtual methods
.method public dispatchNestedFling(FFZ)Z
    .locals 2

    .line 327
    invoke-virtual {p0}, Landroid/support/v4/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 328
    invoke-direct {p0, v1}, Landroid/support/v4/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 330
    iget-object v1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v1, p1, p2, p3}, Landroid/support/v4/view/ViewParentCompat;->onNestedFling(Landroid/view/ViewParent;Landroid/view/View;FFZ)Z

    move-result p1

    return p1

    :cond_0
    return v1
.end method

.method public dispatchNestedPreFling(FF)Z
    .locals 2

    .line 347
    invoke-virtual {p0}, Landroid/support/v4/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 348
    invoke-direct {p0, v1}, Landroid/support/v4/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 350
    iget-object v1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v1, p1, p2}, Landroid/support/v4/view/ViewParentCompat;->onNestedPreFling(Landroid/view/ViewParent;Landroid/view/View;FF)Z

    move-result p1

    return p1

    :cond_0
    return v1
.end method

.method public dispatchNestedPreScroll(II[I[I)Z
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 264
    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/view/NestedScrollingChildHelper;->dispatchNestedPreScroll(II[I[II)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedPreScroll(II[I[II)Z
    .locals 10

    .line 278
    invoke-virtual {p0}, Landroid/support/v4/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    .line 279
    invoke-direct {p0, p5}, Landroid/support/v4/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v2

    if-nez v2, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x1

    if-nez p1, :cond_2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    if-eqz p4, :cond_8

    .line 310
    aput v1, p4, v1

    .line 311
    aput v1, p4, v0

    goto :goto_2

    :cond_2
    :goto_0
    if-eqz p4, :cond_3

    .line 288
    iget-object v3, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v3, p4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 289
    aget v3, p4, v1

    .line 290
    aget v4, p4, v0

    move v8, v3

    move v9, v4

    goto :goto_1

    :cond_3
    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_1
    if-nez p3, :cond_5

    .line 294
    iget-object p3, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mTempNestedScrollConsumed:[I

    if-nez p3, :cond_4

    const/4 p3, 0x2

    new-array p3, p3, [I

    .line 295
    iput-object p3, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mTempNestedScrollConsumed:[I

    .line 297
    :cond_4
    iget-object p3, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mTempNestedScrollConsumed:[I

    .line 299
    :cond_5
    aput v1, p3, v1

    .line 300
    aput v1, p3, v0

    .line 301
    iget-object v3, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    move v4, p1

    move v5, p2

    move-object v6, p3

    move v7, p5

    invoke-static/range {v2 .. v7}, Landroid/support/v4/view/ViewParentCompat;->onNestedPreScroll(Landroid/view/ViewParent;Landroid/view/View;II[II)V

    if-eqz p4, :cond_6

    .line 304
    iget-object p1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {p1, p4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 305
    aget p1, p4, v1

    sub-int/2addr p1, v8

    aput p1, p4, v1

    .line 306
    aget p1, p4, v0

    sub-int/2addr p1, v9

    aput p1, p4, v0

    .line 308
    :cond_6
    aget p1, p3, v1

    if-nez p1, :cond_7

    aget p1, p3, v0

    if-eqz p1, :cond_8

    :cond_7
    const/4 v1, 0x1

    :cond_8
    :goto_2
    return v1
.end method

.method public dispatchNestedScroll(IIII[I)Z
    .locals 7

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    .line 204
    invoke-virtual/range {v0 .. v6}, Landroid/support/v4/view/NestedScrollingChildHelper;->dispatchNestedScroll(IIII[II)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedScroll(IIII[II)Z
    .locals 14

    move-object v0, p0

    move-object/from16 v1, p5

    .line 220
    invoke-virtual {p0}, Landroid/support/v4/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_5

    move/from16 v2, p6

    .line 221
    invoke-direct {p0, v2}, Landroid/support/v4/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v4

    if-nez v4, :cond_0

    return v3

    :cond_0
    const/4 v11, 0x1

    if-nez p1, :cond_2

    if-nez p2, :cond_2

    if-nez p3, :cond_2

    if-eqz p4, :cond_1

    goto :goto_0

    :cond_1
    if-eqz v1, :cond_5

    .line 246
    aput v3, v1, v3

    .line 247
    aput v3, v1, v11

    goto :goto_2

    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    .line 230
    iget-object v5, v0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v5, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 231
    aget v5, v1, v3

    .line 232
    aget v6, v1, v11

    move v12, v5

    move v13, v6

    goto :goto_1

    :cond_3
    const/4 v12, 0x0

    const/4 v13, 0x0

    .line 235
    :goto_1
    iget-object v5, v0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    move v6, p1

    move/from16 v7, p2

    move/from16 v8, p3

    move/from16 v9, p4

    move/from16 v10, p6

    invoke-static/range {v4 .. v10}, Landroid/support/v4/view/ViewParentCompat;->onNestedScroll(Landroid/view/ViewParent;Landroid/view/View;IIIII)V

    if-eqz v1, :cond_4

    .line 239
    iget-object v2, v0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 240
    aget v2, v1, v3

    sub-int/2addr v2, v12

    aput v2, v1, v3

    .line 241
    aget v2, v1, v11

    sub-int/2addr v2, v13

    aput v2, v1, v11

    :cond_4
    return v11

    :cond_5
    :goto_2
    return v3
.end method

.method public hasNestedScrollingParent()Z
    .locals 1

    const/4 v0, 0x0

    .line 100
    invoke-virtual {p0, v0}, Landroid/support/v4/view/NestedScrollingChildHelper;->hasNestedScrollingParent(I)Z

    move-result v0

    return v0
.end method

.method public hasNestedScrollingParent(I)Z
    .locals 0

    .line 114
    invoke-direct {p0, p1}, Landroid/support/v4/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isNestedScrollingEnabled()Z
    .locals 1

    .line 86
    iget-boolean v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mIsNestedScrollingEnabled:Z

    return v0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 366
    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->stopNestedScroll(Landroid/view/View;)V

    return-void
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .locals 0

    .line 379
    iget-object p1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->stopNestedScroll(Landroid/view/View;)V

    return-void
.end method

.method public setNestedScrollingEnabled(Z)V
    .locals 1

    .line 70
    iget-boolean v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mIsNestedScrollingEnabled:Z

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->stopNestedScroll(Landroid/view/View;)V

    .line 73
    :cond_0
    iput-boolean p1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mIsNestedScrollingEnabled:Z

    return-void
.end method

.method public startNestedScroll(I)Z
    .locals 1

    const/4 v0, 0x0

    .line 129
    invoke-virtual {p0, p1, v0}, Landroid/support/v4/view/NestedScrollingChildHelper;->startNestedScroll(II)Z

    move-result p1

    return p1
.end method

.method public startNestedScroll(II)Z
    .locals 4

    .line 145
    invoke-virtual {p0, p2}, Landroid/support/v4/view/NestedScrollingChildHelper;->hasNestedScrollingParent(I)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 149
    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 150
    iget-object v0, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 151
    iget-object v2, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    :goto_0
    if-eqz v0, :cond_3

    .line 153
    iget-object v3, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v2, v3, p1, p2}, Landroid/support/v4/view/ViewParentCompat;->onStartNestedScroll(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 154
    invoke-direct {p0, p2, v0}, Landroid/support/v4/view/NestedScrollingChildHelper;->setNestedScrollingParentForType(ILandroid/view/ViewParent;)V

    .line 155
    iget-object v3, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v2, v3, p1, p2}, Landroid/support/v4/view/ViewParentCompat;->onNestedScrollAccepted(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)V

    return v1

    .line 158
    :cond_1
    instance-of v3, v0, Landroid/view/View;

    if-eqz v3, :cond_2

    .line 159
    move-object v2, v0

    check-cast v2, Landroid/view/View;

    .line 161
    :cond_2
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_0

    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method public stopNestedScroll()V
    .locals 1

    const/4 v0, 0x0

    .line 175
    invoke-virtual {p0, v0}, Landroid/support/v4/view/NestedScrollingChildHelper;->stopNestedScroll(I)V

    return-void
.end method

.method public stopNestedScroll(I)V
    .locals 2

    .line 186
    invoke-direct {p0, p1}, Landroid/support/v4/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 188
    iget-object v1, p0, Landroid/support/v4/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v1, p1}, Landroid/support/v4/view/ViewParentCompat;->onStopNestedScroll(Landroid/view/ViewParent;Landroid/view/View;I)V

    const/4 v0, 0x0

    .line 189
    invoke-direct {p0, p1, v0}, Landroid/support/v4/view/NestedScrollingChildHelper;->setNestedScrollingParentForType(ILandroid/view/ViewParent;)V

    :cond_0
    return-void
.end method
