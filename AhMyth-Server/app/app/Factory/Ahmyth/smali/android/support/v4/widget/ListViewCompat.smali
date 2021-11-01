.class public final Landroid/support/v4/widget/ListViewCompat;
.super Ljava/lang/Object;
.source "ListViewCompat.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static canScrollList(Landroid/widget/ListView;I)Z
    .locals 4

    .line 67
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 69
    invoke-virtual {p0, p1}, Landroid/widget/ListView;->canScrollList(I)Z

    move-result p0

    return p0

    .line 72
    :cond_0
    invoke-virtual {p0}, Landroid/widget/ListView;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    .line 77
    :cond_1
    invoke-virtual {p0}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v2

    const/4 v3, 0x1

    if-lez p1, :cond_4

    add-int/lit8 p1, v0, -0x1

    .line 79
    invoke-virtual {p0, p1}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result p1

    add-int/2addr v2, v0

    .line 81
    invoke-virtual {p0}, Landroid/widget/ListView;->getCount()I

    move-result v0

    if-lt v2, v0, :cond_2

    .line 82
    invoke-virtual {p0}, Landroid/widget/ListView;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/ListView;->getListPaddingBottom()I

    move-result p0

    sub-int/2addr v0, p0

    if-le p1, v0, :cond_3

    :cond_2
    const/4 v1, 0x1

    :cond_3
    return v1

    .line 84
    :cond_4
    invoke-virtual {p0, v1}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p1

    if-gtz v2, :cond_5

    .line 85
    invoke-virtual {p0}, Landroid/widget/ListView;->getListPaddingTop()I

    move-result p0

    if-ge p1, p0, :cond_6

    :cond_5
    const/4 v1, 0x1

    :cond_6
    return v1
.end method

.method public static scrollListBy(Landroid/widget/ListView;I)V
    .locals 2

    .line 37
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 39
    invoke-virtual {p0, p1}, Landroid/widget/ListView;->scrollListBy(I)V

    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {p0}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    return-void

    :cond_1
    const/4 v1, 0x0

    .line 47
    invoke-virtual {p0, v1}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_2

    return-void

    .line 52
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    sub-int/2addr v1, p1

    .line 53
    invoke-virtual {p0, v0, v1}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    :goto_0
    return-void
.end method
