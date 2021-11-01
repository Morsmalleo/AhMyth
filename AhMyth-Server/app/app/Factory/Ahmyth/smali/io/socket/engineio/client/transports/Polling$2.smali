.class Lio/socket/engineio/client/transports/Polling$2;
.super Ljava/lang/Object;
.source "Polling.java"

# interfaces
.implements Lio/socket/engineio/parser/Parser$DecodePayloadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/transports/Polling;->_onData(Ljava/lang/Object;)V
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

    .line 112
    iput-object p1, p0, Lio/socket/engineio/client/transports/Polling$2;->this$0:Lio/socket/engineio/client/transports/Polling;

    iput-object p2, p0, Lio/socket/engineio/client/transports/Polling$2;->val$self:Lio/socket/engineio/client/transports/Polling;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lio/socket/engineio/parser/Packet;II)Z
    .locals 0

    .line 115
    iget-object p2, p0, Lio/socket/engineio/client/transports/Polling$2;->val$self:Lio/socket/engineio/client/transports/Polling;

    invoke-static {p2}, Lio/socket/engineio/client/transports/Polling;->access$400(Lio/socket/engineio/client/transports/Polling;)Lio/socket/engineio/client/Transport$ReadyState;

    move-result-object p2

    sget-object p3, Lio/socket/engineio/client/Transport$ReadyState;->OPENING:Lio/socket/engineio/client/Transport$ReadyState;

    if-ne p2, p3, :cond_0

    .line 116
    iget-object p2, p0, Lio/socket/engineio/client/transports/Polling$2;->val$self:Lio/socket/engineio/client/transports/Polling;

    invoke-static {p2}, Lio/socket/engineio/client/transports/Polling;->access$500(Lio/socket/engineio/client/transports/Polling;)V

    .line 119
    :cond_0
    iget-object p2, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    const-string p3, "close"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 120
    iget-object p1, p0, Lio/socket/engineio/client/transports/Polling$2;->val$self:Lio/socket/engineio/client/transports/Polling;

    invoke-static {p1}, Lio/socket/engineio/client/transports/Polling;->access$600(Lio/socket/engineio/client/transports/Polling;)V

    const/4 p1, 0x0

    return p1

    .line 124
    :cond_1
    iget-object p2, p0, Lio/socket/engineio/client/transports/Polling$2;->val$self:Lio/socket/engineio/client/transports/Polling;

    invoke-static {p2, p1}, Lio/socket/engineio/client/transports/Polling;->access$700(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/parser/Packet;)V

    const/4 p1, 0x1

    return p1
.end method
