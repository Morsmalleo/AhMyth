.class public Lokio/AsyncTimeout;
.super Lokio/Timeout;
.source "AsyncTimeout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokio/AsyncTimeout$Watchdog;
    }
.end annotation


# static fields
.field private static final IDLE_TIMEOUT_MILLIS:J

.field private static final IDLE_TIMEOUT_NANOS:J

.field private static final TIMEOUT_WRITE_SIZE:I = 0x10000

.field private static head:Lokio/AsyncTimeout;


# instance fields
.field private inQueue:Z

.field private next:Lokio/AsyncTimeout;

.field private timeoutAt:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 49
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x3c

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lokio/AsyncTimeout;->IDLE_TIMEOUT_MILLIS:J

    .line 50
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    sput-wide v0, Lokio/AsyncTimeout;->IDLE_TIMEOUT_NANOS:J

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Lokio/Timeout;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lokio/AsyncTimeout;
    .locals 1

    .line 40
    sget-object v0, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    return-object v0
.end method

.method static synthetic access$002(Lokio/AsyncTimeout;)Lokio/AsyncTimeout;
    .locals 0

    .line 40
    sput-object p0, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    return-object p0
.end method

.method static awaitTimeout()Lokio/AsyncTimeout;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 341
    const-class v0, Lokio/AsyncTimeout;

    sget-object v1, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    iget-object v1, v1, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 345
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    .line 346
    sget-wide v5, Lokio/AsyncTimeout;->IDLE_TIMEOUT_MILLIS:J

    invoke-virtual {v0, v5, v6}, Ljava/lang/Object;->wait(J)V

    .line 347
    sget-object v0, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    iget-object v0, v0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sub-long/2addr v0, v3

    sget-wide v3, Lokio/AsyncTimeout;->IDLE_TIMEOUT_NANOS:J

    cmp-long v5, v0, v3

    if-ltz v5, :cond_0

    sget-object v2, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    :cond_0
    return-object v2

    .line 352
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    invoke-direct {v1, v3, v4}, Lokio/AsyncTimeout;->remainingNanos(J)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-lez v7, :cond_2

    const-wide/32 v5, 0xf4240

    .line 358
    div-long v7, v3, v5

    mul-long v5, v5, v7

    sub-long/2addr v3, v5

    long-to-int v1, v3

    .line 360
    invoke-virtual {v0, v7, v8, v1}, Ljava/lang/Object;->wait(JI)V

    return-object v2

    .line 365
    :cond_2
    sget-object v0, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    iget-object v3, v1, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    iput-object v3, v0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 366
    iput-object v2, v1, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    return-object v1
.end method

.method private static declared-synchronized cancelScheduledTimeout(Lokio/AsyncTimeout;)Z
    .locals 3

    const-class v0, Lokio/AsyncTimeout;

    monitor-enter v0

    .line 127
    :try_start_0
    sget-object v1, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    :goto_0
    if-eqz v1, :cond_1

    .line 128
    iget-object v2, v1, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    if-ne v2, p0, :cond_0

    .line 129
    iget-object v2, p0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    iput-object v2, v1, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    const/4 v1, 0x0

    .line 130
    iput-object v1, p0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p0, 0x0

    .line 131
    monitor-exit v0

    return p0

    :cond_0
    move-object v1, v2

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    .line 136
    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    goto :goto_2

    :goto_1
    throw p0

    :goto_2
    goto :goto_1
.end method

.method private remainingNanos(J)J
    .locals 2

    .line 144
    iget-wide v0, p0, Lokio/AsyncTimeout;->timeoutAt:J

    sub-long/2addr v0, p1

    return-wide v0
.end method

