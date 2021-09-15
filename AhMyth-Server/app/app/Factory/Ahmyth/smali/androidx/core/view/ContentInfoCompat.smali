.class public final Landroidx/core/view/ContentInfoCompat;
.super Ljava/lang/Object;
.source "ContentInfoCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/view/ContentInfoCompat$Builder;,
        Landroidx/core/view/ContentInfoCompat$Flags;,
        Landroidx/core/view/ContentInfoCompat$Source;
    }
.end annotation


# static fields
.field public static final FLAG_CONVERT_TO_PLAIN_TEXT:I = 0x1

.field public static final SOURCE_APP:I = 0x0

.field public static final SOURCE_CLIPBOARD:I = 0x1

.field public static final SOURCE_DRAG_AND_DROP:I = 0x3

.field public static final SOURCE_INPUT_METHOD:I = 0x2


# instance fields
.field final mClip:Landroid/content/ClipData;

.field final mExtras:Landroid/os/Bundle;

.field final mFlags:I

.field final mLinkUri:Landroid/net/Uri;

.field final mSource:I


# direct methods
.method constructor <init>(Landroidx/core/view/ContentInfoCompat$Builder;)V
    .locals 4
    .param p1, "b"    # Landroidx/core/view/ContentInfoCompat$Builder;

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    iget-object v0, p1, Landroidx/core/view/ContentInfoCompat$Builder;->mClip:Landroid/content/ClipData;

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipData;

    iput-object v0, p0, Landroidx/core/view/ContentInfoCompat;->mClip:Landroid/content/ClipData;

    .line 139
    iget v0, p1, Landroidx/core/view/ContentInfoCompat$Builder;->mSource:I

    const/4 v1, 0x0

    const/4 v2, 0x3

    const-string v3, "source"

    invoke-static {v0, v1, v2, v3}, Landroidx/core/util/Preconditions;->checkArgumentInRange(IIILjava/lang/String;)I

    move-result v0

    iput v0, p0, Landroidx/core/view/ContentInfoCompat;->mSource:I

    .line 141
    iget v0, p1, Landroidx/core/view/ContentInfoCompat$Builder;->mFlags:I

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkFlagsArgument(II)I

    move-result v0

    iput v0, p0, Landroidx/core/view/ContentInfoCompat;->mFlags:I

    .line 142
    iget-object v0, p1, Landroidx/core/view/ContentInfoCompat$Builder;->mLinkUri:Landroid/net/Uri;

    iput-object v0, p0, Landroidx/core/view/ContentInfoCompat;->mLinkUri:Landroid/net/Uri;

    .line 143
    iget-object v0, p1, Landroidx/core/view/ContentInfoCompat$Builder;->mExtras:Landroid/os/Bundle;

    iput-object v0, p0, Landroidx/core/view/ContentInfoCompat;->mExtras:Landroid/os/Bundle;

    .line 144
    return-void
.end method

.method private static buildClipData(Landroid/content/ClipDescription;Ljava/util/List;)Landroid/content/ClipData;
    .locals 3
    .param p0, "description"    # Landroid/content/ClipDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ClipDescription;",
            "Ljava/util/List<",
            "Landroid/content/ClipData$Item;",
            ">;)",
            "Landroid/content/ClipData;"
        }
    .end annotation

    .line 254
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Landroid/content/ClipData$Item;>;"
    new-instance v0, Landroid/content/ClipData;

    new-instance v1, Landroid/content/ClipDescription;

    invoke-direct {v1, p0}, Landroid/content/ClipDescription;-><init>(Landroid/content/ClipDescription;)V

    const/4 v2, 0x0

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ClipData$Item;

    invoke-direct {v0, v1, v2}, Landroid/content/ClipData;-><init>(Landroid/content/ClipDescription;Landroid/content/ClipData$Item;)V

    .line 255
    .local v0, "clip":Landroid/content/ClipData;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 256
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ClipData$Item;

    invoke-virtual {v0, v2}, Landroid/content/ClipData;->addItem(Landroid/content/ClipData$Item;)V

    .line 255
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 258
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method static flagsToString(I)Ljava/lang/String;
    .locals 1
    .param p0, "flags"    # I

    .line 120
    and-int/lit8 v0, p0, 0x1

    if-eqz v0, :cond_0

    .line 121
    const-string v0, "FLAG_CONVERT_TO_PLAIN_TEXT"

    return-object v0

    .line 123
    :cond_0
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static sourceToString(I)Ljava/lang/String;
    .locals 1
    .param p0, "source"    # I

    .line 87
    packed-switch p0, :pswitch_data_0

    .line 93
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 91
    :pswitch_0
    const-string v0, "SOURCE_DRAG_AND_DROP"

    return-object v0

    .line 90
    :pswitch_1
    const-string v0, "SOURCE_INPUT_METHOD"

    return-object v0

    .line 89
    :pswitch_2
    const-string v0, "SOURCE_CLIPBOARD"

    return-object v0

    .line 88
    :pswitch_3
    const-string v0, "SOURCE_APP"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getClip()Landroid/content/ClipData;
    .locals 1

    .line 163
    iget-object v0, p0, Landroidx/core/view/ContentInfoCompat;->mClip:Landroid/content/ClipData;

    return-object v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .locals 1

    .line 201
    iget-object v0, p0, Landroidx/core/view/ContentInfoCompat;->mExtras:Landroid/os/Bundle;

    return-object v0
.end method

.method public getFlags()I
    .locals 1

    .line 180
    iget v0, p0, Landroidx/core/view/ContentInfoCompat;->mFlags:I

    return v0
.end method

