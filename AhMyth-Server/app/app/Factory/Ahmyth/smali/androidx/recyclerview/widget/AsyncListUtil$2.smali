.class Landroidx/recyclerview/widget/AsyncListUtil$2;
.super Ljava/lang/Object;
.source "AsyncListUtil.java"

# interfaces
.implements Landroidx/recyclerview/widget/ThreadUtil$BackgroundCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/AsyncListUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/recyclerview/widget/ThreadUtil$BackgroundCallback<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private mFirstRequiredTileStart:I

.field private mGeneration:I

.field private mItemCount:I

.field private mLastRequiredTileStart:I

.field final mLoadedTiles:Landroid/util/SparseBooleanArray;

.field private mRecycledRoot:Landroidx/recyclerview/widget/TileList$Tile;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/widget/TileList$Tile<",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Landroidx/recyclerview/widget/AsyncListUtil;


# direct methods
.method constructor <init>(Landroidx/recyclerview/widget/AsyncListUtil;)V
    .locals 1
    .param p1, "this$0"    # Landroidx/recyclerview/widget/AsyncListUtil;

    .line 294
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$2;, "Landroidx/recyclerview/widget/AsyncListUtil$2;"
    iput-object p1, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 298
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    return-void
.end method

.method private acquireTile()Landroidx/recyclerview/widget/TileList$Tile;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/recyclerview/widget/TileList$Tile<",
            "TT;>;"
        }
    .end annotation

    .line 392
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$2;, "Landroidx/recyclerview/widget/AsyncListUtil$2;"
    iget-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mRecycledRoot:Landroidx/recyclerview/widget/TileList$Tile;

    if-eqz v0, :cond_0

    .line 393
    iget-object v1, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mRecycledRoot:Landroidx/recyclerview/widget/TileList$Tile;

    .line 394
    .local v1, "result":Landroidx/recyclerview/widget/TileList$Tile;, "Landroidx/recyclerview/widget/TileList$Tile<TT;>;"
    iget-object v0, v0, Landroidx/recyclerview/widget/TileList$Tile;->mNext:Landroidx/recyclerview/widget/TileList$Tile;

    iput-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mRecycledRoot:Landroidx/recyclerview/widget/TileList$Tile;

    .line 395
    return-object v1

    .line 397
    .end local v1    # "result":Landroidx/recyclerview/widget/TileList$Tile;, "Landroidx/recyclerview/widget/TileList$Tile<TT;>;"
    :cond_0
    new-instance v0, Landroidx/recyclerview/widget/TileList$Tile;

    iget-object v1, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget-object v1, v1, Landroidx/recyclerview/widget/AsyncListUtil;->mTClass:Ljava/lang/Class;

    iget-object v2, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget v2, v2, Landroidx/recyclerview/widget/AsyncListUtil;->mTileSize:I

    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/TileList$Tile;-><init>(Ljava/lang/Class;I)V

    return-object v0
.end method

.method private addTile(Landroidx/recyclerview/widget/TileList$Tile;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/TileList$Tile<",
            "TT;>;)V"
        }
    .end annotation

    .line 405
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$2;, "Landroidx/recyclerview/widget/AsyncListUtil$2;"
    .local p1, "tile":Landroidx/recyclerview/widget/TileList$Tile;, "Landroidx/recyclerview/widget/TileList$Tile<TT;>;"
    iget-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    iget v1, p1, Landroidx/recyclerview/widget/TileList$Tile;->mStartPosition:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 406
    iget-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget-object v0, v0, Landroidx/recyclerview/widget/AsyncListUtil;->mMainThreadProxy:Landroidx/recyclerview/widget/ThreadUtil$MainThreadCallback;

    iget v1, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mGeneration:I

    invoke-interface {v0, v1, p1}, Landroidx/recyclerview/widget/ThreadUtil$MainThreadCallback;->addTile(ILandroidx/recyclerview/widget/TileList$Tile;)V

    .line 410
    return-void
.end method

