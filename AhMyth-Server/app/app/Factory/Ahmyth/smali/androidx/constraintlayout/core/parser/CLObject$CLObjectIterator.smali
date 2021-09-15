.class Landroidx/constraintlayout/core/parser/CLObject$CLObjectIterator;
.super Ljava/lang/Object;
.source "CLObject.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/core/parser/CLObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CLObjectIterator"
.end annotation


# instance fields
.field index:I

.field myObject:Landroidx/constraintlayout/core/parser/CLObject;

.field final synthetic this$0:Landroidx/constraintlayout/core/parser/CLObject;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/core/parser/CLObject;Landroidx/constraintlayout/core/parser/CLObject;)V
    .locals 0
    .param p2, "clObject"    # Landroidx/constraintlayout/core/parser/CLObject;

    .line 75
    iput-object p1, p0, Landroidx/constraintlayout/core/parser/CLObject$CLObjectIterator;->this$0:Landroidx/constraintlayout/core/parser/CLObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const/4 p1, 0x0

    iput p1, p0, Landroidx/constraintlayout/core/parser/CLObject$CLObjectIterator;->index:I

    .line 76
    iput-object p2, p0, Landroidx/constraintlayout/core/parser/CLObject$CLObjectIterator;->myObject:Landroidx/constraintlayout/core/parser/CLObject;

    .line 77
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 81
    iget v0, p0, Landroidx/constraintlayout/core/parser/CLObject$CLObjectIterator;->index:I

    iget-object v1, p0, Landroidx/constraintlayout/core/parser/CLObject$CLObjectIterator;->myObject:Landroidx/constraintlayout/core/parser/CLObject;

    invoke-virtual {v1}, Landroidx/constraintlayout/core/parser/CLObject;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 2

    .line 86
    iget-object v0, p0, Landroidx/constraintlayout/core/parser/CLObject$CLObjectIterator;->myObject:Landroidx/constraintlayout/core/parser/CLObject;

    iget-object v0, v0, Landroidx/constraintlayout/core/parser/CLObject;->mElements:Ljava/util/ArrayList;

    iget v1, p0, Landroidx/constraintlayout/core/parser/CLObject$CLObjectIterator;->index:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/core/parser/CLKey;

    .line 87
    .local v0, "key":Landroidx/constraintlayout/core/parser/CLKey;
    iget v1, p0, Landroidx/constraintlayout/core/parser/CLObject$CLObjectIterator;->index:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroidx/constraintlayout/core/parser/CLObject$CLObjectIterator;->index:I

    .line 88
    return-object v0
.end method
