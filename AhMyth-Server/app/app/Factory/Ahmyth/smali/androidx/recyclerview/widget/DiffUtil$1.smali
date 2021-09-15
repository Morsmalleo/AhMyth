.class final Landroidx/recyclerview/widget/DiffUtil$1;
.super Ljava/lang/Object;
.source "DiffUtil.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/DiffUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroidx/recyclerview/widget/DiffUtil$Snake;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroidx/recyclerview/widget/DiffUtil$Snake;Landroidx/recyclerview/widget/DiffUtil$Snake;)I
    .locals 3
    .param p1, "o1"    # Landroidx/recyclerview/widget/DiffUtil$Snake;
    .param p2, "o2"    # Landroidx/recyclerview/widget/DiffUtil$Snake;

    .line 87
    iget v0, p1, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    iget v1, p2, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    sub-int/2addr v0, v1

    .line 88
    .local v0, "cmpX":I
    if-nez v0, :cond_0

    iget v1, p1, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    iget v2, p2, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    sub-int/2addr v1, v2

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    return v1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 84
    check-cast p1, Landroidx/recyclerview/widget/DiffUtil$Snake;

    check-cast p2, Landroidx/recyclerview/widget/DiffUtil$Snake;

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/DiffUtil$1;->compare(Landroidx/recyclerview/widget/DiffUtil$Snake;Landroidx/recyclerview/widget/DiffUtil$Snake;)I

    move-result p1

    return p1
.end method