.method private flushTileCache(I)V
    .locals 7
    .param p1, "scrollHint"    # I

    .line 421
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$2;, "Landroidx/recyclerview/widget/AsyncListUtil$2;"
    iget-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget-object v0, v0, Landroidx/recyclerview/widget/AsyncListUtil;->mDataCallback:Landroidx/recyclerview/widget/AsyncListUtil$DataCallback;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/AsyncListUtil$DataCallback;->getMaxCachedTiles()I

    move-result v0

    .line 422
    .local v0, "cacheSizeLimit":I
    :goto_0
    iget-object v1, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    invoke-virtual {v1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v1

    if-lt v1, v0, :cond_4

    .line 423
    iget-object v1, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v1

    .line 424
    .local v1, "firstLoadedTileStart":I
    iget-object v2, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    invoke-virtual {v2}, Landroid/util/SparseBooleanArray;->size()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v2

    .line 425
    .local v2, "lastLoadedTileStart":I
    iget v3, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mFirstRequiredTileStart:I

    sub-int/2addr v3, v1

    .line 426
    .local v3, "startMargin":I
    iget v5, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mLastRequiredTileStart:I

    sub-int v5, v2, v5

    .line 427
    .local v5, "endMargin":I
    if-lez v3, :cond_1

    if-ge v3, v5, :cond_0

    const/4 v6, 0x2

    if-ne p1, v6, :cond_1

    .line 429
    :cond_0
    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/AsyncListUtil$2;->removeTile(I)V

    goto :goto_1

    .line 430
    :cond_1
    if-lez v5, :cond_3

    if-lt v3, v5, :cond_2

    if-ne p1, v4, :cond_3

    .line 432
    :cond_2
    invoke-direct {p0, v2}, Landroidx/recyclerview/widget/AsyncListUtil$2;->removeTile(I)V

    .line 437
    .end local v1    # "firstLoadedTileStart":I
    .end local v2    # "lastLoadedTileStart":I
    .end local v3    # "startMargin":I
    .end local v5    # "endMargin":I
    :goto_1
    goto :goto_0

    .line 435
    .restart local v1    # "firstLoadedTileStart":I
    .restart local v2    # "lastLoadedTileStart":I
    .restart local v3    # "startMargin":I
    .restart local v5    # "endMargin":I
    :cond_3
    return-void

    .line 438
    .end local v1    # "firstLoadedTileStart":I
    .end local v2    # "lastLoadedTileStart":I
    .end local v3    # "startMargin":I
    .end local v5    # "endMargin":I
    :cond_4
    return-void
.end method

.method private getTileStart(I)I
    .locals 1
    .param p1, "position"    # I

    .line 350
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$2;, "Landroidx/recyclerview/widget/AsyncListUtil$2;"
    iget-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget v0, v0, Landroidx/recyclerview/widget/AsyncListUtil;->mTileSize:I

    rem-int v0, p1, v0

    sub-int v0, p1, v0

    return v0
.end method

.method private isTileLoaded(I)Z
    .locals 1
    .param p1, "position"    # I

    .line 401
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$2;, "Landroidx/recyclerview/widget/AsyncListUtil$2;"
    iget-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v0

    return v0
.end method

.method private varargs log(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 441
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$2;, "Landroidx/recyclerview/widget/AsyncListUtil$2;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[BKGR] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AsyncListUtil"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    return-void
.end method

.method private removeTile(I)V
    .locals 2
    .param p1, "position"    # I

    .line 413
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$2;, "Landroidx/recyclerview/widget/AsyncListUtil$2;"
    iget-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->delete(I)V

    .line 414
    iget-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget-object v0, v0, Landroidx/recyclerview/widget/AsyncListUtil;->mMainThreadProxy:Landroidx/recyclerview/widget/ThreadUtil$MainThreadCallback;

    iget v1, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mGeneration:I

    invoke-interface {v0, v1, p1}, Landroidx/recyclerview/widget/ThreadUtil$MainThreadCallback;->removeTile(II)V

    .line 418
    return-void
.end method

.method private requestTiles(IIIZ)V
    .locals 3
    .param p1, "firstTileStart"    # I
    .param p2, "lastTileStart"    # I
    .param p3, "scrollHint"    # I
    .param p4, "backwards"    # Z

    .line 355
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$2;, "Landroidx/recyclerview/widget/AsyncListUtil$2;"
    move v0, p1

    .local v0, "i":I
    :goto_0
    if-gt v0, p2, :cond_1

    .line 356
    if-eqz p4, :cond_0

    add-int v1, p2, p1

    sub-int/2addr v1, v0

    goto :goto_1

    :cond_0
    move v1, v0

    .line 360
    .local v1, "tileStart":I
    :goto_1
    iget-object v2, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget-object v2, v2, Landroidx/recyclerview/widget/AsyncListUtil;->mBackgroundProxy:Landroidx/recyclerview/widget/ThreadUtil$BackgroundCallback;

    invoke-interface {v2, v1, p3}, Landroidx/recyclerview/widget/ThreadUtil$BackgroundCallback;->loadTile(II)V

    .line 355
    .end local v1    # "tileStart":I
    iget-object v1, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget v1, v1, Landroidx/recyclerview/widget/AsyncListUtil;->mTileSize:I

    add-int/2addr v0, v1

    goto :goto_0

    .line 362
    .end local v0    # "i":I
    :cond_1
    return-void
.end method


# virtual methods
.method public loadTile(II)V
    .locals 5
    .param p1, "position"    # I
    .param p2, "scrollHint"    # I

    .line 366
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$2;, "Landroidx/recyclerview/widget/AsyncListUtil$2;"
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/AsyncListUtil$2;->isTileLoaded(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 370
    return-void

    .line 372
    :cond_0
    invoke-direct {p0}, Landroidx/recyclerview/widget/AsyncListUtil$2;->acquireTile()Landroidx/recyclerview/widget/TileList$Tile;

    move-result-object v0

    .line 373
    .local v0, "tile":Landroidx/recyclerview/widget/TileList$Tile;, "Landroidx/recyclerview/widget/TileList$Tile<TT;>;"
    iput p1, v0, Landroidx/recyclerview/widget/TileList$Tile;->mStartPosition:I

    .line 374
    iget-object v1, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget v1, v1, Landroidx/recyclerview/widget/AsyncListUtil;->mTileSize:I

    iget v2, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mItemCount:I

    iget v3, v0, Landroidx/recyclerview/widget/TileList$Tile;->mStartPosition:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, v0, Landroidx/recyclerview/widget/TileList$Tile;->mItemCount:I

    .line 375
    iget-object v1, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget-object v1, v1, Landroidx/recyclerview/widget/AsyncListUtil;->mDataCallback:Landroidx/recyclerview/widget/AsyncListUtil$DataCallback;

    iget-object v2, v0, Landroidx/recyclerview/widget/TileList$Tile;->mItems:[Ljava/lang/Object;

    iget v3, v0, Landroidx/recyclerview/widget/TileList$Tile;->mStartPosition:I

    iget v4, v0, Landroidx/recyclerview/widget/TileList$Tile;->mItemCount:I

    invoke-virtual {v1, v2, v3, v4}, Landroidx/recyclerview/widget/AsyncListUtil$DataCallback;->fillData([Ljava/lang/Object;II)V

    .line 376
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/AsyncListUtil$2;->flushTileCache(I)V

    .line 377
    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/AsyncListUtil$2;->addTile(Landroidx/recyclerview/widget/TileList$Tile;)V

    .line 378
    return-void
.end method

.method public recycleTile(Landroidx/recyclerview/widget/TileList$Tile;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/TileList$Tile<",
            "TT;>;)V"
        }
    .end annotation

    .line 385
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$2;, "Landroidx/recyclerview/widget/AsyncListUtil$2;"
    .local p1, "tile":Landroidx/recyclerview/widget/TileList$Tile;, "Landroidx/recyclerview/widget/TileList$Tile<TT;>;"
    iget-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget-object v0, v0, Landroidx/recyclerview/widget/AsyncListUtil;->mDataCallback:Landroidx/recyclerview/widget/AsyncListUtil$DataCallback;

    iget-object v1, p1, Landroidx/recyclerview/widget/TileList$Tile;->mItems:[Ljava/lang/Object;

    iget v2, p1, Landroidx/recyclerview/widget/TileList$Tile;->mItemCount:I

    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/AsyncListUtil$DataCallback;->recycleData([Ljava/lang/Object;I)V

    .line 387
    iget-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mRecycledRoot:Landroidx/recyclerview/widget/TileList$Tile;

    iput-object v0, p1, Landroidx/recyclerview/widget/TileList$Tile;->mNext:Landroidx/recyclerview/widget/TileList$Tile;

    .line 388
    iput-object p1, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mRecycledRoot:Landroidx/recyclerview/widget/TileList$Tile;

    .line 389
    return-void
.end method

.method public refresh(I)V
    .locals 3
    .param p1, "generation"    # I

    .line 308
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$2;, "Landroidx/recyclerview/widget/AsyncListUtil$2;"
    iput p1, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mGeneration:I

    .line 309
    iget-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->clear()V

    .line 310
    iget-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget-object v0, v0, Landroidx/recyclerview/widget/AsyncListUtil;->mDataCallback:Landroidx/recyclerview/widget/AsyncListUtil$DataCallback;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/AsyncListUtil$DataCallback;->refreshData()I

    move-result v0

    iput v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mItemCount:I

    .line 311
    iget-object v0, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget-object v0, v0, Landroidx/recyclerview/widget/AsyncListUtil;->mMainThreadProxy:Landroidx/recyclerview/widget/ThreadUtil$MainThreadCallback;

    iget v1, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mGeneration:I

    iget v2, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mItemCount:I

    invoke-interface {v0, v1, v2}, Landroidx/recyclerview/widget/ThreadUtil$MainThreadCallback;->updateItemCount(II)V

    .line 312
    return-void
.end method

.method public updateRange(IIIII)V
    .locals 5
    .param p1, "rangeStart"    # I
    .param p2, "rangeEnd"    # I
    .param p3, "extRangeStart"    # I
    .param p4, "extRangeEnd"    # I
    .param p5, "scrollHint"    # I

    .line 322
    .local p0, "this":Landroidx/recyclerview/widget/AsyncListUtil$2;, "Landroidx/recyclerview/widget/AsyncListUtil$2;"
    if-le p1, p2, :cond_0

    .line 323
    return-void

    .line 326
    :cond_0
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/AsyncListUtil$2;->getTileStart(I)I

    move-result v0

    .line 327
    .local v0, "firstVisibleTileStart":I
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/AsyncListUtil$2;->getTileStart(I)I

    move-result v1

    .line 329
    .local v1, "lastVisibleTileStart":I
    invoke-direct {p0, p3}, Landroidx/recyclerview/widget/AsyncListUtil$2;->getTileStart(I)I

    move-result v2

    iput v2, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mFirstRequiredTileStart:I

    .line 330
    invoke-direct {p0, p4}, Landroidx/recyclerview/widget/AsyncListUtil$2;->getTileStart(I)I

    move-result v2

    iput v2, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mLastRequiredTileStart:I

    .line 338
    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne p5, v4, :cond_1

    .line 339
    iget v2, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mFirstRequiredTileStart:I

    invoke-direct {p0, v2, v1, p5, v4}, Landroidx/recyclerview/widget/AsyncListUtil$2;->requestTiles(IIIZ)V

    .line 340
    iget-object v2, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget v2, v2, Landroidx/recyclerview/widget/AsyncListUtil;->mTileSize:I

    add-int/2addr v2, v1

    iget v4, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mLastRequiredTileStart:I

    invoke-direct {p0, v2, v4, p5, v3}, Landroidx/recyclerview/widget/AsyncListUtil$2;->requestTiles(IIIZ)V

    goto :goto_0

    .line 343
    :cond_1
    invoke-direct {p0, v0, v2, p5, v3}, Landroidx/recyclerview/widget/AsyncListUtil$2;->requestTiles(IIIZ)V

    .line 344
    iget v2, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->mFirstRequiredTileStart:I

    iget-object v3, p0, Landroidx/recyclerview/widget/AsyncListUtil$2;->this$0:Landroidx/recyclerview/widget/AsyncListUtil;

    iget v3, v3, Landroidx/recyclerview/widget/AsyncListUtil;->mTileSize:I

    sub-int v3, v0, v3

    invoke-direct {p0, v2, v3, p5, v4}, Landroidx/recyclerview/widget/AsyncListUtil$2;->requestTiles(IIIZ)V

    .line 347
    :goto_0
    return-void
.end method
