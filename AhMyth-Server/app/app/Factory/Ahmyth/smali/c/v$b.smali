.class public final Lc/v$b;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/v;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field a:Lc/o;

.field b:Ljava/net/Proxy;

.field c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/w;",
            ">;"
        }
    .end annotation
.end field

.field d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/k;",
            ">;"
        }
    .end annotation
.end field

.field final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/t;",
            ">;"
        }
    .end annotation
.end field

.field final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/t;",
            ">;"
        }
    .end annotation
.end field

.field g:Ljava/net/ProxySelector;

.field h:Lc/m;

.field i:Lc/c;

.field j:Lc/g0/e/d;

.field k:Ljavax/net/SocketFactory;

.field l:Ljavax/net/ssl/SSLSocketFactory;

.field m:Lc/g0/k/b;

.field n:Ljavax/net/ssl/HostnameVerifier;

.field o:Lc/g;

.field p:Lc/b;

.field q:Lc/b;

.field r:Lc/j;

.field s:Lc/p;

.field t:Z

.field u:Z

.field v:Z

.field w:I

.field x:I

.field y:I

.field z:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/v$b;->e:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/v$b;->f:Ljava/util/List;

    new-instance v0, Lc/o;

    invoke-direct {v0}, Lc/o;-><init>()V

    iput-object v0, p0, Lc/v$b;->a:Lc/o;

    sget-object v0, Lc/v;->A:Ljava/util/List;

    iput-object v0, p0, Lc/v$b;->c:Ljava/util/List;

    sget-object v0, Lc/v;->B:Ljava/util/List;

    iput-object v0, p0, Lc/v$b;->d:Ljava/util/List;

    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v0

    iput-object v0, p0, Lc/v$b;->g:Ljava/net/ProxySelector;

    sget-object v0, Lc/m;->a:Lc/m;

    iput-object v0, p0, Lc/v$b;->h:Lc/m;

    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Lc/v$b;->k:Ljavax/net/SocketFactory;

    sget-object v0, Lc/g0/k/d;->a:Lc/g0/k/d;

    iput-object v0, p0, Lc/v$b;->n:Ljavax/net/ssl/HostnameVerifier;

    sget-object v0, Lc/g;->c:Lc/g;

    iput-object v0, p0, Lc/v$b;->o:Lc/g;

    sget-object v0, Lc/b;->a:Lc/b;

    iput-object v0, p0, Lc/v$b;->p:Lc/b;

    iput-object v0, p0, Lc/v$b;->q:Lc/b;

    new-instance v0, Lc/j;

    invoke-direct {v0}, Lc/j;-><init>()V

    iput-object v0, p0, Lc/v$b;->r:Lc/j;

    sget-object v0, Lc/p;->a:Lc/p;

    iput-object v0, p0, Lc/v$b;->s:Lc/p;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lc/v$b;->t:Z

    iput-boolean v0, p0, Lc/v$b;->u:Z

    iput-boolean v0, p0, Lc/v$b;->v:Z

    const/16 v0, 0x2710

    iput v0, p0, Lc/v$b;->w:I

    iput v0, p0, Lc/v$b;->x:I

    iput v0, p0, Lc/v$b;->y:I

    const/4 v0, 0x0

    iput v0, p0, Lc/v$b;->z:I

    return-void
.end method

