.class public Lb/a/b/c;
.super Lb/a/c/a;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/a/b/c$o;,
        Lb/a/b/c$m;,
        Lb/a/b/c$n;,
        Lb/a/b/c$p;
    }
.end annotation


# static fields
.field private static final w:Ljava/util/logging/Logger;

.field static x:Ljavax/net/ssl/SSLContext;

.field static y:Ljavax/net/ssl/HostnameVerifier;


# instance fields
.field b:Lb/a/b/c$p;

.field private c:Z

.field private d:Z

.field private e:Z

.field private f:Z

.field private g:I

.field private h:J

.field private i:J

.field private j:D

.field private k:Lb/a/a/a;

.field private l:J

.field private m:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lb/a/b/e;",
            ">;"
        }
    .end annotation
.end field

.field private n:Ljava/util/Date;

.field private o:Ljava/net/URI;

.field private p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lb/a/h/b;",
            ">;"
        }
    .end annotation
.end field

.field private q:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lb/a/b/d$b;",
            ">;"
        }
    .end annotation
.end field

.field private r:Lb/a/b/c$o;

.field s:Lb/a/d/a/c;

.field private t:Lb/a/h/c$c;

.field private u:Lb/a/h/c$b;

.field v:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lb/a/b/e;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lb/a/b/c;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lb/a/b/c;->w:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lb/a/b/c;-><init>(Ljava/net/URI;Lb/a/b/c$o;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Lb/a/b/c$o;)V
    .locals 5

    invoke-direct {p0}, Lb/a/c/a;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lb/a/b/c;->m:Ljava/util/Set;

    if-nez p2, :cond_0

    new-instance p2, Lb/a/b/c$o;

    invoke-direct {p2}, Lb/a/b/c$o;-><init>()V

    :cond_0
    iget-object v0, p2, Lb/a/d/a/d$d;->b:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string v0, "/socket.io"

    iput-object v0, p2, Lb/a/d/a/d$d;->b:Ljava/lang/String;

    :cond_1
    iget-object v0, p2, Lb/a/d/a/d$d;->i:Ljavax/net/ssl/SSLContext;

    if-nez v0, :cond_2

    sget-object v0, Lb/a/b/c;->x:Ljavax/net/ssl/SSLContext;

    iput-object v0, p2, Lb/a/d/a/d$d;->i:Ljavax/net/ssl/SSLContext;

    :cond_2
    iget-object v0, p2, Lb/a/d/a/d$d;->j:Ljavax/net/ssl/HostnameVerifier;

    if-nez v0, :cond_3

    sget-object v0, Lb/a/b/c;->y:Ljavax/net/ssl/HostnameVerifier;

    iput-object v0, p2, Lb/a/d/a/d$d;->j:Ljavax/net/ssl/HostnameVerifier;

    :cond_3
    iput-object p2, p0, Lb/a/b/c;->r:Lb/a/b/c$o;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lb/a/b/c;->v:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lb/a/b/c;->q:Ljava/util/Queue;

    iget-boolean v0, p2, Lb/a/b/c$o;->t:Z

    invoke-virtual {p0, v0}, Lb/a/b/c;->b0(Z)Lb/a/b/c;

    iget v0, p2, Lb/a/b/c$o;->u:I

    if-eqz v0, :cond_4

    goto :goto_0

    :cond_4
    const v0, 0x7fffffff

    :goto_0
    invoke-virtual {p0, v0}, Lb/a/b/c;->c0(I)Lb/a/b/c;

    iget-wide v0, p2, Lb/a/b/c$o;->v:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_5

    goto :goto_1

    :cond_5
    const-wide/16 v0, 0x3e8

    :goto_1
    invoke-virtual {p0, v0, v1}, Lb/a/b/c;->e0(J)Lb/a/b/c;

    iget-wide v0, p2, Lb/a/b/c$o;->w:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_6

    goto :goto_2

    :cond_6
    const-wide/16 v0, 0x1388

    :goto_2
    invoke-virtual {p0, v0, v1}, Lb/a/b/c;->g0(J)Lb/a/b/c;

    iget-wide v0, p2, Lb/a/b/c$o;->x:D

    const-wide/16 v2, 0x0

    cmpl-double v4, v0, v2

    if-eqz v4, :cond_7

    goto :goto_3

    :cond_7
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    :goto_3
    invoke-virtual {p0, v0, v1}, Lb/a/b/c;->Z(D)Lb/a/b/c;

    new-instance v0, Lb/a/a/a;

    invoke-direct {v0}, Lb/a/a/a;-><init>()V

    invoke-virtual {p0}, Lb/a/b/c;->d0()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lb/a/a/a;->f(J)Lb/a/a/a;

    invoke-virtual {p0}, Lb/a/b/c;->f0()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lb/a/a/a;->e(J)Lb/a/a/a;

    invoke-virtual {p0}, Lb/a/b/c;->Y()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lb/a/a/a;->d(D)Lb/a/a/a;

    iput-object v0, p0, Lb/a/b/c;->k:Lb/a/a/a;

    iget-wide v0, p2, Lb/a/b/c$o;->y:J

    invoke-virtual {p0, v0, v1}, Lb/a/b/c;->i0(J)Lb/a/b/c;

    sget-object p2, Lb/a/b/c$p;->a:Lb/a/b/c$p;

    iput-object p2, p0, Lb/a/b/c;->b:Lb/a/b/c$p;

    iput-object p1, p0, Lb/a/b/c;->o:Ljava/net/URI;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lb/a/b/c;->f:Z

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lb/a/b/c;->p:Ljava/util/List;

    new-instance p1, Lb/a/h/c$c;

    invoke-direct {p1}, Lb/a/h/c$c;-><init>()V

    iput-object p1, p0, Lb/a/b/c;->t:Lb/a/h/c$c;

    new-instance p1, Lb/a/h/c$b;

    invoke-direct {p1}, Lb/a/h/c$b;-><init>()V

    iput-object p1, p0, Lb/a/b/c;->u:Lb/a/h/c$b;

    return-void
