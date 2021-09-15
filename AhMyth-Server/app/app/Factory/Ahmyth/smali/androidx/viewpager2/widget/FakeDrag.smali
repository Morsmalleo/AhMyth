.class final Landroidx/viewpager2/widget/FakeDrag;
.super Ljava/lang/Object;
.source "FakeDrag.java"


# instance fields
.field private mActualDraggedDistance:I

.field private mFakeDragBeginTime:J

.field private mMaximumVelocity:I

.field private final mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private mRequestedDragDistance:F

.field private final mScrollEventAdapter:Landroidx/viewpager2/widget/ScrollEventAdapter;

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private final mViewPager:Landroidx/viewpager2/widget/ViewPager2;


# direct methods
.method constructor <init>(Landroidx/viewpager2/widget/ViewPager2;Landroidx/viewpager2/widget/ScrollEventAdapter;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0
    .param p1, "viewPager"    # Landroidx/viewpager2/widget/ViewPager2;
    .param p2, "scrollEventAdapter"    # Landroidx/viewpager2/widget/ScrollEventAdapter;
    .param p3, "recyclerView"    # Landroidx/recyclerview/widget/RecyclerView;

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Landroidx/viewpager2/widget/FakeDrag;->mViewPager:Landroidx/viewpager2/widget/ViewPager2;

    .line 46
    iput-object p2, p0, Landroidx/viewpager2/widget/FakeDrag;->mScrollEventAdapter:Landroidx/viewpager2/widget/ScrollEventAdapter;

    .line 47
    iput-object p3, p0, Landroidx/viewpager2/widget/FakeDrag;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 48
    return-void
.end method

.method private addFakeMotionEvent(JIFF)V
    .locals 8
    .param p1, "time"    # J
    .param p3, "action"    # I
    .param p4, "x"    # F
    .param p5, "y"    # F

    .line 134
    iget-wide v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mFakeDragBeginTime:J

    const/4 v7, 0x0

    move-wide v2, p1

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    .line 135
    .local v0, "ev":Landroid/view/MotionEvent;
    iget-object v1, p0, Landroidx/viewpager2/widget/FakeDrag;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1, v0}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 136
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 137
    return-void
.end method

.method private beginFakeVelocityTracker()V
    .locals 2

    .line 124
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_0

    .line 125
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 126
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mViewPager:Landroidx/viewpager2/widget/ViewPager2;

    invoke-virtual {v0}, Landroidx/viewpager2/widget/ViewPager2;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 127
    .local v0, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v1

    iput v1, p0, Landroidx/viewpager2/widget/FakeDrag;->mMaximumVelocity:I

    .line 128
    .end local v0    # "configuration":Landroid/view/ViewConfiguration;
    goto :goto_0

    .line 129
    :cond_0
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 131
    :goto_0
    return-void
.end method


# virtual methods
.method beginFakeDrag()Z
    .locals 7

    .line 56
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mScrollEventAdapter:Landroidx/viewpager2/widget/ScrollEventAdapter;

    invoke-virtual {v0}, Landroidx/viewpager2/widget/ScrollEventAdapter;->isDragging()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 57
    return v1

    .line 59
    :cond_0
    iput v1, p0, Landroidx/viewpager2/widget/FakeDrag;->mActualDraggedDistance:I

    int-to-float v0, v1

    iput v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mRequestedDragDistance:F

    .line 60
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mFakeDragBeginTime:J

    .line 61
    invoke-direct {p0}, Landroidx/viewpager2/widget/FakeDrag;->beginFakeVelocityTracker()V

    .line 63
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mScrollEventAdapter:Landroidx/viewpager2/widget/ScrollEventAdapter;

    invoke-virtual {v0}, Landroidx/viewpager2/widget/ScrollEventAdapter;->notifyBeginFakeDrag()V

    .line 64
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mScrollEventAdapter:Landroidx/viewpager2/widget/ScrollEventAdapter;

    invoke-virtual {v0}, Landroidx/viewpager2/widget/ScrollEventAdapter;->isIdle()Z

    move-result v0

    if-nez v0, :cond_1

    .line 66
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V

    .line 68
    :cond_1
    iget-wide v2, p0, Landroidx/viewpager2/widget/FakeDrag;->mFakeDragBeginTime:J

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Landroidx/viewpager2/widget/FakeDrag;->addFakeMotionEvent(JIFF)V

    .line 69
    const/4 v0, 0x1

    return v0
.end method