.method constructor <init>(Lc/v;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/v$b;->e:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lc/v$b;->f:Ljava/util/List;

    iget-object v2, p1, Lc/v;->a:Lc/o;

    iput-object v2, p0, Lc/v$b;->a:Lc/o;

    iget-object v2, p1, Lc/v;->b:Ljava/net/Proxy;

    iput-object v2, p0, Lc/v$b;->b:Ljava/net/Proxy;

    iget-object v2, p1, Lc/v;->c:Ljava/util/List;

    iput-object v2, p0, Lc/v$b;->c:Ljava/util/List;

    iget-object v2, p1, Lc/v;->d:Ljava/util/List;

    iput-object v2, p0, Lc/v$b;->d:Ljava/util/List;

    iget-object v2, p1, Lc/v;->e:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p1, Lc/v;->f:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p1, Lc/v;->g:Ljava/net/ProxySelector;

    iput-object v0, p0, Lc/v$b;->g:Ljava/net/ProxySelector;

    iget-object v0, p1, Lc/v;->h:Lc/m;

    iput-object v0, p0, Lc/v$b;->h:Lc/m;

    iget-object v0, p1, Lc/v;->j:Lc/g0/e/d;

    iput-object v0, p0, Lc/v$b;->j:Lc/g0/e/d;

    iget-object v0, p1, Lc/v;->i:Lc/c;

    iget-object v0, p1, Lc/v;->k:Ljavax/net/SocketFactory;

    iput-object v0, p0, Lc/v$b;->k:Ljavax/net/SocketFactory;

    iget-object v0, p1, Lc/v;->l:Ljavax/net/ssl/SSLSocketFactory;

    iput-object v0, p0, Lc/v$b;->l:Ljavax/net/ssl/SSLSocketFactory;

    iget-object v0, p1, Lc/v;->m:Lc/g0/k/b;

    iput-object v0, p0, Lc/v$b;->m:Lc/g0/k/b;

    iget-object v0, p1, Lc/v;->n:Ljavax/net/ssl/HostnameVerifier;

    iput-object v0, p0, Lc/v$b;->n:Ljavax/net/ssl/HostnameVerifier;

    iget-object v0, p1, Lc/v;->o:Lc/g;

    iput-object v0, p0, Lc/v$b;->o:Lc/g;

    iget-object v0, p1, Lc/v;->p:Lc/b;

    iput-object v0, p0, Lc/v$b;->p:Lc/b;

    iget-object v0, p1, Lc/v;->q:Lc/b;

    iput-object v0, p0, Lc/v$b;->q:Lc/b;

    iget-object v0, p1, Lc/v;->r:Lc/j;

    iput-object v0, p0, Lc/v$b;->r:Lc/j;

    iget-object v0, p1, Lc/v;->s:Lc/p;

    iput-object v0, p0, Lc/v$b;->s:Lc/p;

    iget-boolean v0, p1, Lc/v;->t:Z

    iput-boolean v0, p0, Lc/v$b;->t:Z

    iget-boolean v0, p1, Lc/v;->u:Z

    iput-boolean v0, p0, Lc/v$b;->u:Z

    iget-boolean v0, p1, Lc/v;->v:Z

    iput-boolean v0, p0, Lc/v$b;->v:Z

    iget v0, p1, Lc/v;->w:I

    iput v0, p0, Lc/v$b;->w:I

    iget v0, p1, Lc/v;->x:I

    iput v0, p0, Lc/v$b;->x:I

    iget v0, p1, Lc/v;->y:I

    iput v0, p0, Lc/v$b;->y:I

    iget p1, p1, Lc/v;->z:I

    iput p1, p0, Lc/v$b;->z:I

    return-void
.end method

.method private static b(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I
    .locals 6

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_4

    if-eqz p3, :cond_3

    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    const-wide/32 v4, 0x7fffffff

    cmp-long p3, v2, v4

    if-gtz p3, :cond_2

    cmp-long p3, v2, v0

    if-nez p3, :cond_1

    cmp-long p3, p1, v0

    if-gtz p3, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " too small."

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    long-to-int p0, v2

    return p0

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " too large."

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "unit == null"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " < 0"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public a()Lc/v;
    .locals 1

    new-instance v0, Lc/v;

    invoke-direct {v0, p0}, Lc/v;-><init>(Lc/v$b;)V

    return-object v0
.end method

.method public c(JLjava/util/concurrent/TimeUnit;)Lc/v$b;
    .locals 1

    const-string v0, "timeout"

    invoke-static {v0, p1, p2, p3}, Lc/v$b;->b(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lc/v$b;->w:I

    return-object p0
.end method

.method public d(Ljavax/net/ssl/HostnameVerifier;)Lc/v$b;
    .locals 1

    if-eqz p1, :cond_0

    iput-object p1, p0, Lc/v$b;->n:Ljavax/net/ssl/HostnameVerifier;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "hostnameVerifier == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public e(Ljava/util/List;)Lc/v$b;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lc/w;",
            ">;)",
            "Lc/v$b;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sget-object p1, Lc/w;->c:Lc/w;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    sget-object p1, Lc/w;->b:Lc/w;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    const/4 p1, 0x0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    sget-object p1, Lc/w;->d:Lc/w;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lc/v$b;->c:Ljava/util/List;

    return-object p0

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "protocols must not contain null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "protocols must not contain http/1.0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "protocols doesn\'t contain http/1.1: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public f(Ljava/net/Proxy;)Lc/v$b;
    .locals 0

    iput-object p1, p0, Lc/v$b;->b:Ljava/net/Proxy;

    return-object p0
.end method

.method public g(Lc/b;)Lc/v$b;
    .locals 1

    if-eqz p1, :cond_0

    iput-object p1, p0, Lc/v$b;->p:Lc/b;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "proxyAuthenticator == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public h(JLjava/util/concurrent/TimeUnit;)Lc/v$b;
    .locals 1

    const-string v0, "timeout"

    invoke-static {v0, p1, p2, p3}, Lc/v$b;->b(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lc/v$b;->x:I

    return-object p0
.end method

.method public i(Ljavax/net/ssl/SSLSocketFactory;)Lc/v$b;
    .locals 3

    if-eqz p1, :cond_1

    invoke-static {}, Lc/g0/j/e;->h()Lc/g0/j/e;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/g0/j/e;->o(Ljavax/net/ssl/SSLSocketFactory;)Ljavax/net/ssl/X509TrustManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iput-object p1, p0, Lc/v$b;->l:Ljavax/net/ssl/SSLSocketFactory;

    invoke-static {v0}, Lc/g0/k/b;->b(Ljavax/net/ssl/X509TrustManager;)Lc/g0/k/b;

    move-result-object p1

    iput-object p1, p0, Lc/v$b;->m:Lc/g0/k/b;

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to extract the trust manager on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lc/g0/j/e;->h()Lc/g0/j/e;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", sslSocketFactory is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "sslSocketFactory == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public j(JLjava/util/concurrent/TimeUnit;)Lc/v$b;
    .locals 1

    const-string v0, "timeout"

    invoke-static {v0, p1, p2, p3}, Lc/v$b;->b(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lc/v$b;->y:I

    return-object p0
.end method
