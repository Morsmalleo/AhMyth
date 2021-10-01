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

    .line 44
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 45
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "connect"

    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    const-string v1, "connect_error"

    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    const-string v1, "disconnect"

    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    const-string v1, "disconnecting"

    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    const-string v1, "newListener"

    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    const-string v1, "removeListener"

    invoke-virtual {p0, v1, v0}, Lio/socket/client/Socket$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    return-void
.end method
