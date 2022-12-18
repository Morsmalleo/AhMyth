.class public Lc/a0$a;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field a:Lc/y;

.field b:Lc/w;

.field c:I

.field d:Ljava/lang/String;

.field e:Lc/q;

.field f:Lc/r$a;

.field g:Lc/b0;

.field h:Lc/a0;

.field i:Lc/a0;

.field j:Lc/a0;

.field k:J

.field l:J


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lc/a0$a;->c:I

    new-instance v0, Lc/r$a;

    invoke-direct {v0}, Lc/r$a;-><init>()V

    iput-object v0, p0, Lc/a0$a;->f:Lc/r$a;

    return-void
.end method

.method constructor <init>(Lc/a0;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lc/a0$a;->c:I

    iget-object v0, p1, Lc/a0;->a:Lc/y;

    iput-object v0, p0, Lc/a0$a;->a:Lc/y;

    iget-object v0, p1, Lc/a0;->b:Lc/w;

    iput-object v0, p0, Lc/a0$a;->b:Lc/w;

    iget v0, p1, Lc/a0;->c:I

    iput v0, p0, Lc/a0$a;->c:I

    iget-object v0, p1, Lc/a0;->d:Ljava/lang/String;

    iput-object v0, p0, Lc/a0$a;->d:Ljava/lang/String;

    iget-object v0, p1, Lc/a0;->e:Lc/q;

    iput-object v0, p0, Lc/a0$a;->e:Lc/q;

    iget-object v0, p1, Lc/a0;->f:Lc/r;

    invoke-virtual {v0}, Lc/r;->d()Lc/r$a;

    move-result-object v0

    iput-object v0, p0, Lc/a0$a;->f:Lc/r$a;

    iget-object v0, p1, Lc/a0;->g:Lc/b0;

    iput-object v0, p0, Lc/a0$a;->g:Lc/b0;

    iget-object v0, p1, Lc/a0;->h:Lc/a0;

    iput-object v0, p0, Lc/a0$a;->h:Lc/a0;

    iget-object v0, p1, Lc/a0;->i:Lc/a0;

    iput-object v0, p0, Lc/a0$a;->i:Lc/a0;

    iget-object v0, p1, Lc/a0;->j:Lc/a0;

    iput-object v0, p0, Lc/a0$a;->j:Lc/a0;

    iget-wide v0, p1, Lc/a0;->k:J

    iput-wide v0, p0, Lc/a0$a;->k:J

    iget-wide v0, p1, Lc/a0;->l:J

    iput-wide v0, p0, Lc/a0$a;->l:J

    return-void
.end method

.method private e(Lc/a0;)V
    .locals 1

    iget-object p1, p1, Lc/a0;->g:Lc/b0;

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "priorResponse.body != null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private f(Ljava/lang/String;Lc/a0;)V
    .locals 1

    iget-object v0, p2, Lc/a0;->g:Lc/b0;

    if-nez v0, :cond_3

    iget-object v0, p2, Lc/a0;->h:Lc/a0;

    if-nez v0, :cond_2

    iget-object v0, p2, Lc/a0;->i:Lc/a0;

    if-nez v0, :cond_1

    iget-object p2, p2, Lc/a0;->j:Lc/a0;

    if-nez p2, :cond_0

    return-void

    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".priorResponse != null"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_1
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".cacheResponse != null"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_2
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".networkResponse != null"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_3
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".body != null"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)Lc/a0$a;
    .locals 1

    iget-object v0, p0, Lc/a0$a;->f:Lc/r$a;

    invoke-virtual {v0, p1, p2}, Lc/r$a;->a(Ljava/lang/String;Ljava/lang/String;)Lc/r$a;

    return-object p0
.end method

.method public b(Lc/b0;)Lc/a0$a;
    .locals 0

    iput-object p1, p0, Lc/a0$a;->g:Lc/b0;

    return-object p0
.end method

.method public c()Lc/a0;
    .locals 3

    iget-object v0, p0, Lc/a0$a;->a:Lc/y;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lc/a0$a;->b:Lc/w;

    if-eqz v0, :cond_1

    iget v0, p0, Lc/a0$a;->c:I

    if-ltz v0, :cond_0

    new-instance v0, Lc/a0;

    invoke-direct {v0, p0}, Lc/a0;-><init>(Lc/a0$a;)V

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "code < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lc/a0$a;->c:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "protocol == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "request == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public d(Lc/a0;)Lc/a0$a;
    .locals 1

    if-eqz p1, :cond_0

    const-string v0, "cacheResponse"

    invoke-direct {p0, v0, p1}, Lc/a0$a;->f(Ljava/lang/String;Lc/a0;)V

    :cond_0
    iput-object p1, p0, Lc/a0$a;->i:Lc/a0;

    return-object p0
.end method

.method public g(I)Lc/a0$a;
    .locals 0

    iput p1, p0, Lc/a0$a;->c:I

    return-object p0
.end method

.method public h(Lc/q;)Lc/a0$a;
    .locals 0

    iput-object p1, p0, Lc/a0$a;->e:Lc/q;

    return-object p0
.end method

.method public i(Lc/r;)Lc/a0$a;
    .locals 0

    invoke-virtual {p1}, Lc/r;->d()Lc/r$a;

    move-result-object p1

    iput-object p1, p0, Lc/a0$a;->f:Lc/r$a;

    return-object p0
.end method

.method public j(Ljava/lang/String;)Lc/a0$a;
    .locals 0

    iput-object p1, p0, Lc/a0$a;->d:Ljava/lang/String;

    return-object p0
.end method

.method public k(Lc/a0;)Lc/a0$a;
    .locals 1

    if-eqz p1, :cond_0

    const-string v0, "networkResponse"

    invoke-direct {p0, v0, p1}, Lc/a0$a;->f(Ljava/lang/String;Lc/a0;)V

    :cond_0
    iput-object p1, p0, Lc/a0$a;->h:Lc/a0;

    return-object p0
.end method

.method public l(Lc/a0;)Lc/a0$a;
    .locals 0

    if-eqz p1, :cond_0

    invoke-direct {p0, p1}, Lc/a0$a;->e(Lc/a0;)V

    :cond_0
    iput-object p1, p0, Lc/a0$a;->j:Lc/a0;

    return-object p0
.end method

.method public m(Lc/w;)Lc/a0$a;
    .locals 0

    iput-object p1, p0, Lc/a0$a;->b:Lc/w;

    return-object p0
.end method

.method public n(J)Lc/a0$a;
    .locals 0

    iput-wide p1, p0, Lc/a0$a;->l:J

    return-object p0
.end method

.method public o(Lc/y;)Lc/a0$a;
    .locals 0

    iput-object p1, p0, Lc/a0$a;->a:Lc/y;

    return-object p0
.end method

.method public p(J)Lc/a0$a;
    .locals 0

    iput-wide p1, p0, Lc/a0$a;->k:J

    return-object p0
.end method
