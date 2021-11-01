.class public Lio/socket/client/Socket;
.super Lio/socket/emitter/Emitter;
.source "Socket.java"


# static fields
.field public static final EVENT_CONNECT:Ljava/lang/String; = "connect"

.field public static final EVENT_CONNECTING:Ljava/lang/String; = "connecting"

.field public static final EVENT_CONNECT_ERROR:Ljava/lang/String; = "connect_error"

.field public static final EVENT_CONNECT_TIMEOUT:Ljava/lang/String; = "connect_timeout"

.field public static final EVENT_DISCONNECT:Ljava/lang/String; = "disconnect"

.field public static final EVENT_ERROR:Ljava/lang/String; = "error"

.field public static final EVENT_MESSAGE:Ljava/lang/String; = "message"

.field public static final EVENT_PING:Ljava/lang/String; = "ping"

.field public static final EVENT_PONG:Ljava/lang/String; = "pong"

.field public static final EVENT_RECONNECT:Ljava/lang/String; = "reconnect"

.field public static final EVENT_RECONNECTING:Ljava/lang/String; = "reconnecting"

.field public static final EVENT_RECONNECT_ATTEMPT:Ljava/lang/String; = "reconnect_attempt"

.field public static final EVENT_RECONNECT_ERROR:Ljava/lang/String; = "reconnect_error"

.field public static final EVENT_RECONNECT_FAILED:Ljava/lang/String; = "reconnect_failed"

.field protected static events:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private acks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lio/socket/client/Ack;",
            ">;"
        }
    .end annotation
.end field

.field private volatile connected:Z

.field id:Ljava/lang/String;

.field private ids:I

.field private io:Lio/socket/client/Manager;

.field private nsp:Ljava/lang/String;

.field private final receiveBuffer:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private final sendBuffer:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lio/socket/parser/Packet<",
            "Lorg/json/JSONArray;",
            ">;>;"
        }
    .end annotation
.end field

.field private subs:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lio/socket/client/On$Handle;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    const-class v0, Lio/socket/client/Socket;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/client/Socket;->logger:Ljava/util/logging/Logger;

    .line 65
    new-instance v0, Lio/socket/client/Socket$1;

    invoke-direct {v0}, Lio/socket/client/Socket$1;-><init>()V

    sput-object v0, Lio/socket/client/Socket;->events:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Lio/socket/client/Manager;Ljava/lang/String;)V
    .locals 1

    .line 92
    invoke-direct {p0}, Lio/socket/emitter/Emitter;-><init>()V

    .line 87
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/socket/client/Socket;->acks:Ljava/util/Map;

    .line 89
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lio/socket/client/Socket;->receiveBuffer:Ljava/util/Queue;

    .line 90
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lio/socket/client/Socket;->sendBuffer:Ljava/util/Queue;

    .line 93
    iput-object p1, p0, Lio/socket/client/Socket;->io:Lio/socket/client/Manager;

    .line 94
    iput-object p2, p0, Lio/socket/client/Socket;->nsp:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lio/socket/client/Socket;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lio/socket/client/Socket;->onopen()V

    return-void
.end method