.end method

.method static synthetic A(Lb/a/b/c;)V
    .locals 0

    invoke-direct {p0}, Lb/a/b/c;->Q()V

    return-void
.end method

.method static synthetic B(Lb/a/b/c;)V
    .locals 0

    invoke-direct {p0}, Lb/a/b/c;->G()V

    return-void
.end method

.method static synthetic C(Lb/a/b/c;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lb/a/b/c;->J(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic D(Lb/a/b/c;)V
    .locals 0

    invoke-direct {p0}, Lb/a/b/c;->K()V

    return-void
.end method

.method static synthetic E(Lb/a/b/c;)J
    .locals 2

    iget-wide v0, p0, Lb/a/b/c;->l:J

    return-wide v0
.end method

.method static synthetic F(Lb/a/b/c;)Ljava/util/Queue;
    .locals 0

    iget-object p0, p0, Lb/a/b/c;->q:Ljava/util/Queue;

    return-object p0
.end method

.method private G()V
    .locals 2

    sget-object v0, Lb/a/b/c;->w:Ljava/util/logging/Logger;

    const-string v1, "cleanup"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    :goto_0
    iget-object v0, p0, Lb/a/b/c;->q:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/a/b/d$b;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lb/a/b/d$b;->a()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lb/a/b/c;->p:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lb/a/b/c;->f:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lb/a/b/c;->n:Ljava/util/Date;

    iget-object v0, p0, Lb/a/b/c;->u:Lb/a/h/c$b;

    invoke-virtual {v0}, Lb/a/h/c$b;->k()V

    return-void
.end method

.method private varargs J(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    invoke-virtual {p0, p1, p2}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    iget-object v0, p0, Lb/a/b/c;->v:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/a/b/e;

    invoke-virtual {v1, p1, p2}, Lb/a/b/e;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    goto :goto_0

    :cond_0
    return-void
.end method

.method private K()V
    .locals 1

    iget-boolean v0, p0, Lb/a/b/c;->e:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lb/a/b/c;->c:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lb/a/b/c;->k:Lb/a/a/a;

    invoke-virtual {v0}, Lb/a/a/a;->b()I

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lb/a/b/c;->a0()V

    :cond_0
    return-void
.end method

.method private L(Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lb/a/b/c;->w:Ljava/util/logging/Logger;

    const-string v1, "onclose"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    invoke-direct {p0}, Lb/a/b/c;->G()V

    iget-object v0, p0, Lb/a/b/c;->k:Lb/a/a/a;

    invoke-virtual {v0}, Lb/a/a/a;->c()V

    sget-object v0, Lb/a/b/c$p;->a:Lb/a/b/c$p;

    iput-object v0, p0, Lb/a/b/c;->b:Lb/a/b/c$p;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "close"

    invoke-virtual {p0, p1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    iget-boolean p1, p0, Lb/a/b/c;->c:Z

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lb/a/b/c;->d:Z

    if-nez p1, :cond_0

    invoke-direct {p0}, Lb/a/b/c;->a0()V

    :cond_0
    return-void
.end method

.method private M(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lb/a/b/c;->u:Lb/a/h/c$b;

    invoke-virtual {v0, p1}, Lb/a/h/c$b;->h(Ljava/lang/String;)V

    return-void
.end method

.method private N([B)V
    .locals 1

    iget-object v0, p0, Lb/a/b/c;->u:Lb/a/h/c$b;

    invoke-virtual {v0, p1}, Lb/a/h/c$b;->i([B)V

    return-void
.end method

.method private O(Lb/a/h/b;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "packet"

    invoke-virtual {p0, p1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method

.method private P(Ljava/lang/Exception;)V
    .locals 3

    sget-object v0, Lb/a/b/c;->w:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "error"

    invoke-virtual {v0, v1, v2, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-direct {p0, v2, v0}, Lb/a/b/c;->J(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private Q()V
    .locals 4

    sget-object v0, Lb/a/b/c;->w:Ljava/util/logging/Logger;

    const-string v1, "open"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    invoke-direct {p0}, Lb/a/b/c;->G()V

    sget-object v0, Lb/a/b/c$p;->c:Lb/a/b/c$p;

    iput-object v0, p0, Lb/a/b/c;->b:Lb/a/b/c$p;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    iget-object v0, p0, Lb/a/b/c;->s:Lb/a/d/a/c;

    iget-object v1, p0, Lb/a/b/c;->q:Ljava/util/Queue;

    new-instance v2, Lb/a/b/c$e;

    invoke-direct {v2, p0}, Lb/a/b/c$e;-><init>(Lb/a/b/c;)V

    const-string v3, "data"

    invoke-static {v0, v3, v2}, Lb/a/b/d;->a(Lb/a/c/a;Ljava/lang/String;Lb/a/c/a$a;)Lb/a/b/d$b;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lb/a/b/c;->q:Ljava/util/Queue;

    new-instance v2, Lb/a/b/c$f;

    invoke-direct {v2, p0}, Lb/a/b/c$f;-><init>(Lb/a/b/c;)V

    const-string v3, "ping"

    invoke-static {v0, v3, v2}, Lb/a/b/d;->a(Lb/a/c/a;Ljava/lang/String;Lb/a/c/a$a;)Lb/a/b/d$b;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lb/a/b/c;->q:Ljava/util/Queue;

    new-instance v2, Lb/a/b/c$g;

    invoke-direct {v2, p0}, Lb/a/b/c$g;-><init>(Lb/a/b/c;)V

    const-string v3, "pong"

    invoke-static {v0, v3, v2}, Lb/a/b/d;->a(Lb/a/c/a;Ljava/lang/String;Lb/a/c/a$a;)Lb/a/b/d$b;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lb/a/b/c;->q:Ljava/util/Queue;

    new-instance v2, Lb/a/b/c$h;

    invoke-direct {v2, p0}, Lb/a/b/c$h;-><init>(Lb/a/b/c;)V

    const-string v3, "error"

    invoke-static {v0, v3, v2}, Lb/a/b/d;->a(Lb/a/c/a;Ljava/lang/String;Lb/a/c/a$a;)Lb/a/b/d$b;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lb/a/b/c;->q:Ljava/util/Queue;

    new-instance v2, Lb/a/b/c$i;

    invoke-direct {v2, p0}, Lb/a/b/c$i;-><init>(Lb/a/b/c;)V

    const-string v3, "close"

    invoke-static {v0, v3, v2}, Lb/a/b/d;->a(Lb/a/c/a;Ljava/lang/String;Lb/a/c/a$a;)Lb/a/b/d$b;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lb/a/b/c;->q:Ljava/util/Queue;

    iget-object v1, p0, Lb/a/b/c;->u:Lb/a/h/c$b;

    sget-object v2, Lb/a/h/c$b;->c:Ljava/lang/String;

    new-instance v3, Lb/a/b/c$j;

    invoke-direct {v3, p0}, Lb/a/b/c$j;-><init>(Lb/a/b/c;)V

    invoke-static {v1, v2, v3}, Lb/a/b/d;->a(Lb/a/c/a;Ljava/lang/String;Lb/a/c/a$a;)Lb/a/b/d$b;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private R()V
    .locals 2

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lb/a/b/c;->n:Ljava/util/Date;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "ping"

    invoke-direct {p0, v1, v0}, Lb/a/b/c;->J(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private S()V
    .locals 5

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v1, p0, Lb/a/b/c;->n:Ljava/util/Date;

    if-eqz v1, :cond_0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    iget-object v3, p0, Lb/a/b/c;->n:Ljava/util/Date;

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    sub-long/2addr v1, v3

    goto :goto_0

    :cond_0
    const-wide/16 v1, 0x0

    :goto_0
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "pong"

    invoke-direct {p0, v1, v0}, Lb/a/b/c;->J(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private T()V
    .locals 3

    iget-object v0, p0, Lb/a/b/c;->k:Lb/a/a/a;

    invoke-virtual {v0}, Lb/a/a/a;->b()I

    move-result v0

    const/4 v1, 0x0

    iput-boolean v1, p0, Lb/a/b/c;->e:Z

    iget-object v2, p0, Lb/a/b/c;->k:Lb/a/a/a;

    invoke-virtual {v2}, Lb/a/a/a;->c()V

    invoke-direct {p0}, Lb/a/b/c;->j0()V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v2, v1

    const-string v0, "reconnect"

    invoke-direct {p0, v0, v2}, Lb/a/b/c;->J(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private X()V
    .locals 2

    iget-object v0, p0, Lb/a/b/c;->p:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lb/a/b/c;->f:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lb/a/b/c;->p:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/a/h/b;

    invoke-virtual {p0, v0}, Lb/a/b/c;->W(Lb/a/h/b;)V

    :cond_0
    return-void
.end method

.method private a0()V
    .locals 7

    iget-boolean v0, p0, Lb/a/b/c;->e:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lb/a/b/c;->d:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lb/a/b/c;->k:Lb/a/a/a;

    invoke-virtual {v0}, Lb/a/a/a;->b()I

    move-result v0

    iget v1, p0, Lb/a/b/c;->g:I

    const/4 v2, 0x0

    if-lt v0, v1, :cond_1

    sget-object v0, Lb/a/b/c;->w:Ljava/util/logging/Logger;

    const-string v1, "reconnect failed"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object v0, p0, Lb/a/b/c;->k:Lb/a/a/a;

    invoke-virtual {v0}, Lb/a/a/a;->c()V

    new-array v0, v2, [Ljava/lang/Object;

    const-string v1, "reconnect_failed"

    invoke-direct {p0, v1, v0}, Lb/a/b/c;->J(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v2, p0, Lb/a/b/c;->e:Z

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lb/a/b/c;->k:Lb/a/a/a;

    invoke-virtual {v0}, Lb/a/a/a;->a()J

    move-result-wide v0

    sget-object v3, Lb/a/b/c;->w:Ljava/util/logging/Logger;

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v2

    const-string v2, "will wait %dms before reconnect attempt"

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iput-boolean v4, p0, Lb/a/b/c;->e:Z

    new-instance v2, Ljava/util/Timer;

    invoke-direct {v2}, Ljava/util/Timer;-><init>()V

    new-instance v3, Lb/a/b/c$c;

    invoke-direct {v3, p0, p0}, Lb/a/b/c$c;-><init>(Lb/a/b/c;Lb/a/b/c;)V

    invoke-virtual {v2, v3, v0, v1}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    iget-object v0, p0, Lb/a/b/c;->q:Ljava/util/Queue;

    new-instance v1, Lb/a/b/c$d;

    invoke-direct {v1, p0, v2}, Lb/a/b/c$d;-><init>(Lb/a/b/c;Ljava/util/Timer;)V

    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    :cond_2
    :goto_0
    return-void
.end method

.method static synthetic h()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lb/a/b/c;->w:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic i(Lb/a/b/c;)Ljava/net/URI;
    .locals 0

    iget-object p0, p0, Lb/a/b/c;->o:Ljava/net/URI;

    return-object p0
.end method

.method static synthetic j(Lb/a/b/c;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/b/c;->M(Ljava/lang/String;)V

    return-void
.end method

.method private j0()V
    .locals 3

    iget-object v0, p0, Lb/a/b/c;->v:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/a/b/e;

    iget-object v2, p0, Lb/a/b/c;->s:Lb/a/d/a/c;

    invoke-virtual {v2}, Lb/a/d/a/c;->I()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lb/a/b/e;->b:Ljava/lang/String;

    goto :goto_0

    :cond_0
    return-void
.end method

.method static synthetic k(Lb/a/b/c;[B)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/b/c;->N([B)V

    return-void
.end method

.method static synthetic l(Lb/a/b/c;)V
    .locals 0

    invoke-direct {p0}, Lb/a/b/c;->R()V

    return-void
.end method

.method static synthetic m(Lb/a/b/c;)V
    .locals 0

    invoke-direct {p0}, Lb/a/b/c;->S()V

    return-void
.end method

.method static synthetic n(Lb/a/b/c;Ljava/lang/Exception;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/b/c;->P(Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic o(Lb/a/b/c;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/b/c;->L(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic p(Lb/a/b/c;Lb/a/h/b;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/b/c;->O(Lb/a/h/b;)V

    return-void
.end method

.method static synthetic q(Lb/a/b/c;)Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Lb/a/b/c;->m:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic r(Lb/a/b/c;Z)Z
    .locals 0

    iput-boolean p1, p0, Lb/a/b/c;->f:Z

    return p1
.end method

.method static synthetic s(Lb/a/b/c;)V
    .locals 0

    invoke-direct {p0}, Lb/a/b/c;->X()V

    return-void
.end method

.method static synthetic t(Lb/a/b/c;)Lb/a/b/c$o;
    .locals 0

    iget-object p0, p0, Lb/a/b/c;->r:Lb/a/b/c$o;

    return-object p0
.end method

.method static synthetic u(Lb/a/b/c;)Lb/a/a/a;
    .locals 0

    iget-object p0, p0, Lb/a/b/c;->k:Lb/a/a/a;

    return-object p0
.end method

.method static synthetic v(Lb/a/b/c;Z)Z
    .locals 0

    iput-boolean p1, p0, Lb/a/b/c;->e:Z

    return p1
.end method

.method static synthetic w(Lb/a/b/c;)V
    .locals 0

    invoke-direct {p0}, Lb/a/b/c;->a0()V

    return-void
.end method

.method static synthetic x(Lb/a/b/c;)V
    .locals 0

    invoke-direct {p0}, Lb/a/b/c;->T()V

    return-void
.end method

.method static synthetic y(Lb/a/b/c;)Z
    .locals 0

    iget-boolean p0, p0, Lb/a/b/c;->d:Z

    return p0
.end method

.method static synthetic z(Lb/a/b/c;Z)Z
    .locals 0

    iput-boolean p1, p0, Lb/a/b/c;->d:Z

    return p1
.end method


# virtual methods
.method H()V
    .locals 2

    sget-object v0, Lb/a/b/c;->w:Ljava/util/logging/Logger;

    const-string v1, "disconnect"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lb/a/b/c;->d:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lb/a/b/c;->e:Z

    iget-object v0, p0, Lb/a/b/c;->b:Lb/a/b/c$p;

    sget-object v1, Lb/a/b/c$p;->c:Lb/a/b/c$p;

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lb/a/b/c;->G()V

    :cond_0
    iget-object v0, p0, Lb/a/b/c;->k:Lb/a/a/a;

    invoke-virtual {v0}, Lb/a/a/a;->c()V

    sget-object v0, Lb/a/b/c$p;->a:Lb/a/b/c$p;

    iput-object v0, p0, Lb/a/b/c;->b:Lb/a/b/c$p;

    iget-object v0, p0, Lb/a/b/c;->s:Lb/a/d/a/c;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lb/a/d/a/c;->D()Lb/a/d/a/c;

    :cond_1
    return-void
.end method

.method I(Lb/a/b/e;)V
    .locals 1

    iget-object v0, p0, Lb/a/b/c;->m:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Lb/a/b/c;->m:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lb/a/b/c;->H()V

    return-void
.end method

.method public U()Lb/a/b/c;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lb/a/b/c;->V(Lb/a/b/c$n;)Lb/a/b/c;

    return-object p0
.end method

.method public V(Lb/a/b/c$n;)Lb/a/b/c;
    .locals 1

    new-instance v0, Lb/a/b/c$a;

    invoke-direct {v0, p0, p1}, Lb/a/b/c$a;-><init>(Lb/a/b/c;Lb/a/b/c$n;)V

    invoke-static {v0}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-object p0
.end method

.method W(Lb/a/h/b;)V
    .locals 4

    sget-object v0, Lb/a/b/c;->w:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v3, "writing packet %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-boolean v0, p0, Lb/a/b/c;->f:Z

    if-nez v0, :cond_0

    iput-boolean v1, p0, Lb/a/b/c;->f:Z

    iget-object v0, p0, Lb/a/b/c;->t:Lb/a/h/c$c;

    new-instance v1, Lb/a/b/c$b;

    invoke-direct {v1, p0, p0}, Lb/a/b/c$b;-><init>(Lb/a/b/c;Lb/a/b/c;)V

    invoke-virtual {v0, p1, v1}, Lb/a/h/c$c;->a(Lb/a/h/b;Lb/a/h/c$c$a;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lb/a/b/c;->p:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method

.method public final Y()D
    .locals 2

    iget-wide v0, p0, Lb/a/b/c;->j:D

    return-wide v0
.end method

.method public Z(D)Lb/a/b/c;
    .locals 1

    iput-wide p1, p0, Lb/a/b/c;->j:D

    iget-object v0, p0, Lb/a/b/c;->k:Lb/a/a/a;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lb/a/a/a;->d(D)Lb/a/a/a;

    :cond_0
    return-object p0
.end method

.method public b0(Z)Lb/a/b/c;
    .locals 0

    iput-boolean p1, p0, Lb/a/b/c;->c:Z

    return-object p0
.end method

.method public c0(I)Lb/a/b/c;
    .locals 0

    iput p1, p0, Lb/a/b/c;->g:I

    return-object p0
.end method

.method public final d0()J
    .locals 2

    iget-wide v0, p0, Lb/a/b/c;->h:J

    return-wide v0
.end method

.method public e0(J)Lb/a/b/c;
    .locals 1

    iput-wide p1, p0, Lb/a/b/c;->h:J

    iget-object v0, p0, Lb/a/b/c;->k:Lb/a/a/a;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lb/a/a/a;->f(J)Lb/a/a/a;

    :cond_0
    return-object p0
.end method

.method public final f0()J
    .locals 2

    iget-wide v0, p0, Lb/a/b/c;->i:J

    return-wide v0
.end method

.method public g0(J)Lb/a/b/c;
    .locals 1

    iput-wide p1, p0, Lb/a/b/c;->i:J

    iget-object v0, p0, Lb/a/b/c;->k:Lb/a/a/a;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lb/a/a/a;->e(J)Lb/a/a/a;

    :cond_0
    return-object p0
.end method

.method public h0(Ljava/lang/String;)Lb/a/b/e;
    .locals 2

    iget-object v0, p0, Lb/a/b/c;->v:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/a/b/e;

    if-nez v0, :cond_1

    new-instance v0, Lb/a/b/e;

    invoke-direct {v0, p0, p1}, Lb/a/b/e;-><init>(Lb/a/b/c;Ljava/lang/String;)V

    iget-object v1, p0, Lb/a/b/c;->v:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/a/b/e;

    if-eqz p1, :cond_0

    move-object v0, p1

    goto :goto_0

    :cond_0
    new-instance p1, Lb/a/b/c$k;

    invoke-direct {p1, p0, p0, v0}, Lb/a/b/c$k;-><init>(Lb/a/b/c;Lb/a/b/c;Lb/a/b/e;)V

    const-string v1, "connecting"

    invoke-virtual {v0, v1, p1}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    new-instance p1, Lb/a/b/c$l;

    invoke-direct {p1, p0, v0, p0}, Lb/a/b/c$l;-><init>(Lb/a/b/c;Lb/a/b/e;Lb/a/b/c;)V

    const-string v1, "connect"

    invoke-virtual {v0, v1, p1}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    :cond_1
    :goto_0
    return-object v0
.end method

.method public i0(J)Lb/a/b/c;
    .locals 0

    iput-wide p1, p0, Lb/a/b/c;->l:J

    return-object p0
.end method
