.class public Lc/v;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/v$b;
    }
.end annotation


# static fields
.field static final A:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/w;",
            ">;"
        }
    .end annotation
.end field

.field static final B:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/k;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final a:Lc/o;

.field final b:Ljava/net/Proxy;

.field final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/w;",
            ">;"
        }
    .end annotation
.end field

.field final d:Ljava/util/List;
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

.field final g:Ljava/net/ProxySelector;

.field final h:Lc/m;

.field final i:Lc/c;

.field final j:Lc/g0/e/d;

.field final k:Ljavax/net/SocketFactory;

.field final l:Ljavax/net/ssl/SSLSocketFactory;

.field final m:Lc/g0/k/b;

.field final n:Ljavax/net/ssl/HostnameVerifier;

.field final o:Lc/g;

.field final p:Lc/b;

.field final q:Lc/b;

.field final r:Lc/j;

.field final s:Lc/p;

.field final t:Z

.field final u:Z

.field final v:Z

.field final w:I

.field final x:I

.field final y:I

.field final z:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v0, 0x2

    new-array v1, v0, [Lc/w;

    sget-object v2, Lc/w;->e:Lc/w;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Lc/w;->c:Lc/w;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-static {v1}, Lc/g0/c;->n([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sput-object v1, Lc/v;->A:Ljava/util/List;

    const/4 v1, 0x3

    new-array v1, v1, [Lc/k;

    sget-object v2, Lc/k;->f:Lc/k;

    aput-object v2, v1, v3

    sget-object v2, Lc/k;->g:Lc/k;

    aput-object v2, v1, v4

    sget-object v2, Lc/k;->h:Lc/k;

    aput-object v2, v1, v0

    invoke-static {v1}, Lc/g0/c;->n([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lc/v;->B:Ljava/util/List;

    new-instance v0, Lc/v$a;

    invoke-direct {v0}, Lc/v$a;-><init>()V

    sput-object v0, Lc/g0/a;->a:Lc/g0/a;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    new-instance v0, Lc/v$b;

    invoke-direct {v0}, Lc/v$b;-><init>()V

    invoke-direct {p0, v0}, Lc/v;-><init>(Lc/v$b;)V

    return-void
.end method

.method constructor <init>(Lc/v$b;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lc/v$b;->a:Lc/o;

    iput-object v0, p0, Lc/v;->a:Lc/o;

    iget-object v0, p1, Lc/v$b;->b:Ljava/net/Proxy;

    iput-object v0, p0, Lc/v;->b:Ljava/net/Proxy;

    iget-object v0, p1, Lc/v$b;->c:Ljava/util/List;

    iput-object v0, p0, Lc/v;->c:Ljava/util/List;

    iget-object v0, p1, Lc/v$b;->d:Ljava/util/List;

    iput-object v0, p0, Lc/v;->d:Ljava/util/List;

    iget-object v1, p1, Lc/v$b;->e:Ljava/util/List;

    invoke-static {v1}, Lc/g0/c;->m(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lc/v;->e:Ljava/util/List;

    iget-object v1, p1, Lc/v$b;->f:Ljava/util/List;

    invoke-static {v1}, Lc/g0/c;->m(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lc/v;->f:Ljava/util/List;

    iget-object v1, p1, Lc/v$b;->g:Ljava/net/ProxySelector;

    iput-object v1, p0, Lc/v;->g:Ljava/net/ProxySelector;

    iget-object v1, p1, Lc/v$b;->h:Lc/m;

    iput-object v1, p0, Lc/v;->h:Lc/m;

    iget-object v1, p1, Lc/v$b;->i:Lc/c;

    iget-object v1, p1, Lc/v$b;->j:Lc/g0/e/d;

    iput-object v1, p0, Lc/v;->j:Lc/g0/e/d;

    iget-object v1, p1, Lc/v$b;->k:Ljavax/net/SocketFactory;

    iput-object v1, p0, Lc/v;->k:Ljavax/net/SocketFactory;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lc/k;

    if-nez v2, :cond_1

    invoke-virtual {v3}, Lc/k;->d()Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    iget-object v0, p1, Lc/v$b;->l:Ljavax/net/ssl/SSLSocketFactory;

    if-nez v0, :cond_4

    if-nez v2, :cond_3

    goto :goto_1

    :cond_3
    invoke-direct {p0}, Lc/v;->C()Ljavax/net/ssl/X509TrustManager;

    move-result-object v0

    invoke-direct {p0, v0}, Lc/v;->B(Ljavax/net/ssl/X509TrustManager;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    iput-object v1, p0, Lc/v;->l:Ljavax/net/ssl/SSLSocketFactory;

    invoke-static {v0}, Lc/g0/k/b;->b(Ljavax/net/ssl/X509TrustManager;)Lc/g0/k/b;

    move-result-object v0

    goto :goto_2

    :cond_4
    :goto_1
    iput-object v0, p0, Lc/v;->l:Ljavax/net/ssl/SSLSocketFactory;

    iget-object v0, p1, Lc/v$b;->m:Lc/g0/k/b;

    :goto_2
    iput-object v0, p0, Lc/v;->m:Lc/g0/k/b;

    iget-object v0, p1, Lc/v$b;->n:Ljavax/net/ssl/HostnameVerifier;

    iput-object v0, p0, Lc/v;->n:Ljavax/net/ssl/HostnameVerifier;

    iget-object v0, p1, Lc/v$b;->o:Lc/g;

    iget-object v1, p0, Lc/v;->m:Lc/g0/k/b;

    invoke-virtual {v0, v1}, Lc/g;->f(Lc/g0/k/b;)Lc/g;

    move-result-object v0

    iput-object v0, p0, Lc/v;->o:Lc/g;

    iget-object v0, p1, Lc/v$b;->p:Lc/b;

    iput-object v0, p0, Lc/v;->p:Lc/b;

    iget-object v0, p1, Lc/v$b;->q:Lc/b;

    iput-object v0, p0, Lc/v;->q:Lc/b;

    iget-object v0, p1, Lc/v$b;->r:Lc/j;

    iput-object v0, p0, Lc/v;->r:Lc/j;

    iget-object v0, p1, Lc/v$b;->s:Lc/p;

    iput-object v0, p0, Lc/v;->s:Lc/p;

    iget-boolean v0, p1, Lc/v$b;->t:Z

    iput-boolean v0, p0, Lc/v;->t:Z

    iget-boolean v0, p1, Lc/v$b;->u:Z

    iput-boolean v0, p0, Lc/v;->u:Z

    iget-boolean v0, p1, Lc/v$b;->v:Z

    iput-boolean v0, p0, Lc/v;->v:Z

    iget v0, p1, Lc/v$b;->w:I

    iput v0, p0, Lc/v;->w:I

    iget v0, p1, Lc/v$b;->x:I

    iput v0, p0, Lc/v;->x:I

    iget v0, p1, Lc/v$b;->y:I

    iput v0, p0, Lc/v;->y:I

    iget p1, p1, Lc/v$b;->z:I

    iput p1, p0, Lc/v;->z:I

    return-void
.end method

.method private B(Ljavax/net/ssl/X509TrustManager;)Ljavax/net/ssl/SSLSocketFactory;
    .locals 3

    :try_start_0
    const-string v0, "TLS"

    invoke-static {v0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljavax/net/ssl/TrustManager;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x0

    invoke-virtual {v0, p1, v1, p1}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object p1
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    throw p1
.end method

.method private C()Ljavax/net/ssl/X509TrustManager;
    .locals 4

    :try_start_0
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    invoke-virtual {v0}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    aget-object v2, v0, v1

    instance-of v2, v2, Ljavax/net/ssl/X509TrustManager;

    if-eqz v2, :cond_0

    aget-object v0, v0, v1

    check-cast v0, Ljavax/net/ssl/X509TrustManager;

    return-object v0

    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected default trust managers:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method


# virtual methods
.method public A()Ljavax/net/ssl/SSLSocketFactory;
    .locals 1

    iget-object v0, p0, Lc/v;->l:Ljavax/net/ssl/SSLSocketFactory;

    return-object v0
.end method

.method public D()I
    .locals 1

    iget v0, p0, Lc/v;->y:I

    return v0
.end method

.method public b()Lc/b;
    .locals 1

    iget-object v0, p0, Lc/v;->q:Lc/b;

    return-object v0
.end method

.method public c()Lc/g;
    .locals 1

    iget-object v0, p0, Lc/v;->o:Lc/g;

    return-object v0
.end method

.method public d()I
    .locals 1

    iget v0, p0, Lc/v;->w:I

    return v0
.end method

.method public e()Lc/j;
    .locals 1

    iget-object v0, p0, Lc/v;->r:Lc/j;

    return-object v0
.end method

.method public f()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lc/k;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lc/v;->d:Ljava/util/List;

    return-object v0
.end method

.method public g()Lc/m;
    .locals 1

    iget-object v0, p0, Lc/v;->h:Lc/m;

    return-object v0
.end method

.method public h()Lc/o;
    .locals 1

    iget-object v0, p0, Lc/v;->a:Lc/o;

    return-object v0
.end method

.method public i()Lc/p;
    .locals 1

    iget-object v0, p0, Lc/v;->s:Lc/p;

    return-object v0
.end method

.method public j()Z
    .locals 1

    iget-boolean v0, p0, Lc/v;->u:Z

    return v0
.end method

.method public k()Z
    .locals 1

    iget-boolean v0, p0, Lc/v;->t:Z

    return v0
.end method

.method public l()Ljavax/net/ssl/HostnameVerifier;
    .locals 1

    iget-object v0, p0, Lc/v;->n:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method public m()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lc/t;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lc/v;->e:Ljava/util/List;

    return-object v0
.end method

.method n()Lc/g0/e/d;
    .locals 1

    iget-object v0, p0, Lc/v;->i:Lc/c;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lc/c;->a:Lc/g0/e/d;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lc/v;->j:Lc/g0/e/d;

    :goto_0
    return-object v0
.end method

.method public o()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lc/t;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lc/v;->f:Ljava/util/List;

    return-object v0
.end method

.method public p()Lc/v$b;
    .locals 1

    new-instance v0, Lc/v$b;

    invoke-direct {v0, p0}, Lc/v$b;-><init>(Lc/v;)V

    return-object v0
.end method

.method public q(Lc/y;Lc/f0;)Lc/e0;
    .locals 2

    new-instance v0, Lc/g0/l/a;

    new-instance v1, Ljava/security/SecureRandom;

    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    invoke-direct {v0, p1, p2, v1}, Lc/g0/l/a;-><init>(Lc/y;Lc/f0;Ljava/util/Random;)V

    invoke-virtual {v0, p0}, Lc/g0/l/a;->m(Lc/v;)V

    return-object v0
.end method

.method public r()I
    .locals 1

    iget v0, p0, Lc/v;->z:I

    return v0
.end method

.method public s()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lc/w;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lc/v;->c:Ljava/util/List;

    return-object v0
.end method

.method public t()Ljava/net/Proxy;
    .locals 1

    iget-object v0, p0, Lc/v;->b:Ljava/net/Proxy;

    return-object v0
.end method

.method public u()Lc/b;
    .locals 1

    iget-object v0, p0, Lc/v;->p:Lc/b;

    return-object v0
.end method

.method public v()Ljava/net/ProxySelector;
    .locals 1

    iget-object v0, p0, Lc/v;->g:Ljava/net/ProxySelector;

    return-object v0
.end method

.method public w()I
    .locals 1

    iget v0, p0, Lc/v;->x:I

    return v0
.end method

.method public x()Z
    .locals 1

    iget-boolean v0, p0, Lc/v;->v:Z

    return v0
.end method

.method public z()Ljavax/net/SocketFactory;
    .locals 1

    iget-object v0, p0, Lc/v;->k:Ljavax/net/SocketFactory;

    return-object v0
.end method