.method private static declared-synchronized scheduleTimeout(Lokio/AsyncTimeout;JZ)V
    .locals 6

    const-class v0, Lokio/AsyncTimeout;

    monitor-enter v0

    .line 85
    :try_start_0
    sget-object v1, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    if-nez v1, :cond_0

    .line 86
    new-instance v1, Lokio/AsyncTimeout;

    invoke-direct {v1}, Lokio/AsyncTimeout;-><init>()V

    sput-object v1, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    .line 87
    new-instance v1, Lokio/AsyncTimeout$Watchdog;

    invoke-direct {v1}, Lokio/AsyncTimeout$Watchdog;-><init>()V

    invoke-virtual {v1}, Lokio/AsyncTimeout$Watchdog;->start()V

    .line 90
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v5, p1, v3

    if-eqz v5, :cond_1

    if-eqz p3, :cond_1

    .line 94
    invoke-virtual {p0}, Lokio/AsyncTimeout;->deadlineNanoTime()J

    move-result-wide v3

    sub-long/2addr v3, v1

    invoke-static {p1, p2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    add-long/2addr p1, v1

    iput-wide p1, p0, Lokio/AsyncTimeout;->timeoutAt:J

    goto :goto_0

    :cond_1
    cmp-long v5, p1, v3

    if-eqz v5, :cond_2

    add-long/2addr p1, v1

    .line 96
    iput-wide p1, p0, Lokio/AsyncTimeout;->timeoutAt:J

    goto :goto_0

    :cond_2
    if-eqz p3, :cond_6

    .line 98
    invoke-virtual {p0}, Lokio/AsyncTimeout;->deadlineNanoTime()J

    move-result-wide p1

    iput-wide p1, p0, Lokio/AsyncTimeout;->timeoutAt:J

    .line 104
    :goto_0
    invoke-direct {p0, v1, v2}, Lokio/AsyncTimeout;->remainingNanos(J)J

    move-result-wide p1

    .line 105
    sget-object p3, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    .line 106
    :goto_1
    iget-object v3, p3, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    if-eqz v3, :cond_4

    invoke-direct {v3, v1, v2}, Lokio/AsyncTimeout;->remainingNanos(J)J

    move-result-wide v3

    cmp-long v5, p1, v3

    if-gez v5, :cond_3

    goto :goto_2

    .line 105
    :cond_3
    iget-object p3, p3, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    goto :goto_1

    .line 107
    :cond_4
    :goto_2
    iget-object p1, p3, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    iput-object p1, p0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 108
    iput-object p0, p3, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 109
    sget-object p0, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    if-ne p3, p0, :cond_5

    .line 110
    invoke-virtual {v0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    :cond_5
    monitor-exit v0

    return-void

    .line 100
    :cond_6
    :try_start_1
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p0

    monitor-exit v0

    goto :goto_4

    :goto_3
    throw p0

    :goto_4
    goto :goto_3
.end method


# virtual methods
.method public final enter()V
    .locals 6

    .line 72
    iget-boolean v0, p0, Lokio/AsyncTimeout;->inQueue:Z

    if-nez v0, :cond_1

    .line 73
    invoke-virtual {p0}, Lokio/AsyncTimeout;->timeoutNanos()J

    move-result-wide v0

    .line 74
    invoke-virtual {p0}, Lokio/AsyncTimeout;->hasDeadline()Z

    move-result v2

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    if-nez v2, :cond_0

    return-void

    :cond_0
    const/4 v3, 0x1

    .line 78
    iput-boolean v3, p0, Lokio/AsyncTimeout;->inQueue:Z

    .line 79
    invoke-static {p0, v0, v1, v2}, Lokio/AsyncTimeout;->scheduleTimeout(Lokio/AsyncTimeout;JZ)V

    return-void

    .line 72
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unbalanced enter/exit"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final exit(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 283
    invoke-virtual {p0}, Lokio/AsyncTimeout;->exit()Z

    move-result v0

    if-nez v0, :cond_0

    return-object p1

    .line 284
    :cond_0
    invoke-virtual {p0, p1}, Lokio/AsyncTimeout;->newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    return-object p1
.end method

.method final exit(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 273
    invoke-virtual {p0}, Lokio/AsyncTimeout;->exit()Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 274
    invoke-virtual {p0, p1}, Lokio/AsyncTimeout;->newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    throw p1

    :cond_1
    :goto_0
    return-void
.end method

.method public final exit()Z
    .locals 2

    .line 119
    iget-boolean v0, p0, Lokio/AsyncTimeout;->inQueue:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 120
    :cond_0
    iput-boolean v1, p0, Lokio/AsyncTimeout;->inQueue:Z

    .line 121
    invoke-static {p0}, Lokio/AsyncTimeout;->cancelScheduledTimeout(Lokio/AsyncTimeout;)Z

    move-result v0

    return v0
.end method

.method protected newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 2

    .line 293
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "timeout"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 295
    invoke-virtual {v0, p1}, Ljava/io/InterruptedIOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    :cond_0
    return-object v0
.end method

.method public final sink(Lokio/Sink;)Lokio/Sink;
    .locals 1

    .line 159
    new-instance v0, Lokio/AsyncTimeout$1;

    invoke-direct {v0, p0, p1}, Lokio/AsyncTimeout$1;-><init>(Lokio/AsyncTimeout;Lokio/Sink;)V

    return-object v0
.end method

.method public final source(Lokio/Source;)Lokio/Source;
    .locals 1

    .line 231
    new-instance v0, Lokio/AsyncTimeout$2;

    invoke-direct {v0, p0, p1}, Lokio/AsyncTimeout$2;-><init>(Lokio/AsyncTimeout;Lokio/Source;)V

    return-object v0
.end method

.method protected timedOut()V
    .locals 0

    return-void
.end method
