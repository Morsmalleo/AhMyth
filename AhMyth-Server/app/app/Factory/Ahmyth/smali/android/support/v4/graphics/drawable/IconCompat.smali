.class public Landroid/support/v4/graphics/drawable/IconCompat;
.super Landroidx/versionedparcelable/CustomVersionedParcelable;
.source "IconCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/graphics/drawable/IconCompat$IconType;
    }
.end annotation


# static fields
.field private static final ADAPTIVE_ICON_INSET_FACTOR:F = 0.25f

.field private static final AMBIENT_SHADOW_ALPHA:I = 0x1e

.field private static final BLUR_FACTOR:F = 0.010416667f

.field static final DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

.field private static final DEFAULT_VIEW_PORT_SCALE:F = 0.6666667f

.field private static final EXTRA_INT1:Ljava/lang/String; = "int1"

.field private static final EXTRA_INT2:Ljava/lang/String; = "int2"

.field private static final EXTRA_OBJ:Ljava/lang/String; = "obj"

.field private static final EXTRA_TINT_LIST:Ljava/lang/String; = "tint_list"

.field private static final EXTRA_TINT_MODE:Ljava/lang/String; = "tint_mode"

.field private static final EXTRA_TYPE:Ljava/lang/String; = "type"

.field private static final ICON_DIAMETER_FACTOR:F = 0.9166667f

.field private static final KEY_SHADOW_ALPHA:I = 0x3d

.field private static final KEY_SHADOW_OFFSET_FACTOR:F = 0.020833334f

.field private static final TAG:Ljava/lang/String; = "IconCompat"

.field public static final TYPE_UNKNOWN:I = -0x1


