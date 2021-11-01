.class public Lio/socket/engineio/client/transports/PollingXHR;
.super Lio/socket/engineio/client/transports/Polling;
.source "PollingXHR.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/engineio/client/transports/PollingXHR$Request;
    }
.end annotation


# static fields
.field private static final logger:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    const-class v0, Lio/socket/engineio/client/transports/PollingXHR;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/engineio/client/transports/PollingXHR;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lio/socket/engineio/client/Transport$Options;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lio/socket/engineio/client/transports/Polling;-><init>(Lio/socket/engineio/client/Transport$Options;)V

    return-void
.end method

.method static synthetic access$000(Lio/socket/engineio/client/transports/PollingXHR;Ljava/lang/String;Ljava/lang/Exception;)Lio/socket/engineio/client/Transport;
    .locals 0

    .line 19
    invoke-virtual {p0, p1, p2}, Lio/socket/engineio/client/transports/PollingXHR;->onError(Ljava/lang/String;Ljava/lang/Exception;)Lio/socket/engineio/client/Transport;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lio/socket/engineio/client/transports/PollingXHR;Ljava/lang/String;Ljava/lang/Exception;)Lio/socket/engineio/client/Transport;
    .locals 0

    .line 19
    invoke-virtual {p0, p1, p2}, Lio/socket/engineio/client/transports/PollingXHR;->onError(Ljava/lang/String;Ljava/lang/Exception;)Lio/socket/engineio/client/Transport;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200()Ljava/util/logging/Logger;
    .locals 1

    .line 19
    sget-object v0, Lio/socket/engineio/client/transports/PollingXHR;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method


# virtual methods
.method protected doPoll()V
    .locals 3

    .line 98
    sget-object v0, Lio/socket/engineio/client/transports/PollingXHR;->logger:Ljava/util/logging/Logger;

    const-string v1, "xhr poll"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 99
    invoke-virtual {p0}, Lio/socket/engineio/client/transports/PollingXHR;->request()Lio/socket/engineio/client/transports/PollingXHR$Request;

    move-result-object v0

    .line 101
    new-instance v1, Lio/socket/engineio/client/transports/PollingXHR$5;

    invoke-direct {v1, p0, p0}, Lio/socket/engineio/client/transports/PollingXHR$5;-><init>(Lio/socket/engineio/client/transports/PollingXHR;Lio/socket/engineio/client/transports/PollingXHR;)V

    const-string v2, "data"

    invoke-virtual {v0, v2, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 117
    new-instance v1, Lio/socket/engineio/client/transports/PollingXHR$6;

    invoke-direct {v1, p0, p0}, Lio/socket/engineio/client/transports/PollingXHR$6;-><init>(Lio/socket/engineio/client/transports/PollingXHR;Lio/socket/engineio/client/transports/PollingXHR;)V

    const-string v2, "error"

    invoke-virtual {v0, v2, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 129
    invoke-virtual {v0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->create()V

    return-void
.end method

.method protected doWrite([BLjava/lang/Runnable;)V
    .locals 2

    .line 65
    new-instance v0, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;

    invoke-direct {v0}, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;-><init>()V

    const-string v1, "POST"

    .line 66
    iput-object v1, v0, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->method:Ljava/lang/String;

    .line 67
    iput-object p1, v0, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->data:[B

    .line 68
    invoke-virtual {p0, v0}, Lio/socket/engineio/client/transports/PollingXHR;->request(Lio/socket/engineio/client/transports/PollingXHR$Request$Options;)Lio/socket/engineio/client/transports/PollingXHR$Request;

    move-result-object p1

    .line 70
    new-instance v0, Lio/socket/engineio/client/transports/PollingXHR$3;

    invoke-direct {v0, p0, p2}, Lio/socket/engineio/client/transports/PollingXHR$3;-><init>(Lio/socket/engineio/client/transports/PollingXHR;Ljava/lang/Runnable;)V

    const-string p2, "success"

    invoke-virtual {p1, p2, v0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 81
    new-instance p2, Lio/socket/engineio/client/transports/PollingXHR$4;

    invoke-direct {p2, p0, p0}, Lio/socket/engineio/client/transports/PollingXHR$4;-><init>(Lio/socket/engineio/client/transports/PollingXHR;Lio/socket/engineio/client/transports/PollingXHR;)V

    const-string v0, "error"

    invoke-virtual {p1, v0, p2}, Lio/socket/engineio/client/transports/PollingXHR$Request;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 93
    invoke-virtual {p1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->create()V

    return-void
.end method

.method protected request()Lio/socket/engineio/client/transports/PollingXHR$Request;
    .locals 1

    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, v0}, Lio/socket/engineio/client/transports/PollingXHR;->request(Lio/socket/engineio/client/transports/PollingXHR$Request$Options;)Lio/socket/engineio/client/transports/PollingXHR$Request;

    move-result-object v0

    return-object v0
.end method

.method protected request(Lio/socket/engineio/client/transports/PollingXHR$Request$Options;)Lio/socket/engineio/client/transports/PollingXHR$Request;
    .locals 3

    if-nez p1, :cond_0

    .line 33
    new-instance p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;

    invoke-direct {p1}, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;-><init>()V

    .line 35
    :cond_0
    invoke-virtual {p0}, Lio/socket/engineio/client/transports/PollingXHR;->uri()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->uri:Ljava/lang/String;

    .line 36
    iget-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR;->sslContext:Ljavax/net/ssl/SSLContext;

    iput-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->sslContext:Ljavax/net/ssl/SSLContext;

    .line 37
    iget-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    iput-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 38
    iget-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR;->proxy:Ljava/net/Proxy;

    iput-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->proxy:Ljava/net/Proxy;

    .line 40
    new-instance v0, Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-direct {v0, p1}, Lio/socket/engineio/client/transports/PollingXHR$Request;-><init>(Lio/socket/engineio/client/transports/PollingXHR$Request$Options;)V

    .line 43
    new-instance p1, Lio/socket/engineio/client/transports/PollingXHR$2;

    invoke-direct {p1, p0, p0}, Lio/socket/engineio/client/transports/PollingXHR$2;-><init>(Lio/socket/engineio/client/transports/PollingXHR;Lio/socket/engineio/client/transports/PollingXHR;)V

    const-string v1, "requestHeaders"

    invoke-virtual {v0, v1, p1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-result-object p1

    new-instance v1, Lio/socket/engineio/client/transports/PollingXHR$1;

    invoke-direct {v1, p0, p0}, Lio/socket/engineio/client/transports/PollingXHR$1;-><init>(Lio/socket/engineio/client/transports/PollingXHR;Lio/socket/engineio/client/transports/PollingXHR;)V

    const-string v2, "responseHeaders"

    .line 49
    invoke-virtual {p1, v2, v1}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    return-object v0
.end method
