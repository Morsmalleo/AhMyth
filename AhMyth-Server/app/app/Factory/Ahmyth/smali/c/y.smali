.class public final Lc/y;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/y$a;
    }
.end annotation


# instance fields
.field final a:Lc/s;

.field final b:Ljava/lang/String;

.field final c:Lc/r;

.field final d:Lc/z;

.field final e:Ljava/lang/Object;

.field private volatile f:Lc/d;


# direct methods
.method constructor <init>(Lc/y$a;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lc/y$a;->a:Lc/s;

    iput-object v0, p0, Lc/y;->a:Lc/s;

    iget-object v0, p1, Lc/y$a;->b:Ljava/lang/String;

    iput-object v0, p0, Lc/y;->b:Ljava/lang/String;

    iget-object v0, p1, Lc/y$a;->c:Lc/r$a;

    invoke-virtual {v0}, Lc/r$a;->d()Lc/r;

    move-result-object v0

    iput-object v0, p0, Lc/y;->c:Lc/r;

    iget-object v0, p1, Lc/y$a;->d:Lc/z;

    iput-object v0, p0, Lc/y;->d:Lc/z;

    iget-object p1, p1, Lc/y$a;->e:Ljava/lang/Object;

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    move-object p1, p0

    :goto_0
    iput-object p1, p0, Lc/y;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a()Lc/z;
    .locals 1

    iget-object v0, p0, Lc/y;->d:Lc/z;

    return-object v0
.end method

.method public b()Lc/d;
    .locals 1

    iget-object v0, p0, Lc/y;->f:Lc/d;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lc/y;->c:Lc/r;

    invoke-static {v0}, Lc/d;->k(Lc/r;)Lc/d;

    move-result-object v0

    iput-object v0, p0, Lc/y;->f:Lc/d;

    :goto_0
    return-object v0
.end method

.method public c(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lc/y;->c:Lc/r;

    invoke-virtual {v0, p1}, Lc/r;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public d()Lc/r;
    .locals 1

    iget-object v0, p0, Lc/y;->c:Lc/r;

    return-object v0
.end method

.method public e()Z
    .locals 1

    iget-object v0, p0, Lc/y;->a:Lc/s;

    invoke-virtual {v0}, Lc/s;->m()Z

    move-result v0

    return v0
.end method

.method public f()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lc/y;->b:Ljava/lang/String;

    return-object v0
.end method

.method public g()Lc/y$a;
    .locals 1

    new-instance v0, Lc/y$a;

    invoke-direct {v0, p0}, Lc/y$a;-><init>(Lc/y;)V

    return-object v0
.end method

.method public h()Lc/s;
    .locals 1

    iget-object v0, p0, Lc/y;->a:Lc/s;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Request{method="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc/y;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc/y;->a:Lc/s;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", tag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc/y;->e:Ljava/lang/Object;

    if-eq v1, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
