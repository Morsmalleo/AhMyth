.class final Lio/socket/client/Socket$1;
.super Ljava/util/HashMap;
.source "Socket.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/client/Socket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 2

    .line 65
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const/4 v0, 0x1

    .line 66
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "connect"

    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "connect_error"

    .line 67
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "connect_timeout"

    .line 68
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "connecting"

    .line 69
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "disconnect"

    .line 70
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "error"

    .line 71
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "reconnect"

    .line 72
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "reconnect_attempt"

    .line 73
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "reconnect_failed"

    .line 74
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "reconnect_error"

    .line 75
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "reconnecting"

    .line 76
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "ping"

    .line 77
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pong"

    .line 78
    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
