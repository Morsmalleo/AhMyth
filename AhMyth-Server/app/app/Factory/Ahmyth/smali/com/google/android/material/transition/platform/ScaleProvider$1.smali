.class final Lcom/google/android/material/transition/platform/ScaleProvider$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ScaleProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/transition/platform/ScaleProvider;->createScaleAnimator(Landroid/view/View;FF)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$originalScaleX:F

.field final synthetic val$originalScaleY:F

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;FF)V
    .locals 0

    .line 187
    iput-object p1, p0, Lcom/google/android/material/transition/platform/ScaleProvider$1;->val$view:Landroid/view/View;

    iput p2, p0, Lcom/google/android/material/transition/platform/ScaleProvider$1;->val$originalScaleX:F

    iput p3, p0, Lcom/google/android/material/transition/platform/ScaleProvider$1;->val$originalScaleY:F

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .line 190
    iget-object v0, p0, Lcom/google/android/material/transition/platform/ScaleProvider$1;->val$view:Landroid/view/View;

    iget v1, p0, Lcom/google/android/material/transition/platform/ScaleProvider$1;->val$originalScaleX:F

    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 191
    iget-object v0, p0, Lcom/google/android/material/transition/platform/ScaleProvider$1;->val$view:Landroid/view/View;

    iget v1, p0, Lcom/google/android/material/transition/platform/ScaleProvider$1;->val$originalScaleY:F

    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 192
    return-void
.end method
