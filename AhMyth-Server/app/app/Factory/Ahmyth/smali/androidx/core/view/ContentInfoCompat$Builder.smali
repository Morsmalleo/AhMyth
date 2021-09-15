.class public final Landroidx/core/view/ContentInfoCompat$Builder;
.super Ljava/lang/Object;
.source "ContentInfoCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/ContentInfoCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field mClip:Landroid/content/ClipData;

.field mExtras:Landroid/os/Bundle;

.field mFlags:I

.field mLinkUri:Landroid/net/Uri;

.field mSource:I


# direct methods
.method public constructor <init>(Landroid/content/ClipData;I)V
    .locals 0
    .param p1, "clip"    # Landroid/content/ClipData;
    .param p2, "source"    # I

    .line 293
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 294
    iput-object p1, p0, Landroidx/core/view/ContentInfoCompat$Builder;->mClip:Landroid/content/ClipData;

    .line 295
    iput p2, p0, Landroidx/core/view/ContentInfoCompat$Builder;->mSource:I

    .line 296
    return-void
.end method

.method public constructor <init>(Landroidx/core/view/ContentInfoCompat;)V
    .locals 1
    .param p1, "other"    # Landroidx/core/view/ContentInfoCompat;

    .line 279
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 280
    iget-object v0, p1, Landroidx/core/view/ContentInfoCompat;->mClip:Landroid/content/ClipData;

    iput-object v0, p0, Landroidx/core/view/ContentInfoCompat$Builder;->mClip:Landroid/content/ClipData;

    .line 281
    iget v0, p1, Landroidx/core/view/ContentInfoCompat;->mSource:I

    iput v0, p0, Landroidx/core/view/ContentInfoCompat$Builder;->mSource:I

    .line 282
    iget v0, p1, Landroidx/core/view/ContentInfoCompat;->mFlags:I

    iput v0, p0, Landroidx/core/view/ContentInfoCompat$Builder;->mFlags:I

    .line 283
    iget-object v0, p1, Landroidx/core/view/ContentInfoCompat;->mLinkUri:Landroid/net/Uri;

    iput-object v0, p0, Landroidx/core/view/ContentInfoCompat$Builder;->mLinkUri:Landroid/net/Uri;

    .line 284
    iget-object v0, p1, Landroidx/core/view/ContentInfoCompat;->mExtras:Landroid/os/Bundle;

    iput-object v0, p0, Landroidx/core/view/ContentInfoCompat$Builder;->mExtras:Landroid/os/Bundle;

    .line 285
    return-void
.end method


# virtual methods
.method public build()Landroidx/core/view/ContentInfoCompat;
    .locals 1

    .line 365
    new-instance v0, Landroidx/core/view/ContentInfoCompat;

    invoke-direct {v0, p0}, Landroidx/core/view/ContentInfoCompat;-><init>(Landroidx/core/view/ContentInfoCompat$Builder;)V

    return-object v0
.end method

.method public setClip(Landroid/content/ClipData;)Landroidx/core/view/ContentInfoCompat$Builder;
    .locals 0
    .param p1, "clip"    # Landroid/content/ClipData;

    .line 306
    iput-object p1, p0, Landroidx/core/view/ContentInfoCompat$Builder;->mClip:Landroid/content/ClipData;

    .line 307
    return-object p0
.end method

.method public setExtras(Landroid/os/Bundle;)Landroidx/core/view/ContentInfoCompat$Builder;
    .locals 0
    .param p1, "extras"    # Landroid/os/Bundle;

    .line 356
    iput-object p1, p0, Landroidx/core/view/ContentInfoCompat$Builder;->mExtras:Landroid/os/Bundle;

    .line 357
    return-object p0
.end method

.method public setFlags(I)Landroidx/core/view/ContentInfoCompat$Builder;
    .locals 0
    .param p1, "flags"    # I

    .line 331
    iput p1, p0, Landroidx/core/view/ContentInfoCompat$Builder;->mFlags:I

    .line 332
    return-object p0
.end method

.method public setLinkUri(Landroid/net/Uri;)Landroidx/core/view/ContentInfoCompat$Builder;
    .locals 0
    .param p1, "linkUri"    # Landroid/net/Uri;

    .line 344
    iput-object p1, p0, Landroidx/core/view/ContentInfoCompat$Builder;->mLinkUri:Landroid/net/Uri;

    .line 345
    return-object p0
.end method

.method public setSource(I)Landroidx/core/view/ContentInfoCompat$Builder;
    .locals 0
    .param p1, "source"    # I

    .line 318
    iput p1, p0, Landroidx/core/view/ContentInfoCompat$Builder;->mSource:I

    .line 319
    return-object p0
.end method
