.class final Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;
.super Ljava/lang/Object;
.source "AnimateLayoutChangeDetector.java"


# static fields
.field private static final ZERO_MARGIN_LAYOUT_PARAMS:Landroid/view/ViewGroup$MarginLayoutParams;


# instance fields
.field private mLayoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 46
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    sput-object v0, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;->ZERO_MARGIN_LAYOUT_PARAMS:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 47
    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 48
    return-void
.end method

.method constructor <init>(Landroidx/recyclerview/widget/LinearLayoutManager;)V
    .locals 0
    .param p1, "llm"    # Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;->mLayoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 54
    return-void
.end method

.method private arePagesLaidOutContiguously()Z
    .locals 12

    .line 66
    iget-object v0, p0, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;->mLayoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    .line 67
    .local v0, "childCount":I
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 68
    return v1

    .line 71
    :cond_0
    iget-object v2, p0, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;->mLayoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 72
    .local v2, "isHorizontal":Z
    :goto_0
    const/4 v4, 0x2

    new-array v5, v4, [I

    aput v4, v5, v1

    aput v0, v5, v3

    const-class v4, I

    invoke-static {v4, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[I

    .line 73
    .local v4, "bounds":[[I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    if-ge v5, v0, :cond_6

    .line 74
    iget-object v6, p0, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;->mLayoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v6, v5}, Landroidx/recyclerview/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 75
    .local v6, "view":Landroid/view/View;
    if-eqz v6, :cond_5

    .line 78
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    .line 80
    .local v7, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    instance-of v8, v7, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v8, :cond_2

    .line 81
    move-object v8, v7

    check-cast v8, Landroid/view/ViewGroup$MarginLayoutParams;

    .local v8, "margin":Landroid/view/ViewGroup$MarginLayoutParams;
    goto :goto_2

    .line 83
    .end local v8    # "margin":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_2
    sget-object v8, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;->ZERO_MARGIN_LAYOUT_PARAMS:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 85
    .restart local v8    # "margin":Landroid/view/ViewGroup$MarginLayoutParams;
    :goto_2
    aget-object v9, v4, v5

    if-eqz v2, :cond_3

    .line 86
    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v10

    iget v11, v8, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v10, v11

    goto :goto_3

    .line 87
    :cond_3
    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v10

    iget v11, v8, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr v10, v11

    :goto_3
    aput v10, v9, v3

    .line 88
    aget-object v9, v4, v5

    if-eqz v2, :cond_4

    .line 89
    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    move-result v10

    iget v11, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v10, v11

    goto :goto_4

    .line 90
    :cond_4
    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v10

    iget v11, v8, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v10, v11

    :goto_4
    aput v10, v9, v1

    .line 73
    .end local v6    # "view":Landroid/view/View;
    .end local v7    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    .end local v8    # "margin":Landroid/view/ViewGroup$MarginLayoutParams;
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 76
    .restart local v6    # "view":Landroid/view/View;
    :cond_5
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v3, "null view contained in the view hierarchy"

    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 94
    .end local v5    # "i":I
    .end local v6    # "view":Landroid/view/View;
    :cond_6
    new-instance v5, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector$1;

    invoke-direct {v5, p0}, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector$1;-><init>(Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;)V

    invoke-static {v4, v5}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 102
    const/4 v5, 0x1

    .restart local v5    # "i":I
    :goto_5
    if-ge v5, v0, :cond_8

    .line 103
    add-int/lit8 v6, v5, -0x1

    aget-object v6, v4, v6

    aget v6, v6, v1

    aget-object v7, v4, v5

    aget v7, v7, v3

    if-eq v6, v7, :cond_7

    .line 104
    return v3

    .line 102
    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 109
    .end local v5    # "i":I
    :cond_8
    aget-object v5, v4, v3

    aget v5, v5, v1

    aget-object v6, v4, v3

    aget v6, v6, v3

    sub-int/2addr v5, v6

    .line 110
    .local v5, "pageSize":I
    aget-object v6, v4, v3

    aget v6, v6, v3

    if-gtz v6, :cond_a

    add-int/lit8 v6, v0, -0x1

    aget-object v6, v4, v6

    aget v6, v6, v1

    if-ge v6, v5, :cond_9

    goto :goto_6

    .line 113
    :cond_9
    return v1

    .line 111
    :cond_a
    :goto_6
    return v3
.end method

.method private hasRunningChangingLayoutTransition()Z
    .locals 3

    .line 117
    iget-object v0, p0, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;->mLayoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    .line 118
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 119
    iget-object v2, p0, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;->mLayoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;->hasRunningChangingLayoutTransition(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 120
    const/4 v2, 0x1

    return v2

    .line 118
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 123
    .end local v1    # "i":I
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method private static hasRunningChangingLayoutTransition(Landroid/view/View;)Z
    .locals 6
    .param p0, "view"    # Landroid/view/View;

    .line 127
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    .line 128
    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    .line 129
    .local v0, "viewGroup":Landroid/view/ViewGroup;
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v1

    .line 130
    .local v1, "layoutTransition":Landroid/animation/LayoutTransition;
    const/4 v2, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/animation/LayoutTransition;->isChangingLayout()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 131
    return v2

    .line 133
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    .line 134
    .local v3, "childCount":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v3, :cond_2

    .line 135
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-static {v5}, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;->hasRunningChangingLayoutTransition(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 136
    return v2

    .line 134
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 140
    .end local v0    # "viewGroup":Landroid/view/ViewGroup;
    .end local v1    # "layoutTransition":Landroid/animation/LayoutTransition;
    .end local v3    # "childCount":I
    .end local v4    # "i":I
    :cond_2
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method mayHaveInterferingAnimations()Z
    .locals 2

    .line 60
    invoke-direct {p0}, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;->arePagesLaidOutContiguously()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;->mLayoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    if-gt v0, v1, :cond_1

    .line 61
    :cond_0
    invoke-direct {p0}, Landroidx/viewpager2/widget/AnimateLayoutChangeDetector;->hasRunningChangingLayoutTransition()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 60
    :goto_0
    return v1
.end method
