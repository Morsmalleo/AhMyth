.class public final Lcom/google/android/material/shape/AbsoluteCornerSize;
.super Ljava/lang/Object;
.source "AbsoluteCornerSize.java"

# interfaces
.implements Lcom/google/android/material/shape/CornerSize;


# instance fields
.field private final size:F


# direct methods
.method public constructor <init>(F)V
    .locals 0
    .param p1, "size"    # F

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput p1, p0, Lcom/google/android/material/shape/AbsoluteCornerSize;->size:F

    .line 30
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 46
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 47
    return v0

    .line 49
    :cond_0
    instance-of v1, p1, Lcom/google/android/material/shape/AbsoluteCornerSize;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 50
    return v2

    .line 52
    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/google/android/material/shape/AbsoluteCornerSize;

    .line 53
    .local v1, "that":Lcom/google/android/material/shape/AbsoluteCornerSize;
    iget v3, p0, Lcom/google/android/material/shape/AbsoluteCornerSize;->size:F

    iget v4, v1, Lcom/google/android/material/shape/AbsoluteCornerSize;->size:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getCornerSize()F
    .locals 1

    .line 41
    iget v0, p0, Lcom/google/android/material/shape/AbsoluteCornerSize;->size:F

    return v0
.end method

.method public getCornerSize(Landroid/graphics/RectF;)F
    .locals 1
    .param p1, "bounds"    # Landroid/graphics/RectF;

    .line 34
    iget v0, p0, Lcom/google/android/material/shape/AbsoluteCornerSize;->size:F

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 58
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iget v1, p0, Lcom/google/android/material/shape/AbsoluteCornerSize;->size:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 59
    .local v0, "hashedFields":[Ljava/lang/Object;
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v1

    return v1
.end method
