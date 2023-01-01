.class public final Lc/g0/g/g;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lc/t$a;


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/t;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Lc/g0/f/g;

.field private final c:Lc/g0/g/c;

.field private final d:Lc/i;

.field private final e:I

.field private final f:Lc/y;

.field private g:I


# direct methods
.method public constructor <init>(Ljava/util/List;Lc/g0/f/g;Lc/g0/g/c;Lc/i;ILc/y;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lc/t;",
            ">;",
            "Lc/g0/f/g;",
            "Lc/g0/g/c;",
            "Lc/i;",
            "I",
            "Lc/y;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc/g0/g/g;->a:Ljava/util/List;

    iput-object p4, p0, Lc/g0/g/g;->d:Lc/i;

    iput-object p2, p0, Lc/g0/g/g;->b:Lc/g0/f/g;

    iput-object p3, p0, Lc/g0/g/g;->c:Lc/g0/g/c;

    iput p5, p0, Lc/g0/g/g;->e:I

    iput-object p6, p0, Lc/g0/g/g;->f:Lc/y;

    return-void
.end method

.method private e(Lc/s;)Z
    .locals 2

    invoke-virtual {p1}, Lc/s;->l()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lc/g0/g/g;->d:Lc/i;

    invoke-interface {v1}, Lc/i;->a()Lc/c0;

    move-result-object v1

    invoke-virtual {v1}, Lc/c0;->a()Lc/a;

    move-result-object v1

    invoke-virtual {v1}, Lc/a;->k()Lc/s;

    move-result-object v1

    invoke-virtual {v1}, Lc/s;->l()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lc/s;->x()I

    move-result p1

    iget-object v0, p0, Lc/g0/g/g;->d:Lc/i;

    invoke-interface {v0}, Lc/i;->a()Lc/c0;

    move-result-object v0

    invoke-virtual {v0}, Lc/c0;->a()Lc/a;

    move-result-object v0

    invoke-virtual {v0}, Lc/a;->k()Lc/s;

    move-result-object v0

    invoke-virtual {v0}, Lc/s;->x()I

    move-result v0

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public a()Lc/y;
    .locals 1

    iget-object v0, p0, Lc/g0/g/g;->f:Lc/y;

    return-object v0
.end method

.method public b(Lc/y;)Lc/a0;
    .locals 3

    iget-object v0, p0, Lc/g0/g/g;->b:Lc/g0/f/g;

    iget-object v1, p0, Lc/g0/g/g;->c:Lc/g0/g/c;

    iget-object v2, p0, Lc/g0/g/g;->d:Lc/i;

    invoke-virtual {p0, p1, v0, v1, v2}, Lc/g0/g/g;->d(Lc/y;Lc/g0/f/g;Lc/g0/g/c;Lc/i;)Lc/a0;

    move-result-object p1

    return-object p1
.end method

.method public c()Lc/g0/g/c;
    .locals 1

    iget-object v0, p0, Lc/g0/g/g;->c:Lc/g0/g/c;

    return-object v0
.end method

.method public d(Lc/y;Lc/g0/f/g;Lc/g0/g/c;Lc/i;)Lc/a0;
    .locals 14

    move-object v0, p0

    iget v1, v0, Lc/g0/g/g;->e:I

    iget-object v2, v0, Lc/g0/g/g;->a:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_7

    iget v1, v0, Lc/g0/g/g;->g:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, v0, Lc/g0/g/g;->g:I

    iget-object v1, v0, Lc/g0/g/g;->c:Lc/g0/g/c;

    const-string v3, "network interceptor "

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lc/y;->h()Lc/s;

    move-result-object v1

    invoke-direct {p0, v1}, Lc/g0/g/g;->e(Lc/s;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v0, Lc/g0/g/g;->a:Ljava/util/List;

    iget v5, v0, Lc/g0/g/g;->e:I

    sub-int/2addr v5, v2

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " must retain the same host and port"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    :goto_0
    iget-object v1, v0, Lc/g0/g/g;->c:Lc/g0/g/c;

    const-string v4, " must call proceed() exactly once"

    if-eqz v1, :cond_3

    iget v1, v0, Lc/g0/g/g;->g:I

    if-gt v1, v2, :cond_2

    goto :goto_1

    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v0, Lc/g0/g/g;->a:Ljava/util/List;

    iget v6, v0, Lc/g0/g/g;->e:I

    sub-int/2addr v6, v2

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_3
    :goto_1
    new-instance v1, Lc/g0/g/g;

    iget-object v12, v0, Lc/g0/g/g;->a:Ljava/util/List;

    iget v13, v0, Lc/g0/g/g;->e:I

    add-int/lit8 v10, v13, 0x1

    move-object v5, v1

    move-object v6, v12

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    move-object v11, p1

    invoke-direct/range {v5 .. v11}, Lc/g0/g/g;-><init>(Ljava/util/List;Lc/g0/f/g;Lc/g0/g/c;Lc/i;ILc/y;)V

    invoke-interface {v12, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lc/t;

    invoke-interface {v5, v1}, Lc/t;->a(Lc/t$a;)Lc/a0;

    move-result-object v6

    if-eqz p3, :cond_5

    iget v7, v0, Lc/g0/g/g;->e:I

    add-int/2addr v7, v2

    iget-object v8, v0, Lc/g0/g/g;->a:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_5

    iget v1, v1, Lc/g0/g/g;->g:I

    if-ne v1, v2, :cond_4

    goto :goto_2

    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_5
    :goto_2
    if-eqz v6, :cond_6

    return-object v6

    :cond_6
    new-instance v1, Ljava/lang/NullPointerException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "interceptor "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " returned null"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_7
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public f()Lc/g0/f/g;
    .locals 1

    iget-object v0, p0, Lc/g0/g/g;->b:Lc/g0/f/g;

    return-object v0
.end method
