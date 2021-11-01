.class Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;
.super Ljava/lang/Object;
.source "AutoScrollHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/widget/AutoScrollHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ClampedScroller"
.end annotation


# instance fields
.field private mDeltaTime:J

.field private mDeltaX:I

.field private mDeltaY:I

.field private mEffectiveRampDown:I

.field private mRampDownDuration:I

.field private mRampUpDuration:I

.field private mStartTime:J

.field private mStopTime:J

.field private mStopValue:F

.field private mTargetVelocityX:F

.field private mTargetVelocityY:F


# direct methods
.method constructor <init>()V
    .locals 2

    .line 756
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/high16 v0, -0x8000000000000000L

    .line 757
    iput-wide v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mStartTime:J

    const-wide/16 v0, -0x1

    .line 758
    iput-wide v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mStopTime:J

    const-wide/16 v0, 0x0

    .line 759
    iput-wide v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mDeltaTime:J

    const/4 v0, 0x0

    .line 760
    iput v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mDeltaX:I

    .line 761
    iput v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mDeltaY:I

    return-void
.end method

.method private getValueAt(J)F
    .locals 9

    .line 800
    iget-wide v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mStartTime:J

    const/4 v2, 0x0

    cmp-long v3, p1, v0

    if-gez v3, :cond_0

    return v2

    .line 802
    :cond_0
    iget-wide v3, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mStopTime:J

    const-wide/16 v5, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    cmp-long v8, v3, v5

    if-ltz v8, :cond_2

    cmp-long v5, p1, v3

    if-gez v5, :cond_1

    goto :goto_0

    :cond_1
    sub-long/2addr p1, v3

    .line 807
    iget v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mStopValue:F

    sub-float v1, v7, v0

    long-to-float p1, p1

    iget p2, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mEffectiveRampDown:I

    int-to-float p2, p2

    div-float/2addr p1, p2

    .line 808
    invoke-static {p1, v2, v7}, Landroid/support/v4/widget/AutoScrollHelper;->constrain(FFF)F

    move-result p1

    mul-float v0, v0, p1

    add-float/2addr v1, v0

    return v1

    :cond_2
    :goto_0
    sub-long/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    long-to-float p1, p1

    .line 804
    iget p2, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mRampUpDuration:I

    int-to-float p2, p2

    div-float/2addr p1, p2

    invoke-static {p1, v2, v7}, Landroid/support/v4/widget/AutoScrollHelper;->constrain(FFF)F

    move-result p1

    mul-float p1, p1, v0

    return p1
.end method

.method private interpolateValue(F)F
    .locals 2

    const/high16 v0, -0x3f800000    # -4.0f

    mul-float v0, v0, p1

    mul-float v0, v0, p1

    const/high16 v1, 0x40800000    # 4.0f

    mul-float p1, p1, v1

    add-float/2addr v0, p1

    return v0
.end method


# virtual methods
.method public computeScrollDelta()V
    .locals 5

    .line 831
    iget-wide v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mDeltaTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 835
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    .line 836
    invoke-direct {p0, v0, v1}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->getValueAt(J)F

    move-result v2

    .line 837
    invoke-direct {p0, v2}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->interpolateValue(F)F

    move-result v2

    .line 838
    iget-wide v3, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mDeltaTime:J

    sub-long v3, v0, v3

    .line 840
    iput-wide v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mDeltaTime:J

    long-to-float v0, v3

    mul-float v0, v0, v2

    .line 841
    iget v1, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mTargetVelocityX:F

    mul-float v1, v1, v0

    float-to-int v1, v1

    iput v1, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mDeltaX:I

    .line 842
    iget v1, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mTargetVelocityY:F

    mul-float v0, v0, v1

    float-to-int v0, v0

    iput v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mDeltaY:I

    return-void

    .line 832
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Cannot compute scroll delta before calling start()"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDeltaX()I
    .locals 1

    .line 869
    iget v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mDeltaX:I

    return v0
.end method

.method public getDeltaY()I
    .locals 1

    .line 877
    iget v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mDeltaY:I

    return v0
.end method

.method public getHorizontalDirection()I
    .locals 2

    .line 857
    iget v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mTargetVelocityX:F

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v1

    div-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public getVerticalDirection()I
    .locals 2

    .line 861
    iget v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mTargetVelocityY:F

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v1

    div-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public isFinished()Z
    .locals 6

    .line 795
    iget-wide v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mStopTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 796
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mStopTime:J

    iget v4, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mEffectiveRampDown:I

    int-to-long v4, v4

    add-long/2addr v2, v4

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public requestStop()V
    .locals 5

    .line 788
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    .line 789
    iget-wide v2, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mStartTime:J

    sub-long v2, v0, v2

    long-to-int v3, v2

    iget v2, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mRampDownDuration:I

    const/4 v4, 0x0

    invoke-static {v3, v4, v2}, Landroid/support/v4/widget/AutoScrollHelper;->constrain(III)I

    move-result v2

    iput v2, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mEffectiveRampDown:I

    .line 790
    invoke-direct {p0, v0, v1}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->getValueAt(J)F

    move-result v2

    iput v2, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mStopValue:F

    .line 791
    iput-wide v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mStopTime:J

    return-void
.end method

.method public setRampDownDuration(I)V
    .locals 0

    .line 769
    iput p1, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mRampDownDuration:I

    return-void
.end method

.method public setRampUpDuration(I)V
    .locals 0

    .line 765
    iput p1, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mRampUpDuration:I

    return-void
.end method

.method public setTargetVelocity(FF)V
    .locals 0

    .line 852
    iput p1, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mTargetVelocityX:F

    .line 853
    iput p2, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mTargetVelocityY:F

    return-void
.end method

.method public start()V
    .locals 4

    .line 776
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mStartTime:J

    const-wide/16 v2, -0x1

    .line 777
    iput-wide v2, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mStopTime:J

    .line 778
    iput-wide v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mDeltaTime:J

    const/high16 v0, 0x3f000000    # 0.5f

    .line 779
    iput v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mStopValue:F

    const/4 v0, 0x0

    .line 780
    iput v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mDeltaX:I

    .line 781
    iput v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->mDeltaY:I

    return-void
.end method
