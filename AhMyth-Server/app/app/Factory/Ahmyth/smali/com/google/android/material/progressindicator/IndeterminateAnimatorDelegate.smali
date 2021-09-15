.class abstract Lcom/google/android/material/progressindicator/IndeterminateAnimatorDelegate;
.super Ljava/lang/Object;
.source "IndeterminateAnimatorDelegate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/animation/Animator;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected drawable:Lcom/google/android/material/progressindicator/IndeterminateDrawable;

.field protected final segmentColors:[I

.field protected final segmentPositions:[F


# direct methods
.method protected constructor <init>(I)V
    .locals 1
    .param p1, "segmentCount"    # I

    .line 40
    .local p0, "this":Lcom/google/android/material/progressindicator/IndeterminateAnimatorDelegate;, "Lcom/google/android/material/progressindicator/IndeterminateAnimatorDelegate<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    mul-int/lit8 v0, p1, 0x2

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/google/android/material/progressindicator/IndeterminateAnimatorDelegate;->segmentPositions:[F

    .line 42
    new-array v0, p1, [I

    iput-object v0, p0, Lcom/google/android/material/progressindicator/IndeterminateAnimatorDelegate;->segmentColors:[I

    .line 43
    return-void
.end method


# virtual methods
.method abstract cancelAnimatorImmediately()V
.end method

.method protected getFractionInRange(III)F
    .locals 2
    .param p1, "playtime"    # I
    .param p2, "start"    # I
    .param p3, "duration"    # I

    .line 51
    .local p0, "this":Lcom/google/android/material/progressindicator/IndeterminateAnimatorDelegate;, "Lcom/google/android/material/progressindicator/IndeterminateAnimatorDelegate<TT;>;"
    sub-int v0, p1, p2

    int-to-float v0, v0

    int-to-float v1, p3

    div-float/2addr v0, v1

    return v0
.end method

.method public abstract invalidateSpecValues()V
.end method

.method public abstract registerAnimatorsCompleteCallback(Landroidx/vectordrawable/graphics/drawable/Animatable2Compat$AnimationCallback;)V
.end method

.method protected registerDrawable(Lcom/google/android/material/progressindicator/IndeterminateDrawable;)V
    .locals 0
    .param p1, "drawable"    # Lcom/google/android/material/progressindicator/IndeterminateDrawable;

    .line 47
    .local p0, "this":Lcom/google/android/material/progressindicator/IndeterminateAnimatorDelegate;, "Lcom/google/android/material/progressindicator/IndeterminateAnimatorDelegate<TT;>;"
    iput-object p1, p0, Lcom/google/android/material/progressindicator/IndeterminateAnimatorDelegate;->drawable:Lcom/google/android/material/progressindicator/IndeterminateDrawable;

    .line 48
    return-void
.end method

.method abstract requestCancelAnimatorAfterCurrentCycle()V
.end method

.method abstract startAnimator()V
.end method

.method public abstract unregisterAnimatorsCompleteCallback()V
.end method
