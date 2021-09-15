.class final Lcom/google/android/material/transition/platform/TransitionUtils$2;
.super Ljava/lang/Object;
.source "TransitionUtils.java"

# interfaces
.implements Lcom/google/android/material/transition/platform/TransitionUtils$CornerSizeBinaryOperator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/transition/platform/TransitionUtils;->lerp(Lcom/google/android/material/shape/ShapeAppearanceModel;Lcom/google/android/material/shape/ShapeAppearanceModel;Landroid/graphics/RectF;Landroid/graphics/RectF;FFF)Lcom/google/android/material/shape/ShapeAppearanceModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$endBounds:Landroid/graphics/RectF;

.field final synthetic val$endFraction:F

.field final synthetic val$fraction:F

.field final synthetic val$startBounds:Landroid/graphics/RectF;

.field final synthetic val$startFraction:F


# direct methods
.method constructor <init>(Landroid/graphics/RectF;Landroid/graphics/RectF;FFF)V
    .locals 0

    .line 323
    iput-object p1, p0, Lcom/google/android/material/transition/platform/TransitionUtils$2;->val$startBounds:Landroid/graphics/RectF;

    iput-object p2, p0, Lcom/google/android/material/transition/platform/TransitionUtils$2;->val$endBounds:Landroid/graphics/RectF;

    iput p3, p0, Lcom/google/android/material/transition/platform/TransitionUtils$2;->val$startFraction:F

    iput p4, p0, Lcom/google/android/material/transition/platform/TransitionUtils$2;->val$endFraction:F

    iput p5, p0, Lcom/google/android/material/transition/platform/TransitionUtils$2;->val$fraction:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/google/android/material/shape/CornerSize;Lcom/google/android/material/shape/CornerSize;)Lcom/google/android/material/shape/CornerSize;
    .locals 5
    .param p1, "cornerSize1"    # Lcom/google/android/material/shape/CornerSize;
    .param p2, "cornerSize2"    # Lcom/google/android/material/shape/CornerSize;

    .line 328
    iget-object v0, p0, Lcom/google/android/material/transition/platform/TransitionUtils$2;->val$startBounds:Landroid/graphics/RectF;

    invoke-interface {p1, v0}, Lcom/google/android/material/shape/CornerSize;->getCornerSize(Landroid/graphics/RectF;)F

    move-result v0

    .line 329
    .local v0, "startCornerSize":F
    iget-object v1, p0, Lcom/google/android/material/transition/platform/TransitionUtils$2;->val$endBounds:Landroid/graphics/RectF;

    invoke-interface {p2, v1}, Lcom/google/android/material/shape/CornerSize;->getCornerSize(Landroid/graphics/RectF;)F

    move-result v1

    .line 330
    .local v1, "endCornerSize":F
    iget v2, p0, Lcom/google/android/material/transition/platform/TransitionUtils$2;->val$startFraction:F

    iget v3, p0, Lcom/google/android/material/transition/platform/TransitionUtils$2;->val$endFraction:F

    iget v4, p0, Lcom/google/android/material/transition/platform/TransitionUtils$2;->val$fraction:F

    .line 331
    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/material/transition/platform/TransitionUtils;->lerp(FFFFF)F

    move-result v2

    .line 333
    .local v2, "cornerSize":F
    new-instance v3, Lcom/google/android/material/shape/AbsoluteCornerSize;

    invoke-direct {v3, v2}, Lcom/google/android/material/shape/AbsoluteCornerSize;-><init>(F)V

    return-object v3
.end method
