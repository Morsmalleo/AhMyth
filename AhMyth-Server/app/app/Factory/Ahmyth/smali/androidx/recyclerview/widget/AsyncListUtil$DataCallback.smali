.class public abstract Landroidx/recyclerview/widget/AsyncListUtil$DataCallback;
.super Ljava/lang/Object;
.source "AsyncListUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/AsyncListUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "DataCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 451
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$DataCallback;, "Landroidx/recyclerview/widget/AsyncListUtil$DataCallback<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract fillData([Ljava/lang/Object;II)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;II)V"
        }
    .end annotation
.end method

.method public getMaxCachedTiles()I
    .locals 1

    .line 511
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$DataCallback;, "Landroidx/recyclerview/widget/AsyncListUtil$DataCallback<TT;>;"
    const/16 v0, 0xa

    return v0
.end method

.method public recycleData([Ljava/lang/Object;I)V
    .locals 0
    .param p2, "itemCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;I)V"
        }
    .end annotation

    .line 489
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$DataCallback;, "Landroidx/recyclerview/widget/AsyncListUtil$DataCallback<TT;>;"
    .local p1, "data":[Ljava/lang/Object;, "[TT;"
    return-void
.end method

.method public abstract refreshData()I
.end method
