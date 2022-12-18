.class final Lb/a/i/a$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/i/a;->j(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    iput-object p1, p0, Lb/a/i/a$b;->a:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lb/a/i/a$b;->a:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const-class v1, Lb/a/i/a;

    monitor-enter v1

    :try_start_1
    invoke-static {}, Lb/a/i/a;->e()I

    invoke-static {}, Lb/a/i/a;->d()I

    move-result v2

    if-nez v2, :cond_0

    invoke-static {}, Lb/a/i/a;->f()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-static {v0}, Lb/a/i/a;->g(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/ExecutorService;

    invoke-static {v0}, Lb/a/i/a;->b(Lb/a/i/a;)Lb/a/i/a;

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_1
    move-exception v1

    :try_start_2
    invoke-static {}, Lb/a/i/a;->c()Ljava/util/logging/Logger;

    move-result-object v2

    sget-object v3, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string v4, "Task threw exception"

    invoke-virtual {v2, v3, v4, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :catchall_2
    move-exception v1

    const-class v2, Lb/a/i/a;

    monitor-enter v2

    :try_start_3
    invoke-static {}, Lb/a/i/a;->e()I

    invoke-static {}, Lb/a/i/a;->d()I

    move-result v3

    if-nez v3, :cond_1

    invoke-static {}, Lb/a/i/a;->f()Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-static {v0}, Lb/a/i/a;->g(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/ExecutorService;

    invoke-static {v0}, Lb/a/i/a;->b(Lb/a/i/a;)Lb/a/i/a;

    :cond_1
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    throw v1

    :catchall_3
    move-exception v0

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    throw v0
.end method
