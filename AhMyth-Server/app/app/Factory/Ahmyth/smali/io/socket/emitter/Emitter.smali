.class public Lio/socket/emitter/Emitter;
.super Ljava/lang/Object;
.source "Emitter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/emitter/Emitter$OnceListener;,
        Lio/socket/emitter/Emitter$Listener;
    }
.end annotation


# instance fields
.field private callbacks:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lio/socket/emitter/Emitter$Listener;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lio/socket/emitter/Emitter;->callbacks:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method

.method private static sameAs(Lio/socket/emitter/Emitter$Listener;Lio/socket/emitter/Emitter$Listener;)Z
    .locals 1

    .line 97
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    .line 99
    :cond_0
    instance-of v0, p1, Lio/socket/emitter/Emitter$OnceListener;

    if-eqz v0, :cond_1

    .line 100
    check-cast p1, Lio/socket/emitter/Emitter$OnceListener;

    iget-object p1, p1, Lio/socket/emitter/Emitter$OnceListener;->fn:Lio/socket/emitter/Emitter$Listener;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public varargs emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;
    .locals 1

    .line 114
    iget-object v0, p0, Lio/socket/emitter/Emitter;->callbacks:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    if-eqz p1, :cond_0

    .line 116
    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/emitter/Emitter$Listener;

    .line 117
    invoke-interface {v0, p2}, Lio/socket/emitter/Emitter$Listener;->call([Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public hasListeners(Ljava/lang/String;)Z
    .locals 1

    .line 142
    iget-object v0, p0, Lio/socket/emitter/Emitter;->callbacks:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    if-eqz p1, :cond_0

    .line 143
    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public listeners(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lio/socket/emitter/Emitter$Listener;",
            ">;"
        }
    .end annotation

    .line 130
    iget-object v0, p0, Lio/socket/emitter/Emitter;->callbacks:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 131
    new-instance v0, Ljava/util/ArrayList;

    if-eqz p1, :cond_0

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    :goto_0
    return-object v0
.end method

.method public off()Lio/socket/emitter/Emitter;
    .locals 1

    .line 59
    iget-object v0, p0, Lio/socket/emitter/Emitter;->callbacks:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->clear()V

    return-object p0
.end method

.method public off(Ljava/lang/String;)Lio/socket/emitter/Emitter;
    .locals 1

    .line 70
    iget-object v0, p0, Lio/socket/emitter/Emitter;->callbacks:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public off(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;
    .locals 1

    .line 82
    iget-object v0, p0, Lio/socket/emitter/Emitter;->callbacks:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    if-eqz p1, :cond_1

    .line 84
    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 85
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 86
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/emitter/Emitter$Listener;

    .line 87
    invoke-static {p2, v0}, Lio/socket/emitter/Emitter;->sameAs(Lio/socket/emitter/Emitter$Listener;Lio/socket/emitter/Emitter$Listener;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    :cond_1
    return-object p0
.end method

.method public on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;
    .locals 2

    .line 29
    iget-object v0, p0, Lio/socket/emitter/Emitter;->callbacks:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    if-nez v0, :cond_0

    .line 31
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 32
    iget-object v1, p0, Lio/socket/emitter/Emitter;->callbacks:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    if-eqz p1, :cond_0

    move-object v0, p1

    .line 37
    :cond_0
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;
    .locals 1

    .line 49
    new-instance v0, Lio/socket/emitter/Emitter$OnceListener;

    invoke-direct {v0, p0, p1, p2}, Lio/socket/emitter/Emitter$OnceListener;-><init>(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)V

    invoke-virtual {p0, p1, v0}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    return-object p0
.end method
