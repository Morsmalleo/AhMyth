.class Lio/socket/engineio/client/transports/Polling$3;
.super Ljava/lang/Object;
.source "Polling.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/transports/Polling;->doClose()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/engineio/client/transports/Polling;

.field final synthetic val$self:Lio/socket/engineio/client/transports/Polling;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/transports/Polling;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/engineio/client/transports/Polling;

    .line 150
    iput-object p1, p0, Lio/socket/engineio/client/transports/Polling$3;->this$0:Lio/socket/engineio/client/transports/Polling;

    iput-object p2, p0, Lio/socket/engineio/client/transports/Polling$3;->val$self:Lio/socket/engineio/client/transports/Polling;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 4
    .param p1, "args"    # [Ljava/lang/Object;

    .line 153
    invoke-static {}, Lio/socket/engineio/client/transports/Polling;->access$100()Ljava/util/logging/Logger;

    move-result-object v0

    const-string v1, "writing close packet"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 154
    iget-object v0, p0, Lio/socket/engineio/client/transports/Polling$3;->val$self:Lio/socket/engineio/client/transports/Polling;

    const/4 v1, 0x1

    new-array v1, v1, [Lio/socket/engineio/parser/Packet;

    new-instance v2, Lio/socket/engineio/parser/Packet;

    const-string v3, "close"

    invoke-direct {v2, v3}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lio/socket/engineio/client/transports/Polling;->write([Lio/socket/engineio/parser/Packet;)V

    .line 155
    return-void
.end method
