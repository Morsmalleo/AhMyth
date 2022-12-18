.class public final Lc/g0/i/n;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private a:I

.field private final b:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xa

    new-array v0, v0, [I

    iput-object v0, p0, Lc/g0/i/n;->b:[I

    return-void
.end method


# virtual methods
.method a()V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lc/g0/i/n;->a:I

    iget-object v1, p0, Lc/g0/i/n;->b:[I

    invoke-static {v1, v0}, Ljava/util/Arrays;->fill([II)V

    return-void
.end method

.method b(I)I
    .locals 1

    iget-object v0, p0, Lc/g0/i/n;->b:[I

    aget p1, v0, p1

    return p1
.end method

.method c()I
    .locals 2

    iget v0, p0, Lc/g0/i/n;->a:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/g0/i/n;->b:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method d()I
    .locals 2

    iget v0, p0, Lc/g0/i/n;->a:I

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/g0/i/n;->b:[I

    const/4 v1, 0x7

    aget v0, v0, v1

    goto :goto_0

    :cond_0
    const v0, 0xffff

    :goto_0
    return v0
.end method

.method e(I)I
    .locals 1

    iget v0, p0, Lc/g0/i/n;->a:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    iget-object p1, p0, Lc/g0/i/n;->b:[I

    const/4 v0, 0x4

    aget p1, p1, v0

    :cond_0
    return p1
.end method

.method f(I)I
    .locals 1

    iget v0, p0, Lc/g0/i/n;->a:I

    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_0

    iget-object p1, p0, Lc/g0/i/n;->b:[I

    const/4 v0, 0x5

    aget p1, p1, v0

    :cond_0
    return p1
.end method

.method g(I)Z
    .locals 2

    const/4 v0, 0x1

    shl-int p1, v0, p1

    iget v1, p0, Lc/g0/i/n;->a:I

    and-int/2addr p1, v1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method h(Lc/g0/i/n;)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0xa

    if-ge v0, v1, :cond_1

    invoke-virtual {p1, v0}, Lc/g0/i/n;->g(I)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p1, v0}, Lc/g0/i/n;->b(I)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lc/g0/i/n;->i(II)Lc/g0/i/n;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method i(II)Lc/g0/i/n;
    .locals 3

    iget-object v0, p0, Lc/g0/i/n;->b:[I

    array-length v1, v0

    if-lt p1, v1, :cond_0

    return-object p0

    :cond_0
    const/4 v1, 0x1

    shl-int/2addr v1, p1

    iget v2, p0, Lc/g0/i/n;->a:I

    or-int/2addr v1, v2

    iput v1, p0, Lc/g0/i/n;->a:I

    aput p2, v0, p1

    return-object p0
.end method

.method j()I
    .locals 1

    iget v0, p0, Lc/g0/i/n;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->bitCount(I)I

    move-result v0

    return v0
.end method
