.class public abstract Lb/a/d/a/d;
.super Lb/a/c/a;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/a/d/a/d$d;,
        Lb/a/d/a/d$e;
    }
.end annotation


# instance fields
.field public b:Z

.field public c:Ljava/lang/String;

.field public d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected e:Z

.field protected f:Z

.field protected g:I

.field protected h:Ljava/lang/String;

.field protected i:Ljava/lang/String;

.field protected j:Ljava/lang/String;

.field protected k:Ljavax/net/ssl/SSLContext;

.field protected l:Ljavax/net/ssl/HostnameVerifier;

.field protected m:Ljava/net/Proxy;

.field protected n:Ljava/lang/String;

.field protected o:Ljava/lang/String;

.field protected p:Lb/a/d/a/d$e;


# direct methods
.method public constructor <init>(Lb/a/d/a/d$d;)V
    .locals 1

    invoke-direct {p0}, Lb/a/c/a;-><init>()V

    iget-object v0, p1, Lb/a/d/a/d$d;->b:Ljava/lang/String;

    iput-object v0, p0, Lb/a/d/a/d;->h:Ljava/lang/String;

    iget-object v0, p1, Lb/a/d/a/d$d;->a:Ljava/lang/String;

    iput-object v0, p0, Lb/a/d/a/d;->i:Ljava/lang/String;

    iget v0, p1, Lb/a/d/a/d$d;->f:I

    iput v0, p0, Lb/a/d/a/d;->g:I

    iget-boolean v0, p1, Lb/a/d/a/d$d;->d:Z

    iput-boolean v0, p0, Lb/a/d/a/d;->e:Z

    iget-object v0, p1, Lb/a/d/a/d$d;->h:Ljava/util/Map;

    iput-object v0, p0, Lb/a/d/a/d;->d:Ljava/util/Map;

    iget-object v0, p1, Lb/a/d/a/d$d;->c:Ljava/lang/String;

    iput-object v0, p0, Lb/a/d/a/d;->j:Ljava/lang/String;

    iget-boolean v0, p1, Lb/a/d/a/d$d;->e:Z

    iput-boolean v0, p0, Lb/a/d/a/d;->f:Z

    iget-object v0, p1, Lb/a/d/a/d$d;->i:Ljavax/net/ssl/SSLContext;

    iput-object v0, p0, Lb/a/d/a/d;->k:Ljavax/net/ssl/SSLContext;

    iget-object v0, p1, Lb/a/d/a/d$d;->k:Lb/a/d/a/c;

    iget-object v0, p1, Lb/a/d/a/d$d;->j:Ljavax/net/ssl/HostnameVerifier;

    iput-object v0, p0, Lb/a/d/a/d;->l:Ljavax/net/ssl/HostnameVerifier;

    iget-object v0, p1, Lb/a/d/a/d$d;->l:Ljava/net/Proxy;

    iput-object v0, p0, Lb/a/d/a/d;->m:Ljava/net/Proxy;

    iget-object v0, p1, Lb/a/d/a/d$d;->m:Ljava/lang/String;

    iput-object v0, p0, Lb/a/d/a/d;->n:Ljava/lang/String;

    iget-object p1, p1, Lb/a/d/a/d$d;->n:Ljava/lang/String;

    iput-object p1, p0, Lb/a/d/a/d;->o:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public h()Lb/a/d/a/d;
    .locals 1

    new-instance v0, Lb/a/d/a/d$b;

    invoke-direct {v0, p0}, Lb/a/d/a/d$b;-><init>(Lb/a/d/a/d;)V

    invoke-static {v0}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-object p0
.end method

.method protected abstract i()V
.end method

.method protected abstract j()V
.end method

.method protected k()V
    .locals 2

    sget-object v0, Lb/a/d/a/d$e;->c:Lb/a/d/a/d$e;

    iput-object v0, p0, Lb/a/d/a/d;->p:Lb/a/d/a/d$e;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "close"

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method

.method protected l(Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lb/a/d/b/c;->c(Ljava/lang/String;)Lb/a/d/b/b;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb/a/d/a/d;->p(Lb/a/d/b/b;)V

    return-void
.end method

.method protected m([B)V
    .locals 0

    invoke-static {p1}, Lb/a/d/b/c;->e([B)Lb/a/d/b/b;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb/a/d/a/d;->p(Lb/a/d/b/b;)V

    return-void
.end method

.method protected n(Ljava/lang/String;Ljava/lang/Exception;)Lb/a/d/a/d;
    .locals 1

    new-instance v0, Lb/a/d/a/a;

    invoke-direct {v0, p1, p2}, Lb/a/d/a/a;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p2, 0x0

    aput-object v0, p1, p2

    const-string p2, "error"

    invoke-virtual {p0, p2, p1}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-object p0
.end method

.method protected o()V
    .locals 2

    sget-object v0, Lb/a/d/a/d$e;->b:Lb/a/d/a/d$e;

    iput-object v0, p0, Lb/a/d/a/d;->p:Lb/a/d/a/d$e;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lb/a/d/a/d;->b:Z

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "open"

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method

.method protected p(Lb/a/d/b/b;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "packet"

    invoke-virtual {p0, p1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method

.method public q()Lb/a/d/a/d;
    .locals 1

    new-instance v0, Lb/a/d/a/d$a;

    invoke-direct {v0, p0}, Lb/a/d/a/d$a;-><init>(Lb/a/d/a/d;)V

    invoke-static {v0}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-object p0
.end method

.method public r([Lb/a/d/b/b;)V
    .locals 1

    new-instance v0, Lb/a/d/a/d$c;

    invoke-direct {v0, p0, p1}, Lb/a/d/a/d$c;-><init>(Lb/a/d/a/d;[Lb/a/d/b/b;)V

    invoke-static {v0}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected abstract s([Lb/a/d/b/b;)V
.end method
