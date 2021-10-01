.class Landroid/support/v4/util/ArrayMap$1;
.super Landroid/support/v4/util/MapCollections;
.source "ArrayMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/util/ArrayMap;->getCollection()Landroid/support/v4/util/MapCollections;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/util/MapCollections<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/util/ArrayMap;


# direct methods
.method constructor <init>(Landroid/support/v4/util/ArrayMap;)V
    .locals 0
    .param p1, "this$0"    # Landroid/support/v4/util/ArrayMap;

    .line 76
    .local p0, "this":Landroid/support/v4/util/ArrayMap$1;, "Landroid/support/v4/util/ArrayMap$1;"
    iput-object p1, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-direct {p0}, Landroid/support/v4/util/MapCollections;-><init>()V

    return-void
.end method


# virtual methods
.method protected colClear()V
    .locals 1

    .line 119
    .local p0, "this":Landroid/support/v4/util/ArrayMap$1;, "Landroid/support/v4/util/ArrayMap$1;"
    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0}, Landroid/support/v4/util/ArrayMap;->clear()V

    .line 120
    return-void
.end method

.method protected colGetEntry(II)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .param p2, "offset"    # I

    .line 84
    .local p0, "this":Landroid/support/v4/util/ArrayMap$1;, "Landroid/support/v4/util/ArrayMap$1;"
    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    iget-object v0, v0, Landroid/support/v4/util/ArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v1, p1, 0x1

    add-int/2addr v1, p2

    aget-object v0, v0, v1

    return-object v0
.end method

.method protected colGetMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    .line 99
    .local p0, "this":Landroid/support/v4/util/ArrayMap$1;, "Landroid/support/v4/util/ArrayMap$1;"
    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    return-object v0
.end method

.method protected colGetSize()I
    .locals 1

    .line 79
    .local p0, "this":Landroid/support/v4/util/ArrayMap$1;, "Landroid/support/v4/util/ArrayMap$1;"
    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    iget v0, v0, Landroid/support/v4/util/ArrayMap;->mSize:I

    return v0
.end method

.method protected colIndexOfKey(Ljava/lang/Object;)I
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 89
    .local p0, "this":Landroid/support/v4/util/ArrayMap$1;, "Landroid/support/v4/util/ArrayMap$1;"
    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/ArrayMap;->indexOfKey(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method protected colIndexOfValue(Ljava/lang/Object;)I
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .line 94
    .local p0, "this":Landroid/support/v4/util/ArrayMap$1;, "Landroid/support/v4/util/ArrayMap$1;"
    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/ArrayMap;->indexOfValue(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method protected colPut(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .line 104
    .local p0, "this":Landroid/support/v4/util/ArrayMap$1;, "Landroid/support/v4/util/ArrayMap$1;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    return-void
.end method

.method protected colRemoveAt(I)V
    .locals 1
    .param p1, "index"    # I

    .line 114
    .local p0, "this":Landroid/support/v4/util/ArrayMap$1;, "Landroid/support/v4/util/ArrayMap$1;"
    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    .line 115
    return-void
.end method

.method protected colSetValue(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)TV;"
        }
    .end annotation

    .line 109
    .local p0, "this":Landroid/support/v4/util/ArrayMap$1;, "Landroid/support/v4/util/ArrayMap$1;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/util/ArrayMap;->setValueAt(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
