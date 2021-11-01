.class public final Landroid/support/v4/graphics/PaintCompat;
.super Ljava/lang/Object;
.source "PaintCompat.java"


# static fields
.field private static final EM_STRING:Ljava/lang/String; = "m"

.field private static final TOFU_STRING:Ljava/lang/String; = "\udb3f\udffd"

.field private static final sRectThreadLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Landroid/support/v4/util/Pair<",
            "Landroid/graphics/Rect;",
            "Landroid/graphics/Rect;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Landroid/support/v4/graphics/PaintCompat;->sRectThreadLocal:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hasGlyph(Landroid/graphics/Paint;Ljava/lang/String;)Z
    .locals 9

    .line 45
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 46
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->hasGlyph(Ljava/lang/String;)Z

    move-result p0

    return p0

    .line 48
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    .line 50
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-eqz v3, :cond_1

    return v1

    :cond_1
    const-string v3, "\udb3f\udffd"

    .line 55
    invoke-virtual {p0, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v4

    const-string v5, "m"

    .line 56
    invoke-virtual {p0, v5}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v5

    .line 58
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v6

    const/4 v7, 0x0

    cmpl-float v8, v6, v7

    if-nez v8, :cond_2

    return v2

    .line 65
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {p1, v2, v8}, Ljava/lang/String;->codePointCount(II)I

    move-result v8

    if-le v8, v1, :cond_5

    const/high16 v8, 0x40000000    # 2.0f

    mul-float v5, v5, v8

    cmpl-float v5, v6, v5

    if-lez v5, :cond_3

    return v2

    :cond_3
    const/4 v5, 0x0

    :goto_0
    if-ge v5, v0, :cond_4

    .line 85
    invoke-virtual {p1, v5}, Ljava/lang/String;->codePointAt(I)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Character;->charCount(I)I

    move-result v8

    add-int/2addr v8, v5

    .line 86
    invoke-virtual {p0, p1, v5, v8}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v5

    add-float/2addr v7, v5

    move v5, v8

    goto :goto_0

    :cond_4
    cmpl-float v5, v6, v7

    if-ltz v5, :cond_5

    return v2

    :cond_5
    cmpl-float v4, v6, v4

    if-eqz v4, :cond_6

    return v1

    .line 101
    :cond_6
    invoke-static {}, Landroid/support/v4/graphics/PaintCompat;->obtainEmptyRects()Landroid/support/v4/util/Pair;

    move-result-object v4

    const/4 v5, 0x2

    .line 102
    iget-object v6, v4, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Landroid/graphics/Rect;

    invoke-virtual {p0, v3, v2, v5, v6}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 103
    iget-object v3, v4, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v2, v0, v3}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 104
    iget-object p0, v4, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Rect;

    iget-object p1, v4, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v1

    return p0
.end method

.method private static obtainEmptyRects()Landroid/support/v4/util/Pair;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v4/util/Pair<",
            "Landroid/graphics/Rect;",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation

    .line 108
    sget-object v0, Landroid/support/v4/graphics/PaintCompat;->sRectThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/util/Pair;

    if-nez v1, :cond_0

    .line 110
    new-instance v1, Landroid/support/v4/util/Pair;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-direct {v1, v2, v3}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    goto :goto_0

    .line 113
    :cond_0
    iget-object v0, v1, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 114
    iget-object v0, v1, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    :goto_0
    return-object v1
.end method
