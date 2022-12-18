.class public final Lc/g0/l/a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lc/e0;
.implements Lc/g0/l/c$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/g0/l/a$c;,
        Lc/g0/l/a$d;,
        Lc/g0/l/a$h;,
        Lc/g0/l/a$e;,
        Lc/g0/l/a$f;,
        Lc/g0/l/a$g;
    }
.end annotation


# static fields
.field private static final u:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/w;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Lc/y;

.field final b:Lc/f0;

.field private final c:Ljava/util/Random;

.field private final d:Ljava/lang/String;

.field private e:Lc/e;

.field private final f:Ljava/lang/Runnable;

.field private g:Lc/g0/l/c;

.field private h:Lc/g0/l/d;

.field private i:Ljava/util/concurrent/ScheduledExecutorService;

.field private j:Lc/g0/l/a$h;

.field private final k:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ld/f;",
            ">;"
        }
    .end annotation
.end field

.field private final l:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private m:J

.field private n:Z

.field private o:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field private p:I

.field private q:Ljava/lang/String;

.field private r:Z

.field s:I

.field t:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lc/w;->c:Lc/w;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lc/g0/l/a;->u:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lc/y;Lc/f0;Ljava/util/Random;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lc/g0/l/a;->k:Ljava/util/ArrayDeque;

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lc/g0/l/a;->l:Ljava/util/ArrayDeque;

    const/4 v0, -0x1

    iput v0, p0, Lc/g0/l/a;->p:I

    invoke-virtual {p1}, Lc/y;->f()Ljava/lang/String;

    move-result-object v0

    const-string v1, "GET"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput-object p1, p0, Lc/g0/l/a;->a:Lc/y;

    iput-object p2, p0, Lc/g0/l/a;->b:Lc/f0;

    iput-object p3, p0, Lc/g0/l/a;->c:Ljava/util/Random;

    const/16 p1, 0x10

    new-array p1, p1, [B

    invoke-virtual {p3, p1}, Ljava/util/Random;->nextBytes([B)V

    invoke-static {p1}, Ld/f;->j([B)Ld/f;

    move-result-object p1

    invoke-virtual {p1}, Ld/f;->a()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lc/g0/l/a;->d:Ljava/lang/String;

    new-instance p1, Lc/g0/l/a$a;

    invoke-direct {p1, p0}, Lc/g0/l/a$a;-><init>(Lc/g0/l/a;)V

    iput-object p1, p0, Lc/g0/l/a;->f:Ljava/lang/Runnable;

    return-void

    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Request must be GET: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lc/y;->f()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method static synthetic j(Lc/g0/l/a;)V
    .locals 0

    invoke-direct {p0}, Lc/g0/l/a;->t()V

    return-void
.end method

.method private q()V
    .locals 2

    iget-object v0, p0, Lc/g0/l/a;->i:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lc/g0/l/a;->f:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method private declared-synchronized r(Ld/f;I)Z
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lc/g0/l/a;->r:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lc/g0/l/a;->n:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-wide v2, p0, Lc/g0/l/a;->m:J

    invoke-virtual {p1}, Ld/f;->o()I

    move-result v0

    int-to-long v4, v0

    add-long/2addr v2, v4

    const-wide/32 v4, 0x1000000

    cmp-long v0, v2, v4

    if-lez v0, :cond_1

    const/16 p1, 0x3e9

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lc/g0/l/a;->g(ILjava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v1

    :cond_1
    :try_start_1
    iget-wide v0, p0, Lc/g0/l/a;->m:J

    invoke-virtual {p1}, Ld/f;->o()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lc/g0/l/a;->m:J

    iget-object v0, p0, Lc/g0/l/a;->l:Ljava/util/ArrayDeque;

    new-instance v1, Lc/g0/l/a$f;

    invoke-direct {v1, p2, p1}, Lc/g0/l/a$f;-><init>(ILd/f;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lc/g0/l/a;->q()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 p1, 0x1

    monitor-exit p0

    return p1

    :cond_2
    :goto_0
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private t()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lc/g0/l/a;->r:Z

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    iget-object v0, p0, Lc/g0/l/a;->h:Lc/g0/l/d;

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    sget-object v1, Ld/f;->e:Ld/f;

    invoke-virtual {v0, v1}, Lc/g0/l/d;->e(Ld/f;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lc/g0/l/a;->n(Ljava/lang/Exception;Lc/a0;)V

    :goto_0
    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method


# virtual methods
.method public a()V
    .locals 1

    iget-object v0, p0, Lc/g0/l/a;->e:Lc/e;

    invoke-interface {v0}, Lc/e;->a()V

    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lc/g0/l/a;->b:Lc/f0;

    invoke-virtual {v0, p0, p1}, Lc/f0;->d(Lc/e0;Ljava/lang/String;)V

    return-void
.end method

.method public declared-synchronized c(Ld/f;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iget p1, p0, Lc/g0/l/a;->t:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lc/g0/l/a;->t:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public d(Ld/f;)Z
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lc/g0/l/a;->r(Ld/f;I)Z

    move-result p1

    return p1

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "bytes == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public e(Ljava/lang/String;)Z
    .locals 1

    if-eqz p1, :cond_0

    invoke-static {p1}, Ld/f;->g(Ljava/lang/String;)Ld/f;

    move-result-object p1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lc/g0/l/a;->r(Ld/f;I)Z

    move-result p1

    return p1

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "text == null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public declared-synchronized f(Ld/f;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lc/g0/l/a;->r:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lc/g0/l/a;->n:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lc/g0/l/a;->l:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lc/g0/l/a;->k:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lc/g0/l/a;->q()V

    iget p1, p0, Lc/g0/l/a;->s:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lc/g0/l/a;->s:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public g(ILjava/lang/String;)Z
    .locals 2

    const-wide/32 v0, 0xea60

    invoke-virtual {p0, p1, p2, v0, v1}, Lc/g0/l/a;->l(ILjava/lang/String;J)Z

    move-result p1

    return p1
.end method

.method public h(Ld/f;)V
    .locals 1

    iget-object v0, p0, Lc/g0/l/a;->b:Lc/f0;

    invoke-virtual {v0, p0, p1}, Lc/f0;->e(Lc/e0;Ld/f;)V

    return-void
.end method

.method public i(ILjava/lang/String;)V
    .locals 3

    const/4 v0, -0x1

    if-eq p1, v0, :cond_4

    monitor-enter p0

    :try_start_0
    iget v1, p0, Lc/g0/l/a;->p:I

    if-ne v1, v0, :cond_3

    iput p1, p0, Lc/g0/l/a;->p:I

    iput-object p2, p0, Lc/g0/l/a;->q:Ljava/lang/String;

    iget-boolean v0, p0, Lc/g0/l/a;->n:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lc/g0/l/a;->l:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lc/g0/l/a;->j:Lc/g0/l/a$h;

    iput-object v1, p0, Lc/g0/l/a;->j:Lc/g0/l/a$h;

    iget-object v1, p0, Lc/g0/l/a;->o:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_0

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    :cond_0
    iget-object v1, p0, Lc/g0/l/a;->i:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    move-object v1, v0

    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v0, p0, Lc/g0/l/a;->b:Lc/f0;

    invoke-virtual {v0, p0, p1, p2}, Lc/f0;->b(Lc/e0;ILjava/lang/String;)V

    if-eqz v1, :cond_2

    iget-object v0, p0, Lc/g0/l/a;->b:Lc/f0;

    invoke-virtual {v0, p0, p1, p2}, Lc/f0;->a(Lc/e0;ILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    invoke-static {v1}, Lc/g0/c;->b(Ljava/io/Closeable;)V

    return-void

    :catchall_0
    move-exception p1

    invoke-static {v1}, Lc/g0/c;->b(Ljava/io/Closeable;)V

    throw p1

    :cond_3
    :try_start_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "already closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_1
    move-exception p1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method k(Lc/a0;)V
    .locals 5

    invoke-virtual {p1}, Lc/a0;->I()I

    move-result v0

    const-string v1, "\'"

    const/16 v2, 0x65

    if-ne v0, v2, :cond_3

    const-string v0, "Connection"

    invoke-virtual {p1, v0}, Lc/a0;->K(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "Upgrade"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {p1, v2}, Lc/a0;->K(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "websocket"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v0, "Sec-WebSocket-Accept"

    invoke-virtual {p1, v0}, Lc/a0;->K(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lc/g0/l/a;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ld/f;->g(Ljava/lang/String;)Ld/f;

    move-result-object v0

    invoke-virtual {v0}, Ld/f;->m()Ld/f;

    move-result-object v0

    invoke-virtual {v0}, Ld/f;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-void

    :cond_0
    new-instance v2, Ljava/net/ProtocolException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected \'Sec-WebSocket-Accept\' header value \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\' but was \'"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_1
    new-instance p1, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected \'Upgrade\' header value \'websocket\' but was \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected \'Connection\' header value \'Upgrade\' but was \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected HTTP 101 response but was \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lc/a0;->I()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lc/a0;->N()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method declared-synchronized l(ILjava/lang/String;J)Z
    .locals 6

    monitor-enter p0

    :try_start_0
    invoke-static {p1}, Lc/g0/l/b;->c(I)V

    const/4 v0, 0x0

    if-eqz p2, :cond_1

    invoke-static {p2}, Ld/f;->g(Ljava/lang/String;)Ld/f;

    move-result-object v0

    invoke-virtual {v0}, Ld/f;->o()I

    move-result v1

    int-to-long v1, v1

    const-wide/16 v3, 0x7b

    cmp-long v5, v1, v3

    if-gtz v5, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "reason.size() > 123: "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    iget-boolean p2, p0, Lc/g0/l/a;->r:Z

    if-nez p2, :cond_3

    iget-boolean p2, p0, Lc/g0/l/a;->n:Z

    if-eqz p2, :cond_2

    goto :goto_1

    :cond_2
    const/4 p2, 0x1

    iput-boolean p2, p0, Lc/g0/l/a;->n:Z

    iget-object v1, p0, Lc/g0/l/a;->l:Ljava/util/ArrayDeque;

    new-instance v2, Lc/g0/l/a$e;

    invoke-direct {v2, p1, v0, p3, p4}, Lc/g0/l/a$e;-><init>(ILd/f;J)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lc/g0/l/a;->q()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p2

    :cond_3
    :goto_1
    const/4 p1, 0x0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public m(Lc/v;)V
    .locals 4

    invoke-virtual {p1}, Lc/v;->p()Lc/v$b;

    move-result-object p1

    sget-object v0, Lc/g0/l/a;->u:Ljava/util/List;

    invoke-virtual {p1, v0}, Lc/v$b;->e(Ljava/util/List;)Lc/v$b;

    invoke-virtual {p1}, Lc/v$b;->a()Lc/v;

    move-result-object p1

    invoke-virtual {p1}, Lc/v;->r()I

    move-result v0

    iget-object v1, p0, Lc/g0/l/a;->a:Lc/y;

    invoke-virtual {v1}, Lc/y;->g()Lc/y$a;

    move-result-object v1

    const-string v2, "Upgrade"

    const-string v3, "websocket"

    invoke-virtual {v1, v2, v3}, Lc/y$a;->c(Ljava/lang/String;Ljava/lang/String;)Lc/y$a;

    const-string v3, "Connection"

    invoke-virtual {v1, v3, v2}, Lc/y$a;->c(Ljava/lang/String;Ljava/lang/String;)Lc/y$a;

    iget-object v2, p0, Lc/g0/l/a;->d:Ljava/lang/String;

    const-string v3, "Sec-WebSocket-Key"

    invoke-virtual {v1, v3, v2}, Lc/y$a;->c(Ljava/lang/String;Ljava/lang/String;)Lc/y$a;

    const-string v2, "Sec-WebSocket-Version"

    const-string v3, "13"

    invoke-virtual {v1, v2, v3}, Lc/y$a;->c(Ljava/lang/String;Ljava/lang/String;)Lc/y$a;

    invoke-virtual {v1}, Lc/y$a;->b()Lc/y;

    move-result-object v1

    sget-object v2, Lc/g0/a;->a:Lc/g0/a;

    invoke-virtual {v2, p1, v1}, Lc/g0/a;->f(Lc/v;Lc/y;)Lc/e;

    move-result-object p1

    iput-object p1, p0, Lc/g0/l/a;->e:Lc/e;

    new-instance v2, Lc/g0/l/a$b;

    invoke-direct {v2, p0, v1, v0}, Lc/g0/l/a$b;-><init>(Lc/g0/l/a;Lc/y;I)V

    invoke-interface {p1, v2}, Lc/e;->y(Lc/f;)V

    return-void
.end method

.method n(Ljava/lang/Exception;Lc/a0;)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lc/g0/l/a;->r:Z

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lc/g0/l/a;->r:Z

    iget-object v0, p0, Lc/g0/l/a;->j:Lc/g0/l/a$h;

    const/4 v1, 0x0

    iput-object v1, p0, Lc/g0/l/a;->j:Lc/g0/l/a$h;

    iget-object v1, p0, Lc/g0/l/a;->o:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    :cond_1
    iget-object v1, p0, Lc/g0/l/a;->i:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    :cond_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v1, p0, Lc/g0/l/a;->b:Lc/f0;

    invoke-virtual {v1, p0, p1, p2}, Lc/f0;->c(Lc/e0;Ljava/lang/Throwable;Lc/a0;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v0}, Lc/g0/c;->b(Ljava/io/Closeable;)V

    return-void

    :catchall_0
    move-exception p1

    invoke-static {v0}, Lc/g0/c;->b(Ljava/io/Closeable;)V

    throw p1

    :catchall_1
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1
.end method

.method public o(Ljava/lang/String;JLc/g0/l/a$h;)V
    .locals 11

    monitor-enter p0

    :try_start_0
    iput-object p4, p0, Lc/g0/l/a;->j:Lc/g0/l/a$h;

    new-instance v0, Lc/g0/l/d;

    iget-boolean v1, p4, Lc/g0/l/a$h;->a:Z

    iget-object v2, p4, Lc/g0/l/a$h;->c:Ld/d;

    iget-object v3, p0, Lc/g0/l/a;->c:Ljava/util/Random;

    invoke-direct {v0, v1, v2, v3}, Lc/g0/l/d;-><init>(ZLd/d;Ljava/util/Random;)V

    iput-object v0, p0, Lc/g0/l/a;->h:Lc/g0/l/d;

    new-instance v4, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lc/g0/c;->v(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    move-result-object p1

    invoke-direct {v4, v0, p1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    iput-object v4, p0, Lc/g0/l/a;->i:Ljava/util/concurrent/ScheduledExecutorService;

    const-wide/16 v0, 0x0

    cmp-long p1, p2, v0

    if-eqz p1, :cond_0

    new-instance v5, Lc/g0/l/a$g;

    const/4 p1, 0x0

    invoke-direct {v5, p0, p1}, Lc/g0/l/a$g;-><init>(Lc/g0/l/a;Lc/g0/l/a$a;)V

    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide v6, p2

    move-wide v8, p2

    invoke-interface/range {v4 .. v10}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    :cond_0
    iget-object p1, p0, Lc/g0/l/a;->l:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-direct {p0}, Lc/g0/l/a;->q()V

    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance p1, Lc/g0/l/c;

    iget-boolean p2, p4, Lc/g0/l/a$h;->a:Z

    iget-object p3, p4, Lc/g0/l/a$h;->b:Ld/e;

    invoke-direct {p1, p2, p3, p0}, Lc/g0/l/c;-><init>(ZLd/e;Lc/g0/l/c$a;)V

    iput-object p1, p0, Lc/g0/l/a;->g:Lc/g0/l/c;

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public p()V
    .locals 2

    :goto_0
    iget v0, p0, Lc/g0/l/a;->p:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lc/g0/l/a;->g:Lc/g0/l/c;

    invoke-virtual {v0}, Lc/g0/l/c;->a()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method s()Z
    .locals 12

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lc/g0/l/a;->r:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    iget-object v0, p0, Lc/g0/l/a;->h:Lc/g0/l/d;

    iget-object v2, p0, Lc/g0/l/a;->k:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ld/f;

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-nez v2, :cond_4

    iget-object v5, p0, Lc/g0/l/a;->l:Ljava/util/ArrayDeque;

    invoke-virtual {v5}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v5

    instance-of v6, v5, Lc/g0/l/a$e;

    if-eqz v6, :cond_2

    iget v1, p0, Lc/g0/l/a;->p:I

    iget-object v6, p0, Lc/g0/l/a;->q:Ljava/lang/String;

    if-eq v1, v3, :cond_1

    iget-object v3, p0, Lc/g0/l/a;->j:Lc/g0/l/a$h;

    iput-object v4, p0, Lc/g0/l/a;->j:Lc/g0/l/a$h;

    iget-object v4, p0, Lc/g0/l/a;->i:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v4}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    move-object v4, v5

    move-object v11, v3

    move v3, v1

    move-object v1, v11

    goto :goto_1

    :cond_1
    iget-object v3, p0, Lc/g0/l/a;->i:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v7, Lc/g0/l/a$c;

    invoke-direct {v7, p0}, Lc/g0/l/a$c;-><init>(Lc/g0/l/a;)V

    move-object v8, v5

    check-cast v8, Lc/g0/l/a$e;

    iget-wide v8, v8, Lc/g0/l/a$e;->c:J

    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v7, v8, v9, v10}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v3

    iput-object v3, p0, Lc/g0/l/a;->o:Ljava/util/concurrent/ScheduledFuture;

    move v3, v1

    move-object v1, v4

    goto :goto_0

    :cond_2
    if-nez v5, :cond_3

    monitor-exit p0

    return v1

    :cond_3
    move-object v1, v4

    move-object v6, v1

    :goto_0
    move-object v4, v5

    goto :goto_1

    :cond_4
    move-object v1, v4

    move-object v6, v1

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v2, :cond_5

    :try_start_1
    invoke-virtual {v0, v2}, Lc/g0/l/d;->f(Ld/f;)V

    goto :goto_2

    :cond_5
    instance-of v2, v4, Lc/g0/l/a$f;

    if-eqz v2, :cond_6

    move-object v2, v4

    check-cast v2, Lc/g0/l/a$f;

    iget-object v2, v2, Lc/g0/l/a$f;->b:Ld/f;

    check-cast v4, Lc/g0/l/a$f;

    iget v3, v4, Lc/g0/l/a$f;->a:I

    invoke-virtual {v2}, Ld/f;->o()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v0, v3, v4, v5}, Lc/g0/l/d;->a(IJ)Ld/q;

    move-result-object v0

    invoke-static {v0}, Ld/k;->a(Ld/q;)Ld/d;

    move-result-object v0

    invoke-interface {v0, v2}, Ld/d;->n(Ld/f;)Ld/d;

    invoke-interface {v0}, Ld/q;->close()V

    monitor-enter p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-wide v3, p0, Lc/g0/l/a;->m:J

    invoke-virtual {v2}, Ld/f;->o()I

    move-result v0

    int-to-long v5, v0

    sub-long/2addr v3, v5

    iput-wide v3, p0, Lc/g0/l/a;->m:J

    monitor-exit p0

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0

    :cond_6
    instance-of v2, v4, Lc/g0/l/a$e;

    if-eqz v2, :cond_8

    check-cast v4, Lc/g0/l/a$e;

    iget v2, v4, Lc/g0/l/a$e;->a:I

    iget-object v4, v4, Lc/g0/l/a$e;->b:Ld/f;

    invoke-virtual {v0, v2, v4}, Lc/g0/l/d;->b(ILd/f;)V

    if-eqz v1, :cond_7

    iget-object v0, p0, Lc/g0/l/a;->b:Lc/f0;

    invoke-virtual {v0, p0, v3, v6}, Lc/f0;->a(Lc/e0;ILjava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_7
    :goto_2
    const/4 v0, 0x1

    invoke-static {v1}, Lc/g0/c;->b(Ljava/io/Closeable;)V

    return v0

    :cond_8
    :try_start_4
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v0

    invoke-static {v1}, Lc/g0/c;->b(Ljava/io/Closeable;)V

    throw v0

    :catchall_2
    move-exception v0

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v0
.end method