.method static synthetic access$100(Lio/socket/client/Socket;Lio/socket/parser/Packet;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lio/socket/client/Socket;->onpacket(Lio/socket/parser/Packet;)V

    return-void
.end method

.method static synthetic access$1000(Lorg/json/JSONArray;I)Lorg/json/JSONArray;
    .locals 0

    .line 19
    invoke-static {p0, p1}, Lio/socket/client/Socket;->remove(Lorg/json/JSONArray;I)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1100(Lio/socket/client/Socket;Lio/socket/parser/Packet;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lio/socket/client/Socket;->packet(Lio/socket/parser/Packet;)V

    return-void
.end method

.method static synthetic access$1200(Lio/socket/client/Socket;)Ljava/util/Queue;
    .locals 0

    .line 19
    iget-object p0, p0, Lio/socket/client/Socket;->sendBuffer:Ljava/util/Queue;

    return-object p0
.end method

.method static synthetic access$1300(Lio/socket/client/Socket;)Ljava/lang/String;
    .locals 0

    .line 19
    iget-object p0, p0, Lio/socket/client/Socket;->nsp:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1400(Lio/socket/client/Socket;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lio/socket/client/Socket;->destroy()V

    return-void
.end method

.method static synthetic access$200(Lio/socket/client/Socket;Ljava/lang/String;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lio/socket/client/Socket;->onclose(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lio/socket/client/Socket;)Z
    .locals 0

    .line 19
    iget-boolean p0, p0, Lio/socket/client/Socket;->connected:Z

    return p0
.end method

.method static synthetic access$400(Lio/socket/client/Socket;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lio/socket/client/Socket;->subEvents()V

    return-void
.end method

.method static synthetic access$500(Lio/socket/client/Socket;)Lio/socket/client/Manager;
    .locals 0

    .line 19
    iget-object p0, p0, Lio/socket/client/Socket;->io:Lio/socket/client/Manager;

    return-object p0
.end method

.method static synthetic access$601(Lio/socket/client/Socket;Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;
    .locals 0

    .line 19
    invoke-super {p0, p1, p2}, Lio/socket/emitter/Emitter;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Lio/socket/client/Socket;)I
    .locals 0

    .line 19
    iget p0, p0, Lio/socket/client/Socket;->ids:I

    return p0
.end method

.method static synthetic access$708(Lio/socket/client/Socket;)I
    .locals 2

    .line 19
    iget v0, p0, Lio/socket/client/Socket;->ids:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lio/socket/client/Socket;->ids:I

    return v0
.end method

.method static synthetic access$800()Ljava/util/logging/Logger;
    .locals 1

    .line 19
    sget-object v0, Lio/socket/client/Socket;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic access$900(Lio/socket/client/Socket;)Ljava/util/Map;
    .locals 0

    .line 19
    iget-object p0, p0, Lio/socket/client/Socket;->acks:Ljava/util/Map;

    return-object p0
.end method

.method private ack(I)Lio/socket/client/Ack;
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Z

    const/4 v1, 0x0

    aput-boolean v1, v0, v1

    .line 349
    new-instance v1, Lio/socket/client/Socket$7;

    invoke-direct {v1, p0, v0, p1, p0}, Lio/socket/client/Socket$7;-><init>(Lio/socket/client/Socket;[ZILio/socket/client/Socket;)V

    return-object v1
.end method

.method private destroy()V
    .locals 2

    .line 413
    iget-object v0, p0, Lio/socket/client/Socket;->subs:Ljava/util/Queue;

    if-eqz v0, :cond_1

    .line 415
    invoke-interface {v0}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/socket/client/On$Handle;

    .line 416
    invoke-interface {v1}, Lio/socket/client/On$Handle;->destroy()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 418
    iput-object v0, p0, Lio/socket/client/Socket;->subs:Ljava/util/Queue;

    .line 421
    :cond_1
    iget-object v0, p0, Lio/socket/client/Socket;->io:Lio/socket/client/Manager;

    invoke-virtual {v0, p0}, Lio/socket/client/Manager;->destroy(Lio/socket/client/Socket;)V

    return-void
.end method

.method private emitBuffered()V
    .locals 2

    .line 393
    :goto_0
    iget-object v0, p0, Lio/socket/client/Socket;->receiveBuffer:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 394
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 395
    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-super {p0, v1, v0}, Lio/socket/emitter/Emitter;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 397
    :cond_0
    iget-object v0, p0, Lio/socket/client/Socket;->receiveBuffer:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 400
    :goto_1
    iget-object v0, p0, Lio/socket/client/Socket;->sendBuffer:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/parser/Packet;

    if-eqz v0, :cond_1

    .line 401
    invoke-direct {p0, v0}, Lio/socket/client/Socket;->packet(Lio/socket/parser/Packet;)V

    goto :goto_1

    .line 403
    :cond_1
    iget-object v0, p0, Lio/socket/client/Socket;->sendBuffer:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    return-void
.end method

.method private onack(Lio/socket/parser/Packet;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/socket/parser/Packet<",
            "Lorg/json/JSONArray;",
            ">;)V"
        }
    .end annotation

    .line 376
    iget-object v0, p0, Lio/socket/client/Socket;->acks:Ljava/util/Map;

    iget v1, p1, Lio/socket/parser/Packet;->id:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/client/Ack;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 378
    sget-object v3, Lio/socket/client/Socket;->logger:Ljava/util/logging/Logger;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget v5, p1, Lio/socket/parser/Packet;->id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    iget-object v1, p1, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    aput-object v1, v4, v2

    const-string v1, "calling ack %s with %s"

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 379
    iget-object p1, p1, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    check-cast p1, Lorg/json/JSONArray;

    invoke-static {p1}, Lio/socket/client/Socket;->toArray(Lorg/json/JSONArray;)[Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lio/socket/client/Ack;->call([Ljava/lang/Object;)V

    goto :goto_0

    .line 381
    :cond_0
    sget-object v0, Lio/socket/client/Socket;->logger:Ljava/util/logging/Logger;

    new-array v2, v2, [Ljava/lang/Object;

    iget p1, p1, Lio/socket/parser/Packet;->id:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v1

    const-string p1, "bad ack %s"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private onclose(Ljava/lang/String;)V
    .locals 5

    .line 276
    sget-object v0, Lio/socket/client/Socket;->logger:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "close (%s)"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 277
    iput-boolean v3, p0, Lio/socket/client/Socket;->connected:Z

    const/4 v0, 0x0

    .line 278
    iput-object v0, p0, Lio/socket/client/Socket;->id:Ljava/lang/String;

    new-array v0, v1, [Ljava/lang/Object;

    aput-object p1, v0, v3

    const-string p1, "disconnect"

    .line 279
    invoke-virtual {p0, p1, v0}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    return-void
.end method

.method private onconnect()V
    .locals 2

    const/4 v0, 0x1

    .line 386
    iput-boolean v0, p0, Lio/socket/client/Socket;->connected:Z

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "connect"

    .line 387
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 388
    invoke-direct {p0}, Lio/socket/client/Socket;->emitBuffered()V

    return-void
.end method

.method private ondisconnect()V
    .locals 4

    .line 407
    sget-object v0, Lio/socket/client/Socket;->logger:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lio/socket/client/Socket;->nsp:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "server disconnect (%s)"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 408
    invoke-direct {p0}, Lio/socket/client/Socket;->destroy()V

    const-string v0, "io server disconnect"

    .line 409
    invoke-direct {p0, v0}, Lio/socket/client/Socket;->onclose(Ljava/lang/String;)V

    return-void
.end method

.method private onevent(Lio/socket/parser/Packet;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/socket/parser/Packet<",
            "Lorg/json/JSONArray;",
            ">;)V"
        }
    .end annotation

    .line 329
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    check-cast v1, Lorg/json/JSONArray;

    invoke-static {v1}, Lio/socket/client/Socket;->toArray(Lorg/json/JSONArray;)[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 330
    sget-object v1, Lio/socket/client/Socket;->logger:Ljava/util/logging/Logger;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const-string v4, "emitting event %s"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 332
    iget v2, p1, Lio/socket/parser/Packet;->id:I

    if-ltz v2, :cond_0

    const-string v2, "attaching ack callback to event"

    .line 333
    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 334
    iget p1, p1, Lio/socket/parser/Packet;->id:I

    invoke-direct {p0, p1}, Lio/socket/client/Socket;->ack(I)Lio/socket/client/Ack;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 337
    :cond_0
    iget-boolean p1, p0, Lio/socket/client/Socket;->connected:Z

    if-eqz p1, :cond_2

    .line 338
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    .line 339
    :cond_1
    invoke-interface {v0, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 340
    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-super {p0, p1, v0}, Lio/socket/emitter/Emitter;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 342
    :cond_2
    iget-object p1, p0, Lio/socket/client/Socket;->receiveBuffer:Ljava/util/Queue;

    invoke-interface {p1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method

.method private onopen()V
    .locals 2

    .line 268
    sget-object v0, Lio/socket/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v1, "transport is open - connecting"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 270
    iget-object v0, p0, Lio/socket/client/Socket;->nsp:Ljava/lang/String;

    const-string v1, "/"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 271
    new-instance v0, Lio/socket/parser/Packet;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/socket/parser/Packet;-><init>(I)V

    invoke-direct {p0, v0}, Lio/socket/client/Socket;->packet(Lio/socket/parser/Packet;)V

    :cond_0
    return-void
.end method

.method private onpacket(Lio/socket/parser/Packet;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/socket/parser/Packet<",
            "*>;)V"
        }
    .end annotation

    .line 283
    iget-object v0, p0, Lio/socket/client/Socket;->nsp:Ljava/lang/String;

    iget-object v1, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 285
    :cond_0
    iget v0, p1, Lio/socket/parser/Packet;->type:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 314
    :pswitch_0
    invoke-direct {p0, p1}, Lio/socket/client/Socket;->onack(Lio/socket/parser/Packet;)V

    goto :goto_0

    .line 300
    :pswitch_1
    invoke-direct {p0, p1}, Lio/socket/client/Socket;->onevent(Lio/socket/parser/Packet;)V

    goto :goto_0

    :pswitch_2
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 323
    iget-object p1, p1, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    aput-object p1, v0, v1

    const-string p1, "error"

    invoke-virtual {p0, p1, v0}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 307
    :pswitch_3
    invoke-direct {p0, p1}, Lio/socket/client/Socket;->onack(Lio/socket/parser/Packet;)V

    goto :goto_0

    .line 293
    :pswitch_4
    invoke-direct {p0, p1}, Lio/socket/client/Socket;->onevent(Lio/socket/parser/Packet;)V

    goto :goto_0

    .line 319
    :pswitch_5
    invoke-direct {p0}, Lio/socket/client/Socket;->ondisconnect()V

    goto :goto_0

    .line 287
    :pswitch_6
    invoke-direct {p0}, Lio/socket/client/Socket;->onconnect()V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private packet(Lio/socket/parser/Packet;)V
    .locals 1

    .line 263
    iget-object v0, p0, Lio/socket/client/Socket;->nsp:Ljava/lang/String;

    iput-object v0, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    .line 264
    iget-object v0, p0, Lio/socket/client/Socket;->io:Lio/socket/client/Manager;

    invoke-virtual {v0, p1}, Lio/socket/client/Manager;->packet(Lio/socket/parser/Packet;)V

    return-void
.end method

.method private static remove(Lorg/json/JSONArray;I)Lorg/json/JSONArray;
    .locals 3

    .line 211
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    const/4 v1, 0x0

    .line 212
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    if-eq v1, p1, :cond_0

    .line 216
    :try_start_0
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const/4 v2, 0x0

    .line 220
    :goto_1
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private subEvents()V
    .locals 2

    .line 98
    iget-object v0, p0, Lio/socket/client/Socket;->subs:Ljava/util/Queue;

    if-eqz v0, :cond_0

    return-void

    .line 100
    :cond_0
    iget-object v0, p0, Lio/socket/client/Socket;->io:Lio/socket/client/Manager;

    .line 101
    new-instance v1, Lio/socket/client/Socket$2;

    invoke-direct {v1, p0, v0}, Lio/socket/client/Socket$2;-><init>(Lio/socket/client/Socket;Lio/socket/client/Manager;)V

    iput-object v1, p0, Lio/socket/client/Socket;->subs:Ljava/util/Queue;

    return-void
.end method

.method private static toArray(Lorg/json/JSONArray;)[Ljava/lang/Object;
    .locals 8

    .line 477
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    .line 478
    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    const/4 v3, 0x0

    .line 482
    :try_start_0
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v4

    .line 484
    sget-object v5, Lio/socket/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v6, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v7, "An error occured while retrieving data from JSONArray"

    invoke-virtual {v5, v6, v7, v4}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v4, v3

    .line 487
    :goto_1
    sget-object v5, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v5, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_2

    :cond_0
    move-object v3, v4

    :goto_2
    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method


# virtual methods
.method public close()Lio/socket/client/Socket;
    .locals 1

    .line 430
    new-instance v0, Lio/socket/client/Socket$8;

    invoke-direct {v0, p0}, Lio/socket/client/Socket$8;-><init>(Lio/socket/client/Socket;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-object p0
.end method

.method public connect()Lio/socket/client/Socket;
    .locals 1

    .line 145
    invoke-virtual {p0}, Lio/socket/client/Socket;->open()Lio/socket/client/Socket;

    move-result-object v0

    return-object v0
.end method

.method public connected()Z
    .locals 1

    .line 462
    iget-boolean v0, p0, Lio/socket/client/Socket;->connected:Z

    return v0
.end method

.method public disconnect()Lio/socket/client/Socket;
    .locals 1

    .line 454
    invoke-virtual {p0}, Lio/socket/client/Socket;->close()Lio/socket/client/Socket;

    move-result-object v0

    return-object v0
.end method

.method public varargs emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;
    .locals 1

    .line 173
    new-instance v0, Lio/socket/client/Socket$5;

    invoke-direct {v0, p0, p1, p2}, Lio/socket/client/Socket$5;-><init>(Lio/socket/client/Socket;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-object p0
.end method

.method public emit(Ljava/lang/String;[Ljava/lang/Object;Lio/socket/client/Ack;)Lio/socket/emitter/Emitter;
    .locals 1

    .line 235
    new-instance v0, Lio/socket/client/Socket$6;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/socket/client/Socket$6;-><init>(Lio/socket/client/Socket;Ljava/lang/String;[Ljava/lang/Object;Lio/socket/client/Ack;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-object p0
.end method

.method public id()Ljava/lang/String;
    .locals 1

    .line 473
    iget-object v0, p0, Lio/socket/client/Socket;->id:Ljava/lang/String;

    return-object v0
.end method

.method public io()Lio/socket/client/Manager;
    .locals 1

    .line 458
    iget-object v0, p0, Lio/socket/client/Socket;->io:Lio/socket/client/Manager;

    return-object v0
.end method

.method public open()Lio/socket/client/Socket;
    .locals 1

    .line 127
    new-instance v0, Lio/socket/client/Socket$3;

    invoke-direct {v0, p0}, Lio/socket/client/Socket$3;-><init>(Lio/socket/client/Socket;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-object p0
.end method

.method public varargs send([Ljava/lang/Object;)Lio/socket/client/Socket;
    .locals 1

    .line 155
    new-instance v0, Lio/socket/client/Socket$4;

    invoke-direct {v0, p0, p1}, Lio/socket/client/Socket$4;-><init>(Lio/socket/client/Socket;[Ljava/lang/Object;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-object p0
.end method
