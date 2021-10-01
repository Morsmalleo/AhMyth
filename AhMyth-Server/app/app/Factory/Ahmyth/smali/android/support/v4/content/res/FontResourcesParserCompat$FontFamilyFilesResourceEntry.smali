.class public final Landroid/support/v4/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;
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
    name = "FontFamilyFilesResourceEntry"
.end annotation


# instance fields
.field private final mEntries:[Landroid/support/v4/content/res/FontResourcesParserCompat$FontFileResourceEntry;


# direct methods
.method public constructor <init>([Landroid/support/v4/content/res/FontResourcesParserCompat$FontFileResourceEntry;)V
    .locals 0
    .param p1, "entries"    # [Landroid/support/v4/content/res/FontResourcesParserCompat$FontFileResourceEntry;

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 154
    iput-object p1, p0, Landroid/support/v4/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;->mEntries:[Landroid/support/v4/content/res/FontResourcesParserCompat$FontFileResourceEntry;

    .line 155
    return-void
.end method


# virtual methods
.method public getEntries()[Landroid/support/v4/content/res/FontResourcesParserCompat$FontFileResourceEntry;
    .locals 1

    .line 158
    iget-object v0, p0, Landroid/support/v4/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;->mEntries:[Landroid/support/v4/content/res/FontResourcesParserCompat$FontFileResourceEntry;

    return-object v0
.end method
