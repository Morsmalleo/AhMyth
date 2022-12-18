.class public Lb/a/d/a/e/b;
.super Lb/a/d/a/e/a;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/a/d/a/e/b$g;
    }
.end annotation


# static fields
.field private static final s:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lb/a/d/a/e/b;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lb/a/d/a/e/b;->s:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lb/a/d/a/d$d;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/d/a/e/a;-><init>(Lb/a/d/a/d$d;)V

    return-void
.end method

.method static synthetic H(Lb/a/d/a/e/b;Ljava/lang/String;Ljava/lang/Exception;)Lb/a/d/a/d;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lb/a/d/a/d;->n(Ljava/lang/String;Ljava/lang/Exception;)Lb/a/d/a/d;

    return-object p0
.end method

.method static synthetic I(Lb/a/d/a/e/b;Ljava/lang/String;Ljava/lang/Exception;)Lb/a/d/a/d;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lb/a/d/a/d;->n(Ljava/lang/String;Ljava/lang/Exception;)Lb/a/d/a/d;

    return-object p0
.end method

.method static synthetic J()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lb/a/d/a/e/b;->s:Ljava/util/logging/Logger;

    return-object v0
.end method


# virtual methods
.method protected C()V
    .locals 3

    sget-object v0, Lb/a/d/a/e/b;->s:Ljava/util/logging/Logger;

    const-string v1, "xhr poll"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    invoke-virtual {p0}, Lb/a/d/a/e/b;->K()Lb/a/d/a/e/b$g;

    move-result-object v0

    new-instance v1, Lb/a/d/a/e/b$e;

    invoke-direct {v1, p0, p0}, Lb/a/d/a/e/b$e;-><init>(Lb/a/d/a/e/b;Lb/a/d/a/e/b;)V

    const-string v2, "data"

    invoke-virtual {v0, v2, v1}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    new-instance v1, Lb/a/d/a/e/b$f;

    invoke-direct {v1, p0, p0}, Lb/a/d/a/e/b$f;-><init>(Lb/a/d/a/e/b;Lb/a/d/a/e/b;)V

    const-string v2, "error"

    invoke-virtual {v0, v2, v1}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    invoke-virtual {v0}, Lb/a/d/a/e/b$g;->n()V

    return-void
.end method

.method protected D([BLjava/lang/Runnable;)V
    .locals 2

    new-instance v0, Lb/a/d/a/e/b$g$b;

    invoke-direct {v0}, Lb/a/d/a/e/b$g$b;-><init>()V

    const-string v1, "POST"

    iput-object v1, v0, Lb/a/d/a/e/b$g$b;->b:Ljava/lang/String;

    iput-object p1, v0, Lb/a/d/a/e/b$g$b;->c:[B

    invoke-virtual {p0, v0}, Lb/a/d/a/e/b;->L(Lb/a/d/a/e/b$g$b;)Lb/a/d/a/e/b$g;

    move-result-object p1

    new-instance v0, Lb/a/d/a/e/b$c;

    invoke-direct {v0, p0, p2}, Lb/a/d/a/e/b$c;-><init>(Lb/a/d/a/e/b;Ljava/lang/Runnable;)V

    const-string p2, "success"

    invoke-virtual {p1, p2, v0}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    new-instance p2, Lb/a/d/a/e/b$d;

    invoke-direct {p2, p0, p0}, Lb/a/d/a/e/b$d;-><init>(Lb/a/d/a/e/b;Lb/a/d/a/e/b;)V

    const-string v0, "error"

    invoke-virtual {p1, v0, p2}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    invoke-virtual {p1}, Lb/a/d/a/e/b$g;->n()V

    return-void
.end method

.method protected K()Lb/a/d/a/e/b$g;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lb/a/d/a/e/b;->L(Lb/a/d/a/e/b$g$b;)Lb/a/d/a/e/b$g;

    move-result-object v0

    return-object v0
.end method

.method protected L(Lb/a/d/a/e/b$g$b;)Lb/a/d/a/e/b$g;
    .locals 2

    if-nez p1, :cond_0

    new-instance p1, Lb/a/d/a/e/b$g$b;

    invoke-direct {p1}, Lb/a/d/a/e/b$g$b;-><init>()V

    :cond_0
    invoke-virtual {p0}, Lb/a/d/a/e/a;->G()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lb/a/d/a/e/b$g$b;->a:Ljava/lang/String;

    iget-object v0, p0, Lb/a/d/a/d;->k:Ljavax/net/ssl/SSLContext;

    iput-object v0, p1, Lb/a/d/a/e/b$g$b;->d:Ljavax/net/ssl/SSLContext;

    iget-object v0, p0, Lb/a/d/a/d;->l:Ljavax/net/ssl/HostnameVerifier;

    iput-object v0, p1, Lb/a/d/a/e/b$g$b;->e:Ljavax/net/ssl/HostnameVerifier;

    iget-object v0, p0, Lb/a/d/a/d;->m:Ljava/net/Proxy;

    iput-object v0, p1, Lb/a/d/a/e/b$g$b;->f:Ljava/net/Proxy;

    new-instance v0, Lb/a/d/a/e/b$g;

    invoke-direct {v0, p1}, Lb/a/d/a/e/b$g;-><init>(Lb/a/d/a/e/b$g$b;)V

    new-instance p1, Lb/a/d/a/e/b$b;

    invoke-direct {p1, p0, p0}, Lb/a/d/a/e/b$b;-><init>(Lb/a/d/a/e/b;Lb/a/d/a/e/b;)V

    const-string v1, "requestHeaders"

    invoke-virtual {v0, v1, p1}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    new-instance p1, Lb/a/d/a/e/b$a;

    invoke-direct {p1, p0, p0}, Lb/a/d/a/e/b$a;-><init>(Lb/a/d/a/e/b;Lb/a/d/a/e/b;)V

    const-string v1, "responseHeaders"

    invoke-virtual {v0, v1, p1}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    return-object v0
.end method
