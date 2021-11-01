.class Lio/socket/engineio/client/transports/WebSocket$1;
.super Ljava/lang/Object;
.source "WebSocket.java"

# interfaces
.implements Lokhttp3/Authenticator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/transports/WebSocket;->doOpen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/engineio/client/transports/WebSocket;

.field final synthetic val$credentials:Ljava/lang/String;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/transports/WebSocket;Ljava/lang/String;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lio/socket/engineio/client/transports/WebSocket$1;->this$0:Lio/socket/engineio/client/transports/WebSocket;

    iput-object p2, p0, Lio/socket/engineio/client/transports/WebSocket$1;->val$credentials:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public authenticate(Lokhttp3/Route;Lokhttp3/Response;)Lokhttp3/Request;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    invoke-virtual {p2}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object p1

    iget-object p2, p0, Lio/socket/engineio/client/transports/WebSocket$1;->val$credentials:Ljava/lang/String;

    const-string v0, "Proxy-Authorization"

    .line 65
    invoke-virtual {p1, v0, p2}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p1

    .line 66
    invoke-virtual {p1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p1

    return-object p1
.end method
