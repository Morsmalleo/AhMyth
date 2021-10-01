.class final Lokio/AsyncTimeout$Watchdog;
.super Ljava/lang/Thread;
.source "AsyncTimeout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokio/AsyncTimeout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Watchdog"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    .line 303
    const-string v0, "Okio Watchdog"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 304
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lokio/AsyncTimeout$Watchdog;->setDaemon(Z)V

    .line 305
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 311
    :goto_0
    :try_start_0
    const-class v0, Lokio/AsyncTimeout;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 312
    :try_start_1
    invoke-static {}, Lokio/AsyncTimeout;->awaitTimeout()Lokio/AsyncTimeout;

    move-result-object v1

    .line 315
    .local v1, "timedOut":Lokio/AsyncTimeout;
    if-nez v1, :cond_0

    monitor-exit v0

    goto :goto_0

    .line 319
    :cond_0
    sget-object v2, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    if-ne v1, v2, :cond_1

    .line 320
    const/4 v2, 0x0

    sput-object v2, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    .line 321
    monitor-exit v0

    return-void

    .line 323
    :cond_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 326
    :try_start_2
    invoke-virtual {v1}, Lokio/AsyncTimeout;->timedOut()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .end local v1    # "timedOut":Lokio/AsyncTimeout;
    goto :goto_1

    .line 323
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v1
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0

    .line 327
    :catch_0
    move-exception v0

    .line 328
    :goto_1
    goto :goto_0
.end method
