.class Lcom/google/android/material/tabs/TabIndicatorInterpolator;
.super Ljava/lang/Object;
.source "TabIndicatorInterpolator.java"


# static fields
.field private static final MIN_INDICATOR_WIDTH:I = 0x18


# direct methods
.method constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static calculateIndicatorWidthForTab(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;)Landroid/graphics/RectF;
    .locals 5
    .param p0, "tabLayout"    # Lcom/google/android/material/tabs/TabLayout;
    .param p1, "tab"    # Landroid/view/View;

    .line 104
    if-nez p1, :cond_0

    .line 105
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    return-object v0

    .line 109
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->isTabIndicatorFullWidth()Z

    move-result v0

    if-nez v0, :cond_1

    instance-of v0, p1, Lcom/google/android/material/tabs/TabLayout$TabView;

    if-eqz v0, :cond_1

    .line 110
    move-object v0, p1

    check-cast v0, Lcom/google/android/material/tabs/TabLayout$TabView;

    const/16 v1, 0x18

    invoke-static {v0, v1}, Lcom/google/android/material/tabs/TabIndicatorInterpolator;->calculateTabViewContentBounds(Lcom/google/android/material/tabs/TabLayout$TabView;I)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0

    .line 114
    :cond_1
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v4

    int-to-float v4, v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0
.end method

.method static calculateTabViewContentBounds(Lcom/google/android/material/tabs/TabLayout$TabView;I)Landroid/graphics/RectF;
    .locals 14
    .param p0, "tabView"    # Lcom/google/android/material/tabs/TabLayout$TabView;
    .param p1, "minWidth"    # I

    .line 72
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$TabView;->getContentWidth()I

    move-result v0

    .line 73
    .local v0, "tabViewContentWidth":I
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$TabView;->getContentHeight()I

    move-result v1

    .line 74
    .local v1, "tabViewContentHeight":I
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$TabView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/google/android/material/internal/ViewUtils;->dpToPx(Landroid/content/Context;I)F

    move-result v2

    float-to-int v2, v2

    .line 76
    .local v2, "minWidthPx":I
    if-ge v0, v2, :cond_0

    .line 77
    move v0, v2

    .line 80
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$TabView;->getLeft()I

    move-result v3

    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$TabView;->getRight()I

    move-result v4

    add-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    .line 81
    .local v3, "tabViewCenterX":I
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$TabView;->getTop()I

    move-result v4

    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$TabView;->getBottom()I

    move-result v5

    add-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    .line 82
    .local v4, "tabViewCenterY":I
    div-int/lit8 v5, v0, 0x2

    sub-int v5, v3, v5

    .line 83
    .local v5, "contentLeftBounds":I
    div-int/lit8 v6, v1, 0x2

    sub-int v6, v4, v6

    .line 84
    .local v6, "contentTopBounds":I
    div-int/lit8 v7, v0, 0x2

    add-int/2addr v7, v3

    .line 85
    .local v7, "contentRightBounds":I
    div-int/lit8 v8, v3, 0x2

    add-int/2addr v8, v4

    .line 87
    .local v8, "contentBottomBounds":I
    new-instance v9, Landroid/graphics/RectF;

    int-to-float v10, v5

    int-to-float v11, v6

    int-to-float v12, v7

    int-to-float v13, v8

    invoke-direct {v9, v10, v11, v12, v13}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v9
.end method


# virtual methods
.method setIndicatorBoundsForOffset(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;Landroid/view/View;FLandroid/graphics/drawable/Drawable;)V
    .locals 6
    .param p1, "tabLayout"    # Lcom/google/android/material/tabs/TabLayout;
    .param p2, "startTitle"    # Landroid/view/View;
    .param p3, "endTitle"    # Landroid/view/View;
    .param p4, "offset"    # F
    .param p5, "indicator"    # Landroid/graphics/drawable/Drawable;

    .line 161
    invoke-static {p1, p2}, Lcom/google/android/material/tabs/TabIndicatorInterpolator;->calculateIndicatorWidthForTab(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;)Landroid/graphics/RectF;

    move-result-object v0

    .line 164
    .local v0, "startIndicator":Landroid/graphics/RectF;
    invoke-static {p1, p3}, Lcom/google/android/material/tabs/TabIndicatorInterpolator;->calculateIndicatorWidthForTab(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;)Landroid/graphics/RectF;

    move-result-object v1

    .line 165
    .local v1, "endIndicator":Landroid/graphics/RectF;
    iget v2, v0, Landroid/graphics/RectF;->left:F

    float-to-int v2, v2

    iget v3, v1, Landroid/graphics/RectF;->left:F

    float-to-int v3, v3

    .line 166
    invoke-static {v2, v3, p4}, Lcom/google/android/material/animation/AnimationUtils;->lerp(IIF)I

    move-result v2

    .line 167
    invoke-virtual {p5}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->top:I

    iget v4, v0, Landroid/graphics/RectF;->right:F

    float-to-int v4, v4

    iget v5, v1, Landroid/graphics/RectF;->right:F

    float-to-int v5, v5

    .line 168
    invoke-static {v4, v5, p4}, Lcom/google/android/material/animation/AnimationUtils;->lerp(IIF)I

    move-result v4

    .line 169
    invoke-virtual {p5}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    .line 165
    invoke-virtual {p5, v2, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 170
    return-void
.end method

.method setIndicatorBoundsForTab(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .locals 5
    .param p1, "tabLayout"    # Lcom/google/android/material/tabs/TabLayout;
    .param p2, "tab"    # Landroid/view/View;
    .param p3, "indicator"    # Landroid/graphics/drawable/Drawable;

    .line 129
    invoke-static {p1, p2}, Lcom/google/android/material/tabs/TabIndicatorInterpolator;->calculateIndicatorWidthForTab(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;)Landroid/graphics/RectF;

    move-result-object v0

    .line 130
    .local v0, "startIndicator":Landroid/graphics/RectF;
    iget v1, v0, Landroid/graphics/RectF;->left:F

    float-to-int v1, v1

    .line 132
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    iget v3, v0, Landroid/graphics/RectF;->right:F

    float-to-int v3, v3

    .line 134
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 130
    invoke-virtual {p3, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 135
    return-void
.end method
