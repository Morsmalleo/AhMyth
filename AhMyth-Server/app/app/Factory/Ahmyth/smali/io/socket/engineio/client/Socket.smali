.class public Lio/socket/engineio/client/Socket;
.super Lio/socket/emitter/Emitter;
.source "Socket.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/engineio/client/Socket$Options;,
        Lio/socket/engineio/client/Socket$ReadyState;
    }
.end annotation


# static fields
.field public static final EVENT_CLOSE:Ljava/lang/String; = "close"

.field public static final EVENT_DATA:Ljava/lang/String; = "data"

.field public static final EVENT_DRAIN:Ljava/lang/String; = "drain"

.field public static final EVENT_ERROR:Ljava/lang/String; = "error"

.field public static final EVENT_FLUSH:Ljava/lang/String; = "flush"

.field public static final EVENT_HANDSHAKE:Ljava/lang/String; = "handshake"

.field public static final EVENT_HEARTBEAT:Ljava/lang/String; = "heartbeat"

.field public static final EVENT_MESSAGE:Ljava/lang/String; = "message"

.field public static final EVENT_OPEN:Ljava/lang/String; = "open"

.field public static final EVENT_PACKET:Ljava/lang/String; = "packet"

.field public static final EVENT_PACKET_CREATE:Ljava/lang/String; = "packetCreate"

.field public static final EVENT_PING:Ljava/lang/String; = "ping"

.field public static final EVENT_PONG:Ljava/lang/String; = "pong"

.field public static final EVENT_TRANSPORT:Ljava/lang/String; = "transport"

.field public static final EVENT_UPGRADE:Ljava/lang/String; = "upgrade"

.field public static final EVENT_UPGRADE_ERROR:Ljava/lang/String; = "upgradeError"

.field public static final EVENT_UPGRADING:Ljava/lang/String; = "upgrading"

.field private static final PROBE_ERROR:Ljava/lang/String; = "probe error"

.field public static final PROTOCOL:I = 0x4

.field private static defaultCallFactory:Lokhttp3/Call$Factory;

.field private static defaultOkHttpClient:Lokhttp3/OkHttpClient;

.field private static defaultWebSocketFactory:Lokhttp3/WebSocket$Factory;

.field private static final logger:Ljava/util/logging/Logger;

.field private static priorWebsocketSuccess:Z


# instance fields
.field private callFactory:Lokhttp3/Call$Factory;

.field private final extraHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

.field hostname:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private final onHeartbeatAsListener:Lio/socket/emitter/Emitter$Listener;

.field private path:Ljava/lang/String;

.field private pingInterval:J

.field private pingTimeout:J

.field private pingTimeoutTimer:Ljava/util/concurrent/Future;

.field private policyPort:I

.field port:I

.field private prevBufferLen:I

.field private query:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private readyState:Lio/socket/engineio/client/Socket$ReadyState;

.field private rememberUpgrade:Z

.field private secure:Z

.field private timestampParam:Ljava/lang/String;

.field private timestampRequests:Z

.field transport:Lio/socket/engineio/client/Transport;

.field private transportOptions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/socket/engineio/client/Transport$Options;",
            ">;"
        }
    .end annotation
.end field

.field private transports:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private upgrade:Z

.field private upgrades:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private upgrading:Z

.field private webSocketFactory:Lokhttp3/WebSocket$Factory;

.field writeBuffer:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lio/socket/engineio/parser/Packet;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    const-class v0, Lio/socket/engineio/client/Socket;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    .line 104
    const/4 v0, 0x0

    sput-boolean v0, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 145
    new-instance v0, Lio/socket/engineio/client/Socket$Options;

    invoke-direct {v0}, Lio/socket/engineio/client/Socket$Options;-><init>()V

    invoke-direct {p0, v0}, Lio/socket/engineio/client/Socket;-><init>(Lio/socket/engineio/client/Socket$Options;)V

    .line 146
    return-void
.end method

