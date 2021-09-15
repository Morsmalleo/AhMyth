.class final Lcom/google/android/material/transition/platform/SlideDistanceProvider$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SlideDistanceProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/transition/platform/SlideDistanceProvider;->createTranslationXAnimator(Landroid/view/View;FFF)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$originalTranslation:F

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;F)V
    .locals 0

    .line 202
    iput-object p1, p0, Lcom/google/android/material/transition/platform/SlideDistanceProvider$1;->val$view:Landroid/view/View;

    iput p2, p0, Lcom/google/android/material/transition/platform/SlideDistanceProvider$1;->val$originalTranslation:F

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .line 205
    iget-object v0, p0, Lcom/google/android/material/transition/platform/SlideDistanceProvider$1;->val$view:Landroid/view/View;

    iget v1, p0, Lcom/google/android/material/transition/platform/SlideDistanceProvider$1;->val$originalTranslation:F

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 206
    return-void
.end method
