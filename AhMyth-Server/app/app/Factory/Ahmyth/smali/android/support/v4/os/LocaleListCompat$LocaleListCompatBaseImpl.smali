.class Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;
.super Ljava/lang/Object;
.source "LocaleListCompat.java"

# interfaces
.implements Landroid/support/v4/os/LocaleListInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/os/LocaleListCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LocaleListCompatBaseImpl"
.end annotation


# instance fields
.field private mLocaleList:Landroid/support/v4/os/LocaleListHelper;


# direct methods
.method constructor <init>()V
    .locals 2

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Landroid/support/v4/os/LocaleListHelper;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/util/Locale;

    invoke-direct {v0, v1}, Landroid/support/v4/os/LocaleListHelper;-><init>([Ljava/util/Locale;)V

    iput-object v0, p0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;->mLocaleList:Landroid/support/v4/os/LocaleListHelper;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "other"    # Ljava/lang/Object;

    .line 75
    iget-object v0, p0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;->mLocaleList:Landroid/support/v4/os/LocaleListHelper;

    move-object v1, p1

    check-cast v1, Landroid/support/v4/os/LocaleListCompat;

    invoke-virtual {v1}, Landroid/support/v4/os/LocaleListCompat;->unwrap()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/os/LocaleListHelper;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public get(I)Ljava/util/Locale;
    .locals 1
    .param p1, "index"    # I

    .line 53
    iget-object v0, p0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;->mLocaleList:Landroid/support/v4/os/LocaleListHelper;

    invoke-virtual {v0, p1}, Landroid/support/v4/os/LocaleListHelper;->get(I)Ljava/util/Locale;

    move-result-object v0

    return-object v0
.end method

.method public getFirstMatch([Ljava/lang/String;)Ljava/util/Locale;
    .locals 1
    .param p1, "supportedLocales"    # [Ljava/lang/String;

    .line 96
    iget-object v0, p0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;->mLocaleList:Landroid/support/v4/os/LocaleListHelper;

    if-eqz v0, :cond_0

    .line 97
    invoke-virtual {v0, p1}, Landroid/support/v4/os/LocaleListHelper;->getFirstMatch([Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v0

    return-object v0

    .line 99
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLocaleList()Ljava/lang/Object;
    .locals 1

    .line 48
    iget-object v0, p0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;->mLocaleList:Landroid/support/v4/os/LocaleListHelper;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 80
    iget-object v0, p0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;->mLocaleList:Landroid/support/v4/os/LocaleListHelper;

    invoke-virtual {v0}, Landroid/support/v4/os/LocaleListHelper;->hashCode()I

    move-result v0

    return v0
.end method

.method public indexOf(Ljava/util/Locale;)I
    .locals 1
    .param p1, "locale"    # Ljava/util/Locale;

    .line 70
    iget-object v0, p0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;->mLocaleList:Landroid/support/v4/os/LocaleListHelper;

    invoke-virtual {v0, p1}, Landroid/support/v4/os/LocaleListHelper;->indexOf(Ljava/util/Locale;)I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 58
    iget-object v0, p0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;->mLocaleList:Landroid/support/v4/os/LocaleListHelper;

    invoke-virtual {v0}, Landroid/support/v4/os/LocaleListHelper;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public varargs setLocaleList([Ljava/util/Locale;)V
    .locals 1
    .param p1, "list"    # [Ljava/util/Locale;

    .line 43
    new-instance v0, Landroid/support/v4/os/LocaleListHelper;

    invoke-direct {v0, p1}, Landroid/support/v4/os/LocaleListHelper;-><init>([Ljava/util/Locale;)V

    iput-object v0, p0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;->mLocaleList:Landroid/support/v4/os/LocaleListHelper;

    .line 44
    return-void
.end method

.method public size()I
    .locals 1

    .line 64
    iget-object v0, p0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;->mLocaleList:Landroid/support/v4/os/LocaleListHelper;

    invoke-virtual {v0}, Landroid/support/v4/os/LocaleListHelper;->size()I

    move-result v0

    return v0
.end method

.method public toLanguageTags()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;->mLocaleList:Landroid/support/v4/os/LocaleListHelper;

    invoke-virtual {v0}, Landroid/support/v4/os/LocaleListHelper;->toLanguageTags()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 85
    iget-object v0, p0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;->mLocaleList:Landroid/support/v4/os/LocaleListHelper;

    invoke-virtual {v0}, Landroid/support/v4/os/LocaleListHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