.method public constructor <init>(Lio/socket/engineio/client/Socket$Options;)V
    .locals 8
    .param p1, "opts"    # Lio/socket/engineio/client/Socket$Options;

    .line 177
    invoke-direct {p0}, Lio/socket/emitter/Emitter;-><init>()V

    .line 128
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    .line 137
    new-instance v0, Lio/socket/engineio/client/Socket$1;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Socket$1;-><init>(Lio/socket/engineio/client/Socket;)V

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->onHeartbeatAsListener:Lio/socket/emitter/Emitter$Listener;

    .line 178
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->host:Ljava/lang/String;

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, -0x1

    if-eqz v0, :cond_3

    .line 179
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->host:Ljava/lang/String;

    .line 180
    .local v0, "hostname":Ljava/lang/String;
    const-string v5, ":"

    invoke-virtual {v0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    array-length v5, v5

    if-le v5, v1, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    .line 181
    .local v5, "ipv6":Z
    :goto_0
    if-eqz v5, :cond_2

    .line 182
    const/16 v6, 0x5b

    invoke-virtual {v0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 183
    .local v6, "start":I
    if-eq v6, v4, :cond_1

    add-int/lit8 v7, v6, 0x1

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 184
    :cond_1
    const/16 v7, 0x5d

    invoke-virtual {v0, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    .line 185
    .local v7, "end":I
    if-eq v7, v4, :cond_2

    invoke-virtual {v0, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 187
    .end local v6    # "start":I
    .end local v7    # "end":I
    :cond_2
    iput-object v0, p1, Lio/socket/engineio/client/Socket$Options;->hostname:Ljava/lang/String;

    .line 190
    .end local v0    # "hostname":Ljava/lang/String;
    .end local v5    # "ipv6":Z
    :cond_3
    iget-boolean v0, p1, Lio/socket/engineio/client/Socket$Options;->secure:Z

    iput-boolean v0, p0, Lio/socket/engineio/client/Socket;->secure:Z

    .line 192
    iget v0, p1, Lio/socket/engineio/client/Socket$Options;->port:I

    if-ne v0, v4, :cond_5

    .line 194
    iget-boolean v0, p0, Lio/socket/engineio/client/Socket;->secure:Z

    if-eqz v0, :cond_4

    const/16 v0, 0x1bb

    goto :goto_1

    :cond_4
    const/16 v0, 0x50

    :goto_1
    iput v0, p1, Lio/socket/engineio/client/Socket$Options;->port:I

    .line 197
    :cond_5
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->hostname:Ljava/lang/String;

    if-eqz v0, :cond_6

    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->hostname:Ljava/lang/String;

    goto :goto_2

    :cond_6
    const-string v0, "localhost"

    :goto_2
    iput-object v0, p0, Lio/socket/engineio/client/Socket;->hostname:Ljava/lang/String;

    .line 198
    iget v0, p1, Lio/socket/engineio/client/Socket$Options;->port:I

    iput v0, p0, Lio/socket/engineio/client/Socket;->port:I

    .line 199
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->query:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->query:Ljava/lang/String;

    .line 200
    invoke-static {v0}, Lio/socket/parseqs/ParseQS;->decode(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    goto :goto_3

    :cond_7
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_3
    iput-object v0, p0, Lio/socket/engineio/client/Socket;->query:Ljava/util/Map;

    .line 201
    iget-boolean v0, p1, Lio/socket/engineio/client/Socket$Options;->upgrade:Z

    iput-boolean v0, p0, Lio/socket/engineio/client/Socket;->upgrade:Z

    .line 202
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->path:Ljava/lang/String;

    if-eqz v4, :cond_8

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->path:Ljava/lang/String;

    goto :goto_4

    :cond_8
    const-string v4, "/engine.io"

    :goto_4
    const-string v5, "/$"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "/"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->path:Ljava/lang/String;

    .line 203
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->timestampParam:Ljava/lang/String;

    if-eqz v0, :cond_9

    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->timestampParam:Ljava/lang/String;

    goto :goto_5

    :cond_9
    const-string v0, "t"

    :goto_5
    iput-object v0, p0, Lio/socket/engineio/client/Socket;->timestampParam:Ljava/lang/String;

    .line 204
    iget-boolean v0, p1, Lio/socket/engineio/client/Socket$Options;->timestampRequests:Z

    iput-boolean v0, p0, Lio/socket/engineio/client/Socket;->timestampRequests:Z

    .line 205
    new-instance v0, Ljava/util/ArrayList;

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->transports:[Ljava/lang/String;

    if-eqz v4, :cond_a

    iget-object v1, p1, Lio/socket/engineio/client/Socket$Options;->transports:[Ljava/lang/String;

    goto :goto_6

    :cond_a
    new-array v1, v1, [Ljava/lang/String;

    const-string v4, "polling"

    aput-object v4, v1, v3

    const-string v3, "websocket"

    aput-object v3, v1, v2

    :goto_6
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->transports:Ljava/util/List;

    .line 207
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->transportOptions:Ljava/util/Map;

    if-eqz v0, :cond_b

    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->transportOptions:Ljava/util/Map;

    goto :goto_7

    :cond_b
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_7
    iput-object v0, p0, Lio/socket/engineio/client/Socket;->transportOptions:Ljava/util/Map;

    .line 209
    iget v0, p1, Lio/socket/engineio/client/Socket$Options;->policyPort:I

    if-eqz v0, :cond_c

    iget v0, p1, Lio/socket/engineio/client/Socket$Options;->policyPort:I

    goto :goto_8

    :cond_c
    const/16 v0, 0x34b

    :goto_8
    iput v0, p0, Lio/socket/engineio/client/Socket;->policyPort:I

    .line 210
    iget-boolean v0, p1, Lio/socket/engineio/client/Socket$Options;->rememberUpgrade:Z

    iput-boolean v0, p0, Lio/socket/engineio/client/Socket;->rememberUpgrade:Z

    .line 211
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->callFactory:Lokhttp3/Call$Factory;

    if-eqz v0, :cond_d

    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->callFactory:Lokhttp3/Call$Factory;

    goto :goto_9

    :cond_d
    sget-object v0, Lio/socket/engineio/client/Socket;->defaultCallFactory:Lokhttp3/Call$Factory;

    :goto_9
    iput-object v0, p0, Lio/socket/engineio/client/Socket;->callFactory:Lokhttp3/Call$Factory;

    .line 212
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    if-eqz v0, :cond_e

    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    goto :goto_a

    :cond_e
    sget-object v0, Lio/socket/engineio/client/Socket;->defaultWebSocketFactory:Lokhttp3/WebSocket$Factory;

    :goto_a
    iput-object v0, p0, Lio/socket/engineio/client/Socket;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    .line 213
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->callFactory:Lokhttp3/Call$Factory;

    if-nez v0, :cond_10

    .line 214
    sget-object v0, Lio/socket/engineio/client/Socket;->defaultOkHttpClient:Lokhttp3/OkHttpClient;

    if-nez v0, :cond_f

    .line 215
    new-instance v0, Lokhttp3/OkHttpClient;

    invoke-direct {v0}, Lokhttp3/OkHttpClient;-><init>()V

    sput-object v0, Lio/socket/engineio/client/Socket;->defaultOkHttpClient:Lokhttp3/OkHttpClient;

    .line 217
    :cond_f
    sget-object v0, Lio/socket/engineio/client/Socket;->defaultOkHttpClient:Lokhttp3/OkHttpClient;

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->callFactory:Lokhttp3/Call$Factory;

    .line 219
    :cond_10
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    if-nez v0, :cond_12

    .line 220
    sget-object v0, Lio/socket/engineio/client/Socket;->defaultOkHttpClient:Lokhttp3/OkHttpClient;

    if-nez v0, :cond_11

    .line 221
    new-instance v0, Lokhttp3/OkHttpClient;

    invoke-direct {v0}, Lokhttp3/OkHttpClient;-><init>()V

    sput-object v0, Lio/socket/engineio/client/Socket;->defaultOkHttpClient:Lokhttp3/OkHttpClient;

    .line 223
    :cond_11
    sget-object v0, Lio/socket/engineio/client/Socket;->defaultOkHttpClient:Lokhttp3/OkHttpClient;

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    .line 225
    :cond_12
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->extraHeaders:Ljava/util/Map;

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->extraHeaders:Ljava/util/Map;

    .line 226
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 155
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/socket/engineio/client/Socket;-><init>(Ljava/lang/String;Lio/socket/engineio/client/Socket$Options;)V

    .line 156
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lio/socket/engineio/client/Socket$Options;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "opts"    # Lio/socket/engineio/client/Socket$Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 170
    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-direct {p0, v0, p2}, Lio/socket/engineio/client/Socket;-><init>(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)V

    .line 171
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .locals 1
    .param p1, "uri"    # Ljava/net/URI;

    .line 159
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/socket/engineio/client/Socket;-><init>(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)V

    .line 160
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)V
    .locals 1
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "opts"    # Lio/socket/engineio/client/Socket$Options;

    .line 174
    if-nez p1, :cond_0

    move-object v0, p2

    goto :goto_0

    :cond_0
    invoke-static {p1, p2}, Lio/socket/engineio/client/Socket$Options;->access$100(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)Lio/socket/engineio/client/Socket$Options;

    move-result-object v0

    :goto_0
    invoke-direct {p0, v0}, Lio/socket/engineio/client/Socket;-><init>(Lio/socket/engineio/client/Socket$Options;)V

    .line 175
    return-void
.end method

.method static synthetic access$000(Lio/socket/engineio/client/Socket;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .line 36
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->onHeartbeat()V

    return-void
.end method

.method static synthetic access$1000(Lio/socket/engineio/client/Socket;Lio/socket/engineio/parser/Packet;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Lio/socket/engineio/parser/Packet;

    .line 36
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->onPacket(Lio/socket/engineio/parser/Packet;)V

    return-void
.end method

.method static synthetic access$1100(Lio/socket/engineio/client/Socket;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .line 36
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->onDrain()V

    return-void
.end method

.method static synthetic access$1200()Ljava/util/logging/Logger;
    .locals 1

    .line 36
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic access$1300(Lio/socket/engineio/client/Socket;)Z
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .line 36
    iget-boolean v0, p0, Lio/socket/engineio/client/Socket;->upgrading:Z

    return v0
.end method

.method static synthetic access$1302(Lio/socket/engineio/client/Socket;Z)Z
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Z

    .line 36
    iput-boolean p1, p0, Lio/socket/engineio/client/Socket;->upgrading:Z

    return p1
.end method

.method static synthetic access$1400(Lio/socket/engineio/client/Socket;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .line 36
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->flush()V

    return-void
.end method

.method static synthetic access$1500(Lio/socket/engineio/client/Socket;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/Runnable;

    .line 36
    invoke-direct {p0, p1, p2}, Lio/socket/engineio/client/Socket;->sendPacket(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$1600(Lio/socket/engineio/client/Socket;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/Runnable;

    .line 36
    invoke-direct {p0, p1, p2, p3}, Lio/socket/engineio/client/Socket;->sendPacket(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$1700(Lio/socket/engineio/client/Socket;Ljava/lang/String;[BLjava/lang/Runnable;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # [B
    .param p3, "x3"    # Ljava/lang/Runnable;

    .line 36
    invoke-direct {p0, p1, p2, p3}, Lio/socket/engineio/client/Socket;->sendPacket(Ljava/lang/String;[BLjava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$200(Lio/socket/engineio/client/Socket;)Z
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .line 36
    iget-boolean v0, p0, Lio/socket/engineio/client/Socket;->rememberUpgrade:Z

    return v0
.end method

.method static synthetic access$300()Z
    .locals 1

    .line 36
    sget-boolean v0, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    return v0
.end method

.method static synthetic access$302(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .line 36
    sput-boolean p0, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    return p0
.end method

.method static synthetic access$400(Lio/socket/engineio/client/Socket;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .line 36
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transports:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$500(Lio/socket/engineio/client/Socket;)Lio/socket/engineio/client/Socket$ReadyState;
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .line 36
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    return-object v0
.end method

.method static synthetic access$502(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket$ReadyState;)Lio/socket/engineio/client/Socket$ReadyState;
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Lio/socket/engineio/client/Socket$ReadyState;

    .line 36
    iput-object p1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    return-object p1
.end method

.method static synthetic access$600(Lio/socket/engineio/client/Socket;Ljava/lang/String;)Lio/socket/engineio/client/Transport;
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Ljava/lang/String;

    .line 36
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->createTransport(Ljava/lang/String;)Lio/socket/engineio/client/Transport;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Transport;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Lio/socket/engineio/client/Transport;

    .line 36
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->setTransport(Lio/socket/engineio/client/Transport;)V

    return-void
.end method

.method static synthetic access$800(Lio/socket/engineio/client/Socket;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Ljava/lang/String;

    .line 36
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->onClose(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lio/socket/engineio/client/Socket;Ljava/lang/Exception;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Ljava/lang/Exception;

    .line 36
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->onError(Ljava/lang/Exception;)V

    return-void
.end method

.method private createTransport(Ljava/lang/String;)Lio/socket/engineio/client/Transport;
    .locals 7
    .param p1, "name"    # Ljava/lang/String;

    .line 271
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    .line 272
    new-array v1, v3, [Ljava/lang/Object;

    aput-object p1, v1, v2

    const-string v4, "creating transport \'%s\'"

    invoke-static {v4, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 274
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->query:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 276
    .local v0, "query":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v4, "EIO"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    const-string v1, "transport"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    iget-object v4, p0, Lio/socket/engineio/client/Socket;->id:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 279
    const-string v5, "sid"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    :cond_1
    iget-object v4, p0, Lio/socket/engineio/client/Socket;->transportOptions:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/socket/engineio/client/Transport$Options;

    .line 285
    .local v4, "options":Lio/socket/engineio/client/Transport$Options;
    new-instance v5, Lio/socket/engineio/client/Transport$Options;

    invoke-direct {v5}, Lio/socket/engineio/client/Transport$Options;-><init>()V

    .line 286
    .local v5, "opts":Lio/socket/engineio/client/Transport$Options;
    iput-object v0, v5, Lio/socket/engineio/client/Transport$Options;->query:Ljava/util/Map;

    .line 287
    iput-object p0, v5, Lio/socket/engineio/client/Transport$Options;->socket:Lio/socket/engineio/client/Socket;

    .line 289
    if-eqz v4, :cond_2

    iget-object v6, v4, Lio/socket/engineio/client/Transport$Options;->hostname:Ljava/lang/String;

    goto :goto_0

    :cond_2
    iget-object v6, p0, Lio/socket/engineio/client/Socket;->hostname:Ljava/lang/String;

    :goto_0
    iput-object v6, v5, Lio/socket/engineio/client/Transport$Options;->hostname:Ljava/lang/String;

    .line 290
    if-eqz v4, :cond_3

    iget v6, v4, Lio/socket/engineio/client/Transport$Options;->port:I

    goto :goto_1

    :cond_3
    iget v6, p0, Lio/socket/engineio/client/Socket;->port:I

    :goto_1
    iput v6, v5, Lio/socket/engineio/client/Transport$Options;->port:I

    .line 291
    if-eqz v4, :cond_4

    iget-boolean v6, v4, Lio/socket/engineio/client/Transport$Options;->secure:Z

    goto :goto_2

    :cond_4
    iget-boolean v6, p0, Lio/socket/engineio/client/Socket;->secure:Z

    :goto_2
    iput-boolean v6, v5, Lio/socket/engineio/client/Transport$Options;->secure:Z

    .line 292
    if-eqz v4, :cond_5

    iget-object v6, v4, Lio/socket/engineio/client/Transport$Options;->path:Ljava/lang/String;

    goto :goto_3

    :cond_5
    iget-object v6, p0, Lio/socket/engineio/client/Socket;->path:Ljava/lang/String;

    :goto_3
    iput-object v6, v5, Lio/socket/engineio/client/Transport$Options;->path:Ljava/lang/String;

    .line 293
    if-eqz v4, :cond_6

    iget-boolean v6, v4, Lio/socket/engineio/client/Transport$Options;->timestampRequests:Z

    goto :goto_4

    :cond_6
    iget-boolean v6, p0, Lio/socket/engineio/client/Socket;->timestampRequests:Z

    :goto_4
    iput-boolean v6, v5, Lio/socket/engineio/client/Transport$Options;->timestampRequests:Z

    .line 294
    if-eqz v4, :cond_7

    iget-object v6, v4, Lio/socket/engineio/client/Transport$Options;->timestampParam:Ljava/lang/String;

    goto :goto_5

    :cond_7
    iget-object v6, p0, Lio/socket/engineio/client/Socket;->timestampParam:Ljava/lang/String;

    :goto_5
    iput-object v6, v5, Lio/socket/engineio/client/Transport$Options;->timestampParam:Ljava/lang/String;

    .line 295
    if-eqz v4, :cond_8

    iget v6, v4, Lio/socket/engineio/client/Transport$Options;->policyPort:I

    goto :goto_6

    :cond_8
    iget v6, p0, Lio/socket/engineio/client/Socket;->policyPort:I

    :goto_6
    iput v6, v5, Lio/socket/engineio/client/Transport$Options;->policyPort:I

    .line 296
    if-eqz v4, :cond_9

    iget-object v6, v4, Lio/socket/engineio/client/Transport$Options;->callFactory:Lokhttp3/Call$Factory;

    goto :goto_7

    :cond_9
    iget-object v6, p0, Lio/socket/engineio/client/Socket;->callFactory:Lokhttp3/Call$Factory;

    :goto_7
    iput-object v6, v5, Lio/socket/engineio/client/Transport$Options;->callFactory:Lokhttp3/Call$Factory;

    .line 297
    if-eqz v4, :cond_a

    iget-object v6, v4, Lio/socket/engineio/client/Transport$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    goto :goto_8

    :cond_a
    iget-object v6, p0, Lio/socket/engineio/client/Socket;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    :goto_8
    iput-object v6, v5, Lio/socket/engineio/client/Transport$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    .line 298
    iget-object v6, p0, Lio/socket/engineio/client/Socket;->extraHeaders:Ljava/util/Map;

    iput-object v6, v5, Lio/socket/engineio/client/Transport$Options;->extraHeaders:Ljava/util/Map;

    .line 301
    const-string v6, "websocket"

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 302
    new-instance v6, Lio/socket/engineio/client/transports/WebSocket;

    invoke-direct {v6, v5}, Lio/socket/engineio/client/transports/WebSocket;-><init>(Lio/socket/engineio/client/Transport$Options;)V

    .local v6, "transport":Lio/socket/engineio/client/Transport;
    goto :goto_9

    .line 303
    .end local v6    # "transport":Lio/socket/engineio/client/Transport;
    :cond_b
    const-string v6, "polling"

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 304
    new-instance v6, Lio/socket/engineio/client/transports/PollingXHR;

    invoke-direct {v6, v5}, Lio/socket/engineio/client/transports/PollingXHR;-><init>(Lio/socket/engineio/client/Transport$Options;)V

    .line 309
    .restart local v6    # "transport":Lio/socket/engineio/client/Transport;
    :goto_9
    new-array v3, v3, [Ljava/lang/Object;

    aput-object v6, v3, v2

    invoke-virtual {p0, v1, v3}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 311
    return-object v6

    .line 306
    .end local v6    # "transport":Lio/socket/engineio/client/Transport;
    :cond_c
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1}, Ljava/lang/RuntimeException;-><init>()V

    throw v1
.end method

.method private flush()V
    .locals 4

    .line 620
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->CLOSED:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-boolean v0, v0, Lio/socket/engineio/client/Transport;->writable:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lio/socket/engineio/client/Socket;->upgrading:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    .line 621
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-eqz v0, :cond_1

    .line 622
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 623
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v3, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v3, "flushing %d packets in socket"

    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 625
    :cond_0
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    iput v0, p0, Lio/socket/engineio/client/Socket;->prevBufferLen:I

    .line 626
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v3

    new-array v3, v3, [Lio/socket/engineio/parser/Packet;

    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lio/socket/engineio/parser/Packet;

    invoke-virtual {v0, v1}, Lio/socket/engineio/client/Transport;->send([Lio/socket/engineio/parser/Packet;)V

    .line 627
    new-array v0, v2, [Ljava/lang/Object;

    const-string v1, "flush"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 629
    :cond_1
    return-void
.end method

.method private getHeartbeatScheduler()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    .line 850
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 851
    :cond_0
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    .line 853
    :cond_1
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method private onClose(Ljava/lang/String;)V
    .locals 1
    .param p1, "reason"    # Ljava/lang/String;

    .line 790
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/socket/engineio/client/Socket;->onClose(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 791
    return-void
.end method

.method private onClose(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 5
    .param p1, "reason"    # Ljava/lang/String;
    .param p2, "desc"    # Ljava/lang/Exception;

    .line 794
    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->OPENING:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v0, v1, :cond_0

    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->OPEN:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v0, v1, :cond_0

    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->CLOSING:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v0, v1, :cond_4

    .line 795
    :cond_0
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    .line 796
    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v3

    const-string v4, "socket close with reason: %s"

    invoke-static {v4, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 798
    :cond_1
    move-object v0, p0

    .line 801
    .local v0, "self":Lio/socket/engineio/client/Socket;
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->pingTimeoutTimer:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_2

    .line 802
    invoke-interface {v1, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 804
    :cond_2
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v1, :cond_3

    .line 805
    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    .line 809
    :cond_3
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    const-string v4, "close"

    invoke-virtual {v1, v4}, Lio/socket/engineio/client/Transport;->off(Ljava/lang/String;)Lio/socket/emitter/Emitter;

    .line 812
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    invoke-virtual {v1}, Lio/socket/engineio/client/Transport;->close()Lio/socket/engineio/client/Transport;

    .line 815
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    invoke-virtual {v1}, Lio/socket/engineio/client/Transport;->off()Lio/socket/emitter/Emitter;

    .line 818
    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->CLOSED:Lio/socket/engineio/client/Socket$ReadyState;

    iput-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    .line 821
    const/4 v1, 0x0

    iput-object v1, p0, Lio/socket/engineio/client/Socket;->id:Ljava/lang/String;

    .line 824
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v3

    aput-object p2, v1, v2

    invoke-virtual {p0, v4, v1}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 828
    iget-object v1, v0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 829
    iput v3, v0, Lio/socket/engineio/client/Socket;->prevBufferLen:I

    .line 831
    .end local v0    # "self":Lio/socket/engineio/client/Socket;
    :cond_4
    return-void
.end method

.method private onDrain()V
    .locals 2

    .line 607
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lio/socket/engineio/client/Socket;->prevBufferLen:I

    if-ge v0, v1, :cond_0

    .line 608
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 607
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 611
    .end local v0    # "i":I
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lio/socket/engineio/client/Socket;->prevBufferLen:I

    .line 612
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 613
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "drain"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_1

    .line 615
    :cond_1
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->flush()V

    .line 617
    :goto_1
    return-void
.end method

.method private onError(Ljava/lang/Exception;)V
    .locals 5
    .param p1, "err"    # Ljava/lang/Exception;

    .line 781
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 782
    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v3

    const-string v4, "socket error %s"

    invoke-static {v4, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 784
    :cond_0
    sput-boolean v3, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    .line 785
    new-array v0, v2, [Ljava/lang/Object;

    aput-object p1, v0, v3

    const-string v1, "error"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 786
    const-string v0, "transport error"

    invoke-direct {p0, v0, p1}, Lio/socket/engineio/client/Socket;->onClose(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 787
    return-void
.end method

.method private onHandshake(Lio/socket/engineio/client/HandshakeData;)V
    .locals 3
    .param p1, "data"    # Lio/socket/engineio/client/HandshakeData;

    .line 569
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "handshake"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 570
    iget-object v0, p1, Lio/socket/engineio/client/HandshakeData;->sid:Ljava/lang/String;

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->id:Ljava/lang/String;

    .line 571
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-object v0, v0, Lio/socket/engineio/client/Transport;->query:Ljava/util/Map;

    iget-object v1, p1, Lio/socket/engineio/client/HandshakeData;->sid:Ljava/lang/String;

    const-string v2, "sid"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 572
    iget-object v0, p1, Lio/socket/engineio/client/HandshakeData;->upgrades:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/socket/engineio/client/Socket;->filterUpgrades(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->upgrades:Ljava/util/List;

    .line 573
    iget-wide v0, p1, Lio/socket/engineio/client/HandshakeData;->pingInterval:J

    iput-wide v0, p0, Lio/socket/engineio/client/Socket;->pingInterval:J

    .line 574
    iget-wide v0, p1, Lio/socket/engineio/client/HandshakeData;->pingTimeout:J

    iput-wide v0, p0, Lio/socket/engineio/client/Socket;->pingTimeout:J

    .line 575
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->onOpen()V

    .line 577
    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->CLOSED:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v0, v1, :cond_0

    return-void

    .line 578
    :cond_0
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->onHeartbeat()V

    .line 580
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->onHeartbeatAsListener:Lio/socket/emitter/Emitter$Listener;

    const-string v1, "heartbeat"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->off(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 581
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->onHeartbeatAsListener:Lio/socket/emitter/Emitter$Listener;

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 582
    return-void
.end method

.method private onHeartbeat()V
    .locals 6

    .line 585
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->pingTimeoutTimer:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    .line 586
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 589
    :cond_0
    iget-wide v0, p0, Lio/socket/engineio/client/Socket;->pingInterval:J

    iget-wide v2, p0, Lio/socket/engineio/client/Socket;->pingTimeout:J

    add-long/2addr v0, v2

    .line 591
    .local v0, "timeout":J
    move-object v2, p0

    .line 592
    .local v2, "self":Lio/socket/engineio/client/Socket;
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->getHeartbeatScheduler()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v3

    new-instance v4, Lio/socket/engineio/client/Socket$15;

    invoke-direct {v4, p0, v2}, Lio/socket/engineio/client/Socket$15;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v4, v0, v1, v5}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v3

    iput-object v3, p0, Lio/socket/engineio/client/Socket;->pingTimeoutTimer:Ljava/util/concurrent/Future;

    .line 604
    return-void
.end method

.method private onOpen()V
    .locals 3

    .line 514
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v1, "socket open"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 515
    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->OPEN:Lio/socket/engineio/client/Socket$ReadyState;

    iput-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    .line 516
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-object v1, v1, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    const-string v2, "websocket"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    sput-boolean v1, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    .line 517
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "open"

    invoke-virtual {p0, v2, v1}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 518
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->flush()V

    .line 520
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v2, Lio/socket/engineio/client/Socket$ReadyState;->OPEN:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v1, v2, :cond_0

    iget-boolean v1, p0, Lio/socket/engineio/client/Socket;->upgrade:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    instance-of v1, v1, Lio/socket/engineio/client/transports/Polling;

    if-eqz v1, :cond_0

    .line 521
    const-string v1, "starting upgrade probes"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 522
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->upgrades:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 523
    .local v1, "upgrade":Ljava/lang/String;
    invoke-direct {p0, v1}, Lio/socket/engineio/client/Socket;->probe(Ljava/lang/String;)V

    .line 524
    .end local v1    # "upgrade":Ljava/lang/String;
    goto :goto_0

    .line 526
    :cond_0
    return-void
.end method

.method private onPacket(Lio/socket/engineio/parser/Packet;)V
    .locals 5
    .param p1, "packet"    # Lio/socket/engineio/parser/Packet;

    .line 529
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->OPENING:Lio/socket/engineio/client/Socket$ReadyState;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->OPEN:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->CLOSING:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 562
    :cond_0
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 563
    new-array v1, v2, [Ljava/lang/Object;

    iget-object v2, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    aput-object v2, v1, v3

    const-string v2, "packet received with socket readyState \'%s\'"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 532
    :cond_1
    :goto_0
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 533
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    aput-object v4, v1, v3

    iget-object v4, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    aput-object v4, v1, v2

    const-string v4, "socket received: type \'%s\', data \'%s\'"

    invoke-static {v4, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 536
    :cond_2
    new-array v0, v2, [Ljava/lang/Object;

    aput-object p1, v0, v3

    const-string v1, "packet"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 537
    new-array v0, v3, [Ljava/lang/Object;

    const-string v1, "heartbeat"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 539
    iget-object v0, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    const-string v1, "open"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "error"

    if-eqz v0, :cond_3

    .line 541
    :try_start_0
    new-instance v0, Lio/socket/engineio/client/HandshakeData;

    iget-object v4, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-direct {v0, v4}, Lio/socket/engineio/client/HandshakeData;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lio/socket/engineio/client/Socket;->onHandshake(Lio/socket/engineio/client/HandshakeData;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 542
    :catch_0
    move-exception v0

    .line 543
    .local v0, "e":Lorg/json/JSONException;
    new-array v2, v2, [Ljava/lang/Object;

    new-instance v4, Lio/socket/engineio/client/EngineIOException;

    invoke-direct {v4, v0}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/Throwable;)V

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 544
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_1
    goto :goto_3

    .line 545
    :cond_3
    iget-object v0, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    const-string v4, "ping"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 546
    new-array v0, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v4, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 547
    new-instance v0, Lio/socket/engineio/client/Socket$14;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Socket$14;-><init>(Lio/socket/engineio/client/Socket;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    goto :goto_3

    .line 553
    :cond_4
    iget-object v0, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 554
    new-instance v0, Lio/socket/engineio/client/EngineIOException;

    const-string v1, "server error"

    invoke-direct {v0, v1}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/String;)V

    .line 555
    .local v0, "err":Lio/socket/engineio/client/EngineIOException;
    iget-object v1, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    iput-object v1, v0, Lio/socket/engineio/client/EngineIOException;->code:Ljava/lang/Object;

    .line 556
    invoke-direct {p0, v0}, Lio/socket/engineio/client/Socket;->onError(Ljava/lang/Exception;)V

    .end local v0    # "err":Lio/socket/engineio/client/EngineIOException;
    goto :goto_2

    .line 557
    :cond_5
    iget-object v0, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    const-string v1, "message"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 558
    new-array v0, v2, [Ljava/lang/Object;

    iget-object v4, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    aput-object v4, v0, v3

    const-string v4, "data"

    invoke-virtual {p0, v4, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 559
    new-array v0, v2, [Ljava/lang/Object;

    iget-object v2, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    aput-object v2, v0, v3

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_3

    .line 557
    :cond_6
    :goto_2
    nop

    .line 566
    :cond_7
    :goto_3
    return-void
.end method

.method private probe(Ljava/lang/String;)V
    .locals 22
    .param p1, "name"    # Ljava/lang/String;

    .line 353
    move-object/from16 v15, p0

    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    const/4 v2, 0x1

    const/16 v16, 0x0

    if-eqz v1, :cond_0

    .line 354
    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v16

    const-string v3, "probing transport \'%s\'"

    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 356
    :cond_0
    new-array v0, v2, [Lio/socket/engineio/client/Transport;

    invoke-direct/range {p0 .. p1}, Lio/socket/engineio/client/Socket;->createTransport(Ljava/lang/String;)Lio/socket/engineio/client/Transport;

    move-result-object v1

    aput-object v1, v0, v16

    move-object v14, v0

    .line 357
    .local v14, "transport":[Lio/socket/engineio/client/Transport;
    new-array v0, v2, [Z

    aput-boolean v16, v0, v16

    move-object v13, v0

    .line 358
    .local v13, "failed":[Z
    move-object/from16 v5, p0

    .line 360
    .local v5, "self":Lio/socket/engineio/client/Socket;
    sput-boolean v16, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    .line 362
    new-array v12, v2, [Ljava/lang/Runnable;

    .line 364
    .local v12, "cleanup":[Ljava/lang/Runnable;
    new-instance v7, Lio/socket/engineio/client/Socket$7;

    move-object v0, v7

    move-object/from16 v1, p0

    move-object v2, v13

    move-object/from16 v3, p1

    move-object v4, v14

    move-object v6, v12

    invoke-direct/range {v0 .. v6}, Lio/socket/engineio/client/Socket$7;-><init>(Lio/socket/engineio/client/Socket;[ZLjava/lang/String;[Lio/socket/engineio/client/Transport;Lio/socket/engineio/client/Socket;[Ljava/lang/Runnable;)V

    .line 424
    .local v0, "onTransportOpen":Lio/socket/emitter/Emitter$Listener;
    new-instance v1, Lio/socket/engineio/client/Socket$8;

    invoke-direct {v1, v15, v13, v12, v14}, Lio/socket/engineio/client/Socket$8;-><init>(Lio/socket/engineio/client/Socket;[Z[Ljava/lang/Runnable;[Lio/socket/engineio/client/Transport;)V

    .line 439
    .local v1, "freezeTransport":Lio/socket/emitter/Emitter$Listener;
    new-instance v2, Lio/socket/engineio/client/Socket$9;

    move-object v6, v2

    move-object/from16 v7, p0

    move-object v8, v14

    move-object v9, v1

    move-object/from16 v10, p1

    move-object v11, v5

    invoke-direct/range {v6 .. v11}, Lio/socket/engineio/client/Socket$9;-><init>(Lio/socket/engineio/client/Socket;[Lio/socket/engineio/client/Transport;Lio/socket/emitter/Emitter$Listener;Ljava/lang/String;Lio/socket/engineio/client/Socket;)V

    .line 463
    .local v2, "onerror":Lio/socket/emitter/Emitter$Listener;
    new-instance v3, Lio/socket/engineio/client/Socket$10;

    invoke-direct {v3, v15, v2}, Lio/socket/engineio/client/Socket$10;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/emitter/Emitter$Listener;)V

    .line 471
    .local v3, "onTransportClose":Lio/socket/emitter/Emitter$Listener;
    new-instance v4, Lio/socket/engineio/client/Socket$11;

    invoke-direct {v4, v15, v2}, Lio/socket/engineio/client/Socket$11;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/emitter/Emitter$Listener;)V

    .line 479
    .local v4, "onclose":Lio/socket/emitter/Emitter$Listener;
    new-instance v6, Lio/socket/engineio/client/Socket$12;

    invoke-direct {v6, v15, v14, v1}, Lio/socket/engineio/client/Socket$12;-><init>(Lio/socket/engineio/client/Socket;[Lio/socket/engineio/client/Transport;Lio/socket/emitter/Emitter$Listener;)V

    move-object v11, v6

    .line 492
    .local v11, "onupgrade":Lio/socket/emitter/Emitter$Listener;
    new-instance v17, Lio/socket/engineio/client/Socket$13;

    move-object/from16 v6, v17

    move-object v9, v0

    move-object v10, v2

    move-object/from16 v18, v11

    .end local v11    # "onupgrade":Lio/socket/emitter/Emitter$Listener;
    .local v18, "onupgrade":Lio/socket/emitter/Emitter$Listener;
    move-object v11, v3

    move-object/from16 v19, v12

    .end local v12    # "cleanup":[Ljava/lang/Runnable;
    .local v19, "cleanup":[Ljava/lang/Runnable;
    move-object v12, v5

    move-object/from16 v20, v13

    .end local v13    # "failed":[Z
    .local v20, "failed":[Z
    move-object v13, v4

    move-object/from16 v21, v14

    .end local v14    # "transport":[Lio/socket/engineio/client/Transport;
    .local v21, "transport":[Lio/socket/engineio/client/Transport;
    move-object/from16 v14, v18

    invoke-direct/range {v6 .. v14}, Lio/socket/engineio/client/Socket$13;-><init>(Lio/socket/engineio/client/Socket;[Lio/socket/engineio/client/Transport;Lio/socket/emitter/Emitter$Listener;Lio/socket/emitter/Emitter$Listener;Lio/socket/emitter/Emitter$Listener;Lio/socket/engineio/client/Socket;Lio/socket/emitter/Emitter$Listener;Lio/socket/emitter/Emitter$Listener;)V

    aput-object v17, v19, v16

    .line 503
    aget-object v6, v21, v16

    const-string v7, "open"

    invoke-virtual {v6, v7, v0}, Lio/socket/engineio/client/Transport;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 504
    aget-object v6, v21, v16

    const-string v7, "error"

    invoke-virtual {v6, v7, v2}, Lio/socket/engineio/client/Transport;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 505
    aget-object v6, v21, v16

    const-string v7, "close"

    invoke-virtual {v6, v7, v3}, Lio/socket/engineio/client/Transport;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 507
    invoke-virtual {v15, v7, v4}, Lio/socket/engineio/client/Socket;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 508
    const-string v6, "upgrading"

    move-object/from16 v7, v18

    .end local v18    # "onupgrade":Lio/socket/emitter/Emitter$Listener;
    .local v7, "onupgrade":Lio/socket/emitter/Emitter$Listener;
    invoke-virtual {v15, v6, v7}, Lio/socket/engineio/client/Socket;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 510
    aget-object v6, v21, v16

    invoke-virtual {v6}, Lio/socket/engineio/client/Transport;->open()Lio/socket/engineio/client/Transport;

    .line 511
    return-void
.end method

.method private sendPacket(Lio/socket/engineio/parser/Packet;Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "packet"    # Lio/socket/engineio/parser/Packet;
    .param p2, "fn"    # Ljava/lang/Runnable;

    .line 699
    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->CLOSING:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v0, v1, :cond_2

    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->CLOSED:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 703
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "packetCreate"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 704
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    .line 705
    if-eqz p2, :cond_1

    .line 706
    new-instance v0, Lio/socket/engineio/client/Socket$18;

    invoke-direct {v0, p0, p2}, Lio/socket/engineio/client/Socket$18;-><init>(Lio/socket/engineio/client/Socket;Ljava/lang/Runnable;)V

    const-string v1, "flush"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 713
    :cond_1
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->flush()V

    .line 714
    return-void

    .line 700
    :cond_2
    :goto_0
    return-void
.end method

.method private sendPacket(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "fn"    # Ljava/lang/Runnable;

    .line 685
    new-instance v0, Lio/socket/engineio/parser/Packet;

    invoke-direct {v0, p1}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lio/socket/engineio/client/Socket;->sendPacket(Lio/socket/engineio/parser/Packet;Ljava/lang/Runnable;)V

    .line 686
    return-void
.end method

.method private sendPacket(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;
    .param p3, "fn"    # Ljava/lang/Runnable;

    .line 689
    new-instance v0, Lio/socket/engineio/parser/Packet;

    invoke-direct {v0, p1, p2}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 690
    .local v0, "packet":Lio/socket/engineio/parser/Packet;, "Lio/socket/engineio/parser/Packet<Ljava/lang/String;>;"
    invoke-direct {p0, v0, p3}, Lio/socket/engineio/client/Socket;->sendPacket(Lio/socket/engineio/parser/Packet;Ljava/lang/Runnable;)V

    .line 691
    return-void
.end method

.method private sendPacket(Ljava/lang/String;[BLjava/lang/Runnable;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .param p3, "fn"    # Ljava/lang/Runnable;

    .line 694
    new-instance v0, Lio/socket/engineio/parser/Packet;

    invoke-direct {v0, p1, p2}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 695
    .local v0, "packet":Lio/socket/engineio/parser/Packet;, "Lio/socket/engineio/parser/Packet<[B>;"
    invoke-direct {p0, v0, p3}, Lio/socket/engineio/client/Socket;->sendPacket(Lio/socket/engineio/parser/Packet;Ljava/lang/Runnable;)V

    .line 696
    return-void
.end method

.method public static setDefaultOkHttpCallFactory(Lokhttp3/Call$Factory;)V
    .locals 0
    .param p0, "factory"    # Lokhttp3/Call$Factory;

    .line 233
    sput-object p0, Lio/socket/engineio/client/Socket;->defaultCallFactory:Lokhttp3/Call$Factory;

    .line 234
    return-void
.end method

.method public static setDefaultOkHttpWebSocketFactory(Lokhttp3/WebSocket$Factory;)V
    .locals 0
    .param p0, "factory"    # Lokhttp3/WebSocket$Factory;

    .line 229
    sput-object p0, Lio/socket/engineio/client/Socket;->defaultWebSocketFactory:Lokhttp3/WebSocket$Factory;

    .line 230
    return-void
.end method

.method private setTransport(Lio/socket/engineio/client/Transport;)V
    .locals 5
    .param p1, "transport"    # Lio/socket/engineio/client/Transport;

    .line 315
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    .line 316
    new-array v1, v3, [Ljava/lang/Object;

    iget-object v4, p1, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    aput-object v4, v1, v2

    const-string v4, "setting transport %s"

    invoke-static {v4, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 318
    :cond_0
    move-object v1, p0

    .line 320
    .local v1, "self":Lio/socket/engineio/client/Socket;
    iget-object v4, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    if-eqz v4, :cond_2

    .line 321
    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v4}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 322
    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-object v4, v4, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    aput-object v4, v3, v2

    const-string v2, "clearing existing transport %s"

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 324
    :cond_1
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    invoke-virtual {v0}, Lio/socket/engineio/client/Transport;->off()Lio/socket/emitter/Emitter;

    .line 327
    :cond_2
    iput-object p1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    .line 329
    new-instance v0, Lio/socket/engineio/client/Socket$6;

    invoke-direct {v0, p0, v1}, Lio/socket/engineio/client/Socket$6;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    const-string v2, "drain"

    invoke-virtual {p1, v2, v0}, Lio/socket/engineio/client/Transport;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-result-object v0

    new-instance v2, Lio/socket/engineio/client/Socket$5;

    invoke-direct {v2, p0, v1}, Lio/socket/engineio/client/Socket$5;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    .line 334
    const-string v3, "packet"

    invoke-virtual {v0, v3, v2}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-result-object v0

    new-instance v2, Lio/socket/engineio/client/Socket$4;

    invoke-direct {v2, p0, v1}, Lio/socket/engineio/client/Socket$4;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    .line 339
    const-string v3, "error"

    invoke-virtual {v0, v3, v2}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-result-object v0

    new-instance v2, Lio/socket/engineio/client/Socket$3;

    invoke-direct {v2, p0, v1}, Lio/socket/engineio/client/Socket$3;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    .line 344
    const-string v3, "close"

    invoke-virtual {v0, v3, v2}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 350
    return-void
.end method


# virtual methods
.method public close()Lio/socket/engineio/client/Socket;
    .locals 1

    .line 722
    new-instance v0, Lio/socket/engineio/client/Socket$19;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Socket$19;-><init>(Lio/socket/engineio/client/Socket;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 777
    return-object p0
.end method

.method filterUpgrades(Ljava/util/List;)Ljava/util/List;
    .locals 4
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

    .line 834
    .local p1, "upgrades":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 835
    .local v0, "filteredUpgrades":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 836
    .local v2, "upgrade":Ljava/lang/String;
    iget-object v3, p0, Lio/socket/engineio/client/Socket;->transports:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 837
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 839
    .end local v2    # "upgrade":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 842
    :cond_1
    return-object v0
.end method

.method public id()Ljava/lang/String;
    .locals 1

    .line 846
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->id:Ljava/lang/String;

    return-object v0
.end method

.method public open()Lio/socket/engineio/client/Socket;
    .locals 1

    .line 242
    new-instance v0, Lio/socket/engineio/client/Socket$2;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Socket$2;-><init>(Lio/socket/engineio/client/Socket;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 267
    return-object p0
.end method

.method public send(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .line 653
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/socket/engineio/client/Socket;->send(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 654
    return-void
.end method

.method public send(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "fn"    # Ljava/lang/Runnable;

    .line 667
    new-instance v0, Lio/socket/engineio/client/Socket$16;

    invoke-direct {v0, p0, p1, p2}, Lio/socket/engineio/client/Socket$16;-><init>(Lio/socket/engineio/client/Socket;Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 673
    return-void
.end method

.method public send([B)V
    .locals 1
    .param p1, "msg"    # [B

    .line 657
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/socket/engineio/client/Socket;->send([BLjava/lang/Runnable;)V

    .line 658
    return-void
.end method

.method public send([BLjava/lang/Runnable;)V
    .locals 1
    .param p1, "msg"    # [B
    .param p2, "fn"    # Ljava/lang/Runnable;

    .line 676
    new-instance v0, Lio/socket/engineio/client/Socket$17;

    invoke-direct {v0, p0, p1, p2}, Lio/socket/engineio/client/Socket$17;-><init>(Lio/socket/engineio/client/Socket;[BLjava/lang/Runnable;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 682
    return-void
.end method

.method public write(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .line 632
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/socket/engineio/client/Socket;->write(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 633
    return-void
.end method

.method public write(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "fn"    # Ljava/lang/Runnable;

    .line 636
    invoke-virtual {p0, p1, p2}, Lio/socket/engineio/client/Socket;->send(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 637
    return-void
.end method

.method public write([B)V
    .locals 1
    .param p1, "msg"    # [B

    .line 640
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/socket/engineio/client/Socket;->write([BLjava/lang/Runnable;)V

    .line 641
    return-void
.end method

.method public write([BLjava/lang/Runnable;)V
    .locals 0
    .param p1, "msg"    # [B
    .param p2, "fn"    # Ljava/lang/Runnable;

    .line 644
    invoke-virtual {p0, p1, p2}, Lio/socket/engineio/client/Socket;->send([BLjava/lang/Runnable;)V

    .line 645
    return-void
.end method
