.class Landroidx/core/view/DisplayCompat$Api23Impl;
.super Ljava/lang/Object;
.source "DisplayCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/DisplayCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Api23Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getMode(Landroid/content/Context;Landroid/view/Display;)Landroidx/core/view/DisplayCompat$ModeCompat;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "display"    # Landroid/view/Display;

    .line 239
    invoke-virtual {p1}, Landroid/view/Display;->getMode()Landroid/view/Display$Mode;

    move-result-object v0

    .line 240
    .local v0, "currentMode":Landroid/view/Display$Mode;
    invoke-static {p0, p1}, Landroidx/core/view/DisplayCompat;->getCurrentDisplaySizeFromWorkarounds(Landroid/content/Context;Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v1

    .line 243
    .local v1, "workaroundSize":Landroid/graphics/Point;
    if-eqz v1, :cond_1

    invoke-static {v0, v1}, Landroidx/core/view/DisplayCompat$Api23Impl;->physicalSizeEquals(Landroid/view/Display$Mode;Landroid/graphics/Point;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 245
    :cond_0
    new-instance v2, Landroidx/core/view/DisplayCompat$ModeCompat;

    invoke-direct {v2, v0, v1}, Landroidx/core/view/DisplayCompat$ModeCompat;-><init>(Landroid/view/Display$Mode;Landroid/graphics/Point;)V

    goto :goto_1

    .line 244
    :cond_1
    :goto_0
    new-instance v2, Landroidx/core/view/DisplayCompat$ModeCompat;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Landroidx/core/view/DisplayCompat$ModeCompat;-><init>(Landroid/view/Display$Mode;Z)V

    .line 243
    :goto_1
    return-object v2
.end method

.method public static getSupportedModes(Landroid/content/Context;Landroid/view/Display;)[Landroidx/core/view/DisplayCompat$ModeCompat;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "display"    # Landroid/view/Display;

    .line 252
    invoke-virtual {p1}, Landroid/view/Display;->getSupportedModes()[Landroid/view/Display$Mode;

    move-result-object v0

    .line 253
    .local v0, "supportedModes":[Landroid/view/Display$Mode;
    array-length v1, v0

    new-array v1, v1, [Landroidx/core/view/DisplayCompat$ModeCompat;

    .line 255
    .local v1, "supportedModesCompat":[Landroidx/core/view/DisplayCompat$ModeCompat;
    invoke-virtual {p1}, Landroid/view/Display;->getMode()Landroid/view/Display$Mode;

    move-result-object v2

    .line 256
    .local v2, "currentMode":Landroid/view/Display$Mode;
    invoke-static {p0, p1}, Landroidx/core/view/DisplayCompat;->getCurrentDisplaySizeFromWorkarounds(Landroid/content/Context;Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v3

    .line 259
    .local v3, "workaroundSize":Landroid/graphics/Point;
    if-eqz v3, :cond_2

    invoke-static {v2, v3}, Landroidx/core/view/DisplayCompat$Api23Impl;->physicalSizeEquals(Landroid/view/Display$Mode;Landroid/graphics/Point;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_2

    .line 267
    :cond_0
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, v0

    if-ge v4, v5, :cond_3

    .line 269
    aget-object v5, v0, v4

    invoke-static {v5, v2}, Landroidx/core/view/DisplayCompat$Api23Impl;->physicalSizeEquals(Landroid/view/Display$Mode;Landroid/view/Display$Mode;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 270
    new-instance v5, Landroidx/core/view/DisplayCompat$ModeCompat;

    aget-object v6, v0, v4

    invoke-direct {v5, v6, v3}, Landroidx/core/view/DisplayCompat$ModeCompat;-><init>(Landroid/view/Display$Mode;Landroid/graphics/Point;)V

    goto :goto_1

    .line 271
    :cond_1
    new-instance v5, Landroidx/core/view/DisplayCompat$ModeCompat;

    aget-object v6, v0, v4

    const/4 v7, 0x0

    invoke-direct {v5, v6, v7}, Landroidx/core/view/DisplayCompat$ModeCompat;-><init>(Landroid/view/Display$Mode;Z)V

    :goto_1
    aput-object v5, v1, v4

    .line 267
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 261
    .end local v4    # "i":I
    :cond_2
    :goto_2
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_3
    array-length v5, v0

    if-ge v4, v5, :cond_3

    .line 262
    aget-object v5, v0, v4

    invoke-static {v5, v2}, Landroidx/core/view/DisplayCompat$Api23Impl;->physicalSizeEquals(Landroid/view/Display$Mode;Landroid/view/Display$Mode;)Z

    move-result v5

    .line 263
    .local v5, "isNative":Z
    new-instance v6, Landroidx/core/view/DisplayCompat$ModeCompat;

    aget-object v7, v0, v4

    invoke-direct {v6, v7, v5}, Landroidx/core/view/DisplayCompat$ModeCompat;-><init>(Landroid/view/Display$Mode;Z)V

    aput-object v6, v1, v4

    .line 261
    .end local v5    # "isNative":Z
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 274
    .end local v4    # "i":I
    :cond_3
    return-object v1
.end method

.method static isCurrentModeTheLargestMode(Landroid/view/Display;)Z
    .locals 5
    .param p0, "display"    # Landroid/view/Display;

    .line 278
    invoke-virtual {p0}, Landroid/view/Display;->getMode()Landroid/view/Display$Mode;

    move-result-object v0

    .line 279
    .local v0, "currentMode":Landroid/view/Display$Mode;
    invoke-virtual {p0}, Landroid/view/Display;->getSupportedModes()[Landroid/view/Display$Mode;

    move-result-object v1

    .line 280
    .local v1, "supportedModes":[Landroid/view/Display$Mode;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_2

    .line 281
    invoke-virtual {v0}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v3

    aget-object v4, v1, v2

    invoke-virtual {v4}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v4

    if-lt v3, v4, :cond_1

    .line 282
    invoke-virtual {v0}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v3

    aget-object v4, v1, v2

    invoke-virtual {v4}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v4

    if-ge v3, v4, :cond_0

    goto :goto_1

    .line 280
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 283
    :cond_1
    :goto_1
    const/4 v3, 0x0

    return v3

    .line 286
    .end local v2    # "i":I
    :cond_2
    const/4 v2, 0x1

    return v2
.end method

.method static physicalSizeEquals(Landroid/view/Display$Mode;Landroid/graphics/Point;)Z
    .locals 2
    .param p0, "mode"    # Landroid/view/Display$Mode;
    .param p1, "size"    # Landroid/graphics/Point;

    .line 294
    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v0

    iget v1, p1, Landroid/graphics/Point;->x:I

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v0

    iget v1, p1, Landroid/graphics/Point;->y:I

    if-eq v0, v1, :cond_1

    .line 295
    :cond_0
    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v0

    iget v1, p1, Landroid/graphics/Point;->y:I

    if-ne v0, v1, :cond_2

    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v0

    iget v1, p1, Landroid/graphics/Point;->x:I

    if-ne v0, v1, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 294
    :goto_0
    return v0
.end method

.method static physicalSizeEquals(Landroid/view/Display$Mode;Landroid/view/Display$Mode;)Z
    .locals 2
    .param p0, "mode"    # Landroid/view/Display$Mode;
    .param p1, "otherMode"    # Landroid/view/Display$Mode;

    .line 303
    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 304
    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 303
    :goto_0
    return v0
.end method
