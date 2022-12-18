.class public Lb/a/d/a/c;
.super Lb/a/c/a;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/a/d/a/c$u;,
        Lb/a/d/a/c$v;
    }
.end annotation


# static fields
.field private static final E:Ljava/util/logging/Logger;

.field private static F:Z

.field private static G:Ljavax/net/ssl/SSLContext;

.field private static H:Ljavax/net/ssl/HostnameVerifier;


# instance fields
.field public A:Ljava/lang/String;

.field private B:Lb/a/d/a/c$v;

.field private C:Ljava/util/concurrent/ScheduledExecutorService;

.field private final D:Lb/a/c/a$a;

.field private b:Z

.field private c:Z

.field private d:Z

.field private e:Z

.field private f:Z

.field g:I

.field private h:I

.field private i:I

.field private j:J

.field private k:J

.field private l:Ljava/lang/String;

.field m:Ljava/lang/String;

.field private n:Ljava/lang/String;

.field private o:Ljava/lang/String;

.field private p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private r:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field s:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lb/a/d/b/b;",
            ">;"
        }
    .end annotation
.end field

.field t:Lb/a/d/a/d;

.field private u:Ljava/util/concurrent/Future;

.field private v:Ljava/util/concurrent/Future;

.field private w:Ljavax/net/ssl/SSLContext;

.field private x:Ljavax/net/ssl/HostnameVerifier;

.field public y:Ljava/net/Proxy;

.field public z:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lb/a/d/a/c;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lb/a/d/a/c;->E:Ljava/util/logging/Logger;

    const/4 v0, 0x0

    sput-boolean v0, Lb/a/d/a/c;->F:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    new-instance v0, Lb/a/d/a/c$u;

    invoke-direct {v0}, Lb/a/d/a/c$u;-><init>()V

    invoke-direct {p0, v0}, Lb/a/d/a/c;-><init>(Lb/a/d/a/c$u;)V

    return-void
.end method