.method endFakeDrag()Z
    .locals 5

    .line 102
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mScrollEventAdapter:Landroidx/viewpager2/widget/ScrollEventAdapter;

    invoke-virtual {v0}, Landroidx/viewpager2/widget/ScrollEventAdapter;->isFakeDragging()Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    const/4 v0, 0x0

    return v0

    .line 107
    :cond_0
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mScrollEventAdapter:Landroidx/viewpager2/widget/ScrollEventAdapter;

    invoke-virtual {v0}, Landroidx/viewpager2/widget/ScrollEventAdapter;->notifyEndFakeDrag()V

    .line 110
    const/16 v0, 0x3e8

    .line 111
    .local v0, "pixelsPerSecond":I
    iget-object v1, p0, Landroidx/viewpager2/widget/FakeDrag;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 112
    .local v1, "velocityTracker":Landroid/view/VelocityTracker;
    const/16 v2, 0x3e8

    iget v3, p0, Landroidx/viewpager2/widget/FakeDrag;->mMaximumVelocity:I

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 113
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v2

    float-to-int v2, v2

    .line 114
    .local v2, "xVelocity":I
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v3

    float-to-int v3, v3

    .line 116
    .local v3, "yVelocity":I
    iget-object v4, p0, Landroidx/viewpager2/widget/FakeDrag;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v4, v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->fling(II)Z

    move-result v4

    if-nez v4, :cond_1

    .line 118
    iget-object v4, p0, Landroidx/viewpager2/widget/FakeDrag;->mViewPager:Landroidx/viewpager2/widget/ViewPager2;

    invoke-virtual {v4}, Landroidx/viewpager2/widget/ViewPager2;->snapToPage()V

    .line 120
    :cond_1
    const/4 v4, 0x1

    return v4
.end method

.method fakeDragBy(F)Z
    .locals 13
    .param p1, "offsetPxFloat"    # F

    .line 74
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mScrollEventAdapter:Landroidx/viewpager2/widget/ScrollEventAdapter;

    invoke-virtual {v0}, Landroidx/viewpager2/widget/ScrollEventAdapter;->isFakeDragging()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 77
    return v1

    .line 80
    :cond_0
    iget v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mRequestedDragDistance:F

    sub-float/2addr v0, p1

    iput v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mRequestedDragDistance:F

    .line 82
    iget v2, p0, Landroidx/viewpager2/widget/FakeDrag;->mActualDraggedDistance:I

    int-to-float v2, v2

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 84
    .local v0, "offsetPx":I
    iget v2, p0, Landroidx/viewpager2/widget/FakeDrag;->mActualDraggedDistance:I

    add-int/2addr v2, v0

    iput v2, p0, Landroidx/viewpager2/widget/FakeDrag;->mActualDraggedDistance:I

    .line 85
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    .line 87
    .local v9, "time":J
    iget-object v2, p0, Landroidx/viewpager2/widget/FakeDrag;->mViewPager:Landroidx/viewpager2/widget/ViewPager2;

    invoke-virtual {v2}, Landroidx/viewpager2/widget/ViewPager2;->getOrientation()I

    move-result v2

    const/4 v11, 0x1

    if-nez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 89
    .local v2, "isHorizontal":Z
    :goto_0
    if-eqz v2, :cond_2

    move v3, v0

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    :goto_1
    move v12, v3

    .line 90
    .local v12, "offsetX":I
    if-eqz v2, :cond_3

    goto :goto_2

    :cond_3
    move v1, v0

    .line 92
    .local v1, "offsetY":I
    :goto_2
    const/4 v3, 0x0

    if-eqz v2, :cond_4

    iget v4, p0, Landroidx/viewpager2/widget/FakeDrag;->mRequestedDragDistance:F

    move v7, v4

    goto :goto_3

    :cond_4
    const/4 v7, 0x0

    .line 93
    .local v7, "x":F
    :goto_3
    if-eqz v2, :cond_5

    const/4 v8, 0x0

    goto :goto_4

    :cond_5
    iget v3, p0, Landroidx/viewpager2/widget/FakeDrag;->mRequestedDragDistance:F

    move v8, v3

    .line 95
    .local v8, "y":F
    :goto_4
    iget-object v3, p0, Landroidx/viewpager2/widget/FakeDrag;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3, v12, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 96
    const/4 v6, 0x2

    move-object v3, p0

    move-wide v4, v9

    invoke-direct/range {v3 .. v8}, Landroidx/viewpager2/widget/FakeDrag;->addFakeMotionEvent(JIFF)V

    .line 97
    return v11
.end method

.method isFakeDragging()Z
    .locals 1

    .line 51
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mScrollEventAdapter:Landroidx/viewpager2/widget/ScrollEventAdapter;

    invoke-virtual {v0}, Landroidx/viewpager2/widget/ScrollEventAdapter;->isFakeDragging()Z

    move-result v0

    return v0
.end method
