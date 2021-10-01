.class public abstract Lio/socket/engineio/client/Transport;
.super Lio/socket/emitter/Emitter;
.source "Transport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/engineio/client/Transport$Options;,
        Lio/socket/engineio/client/Transport$ReadyState;
    }
.end annotation


# static fields
.field public static final EVENT_CLOSE:Ljava/lang/String; = "close"

.field public static final EVENT_DRAIN:Ljava/lang/String; = "drain"

.field public static final EVENT_ERROR:Ljava/lang/String; = "error"

.field public static final EVENT_OPEN:Ljava/lang/String; = "open"

.field public static final EVENT_PACKET:Ljava/lang/String; = "packet"

.field public static final EVENT_REQUEST_HEADERS:Ljava/lang/String; = "requestHeaders"

.field public static final EVENT_RESPONSE_HEADERS:Ljava/lang/String; = "responseHeaders"


# instance fields
.field protected callFactory:Lokhttp3/Call$Factory;

.field protected extraHeaders:Ljava/util/Map;
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

.field protected hostname:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field protected path:Ljava/lang/String;

.field protected port:I

.field public query:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected readyState:Lio/socket/engineio/client/Transport$ReadyState;

.field protected secure:Z

.field protected socket:Lio/socket/engineio/client/Socket;

.field protected timestampParam:Ljava/lang/String;

.field protected timestampRequests:Z

.field protected webSocketFactory:Lokhttp3/WebSocket$Factory;

.field public writable:Z


# direct methods
.method public constructor <init>(Lio/socket/engineio/client/Transport$Options;)V
    .locals 1
    .param p1, "opts"    # Lio/socket/engineio/client/Transport$Options;

    .line 49
    invoke-direct {p0}, Lio/socket/emitter/Emitter;-><init>()V

    .line 50
    iget-object v0, p1, Lio/socket/engineio/client/Transport$Options;->path:Ljava/lang/String;

    iput-object v0, p0, Lio/socket/engineio/client/Transport;->path:Ljava/lang/String;

    .line 51
    iget-object v0, p1, Lio/socket/engineio/client/Transport$Options;->hostname:Ljava/lang/String;

    iput-object v0, p0, Lio/socket/engineio/client/Transport;->hostname:Ljava/lang/String;

    .line 52
    iget v0, p1, Lio/socket/engineio/client/Transport$Options;->port:I

    iput v0, p0, Lio/socket/engineio/client/Transport;->port:I

    .line 53
    iget-boolean v0, p1, Lio/socket/engineio/client/Transport$Options;->secure:Z

    iput-boolean v0, p0, Lio/socket/engineio/client/Transport;->secure:Z

    .line 54
    iget-object v0, p1, Lio/socket/engineio/client/Transport$Options;->query:Ljava/util/Map;

    iput-object v0, p0, Lio/socket/engineio/client/Transport;->query:Ljava/util/Map;

    .line 55
    iget-object v0, p1, Lio/socket/engineio/client/Transport$Options;->timestampParam:Ljava/lang/String;

    iput-object v0, p0, Lio/socket/engineio/client/Transport;->timestampParam:Ljava/lang/String;

    .line 56
    iget-boolean v0, p1, Lio/socket/engineio/client/Transport$Options;->timestampRequests:Z

    iput-boolean v0, p0, Lio/socket/engineio/client/Transport;->timestampRequests:Z

    .line 57
    iget-object v0, p1, Lio/socket/engineio/client/Transport$Options;->socket:Lio/socket/engineio/client/Socket;

    iput-object v0, p0, Lio/socket/engineio/client/Transport;->socket:Lio/socket/engineio/client/Socket;

    .line 58
    iget-object v0, p1, Lio/socket/engineio/client/Transport$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    iput-object v0, p0, Lio/socket/engineio/client/Transport;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    .line 59
    iget-object v0, p1, Lio/socket/engineio/client/Transport$Options;->callFactory:Lokhttp3/Call$Factory;

    iput-object v0, p0, Lio/socket/engineio/client/Transport;->callFactory:Lokhttp3/Call$Factory;

    .line 60
    iget-object v0, p1, Lio/socket/engineio/client/Transport$Options;->extraHeaders:Ljava/util/Map;

    iput-object v0, p0, Lio/socket/engineio/client/Transport;->extraHeaders:Ljava/util/Map;

    .line 61
    return-void
