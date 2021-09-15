.class Landroidx/core/provider/FontRequestWorker;
.super Ljava/lang/Object;
.source "FontRequestWorker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/provider/FontRequestWorker$TypefaceResult;
    }
.end annotation


# static fields
.field private static final DEFAULT_EXECUTOR_SERVICE:Ljava/util/concurrent/ExecutorService;

.field static final LOCK:Ljava/lang/Object;

.field static final PENDING_REPLIES:Landroidx/collection/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/SimpleArrayMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Landroidx/core/util/Consumer<",
            "Landroidx/core/provider/FontRequestWorker$TypefaceResult;",
            ">;>;>;"
        }
    .end annotation
.end field

.field static final sTypefaceCache:Landroidx/collection/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/LruCache<",
            "Ljava/lang/String;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 58
    new-instance v0, Landroidx/collection/LruCache;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Landroidx/collection/LruCache;-><init>(I)V

    sput-object v0, Landroidx/core/provider/FontRequestWorker;->sTypefaceCache:Landroidx/collection/LruCache;

    .line 60
    nop

    .line 61
    const-string v0, "fonts-androidx"

    const/16 v1, 0xa

    const/16 v2, 0x2710

    invoke-static {v0, v1, v2}, Landroidx/core/provider/RequestExecutor;->createDefaultExecutor(Ljava/lang/String;II)Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v0

    sput-object v0, Landroidx/core/provider/FontRequestWorker;->DEFAULT_EXECUTOR_SERVICE:Ljava/util/concurrent/ExecutorService;

    .line 68
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/core/provider/FontRequestWorker;->LOCK:Ljava/lang/Object;

    .line 72
    new-instance v0, Landroidx/collection/SimpleArrayMap;

    invoke-direct {v0}, Landroidx/collection/SimpleArrayMap;-><init>()V

    sput-object v0, Landroidx/core/provider/FontRequestWorker;->PENDING_REPLIES:Landroidx/collection/SimpleArrayMap;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createCacheId(Landroidx/core/provider/FontRequest;I)Ljava/lang/String;
    .locals 2
    .param p0, "request"    # Landroidx/core/provider/FontRequest;
    .param p1, "style"    # I

    .line 221
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroidx/core/provider/FontRequest;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getFontFamilyResultStatus(Landroidx/core/provider/FontsContractCompat$FontFamilyResult;)I
    .locals 7
    .param p0, "fontFamilyResult"    # Landroidx/core/provider/FontsContractCompat$FontFamilyResult;

    .line 263
    invoke-virtual {p0}, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;->getStatusCode()I

    move-result v0

    const/4 v1, -0x3

    if-eqz v0, :cond_0

    .line 264
    invoke-virtual {p0}, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;->getStatusCode()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 268
    return v1

    .line 266
    :pswitch_0
    const/4 v0, -0x2

    return v0

    .line 271
    :cond_0
    invoke-virtual {p0}, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;->getFonts()[Landroidx/core/provider/FontsContractCompat$FontInfo;

    move-result-object v0

    .line 272
    .local v0, "fonts":[Landroidx/core/provider/FontsContractCompat$FontInfo;
    if-eqz v0, :cond_5

    array-length v2, v0

    if-nez v2, :cond_1

    goto :goto_2

    .line 276
    :cond_1
    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_4

    aget-object v5, v0, v4

    .line 279
    .local v5, "font":Landroidx/core/provider/FontsContractCompat$FontInfo;
    invoke-virtual {v5}, Landroidx/core/provider/FontsContractCompat$FontInfo;->getResultCode()I

    move-result v6

    .line 280
    .local v6, "resultCode":I
    if-eqz v6, :cond_3

    .line 283
    if-gez v6, :cond_2

    goto :goto_1

    :cond_2
    move v1, v6

    :goto_1
    return v1

    .line 276
    .end local v5    # "font":Landroidx/core/provider/FontsContractCompat$FontInfo;
    .end local v6    # "resultCode":I
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 287
    :cond_4
    return v3

    .line 273
    :cond_5
    :goto_2
    const/4 v1, 0x1

    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method static getFontSync(Ljava/lang/String;Landroid/content/Context;Landroidx/core/provider/FontRequest;I)Landroidx/core/provider/FontRequestWorker$TypefaceResult;
    .locals 6
    .param p0, "cacheId"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "request"    # Landroidx/core/provider/FontRequest;
    .param p3, "style"    # I

    .line 232
    sget-object v0, Landroidx/core/provider/FontRequestWorker;->sTypefaceCache:Landroidx/collection/LruCache;

    invoke-virtual {v0, p0}, Landroidx/collection/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Typeface;

    .line 233
    .local v1, "cached":Landroid/graphics/Typeface;
    if-eqz v1, :cond_0

    .line 234
    new-instance v0, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    invoke-direct {v0, v1}, Landroidx/core/provider/FontRequestWorker$TypefaceResult;-><init>(Landroid/graphics/Typeface;)V

    return-object v0

    .line 239
    :cond_0
    const/4 v2, 0x0

    :try_start_0
    invoke-static {p1, p2, v2}, Landroidx/core/provider/FontProvider;->getFontFamilyResult(Landroid/content/Context;Landroidx/core/provider/FontRequest;Landroid/os/CancellationSignal;)Landroidx/core/provider/FontsContractCompat$FontFamilyResult;

    move-result-object v3
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 242
    .local v3, "result":Landroidx/core/provider/FontsContractCompat$FontFamilyResult;
    nop

    .line 244
    invoke-static {v3}, Landroidx/core/provider/FontRequestWorker;->getFontFamilyResultStatus(Landroidx/core/provider/FontsContractCompat$FontFamilyResult;)I

    move-result v4

    .line 245
    .local v4, "fontFamilyResultStatus":I
    if-eqz v4, :cond_1

    .line 246
    new-instance v0, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    invoke-direct {v0, v4}, Landroidx/core/provider/FontRequestWorker$TypefaceResult;-><init>(I)V

    return-object v0

    .line 249
    :cond_1
    nop

    .line 250
    invoke-virtual {v3}, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;->getFonts()[Landroidx/core/provider/FontsContractCompat$FontInfo;

    move-result-object v5

    .line 249
    invoke-static {p1, v2, v5, p3}, Landroidx/core/graphics/TypefaceCompat;->createFromFontInfo(Landroid/content/Context;Landroid/os/CancellationSignal;[Landroidx/core/provider/FontsContractCompat$FontInfo;I)Landroid/graphics/Typeface;

    move-result-object v2

    .line 252
    .local v2, "typeface":Landroid/graphics/Typeface;
    if-eqz v2, :cond_2

    .line 253
    invoke-virtual {v0, p0, v2}, Landroidx/collection/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    new-instance v0, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    invoke-direct {v0, v2}, Landroidx/core/provider/FontRequestWorker$TypefaceResult;-><init>(Landroid/graphics/Typeface;)V

    return-object v0

    .line 256
    :cond_2
    new-instance v0, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    const/4 v5, -0x3

    invoke-direct {v0, v5}, Landroidx/core/provider/FontRequestWorker$TypefaceResult;-><init>(I)V

    return-object v0

    .line 240
    .end local v2    # "typeface":Landroid/graphics/Typeface;
    .end local v3    # "result":Landroidx/core/provider/FontsContractCompat$FontFamilyResult;
    .end local v4    # "fontFamilyResultStatus":I
    :catch_0
    move-exception v0

    .line 241
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v2, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    const/4 v3, -0x1

    invoke-direct {v2, v3}, Landroidx/core/provider/FontRequestWorker$TypefaceResult;-><init>(I)V

    return-object v2
.end method

.method static requestFontAsync(Landroid/content/Context;Landroidx/core/provider/FontRequest;ILjava/util/concurrent/Executor;Landroidx/core/provider/CallbackWithHandler;)Landroid/graphics/Typeface;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "request"    # Landroidx/core/provider/FontRequest;
    .param p2, "style"    # I
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .param p4, "callback"    # Landroidx/core/provider/CallbackWithHandler;

    .line 164
    invoke-static {p1, p2}, Landroidx/core/provider/FontRequestWorker;->createCacheId(Landroidx/core/provider/FontRequest;I)Ljava/lang/String;

    move-result-object v0

    .line 165
    .local v0, "id":Ljava/lang/String;
    sget-object v1, Landroidx/core/provider/FontRequestWorker;->sTypefaceCache:Landroidx/collection/LruCache;

    invoke-virtual {v1, v0}, Landroidx/collection/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Typeface;

    .line 166
    .local v1, "cached":Landroid/graphics/Typeface;
    if-eqz v1, :cond_0

    .line 167
    new-instance v2, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    invoke-direct {v2, v1}, Landroidx/core/provider/FontRequestWorker$TypefaceResult;-><init>(Landroid/graphics/Typeface;)V

    invoke-virtual {p4, v2}, Landroidx/core/provider/CallbackWithHandler;->onTypefaceResult(Landroidx/core/provider/FontRequestWorker$TypefaceResult;)V

    .line 168
    return-object v1

    .line 171
    :cond_0
    new-instance v2, Landroidx/core/provider/FontRequestWorker$2;

    invoke-direct {v2, p4}, Landroidx/core/provider/FontRequestWorker$2;-><init>(Landroidx/core/provider/CallbackWithHandler;)V

    .line 178
    .local v2, "reply":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/core/provider/FontRequestWorker$TypefaceResult;>;"
    sget-object v3, Landroidx/core/provider/FontRequestWorker;->LOCK:Ljava/lang/Object;

    monitor-enter v3

    .line 179
    :try_start_0
    sget-object v4, Landroidx/core/provider/FontRequestWorker;->PENDING_REPLIES:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {v4, v0}, Landroidx/collection/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    .line 180
    .local v5, "pendingReplies":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/core/util/Consumer<Landroidx/core/provider/FontRequestWorker$TypefaceResult;>;>;"
    const/4 v6, 0x0

    if-eqz v5, :cond_1

    .line 183
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 184
    monitor-exit v3

    return-object v6

    .line 186
    :cond_1
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    move-object v5, v7

    .line 187
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 188
    invoke-virtual {v4, v0, v5}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    nop

    .end local v5    # "pendingReplies":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/core/util/Consumer<Landroidx/core/provider/FontRequestWorker$TypefaceResult;>;>;"
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    new-instance v3, Landroidx/core/provider/FontRequestWorker$3;

    invoke-direct {v3, v0, p0, p1, p2}, Landroidx/core/provider/FontRequestWorker$3;-><init>(Ljava/lang/String;Landroid/content/Context;Landroidx/core/provider/FontRequest;I)V

    .line 198
    .local v3, "fetcher":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Landroidx/core/provider/FontRequestWorker$TypefaceResult;>;"
    if-nez p3, :cond_2

    sget-object v4, Landroidx/core/provider/FontRequestWorker;->DEFAULT_EXECUTOR_SERVICE:Ljava/util/concurrent/ExecutorService;

    goto :goto_0

    :cond_2
    move-object v4, p3

    .line 200
    .local v4, "finalExecutor":Ljava/util/concurrent/Executor;
    :goto_0
    new-instance v5, Landroidx/core/provider/FontRequestWorker$4;

    invoke-direct {v5, v0}, Landroidx/core/provider/FontRequestWorker$4;-><init>(Ljava/lang/String;)V

    invoke-static {v4, v3, v5}, Landroidx/core/provider/RequestExecutor;->execute(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;Landroidx/core/util/Consumer;)V

    .line 217
    return-object v6

    .line 189
    .end local v3    # "fetcher":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Landroidx/core/provider/FontRequestWorker$TypefaceResult;>;"
    .end local v4    # "finalExecutor":Ljava/util/concurrent/Executor;
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4
.end method

.method static requestFontSync(Landroid/content/Context;Landroidx/core/provider/FontRequest;Landroidx/core/provider/CallbackWithHandler;II)Landroid/graphics/Typeface;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "request"    # Landroidx/core/provider/FontRequest;
    .param p2, "callback"    # Landroidx/core/provider/CallbackWithHandler;
    .param p3, "style"    # I
    .param p4, "timeoutInMillis"    # I

    .line 102
    invoke-static {p1, p3}, Landroidx/core/provider/FontRequestWorker;->createCacheId(Landroidx/core/provider/FontRequest;I)Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, "id":Ljava/lang/String;
    sget-object v1, Landroidx/core/provider/FontRequestWorker;->sTypefaceCache:Landroidx/collection/LruCache;

    invoke-virtual {v1, v0}, Landroidx/collection/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Typeface;

    .line 104
    .local v1, "cached":Landroid/graphics/Typeface;
    if-eqz v1, :cond_0

    .line 105
    new-instance v2, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    invoke-direct {v2, v1}, Landroidx/core/provider/FontRequestWorker$TypefaceResult;-><init>(Landroid/graphics/Typeface;)V

    invoke-virtual {p2, v2}, Landroidx/core/provider/CallbackWithHandler;->onTypefaceResult(Landroidx/core/provider/FontRequestWorker$TypefaceResult;)V

    .line 106
    return-object v1

    .line 110
    :cond_0
    const/4 v2, -0x1

    if-ne p4, v2, :cond_1

    .line 112
    invoke-static {v0, p0, p1, p3}, Landroidx/core/provider/FontRequestWorker;->getFontSync(Ljava/lang/String;Landroid/content/Context;Landroidx/core/provider/FontRequest;I)Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    move-result-object v2

    .line 113
    .local v2, "typefaceResult":Landroidx/core/provider/FontRequestWorker$TypefaceResult;
    invoke-virtual {p2, v2}, Landroidx/core/provider/CallbackWithHandler;->onTypefaceResult(Landroidx/core/provider/FontRequestWorker$TypefaceResult;)V

    .line 114
    iget-object v3, v2, Landroidx/core/provider/FontRequestWorker$TypefaceResult;->mTypeface:Landroid/graphics/Typeface;

    return-object v3

    .line 117
    .end local v2    # "typefaceResult":Landroidx/core/provider/FontRequestWorker$TypefaceResult;
    :cond_1
    new-instance v2, Landroidx/core/provider/FontRequestWorker$1;

    invoke-direct {v2, v0, p0, p1, p3}, Landroidx/core/provider/FontRequestWorker$1;-><init>(Ljava/lang/String;Landroid/content/Context;Landroidx/core/provider/FontRequest;I)V

    .line 125
    .local v2, "fetcher":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Landroidx/core/provider/FontRequestWorker$TypefaceResult;>;"
    :try_start_0
    sget-object v3, Landroidx/core/provider/FontRequestWorker;->DEFAULT_EXECUTOR_SERVICE:Ljava/util/concurrent/ExecutorService;

    invoke-static {v3, v2, p4}, Landroidx/core/provider/RequestExecutor;->submit(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/Callable;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    .line 130
    .local v3, "typefaceResult":Landroidx/core/provider/FontRequestWorker$TypefaceResult;
    invoke-virtual {p2, v3}, Landroidx/core/provider/CallbackWithHandler;->onTypefaceResult(Landroidx/core/provider/FontRequestWorker$TypefaceResult;)V

    .line 131
    iget-object v4, v3, Landroidx/core/provider/FontRequestWorker$TypefaceResult;->mTypeface:Landroid/graphics/Typeface;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    .line 132
    .end local v3    # "typefaceResult":Landroidx/core/provider/FontRequestWorker$TypefaceResult;
    :catch_0
    move-exception v3

    .line 133
    .local v3, "e":Ljava/lang/InterruptedException;
    new-instance v4, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    const/4 v5, -0x3

    invoke-direct {v4, v5}, Landroidx/core/provider/FontRequestWorker$TypefaceResult;-><init>(I)V

    invoke-virtual {p2, v4}, Landroidx/core/provider/CallbackWithHandler;->onTypefaceResult(Landroidx/core/provider/FontRequestWorker$TypefaceResult;)V

    .line 134
    const/4 v4, 0x0

    return-object v4
.end method

.method static resetTypefaceCache()V
    .locals 1

    .line 76
    sget-object v0, Landroidx/core/provider/FontRequestWorker;->sTypefaceCache:Landroidx/collection/LruCache;

    invoke-virtual {v0}, Landroidx/collection/LruCache;->evictAll()V

    .line 77
    return-void
.end method
