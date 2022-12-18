.class public final Lc/a0;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a0$a;
    }
.end annotation


# instance fields
.field final a:Lc/y;

.field final b:Lc/w;

.field final c:I

.field final d:Ljava/lang/String;

.field final e:Lc/q;

.field final f:Lc/r;

.field final g:Lc/b0;

.field final h:Lc/a0;

.field final i:Lc/a0;

.field final j:Lc/a0;

.field final k:J

.field final l:J

.field private volatile m:Lc/d;


# direct methods
.method constructor <init>(Lc/a0$a;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lc/a0$a;->a:Lc/y;

    iput-object v0, p0, Lc/a0;->a:Lc/y;

    iget-object v0, p1, Lc/a0$a;->b:Lc/w;

    iput-object v0, p0, Lc/a0;->b:Lc/w;

    iget v0, p1, Lc/a0$a;->c:I

    iput v0, p0, Lc/a0;->c:I

    iget-object v0, p1, Lc/a0$a;->d:Ljava/lang/String;

    iput-object v0, p0, Lc/a0;->d:Ljava/lang/String;

    iget-object v0, p1, Lc/a0$a;->e:Lc/q;

    iput-object v0, p0, Lc/a0;->e:Lc/q;

    iget-object v0, p1, Lc/a0$a;->f:Lc/r$a;

    invoke-virtual {v0}, Lc/r$a;->d()Lc/r;

    move-result-object v0

    iput-object v0, p0, Lc/a0;->f:Lc/r;

    iget-object v0, p1, Lc/a0$a;->g:Lc/b0;

    iput-object v0, p0, Lc/a0;->g:Lc/b0;

    iget-object v0, p1, Lc/a0$a;->h:Lc/a0;

    iput-object v0, p0, Lc/a0;->h:Lc/a0;

    iget-object v0, p1, Lc/a0$a;->i:Lc/a0;

    iput-object v0, p0, Lc/a0;->i:Lc/a0;

    iget-object v0, p1, Lc/a0$a;->j:Lc/a0;

    iput-object v0, p0, Lc/a0;->j:Lc/a0;

    iget-wide v0, p1, Lc/a0$a;->k:J

    iput-wide v0, p0, Lc/a0;->k:J

    iget-wide v0, p1, Lc/a0$a;->l:J

    iput-wide v0, p0, Lc/a0;->l:J

    return-void
.end method


# virtual methods
.method public I()I
    .locals 1

    iget v0, p0, Lc/a0;->c:I

    return v0
.end method

.method public J()Lc/q;
    .locals 1

    iget-object v0, p0, Lc/a0;->e:Lc/q;

    return-object v0
.end method

.method public K(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lc/a0;->L(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public L(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lc/a0;->f:Lc/r;

    invoke-virtual {v0, p1}, Lc/r;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    move-object p2, p1

    :cond_0
    return-object p2
.end method

.method public M()Lc/r;
    .locals 1

    iget-object v0, p0, Lc/a0;->f:Lc/r;

    return-object v0
.end method

.method public N()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lc/a0;->d:Ljava/lang/String;

    return-object v0
.end method

.method public O()Lc/a0$a;
    .locals 1

    new-instance v0, Lc/a0$a;

    invoke-direct {v0, p0}, Lc/a0$a;-><init>(Lc/a0;)V

    return-object v0
.end method

.method public P()J
    .locals 2

    iget-wide v0, p0, Lc/a0;->l:J

    return-wide v0
.end method

.method public Q()Lc/y;
    .locals 1

    iget-object v0, p0, Lc/a0;->a:Lc/y;

    return-object v0
.end method

.method public R()J
    .locals 2

    iget-wide v0, p0, Lc/a0;->k:J

    return-wide v0
.end method

.method public a()Lc/b0;
    .locals 1

    iget-object v0, p0, Lc/a0;->g:Lc/b0;

    return-object v0
.end method

.method public close()V
    .locals 1

    iget-object v0, p0, Lc/a0;->g:Lc/b0;

    invoke-virtual {v0}, Lc/b0;->close()V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Response{protocol="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc/a0;->b:Lc/w;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lc/a0;->c:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", message="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc/a0;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc/a0;->a:Lc/y;

    invoke-virtual {v1}, Lc/y;->h()Lc/s;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public y()Lc/d;
    .locals 1

    iget-object v0, p0, Lc/a0;->m:Lc/d;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lc/a0;->f:Lc/r;

    invoke-static {v0}, Lc/d;->k(Lc/r;)Lc/d;

    move-result-object v0

    iput-object v0, p0, Lc/a0;->m:Lc/d;

    :goto_0
    return-object v0
.end method
