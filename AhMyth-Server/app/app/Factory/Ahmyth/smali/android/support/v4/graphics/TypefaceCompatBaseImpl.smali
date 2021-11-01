.class Landroid/support/v4/graphics/TypefaceCompatBaseImpl;
.super Ljava/lang/Object;
.source "TypefaceCompatBaseImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/graphics/TypefaceCompatBaseImpl$StyleExtractor;
    }
.end annotation


# static fields
.field private static final CACHE_FILE_PREFIX:Ljava/lang/String; = "cached_font_"

.field private static final TAG:Ljava/lang/String; = "TypefaceCompatBaseImpl"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private findBestEntry(Landroid/support/v4/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;I)Landroid/support/v4/content/res/FontResourcesParserCompat$FontFileResourceEntry;
    .locals 1

    .line 124
    invoke-virtual {p1}, Landroid/support/v4/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;->getEntries()[Landroid/support/v4/content/res/FontResourcesParserCompat$FontFileResourceEntry;

    move-result-object p1

    new-instance v0, Landroid/support/v4/graphics/TypefaceCompatBaseImpl$2;

    invoke-direct {v0, p0}, Landroid/support/v4/graphics/TypefaceCompatBaseImpl$2;-><init>(Landroid/support/v4/graphics/TypefaceCompatBaseImpl;)V

    invoke-static {p1, p2, v0}, Landroid/support/v4/graphics/TypefaceCompatBaseImpl;->findBestFont([Ljava/lang/Object;ILandroid/support/v4/graphics/TypefaceCompatBaseImpl$StyleExtractor;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v4/content/res/FontResourcesParserCompat$FontFileResourceEntry;

    return-object p1
.end method

.method private static findBestFont([Ljava/lang/Object;ILandroid/support/v4/graphics/TypefaceCompatBaseImpl$StyleExtractor;)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I",
            "Landroid/support/v4/graphics/TypefaceCompatBaseImpl$StyleExtractor<",
            "TT;>;)TT;"
        }
    .end annotation

    and-int/lit8 v0, p1, 0x1

    if-nez v0, :cond_0

    const/16 v0, 0x190

    goto :goto_0

    :cond_0
    const/16 v0, 0x2bc

    :goto_0
    and-int/lit8 p1, p1, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    const/4 v3, 0x0

    const v4, 0x7fffffff

    .line 58
    array-length v5, p0

    const/4 v6, 0x0

    :goto_2
    if-ge v6, v5, :cond_5

    aget-object v7, p0, v6

    .line 59
    invoke-interface {p2, v7}, Landroid/support/v4/graphics/TypefaceCompatBaseImpl$StyleExtractor;->getWeight(Ljava/lang/Object;)I

    move-result v8

    sub-int/2addr v8, v0

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    mul-int/lit8 v8, v8, 0x2

    .line 60
    invoke-interface {p2, v7}, Landroid/support/v4/graphics/TypefaceCompatBaseImpl$StyleExtractor;->isItalic(Ljava/lang/Object;)Z

    move-result v9

    if-ne v9, p1, :cond_2

    const/4 v9, 0x0

    goto :goto_3

    :cond_2
    const/4 v9, 0x1

    :goto_3
    add-int/2addr v8, v9

    if-eqz v3, :cond_3

    if-le v4, v8, :cond_4

    :cond_3
    move-object v3, v7

    move v4, v8

    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_5
    return-object v3
.end method


# virtual methods
.method public createFromFontFamilyFilesResourceEntry(Landroid/content/Context;Landroid/support/v4/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;
    .locals 1

    .line 140
    invoke-direct {p0, p2, p4}, Landroid/support/v4/graphics/TypefaceCompatBaseImpl;->findBestEntry(Landroid/support/v4/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;I)Landroid/support/v4/content/res/FontResourcesParserCompat$FontFileResourceEntry;

    move-result-object p2

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 145
    :cond_0
    invoke-virtual {p2}, Landroid/support/v4/content/res/FontResourcesParserCompat$FontFileResourceEntry;->getResourceId()I

    move-result v0

    invoke-virtual {p2}, Landroid/support/v4/content/res/FontResourcesParserCompat$FontFileResourceEntry;->getFileName()Ljava/lang/String;

    move-result-object p2

    .line 144
    invoke-static {p1, p3, v0, p2, p4}, Landroid/support/v4/graphics/TypefaceCompat;->createFromResourcesFontFile(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1
.end method

.method public createFromFontInfo(Landroid/content/Context;Landroid/os/CancellationSignal;[Landroid/support/v4/provider/FontsContractCompat$FontInfo;I)Landroid/graphics/Typeface;
    .locals 2

    .line 108
    array-length p2, p3

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ge p2, v1, :cond_0

    return-object v0

    .line 111
    :cond_0
    invoke-virtual {p0, p3, p4}, Landroid/support/v4/graphics/TypefaceCompatBaseImpl;->findBestInfo([Landroid/support/v4/provider/FontsContractCompat$FontInfo;I)Landroid/support/v4/provider/FontsContractCompat$FontInfo;

    move-result-object p2

    .line 114
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    invoke-virtual {p2}, Landroid/support/v4/provider/FontsContractCompat$FontInfo;->getUri()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p3, p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 115
    :try_start_1
    invoke-virtual {p0, p1, p2}, Landroid/support/v4/graphics/TypefaceCompatBaseImpl;->createFromInputStream(Landroid/content/Context;Ljava/io/InputStream;)Landroid/graphics/Typeface;

    move-result-object p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 119
    invoke-static {p2}, Landroid/support/v4/graphics/TypefaceCompatUtil;->closeQuietly(Ljava/io/Closeable;)V

    return-object p1

    :catchall_0
    move-exception p1

    move-object v0, p2

    goto :goto_0

    :catchall_1
    move-exception p1

    :goto_0
    invoke-static {v0}, Landroid/support/v4/graphics/TypefaceCompatUtil;->closeQuietly(Ljava/io/Closeable;)V

    throw p1

    :catch_0
    move-object p2, v0

    :catch_1
    invoke-static {p2}, Landroid/support/v4/graphics/TypefaceCompatUtil;->closeQuietly(Ljava/io/Closeable;)V

    return-object v0
.end method

.method protected createFromInputStream(Landroid/content/Context;Ljava/io/InputStream;)Landroid/graphics/Typeface;
    .locals 1

    .line 86
    invoke-static {p1}, Landroid/support/v4/graphics/TypefaceCompatUtil;->getTempFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 91
    :cond_0
    :try_start_0
    invoke-static {p1, p2}, Landroid/support/v4/graphics/TypefaceCompatUtil;->copyToFile(Ljava/io/File;Ljava/io/InputStream;)Z

    move-result p2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p2, :cond_1

    .line 101
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object v0

    .line 94
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p2
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 101
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object p2

    :catchall_0
    move-exception p2

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    throw p2

    :catch_0
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object v0
.end method

.method public createFromResourcesFontFile(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;
    .locals 0

    .line 154
    invoke-static {p1}, Landroid/support/v4/graphics/TypefaceCompatUtil;->getTempFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object p1

    const/4 p4, 0x0

    if-nez p1, :cond_0

    return-object p4

    .line 159
    :cond_0
    :try_start_0
    invoke-static {p1, p2, p3}, Landroid/support/v4/graphics/TypefaceCompatUtil;->copyToFile(Ljava/io/File;Landroid/content/res/Resources;I)Z

    move-result p2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p2, :cond_1

    .line 169
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object p4

    .line 162
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p2
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 169
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object p2

    :catchall_0
    move-exception p2

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    throw p2

    :catch_0
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object p4
.end method

.method protected findBestInfo([Landroid/support/v4/provider/FontsContractCompat$FontInfo;I)Landroid/support/v4/provider/FontsContractCompat$FontInfo;
    .locals 1

    .line 71
    new-instance v0, Landroid/support/v4/graphics/TypefaceCompatBaseImpl$1;

    invoke-direct {v0, p0}, Landroid/support/v4/graphics/TypefaceCompatBaseImpl$1;-><init>(Landroid/support/v4/graphics/TypefaceCompatBaseImpl;)V

    invoke-static {p1, p2, v0}, Landroid/support/v4/graphics/TypefaceCompatBaseImpl;->findBestFont([Ljava/lang/Object;ILandroid/support/v4/graphics/TypefaceCompatBaseImpl$StyleExtractor;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v4/provider/FontsContractCompat$FontInfo;

    return-object p1
.end method
