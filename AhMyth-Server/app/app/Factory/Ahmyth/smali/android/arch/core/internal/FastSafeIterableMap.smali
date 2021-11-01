.class public Landroid/arch/core/internal/FastSafeIterableMap;
.super Landroid/arch/core/internal/SafeIterableMap;
.source "FastSafeIterableMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/arch/core/internal/SafeIterableMap<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field private mHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "TK;",
            "Landroid/arch/core/internal/SafeIterableMap$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Landroid/arch/core/internal/SafeIterableMap;-><init>()V

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/arch/core/internal/FastSafeIterableMap;->mHashMap:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public ceil(Ljava/lang/Object;)Ljava/util/Map$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 75
    invoke-virtual {p0, p1}, Landroid/arch/core/internal/FastSafeIterableMap;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Landroid/arch/core/internal/FastSafeIterableMap;->mHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/arch/core/internal/SafeIterableMap$Entry;

    iget-object p1, p1, Landroid/arch/core/internal/SafeIterableMap$Entry;->mPrevious:Landroid/arch/core/internal/SafeIterableMap$Entry;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    .line 66
    iget-object v0, p0, Landroid/arch/core/internal/FastSafeIterableMap;->mHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method protected get(Ljava/lang/Object;)Landroid/arch/core/internal/SafeIterableMap$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Landroid/arch/core/internal/SafeIterableMap$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 41
    iget-object v0, p0, Landroid/arch/core/internal/FastSafeIterableMap;->mHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/arch/core/internal/SafeIterableMap$Entry;

    return-object p1
.end method

.method public putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 46
    invoke-virtual {p0, p1}, Landroid/arch/core/internal/FastSafeIterableMap;->get(Ljava/lang/Object;)Landroid/arch/core/internal/SafeIterableMap$Entry;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 48
    iget-object p1, v0, Landroid/arch/core/internal/SafeIterableMap$Entry;->mValue:Ljava/lang/Object;

    return-object p1

    .line 50
    :cond_0
    iget-object v0, p0, Landroid/arch/core/internal/FastSafeIterableMap;->mHashMap:Ljava/util/HashMap;

    invoke-virtual {p0, p1, p2}, Landroid/arch/core/internal/FastSafeIterableMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Landroid/arch/core/internal/SafeIterableMap$Entry;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x0

    return-object p1
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .line 56
    invoke-super {p0, p1}, Landroid/arch/core/internal/SafeIterableMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 57
    iget-object v1, p0, Landroid/arch/core/internal/FastSafeIterableMap;->mHashMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method