# instance fields
.field public mData:[B

.field public mInt1:I

.field public mInt2:I

.field mObj1:Ljava/lang/Object;

.field public mParcelable:Landroid/os/Parcelable;

.field public mTintList:Landroid/content/res/ColorStateList;

.field mTintMode:Landroid/graphics/PorterDuff$Mode;

.field public mTintModeStr:Ljava/lang/String;

.field public mType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 176
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    sput-object v0, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 307
    invoke-direct {p0}, Landroidx/versionedparcelable/CustomVersionedParcelable;-><init>()V

    const/4 v0, 0x0

    .line 172
    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    .line 177
    sget-object v0, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    return-void
.end method

.method private constructor <init>(I)V
    .locals 1

    .line 310
    invoke-direct {p0}, Landroidx/versionedparcelable/CustomVersionedParcelable;-><init>()V

    const/4 v0, 0x0

    .line 172
    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    .line 177
    sget-object v0, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    .line 311
    iput p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    return-void
.end method

.method public static createFromBundle(Landroid/os/Bundle;)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 4

    const-string v0, "type"

    .line 803
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 804
    new-instance v1, Landroid/support/v4/graphics/drawable/IconCompat;

    invoke-direct {v1, v0}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    const-string v2, "int1"

    .line 805
    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    const-string v2, "int2"

    .line 806
    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    const-string v2, "tint_list"

    .line 807
    invoke-virtual {p0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 808
    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/content/res/ColorStateList;

    iput-object v2, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    :cond_0
    const-string v2, "tint_mode"

    .line 810
    invoke-virtual {p0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 812
    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 811
    invoke-static {v2}, Landroid/graphics/PorterDuff$Mode;->valueOf(Ljava/lang/String;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v2

    iput-object v2, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    :cond_1
    const/4 v2, -0x1

    const-string v3, "obj"

    if-eq v0, v2, :cond_4

    const/4 v2, 0x1

    if-eq v0, v2, :cond_4

    const/4 v2, 0x2

    if-eq v0, v2, :cond_3

    const/4 v2, 0x3

    if-eq v0, v2, :cond_2

    const/4 v2, 0x4

    if-eq v0, v2, :cond_3

    const/4 v2, 0x5

    if-eq v0, v2, :cond_4

    .line 828
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown type "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "IconCompat"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0

    .line 825
    :cond_2
    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object p0

    iput-object p0, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    goto :goto_0

    .line 822
    :cond_3
    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    goto :goto_0

    .line 818
    :cond_4
    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p0

    iput-object p0, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    :goto_0
    return-object v1
.end method

.method public static createFromIcon(Landroid/content/Context;Landroid/graphics/drawable/Icon;)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 2

    .line 840
    invoke-static {p1}, Landroid/support/v4/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 841
    invoke-static {p1}, Landroid/support/v4/graphics/drawable/IconCompat;->getType(Landroid/graphics/drawable/Icon;)I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 p0, 0x4

    if-eq v0, p0, :cond_0

    .line 853
    new-instance p0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v0, -0x1

    invoke-direct {p0, v0}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    .line 854
    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    return-object p0

    .line 851
    :cond_0
    invoke-static {p1}, Landroid/support/v4/graphics/drawable/IconCompat;->getUri(Landroid/graphics/drawable/Icon;)Landroid/net/Uri;

    move-result-object p0

    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->createWithContentUri(Landroid/net/Uri;)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p0

    return-object p0

    .line 843
    :cond_1
    invoke-static {p1}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage(Landroid/graphics/drawable/Icon;)Ljava/lang/String;

    move-result-object v0

    .line 845
    :try_start_0
    invoke-static {p0, v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResources(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object p0

    .line 846
    invoke-static {p1}, Landroid/support/v4/graphics/drawable/IconCompat;->getResId(Landroid/graphics/drawable/Icon;)I

    move-result p1

    .line 845
    invoke-static {p0, v0, p1}, Landroid/support/v4/graphics/drawable/IconCompat;->createWithResource(Landroid/content/res/Resources;Ljava/lang/String;I)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p0
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 848
    :catch_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Icon resource cannot be found"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createFromIcon(Landroid/graphics/drawable/Icon;)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 2

    .line 866
    invoke-static {p0}, Landroid/support/v4/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 867
    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getType(Landroid/graphics/drawable/Icon;)I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 873
    new-instance v0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    .line 874
    iput-object p0, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    return-object v0

    .line 871
    :cond_0
    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getUri(Landroid/graphics/drawable/Icon;)Landroid/net/Uri;

    move-result-object p0

    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->createWithContentUri(Landroid/net/Uri;)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 v0, 0x0

    .line 869
    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage(Landroid/graphics/drawable/Icon;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResId(Landroid/graphics/drawable/Icon;)I

    move-result p0

    invoke-static {v0, v1, p0}, Landroid/support/v4/graphics/drawable/IconCompat;->createWithResource(Landroid/content/res/Resources;Ljava/lang/String;I)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p0

    return-object p0
.end method

.method static createLegacyIconFromAdaptiveIcon(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    .locals 9

    .line 999
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    .line 1000
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 999
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3f2aaaab

    mul-float v0, v0, v1

    float-to-int v0, v0

    .line 1002
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 1003
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 1004
    new-instance v3, Landroid/graphics/Paint;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Landroid/graphics/Paint;-><init>(I)V

    int-to-float v4, v0

    const/high16 v5, 0x3f000000    # 0.5f

    mul-float v5, v5, v4

    const v6, 0x3f6aaaab

    mul-float v6, v6, v5

    if-eqz p1, :cond_0

    const p1, 0x3c2aaaab

    mul-float p1, p1, v4

    const/4 v7, 0x0

    .line 1012
    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setColor(I)V

    const v7, 0x3caaaaab

    mul-float v4, v4, v7

    const/high16 v7, 0x3d000000    # 0.03125f

    const/4 v8, 0x0

    .line 1013
    invoke-virtual {v3, p1, v8, v4, v7}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 1014
    invoke-virtual {v2, v5, v5, v6, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x1e000000

    .line 1017
    invoke-virtual {v3, p1, v8, v8, v4}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 1018
    invoke-virtual {v2, v5, v5, v6, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1019
    invoke-virtual {v3}, Landroid/graphics/Paint;->clearShadowLayer()V

    :cond_0
    const/high16 p1, -0x1000000

    .line 1023
    invoke-virtual {v3, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1024
    new-instance p1, Landroid/graphics/BitmapShader;

    sget-object v4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {p1, p0, v4, v7}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 1026
    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 1027
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    sub-int/2addr v7, v0

    neg-int v7, v7

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    .line 1028
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    sub-int/2addr p0, v0

    neg-int p0, p0

    div-int/lit8 p0, p0, 0x2

    int-to-float p0, p0

    .line 1027
    invoke-virtual {v4, v7, p0}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 1029
    invoke-virtual {p1, v4}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 1030
    invoke-virtual {v3, p1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 1031
    invoke-virtual {v2, v5, v5, v6, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/4 p0, 0x0

    .line 1033
    invoke-virtual {v2, p0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    return-object v1
.end method

.method public static createWithAdaptiveBitmap(Landroid/graphics/Bitmap;)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 2

    if-eqz p0, :cond_0

    .line 249
    new-instance v0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    .line 250
    iput-object p0, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    return-object v0

    .line 247
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Bitmap must not be null."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createWithBitmap(Landroid/graphics/Bitmap;)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 2

    if-eqz p0, :cond_0

    .line 234
    new-instance v0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    .line 235
    iput-object p0, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    return-object v0

    .line 232
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Bitmap must not be null."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createWithContentUri(Landroid/net/Uri;)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 1

    if-eqz p0, :cond_0

    .line 299
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->createWithContentUri(Ljava/lang/String;)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p0

    return-object p0

    .line 297
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Uri must not be null."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createWithContentUri(Ljava/lang/String;)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 2

    if-eqz p0, :cond_0

    .line 284
    new-instance v0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    .line 285
    iput-object p0, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    return-object v0

    .line 282
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Uri must not be null."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createWithData([BII)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 2

    if-eqz p0, :cond_0

    .line 267
    new-instance v0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    .line 268
    iput-object p0, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    .line 269
    iput p1, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    .line 270
    iput p2, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    return-object v0

    .line 265
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Data must not be null."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createWithResource(Landroid/content/Context;I)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 1

    if-eqz p0, :cond_0

    .line 197
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, p1}, Landroid/support/v4/graphics/drawable/IconCompat;->createWithResource(Landroid/content/res/Resources;Ljava/lang/String;I)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p0

    return-object p0

    .line 195
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Context must not be null."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createWithResource(Landroid/content/res/Resources;Ljava/lang/String;I)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 2

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    .line 211
    new-instance v0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    .line 212
    iput p2, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    if-eqz p0, :cond_0

    .line 215
    :try_start_0
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 217
    :catch_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Icon resource cannot be found"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 220
    :cond_0
    iput-object p1, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    :goto_0
    return-object v0

    .line 209
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Drawable resource ID must not be 0"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 206
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Package must not be null."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static getResId(Landroid/graphics/drawable/Icon;)I
    .locals 6

    const-string v0, "Unable to get icon resource"

    const-string v1, "IconCompat"

    .line 945
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v2, v3, :cond_0

    .line 946
    invoke-virtual {p0}, Landroid/graphics/drawable/Icon;->getResId()I

    move-result p0

    return p0

    :cond_0
    const/4 v2, 0x0

    .line 949
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "getResId"

    new-array v5, v2, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 957
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v2

    :catch_1
    move-exception p0

    .line 954
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v2

    :catch_2
    move-exception p0

    .line 951
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v2
.end method

.method private static getResPackage(Landroid/graphics/drawable/Icon;)Ljava/lang/String;
    .locals 7

    const-string v0, "Unable to get icon package"

    const-string v1, "IconCompat"

    .line 916
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v2, v3, :cond_0

    .line 917
    invoke-virtual {p0}, Landroid/graphics/drawable/Icon;->getResPackage()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 v2, 0x0

    .line 920
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "getResPackage"

    const/4 v5, 0x0

    new-array v6, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v5, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 928
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v2

    :catch_1
    move-exception p0

    .line 925
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v2

    :catch_2
    move-exception p0

    .line 922
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v2
.end method

.method private static getResources(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/Resources;
    .locals 3

    const-string v0, "android"

    .line 562
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 563
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object p0

    return-object p0

    .line 565
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/16 v0, 0x2000

    const/4 v1, 0x0

    .line 567
    :try_start_0
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 570
    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Landroid/content/pm/ApplicationInfo;)Landroid/content/res/Resources;

    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :cond_1
    return-object v1

    :catch_0
    move-exception p0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v0, v2

    const-string p1, "Unable to find pkg=%s for icon"

    .line 575
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "IconCompat"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v1
.end method

.method private static getType(Landroid/graphics/drawable/Icon;)I
    .locals 7

    const-string v0, "Unable to get icon type "

    const-string v1, "IconCompat"

    .line 888
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v2, v3, :cond_0

    .line 889
    invoke-virtual {p0}, Landroid/graphics/drawable/Icon;->getType()I

    move-result p0

    return p0

    :cond_0
    const/4 v2, -0x1

    .line 892
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "getType"

    const/4 v5, 0x0

    new-array v6, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v5, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception v3

    .line 900
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v2

    :catch_1
    move-exception v3

    .line 897
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v2

    :catch_2
    move-exception v3

    .line 894
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v2
.end method

.method private static getUri(Landroid/graphics/drawable/Icon;)Landroid/net/Uri;
    .locals 7

    const-string v0, "Unable to get icon uri"

    const-string v1, "IconCompat"

    .line 973
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v2, v3, :cond_0

    .line 974
    invoke-virtual {p0}, Landroid/graphics/drawable/Icon;->getUri()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 v2, 0x0

    .line 977
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "getUri"

    const/4 v5, 0x0

    new-array v6, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v5, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 985
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v2

    :catch_1
    move-exception p0

    .line 982
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v2

    :catch_2
    move-exception p0

    .line 979
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v2
.end method

.method private loadDrawableInner(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .locals 7

    .line 507
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_8

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x2

    const-string v5, "IconCompat"

    if-eq v0, v4, :cond_5

    const/4 v1, 0x3

    if-eq v0, v1, :cond_4

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    goto/16 :goto_3

    .line 511
    :cond_0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Bitmap;

    .line 512
    invoke-static {v1, v2}, Landroid/support/v4/graphics/drawable/IconCompat;->createLegacyIconFromAdaptiveIcon(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v0

    .line 535
    :cond_1
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 536
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v2, "content"

    .line 538
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "file"

    .line 539
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 547
    :cond_2
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    new-instance v2, Ljava/io/File;

    iget-object v4, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v1

    .line 549
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to load image from path: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 541
    :cond_3
    :goto_0
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception v1

    .line 543
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to load image from URI: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    move-object v1, v3

    :goto_2
    if-eqz v1, :cond_7

    .line 553
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 554
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v0

    .line 531
    :cond_4
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v1, [B

    check-cast v1, [B

    iget v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    iget v3, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    .line 532
    invoke-static {v1, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v0

    .line 515
    :cond_5
    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage()Ljava/lang/String;

    move-result-object v0

    .line 516
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 518
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 520
    :cond_6
    invoke-static {p1, v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResources(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v0

    .line 522
    :try_start_2
    iget v6, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    invoke-static {v0, v6, p1}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_2

    return-object p1

    :catch_2
    move-exception p1

    new-array v0, v4, [Ljava/lang/Object;

    .line 524
    iget v4, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    .line 525
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v0, v2

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    aput-object v2, v0, v1

    const-string v1, "Unable to load resource 0x%08x from pkg=%s"

    .line 524
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_7
    :goto_3
    return-object v3

    .line 509
    :cond_8
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-direct {v0, p1, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v0
.end method

.method private static typeToString(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_4

    const/4 v0, 0x2

    if-eq p0, v0, :cond_3

    const/4 v0, 0x3

    if-eq p0, v0, :cond_2

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/4 v0, 0x5

    if-eq p0, v0, :cond_0

    const-string p0, "UNKNOWN"

    return-object p0

    :cond_0
    const-string p0, "BITMAP_MASKABLE"

    return-object p0

    :cond_1
    const-string p0, "URI"

    return-object p0

    :cond_2
    const-string p0, "DATA"

    return-object p0

    :cond_3
    const-string p0, "RESOURCE"

    return-object p0

    :cond_4
    const-string p0, "BITMAP"

    return-object p0
.end method


# virtual methods
.method public addToShortcutIntent(Landroid/content/Intent;Landroid/graphics/drawable/Drawable;Landroid/content/Context;)V
    .locals 4

    .line 590
    invoke-virtual {p0, p3}, Landroid/support/v4/graphics/drawable/IconCompat;->checkResource(Landroid/content/Context;)V

    .line 592
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_5

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    const/4 p3, 0x5

    if-ne v0, p3, :cond_0

    .line 601
    iget-object p3, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p3, Landroid/graphics/Bitmap;

    invoke-static {p3, v1}, Landroid/support/v4/graphics/drawable/IconCompat;->createLegacyIconFromAdaptiveIcon(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object p3

    goto/16 :goto_2

    .line 629
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Icon type not supported for intent shortcuts"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 605
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object p3

    if-nez p2, :cond_2

    const-string p2, "android.intent.extra.shortcut.ICON_RESOURCE"

    .line 607
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    .line 608
    invoke-static {p3, v0}, Landroid/content/Intent$ShortcutIconResource;->fromContext(Landroid/content/Context;I)Landroid/content/Intent$ShortcutIconResource;

    move-result-object p3

    .line 607
    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-void

    .line 611
    :cond_2
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    invoke-static {p3, v0}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 612
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    if-lez v2, :cond_4

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    if-gtz v2, :cond_3

    goto :goto_0

    .line 617
    :cond_3
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p3

    .line 618
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 617
    invoke-static {p3, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p3

    goto :goto_1

    :cond_4
    :goto_0
    const-string v2, "activity"

    .line 613
    invoke-virtual {p3, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/app/ActivityManager;

    .line 614
    invoke-virtual {p3}, Landroid/app/ActivityManager;->getLauncherLargeIconSize()I

    move-result p3

    .line 615
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p3, p3, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p3

    .line 621
    :goto_1
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 622
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, p3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 625
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Can\'t find package "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p3, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    .line 594
    :cond_5
    iget-object p3, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p3, Landroid/graphics/Bitmap;

    if-eqz p2, :cond_6

    .line 597
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    invoke-virtual {p3, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p3

    :cond_6
    :goto_2
    if-eqz p2, :cond_7

    .line 633
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    .line 634
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 635
    div-int/lit8 v2, v0, 0x2

    div-int/lit8 v3, v1, 0x2

    invoke-virtual {p2, v2, v3, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 636
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_7
    const-string p2, "android.intent.extra.shortcut.ICON"

    .line 638
    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-void
.end method

.method public checkResource(Landroid/content/Context;)V
    .locals 8

    .line 461
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 462
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v1, ":"

    .line 463
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    return-void

    :cond_0
    const/4 v2, -0x1

    .line 467
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    aget-object v3, v3, v4

    const-string v5, "/"

    .line 468
    invoke-virtual {v3, v5, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v6, v6, v7

    .line 469
    invoke-virtual {v3, v5, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v4

    .line 470
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v7

    .line 471
    invoke-static {p1, v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResources(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object p1

    .line 472
    invoke-virtual {p1, v3, v6, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    .line 473
    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    if-eq v1, p1, :cond_1

    .line 474
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Id has changed for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IconCompat"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    iput p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    :cond_1
    return-void
.end method

.method public getResId()I
    .locals 3

    .line 356
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 357
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Icon;

    invoke-static {v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResId(Landroid/graphics/drawable/Icon;)I

    move-result v0

    return v0

    .line 359
    :cond_0
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 362
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    return v0

    .line 360
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "called getResId() on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getResPackage()Ljava/lang/String;
    .locals 3

    .line 338
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v0, v2, :cond_0

    .line 339
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Icon;

    invoke-static {v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage(Landroid/graphics/drawable/Icon;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 341
    :cond_0
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    .line 344
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v2, ":"

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0

    .line 342
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "called getResPackage() on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getType()I
    .locals 2

    .line 323
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 324
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Icon;

    invoke-static {v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getType(Landroid/graphics/drawable/Icon;)I

    move-result v0

    return v0

    .line 326
    :cond_0
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    return v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 2

    .line 374
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 375
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Icon;

    invoke-static {v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getUri(Landroid/graphics/drawable/Icon;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    .line 377
    :cond_0
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 489
    invoke-virtual {p0, p1}, Landroid/support/v4/graphics/drawable/IconCompat;->checkResource(Landroid/content/Context;)V

    .line 490
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 491
    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->toIcon()Landroid/graphics/drawable/Icon;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1

    .line 493
    :cond_0
    invoke-direct {p0, p1}, Landroid/support/v4/graphics/drawable/IconCompat;->loadDrawableInner(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 494
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    sget-object v1, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    if-eq v0, v1, :cond_2

    .line 495
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 496
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    invoke-static {p1, v0}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 497
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    invoke-static {p1, v0}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTintMode(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    :cond_2
    return-object p1
.end method

.method public onPostParceling()V
    .locals 3

    .line 757
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintModeStr:Ljava/lang/String;

    invoke-static {v0}, Landroid/graphics/PorterDuff$Mode;->valueOf(Ljava/lang/String;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    .line 758
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_4

    const/4 v1, 0x1

    const/4 v2, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    if-eq v0, v2, :cond_0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_2

    goto :goto_0

    .line 783
    :cond_0
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    goto :goto_0

    .line 780
    :cond_1
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    const-string v2, "UTF-16"

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    goto :goto_0

    .line 768
    :cond_2
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mParcelable:Landroid/os/Parcelable;

    if-eqz v0, :cond_3

    .line 769
    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    goto :goto_0

    .line 772
    :cond_3
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    .line 773
    iput v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, 0x0

    .line 774
    iput v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    .line 775
    array-length v0, v0

    iput v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    goto :goto_0

    .line 760
    :cond_4
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mParcelable:Landroid/os/Parcelable;

    if-eqz v0, :cond_5

    .line 761
    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    :goto_0
    return-void

    .line 763
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid icon"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onPreParceling(Z)V
    .locals 3

    .line 721
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0}, Landroid/graphics/PorterDuff$Mode;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintModeStr:Ljava/lang/String;

    .line 722
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_5

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    const-string v2, "UTF-16"

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    const/4 v1, 0x5

    if-eq v0, v1, :cond_3

    goto :goto_0

    .line 744
    :cond_0
    iget-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    goto :goto_0

    .line 750
    :cond_1
    iget-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p1, [B

    check-cast p1, [B

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    goto :goto_0

    .line 747
    :cond_2
    iget-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    goto :goto_0

    :cond_3
    if-eqz p1, :cond_4

    .line 735
    iget-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/Bitmap;

    .line 736
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 737
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x5a

    invoke-virtual {p1, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 738
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    goto :goto_0

    .line 740
    :cond_4
    iget-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p1, Landroid/os/Parcelable;

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mParcelable:Landroid/os/Parcelable;

    goto :goto_0

    :cond_5
    if-nez p1, :cond_6

    .line 729
    iget-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p1, Landroid/os/Parcelable;

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mParcelable:Landroid/os/Parcelable;

    :goto_0
    return-void

    .line 726
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Can\'t serialize Icon created with IconCompat#createFromIcon"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setTint(I)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 0

    .line 387
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/graphics/drawable/IconCompat;->setTintList(Landroid/content/res/ColorStateList;)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p1

    return-object p1
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 0

    .line 397
    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    return-object p0
.end method

.method public setTintMode(Landroid/graphics/PorterDuff$Mode;)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 0

    .line 408
    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    return-object p0
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 4

    .line 646
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 647
    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v2, -0x1

    const-string v3, "obj"

    if-eq v1, v2, :cond_4

    const/4 v2, 0x1

    if-eq v1, v2, :cond_3

    const/4 v2, 0x2

    if-eq v1, v2, :cond_2

    const/4 v2, 0x3

    if-eq v1, v2, :cond_1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_2

    const/4 v2, 0x5

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 664
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid icon"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 661
    :cond_1
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v1, [B

    check-cast v1, [B

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    goto :goto_1

    .line 658
    :cond_2
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 650
    :cond_3
    :goto_0
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto :goto_1

    .line 654
    :cond_4
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v1, Landroid/os/Parcelable;

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 666
    :goto_1
    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const-string v2, "type"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 667
    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    const-string v2, "int1"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 668
    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    const-string v2, "int2"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 669
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_5

    const-string v2, "tint_list"

    .line 670
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 672
    :cond_5
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    sget-object v2, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    if-eq v1, v2, :cond_6

    .line 673
    invoke-virtual {v1}, Landroid/graphics/PorterDuff$Mode;->name()Ljava/lang/String;

    move-result-object v1

    const-string v2, "tint_mode"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    return-object v0
.end method

.method public toIcon()Landroid/graphics/drawable/Icon;
    .locals 3

    .line 420
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_8

    const/4 v1, 0x1

    if-eq v0, v1, :cond_5

    const/4 v1, 0x2

    if-eq v0, v1, :cond_4

    const/4 v1, 0x3

    if-eq v0, v1, :cond_3

    const/4 v1, 0x4

    if-eq v0, v1, :cond_2

    const/4 v1, 0x5

    if-ne v0, v1, :cond_1

    .line 428
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 429
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-static {v0}, Landroid/graphics/drawable/Icon;->createWithAdaptiveBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object v0

    goto :goto_0

    .line 431
    :cond_0
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    .line 432
    invoke-static {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;->createLegacyIconFromAdaptiveIcon(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 431
    invoke-static {v0}, Landroid/graphics/drawable/Icon;->createWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object v0

    goto :goto_0

    .line 445
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unknown type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 442
    :cond_2
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/graphics/drawable/Icon;->createWithContentUri(Ljava/lang/String;)Landroid/graphics/drawable/Icon;

    move-result-object v0

    goto :goto_0

    .line 439
    :cond_3
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, [B

    check-cast v0, [B

    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    iget v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    invoke-static {v0, v1, v2}, Landroid/graphics/drawable/Icon;->createWithData([BII)Landroid/graphics/drawable/Icon;

    move-result-object v0

    goto :goto_0

    .line 436
    :cond_4
    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    invoke-static {v0, v1}, Landroid/graphics/drawable/Icon;->createWithResource(Ljava/lang/String;I)Landroid/graphics/drawable/Icon;

    move-result-object v0

    goto :goto_0

    .line 425
    :cond_5
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-static {v0}, Landroid/graphics/drawable/Icon;->createWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object v0

    .line 447
    :goto_0
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_6

    .line 448
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Icon;->setTintList(Landroid/content/res/ColorStateList;)Landroid/graphics/drawable/Icon;

    .line 450
    :cond_6
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    sget-object v2, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    if-eq v1, v2, :cond_7

    .line 451
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Icon;->setTintMode(Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/drawable/Icon;

    :cond_7
    return-object v0

    .line 423
    :cond_8
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Icon;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 680
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 681
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 683
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Icon(typ="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    invoke-static {v1}, Landroid/support/v4/graphics/drawable/IconCompat;->typeToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 684
    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_4

    const/4 v3, 0x2

    if-eq v1, v3, :cond_3

    const/4 v2, 0x3

    if-eq v1, v2, :cond_2

    const/4 v2, 0x4

    if-eq v1, v2, :cond_1

    const/4 v2, 0x5

    if-eq v1, v2, :cond_4

    goto :goto_0

    :cond_1
    const-string v1, " uri="

    .line 705
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_2
    const-string v1, " len="

    .line 699
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 700
    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    if-eqz v1, :cond_5

    const-string v1, " off="

    .line 701
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_3
    const-string v1, " pkg="

    .line 693
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 694
    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " id="

    .line 695
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 696
    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const-string v3, "0x%08x"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_4
    const-string v1, " size="

    .line 687
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Bitmap;

    .line 688
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "x"

    .line 689
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Bitmap;

    .line 690
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 708
    :cond_5
    :goto_0
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_6

    const-string v1, " tint="

    .line 709
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 710
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 712
    :cond_6
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    sget-object v2, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    if-eq v1, v2, :cond_7

    const-string v1, " mode="

    .line 713
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_7
    const-string v1, ")"

    .line 715
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 716
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
