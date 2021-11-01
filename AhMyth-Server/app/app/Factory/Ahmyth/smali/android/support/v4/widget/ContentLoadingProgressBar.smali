.class public Landroid/support/v4/widget/ContentLoadingProgressBar;
.super Landroid/widget/ProgressBar;
.source "ContentLoadingProgressBar.java"


# static fields
.field private static final MIN_DELAY:I = 0x1f4

.field private static final MIN_SHOW_TIME:I = 0x1f4


# instance fields
.field private final mDelayedHide:Ljava/lang/Runnable;

.field private final mDelayedShow:Ljava/lang/Runnable;

.field mDismissed:Z

.field mPostedHide:Z

.field mPostedShow:Z

.field mStartTime:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 68
    invoke-direct {p0, p1, v0}, Landroid/support/v4/widget/ContentLoadingProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 72
    invoke-direct {p0, p1, p2, v0}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-wide/16 p1, -0x1

    .line 37
    iput-wide p1, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mStartTime:J

    .line 39
    iput-boolean v0, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mPostedHide:Z

    .line 41
    iput-boolean v0, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mPostedShow:Z

    .line 43
    iput-boolean v0, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mDismissed:Z

    .line 45
    new-instance p1, Landroid/support/v4/widget/ContentLoadingProgressBar$1;

    invoke-direct {p1, p0}, Landroid/support/v4/widget/ContentLoadingProgressBar$1;-><init>(Landroid/support/v4/widget/ContentLoadingProgressBar;)V

    iput-object p1, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    .line 55
    new-instance p1, Landroid/support/v4/widget/ContentLoadingProgressBar$2;

    invoke-direct {p1, p0}, Landroid/support/v4/widget/ContentLoadingProgressBar$2;-><init>(Landroid/support/v4/widget/ContentLoadingProgressBar;)V

    iput-object p1, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    return-void
.end method

.method private removeCallbacks()V
    .locals 1

    .line 88
    iget-object v0, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/ContentLoadingProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 89
    iget-object v0, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/ContentLoadingProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public declared-synchronized hide()V
    .locals 10

    monitor-enter p0

    const/4 v0, 0x1

    .line 98
    :try_start_0
    iput-boolean v0, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mDismissed:Z

    .line 99
    iget-object v1, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/ContentLoadingProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v1, 0x0

    .line 100
    iput-boolean v1, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mPostedShow:Z

    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mStartTime:J

    sub-long/2addr v1, v3

    const-wide/16 v5, 0x1f4

    cmp-long v7, v1, v5

    if-gez v7, :cond_1

    const-wide/16 v7, -0x1

    cmp-long v9, v3, v7

    if-nez v9, :cond_0

    goto :goto_0

    .line 111
    :cond_0
    iget-boolean v3, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mPostedHide:Z

    if-nez v3, :cond_2

    .line 112
    iget-object v3, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    sub-long/2addr v5, v1

    invoke-virtual {p0, v3, v5, v6}, Landroid/support/v4/widget/ContentLoadingProgressBar;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 113
    iput-boolean v0, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mPostedHide:Z

    goto :goto_1

    :cond_1
    :goto_0
    const/16 v0, 0x8

    .line 106
    invoke-virtual {p0, v0}, Landroid/support/v4/widget/ContentLoadingProgressBar;->setVisibility(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    :cond_2
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 77
    invoke-super {p0}, Landroid/widget/ProgressBar;->onAttachedToWindow()V

    .line 78
    invoke-direct {p0}, Landroid/support/v4/widget/ContentLoadingProgressBar;->removeCallbacks()V

    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 83
    invoke-super {p0}, Landroid/widget/ProgressBar;->onDetachedFromWindow()V

    .line 84
    invoke-direct {p0}, Landroid/support/v4/widget/ContentLoadingProgressBar;->removeCallbacks()V

    return-void
.end method

.method public declared-synchronized show()V
    .locals 3

    monitor-enter p0

    const-wide/16 v0, -0x1

    .line 124
    :try_start_0
    iput-wide v0, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mStartTime:J

    const/4 v0, 0x0

    .line 125
    iput-boolean v0, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mDismissed:Z

    .line 126
    iget-object v1, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/ContentLoadingProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 127
    iput-boolean v0, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mPostedHide:Z

    .line 128
    iget-boolean v0, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mPostedShow:Z

    if-nez v0, :cond_0

    .line 129
    iget-object v0, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    const-wide/16 v1, 0x1f4

    invoke-virtual {p0, v0, v1, v2}, Landroid/support/v4/widget/ContentLoadingProgressBar;->postDelayed(Ljava/lang/Runnable;J)Z

    const/4 v0, 0x1

    .line 130
    iput-boolean v0, p0, Landroid/support/v4/widget/ContentLoadingProgressBar;->mPostedShow:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 132
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
