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

.field public static final PROTOCOL:I = 0x3

.field private static defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field private static defaultSSLContext:Ljavax/net/ssl/SSLContext;

.field private static final logger:Ljava/util/logging/Logger;

.field private static priorWebsocketSuccess:Z


# instance fields
.field private heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

.field hostname:Ljava/lang/String;

.field private hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field private id:Ljava/lang/String;

.field private final onHeartbeatAsListener:Lio/socket/emitter/Emitter$Listener;

.field private path:Ljava/lang/String;

.field private pingInterval:J

.field private pingIntervalTimer:Ljava/util/concurrent/Future;

.field private pingTimeout:J

.field private pingTimeoutTimer:Ljava/util/concurrent/Future;

.field private policyPort:I

.field port:I

.field private prevBufferLen:I

.field public proxy:Ljava/net/Proxy;

.field public proxyLogin:Ljava/lang/String;

.field public proxyPassword:Ljava/lang/String;

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

.field private sslContext:Ljavax/net/ssl/SSLContext;

.field private timestampParam:Ljava/lang/String;

.field private timestampRequests:Z

.field transport:Lio/socket/engineio/client/Transport;

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

    .line 33
    const-class v0, Lio/socket/engineio/client/Socket;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const/4 v0, 0x0

    .line 99
    sput-boolean v0, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 141
    new-instance v0, Lio/socket/engineio/client/Socket$Options;

    invoke-direct {v0}, Lio/socket/engineio/client/Socket$Options;-><init>()V

    invoke-direct {p0, v0}, Lio/socket/engineio/client/Socket;-><init>(Lio/socket/engineio/client/Socket$Options;)V

    return-void
.end method

