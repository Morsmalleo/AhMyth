.class public Ld/h;
.super Ld/s;
.source ""


# instance fields
.field private e:Ld/s;


# direct methods
.method public constructor <init>(Ld/s;)V
    .locals 1

    invoke-direct {p0}, Ld/s;-><init>()V

    if-eqz p1, :cond_0

    iput-object p1, p0, Ld/h;->e:Ld/s;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "delegate == null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public a()Ld/s;
    .locals 1

    iget-object v0, p0, Ld/h;->e:Ld/s;

    invoke-virtual {v0}, Ld/s;->a()Ld/s;

    move-result-object v0

    return-object v0
.end method

.method public b()Ld/s;
    .locals 1

    iget-object v0, p0, Ld/h;->e:Ld/s;

    invoke-virtual {v0}, Ld/s;->b()Ld/s;

    move-result-object v0

    return-object v0
.end method

.method public c()J
    .locals 2

    iget-object v0, p0, Ld/h;->e:Ld/s;

    invoke-virtual {v0}, Ld/s;->c()J

    move-result-wide v0

    return-wide v0
.end method

.method public d(J)Ld/s;
    .locals 1

    iget-object v0, p0, Ld/h;->e:Ld/s;

    invoke-virtual {v0, p1, p2}, Ld/s;->d(J)Ld/s;

    move-result-object p1

    return-object p1
.end method

.method public e()Z
    .locals 1

    iget-object v0, p0, Ld/h;->e:Ld/s;

    invoke-virtual {v0}, Ld/s;->e()Z

    move-result v0

    return v0
.end method

.method public f()V
    .locals 1

    iget-object v0, p0, Ld/h;->e:Ld/s;

    invoke-virtual {v0}, Ld/s;->f()V

    return-void
.end method

.method public g(JLjava/util/concurrent/TimeUnit;)Ld/s;
    .locals 1

    iget-object v0, p0, Ld/h;->e:Ld/s;

    invoke-virtual {v0, p1, p2, p3}, Ld/s;->g(JLjava/util/concurrent/TimeUnit;)Ld/s;

    move-result-object p1

    return-object p1
.end method

.method public h()J
    .locals 2

    iget-object v0, p0, Ld/h;->e:Ld/s;

    invoke-virtual {v0}, Ld/s;->h()J

    move-result-wide v0

    return-wide v0
.end method

.method public final i()Ld/s;
    .locals 1

    iget-object v0, p0, Ld/h;->e:Ld/s;

    return-object v0
.end method

.method public final j(Ld/s;)Ld/h;
    .locals 1

    if-eqz p1, :cond_0

    iput-object p1, p0, Ld/h;->e:Ld/s;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "delegate == null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
