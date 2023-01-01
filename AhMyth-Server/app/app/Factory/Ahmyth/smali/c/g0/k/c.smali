.class final Lc/g0/k/c;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:[C


# direct methods
.method public constructor <init>(Ljavax/security/auth/x500/X500Principal;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "RFC2253"

    invoke-virtual {p1, v0}, Ljavax/security/auth/x500/X500Principal;->getName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lc/g0/k/c;->a:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    iput p1, p0, Lc/g0/k/c;->b:I

    return-void
.end method

.method private a()Ljava/lang/String;
    .locals 8

    iget v0, p0, Lc/g0/k/c;->c:I

    iput v0, p0, Lc/g0/k/c;->d:I

    iput v0, p0, Lc/g0/k/c;->e:I

    :cond_0
    :goto_0
    iget v0, p0, Lc/g0/k/c;->c:I

    iget v1, p0, Lc/g0/k/c;->b:I

    if-lt v0, v1, :cond_1

    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    iget v2, p0, Lc/g0/k/c;->d:I

    iget v3, p0, Lc/g0/k/c;->e:I

    sub-int/2addr v3, v2

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0

    :cond_1
    iget-object v1, p0, Lc/g0/k/c;->g:[C

    aget-char v2, v1, v0

    const/16 v3, 0x2c

    const/16 v4, 0x2b

    const/16 v5, 0x3b

    const/16 v6, 0x20

    if-eq v2, v6, :cond_4

    if-eq v2, v5, :cond_3

    const/16 v5, 0x5c

    if-eq v2, v5, :cond_2

    if-eq v2, v4, :cond_3

    if-eq v2, v3, :cond_3

    iget v2, p0, Lc/g0/k/c;->e:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lc/g0/k/c;->e:I

    aget-char v3, v1, v0

    aput-char v3, v1, v2

    goto :goto_1

    :cond_2
    iget v0, p0, Lc/g0/k/c;->e:I

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lc/g0/k/c;->e:I

    invoke-direct {p0}, Lc/g0/k/c;->d()C

    move-result v2

    aput-char v2, v1, v0

    iget v0, p0, Lc/g0/k/c;->c:I

    :goto_1
    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    goto :goto_0

    :cond_3
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    iget v2, p0, Lc/g0/k/c;->d:I

    iget v3, p0, Lc/g0/k/c;->e:I

    sub-int/2addr v3, v2

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0

    :cond_4
    iget v2, p0, Lc/g0/k/c;->e:I

    iput v2, p0, Lc/g0/k/c;->f:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    add-int/lit8 v0, v2, 0x1

    iput v0, p0, Lc/g0/k/c;->e:I

    aput-char v6, v1, v2

    :goto_2
    iget v0, p0, Lc/g0/k/c;->c:I

    iget v1, p0, Lc/g0/k/c;->b:I

    if-ge v0, v1, :cond_5

    iget-object v2, p0, Lc/g0/k/c;->g:[C

    aget-char v7, v2, v0

    if-ne v7, v6, :cond_5

    iget v1, p0, Lc/g0/k/c;->e:I

    add-int/lit8 v7, v1, 0x1

    iput v7, p0, Lc/g0/k/c;->e:I

    aput-char v6, v2, v1

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    goto :goto_2

    :cond_5
    if-eq v0, v1, :cond_6

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    aget-char v2, v1, v0

    if-eq v2, v3, :cond_6

    aget-char v2, v1, v0

    if-eq v2, v4, :cond_6

    aget-char v0, v1, v0

    if-ne v0, v5, :cond_0

    :cond_6
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    iget v2, p0, Lc/g0/k/c;->d:I

    iget v3, p0, Lc/g0/k/c;->f:I

    sub-int/2addr v3, v2

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method private c(I)I
    .locals 9

    add-int/lit8 v0, p1, 0x1

    iget v1, p0, Lc/g0/k/c;->b:I

    const-string v2, "Malformed DN: "

    if-ge v0, v1, :cond_6

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    aget-char p1, v1, p1

    const/16 v3, 0x46

    const/16 v4, 0x66

    const/16 v5, 0x41

    const/16 v6, 0x39

    const/16 v7, 0x61

    const/16 v8, 0x30

    if-lt p1, v8, :cond_0

    if-gt p1, v6, :cond_0

    sub-int/2addr p1, v8

    goto :goto_0

    :cond_0
    if-lt p1, v7, :cond_1

    if-gt p1, v4, :cond_1

    add-int/lit8 p1, p1, -0x57

    goto :goto_0

    :cond_1
    if-lt p1, v5, :cond_5

    if-gt p1, v3, :cond_5

    add-int/lit8 p1, p1, -0x37

    :goto_0
    aget-char v0, v1, v0

    if-lt v0, v8, :cond_2

    if-gt v0, v6, :cond_2

    sub-int/2addr v0, v8

    goto :goto_1

    :cond_2
    if-lt v0, v7, :cond_3

    if-gt v0, v4, :cond_3

    add-int/lit8 v0, v0, -0x57

    goto :goto_1

    :cond_3
    if-lt v0, v5, :cond_4

    if-gt v0, v3, :cond_4

    add-int/lit8 v0, v0, -0x37

    :goto_1
    shl-int/lit8 p1, p1, 0x4

    add-int/2addr p1, v0

    return p1

    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc/g0/k/c;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc/g0/k/c;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc/g0/k/c;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private d()C
    .locals 4

    iget v0, p0, Lc/g0/k/c;->c:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    iget v1, p0, Lc/g0/k/c;->b:I

    if-eq v0, v1, :cond_1

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    aget-char v2, v1, v0

    const/16 v3, 0x20

    if-eq v2, v3, :cond_0

    const/16 v3, 0x25

    if-eq v2, v3, :cond_0

    const/16 v3, 0x5c

    if-eq v2, v3, :cond_0

    const/16 v3, 0x5f

    if-eq v2, v3, :cond_0

    const/16 v3, 0x22

    if-eq v2, v3, :cond_0

    const/16 v3, 0x23

    if-eq v2, v3, :cond_0

    packed-switch v2, :pswitch_data_0

    packed-switch v2, :pswitch_data_1

    invoke-direct {p0}, Lc/g0/k/c;->e()C

    move-result v0

    return v0

    :cond_0
    :pswitch_0
    aget-char v0, v1, v0

    return v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected end of DN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lc/g0/k/c;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x2a
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x3b
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private e()C
    .locals 9

    iget v0, p0, Lc/g0/k/c;->c:I

    invoke-direct {p0, v0}, Lc/g0/k/c;->c(I)I

    move-result v0

    iget v1, p0, Lc/g0/k/c;->c:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Lc/g0/k/c;->c:I

    const/16 v1, 0x80

    if-ge v0, v1, :cond_0

    int-to-char v0, v0

    return v0

    :cond_0
    const/16 v3, 0xc0

    const/16 v4, 0x3f

    if-lt v0, v3, :cond_7

    const/16 v3, 0xf7

    if-gt v0, v3, :cond_7

    const/16 v3, 0xdf

    if-gt v0, v3, :cond_1

    and-int/lit8 v0, v0, 0x1f

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/16 v3, 0xef

    if-gt v0, v3, :cond_2

    const/4 v3, 0x2

    and-int/lit8 v0, v0, 0xf

    goto :goto_0

    :cond_2
    const/4 v3, 0x3

    and-int/lit8 v0, v0, 0x7

    :goto_0
    const/4 v5, 0x0

    :goto_1
    if-ge v5, v3, :cond_6

    iget v6, p0, Lc/g0/k/c;->c:I

    add-int/2addr v6, v2

    iput v6, p0, Lc/g0/k/c;->c:I

    iget v7, p0, Lc/g0/k/c;->b:I

    if-eq v6, v7, :cond_5

    iget-object v7, p0, Lc/g0/k/c;->g:[C

    aget-char v7, v7, v6

    const/16 v8, 0x5c

    if-eq v7, v8, :cond_3

    goto :goto_2

    :cond_3
    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lc/g0/k/c;->c:I

    invoke-direct {p0, v6}, Lc/g0/k/c;->c(I)I

    move-result v6

    iget v7, p0, Lc/g0/k/c;->c:I

    add-int/2addr v7, v2

    iput v7, p0, Lc/g0/k/c;->c:I

    and-int/lit16 v7, v6, 0xc0

    if-eq v7, v1, :cond_4

    return v4

    :cond_4
    shl-int/lit8 v0, v0, 0x6

    and-int/lit8 v6, v6, 0x3f

    add-int/2addr v0, v6

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_5
    :goto_2
    return v4

    :cond_6
    int-to-char v0, v0

    return v0

    :cond_7
    return v4
.end method

.method private f()Ljava/lang/String;
    .locals 6

    iget v0, p0, Lc/g0/k/c;->c:I

    add-int/lit8 v1, v0, 0x4

    iget v2, p0, Lc/g0/k/c;->b:I

    const-string v3, "Unexpected end of DN: "

    if-ge v1, v2, :cond_7

    iput v0, p0, Lc/g0/k/c;->d:I

    :cond_0
    :goto_0
    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    iget v0, p0, Lc/g0/k/c;->c:I

    iget v1, p0, Lc/g0/k/c;->b:I

    if-eq v0, v1, :cond_3

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    aget-char v2, v1, v0

    const/16 v4, 0x2b

    if-eq v2, v4, :cond_3

    aget-char v2, v1, v0

    const/16 v4, 0x2c

    if-eq v2, v4, :cond_3

    aget-char v2, v1, v0

    const/16 v4, 0x3b

    if-ne v2, v4, :cond_1

    goto :goto_2

    :cond_1
    aget-char v2, v1, v0

    const/16 v4, 0x20

    if-ne v2, v4, :cond_2

    iput v0, p0, Lc/g0/k/c;->e:I

    :goto_1
    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    iget v0, p0, Lc/g0/k/c;->c:I

    iget v1, p0, Lc/g0/k/c;->b:I

    if-ge v0, v1, :cond_4

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    aget-char v1, v1, v0

    if-ne v1, v4, :cond_4

    goto :goto_1

    :cond_2
    aget-char v2, v1, v0

    const/16 v5, 0x41

    if-lt v2, v5, :cond_0

    aget-char v2, v1, v0

    const/16 v5, 0x46

    if-gt v2, v5, :cond_0

    aget-char v2, v1, v0

    add-int/2addr v2, v4

    int-to-char v2, v2

    aput-char v2, v1, v0

    goto :goto_0

    :cond_3
    :goto_2
    iput v0, p0, Lc/g0/k/c;->e:I

    :cond_4
    iget v0, p0, Lc/g0/k/c;->e:I

    iget v1, p0, Lc/g0/k/c;->d:I

    sub-int/2addr v0, v1

    const/4 v2, 0x5

    if-lt v0, v2, :cond_6

    and-int/lit8 v2, v0, 0x1

    if-eqz v2, :cond_6

    div-int/lit8 v2, v0, 0x2

    new-array v3, v2, [B

    const/4 v4, 0x0

    add-int/lit8 v1, v1, 0x1

    :goto_3
    if-ge v4, v2, :cond_5

    invoke-direct {p0, v1}, Lc/g0/k/c;->c(I)I

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, v3, v4

    add-int/lit8 v1, v1, 0x2

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_5
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lc/g0/k/c;->g:[C

    iget v3, p0, Lc/g0/k/c;->d:I

    invoke-direct {v1, v2, v3, v0}, Ljava/lang/String;-><init>([CII)V

    return-object v1

    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lc/g0/k/c;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lc/g0/k/c;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw v0

    :goto_5
    goto :goto_4
.end method

.method private g()Ljava/lang/String;
    .locals 7

    :goto_0
    iget v0, p0, Lc/g0/k/c;->c:I

    iget v1, p0, Lc/g0/k/c;->b:I

    const/16 v2, 0x20

    if-ge v0, v1, :cond_0

    iget-object v3, p0, Lc/g0/k/c;->g:[C

    aget-char v3, v3, v0

    if-ne v3, v2, :cond_0

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    goto :goto_0

    :cond_0
    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    iput v0, p0, Lc/g0/k/c;->d:I

    :goto_1
    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    iget v0, p0, Lc/g0/k/c;->c:I

    iget v1, p0, Lc/g0/k/c;->b:I

    const/16 v3, 0x3d

    if-ge v0, v1, :cond_2

    iget-object v4, p0, Lc/g0/k/c;->g:[C

    aget-char v5, v4, v0

    if-eq v5, v3, :cond_2

    aget-char v4, v4, v0

    if-eq v4, v2, :cond_2

    goto :goto_1

    :cond_2
    const-string v4, "Unexpected end of DN: "

    if-ge v0, v1, :cond_b

    iput v0, p0, Lc/g0/k/c;->e:I

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    aget-char v0, v1, v0

    if-ne v0, v2, :cond_5

    :goto_2
    iget v0, p0, Lc/g0/k/c;->c:I

    iget v1, p0, Lc/g0/k/c;->b:I

    if-ge v0, v1, :cond_3

    iget-object v5, p0, Lc/g0/k/c;->g:[C

    aget-char v6, v5, v0

    if-eq v6, v3, :cond_3

    aget-char v5, v5, v0

    if-ne v5, v2, :cond_3

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    goto :goto_2

    :cond_3
    iget-object v5, p0, Lc/g0/k/c;->g:[C

    aget-char v5, v5, v0

    if-ne v5, v3, :cond_4

    if-eq v0, v1, :cond_4

    goto :goto_3

    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lc/g0/k/c;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    :goto_3
    iget v0, p0, Lc/g0/k/c;->c:I

    :goto_4
    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    iget v0, p0, Lc/g0/k/c;->c:I

    iget v1, p0, Lc/g0/k/c;->b:I

    if-ge v0, v1, :cond_6

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    aget-char v1, v1, v0

    if-ne v1, v2, :cond_6

    goto :goto_4

    :cond_6
    iget v0, p0, Lc/g0/k/c;->e:I

    iget v1, p0, Lc/g0/k/c;->d:I

    sub-int/2addr v0, v1

    const/4 v2, 0x4

    if-le v0, v2, :cond_a

    iget-object v0, p0, Lc/g0/k/c;->g:[C

    add-int/lit8 v3, v1, 0x3

    aget-char v3, v0, v3

    const/16 v4, 0x2e

    if-ne v3, v4, :cond_a

    aget-char v3, v0, v1

    const/16 v4, 0x4f

    if-eq v3, v4, :cond_7

    aget-char v3, v0, v1

    const/16 v4, 0x6f

    if-ne v3, v4, :cond_a

    :cond_7
    add-int/lit8 v3, v1, 0x1

    aget-char v3, v0, v3

    const/16 v4, 0x49

    if-eq v3, v4, :cond_8

    add-int/lit8 v3, v1, 0x1

    aget-char v3, v0, v3

    const/16 v4, 0x69

    if-ne v3, v4, :cond_a

    :cond_8
    add-int/lit8 v3, v1, 0x2

    aget-char v3, v0, v3

    const/16 v4, 0x44

    if-eq v3, v4, :cond_9

    add-int/lit8 v3, v1, 0x2

    aget-char v0, v0, v3

    const/16 v3, 0x64

    if-ne v0, v3, :cond_a

    :cond_9
    add-int/2addr v1, v2

    iput v1, p0, Lc/g0/k/c;->d:I

    :cond_a
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    iget v2, p0, Lc/g0/k/c;->d:I

    iget v3, p0, Lc/g0/k/c;->e:I

    sub-int/2addr v3, v2

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0

    :cond_b
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lc/g0/k/c;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_6

    :goto_5
    throw v0

    :goto_6
    goto :goto_5
.end method

.method private h()Ljava/lang/String;
    .locals 4

    iget v0, p0, Lc/g0/k/c;->c:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    iput v0, p0, Lc/g0/k/c;->d:I

    :goto_0
    iput v0, p0, Lc/g0/k/c;->e:I

    iget v0, p0, Lc/g0/k/c;->c:I

    iget v1, p0, Lc/g0/k/c;->b:I

    if-eq v0, v1, :cond_3

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    aget-char v2, v1, v0

    const/16 v3, 0x22

    if-ne v2, v3, :cond_1

    :goto_1
    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    iget v0, p0, Lc/g0/k/c;->c:I

    iget v1, p0, Lc/g0/k/c;->b:I

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    aget-char v1, v1, v0

    const/16 v2, 0x20

    if-ne v1, v2, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lc/g0/k/c;->g:[C

    iget v2, p0, Lc/g0/k/c;->d:I

    iget v3, p0, Lc/g0/k/c;->e:I

    sub-int/2addr v3, v2

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0

    :cond_1
    aget-char v2, v1, v0

    const/16 v3, 0x5c

    if-ne v2, v3, :cond_2

    iget v0, p0, Lc/g0/k/c;->e:I

    invoke-direct {p0}, Lc/g0/k/c;->d()C

    move-result v2

    aput-char v2, v1, v0

    goto :goto_2

    :cond_2
    iget v2, p0, Lc/g0/k/c;->e:I

    aget-char v0, v1, v0

    aput-char v0, v1, v2

    :goto_2
    iget v0, p0, Lc/g0/k/c;->c:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    iget v0, p0, Lc/g0/k/c;->e:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected end of DN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lc/g0/k/c;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw v0

    :goto_4
    goto :goto_3
.end method


# virtual methods
.method public b(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    const/4 v0, 0x0

    iput v0, p0, Lc/g0/k/c;->c:I

    iput v0, p0, Lc/g0/k/c;->d:I

    iput v0, p0, Lc/g0/k/c;->e:I

    iput v0, p0, Lc/g0/k/c;->f:I

    iget-object v0, p0, Lc/g0/k/c;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lc/g0/k/c;->g:[C

    invoke-direct {p0}, Lc/g0/k/c;->g()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    :goto_0
    iget v2, p0, Lc/g0/k/c;->c:I

    iget v3, p0, Lc/g0/k/c;->b:I

    if-ne v2, v3, :cond_1

    return-object v1

    :cond_1
    iget-object v3, p0, Lc/g0/k/c;->g:[C

    aget-char v2, v3, v2

    const/16 v3, 0x22

    const/16 v4, 0x3b

    const/16 v5, 0x2c

    const/16 v6, 0x2b

    if-eq v2, v3, :cond_4

    const/16 v3, 0x23

    if-eq v2, v3, :cond_3

    if-eq v2, v6, :cond_2

    if-eq v2, v5, :cond_2

    if-eq v2, v4, :cond_2

    invoke-direct {p0}, Lc/g0/k/c;->a()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_2
    const-string v2, ""

    goto :goto_1

    :cond_3
    invoke-direct {p0}, Lc/g0/k/c;->f()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_4
    invoke-direct {p0}, Lc/g0/k/c;->h()Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    return-object v2

    :cond_5
    iget v0, p0, Lc/g0/k/c;->c:I

    iget v2, p0, Lc/g0/k/c;->b:I

    if-lt v0, v2, :cond_6

    return-object v1

    :cond_6
    iget-object v2, p0, Lc/g0/k/c;->g:[C

    aget-char v3, v2, v0

    const-string v7, "Malformed DN: "

    if-eq v3, v5, :cond_9

    aget-char v3, v2, v0

    if-ne v3, v4, :cond_7

    goto :goto_2

    :cond_7
    aget-char v2, v2, v0

    if-ne v2, v6, :cond_8

    goto :goto_2

    :cond_8
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc/g0/k/c;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_9
    :goto_2
    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc/g0/k/c;->c:I

    invoke-direct {p0}, Lc/g0/k/c;->g()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_a

    goto :goto_0

    :cond_a
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc/g0/k/c;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method
