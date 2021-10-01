.class Lio/socket/engineio/client/transports/WebSocket$2;
.super Ljava/lang/Object;
.source "WebSocket.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/transports/WebSocket;->write([Lio/socket/engineio/parser/Packet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/engineio/client/transports/WebSocket;

.field final synthetic val$self:Lio/socket/engineio/client/transports/WebSocket;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/transports/WebSocket;Lio/socket/engineio/client/transports/WebSocket;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/engineio/client/transports/WebSocket;

    .line 120
    iput-object p1, p0, Lio/socket/engineio/client/transports/WebSocket$2;->this$0:Lio/socket/engineio/client/transports/WebSocket;

    iput-object p2, p0, Lio/socket/engineio/client/transports/WebSocket$2;->val$self:Lio/socket/engineio/client/transports/WebSocket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 125
    new-instance v0, Lio/socket/engineio/client/transports/WebSocket$2$1;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/transports/WebSocket$2$1;-><init>(Lio/socket/engineio/client/transports/WebSocket$2;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->nextTick(Ljava/lang/Runnable;)V

    .line 132
    return-void
.end method
