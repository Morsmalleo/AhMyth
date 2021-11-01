.class public abstract Lio/socket/engineio/client/transports/Polling;
.super Lio/socket/engineio/client/Transport;
.source "Polling.java"


# static fields
.field public static final EVENT_POLL:Ljava/lang/String; = "poll"

.field public static final EVENT_POLL_COMPLETE:Ljava/lang/String; = "pollComplete"

.field public static final NAME:Ljava/lang/String; = "polling"

.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private polling:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    const-class v0, Lio/socket/engineio/client/transports/Polling;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/engineio/client/transports/Polling;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lio/socket/engineio/client/Transport$Options;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Transport;-><init>(Lio/socket/engineio/client/Transport$Options;)V

    const-string p1, "polling"

    .line 31
    iput-object p1, p0, Lio/socket/engineio/client/transports/Polling;->name:Ljava/lang/String;

    return-void
.end method

.method private _onData(Ljava/lang/Object;)V
    .locals 5

    .line 111
    sget-object v0, Lio/socket/engineio/client/transports/Polling;->logger:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "polling got data %s"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 112
    new-instance v2, Lio/socket/engineio/client/transports/Polling$2;

    invoke-direct {v2, p0, p0}, Lio/socket/engineio/client/transports/Polling$2;-><init>(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/transports/Polling;)V

    .line 129
    instance-of v4, p1, Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 132
    check-cast p1, Ljava/lang/String;

    invoke-static {p1, v2}, Lio/socket/engineio/parser/Parser;->decodePayload(Ljava/lang/String;Lio/socket/engineio/parser/Parser$DecodePayloadCallback;)V

    goto :goto_0

    .line 133
    :cond_0
    instance-of v4, p1, [B

    if-eqz v4, :cond_1

    .line 134
    check-cast p1, [B

    check-cast p1, [B

    invoke-static {p1, v2}, Lio/socket/engineio/parser/Parser;->decodePayload([BLio/socket/engineio/parser/Parser$DecodePayloadCallback;)V

    .line 137
    :cond_1
    :goto_0
    iget-object p1, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    sget-object v2, Lio/socket/engineio/client/Transport$ReadyState;->CLOSED:Lio/socket/engineio/client/Transport$ReadyState;

    if-eq p1, v2, :cond_3

    .line 138
    iput-boolean v3, p0, Lio/socket/engineio/client/transports/Polling;->polling:Z

    new-array p1, v3, [Ljava/lang/Object;

    const-string v2, "pollComplete"

    .line 139
    invoke-virtual {p0, v2, p1}, Lio/socket/engineio/client/transports/Polling;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 141
    iget-object p1, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    sget-object v2, Lio/socket/engineio/client/Transport$ReadyState;->OPEN:Lio/socket/engineio/client/Transport$ReadyState;

    if-ne p1, v2, :cond_2

    .line 142
    invoke-direct {p0}, Lio/socket/engineio/client/transports/Polling;->poll()V

    goto :goto_1

    :cond_2
    new-array p1, v1, [Ljava/lang/Object;

    .line 144
    iget-object v1, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    aput-object v1, p1, v3

    const-string v1, "ignoring poll - transport state \'%s\'"

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    :cond_3
    :goto_1
    return-void
.end method

.method static synthetic access$002(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/Transport$ReadyState;)Lio/socket/engineio/client/Transport$ReadyState;
    .locals 0

    .line 17
    iput-object p1, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    return-object p1
.end method

.method static synthetic access$100()Ljava/util/logging/Logger;
    .locals 1

    .line 17
    sget-object v0, Lio/socket/engineio/client/transports/Polling;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic access$202(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/Transport$ReadyState;)Lio/socket/engineio/client/Transport$ReadyState;
    .locals 0

    .line 17
    iput-object p1, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    return-object p1
.end method

.method static synthetic access$300(Lio/socket/engineio/client/transports/Polling;)Z
    .locals 0

    .line 17
    iget-boolean p0, p0, Lio/socket/engineio/client/transports/Polling;->polling:Z

    return p0
.end method

.method static synthetic access$400(Lio/socket/engineio/client/transports/Polling;)Lio/socket/engineio/client/Transport$ReadyState;
    .locals 0

    .line 17
    iget-object p0, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    return-object p0
.end method

.method static synthetic access$500(Lio/socket/engineio/client/transports/Polling;)V
    .locals 0

    .line 17
    invoke-virtual {p0}, Lio/socket/engineio/client/transports/Polling;->onOpen()V

    return-void
.end method

.method static synthetic access$600(Lio/socket/engineio/client/transports/Polling;)V
    .locals 0

    .line 17
    invoke-virtual {p0}, Lio/socket/engineio/client/transports/Polling;->onClose()V

    return-void
.end method

.method static synthetic access$700(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/parser/Packet;)V
    .locals 0

    .line 17
    invoke-virtual {p0, p1}, Lio/socket/engineio/client/transports/Polling;->onPacket(Lio/socket/engineio/parser/Packet;)V

    return-void
.end method

.method private poll()V
    .locals 2

    .line 93
    sget-object v0, Lio/socket/engineio/client/transports/Polling;->logger:Ljava/util/logging/Logger;

    const-string v1, "polling"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 94
    iput-boolean v0, p0, Lio/socket/engineio/client/transports/Polling;->polling:Z

    .line 95
    invoke-virtual {p0}, Lio/socket/engineio/client/transports/Polling;->doPoll()V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "poll"

    .line 96
    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/transports/Polling;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    return-void
.end method


# virtual methods
.method protected doClose()V
    .locals 3

    .line 152
    new-instance v0, Lio/socket/engineio/client/transports/Polling$3;

    invoke-direct {v0, p0, p0}, Lio/socket/engineio/client/transports/Polling$3;-><init>(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/transports/Polling;)V

    .line 164
    iget-object v1, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    sget-object v2, Lio/socket/engineio/client/Transport$ReadyState;->OPEN:Lio/socket/engineio/client/Transport$ReadyState;

    if-ne v1, v2, :cond_0

    .line 165
    sget-object v1, Lio/socket/engineio/client/transports/Polling;->logger:Ljava/util/logging/Logger;

    const-string v2, "transport open - closing"

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    .line 166
    invoke-interface {v0, v1}, Lio/socket/emitter/Emitter$Listener;->call([Ljava/lang/Object;)V

    goto :goto_0

    .line 170
    :cond_0
    sget-object v1, Lio/socket/engineio/client/transports/Polling;->logger:Ljava/util/logging/Logger;

    const-string v2, "transport not open - deferring close"

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    const-string v1, "open"

    .line 171
    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/transports/Polling;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    :goto_0
    return-void
.end method

.method protected doOpen()V
    .locals 0

    .line 35
    invoke-direct {p0}, Lio/socket/engineio/client/transports/Polling;->poll()V

    return-void
.end method

.method protected abstract doPoll()V
.end method

.method protected abstract doWrite([BLjava/lang/Runnable;)V
.end method

.method protected onData(Ljava/lang/String;)V
    .locals 0

    .line 101
    invoke-direct {p0, p1}, Lio/socket/engineio/client/transports/Polling;->_onData(Ljava/lang/Object;)V

    return-void
.end method

.method protected onData([B)V
    .locals 0

    .line 106
    invoke-direct {p0, p1}, Lio/socket/engineio/client/transports/Polling;->_onData(Ljava/lang/Object;)V

    return-void
.end method

.method public pause(Ljava/lang/Runnable;)V
    .locals 1

    .line 39
    new-instance v0, Lio/socket/engineio/client/transports/Polling$1;

    invoke-direct {v0, p0, p1}, Lio/socket/engineio/client/transports/Polling$1;-><init>(Lio/socket/engineio/client/transports/Polling;Ljava/lang/Runnable;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected uri()Ljava/lang/String;
    .locals 6

    .line 195
    iget-object v0, p0, Lio/socket/engineio/client/transports/Polling;->query:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 197
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 199
    :cond_0
    iget-boolean v1, p0, Lio/socket/engineio/client/transports/Polling;->secure:Z

    const-string v2, "https"

    const-string v3, "http"

    if-eqz v1, :cond_1

    move-object v1, v2

    goto :goto_0

    :cond_1
    move-object v1, v3

    .line 202
    :goto_0
    iget-boolean v4, p0, Lio/socket/engineio/client/transports/Polling;->timestampRequests:Z

    if-eqz v4, :cond_2

    .line 203
    iget-object v4, p0, Lio/socket/engineio/client/transports/Polling;->timestampParam:Ljava/lang/String;

    invoke-static {}, Lio/socket/yeast/Yeast;->yeast()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    :cond_2
    invoke-static {v0}, Lio/socket/parseqs/ParseQS;->encode(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 208
    iget v4, p0, Lio/socket/engineio/client/transports/Polling;->port:I

    const-string v5, ":"

    if-lez v4, :cond_5

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget v2, p0, Lio/socket/engineio/client/transports/Polling;->port:I

    const/16 v4, 0x1bb

    if-ne v2, v4, :cond_4

    .line 209
    :cond_3
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget v2, p0, Lio/socket/engineio/client/transports/Polling;->port:I

    const/16 v3, 0x50

    if-eq v2, v3, :cond_5

    .line 210
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lio/socket/engineio/client/transports/Polling;->port:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_5
    const-string v2, ""

    .line 213
    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_6

    .line 214
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 217
    :cond_6
    iget-object v3, p0, Lio/socket/engineio/client/transports/Polling;->hostname:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    .line 218
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "://"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz v3, :cond_7

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lio/socket/engineio/client/transports/Polling;->hostname:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    :cond_7
    iget-object v3, p0, Lio/socket/engineio/client/transports/Polling;->hostname:Ljava/lang/String;

    :goto_2
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lio/socket/engineio/client/transports/Polling;->path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected write([Lio/socket/engineio/parser/Packet;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 177
    iput-boolean v0, p0, Lio/socket/engineio/client/transports/Polling;->writable:Z

    .line 178
    new-instance v0, Lio/socket/engineio/client/transports/Polling$4;

    invoke-direct {v0, p0, p0}, Lio/socket/engineio/client/transports/Polling$4;-><init>(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/transports/Polling;)V

    .line 186
    new-instance v1, Lio/socket/engineio/client/transports/Polling$5;

    invoke-direct {v1, p0, p0, v0}, Lio/socket/engineio/client/transports/Polling$5;-><init>(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/transports/Polling;Ljava/lang/Runnable;)V

    invoke-static {p1, v1}, Lio/socket/engineio/parser/Parser;->encodePayload([Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V

    return-void
.end method