.end method


# virtual methods
.method public close()Lio/socket/engineio/client/Transport;
    .locals 1

    .line 84
    new-instance v0, Lio/socket/engineio/client/Transport$2;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Transport$2;-><init>(Lio/socket/engineio/client/Transport;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 93
    return-object p0
.end method

.method protected abstract doClose()V
.end method

.method protected abstract doOpen()V
.end method

.method protected onClose()V
    .locals 2

    .line 128
    sget-object v0, Lio/socket/engineio/client/Transport$ReadyState;->CLOSED:Lio/socket/engineio/client/Transport$ReadyState;

    iput-object v0, p0, Lio/socket/engineio/client/Transport;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    .line 129
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "close"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Transport;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 130
    return-void
.end method

.method protected onData(Ljava/lang/String;)V
    .locals 1
    .param p1, "data"    # Ljava/lang/String;

    .line 116
    invoke-static {p1}, Lio/socket/engineio/parser/Parser;->decodePacket(Ljava/lang/String;)Lio/socket/engineio/parser/Packet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/socket/engineio/client/Transport;->onPacket(Lio/socket/engineio/parser/Packet;)V

    .line 117
    return-void
.end method

.method protected onData([B)V
    .locals 1
    .param p1, "data"    # [B

    .line 120
    invoke-static {p1}, Lio/socket/engineio/parser/Parser;->decodePacket([B)Lio/socket/engineio/parser/Packet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/socket/engineio/client/Transport;->onPacket(Lio/socket/engineio/parser/Packet;)V

    .line 121
    return-void
.end method

.method protected onError(Ljava/lang/String;Ljava/lang/Exception;)Lio/socket/engineio/client/Transport;
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "desc"    # Ljava/lang/Exception;

    .line 65
    new-instance v0, Lio/socket/engineio/client/EngineIOException;

    invoke-direct {v0, p1, p2}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    .local v0, "err":Ljava/lang/Exception;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v2, "error"

    invoke-virtual {p0, v2, v1}, Lio/socket/engineio/client/Transport;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 67
    return-object p0
.end method

.method protected onOpen()V
    .locals 2

    .line 110
    sget-object v0, Lio/socket/engineio/client/Transport$ReadyState;->OPEN:Lio/socket/engineio/client/Transport$ReadyState;

    iput-object v0, p0, Lio/socket/engineio/client/Transport;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    .line 111
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/socket/engineio/client/Transport;->writable:Z

    .line 112
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "open"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Transport;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 113
    return-void
.end method

.method protected onPacket(Lio/socket/engineio/parser/Packet;)V
    .locals 2
    .param p1, "packet"    # Lio/socket/engineio/parser/Packet;

    .line 124
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "packet"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/Transport;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 125
    return-void
.end method

.method public open()Lio/socket/engineio/client/Transport;
    .locals 1

    .line 71
    new-instance v0, Lio/socket/engineio/client/Transport$1;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Transport$1;-><init>(Lio/socket/engineio/client/Transport;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 80
    return-object p0
.end method

.method public send([Lio/socket/engineio/parser/Packet;)V
    .locals 1
    .param p1, "packets"    # [Lio/socket/engineio/parser/Packet;

    .line 97
    new-instance v0, Lio/socket/engineio/client/Transport$3;

    invoke-direct {v0, p0, p1}, Lio/socket/engineio/client/Transport$3;-><init>(Lio/socket/engineio/client/Transport;[Lio/socket/engineio/parser/Packet;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 107
    return-void
.end method

.method protected abstract write([Lio/socket/engineio/parser/Packet;)V
.end method
