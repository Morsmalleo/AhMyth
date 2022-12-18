.class public final Lc/d;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/d$a;
    }
.end annotation


# instance fields
.field private final a:Z

.field private final b:Z

.field private final c:I

.field private final d:I

.field private final e:Z

.field private final f:Z

.field private final g:Z

.field private final h:I

.field private final i:I

.field private final j:Z

.field private final k:Z

.field l:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lc/d$a;

    invoke-direct {v0}, Lc/d$a;-><init>()V

    invoke-virtual {v0}, Lc/d$a;->c()Lc/d$a;

    invoke-virtual {v0}, Lc/d$a;->a()Lc/d;

    new-instance v0, Lc/d$a;

    invoke-direct {v0}, Lc/d$a;-><init>()V

    invoke-virtual {v0}, Lc/d$a;->d()Lc/d$a;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const v2, 0x7fffffff

    invoke-virtual {v0, v2, v1}, Lc/d$a;->b(ILjava/util/concurrent/TimeUnit;)Lc/d$a;

    invoke-virtual {v0}, Lc/d$a;->a()Lc/d;

    return-void
.end method

.method constructor <init>(Lc/d$a;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-boolean v0, p1, Lc/d$a;->a:Z

    iput-boolean v0, p0, Lc/d;->a:Z

    iget-boolean v0, p1, Lc/d$a;->b:Z

    iput-boolean v0, p0, Lc/d;->b:Z

    iget v0, p1, Lc/d$a;->c:I

    iput v0, p0, Lc/d;->c:I

    const/4 v0, -0x1

    iput v0, p0, Lc/d;->d:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lc/d;->e:Z

    iput-boolean v0, p0, Lc/d;->f:Z

    iput-boolean v0, p0, Lc/d;->g:Z

    iget v0, p1, Lc/d$a;->d:I

    iput v0, p0, Lc/d;->h:I

    iget v0, p1, Lc/d$a;->e:I

    iput v0, p0, Lc/d;->i:I

    iget-boolean v0, p1, Lc/d$a;->f:Z

    iput-boolean v0, p0, Lc/d;->j:Z

    iget-boolean p1, p1, Lc/d$a;->g:Z

    iput-boolean p1, p0, Lc/d;->k:Z

    return-void
.end method

.method private constructor <init>(ZZIIZZZIIZZLjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lc/d;->a:Z

    iput-boolean p2, p0, Lc/d;->b:Z

    iput p3, p0, Lc/d;->c:I

    iput p4, p0, Lc/d;->d:I

    iput-boolean p5, p0, Lc/d;->e:Z

    iput-boolean p6, p0, Lc/d;->f:Z

    iput-boolean p7, p0, Lc/d;->g:Z

    iput p8, p0, Lc/d;->h:I

    iput p9, p0, Lc/d;->i:I

    iput-boolean p10, p0, Lc/d;->j:Z

    iput-boolean p11, p0, Lc/d;->k:Z

    iput-object p12, p0, Lc/d;->l:Ljava/lang/String;

    return-void
.end method

.method private a()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-boolean v1, p0, Lc/d;->a:Z

    if-eqz v1, :cond_0

    const-string v1, "no-cache, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    iget-boolean v1, p0, Lc/d;->b:Z

    if-eqz v1, :cond_1

    const-string v1, "no-store, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    iget v1, p0, Lc/d;->c:I

    const-string v2, ", "

    const/4 v3, -0x1

    if-eq v1, v3, :cond_2

    const-string v1, "max-age="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lc/d;->c:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    iget v1, p0, Lc/d;->d:I

    if-eq v1, v3, :cond_3

    const-string v1, "s-maxage="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lc/d;->d:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    iget-boolean v1, p0, Lc/d;->e:Z

    if-eqz v1, :cond_4

    const-string v1, "private, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    iget-boolean v1, p0, Lc/d;->f:Z

    if-eqz v1, :cond_5

    const-string v1, "public, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_5
    iget-boolean v1, p0, Lc/d;->g:Z

    if-eqz v1, :cond_6

    const-string v1, "must-revalidate, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6
    iget v1, p0, Lc/d;->h:I

    if-eq v1, v3, :cond_7

    const-string v1, "max-stale="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lc/d;->h:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_7
    iget v1, p0, Lc/d;->i:I

    if-eq v1, v3, :cond_8

    const-string v1, "min-fresh="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lc/d;->i:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_8
    iget-boolean v1, p0, Lc/d;->j:Z

    if-eqz v1, :cond_9

    const-string v1, "only-if-cached, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_9
    iget-boolean v1, p0, Lc/d;->k:Z

    if-eqz v1, :cond_a

    const-string v1, "no-transform, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-nez v1, :cond_b

    const-string v0, ""

    return-object v0

    :cond_b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static k(Lc/r;)Lc/d;
    .locals 21

    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Lc/r;->e()I

    move-result v1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, -0x1

    const/4 v12, -0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, -0x1

    const/16 v17, -0x1

    const/16 v18, 0x0

    const/16 v19, 0x0

    :goto_0
    if-ge v6, v1, :cond_11

    invoke-virtual {v0, v6}, Lc/r;->c(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v6}, Lc/r;->g(I)Ljava/lang/String;

    move-result-object v4

    const-string v3, "Cache-Control"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    if-eqz v8, :cond_0

    goto :goto_1

    :cond_0
    move-object v8, v4

    goto :goto_2

    :cond_1
    const-string v3, "Pragma"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    :goto_1
    const/4 v7, 0x0

    :goto_2
    const/4 v2, 0x0

    :goto_3
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_10

    const-string v3, "=,;"

    invoke-static {v4, v2, v3}, Lc/g0/g/e;->f(Ljava/lang/String;ILjava/lang/String;)I

    move-result v3

    invoke-virtual {v4, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-eq v3, v5, :cond_4

    invoke-virtual {v4, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v0, 0x2c

    if-eq v5, v0, :cond_4

    invoke-virtual {v4, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v5, 0x3b

    if-ne v0, v5, :cond_2

    goto :goto_4

    :cond_2
    add-int/lit8 v3, v3, 0x1

    invoke-static {v4, v3}, Lc/g0/g/e;->g(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_3

    invoke-virtual {v4, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v5, 0x22

    if-ne v3, v5, :cond_3

    add-int/lit8 v0, v0, 0x1

    const-string v3, "\""

    invoke-static {v4, v0, v3}, Lc/g0/g/e;->f(Ljava/lang/String;ILjava/lang/String;)I

    move-result v3

    invoke-virtual {v4, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x1

    add-int/2addr v3, v5

    goto :goto_5

    :cond_3
    const/4 v5, 0x1

    const-string v3, ",;"

    invoke-static {v4, v0, v3}, Lc/g0/g/e;->f(Ljava/lang/String;ILjava/lang/String;)I

    move-result v3

    invoke-virtual {v4, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    :cond_4
    :goto_4
    const/4 v5, 0x1

    add-int/lit8 v3, v3, 0x1

    const/4 v0, 0x0

    :goto_5
    const-string v5, "no-cache"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    const/4 v5, -0x1

    const/4 v9, 0x1

    goto/16 :goto_6

    :cond_5
    const-string v5, "no-store"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    const/4 v5, -0x1

    const/4 v10, 0x1

    goto/16 :goto_6

    :cond_6
    const-string v5, "max-age"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    const/4 v5, -0x1

    invoke-static {v0, v5}, Lc/g0/g/e;->d(Ljava/lang/String;I)I

    move-result v11

    goto :goto_6

    :cond_7
    const-string v5, "s-maxage"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v5, -0x1

    invoke-static {v0, v5}, Lc/g0/g/e;->d(Ljava/lang/String;I)I

    move-result v12

    goto :goto_6

    :cond_8
    const-string v5, "private"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    const/4 v5, -0x1

    const/4 v13, 0x1

    goto :goto_6

    :cond_9
    const-string v5, "public"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a

    const/4 v5, -0x1

    const/4 v14, 0x1

    goto :goto_6

    :cond_a
    const-string v5, "must-revalidate"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b

    const/4 v5, -0x1

    const/4 v15, 0x1

    goto :goto_6

    :cond_b
    const-string v5, "max-stale"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_c

    const v2, 0x7fffffff

    invoke-static {v0, v2}, Lc/g0/g/e;->d(Ljava/lang/String;I)I

    move-result v16

    const/4 v5, -0x1

    goto :goto_6

    :cond_c
    const-string v5, "min-fresh"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_d

    const/4 v5, -0x1

    invoke-static {v0, v5}, Lc/g0/g/e;->d(Ljava/lang/String;I)I

    move-result v17

    goto :goto_6

    :cond_d
    const/4 v5, -0x1

    const-string v0, "only-if-cached"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/16 v18, 0x1

    goto :goto_6

    :cond_e
    const-string v0, "no-transform"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    const/16 v19, 0x1

    :cond_f
    :goto_6
    move-object/from16 v0, p0

    move v2, v3

    goto/16 :goto_3

    :cond_10
    const/4 v5, -0x1

    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, p0

    goto/16 :goto_0

    :cond_11
    if-nez v7, :cond_12

    const/16 v20, 0x0

    goto :goto_7

    :cond_12
    move-object/from16 v20, v8

    :goto_7
    new-instance v0, Lc/d;

    move-object v8, v0

    invoke-direct/range {v8 .. v20}, Lc/d;-><init>(ZZIIZZZIIZZLjava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public b()Z
    .locals 1

    iget-boolean v0, p0, Lc/d;->e:Z

    return v0
.end method

.method public c()Z
    .locals 1

    iget-boolean v0, p0, Lc/d;->f:Z

    return v0
.end method

.method public d()I
    .locals 1

    iget v0, p0, Lc/d;->c:I

    return v0
.end method

.method public e()I
    .locals 1

    iget v0, p0, Lc/d;->h:I

    return v0
.end method

.method public f()I
    .locals 1

    iget v0, p0, Lc/d;->i:I

    return v0
.end method

.method public g()Z
    .locals 1

    iget-boolean v0, p0, Lc/d;->g:Z

    return v0
.end method

.method public h()Z
    .locals 1

    iget-boolean v0, p0, Lc/d;->a:Z

    return v0
.end method

.method public i()Z
    .locals 1

    iget-boolean v0, p0, Lc/d;->b:Z

    return v0
.end method

.method public j()Z
    .locals 1

    iget-boolean v0, p0, Lc/d;->j:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lc/d;->l:Ljava/lang/String;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lc/d;->a()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lc/d;->l:Ljava/lang/String;

    :goto_0
    return-object v0
.end method
