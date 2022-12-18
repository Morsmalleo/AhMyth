.class public Lb/a/i/a;
.super Ljava/lang/Thread;
.source ""


# static fields
.field private static final a:Ljava/util/logging/Logger;

.field private static final b:Ljava/util/concurrent/ThreadFactory;

.field private static c:Lb/a/i/a;

.field private static d:Ljava/util/concurrent/ExecutorService;

.field private static e:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lb/a/i/a;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lb/a/i/a;->a:Ljava/util/logging/Logger;

    new-instance v0, Lb/a/i/a$a;

    invoke-direct {v0}, Lb/a/i/a$a;-><init>()V

    sput-object v0, Lb/a/i/a;->b:Ljava/util/concurrent/ThreadFactory;

    const/4 v0, 0x0

    sput v0, Lb/a/i/a;->e:I

    return-void
.end method

.method private constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Runnable;Lb/a/i/a$a;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/i/a;-><init>(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic a()Lb/a/i/a;
    .locals 1

    sget-object v0, Lb/a/i/a;->c:Lb/a/i/a;

    return-object v0
.end method

.method static synthetic b(Lb/a/i/a;)Lb/a/i/a;
    .locals 0

    sput-object p0, Lb/a/i/a;->c:Lb/a/i/a;

    return-object p0
.end method

.method static synthetic c()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lb/a/i/a;->a:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic d()I
    .locals 1

    sget v0, Lb/a/i/a;->e:I

    return v0
.end method

.method static synthetic e()I
    .locals 2

    sget v0, Lb/a/i/a;->e:I

    add-int/lit8 v1, v0, -0x1

    sput v1, Lb/a/i/a;->e:I

    return v0
.end method

.method static synthetic f()Ljava/util/concurrent/ExecutorService;
    .locals 1

    sget-object v0, Lb/a/i/a;->d:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic g(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/ExecutorService;
    .locals 0

    sput-object p0, Lb/a/i/a;->d:Ljava/util/concurrent/ExecutorService;

    return-object p0
.end method

.method public static h(Ljava/lang/Runnable;)V
    .locals 1

    invoke-static {}, Lb/a/i/a;->i()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lb/a/i/a;->j(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method public static i()Z
    .locals 2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    sget-object v1, Lb/a/i/a;->c:Lb/a/i/a;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static j(Ljava/lang/Runnable;)V
    .locals 2

    const-class v0, Lb/a/i/a;

    monitor-enter v0

    :try_start_0
    sget v1, Lb/a/i/a;->e:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Lb/a/i/a;->e:I

    sget-object v1, Lb/a/i/a;->d:Ljava/util/concurrent/ExecutorService;

    if-nez v1, :cond_0

    sget-object v1, Lb/a/i/a;->b:Ljava/util/concurrent/ThreadFactory;

    invoke-static {v1}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    sput-object v1, Lb/a/i/a;->d:Ljava/util/concurrent/ExecutorService;

    :cond_0
    sget-object v1, Lb/a/i/a;->d:Ljava/util/concurrent/ExecutorService;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v0, Lb/a/i/a$b;

    invoke-direct {v0, p0}, Lb/a/i/a$b;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method
