.class Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;
.super Ljava/lang/Object;
.source "AutoScrollHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/widget/AutoScrollHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScrollAnimationRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/widget/AutoScrollHelper;


# direct methods
.method constructor <init>(Landroid/support/v4/widget/AutoScrollHelper;)V
    .locals 0

    .line 695
    iput-object p1, p0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;->this$0:Landroid/support/v4/widget/AutoScrollHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 696
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 700
    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;->this$0:Landroid/support/v4/widget/AutoScrollHelper;

    iget-boolean v0, v0, Landroid/support/v4/widget/AutoScrollHelper;->mAnimating:Z

    if-nez v0, :cond_0

    .line 701
    return-void

    .line 704
    :cond_0
    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;->this$0:Landroid/support/v4/widget/AutoScrollHelper;

    iget-boolean v0, v0, Landroid/support/v4/widget/AutoScrollHelper;->mNeedsReset:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 705
    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;->this$0:Landroid/support/v4/widget/AutoScrollHelper;

    iput-boolean v1, v0, Landroid/support/v4/widget/AutoScrollHelper;->mNeedsReset:Z

    .line 706
    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;->this$0:Landroid/support/v4/widget/AutoScrollHelper;

    iget-object v0, v0, Landroid/support/v4/widget/AutoScrollHelper;->mScroller:Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;

    invoke-virtual {v0}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->start()V

    .line 709
    :cond_1
    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;->this$0:Landroid/support/v4/widget/AutoScrollHelper;

    iget-object v0, v0, Landroid/support/v4/widget/AutoScrollHelper;->mScroller:Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;

    .line 710
    .local v0, "scroller":Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;
    invoke-virtual {v0}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->isFinished()Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;->this$0:Landroid/support/v4/widget/AutoScrollHelper;

    invoke-virtual {v2}, Landroid/support/v4/widget/AutoScrollHelper;->shouldAnimate()Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    .line 715
    :cond_2
    iget-object v2, p0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;->this$0:Landroid/support/v4/widget/AutoScrollHelper;

    iget-boolean v2, v2, Landroid/support/v4/widget/AutoScrollHelper;->mNeedsCancel:Z

    if-eqz v2, :cond_3

    .line 716
    iget-object v2, p0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;->this$0:Landroid/support/v4/widget/AutoScrollHelper;

    iput-boolean v1, v2, Landroid/support/v4/widget/AutoScrollHelper;->mNeedsCancel:Z

    .line 717
    iget-object v1, p0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;->this$0:Landroid/support/v4/widget/AutoScrollHelper;

    invoke-virtual {v1}, Landroid/support/v4/widget/AutoScrollHelper;->cancelTargetTouch()V

    .line 720
    :cond_3
    invoke-virtual {v0}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->computeScrollDelta()V

    .line 722
    invoke-virtual {v0}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->getDeltaX()I

    move-result v1

    .line 723
    .local v1, "deltaX":I
    invoke-virtual {v0}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->getDeltaY()I

    move-result v2

    .line 724
    .local v2, "deltaY":I
    iget-object v3, p0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;->this$0:Landroid/support/v4/widget/AutoScrollHelper;

    invoke-virtual {v3, v1, v2}, Landroid/support/v4/widget/AutoScrollHelper;->scrollTargetBy(II)V

    .line 727
    iget-object v3, p0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;->this$0:Landroid/support/v4/widget/AutoScrollHelper;

    iget-object v3, v3, Landroid/support/v4/widget/AutoScrollHelper;->mTarget:Landroid/view/View;

    invoke-static {v3, p0}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 728
    return-void

    .line 711
    .end local v1    # "deltaX":I
    .end local v2    # "deltaY":I
    :cond_4
    :goto_0
    iget-object v2, p0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;->this$0:Landroid/support/v4/widget/AutoScrollHelper;

    iput-boolean v1, v2, Landroid/support/v4/widget/AutoScrollHelper;->mAnimating:Z

    .line 712
    return-void
.end method
