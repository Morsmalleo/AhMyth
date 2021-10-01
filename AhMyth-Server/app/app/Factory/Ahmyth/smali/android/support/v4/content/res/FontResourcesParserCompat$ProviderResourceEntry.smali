.class public final Landroid/support/v4/content/res/FontResourcesParserCompat$ProviderResourceEntry;
.super Ljava/lang/Object;
.source "FontResourcesParserCompat.java"

# interfaces
.implements Landroid/support/v4/content/res/FontResourcesParserCompat$FamilyResourceEntry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/content/res/FontResourcesParserCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ProviderResourceEntry"
.end annotation


# instance fields
.field private final mRequest:Landroid/support/v4/provider/FontRequest;

.field private final mStrategy:I

.field private final mTimeoutMs:I


# direct methods
.method public constructor <init>(Landroid/support/v4/provider/FontRequest;II)V
    .locals 0
    .param p1, "request"    # Landroid/support/v4/provider/FontRequest;
    .param p2, "strategy"    # I
    .param p3, "timeoutMs"    # I

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput-object p1, p0, Landroid/support/v4/content/res/FontResourcesParserCompat$ProviderResourceEntry;->mRequest:Landroid/support/v4/provider/FontRequest;

    .line 84
    iput p2, p0, Landroid/support/v4/content/res/FontResourcesParserCompat$ProviderResourceEntry;->mStrategy:I

    .line 85
    iput p3, p0, Landroid/support/v4/content/res/FontResourcesParserCompat$ProviderResourceEntry;->mTimeoutMs:I

    .line 86
    return-void
.end method


# virtual methods
.method public getFetchStrategy()I
    .locals 1

    .line 93
    iget v0, p0, Landroid/support/v4/content/res/FontResourcesParserCompat$ProviderResourceEntry;->mStrategy:I

    return v0
.end method

.method public getRequest()Landroid/support/v4/provider/FontRequest;
    .locals 1

    .line 89
    iget-object v0, p0, Landroid/support/v4/content/res/FontResourcesParserCompat$ProviderResourceEntry;->mRequest:Landroid/support/v4/provider/FontRequest;

    return-object v0
.end method

.method public getTimeout()I
    .locals 1

    .line 97
    iget v0, p0, Landroid/support/v4/content/res/FontResourcesParserCompat$ProviderResourceEntry;->mTimeoutMs:I

    return v0
.end method
