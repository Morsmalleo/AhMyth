.class final Landroid/support/v4/util/MapCollections$ValuesCollection;
.super Ljava/lang/Object;
.source "MapCollections.java"

# interfaces
.implements Ljava/util/Collection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/util/MapCollections;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ValuesCollection"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Collection<",
        "TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/util/MapCollections;


# direct methods
.method constructor <init>(Landroid/support/v4/util/MapCollections;)V
    .locals 0

    .line 357
    iput-object p1, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)Z"
        }
    .end annotation

    .line 361
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+TV;>;)Z"
        }
    .end annotation

    .line 366
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public clear()V
    .locals 1

    .line 371
    iget-object v0, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    invoke-virtual {v0}, Landroid/support/v4/util/MapCollections;->colClear()V

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1

    .line 376
    iget-object v0, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/MapCollections;->colIndexOfValue(Ljava/lang/Object;)I

    move-result p1

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 381
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 382
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 383
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v4/util/MapCollections$ValuesCollection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public isEmpty()Z
    .locals 1

    .line 392
    iget-object v0, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    invoke-virtual {v0}, Landroid/support/v4/util/MapCollections;->colGetSize()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TV;>;"
        }
    .end annotation

    .line 397
    new-instance v0, Landroid/support/v4/util/MapCollections$ArrayIterator;

    iget-object v1, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/support/v4/util/MapCollections$ArrayIterator;-><init>(Landroid/support/v4/util/MapCollections;I)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1

    .line 402
    iget-object v0, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/MapCollections;->colIndexOfValue(Ljava/lang/Object;)I

    move-result p1

    if-ltz p1, :cond_0

    .line 404
    iget-object v0, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/MapCollections;->colRemoveAt(I)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 412
    iget-object v0, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    invoke-virtual {v0}, Landroid/support/v4/util/MapCollections;->colGetSize()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 415
    iget-object v3, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    const/4 v4, 0x1

    invoke-virtual {v3, v1, v4}, Landroid/support/v4/util/MapCollections;->colGetEntry(II)Ljava/lang/Object;

    move-result-object v3

    .line 416
    invoke-interface {p1, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 417
    iget-object v2, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    invoke-virtual {v2, v1}, Landroid/support/v4/util/MapCollections;->colRemoveAt(I)V

    add-int/lit8 v1, v1, -0x1

    add-int/lit8 v0, v0, -0x1

    const/4 v2, 0x1

    :cond_0
    add-int/2addr v1, v4

    goto :goto_0

    :cond_1
    return v2
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 428
    iget-object v0, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    invoke-virtual {v0}, Landroid/support/v4/util/MapCollections;->colGetSize()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 431
    iget-object v3, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    const/4 v4, 0x1

    invoke-virtual {v3, v1, v4}, Landroid/support/v4/util/MapCollections;->colGetEntry(II)Ljava/lang/Object;

    move-result-object v3

    .line 432
    invoke-interface {p1, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 433
    iget-object v2, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    invoke-virtual {v2, v1}, Landroid/support/v4/util/MapCollections;->colRemoveAt(I)V

    add-int/lit8 v1, v1, -0x1

    add-int/lit8 v0, v0, -0x1

    const/4 v2, 0x1

    :cond_0
    add-int/2addr v1, v4

    goto :goto_0

    :cond_1
    return v2
.end method

.method public size()I
    .locals 1

    .line 444
    iget-object v0, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    invoke-virtual {v0}, Landroid/support/v4/util/MapCollections;->colGetSize()I

    move-result v0

    return v0
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 2

    .line 449
    iget-object v0, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/util/MapCollections;->toArrayHelper(I)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .line 454
    iget-object v0, p0, Landroid/support/v4/util/MapCollections$ValuesCollection;->this$0:Landroid/support/v4/util/MapCollections;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/util/MapCollections;->toArrayHelper([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
