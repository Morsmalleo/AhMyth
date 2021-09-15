.class Lcom/google/android/material/tabs/ElasticTabIndicatorInterpolator;
.super Lcom/google/android/material/tabs/TabIndicatorInterpolator;
.source "ElasticTabIndicatorInterpolator.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/google/android/material/tabs/TabIndicatorInterpolator;-><init>()V

    return-void
.end method

.method private static accInterp(F)F
    .locals 4
    .param p0, "fraction"    # F

    .line 43
    float-to-double v0, p0

    const-wide v2, 0x400921fb54442d18L    # Math.PI

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v2, v0

    double-to-float v0, v2

    return v0
.end method

.method private static decInterp(F)F
    .locals 4
    .param p0, "fraction"    # F

    .line 37
    float-to-double v0, p0

    const-wide v2, 0x400921fb54442d18L    # Math.PI

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method


# virtual methods
.method setIndicatorBoundsForOffset(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;Landroid/view/View;FLandroid/graphics/drawable/Drawable;)V
    .locals 9
    .param p1, "tabLayout"    # Lcom/google/android/material/tabs/TabLayout;
    .param p2, "startTitle"    # Landroid/view/View;
    .param p3, "endTitle"    # Landroid/view/View;
    .param p4, "offset"    # F
    .param p5, "indicator"    # Landroid/graphics/drawable/Drawable;

    .line 55
    invoke-static {p1, p2}, Lcom/google/android/material/tabs/ElasticTabIndicatorInterpolator;->calculateIndicatorWidthForTab(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;)Landroid/graphics/RectF;

    move-result-object v0

    .line 56
    .local v0, "startIndicator":Landroid/graphics/RectF;
    invoke-static {p1, p3}, Lcom/google/android/material/tabs/ElasticTabIndicatorInterpolator;->calculateIndicatorWidthForTab(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;)Landroid/graphics/RectF;

    move-result-object v1

    .line 61
    .local v1, "endIndicator":Landroid/graphics/RectF;
    iget v2, v0, Landroid/graphics/RectF;->left:F

    iget v3, v1, Landroid/graphics/RectF;->left:F

    cmpg-float v2, v2, v3

    if-gez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 66
    .local v2, "isMovingRight":Z
    :goto_0
    if-eqz v2, :cond_1

    .line 67
    invoke-static {p4}, Lcom/google/android/material/tabs/ElasticTabIndicatorInterpolator;->accInterp(F)F

    move-result v3

    .line 68
    .local v3, "leftFraction":F
    invoke-static {p4}, Lcom/google/android/material/tabs/ElasticTabIndicatorInterpolator;->decInterp(F)F

    move-result v4

    .local v4, "rightFraction":F
    goto :goto_1

    .line 70
    .end local v3    # "leftFraction":F
    .end local v4    # "rightFraction":F
    :cond_1
    invoke-static {p4}, Lcom/google/android/material/tabs/ElasticTabIndicatorInterpolator;->decInterp(F)F

    move-result v3

    .line 71
    .restart local v3    # "leftFraction":F
    invoke-static {p4}, Lcom/google/android/material/tabs/ElasticTabIndicatorInterpolator;->accInterp(F)F

    move-result v4

    .line 73
    .restart local v4    # "rightFraction":F
    :goto_1
    iget v5, v0, Landroid/graphics/RectF;->left:F

    float-to-int v5, v5

    iget v6, v1, Landroid/graphics/RectF;->left:F

    float-to-int v6, v6

    .line 74
    invoke-static {v5, v6, v3}, Lcom/google/android/material/animation/AnimationUtils;->lerp(IIF)I

    move-result v5

    .line 75
    invoke-virtual {p5}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v6

    iget v6, v6, Landroid/graphics/Rect;->top:I

    iget v7, v0, Landroid/graphics/RectF;->right:F

    float-to-int v7, v7

    iget v8, v1, Landroid/graphics/RectF;->right:F

    float-to-int v8, v8

    .line 76
    invoke-static {v7, v8, v4}, Lcom/google/android/material/animation/AnimationUtils;->lerp(IIF)I

    move-result v7

    .line 77
    invoke-virtual {p5}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v8

    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    .line 73
    invoke-virtual {p5, v5, v6, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 78
    return-void
.end method