.method public getLinkUri()Landroid/net/Uri;
    .locals 1

    .line 191
    iget-object v0, p0, Landroidx/core/view/ContentInfoCompat;->mLinkUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getSource()I
    .locals 1

    .line 172
    iget v0, p0, Landroidx/core/view/ContentInfoCompat;->mSource:I

    return v0
.end method

.method public partition(Landroidx/core/util/Predicate;)Landroid/util/Pair;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Predicate<",
            "Landroid/content/ClipData$Item;",
            ">;)",
            "Landroid/util/Pair<",
            "Landroidx/core/view/ContentInfoCompat;",
            "Landroidx/core/view/ContentInfoCompat;",
            ">;"
        }
    .end annotation

    .line 223
    .local p1, "itemPredicate":Landroidx/core/util/Predicate;, "Landroidx/core/util/Predicate<Landroid/content/ClipData$Item;>;"
    iget-object v0, p0, Landroidx/core/view/ContentInfoCompat;->mClip:Landroid/content/ClipData;

    invoke-virtual {v0}, Landroid/content/ClipData;->getItemCount()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_2

    .line 224
    iget-object v0, p0, Landroidx/core/view/ContentInfoCompat;->mClip:Landroid/content/ClipData;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v0

    invoke-interface {p1, v0}, Landroidx/core/util/Predicate;->test(Ljava/lang/Object;)Z

    move-result v0

    .line 225
    .local v0, "matched":Z
    if-eqz v0, :cond_0

    move-object v1, p0

    goto :goto_0

    :cond_0
    move-object v1, v2

    :goto_0
    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    move-object v2, p0

    :goto_1
    invoke-static {v1, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    return-object v1

    .line 227
    .end local v0    # "matched":Z
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 228
    .local v0, "acceptedItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ClipData$Item;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 229
    .local v1, "remainingItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ClipData$Item;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    iget-object v4, p0, Landroidx/core/view/ContentInfoCompat;->mClip:Landroid/content/ClipData;

    invoke-virtual {v4}, Landroid/content/ClipData;->getItemCount()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 230
    iget-object v4, p0, Landroidx/core/view/ContentInfoCompat;->mClip:Landroid/content/ClipData;

    invoke-virtual {v4, v3}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v4

    .line 231
    .local v4, "item":Landroid/content/ClipData$Item;
    invoke-interface {p1, v4}, Landroidx/core/util/Predicate;->test(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 232
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 234
    :cond_3
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 229
    .end local v4    # "item":Landroid/content/ClipData$Item;
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 237
    .end local v3    # "i":I
    :cond_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 238
    invoke-static {v2, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v2

    return-object v2

    .line 240
    :cond_5
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 241
    invoke-static {p0, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v2

    return-object v2

    .line 243
    :cond_6
    new-instance v2, Landroidx/core/view/ContentInfoCompat$Builder;

    invoke-direct {v2, p0}, Landroidx/core/view/ContentInfoCompat$Builder;-><init>(Landroidx/core/view/ContentInfoCompat;)V

    iget-object v3, p0, Landroidx/core/view/ContentInfoCompat;->mClip:Landroid/content/ClipData;

    .line 244
    invoke-virtual {v3}, Landroid/content/ClipData;->getDescription()Landroid/content/ClipDescription;

    move-result-object v3

    invoke-static {v3, v0}, Landroidx/core/view/ContentInfoCompat;->buildClipData(Landroid/content/ClipDescription;Ljava/util/List;)Landroid/content/ClipData;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/core/view/ContentInfoCompat$Builder;->setClip(Landroid/content/ClipData;)Landroidx/core/view/ContentInfoCompat$Builder;

    move-result-object v2

    .line 245
    invoke-virtual {v2}, Landroidx/core/view/ContentInfoCompat$Builder;->build()Landroidx/core/view/ContentInfoCompat;

    move-result-object v2

    .line 246
    .local v2, "accepted":Landroidx/core/view/ContentInfoCompat;
    new-instance v3, Landroidx/core/view/ContentInfoCompat$Builder;

    invoke-direct {v3, p0}, Landroidx/core/view/ContentInfoCompat$Builder;-><init>(Landroidx/core/view/ContentInfoCompat;)V

    iget-object v4, p0, Landroidx/core/view/ContentInfoCompat;->mClip:Landroid/content/ClipData;

    .line 247
    invoke-virtual {v4}, Landroid/content/ClipData;->getDescription()Landroid/content/ClipDescription;

    move-result-object v4

    invoke-static {v4, v1}, Landroidx/core/view/ContentInfoCompat;->buildClipData(Landroid/content/ClipDescription;Ljava/util/List;)Landroid/content/ClipData;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroidx/core/view/ContentInfoCompat$Builder;->setClip(Landroid/content/ClipData;)Landroidx/core/view/ContentInfoCompat$Builder;

    move-result-object v3

    .line 248
    invoke-virtual {v3}, Landroidx/core/view/ContentInfoCompat$Builder;->build()Landroidx/core/view/ContentInfoCompat;

    move-result-object v3

    .line 249
    .local v3, "remaining":Landroidx/core/view/ContentInfoCompat;
    invoke-static {v2, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v4

    return-object v4
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ContentInfoCompat{clip="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/core/view/ContentInfoCompat;->mClip:Landroid/content/ClipData;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", source="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/core/view/ContentInfoCompat;->mSource:I

    .line 151
    invoke-static {v1}, Landroidx/core/view/ContentInfoCompat;->sourceToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", flags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/core/view/ContentInfoCompat;->mFlags:I

    .line 152
    invoke-static {v1}, Landroidx/core/view/ContentInfoCompat;->flagsToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", linkUri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/core/view/ContentInfoCompat;->mLinkUri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", extras="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/core/view/ContentInfoCompat;->mExtras:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 149
    return-object v0
.end method