.method public constructor <init>(Lb/a/d/a/c$u;)V
    .locals 7

    invoke-direct {p0}, Lb/a/c/a;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lb/a/d/a/c;->s:Ljava/util/LinkedList;

    new-instance v0, Lb/a/d/a/c$k;

    invoke-direct {v0, p0}, Lb/a/d/a/c$k;-><init>(Lb/a/d/a/c;)V

    iput-object v0, p0, Lb/a/d/a/c;->D:Lb/a/c/a$a;

    iget-object v0, p1, Lb/a/d/a/c$u;->r:Ljava/lang/String;

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, -0x1

    if-eqz v0, :cond_3

    const-string v5, ":"

    invoke-virtual {v0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    array-length v5, v5

    if-le v5, v1, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    if-eqz v5, :cond_2

    const/16 v5, 0x5b

    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-eq v5, v4, :cond_1

    add-int/2addr v5, v2

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_1
    const/16 v5, 0x5d

    invoke-virtual {v0, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    if-eq v5, v4, :cond_2

    invoke-virtual {v0, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_2
    iput-object v0, p1, Lb/a/d/a/d$d;->a:Ljava/lang/String;

    :cond_3
    iget-boolean v0, p1, Lb/a/d/a/d$d;->d:Z

    iput-boolean v0, p0, Lb/a/d/a/c;->b:Z

    iget v5, p1, Lb/a/d/a/d$d;->f:I

    if-ne v5, v4, :cond_5

    if-eqz v0, :cond_4

    const/16 v0, 0x1bb

    goto :goto_1

    :cond_4
    const/16 v0, 0x50

    :goto_1
    iput v0, p1, Lb/a/d/a/d$d;->f:I

    :cond_5
    iget-object v0, p1, Lb/a/d/a/d$d;->i:Ljavax/net/ssl/SSLContext;

    if-eqz v0, :cond_6

    goto :goto_2

    :cond_6
    sget-object v0, Lb/a/d/a/c;->G:Ljavax/net/ssl/SSLContext;

    :goto_2
    iput-object v0, p0, Lb/a/d/a/c;->w:Ljavax/net/ssl/SSLContext;

    iget-object v0, p1, Lb/a/d/a/d$d;->a:Ljava/lang/String;

    if-eqz v0, :cond_7

    goto :goto_3

    :cond_7
    const-string v0, "localhost"

    :goto_3
    iput-object v0, p0, Lb/a/d/a/c;->m:Ljava/lang/String;

    iget v0, p1, Lb/a/d/a/d$d;->f:I

    iput v0, p0, Lb/a/d/a/c;->g:I

    iget-object v0, p1, Lb/a/d/a/c$u;->s:Ljava/lang/String;

    if-eqz v0, :cond_8

    invoke-static {v0}, Lb/a/g/a;->a(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    goto :goto_4

    :cond_8
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_4
    iput-object v0, p0, Lb/a/d/a/c;->r:Ljava/util/Map;

    iget-boolean v0, p1, Lb/a/d/a/c$u;->p:Z

    iput-boolean v0, p0, Lb/a/d/a/c;->c:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p1, Lb/a/d/a/d$d;->b:Ljava/lang/String;

    if-eqz v4, :cond_9

    goto :goto_5

    :cond_9
    const-string v4, "/engine.io"

    :goto_5
    const-string v5, "/$"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lb/a/d/a/c;->n:Ljava/lang/String;

    iget-object v0, p1, Lb/a/d/a/d$d;->c:Ljava/lang/String;

    if-eqz v0, :cond_a

    goto :goto_6

    :cond_a
    const-string v0, "t"

    :goto_6
    iput-object v0, p0, Lb/a/d/a/c;->o:Ljava/lang/String;

    iget-boolean v0, p1, Lb/a/d/a/d$d;->e:Z

    iput-boolean v0, p0, Lb/a/d/a/c;->d:Z

    new-instance v0, Ljava/util/ArrayList;

    iget-object v4, p1, Lb/a/d/a/c$u;->o:[Ljava/lang/String;

    if-eqz v4, :cond_b

    goto :goto_7

    :cond_b
    new-array v4, v1, [Ljava/lang/String;

    const-string v1, "polling"

    aput-object v1, v4, v3

    const-string v1, "websocket"

    aput-object v1, v4, v2

    :goto_7
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lb/a/d/a/c;->p:Ljava/util/List;

    iget v0, p1, Lb/a/d/a/d$d;->g:I

    if-eqz v0, :cond_c

    goto :goto_8

    :cond_c
    const/16 v0, 0x34b

    :goto_8
    iput v0, p0, Lb/a/d/a/c;->h:I

    iget-boolean v0, p1, Lb/a/d/a/c$u;->q:Z

    iput-boolean v0, p0, Lb/a/d/a/c;->f:Z

    iget-object v0, p1, Lb/a/d/a/d$d;->j:Ljavax/net/ssl/HostnameVerifier;

    if-eqz v0, :cond_d

    goto :goto_9

    :cond_d
    sget-object v0, Lb/a/d/a/c;->H:Ljavax/net/ssl/HostnameVerifier;

    :goto_9
    iput-object v0, p0, Lb/a/d/a/c;->x:Ljavax/net/ssl/HostnameVerifier;

    iget-object v0, p1, Lb/a/d/a/d$d;->l:Ljava/net/Proxy;

    iput-object v0, p0, Lb/a/d/a/c;->y:Ljava/net/Proxy;

    iget-object v0, p1, Lb/a/d/a/d$d;->m:Ljava/lang/String;

    iput-object v0, p0, Lb/a/d/a/c;->z:Ljava/lang/String;

    iget-object p1, p1, Lb/a/d/a/d$d;->n:Ljava/lang/String;

    iput-object p1, p0, Lb/a/d/a/c;->A:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Lb/a/d/a/c$u;)V
    .locals 0

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1, p2}, Lb/a/d/a/c$u;->a(Ljava/net/URI;Lb/a/d/a/c$u;)Lb/a/d/a/c$u;

    move-result-object p2

    :goto_0
    invoke-direct {p0, p2}, Lb/a/d/a/c;-><init>(Lb/a/d/a/c$u;)V

    return-void
.end method

.method static synthetic A(Lb/a/d/a/c;Lb/a/d/a/d;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/d/a/c;->b0(Lb/a/d/a/d;)V

    return-void
.end method

.method static synthetic B(Lb/a/d/a/c;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/d/a/c;->J(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic C(Lb/a/d/a/c;Ljava/lang/Exception;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/d/a/c;->M(Ljava/lang/Exception;)V

    return-void
.end method

.method private E(Ljava/lang/String;)Lb/a/d/a/d;
    .locals 6

    sget-object v0, Lb/a/d/a/c;->E:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "creating transport \'%s\'"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    new-instance v0, Ljava/util/HashMap;

    iget-object v2, p0, Lb/a/d/a/c;->r:Ljava/util/Map;

    invoke-direct {v0, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v4, "EIO"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "transport"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v4, p0, Lb/a/d/a/c;->l:Ljava/lang/String;

    if-eqz v4, :cond_0

    const-string v5, "sid"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    new-instance v4, Lb/a/d/a/d$d;

    invoke-direct {v4}, Lb/a/d/a/d$d;-><init>()V

    iget-object v5, p0, Lb/a/d/a/c;->w:Ljavax/net/ssl/SSLContext;

    iput-object v5, v4, Lb/a/d/a/d$d;->i:Ljavax/net/ssl/SSLContext;

    iget-object v5, p0, Lb/a/d/a/c;->m:Ljava/lang/String;

    iput-object v5, v4, Lb/a/d/a/d$d;->a:Ljava/lang/String;

    iget v5, p0, Lb/a/d/a/c;->g:I

    iput v5, v4, Lb/a/d/a/d$d;->f:I

    iget-boolean v5, p0, Lb/a/d/a/c;->b:Z

    iput-boolean v5, v4, Lb/a/d/a/d$d;->d:Z

    iget-object v5, p0, Lb/a/d/a/c;->n:Ljava/lang/String;

    iput-object v5, v4, Lb/a/d/a/d$d;->b:Ljava/lang/String;

    iput-object v0, v4, Lb/a/d/a/d$d;->h:Ljava/util/Map;

    iget-boolean v0, p0, Lb/a/d/a/c;->d:Z

    iput-boolean v0, v4, Lb/a/d/a/d$d;->e:Z

    iget-object v0, p0, Lb/a/d/a/c;->o:Ljava/lang/String;

    iput-object v0, v4, Lb/a/d/a/d$d;->c:Ljava/lang/String;

    iget v0, p0, Lb/a/d/a/c;->h:I

    iput v0, v4, Lb/a/d/a/d$d;->g:I

    iput-object p0, v4, Lb/a/d/a/d$d;->k:Lb/a/d/a/c;

    iget-object v0, p0, Lb/a/d/a/c;->x:Ljavax/net/ssl/HostnameVerifier;

    iput-object v0, v4, Lb/a/d/a/d$d;->j:Ljavax/net/ssl/HostnameVerifier;

    iget-object v0, p0, Lb/a/d/a/c;->y:Ljava/net/Proxy;

    iput-object v0, v4, Lb/a/d/a/d$d;->l:Ljava/net/Proxy;

    iget-object v0, p0, Lb/a/d/a/c;->z:Ljava/lang/String;

    iput-object v0, v4, Lb/a/d/a/d$d;->m:Ljava/lang/String;

    iget-object v0, p0, Lb/a/d/a/c;->A:Ljava/lang/String;

    iput-object v0, v4, Lb/a/d/a/d$d;->n:Ljava/lang/String;

    const-string v0, "websocket"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance p1, Lb/a/d/a/e/c;

    invoke-direct {p1, v4}, Lb/a/d/a/e/c;-><init>(Lb/a/d/a/d$d;)V

    goto :goto_0

    :cond_1
    const-string v0, "polling"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    new-instance p1, Lb/a/d/a/e/b;

    invoke-direct {p1, v4}, Lb/a/d/a/e/b;-><init>(Lb/a/d/a/d$d;)V

    :goto_0
    new-array v0, v1, [Ljava/lang/Object;

    aput-object p1, v0, v3

    invoke-virtual {p0, v2, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-object p1

    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    throw p1
.end method

.method private G()V
    .locals 4

    iget-object v0, p0, Lb/a/d/a/c;->B:Lb/a/d/a/c$v;

    sget-object v1, Lb/a/d/a/c$v;->d:Lb/a/d/a/c$v;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lb/a/d/a/c;->t:Lb/a/d/a/d;

    iget-boolean v0, v0, Lb/a/d/a/d;->b:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lb/a/d/a/c;->e:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lb/a/d/a/c;->s:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lb/a/d/a/c;->E:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lb/a/d/a/c;->s:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "flushing %d packets in socket"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object v0, p0, Lb/a/d/a/c;->s:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    iput v0, p0, Lb/a/d/a/c;->i:I

    iget-object v0, p0, Lb/a/d/a/c;->t:Lb/a/d/a/d;

    iget-object v1, p0, Lb/a/d/a/c;->s:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v2

    new-array v2, v2, [Lb/a/d/b/b;

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lb/a/d/b/b;

    invoke-virtual {v0, v1}, Lb/a/d/a/d;->r([Lb/a/d/b/b;)V

    new-array v0, v3, [Ljava/lang/Object;

    const-string v1, "flush"

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    :cond_0
    return-void
.end method

.method private H()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    iget-object v0, p0, Lb/a/d/a/c;->C:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lb/a/d/a/c;->C:Ljava/util/concurrent/ScheduledExecutorService;

    :cond_1
    iget-object v0, p0, Lb/a/d/a/c;->C:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method private J(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lb/a/d/a/c;->K(Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method

.method private K(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 5

    sget-object v0, Lb/a/d/a/c$v;->a:Lb/a/d/a/c$v;

    iget-object v1, p0, Lb/a/d/a/c;->B:Lb/a/d/a/c$v;

    if-eq v0, v1, :cond_0

    sget-object v0, Lb/a/d/a/c$v;->b:Lb/a/d/a/c$v;

    if-eq v0, v1, :cond_0

    sget-object v0, Lb/a/d/a/c$v;->c:Lb/a/d/a/c$v;

    if-ne v0, v1, :cond_4

    :cond_0
    sget-object v0, Lb/a/d/a/c;->E:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "socket close with reason: %s"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object v0, p0, Lb/a/d/a/c;->v:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_1

    invoke-interface {v0, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_1
    iget-object v0, p0, Lb/a/d/a/c;->u:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_2

    invoke-interface {v0, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_2
    iget-object v0, p0, Lb/a/d/a/c;->C:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    :cond_3
    iget-object v0, p0, Lb/a/d/a/c;->t:Lb/a/d/a/d;

    const-string v2, "close"

    invoke-virtual {v0, v2}, Lb/a/c/a;->c(Ljava/lang/String;)Lb/a/c/a;

    iget-object v0, p0, Lb/a/d/a/c;->t:Lb/a/d/a/d;

    invoke-virtual {v0}, Lb/a/d/a/d;->h()Lb/a/d/a/d;

    iget-object v0, p0, Lb/a/d/a/c;->t:Lb/a/d/a/d;

    invoke-virtual {v0}, Lb/a/c/a;->b()Lb/a/c/a;

    sget-object v0, Lb/a/d/a/c$v;->d:Lb/a/d/a/c$v;

    iput-object v0, p0, Lb/a/d/a/c;->B:Lb/a/d/a/c$v;

    const/4 v0, 0x0

    iput-object v0, p0, Lb/a/d/a/c;->l:Ljava/lang/String;

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v3

    aput-object p2, v0, v1

    invoke-virtual {p0, v2, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    iget-object p1, p0, Lb/a/d/a/c;->s:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/util/LinkedList;->clear()V

    iput v3, p0, Lb/a/d/a/c;->i:I

    :cond_4
    return-void
.end method

.method private L()V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget v2, p0, Lb/a/d/a/c;->i:I

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lb/a/d/a/c;->s:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iput v0, p0, Lb/a/d/a/c;->i:I

    iget-object v1, p0, Lb/a/d/a/c;->s:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-nez v1, :cond_1

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "drain"

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    goto :goto_1

    :cond_1
    invoke-direct {p0}, Lb/a/d/a/c;->G()V

    :goto_1
    return-void
.end method

.method private M(Ljava/lang/Exception;)V
    .locals 5

    sget-object v0, Lb/a/d/a/c;->E:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "socket error %s"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    sput-boolean v3, Lb/a/d/a/c;->F:Z

    new-array v0, v1, [Ljava/lang/Object;

    aput-object p1, v0, v3

    const-string v1, "error"

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    const-string v0, "transport error"

    invoke-direct {p0, v0, p1}, Lb/a/d/a/c;->K(Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method

.method private N(Lb/a/d/a/b;)V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "handshake"

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    iget-object v0, p1, Lb/a/d/a/b;->a:Ljava/lang/String;

    iput-object v0, p0, Lb/a/d/a/c;->l:Ljava/lang/String;

    iget-object v1, p0, Lb/a/d/a/c;->t:Lb/a/d/a/d;

    iget-object v1, v1, Lb/a/d/a/d;->d:Ljava/util/Map;

    const-string v2, "sid"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lb/a/d/a/b;->b:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb/a/d/a/c;->F(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lb/a/d/a/c;->q:Ljava/util/List;

    iget-wide v0, p1, Lb/a/d/a/b;->c:J

    iput-wide v0, p0, Lb/a/d/a/c;->j:J

    iget-wide v0, p1, Lb/a/d/a/b;->d:J

    iput-wide v0, p0, Lb/a/d/a/c;->k:J

    invoke-direct {p0}, Lb/a/d/a/c;->P()V

    sget-object p1, Lb/a/d/a/c$v;->d:Lb/a/d/a/c$v;

    iget-object v0, p0, Lb/a/d/a/c;->B:Lb/a/d/a/c$v;

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lb/a/d/a/c;->a0()V

    iget-object p1, p0, Lb/a/d/a/c;->D:Lb/a/c/a$a;

    const-string v0, "heartbeat"

    invoke-virtual {p0, v0, p1}, Lb/a/c/a;->d(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    iget-object p1, p0, Lb/a/d/a/c;->D:Lb/a/c/a$a;

    invoke-virtual {p0, v0, p1}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    return-void
.end method

.method private O(J)V
    .locals 3

    iget-object v0, p0, Lb/a/d/a/c;->u:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gtz v2, :cond_1

    iget-wide p1, p0, Lb/a/d/a/c;->j:J

    iget-wide v0, p0, Lb/a/d/a/c;->k:J

    add-long/2addr p1, v0

    :cond_1
    invoke-direct {p0}, Lb/a/d/a/c;->H()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Lb/a/d/a/c$e;

    invoke-direct {v1, p0, p0}, Lb/a/d/a/c$e;-><init>(Lb/a/d/a/c;Lb/a/d/a/c;)V

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, p1, p2, v2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iput-object p1, p0, Lb/a/d/a/c;->u:Ljava/util/concurrent/Future;

    return-void
.end method

.method private P()V
    .locals 4

    sget-object v0, Lb/a/d/a/c;->E:Ljava/util/logging/Logger;

    const-string v1, "socket open"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    sget-object v1, Lb/a/d/a/c$v;->b:Lb/a/d/a/c$v;

    iput-object v1, p0, Lb/a/d/a/c;->B:Lb/a/d/a/c$v;

    iget-object v2, p0, Lb/a/d/a/c;->t:Lb/a/d/a/d;

    iget-object v2, v2, Lb/a/d/a/d;->c:Ljava/lang/String;

    const-string v3, "websocket"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    sput-boolean v2, Lb/a/d/a/c;->F:Z

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "open"

    invoke-virtual {p0, v3, v2}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    invoke-direct {p0}, Lb/a/d/a/c;->G()V

    iget-object v2, p0, Lb/a/d/a/c;->B:Lb/a/d/a/c$v;

    if-ne v2, v1, :cond_0

    iget-boolean v1, p0, Lb/a/d/a/c;->c:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lb/a/d/a/c;->t:Lb/a/d/a/d;

    instance-of v1, v1, Lb/a/d/a/e/a;

    if-eqz v1, :cond_0

    const-string v1, "starting upgrade probes"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object v0, p0, Lb/a/d/a/c;->q:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lb/a/d/a/c;->T(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private Q(Lb/a/d/b/b;)V
    .locals 5

    iget-object v0, p0, Lb/a/d/a/c;->B:Lb/a/d/a/c$v;

    sget-object v1, Lb/a/d/a/c$v;->a:Lb/a/d/a/c$v;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_1

    sget-object v1, Lb/a/d/a/c$v;->b:Lb/a/d/a/c$v;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    sget-object p1, Lb/a/d/a/c;->E:Ljava/util/logging/Logger;

    new-array v1, v2, [Ljava/lang/Object;

    aput-object v0, v1, v3

    const-string v0, "packet received with socket readyState \'%s\'"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_1
    :goto_0
    sget-object v0, Lb/a/d/a/c;->E:Ljava/util/logging/Logger;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p1, Lb/a/d/b/b;->a:Ljava/lang/String;

    aput-object v4, v1, v3

    iget-object v4, p1, Lb/a/d/b/b;->b:Ljava/lang/Object;

    aput-object v4, v1, v2

    const-string v4, "socket received: type \'%s\', data \'%s\'"

    invoke-static {v4, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    new-array v0, v2, [Ljava/lang/Object;

    aput-object p1, v0, v3

    const-string v1, "packet"

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    new-array v0, v3, [Ljava/lang/Object;

    const-string v1, "heartbeat"

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    iget-object v0, p1, Lb/a/d/b/b;->a:Ljava/lang/String;

    const-string v1, "open"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "error"

    if-eqz v0, :cond_2

    :try_start_0
    new-instance v0, Lb/a/d/a/b;

    iget-object p1, p1, Lb/a/d/b/b;->b:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-direct {v0, p1}, Lb/a/d/a/b;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lb/a/d/a/c;->N(Lb/a/d/a/b;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    new-array v0, v2, [Ljava/lang/Object;

    new-instance v2, Lb/a/d/a/a;

    invoke-direct {v2, p1}, Lb/a/d/a/a;-><init>(Ljava/lang/Throwable;)V

    aput-object v2, v0, v3

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    goto :goto_1

    :cond_2
    iget-object v0, p1, Lb/a/d/b/b;->a:Ljava/lang/String;

    const-string v4, "pong"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lb/a/d/a/c;->a0()V

    new-array p1, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v4, p1}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    goto :goto_1

    :cond_3
    iget-object v0, p1, Lb/a/d/b/b;->a:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Lb/a/d/a/a;

    const-string v1, "server error"

    invoke-direct {v0, v1}, Lb/a/d/a/a;-><init>(Ljava/lang/String;)V

    iget-object p1, p1, Lb/a/d/b/b;->b:Ljava/lang/Object;

    iput-object p1, v0, Lb/a/d/a/a;->a:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lb/a/d/a/c;->M(Ljava/lang/Exception;)V

    goto :goto_1

    :cond_4
    iget-object v0, p1, Lb/a/d/b/b;->a:Ljava/lang/String;

    const-string v1, "message"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    new-array v0, v2, [Ljava/lang/Object;

    iget-object v4, p1, Lb/a/d/b/b;->b:Ljava/lang/Object;

    aput-object v4, v0, v3

    const-string v4, "data"

    invoke-virtual {p0, v4, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    new-array v0, v2, [Ljava/lang/Object;

    iget-object p1, p1, Lb/a/d/b/b;->b:Ljava/lang/Object;

    aput-object p1, v0, v3

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    :cond_5
    :goto_1
    return-void
.end method

.method private S()V
    .locals 1

    new-instance v0, Lb/a/d/a/c$g;

    invoke-direct {v0, p0}, Lb/a/d/a/c$g;-><init>(Lb/a/d/a/c;)V

    invoke-static {v0}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-void
.end method

.method private T(Ljava/lang/String;)V
    .locals 18

    move-object/from16 v9, p0

    sget-object v0, Lb/a/d/a/c;->E:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p1, v2, v10

    const-string v3, "probing transport \'%s\'"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    new-array v11, v1, [Lb/a/d/a/d;

    invoke-direct/range {p0 .. p1}, Lb/a/d/a/c;->E(Ljava/lang/String;)Lb/a/d/a/d;

    move-result-object v0

    aput-object v0, v11, v10

    new-array v7, v1, [Z

    aput-boolean v10, v7, v10

    sput-boolean v10, Lb/a/d/a/c;->F:Z

    new-array v12, v1, [Ljava/lang/Runnable;

    new-instance v13, Lb/a/d/a/c$r;

    move-object v0, v13

    move-object/from16 v1, p0

    move-object v2, v7

    move-object/from16 v3, p1

    move-object v4, v11

    move-object/from16 v5, p0

    move-object v6, v12

    invoke-direct/range {v0 .. v6}, Lb/a/d/a/c$r;-><init>(Lb/a/d/a/c;[ZLjava/lang/String;[Lb/a/d/a/d;Lb/a/d/a/c;[Ljava/lang/Runnable;)V

    new-instance v6, Lb/a/d/a/c$s;

    invoke-direct {v6, v9, v7, v12, v11}, Lb/a/d/a/c$s;-><init>(Lb/a/d/a/c;[Z[Ljava/lang/Runnable;[Lb/a/d/a/d;)V

    new-instance v14, Lb/a/d/a/c$t;

    move-object v0, v14

    move-object v2, v11

    move-object v3, v6

    move-object/from16 v4, p1

    invoke-direct/range {v0 .. v5}, Lb/a/d/a/c$t;-><init>(Lb/a/d/a/c;[Lb/a/d/a/d;Lb/a/c/a$a;Ljava/lang/String;Lb/a/d/a/c;)V

    new-instance v15, Lb/a/d/a/c$a;

    invoke-direct {v15, v9, v14}, Lb/a/d/a/c$a;-><init>(Lb/a/d/a/c;Lb/a/c/a$a;)V

    new-instance v8, Lb/a/d/a/c$b;

    invoke-direct {v8, v9, v14}, Lb/a/d/a/c$b;-><init>(Lb/a/d/a/c;Lb/a/c/a$a;)V

    new-instance v7, Lb/a/d/a/c$c;

    invoke-direct {v7, v9, v11, v6}, Lb/a/d/a/c$c;-><init>(Lb/a/d/a/c;[Lb/a/d/a/d;Lb/a/c/a$a;)V

    new-instance v16, Lb/a/d/a/c$d;

    move-object/from16 v0, v16

    move-object v3, v13

    move-object v4, v14

    move-object v5, v15

    move-object/from16 v6, p0

    move-object/from16 p1, v7

    move-object v7, v8

    move-object/from16 v17, v8

    move-object/from16 v8, p1

    invoke-direct/range {v0 .. v8}, Lb/a/d/a/c$d;-><init>(Lb/a/d/a/c;[Lb/a/d/a/d;Lb/a/c/a$a;Lb/a/c/a$a;Lb/a/c/a$a;Lb/a/d/a/c;Lb/a/c/a$a;Lb/a/c/a$a;)V

    aput-object v16, v12, v10

    aget-object v0, v11, v10

    const-string v1, "open"

    invoke-virtual {v0, v1, v13}, Lb/a/c/a;->f(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    aget-object v0, v11, v10

    const-string v1, "error"

    invoke-virtual {v0, v1, v14}, Lb/a/c/a;->f(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    aget-object v0, v11, v10

    const-string v1, "close"

    invoke-virtual {v0, v1, v15}, Lb/a/c/a;->f(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    move-object/from16 v0, v17

    invoke-virtual {v9, v1, v0}, Lb/a/c/a;->f(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    const-string v0, "upgrading"

    move-object/from16 v1, p1

    invoke-virtual {v9, v0, v1}, Lb/a/c/a;->f(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    aget-object v0, v11, v10

    invoke-virtual {v0}, Lb/a/d/a/d;->q()Lb/a/d/a/d;

    return-void
.end method

.method private W(Lb/a/d/b/b;Ljava/lang/Runnable;)V
    .locals 2

    sget-object v0, Lb/a/d/a/c$v;->c:Lb/a/d/a/c$v;

    iget-object v1, p0, Lb/a/d/a/c;->B:Lb/a/d/a/c$v;

    if-eq v0, v1, :cond_2

    sget-object v0, Lb/a/d/a/c$v;->d:Lb/a/d/a/c$v;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "packetCreate"

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    iget-object v0, p0, Lb/a/d/a/c;->s:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    if-eqz p2, :cond_1

    new-instance p1, Lb/a/d/a/c$j;

    invoke-direct {p1, p0, p2}, Lb/a/d/a/c$j;-><init>(Lb/a/d/a/c;Ljava/lang/Runnable;)V

    const-string p2, "flush"

    invoke-virtual {p0, p2, p1}, Lb/a/c/a;->f(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    :cond_1
    invoke-direct {p0}, Lb/a/d/a/c;->G()V

    :cond_2
    :goto_0
    return-void
.end method

.method private X(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1

    new-instance v0, Lb/a/d/b/b;

    invoke-direct {v0, p1}, Lb/a/d/b/b;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lb/a/d/a/c;->W(Lb/a/d/b/b;Ljava/lang/Runnable;)V

    return-void
.end method

.method private Y(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1

    new-instance v0, Lb/a/d/b/b;

    invoke-direct {v0, p1, p2}, Lb/a/d/b/b;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, v0, p3}, Lb/a/d/a/c;->W(Lb/a/d/b/b;Ljava/lang/Runnable;)V

    return-void
.end method

.method private Z(Ljava/lang/String;[BLjava/lang/Runnable;)V
    .locals 1

    new-instance v0, Lb/a/d/b/b;

    invoke-direct {v0, p1, p2}, Lb/a/d/b/b;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, v0, p3}, Lb/a/d/a/c;->W(Lb/a/d/b/b;Ljava/lang/Runnable;)V

    return-void
.end method

.method private a0()V
    .locals 5

    iget-object v0, p0, Lb/a/d/a/c;->v:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_0
    invoke-direct {p0}, Lb/a/d/a/c;->H()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Lb/a/d/a/c$f;

    invoke-direct {v1, p0, p0}, Lb/a/d/a/c$f;-><init>(Lb/a/d/a/c;Lb/a/d/a/c;)V

    iget-wide v2, p0, Lb/a/d/a/c;->j:J

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, v2, v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lb/a/d/a/c;->v:Ljava/util/concurrent/Future;

    return-void
.end method

.method private b0(Lb/a/d/a/d;)V
    .locals 5

    sget-object v0, Lb/a/d/a/c;->E:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    iget-object v3, p1, Lb/a/d/a/d;->c:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "setting transport %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object v2, p0, Lb/a/d/a/c;->t:Lb/a/d/a/d;

    if-eqz v2, :cond_0

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, v2, Lb/a/d/a/d;->c:Ljava/lang/String;

    aput-object v2, v1, v4

    const-string v2, "clearing existing transport %s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object v0, p0, Lb/a/d/a/c;->t:Lb/a/d/a/d;

    invoke-virtual {v0}, Lb/a/c/a;->b()Lb/a/c/a;

    :cond_0
    iput-object p1, p0, Lb/a/d/a/c;->t:Lb/a/d/a/d;

    new-instance v0, Lb/a/d/a/c$q;

    invoke-direct {v0, p0, p0}, Lb/a/d/a/c$q;-><init>(Lb/a/d/a/c;Lb/a/d/a/c;)V

    const-string v1, "drain"

    invoke-virtual {p1, v1, v0}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    new-instance v0, Lb/a/d/a/c$p;

    invoke-direct {v0, p0, p0}, Lb/a/d/a/c$p;-><init>(Lb/a/d/a/c;Lb/a/d/a/c;)V

    const-string v1, "packet"

    invoke-virtual {p1, v1, v0}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    new-instance v0, Lb/a/d/a/c$o;

    invoke-direct {v0, p0, p0}, Lb/a/d/a/c$o;-><init>(Lb/a/d/a/c;Lb/a/d/a/c;)V

    const-string v1, "error"

    invoke-virtual {p1, v1, v0}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    new-instance v0, Lb/a/d/a/c$n;

    invoke-direct {v0, p0, p0}, Lb/a/d/a/c$n;-><init>(Lb/a/d/a/c;Lb/a/d/a/c;)V

    const-string v1, "close"

    invoke-virtual {p1, v1, v0}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    return-void
.end method

.method static synthetic h(Lb/a/d/a/c;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lb/a/d/a/c;->O(J)V

    return-void
.end method

.method static synthetic i(Lb/a/d/a/c;Lb/a/d/b/b;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/d/a/c;->Q(Lb/a/d/b/b;)V

    return-void
.end method

.method static synthetic j(Lb/a/d/a/c;)V
    .locals 0

    invoke-direct {p0}, Lb/a/d/a/c;->L()V

    return-void
.end method

.method static synthetic k()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lb/a/d/a/c;->E:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic l(Lb/a/d/a/c;)Z
    .locals 0

    iget-boolean p0, p0, Lb/a/d/a/c;->e:Z

    return p0
.end method

.method static synthetic m(Lb/a/d/a/c;Z)Z
    .locals 0

    iput-boolean p1, p0, Lb/a/d/a/c;->e:Z

    return p1
.end method

.method static synthetic n(Lb/a/d/a/c;)V
    .locals 0

    invoke-direct {p0}, Lb/a/d/a/c;->G()V

    return-void
.end method

.method static synthetic o(Lb/a/d/a/c;)J
    .locals 2

    iget-wide v0, p0, Lb/a/d/a/c;->k:J

    return-wide v0
.end method

.method static synthetic p(Lb/a/d/a/c;)V
    .locals 0

    invoke-direct {p0}, Lb/a/d/a/c;->S()V

    return-void
.end method

.method static synthetic q(Lb/a/d/a/c;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lb/a/d/a/c;->X(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic r(Lb/a/d/a/c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lb/a/d/a/c;->Y(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic s(Lb/a/d/a/c;Ljava/lang/String;[BLjava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lb/a/d/a/c;->Z(Ljava/lang/String;[BLjava/lang/Runnable;)V

    return-void
.end method

.method static synthetic t(Lb/a/d/a/c;)Z
    .locals 0

    iget-boolean p0, p0, Lb/a/d/a/c;->f:Z

    return p0
.end method

.method static synthetic u()Z
    .locals 1

    sget-boolean v0, Lb/a/d/a/c;->F:Z

    return v0
.end method

.method static synthetic v(Z)Z
    .locals 0

    sput-boolean p0, Lb/a/d/a/c;->F:Z

    return p0
.end method

.method static synthetic w(Lb/a/d/a/c;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lb/a/d/a/c;->p:Ljava/util/List;

    return-object p0
.end method

.method static synthetic x(Lb/a/d/a/c;)Lb/a/d/a/c$v;
    .locals 0

    iget-object p0, p0, Lb/a/d/a/c;->B:Lb/a/d/a/c$v;

    return-object p0
.end method

.method static synthetic y(Lb/a/d/a/c;Lb/a/d/a/c$v;)Lb/a/d/a/c$v;
    .locals 0

    iput-object p1, p0, Lb/a/d/a/c;->B:Lb/a/d/a/c$v;

    return-object p1
.end method

.method static synthetic z(Lb/a/d/a/c;Ljava/lang/String;)Lb/a/d/a/d;
    .locals 0

    invoke-direct {p0, p1}, Lb/a/d/a/c;->E(Ljava/lang/String;)Lb/a/d/a/d;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public D()Lb/a/d/a/c;
    .locals 1

    new-instance v0, Lb/a/d/a/c$m;

    invoke-direct {v0, p0}, Lb/a/d/a/c$m;-><init>(Lb/a/d/a/c;)V

    invoke-static {v0}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-object p0
.end method

.method F(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lb/a/d/a/c;->p:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public I()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lb/a/d/a/c;->l:Ljava/lang/String;

    return-object v0
.end method

.method public R()Lb/a/d/a/c;
    .locals 1

    new-instance v0, Lb/a/d/a/c$l;

    invoke-direct {v0, p0}, Lb/a/d/a/c$l;-><init>(Lb/a/d/a/c;)V

    invoke-static {v0}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-object p0
.end method

.method public U(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1

    new-instance v0, Lb/a/d/a/c$h;

    invoke-direct {v0, p0, p1, p2}, Lb/a/d/a/c$h;-><init>(Lb/a/d/a/c;Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-static {v0}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-void
.end method

.method public V([BLjava/lang/Runnable;)V
    .locals 1

    new-instance v0, Lb/a/d/a/c$i;

    invoke-direct {v0, p0, p1, p2}, Lb/a/d/a/c$i;-><init>(Lb/a/d/a/c;[BLjava/lang/Runnable;)V

    invoke-static {v0}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-void
.end method

.method public c0(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lb/a/d/a/c;->d0(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method public d0(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lb/a/d/a/c;->U(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method public e0([B)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lb/a/d/a/c;->f0([BLjava/lang/Runnable;)V

    return-void
.end method

.method public f0([BLjava/lang/Runnable;)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lb/a/d/a/c;->V([BLjava/lang/Runnable;)V

    return-void
.end method