.method public constructor <init>(Lio/socket/engineio/client/Socket$Options;)V
    .locals 7

    .line 173
    invoke-direct {p0}, Lio/socket/emitter/Emitter;-><init>()V

    .line 121
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    .line 133
    new-instance v0, Lio/socket/engineio/client/Socket$1;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Socket$1;-><init>(Lio/socket/engineio/client/Socket;)V

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->onHeartbeatAsListener:Lio/socket/emitter/Emitter$Listener;

    .line 174
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->host:Ljava/lang/String;

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, -0x1

    if-eqz v0, :cond_3

    .line 175
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->host:Ljava/lang/String;

    const-string v5, ":"

    .line 176
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

    .line 178
    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-eq v5, v4, :cond_1

    add-int/2addr v5, v2

    .line 179
    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_1
    const/16 v5, 0x5d

    .line 180
    invoke-virtual {v0, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    if-eq v5, v4, :cond_2

    .line 181
    invoke-virtual {v0, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 183
    :cond_2
    iput-object v0, p1, Lio/socket/engineio/client/Socket$Options;->hostname:Ljava/lang/String;

    .line 186
    :cond_3
    iget-boolean v0, p1, Lio/socket/engineio/client/Socket$Options;->secure:Z

    iput-boolean v0, p0, Lio/socket/engineio/client/Socket;->secure:Z

    .line 188
    iget v0, p1, Lio/socket/engineio/client/Socket$Options;->port:I

    if-ne v0, v4, :cond_5

    .line 190
    iget-boolean v0, p0, Lio/socket/engineio/client/Socket;->secure:Z

    if-eqz v0, :cond_4

    const/16 v0, 0x1bb

    goto :goto_1

    :cond_4
    const/16 v0, 0x50

    :goto_1
    iput v0, p1, Lio/socket/engineio/client/Socket$Options;->port:I

    .line 193
    :cond_5
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->sslContext:Ljavax/net/ssl/SSLContext;

    if-eqz v0, :cond_6

    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->sslContext:Ljavax/net/ssl/SSLContext;

    goto :goto_2

    :cond_6
    sget-object v0, Lio/socket/engineio/client/Socket;->defaultSSLContext:Ljavax/net/ssl/SSLContext;

    :goto_2
    iput-object v0, p0, Lio/socket/engineio/client/Socket;->sslContext:Ljavax/net/ssl/SSLContext;

    .line 194
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->hostname:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->hostname:Ljava/lang/String;

    goto :goto_3

    :cond_7
    const-string v0, "localhost"

    :goto_3
    iput-object v0, p0, Lio/socket/engineio/client/Socket;->hostname:Ljava/lang/String;

    .line 195
    iget v0, p1, Lio/socket/engineio/client/Socket$Options;->port:I

    iput v0, p0, Lio/socket/engineio/client/Socket;->port:I

    .line 196
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->query:Ljava/lang/String;

    if-eqz v0, :cond_8

    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->query:Ljava/lang/String;

    .line 197
    invoke-static {v0}, Lio/socket/parseqs/ParseQS;->decode(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    goto :goto_4

    :cond_8
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_4
    iput-object v0, p0, Lio/socket/engineio/client/Socket;->query:Ljava/util/Map;

    .line 198
    iget-boolean v0, p1, Lio/socket/engineio/client/Socket$Options;->upgrade:Z

    iput-boolean v0, p0, Lio/socket/engineio/client/Socket;->upgrade:Z

    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->path:Ljava/lang/String;

    if-eqz v4, :cond_9

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->path:Ljava/lang/String;

    goto :goto_5

    :cond_9
    const-string v4, "/engine.io"

    :goto_5
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

    .line 200
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->timestampParam:Ljava/lang/String;

    if-eqz v0, :cond_a

    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->timestampParam:Ljava/lang/String;

    goto :goto_6

    :cond_a
    const-string v0, "t"

    :goto_6
    iput-object v0, p0, Lio/socket/engineio/client/Socket;->timestampParam:Ljava/lang/String;

    .line 201
    iget-boolean v0, p1, Lio/socket/engineio/client/Socket$Options;->timestampRequests:Z

    iput-boolean v0, p0, Lio/socket/engineio/client/Socket;->timestampRequests:Z

    .line 202
    new-instance v0, Ljava/util/ArrayList;

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->transports:[Ljava/lang/String;

    if-eqz v4, :cond_b

    iget-object v1, p1, Lio/socket/engineio/client/Socket$Options;->transports:[Ljava/lang/String;

    goto :goto_7

    :cond_b
    new-array v1, v1, [Ljava/lang/String;

    const-string v4, "polling"

    aput-object v4, v1, v3

    const-string v3, "websocket"

    aput-object v3, v1, v2

    :goto_7
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->transports:Ljava/util/List;

    .line 204
    iget v0, p1, Lio/socket/engineio/client/Socket$Options;->policyPort:I

    if-eqz v0, :cond_c

    iget v0, p1, Lio/socket/engineio/client/Socket$Options;->policyPort:I

    goto :goto_8

    :cond_c
    const/16 v0, 0x34b

    :goto_8
    iput v0, p0, Lio/socket/engineio/client/Socket;->policyPort:I

    .line 205
    iget-boolean v0, p1, Lio/socket/engineio/client/Socket$Options;->rememberUpgrade:Z

    iput-boolean v0, p0, Lio/socket/engineio/client/Socket;->rememberUpgrade:Z

    .line 206
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    if-eqz v0, :cond_d

    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    goto :goto_9

    :cond_d
    sget-object v0, Lio/socket/engineio/client/Socket;->defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    :goto_9
    iput-object v0, p0, Lio/socket/engineio/client/Socket;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 207
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->proxy:Ljava/net/Proxy;

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->proxy:Ljava/net/Proxy;

    .line 208
    iget-object v0, p1, Lio/socket/engineio/client/Socket$Options;->proxyLogin:Ljava/lang/String;

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->proxyLogin:Ljava/lang/String;

    .line 209
    iget-object p1, p1, Lio/socket/engineio/client/Socket$Options;->proxyPassword:Ljava/lang/String;

    iput-object p1, p0, Lio/socket/engineio/client/Socket;->proxyPassword:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 151
    invoke-direct {p0, p1, v0}, Lio/socket/engineio/client/Socket;-><init>(Ljava/lang/String;Lio/socket/engineio/client/Socket$Options;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lio/socket/engineio/client/Socket$Options;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 166
    :cond_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    move-object p1, v0

    :goto_0
    invoke-direct {p0, p1, p2}, Lio/socket/engineio/client/Socket;-><init>(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .locals 1

    const/4 v0, 0x0

    .line 155
    invoke-direct {p0, p1, v0}, Lio/socket/engineio/client/Socket;-><init>(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)V
    .locals 0

    if-nez p1, :cond_0

    goto :goto_0

    .line 170
    :cond_0
    invoke-static {p1, p2}, Lio/socket/engineio/client/Socket$Options;->access$100(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)Lio/socket/engineio/client/Socket$Options;

    move-result-object p2

    :goto_0
    invoke-direct {p0, p2}, Lio/socket/engineio/client/Socket;-><init>(Lio/socket/engineio/client/Socket$Options;)V

    return-void
.end method

.method static synthetic access$000(Lio/socket/engineio/client/Socket;J)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2}, Lio/socket/engineio/client/Socket;->onHeartbeat(J)V

    return-void
.end method

.method static synthetic access$1000(Lio/socket/engineio/client/Socket;Lio/socket/engineio/parser/Packet;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->onPacket(Lio/socket/engineio/parser/Packet;)V

    return-void
.end method

.method static synthetic access$1100(Lio/socket/engineio/client/Socket;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->onDrain()V

    return-void
.end method

.method static synthetic access$1200()Ljava/util/logging/Logger;
    .locals 1

    .line 31
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic access$1300(Lio/socket/engineio/client/Socket;)Z
    .locals 0

    .line 31
    iget-boolean p0, p0, Lio/socket/engineio/client/Socket;->upgrading:Z

    return p0
.end method

.method static synthetic access$1302(Lio/socket/engineio/client/Socket;Z)Z
    .locals 0

    .line 31
    iput-boolean p1, p0, Lio/socket/engineio/client/Socket;->upgrading:Z

    return p1
.end method

.method static synthetic access$1400(Lio/socket/engineio/client/Socket;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->flush()V

    return-void
.end method

.method static synthetic access$1500(Lio/socket/engineio/client/Socket;)J
    .locals 2

    .line 31
    iget-wide v0, p0, Lio/socket/engineio/client/Socket;->pingTimeout:J

    return-wide v0
.end method

.method static synthetic access$1600(Lio/socket/engineio/client/Socket;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->ping()V

    return-void
.end method

.method static synthetic access$1700(Lio/socket/engineio/client/Socket;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2}, Lio/socket/engineio/client/Socket;->sendPacket(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$1800(Lio/socket/engineio/client/Socket;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2, p3}, Lio/socket/engineio/client/Socket;->sendPacket(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$1900(Lio/socket/engineio/client/Socket;Ljava/lang/String;[BLjava/lang/Runnable;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2, p3}, Lio/socket/engineio/client/Socket;->sendPacket(Ljava/lang/String;[BLjava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$200(Lio/socket/engineio/client/Socket;)Z
    .locals 0

    .line 31
    iget-boolean p0, p0, Lio/socket/engineio/client/Socket;->rememberUpgrade:Z

    return p0
.end method

.method static synthetic access$300()Z
    .locals 1

    .line 31
    sget-boolean v0, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    return v0
.end method

.method static synthetic access$302(Z)Z
    .locals 0

    .line 31
    sput-boolean p0, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    return p0
.end method

.method static synthetic access$400(Lio/socket/engineio/client/Socket;)Ljava/util/List;
    .locals 0

    .line 31
    iget-object p0, p0, Lio/socket/engineio/client/Socket;->transports:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$500(Lio/socket/engineio/client/Socket;)Lio/socket/engineio/client/Socket$ReadyState;
    .locals 0

    .line 31
    iget-object p0, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    return-object p0
.end method

.method static synthetic access$502(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket$ReadyState;)Lio/socket/engineio/client/Socket$ReadyState;
    .locals 0

    .line 31
    iput-object p1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    return-object p1
.end method

.method static synthetic access$600(Lio/socket/engineio/client/Socket;Ljava/lang/String;)Lio/socket/engineio/client/Transport;
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->createTransport(Ljava/lang/String;)Lio/socket/engineio/client/Transport;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Transport;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->setTransport(Lio/socket/engineio/client/Transport;)V

    return-void
.end method

.method static synthetic access$800(Lio/socket/engineio/client/Socket;Ljava/lang/String;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->onClose(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lio/socket/engineio/client/Socket;Ljava/lang/Exception;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->onError(Ljava/lang/Exception;)V

    return-void
.end method

.method private createTransport(Ljava/lang/String;)Lio/socket/engineio/client/Transport;
    .locals 6

    .line 255
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "creating transport \'%s\'"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 256
    new-instance v0, Ljava/util/HashMap;

    iget-object v2, p0, Lio/socket/engineio/client/Socket;->query:Ljava/util/Map;

    invoke-direct {v0, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    const/4 v2, 0x3

    .line 258
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v4, "EIO"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "transport"

    .line 259
    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    iget-object v4, p0, Lio/socket/engineio/client/Socket;->id:Ljava/lang/String;

    if-eqz v4, :cond_0

    const-string v5, "sid"

    .line 261
    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    :cond_0
    new-instance v4, Lio/socket/engineio/client/Transport$Options;

    invoke-direct {v4}, Lio/socket/engineio/client/Transport$Options;-><init>()V

    .line 265
    iget-object v5, p0, Lio/socket/engineio/client/Socket;->sslContext:Ljavax/net/ssl/SSLContext;

    iput-object v5, v4, Lio/socket/engineio/client/Transport$Options;->sslContext:Ljavax/net/ssl/SSLContext;

    .line 266
    iget-object v5, p0, Lio/socket/engineio/client/Socket;->hostname:Ljava/lang/String;

    iput-object v5, v4, Lio/socket/engineio/client/Transport$Options;->hostname:Ljava/lang/String;

    .line 267
    iget v5, p0, Lio/socket/engineio/client/Socket;->port:I

    iput v5, v4, Lio/socket/engineio/client/Transport$Options;->port:I

    .line 268
    iget-boolean v5, p0, Lio/socket/engineio/client/Socket;->secure:Z

    iput-boolean v5, v4, Lio/socket/engineio/client/Transport$Options;->secure:Z

    .line 269
    iget-object v5, p0, Lio/socket/engineio/client/Socket;->path:Ljava/lang/String;

    iput-object v5, v4, Lio/socket/engineio/client/Transport$Options;->path:Ljava/lang/String;

    .line 270
    iput-object v0, v4, Lio/socket/engineio/client/Transport$Options;->query:Ljava/util/Map;

    .line 271
    iget-boolean v0, p0, Lio/socket/engineio/client/Socket;->timestampRequests:Z

    iput-boolean v0, v4, Lio/socket/engineio/client/Transport$Options;->timestampRequests:Z

    .line 272
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->timestampParam:Ljava/lang/String;

    iput-object v0, v4, Lio/socket/engineio/client/Transport$Options;->timestampParam:Ljava/lang/String;

    .line 273
    iget v0, p0, Lio/socket/engineio/client/Socket;->policyPort:I

    iput v0, v4, Lio/socket/engineio/client/Transport$Options;->policyPort:I

    .line 274
    iput-object p0, v4, Lio/socket/engineio/client/Transport$Options;->socket:Lio/socket/engineio/client/Socket;

    .line 275
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    iput-object v0, v4, Lio/socket/engineio/client/Transport$Options;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 276
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->proxy:Ljava/net/Proxy;

    iput-object v0, v4, Lio/socket/engineio/client/Transport$Options;->proxy:Ljava/net/Proxy;

    .line 277
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->proxyLogin:Ljava/lang/String;

    iput-object v0, v4, Lio/socket/engineio/client/Transport$Options;->proxyLogin:Ljava/lang/String;

    .line 278
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->proxyPassword:Ljava/lang/String;

    iput-object v0, v4, Lio/socket/engineio/client/Transport$Options;->proxyPassword:Ljava/lang/String;

    const-string v0, "websocket"

    .line 281
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 282
    new-instance p1, Lio/socket/engineio/client/transports/WebSocket;

    invoke-direct {p1, v4}, Lio/socket/engineio/client/transports/WebSocket;-><init>(Lio/socket/engineio/client/Transport$Options;)V

    goto :goto_0

    :cond_1
    const-string v0, "polling"

    .line 283
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 284
    new-instance p1, Lio/socket/engineio/client/transports/PollingXHR;

    invoke-direct {p1, v4}, Lio/socket/engineio/client/transports/PollingXHR;-><init>(Lio/socket/engineio/client/Transport$Options;)V

    :goto_0
    new-array v0, v1, [Ljava/lang/Object;

    aput-object p1, v0, v3

    .line 289
    invoke-virtual {p0, v2, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    return-object p1

    .line 286
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    throw p1
.end method

.method private flush()V
    .locals 4

    .line 611
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->CLOSED:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-boolean v0, v0, Lio/socket/engineio/client/Transport;->writable:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lio/socket/engineio/client/Socket;->upgrading:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    .line 612
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 613
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

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

    .line 614
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    iput v0, p0, Lio/socket/engineio/client/Socket;->prevBufferLen:I

    .line 615
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v2

    new-array v2, v2, [Lio/socket/engineio/parser/Packet;

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lio/socket/engineio/parser/Packet;

    invoke-virtual {v0, v1}, Lio/socket/engineio/client/Transport;->send([Lio/socket/engineio/parser/Packet;)V

    new-array v0, v3, [Ljava/lang/Object;

    const-string v1, "flush"

    .line 616
    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    :cond_0
    return-void
.end method

.method private getHeartbeatScheduler()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    .line 838
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 839
    :cond_0
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    .line 841
    :cond_1
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method private onClose(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 777
    invoke-direct {p0, p1, v0}, Lio/socket/engineio/client/Socket;->onClose(Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method

.method private onClose(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 5

    .line 781
    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->OPENING:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v0, v1, :cond_0

    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->OPEN:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v0, v1, :cond_0

    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->CLOSING:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v0, v1, :cond_4

    .line 782
    :cond_0
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "socket close with reason: %s"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 786
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->pingIntervalTimer:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_1

    .line 787
    invoke-interface {v0, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 789
    :cond_1
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->pingTimeoutTimer:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_2

    .line 790
    invoke-interface {v0, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 792
    :cond_2
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_3

    .line 793
    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    .line 797
    :cond_3
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    const-string v2, "close"

    invoke-virtual {v0, v2}, Lio/socket/engineio/client/Transport;->off(Ljava/lang/String;)Lio/socket/emitter/Emitter;

    .line 800
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    invoke-virtual {v0}, Lio/socket/engineio/client/Transport;->close()Lio/socket/engineio/client/Transport;

    .line 803
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    invoke-virtual {v0}, Lio/socket/engineio/client/Transport;->off()Lio/socket/emitter/Emitter;

    .line 806
    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->CLOSED:Lio/socket/engineio/client/Socket$ReadyState;

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    const/4 v0, 0x0

    .line 809
    iput-object v0, p0, Lio/socket/engineio/client/Socket;->id:Ljava/lang/String;

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v3

    aput-object p2, v0, v1

    .line 812
    invoke-virtual {p0, v2, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 816
    iget-object p1, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/util/LinkedList;->clear()V

    .line 817
    iput v3, p0, Lio/socket/engineio/client/Socket;->prevBufferLen:I

    :cond_4
    return-void
.end method

.method private onDrain()V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 598
    :goto_0
    iget v2, p0, Lio/socket/engineio/client/Socket;->prevBufferLen:I

    if-ge v1, v2, :cond_0

    .line 599
    iget-object v2, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 602
    :cond_0
    iput v0, p0, Lio/socket/engineio/client/Socket;->prevBufferLen:I

    .line 603
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-nez v1, :cond_1

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "drain"

    .line 604
    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_1

    .line 606
    :cond_1
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->flush()V

    :goto_1
    return-void
.end method

.method private onError(Ljava/lang/Exception;)V
    .locals 5

    .line 770
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "socket error %s"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 771
    sput-boolean v3, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    new-array v0, v1, [Ljava/lang/Object;

    aput-object p1, v0, v3

    const-string v1, "error"

    .line 772
    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    const-string v0, "transport error"

    .line 773
    invoke-direct {p0, v0, p1}, Lio/socket/engineio/client/Socket;->onClose(Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method

.method private onHandshake(Lio/socket/engineio/client/HandshakeData;)V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "handshake"

    .line 520
    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 521
    iget-object v0, p1, Lio/socket/engineio/client/HandshakeData;->sid:Ljava/lang/String;

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->id:Ljava/lang/String;

    .line 522
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-object v0, v0, Lio/socket/engineio/client/Transport;->query:Ljava/util/Map;

    iget-object v1, p1, Lio/socket/engineio/client/HandshakeData;->sid:Ljava/lang/String;

    const-string v2, "sid"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 523
    iget-object v0, p1, Lio/socket/engineio/client/HandshakeData;->upgrades:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/socket/engineio/client/Socket;->filterUpgrades(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->upgrades:Ljava/util/List;

    .line 524
    iget-wide v0, p1, Lio/socket/engineio/client/HandshakeData;->pingInterval:J

    iput-wide v0, p0, Lio/socket/engineio/client/Socket;->pingInterval:J

    .line 525
    iget-wide v0, p1, Lio/socket/engineio/client/HandshakeData;->pingTimeout:J

    iput-wide v0, p0, Lio/socket/engineio/client/Socket;->pingTimeout:J

    .line 526
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->onOpen()V

    .line 528
    sget-object p1, Lio/socket/engineio/client/Socket$ReadyState;->CLOSED:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v0, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne p1, v0, :cond_0

    return-void

    .line 529
    :cond_0
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->setPing()V

    .line 531
    iget-object p1, p0, Lio/socket/engineio/client/Socket;->onHeartbeatAsListener:Lio/socket/emitter/Emitter$Listener;

    const-string v0, "heartbeat"

    invoke-virtual {p0, v0, p1}, Lio/socket/engineio/client/Socket;->off(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 532
    iget-object p1, p0, Lio/socket/engineio/client/Socket;->onHeartbeatAsListener:Lio/socket/emitter/Emitter$Listener;

    invoke-virtual {p0, v0, p1}, Lio/socket/engineio/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    return-void
.end method

.method private onHeartbeat(J)V
    .locals 3

    .line 536
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->pingTimeoutTimer:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 537
    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gtz v2, :cond_1

    .line 541
    iget-wide p1, p0, Lio/socket/engineio/client/Socket;->pingInterval:J

    iget-wide v0, p0, Lio/socket/engineio/client/Socket;->pingTimeout:J

    add-long/2addr p1, v0

    .line 545
    :cond_1
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->getHeartbeatScheduler()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Lio/socket/engineio/client/Socket$14;

    invoke-direct {v1, p0, p0}, Lio/socket/engineio/client/Socket$14;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, p1, p2, v2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iput-object p1, p0, Lio/socket/engineio/client/Socket;->pingTimeoutTimer:Ljava/util/concurrent/Future;

    return-void
.end method

.method private onOpen()V
    .locals 3

    .line 476
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v1, "socket open"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 477
    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->OPEN:Lio/socket/engineio/client/Socket$ReadyState;

    iput-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    .line 478
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-object v1, v1, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    const-string v2, "websocket"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    sput-boolean v1, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "open"

    .line 479
    invoke-virtual {p0, v2, v1}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 480
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->flush()V

    .line 482
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v2, Lio/socket/engineio/client/Socket$ReadyState;->OPEN:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v1, v2, :cond_0

    iget-boolean v1, p0, Lio/socket/engineio/client/Socket;->upgrade:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    instance-of v1, v1, Lio/socket/engineio/client/transports/Polling;

    if-eqz v1, :cond_0

    const-string v1, "starting upgrade probes"

    .line 483
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 484
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

    .line 485
    invoke-direct {p0, v1}, Lio/socket/engineio/client/Socket;->probe(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private onPacket(Lio/socket/engineio/parser/Packet;)V
    .locals 5

    .line 491
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->OPENING:Lio/socket/engineio/client/Socket$ReadyState;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->OPEN:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 515
    :cond_0
    sget-object p1, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    new-array v0, v2, [Ljava/lang/Object;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    aput-object v1, v0, v3

    const-string v1, "packet received with socket readyState \'%s\'"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 492
    :cond_1
    :goto_0
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

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

    new-array v0, v2, [Ljava/lang/Object;

    aput-object p1, v0, v3

    const-string v1, "packet"

    .line 494
    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    new-array v0, v3, [Ljava/lang/Object;

    const-string v1, "heartbeat"

    .line 495
    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 497
    iget-object v0, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    const-string v1, "open"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "error"

    if-eqz v0, :cond_2

    .line 499
    :try_start_0
    new-instance v0, Lio/socket/engineio/client/HandshakeData;

    iget-object p1, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-direct {v0, p1}, Lio/socket/engineio/client/HandshakeData;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lio/socket/engineio/client/Socket;->onHandshake(Lio/socket/engineio/client/HandshakeData;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    new-array v0, v2, [Ljava/lang/Object;

    .line 501
    new-instance v2, Lio/socket/engineio/client/EngineIOException;

    invoke-direct {v2, p1}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/Throwable;)V

    aput-object v2, v0, v3

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_1

    .line 503
    :cond_2
    iget-object v0, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    const-string v4, "pong"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 504
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->setPing()V

    new-array p1, v3, [Ljava/lang/Object;

    .line 505
    invoke-virtual {p0, v4, p1}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_1

    .line 506
    :cond_3
    iget-object v0, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 507
    new-instance v0, Lio/socket/engineio/client/EngineIOException;

    const-string v1, "server error"

    invoke-direct {v0, v1}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/String;)V

    .line 508
    iget-object p1, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    iput-object p1, v0, Lio/socket/engineio/client/EngineIOException;->code:Ljava/lang/Object;

    .line 509
    invoke-direct {p0, v0}, Lio/socket/engineio/client/Socket;->onError(Ljava/lang/Exception;)V

    goto :goto_1

    .line 510
    :cond_4
    iget-object v0, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    const-string v1, "message"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    new-array v0, v2, [Ljava/lang/Object;

    .line 511
    iget-object v4, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    aput-object v4, v0, v3

    const-string v4, "data"

    invoke-virtual {p0, v4, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    new-array v0, v2, [Ljava/lang/Object;

    .line 512
    iget-object p1, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    aput-object p1, v0, v3

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    :cond_5
    :goto_1
    return-void
.end method

.method private ping()V
    .locals 1

    .line 584
    new-instance v0, Lio/socket/engineio/client/Socket$16;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Socket$16;-><init>(Lio/socket/engineio/client/Socket;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-void
.end method

.method private probe(Ljava/lang/String;)V
    .locals 18

    move-object/from16 v9, p0

    .line 329
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p1, v2, v10

    const-string v3, "probing transport \'%s\'"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    new-array v11, v1, [Lio/socket/engineio/client/Transport;

    .line 330
    invoke-direct/range {p0 .. p1}, Lio/socket/engineio/client/Socket;->createTransport(Ljava/lang/String;)Lio/socket/engineio/client/Transport;

    move-result-object v0

    aput-object v0, v11, v10

    new-array v7, v1, [Z

    aput-boolean v10, v7, v10

    .line 334
    sput-boolean v10, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    new-array v12, v1, [Ljava/lang/Runnable;

    .line 338
    new-instance v13, Lio/socket/engineio/client/Socket$7;

    move-object v0, v13

    move-object/from16 v1, p0

    move-object v2, v7

    move-object/from16 v3, p1

    move-object v4, v11

    move-object/from16 v5, p0

    move-object v6, v12

    invoke-direct/range {v0 .. v6}, Lio/socket/engineio/client/Socket$7;-><init>(Lio/socket/engineio/client/Socket;[ZLjava/lang/String;[Lio/socket/engineio/client/Transport;Lio/socket/engineio/client/Socket;[Ljava/lang/Runnable;)V

    .line 390
    new-instance v6, Lio/socket/engineio/client/Socket$8;

    invoke-direct {v6, v9, v7, v12, v11}, Lio/socket/engineio/client/Socket$8;-><init>(Lio/socket/engineio/client/Socket;[Z[Ljava/lang/Runnable;[Lio/socket/engineio/client/Transport;)V

    .line 405
    new-instance v14, Lio/socket/engineio/client/Socket$9;

    move-object v0, v14

    move-object v2, v11

    move-object v3, v6

    move-object/from16 v4, p1

    invoke-direct/range {v0 .. v5}, Lio/socket/engineio/client/Socket$9;-><init>(Lio/socket/engineio/client/Socket;[Lio/socket/engineio/client/Transport;Lio/socket/emitter/Emitter$Listener;Ljava/lang/String;Lio/socket/engineio/client/Socket;)V

    .line 427
    new-instance v15, Lio/socket/engineio/client/Socket$10;

    invoke-direct {v15, v9, v14}, Lio/socket/engineio/client/Socket$10;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/emitter/Emitter$Listener;)V

    .line 435
    new-instance v8, Lio/socket/engineio/client/Socket$11;

    invoke-direct {v8, v9, v14}, Lio/socket/engineio/client/Socket$11;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/emitter/Emitter$Listener;)V

    .line 443
    new-instance v7, Lio/socket/engineio/client/Socket$12;

    invoke-direct {v7, v9, v11, v6}, Lio/socket/engineio/client/Socket$12;-><init>(Lio/socket/engineio/client/Socket;[Lio/socket/engineio/client/Transport;Lio/socket/emitter/Emitter$Listener;)V

    .line 454
    new-instance v16, Lio/socket/engineio/client/Socket$13;

    move-object/from16 v0, v16

    move-object v3, v13

    move-object v4, v14

    move-object v5, v15

    move-object/from16 v6, p0

    move-object/from16 p1, v7

    move-object v7, v8

    move-object/from16 v17, v8

    move-object/from16 v8, p1

    invoke-direct/range {v0 .. v8}, Lio/socket/engineio/client/Socket$13;-><init>(Lio/socket/engineio/client/Socket;[Lio/socket/engineio/client/Transport;Lio/socket/emitter/Emitter$Listener;Lio/socket/emitter/Emitter$Listener;Lio/socket/emitter/Emitter$Listener;Lio/socket/engineio/client/Socket;Lio/socket/emitter/Emitter$Listener;Lio/socket/emitter/Emitter$Listener;)V

    aput-object v16, v12, v10

    .line 465
    aget-object v0, v11, v10

    const-string v1, "open"

    invoke-virtual {v0, v1, v13}, Lio/socket/engineio/client/Transport;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 466
    aget-object v0, v11, v10

    const-string v1, "error"

    invoke-virtual {v0, v1, v14}, Lio/socket/engineio/client/Transport;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 467
    aget-object v0, v11, v10

    const-string v1, "close"

    invoke-virtual {v0, v1, v15}, Lio/socket/engineio/client/Transport;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-object/from16 v0, v17

    .line 469
    invoke-virtual {v9, v1, v0}, Lio/socket/engineio/client/Socket;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    const-string v0, "upgrading"

    move-object/from16 v1, p1

    .line 470
    invoke-virtual {v9, v0, v1}, Lio/socket/engineio/client/Socket;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 472
    aget-object v0, v11, v10

    invoke-virtual {v0}, Lio/socket/engineio/client/Transport;->open()Lio/socket/engineio/client/Transport;

    return-void
.end method

.method private sendPacket(Lio/socket/engineio/parser/Packet;Ljava/lang/Runnable;)V
    .locals 2

    .line 688
    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->CLOSING:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v0, v1, :cond_2

    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->CLOSED:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "packetCreate"

    .line 692
    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 693
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    if-eqz p2, :cond_1

    .line 695
    new-instance p1, Lio/socket/engineio/client/Socket$19;

    invoke-direct {p1, p0, p2}, Lio/socket/engineio/client/Socket$19;-><init>(Lio/socket/engineio/client/Socket;Ljava/lang/Runnable;)V

    const-string p2, "flush"

    invoke-virtual {p0, p2, p1}, Lio/socket/engineio/client/Socket;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 702
    :cond_1
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->flush()V

    :cond_2
    :goto_0
    return-void
.end method

.method private sendPacket(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1

    .line 674
    new-instance v0, Lio/socket/engineio/parser/Packet;

    invoke-direct {v0, p1}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lio/socket/engineio/client/Socket;->sendPacket(Lio/socket/engineio/parser/Packet;Ljava/lang/Runnable;)V

    return-void
.end method

.method private sendPacket(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1

    .line 678
    new-instance v0, Lio/socket/engineio/parser/Packet;

    invoke-direct {v0, p1, p2}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 679
    invoke-direct {p0, v0, p3}, Lio/socket/engineio/client/Socket;->sendPacket(Lio/socket/engineio/parser/Packet;Ljava/lang/Runnable;)V

    return-void
.end method

.method private sendPacket(Ljava/lang/String;[BLjava/lang/Runnable;)V
    .locals 1

    .line 683
    new-instance v0, Lio/socket/engineio/parser/Packet;

    invoke-direct {v0, p1, p2}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 684
    invoke-direct {p0, v0, p3}, Lio/socket/engineio/client/Socket;->sendPacket(Lio/socket/engineio/parser/Packet;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setDefaultHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V
    .locals 0

    .line 217
    sput-object p0, Lio/socket/engineio/client/Socket;->defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-void
.end method

.method public static setDefaultSSLContext(Ljavax/net/ssl/SSLContext;)V
    .locals 0

    .line 213
    sput-object p0, Lio/socket/engineio/client/Socket;->defaultSSLContext:Ljavax/net/ssl/SSLContext;

    return-void
.end method

.method private setPing()V
    .locals 5

    .line 560
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->pingIntervalTimer:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 561
    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 565
    :cond_0
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->getHeartbeatScheduler()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Lio/socket/engineio/client/Socket$15;

    invoke-direct {v1, p0, p0}, Lio/socket/engineio/client/Socket$15;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    iget-wide v2, p0, Lio/socket/engineio/client/Socket;->pingInterval:J

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, v2, v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->pingIntervalTimer:Ljava/util/concurrent/Future;

    return-void
.end method

.method private setTransport(Lio/socket/engineio/client/Transport;)V
    .locals 5

    .line 295
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    iget-object v3, p1, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "setting transport %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 298
    iget-object v2, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    if-eqz v2, :cond_0

    new-array v1, v1, [Ljava/lang/Object;

    .line 299
    iget-object v2, v2, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    aput-object v2, v1, v4

    const-string v2, "clearing existing transport %s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 300
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    invoke-virtual {v0}, Lio/socket/engineio/client/Transport;->off()Lio/socket/emitter/Emitter;

    .line 303
    :cond_0
    iput-object p1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    .line 305
    new-instance v0, Lio/socket/engineio/client/Socket$6;

    invoke-direct {v0, p0, p0}, Lio/socket/engineio/client/Socket$6;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    const-string v1, "drain"

    invoke-virtual {p1, v1, v0}, Lio/socket/engineio/client/Transport;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-result-object p1

    new-instance v0, Lio/socket/engineio/client/Socket$5;

    invoke-direct {v0, p0, p0}, Lio/socket/engineio/client/Socket$5;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    const-string v1, "packet"

    .line 310
    invoke-virtual {p1, v1, v0}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-result-object p1

    new-instance v0, Lio/socket/engineio/client/Socket$4;

    invoke-direct {v0, p0, p0}, Lio/socket/engineio/client/Socket$4;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    const-string v1, "error"

    .line 315
    invoke-virtual {p1, v1, v0}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-result-object p1

    new-instance v0, Lio/socket/engineio/client/Socket$3;

    invoke-direct {v0, p0, p0}, Lio/socket/engineio/client/Socket$3;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    const-string v1, "close"

    .line 320
    invoke-virtual {p1, v1, v0}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    return-void
.end method


# virtual methods
.method public close()Lio/socket/engineio/client/Socket;
    .locals 1

    .line 711
    new-instance v0, Lio/socket/engineio/client/Socket$20;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Socket$20;-><init>(Lio/socket/engineio/client/Socket;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-object p0
.end method

.method filterUpgrades(Ljava/util/List;)Ljava/util/List;
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

    .line 822
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 823
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

    .line 824
    iget-object v2, p0, Lio/socket/engineio/client/Socket;->transports:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 825
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public id()Ljava/lang/String;
    .locals 1

    .line 834
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->id:Ljava/lang/String;

    return-object v0
.end method

.method public open()Lio/socket/engineio/client/Socket;
    .locals 1

    .line 226
    new-instance v0, Lio/socket/engineio/client/Socket$2;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Socket$2;-><init>(Lio/socket/engineio/client/Socket;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-object p0
.end method

.method public send(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 642
    invoke-virtual {p0, p1, v0}, Lio/socket/engineio/client/Socket;->send(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method public send(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1

    .line 656
    new-instance v0, Lio/socket/engineio/client/Socket$17;

    invoke-direct {v0, p0, p1, p2}, Lio/socket/engineio/client/Socket$17;-><init>(Lio/socket/engineio/client/Socket;Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-void
.end method

.method public send([B)V
    .locals 1

    const/4 v0, 0x0

    .line 646
    invoke-virtual {p0, p1, v0}, Lio/socket/engineio/client/Socket;->send([BLjava/lang/Runnable;)V

    return-void
.end method

.method public send([BLjava/lang/Runnable;)V
    .locals 1

    .line 665
    new-instance v0, Lio/socket/engineio/client/Socket$18;

    invoke-direct {v0, p0, p1, p2}, Lio/socket/engineio/client/Socket$18;-><init>(Lio/socket/engineio/client/Socket;[BLjava/lang/Runnable;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-void
.end method

.method public write(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 621
    invoke-virtual {p0, p1, v0}, Lio/socket/engineio/client/Socket;->write(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method public write(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    .line 625
    invoke-virtual {p0, p1, p2}, Lio/socket/engineio/client/Socket;->send(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method public write([B)V
    .locals 1

    const/4 v0, 0x0

    .line 629
    invoke-virtual {p0, p1, v0}, Lio/socket/engineio/client/Socket;->write([BLjava/lang/Runnable;)V

    return-void
.end method

.method public write([BLjava/lang/Runnable;)V
    .locals 0

    .line 633
    invoke-virtual {p0, p1, p2}, Lio/socket/engineio/client/Socket;->send([BLjava/lang/Runnable;)V

    return-void
.end method
