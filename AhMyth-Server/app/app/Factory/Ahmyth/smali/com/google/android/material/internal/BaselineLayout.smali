.class public Lcom/google/android/material/internal/BaselineLayout;
.super Landroid/view/ViewGroup;
.source "BaselineLayout.java"


# instance fields
.field private baseline:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 34
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/material/internal/BaselineLayout;->baseline:I

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/material/internal/BaselineLayout;->baseline:I

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/material/internal/BaselineLayout;->baseline:I

    .line 43
    return-void
.end method


# virtual methods
.method public getBaseline()I
    .locals 1

    .line 114
    iget v0, p0, Lcom/google/android/material/internal/BaselineLayout;->baseline:I

    return v0
.end method

.method protected onLayout(ZIIII)V
    .locals 14
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .line 85
    move-object v0, p0

    invoke-virtual {p0}, Lcom/google/android/material/internal/BaselineLayout;->getChildCount()I

    move-result v1

    .line 86
    .local v1, "count":I
    invoke-virtual {p0}, Lcom/google/android/material/internal/BaselineLayout;->getPaddingLeft()I

    move-result v2

    .line 87
    .local v2, "parentLeft":I
    sub-int v3, p4, p2

    invoke-virtual {p0}, Lcom/google/android/material/internal/BaselineLayout;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    .line 88
    .local v3, "parentRight":I
    sub-int v4, v3, v2

    .line 89
    .local v4, "parentContentWidth":I
    invoke-virtual {p0}, Lcom/google/android/material/internal/BaselineLayout;->getPaddingTop()I

    move-result v5

    .line 91
    .local v5, "parentTop":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-ge v6, v1, :cond_2

    .line 92
    invoke-virtual {p0, v6}, Lcom/google/android/material/internal/BaselineLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 93
    .local v7, "child":Landroid/view/View;
    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    move-result v8

    const/16 v9, 0x8

    if-ne v8, v9, :cond_0

    .line 94
    goto :goto_2

    .line 97
    :cond_0
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    .line 98
    .local v8, "width":I
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    .line 100
    .local v9, "height":I
    sub-int v10, v4, v8

    div-int/lit8 v10, v10, 0x2

    add-int/2addr v10, v2

    .line 102
    .local v10, "childLeft":I
    iget v11, v0, Lcom/google/android/material/internal/BaselineLayout;->baseline:I

    const/4 v12, -0x1

    if-eq v11, v12, :cond_1

    invoke-virtual {v7}, Landroid/view/View;->getBaseline()I

    move-result v11

    if-eq v11, v12, :cond_1

    .line 103
    iget v11, v0, Lcom/google/android/material/internal/BaselineLayout;->baseline:I

    add-int/2addr v11, v5

    invoke-virtual {v7}, Landroid/view/View;->getBaseline()I

    move-result v12

    sub-int/2addr v11, v12

    .local v11, "childTop":I
    goto :goto_1

    .line 105
    .end local v11    # "childTop":I
    :cond_1
    move v11, v5

    .line 108
    .restart local v11    # "childTop":I
    :goto_1
    add-int v12, v10, v8

    add-int v13, v11, v9

    invoke-virtual {v7, v10, v11, v12, v13}, Landroid/view/View;->layout(IIII)V

    .line 91
    .end local v7    # "child":Landroid/view/View;
    .end local v8    # "width":I
    .end local v9    # "height":I
    .end local v10    # "childLeft":I
    .end local v11    # "childTop":I
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 110
    .end local v6    # "i":I
    :cond_2
    return-void
.end method

.method protected onMeasure(II)V
    .locals 11
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 47
    invoke-virtual {p0}, Lcom/google/android/material/internal/BaselineLayout;->getChildCount()I

    move-result v0

    .line 48
    .local v0, "count":I
    const/4 v1, 0x0

    .line 49
    .local v1, "maxWidth":I
    const/4 v2, 0x0

    .line 50
    .local v2, "maxHeight":I
    const/4 v3, -0x1

    .line 51
    .local v3, "maxChildBaseline":I
    const/4 v4, -0x1

    .line 52
    .local v4, "maxChildDescent":I
    const/4 v5, 0x0

    .line 54
    .local v5, "childState":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    const/4 v7, -0x1

    if-ge v6, v0, :cond_2

    .line 55
    invoke-virtual {p0, v6}, Lcom/google/android/material/internal/BaselineLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 56
    .local v8, "child":Landroid/view/View;
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v9

    const/16 v10, 0x8

    if-ne v9, v10, :cond_0

    .line 57
    goto :goto_1

    .line 60
    :cond_0
    invoke-virtual {p0, v8, p1, p2}, Lcom/google/android/material/internal/BaselineLayout;->measureChild(Landroid/view/View;II)V

    .line 61
    invoke-virtual {v8}, Landroid/view/View;->getBaseline()I

    move-result v9

    .line 62
    .local v9, "baseline":I
    if-eq v9, v7, :cond_1

    .line 63
    invoke-static {v3, v9}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 64
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    sub-int/2addr v7, v9

    invoke-static {v4, v7}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 66
    :cond_1
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    invoke-static {v1, v7}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 67
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    invoke-static {v2, v7}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 68
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredState()I

    move-result v7

    invoke-static {v5, v7}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v5

    .line 54
    .end local v8    # "child":Landroid/view/View;
    .end local v9    # "baseline":I
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 70
    .end local v6    # "i":I
    :cond_2
    if-eq v3, v7, :cond_3

    .line 71
    invoke-virtual {p0}, Lcom/google/android/material/internal/BaselineLayout;->getPaddingBottom()I

    move-result v6

    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 72
    add-int v6, v3, v4

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 73
    iput v3, p0, Lcom/google/android/material/internal/BaselineLayout;->baseline:I

    .line 75
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/material/internal/BaselineLayout;->getSuggestedMinimumHeight()I

    move-result v6

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 76
    invoke-virtual {p0}, Lcom/google/android/material/internal/BaselineLayout;->getSuggestedMinimumWidth()I

    move-result v6

    invoke-static {v1, v6}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 77
    nop

    .line 78
    invoke-static {v1, p1, v5}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v6

    shl-int/lit8 v7, v5, 0x10

    .line 79
    invoke-static {v2, p2, v7}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v7

    .line 77
    invoke-virtual {p0, v6, v7}, Lcom/google/android/material/internal/BaselineLayout;->setMeasuredDimension(II)V

    .line 81
    return-void
.end method
