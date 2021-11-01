.class Landroid/support/v4/graphics/TypefaceCompatBaseImpl$1;
.super Ljava/lang/Object;
.source "TypefaceCompatBaseImpl.java"

# interfaces
.implements Landroid/support/v4/graphics/TypefaceCompatBaseImpl$StyleExtractor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/graphics/TypefaceCompatBaseImpl;->findBestInfo([Landroid/support/v4/provider/FontsContractCompat$FontInfo;I)Landroid/support/v4/provider/FontsContractCompat$FontInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/support/v4/graphics/TypefaceCompatBaseImpl$StyleExtractor<",
        "Landroid/support/v4/provider/FontsContractCompat$FontInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/graphics/TypefaceCompatBaseImpl;


# direct methods
.method constructor <init>(Landroid/support/v4/graphics/TypefaceCompatBaseImpl;)V
    .locals 0

    .line 71
    iput-object p1, p0, Landroid/support/v4/graphics/TypefaceCompatBaseImpl$1;->this$0:Landroid/support/v4/graphics/TypefaceCompatBaseImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getWeight(Landroid/support/v4/provider/FontsContractCompat$FontInfo;)I
    .locals 0

    .line 74
    invoke-virtual {p1}, Landroid/support/v4/provider/FontsContractCompat$FontInfo;->getWeight()I

    move-result p1

    return p1
.end method

.method public bridge synthetic getWeight(Ljava/lang/Object;)I
    .locals 0

    .line 71
    check-cast p1, Landroid/support/v4/provider/FontsContractCompat$FontInfo;

    invoke-virtual {p0, p1}, Landroid/support/v4/graphics/TypefaceCompatBaseImpl$1;->getWeight(Landroid/support/v4/provider/FontsContractCompat$FontInfo;)I

    move-result p1

    return p1
.end method

.method public isItalic(Landroid/support/v4/provider/FontsContractCompat$FontInfo;)Z
    .locals 0

    .line 79
    invoke-virtual {p1}, Landroid/support/v4/provider/FontsContractCompat$FontInfo;->isItalic()Z

    move-result p1

    return p1
.end method

.method public bridge synthetic isItalic(Ljava/lang/Object;)Z
    .locals 0

    .line 71
    check-cast p1, Landroid/support/v4/provider/FontsContractCompat$FontInfo;

    invoke-virtual {p0, p1}, Landroid/support/v4/graphics/TypefaceCompatBaseImpl$1;->isItalic(Landroid/support/v4/provider/FontsContractCompat$FontInfo;)Z

    move-result p1

    return p1
.end method
