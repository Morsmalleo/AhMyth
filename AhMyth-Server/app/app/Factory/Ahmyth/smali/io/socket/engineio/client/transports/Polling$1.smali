.class Lio/socket/engineio/client/transports/Polling$1;
.super Ljava/lang/Object;
.source "Polling.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/transports/Polling;->pause(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/engineio/client/transports/Polling;

.field final synthetic val$onPause:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/transports/Polling;Ljava/lang/Runnable;)V
    .locals 0

    .line 39
    iput-object p1, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    iput-object p2, p0, Lio/socket/engineio/client/transports/Polling$1;->val$onPause:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 42
    iget-object v0, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    .line 44
    sget-object v1, Lio/socket/engineio/client/Transport$ReadyState;->PAUSED:Lio/socket/engineio/client/Transport$ReadyState;

    invoke-static {v0, v1}, Lio/socket/engineio/client/transports/Polling;->access$002(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/Transport$ReadyState;)Lio/socket/engineio/client/Transport$ReadyState;

    .line 46
    new-instance v1, Lio/socket/engineio/client/transports/Polling$1$1;

    invoke-direct {v1, p0, v0}, Lio/socket/engineio/client/transports/Polling$1$1;-><init>(Lio/socket/engineio/client/transports/Polling$1;Lio/socket/engineio/client/transports/Polling;)V

    .line 55
    iget-object v0, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    invoke-static {v0}, Lio/socket/engineio/client/transports/Polling;->access$300(Lio/socket/engineio/client/transports/Polling;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    iget-boolean v0, v0, Lio/socket/engineio/client/transports/Polling;->writable:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 86
    :cond_0
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    new-array v2, v0, [I

    const/4 v3, 0x0

    aput v3, v2, v3

    .line 58
    iget-object v4, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    invoke-static {v4}, Lio/socket/engineio/client/transports/Polling;->access$300(Lio/socket/engineio/client/transports/Polling;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 59
    invoke-static {}, Lio/socket/engineio/client/transports/Polling;->access$100()Ljava/util/logging/Logger;

    move-result-object v4

    const-string v5, "we are currently polling - waiting to pause"

    invoke-virtual {v4, v5}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 60
    aget v4, v2, v3

    add-int/2addr v4, v0

    aput v4, v2, v3

    .line 61
    iget-object v4, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    new-instance v5, Lio/socket/engineio/client/transports/Polling$1$2;

    invoke-direct {v5, p0, v2, v1}, Lio/socket/engineio/client/transports/Polling$1$2;-><init>(Lio/socket/engineio/client/transports/Polling$1;[ILjava/lang/Runnable;)V

    const-string v6, "pollComplete"

    invoke-virtual {v4, v6, v5}, Lio/socket/engineio/client/transports/Polling;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 72
    :cond_2
    iget-object v4, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    iget-boolean v4, v4, Lio/socket/engineio/client/transports/Polling;->writable:Z

    if-nez v4, :cond_3

    .line 73
    invoke-static {}, Lio/socket/engineio/client/transports/Polling;->access$100()Ljava/util/logging/Logger;

    move-result-object v4

    const-string v5, "we are currently writing - waiting to pause"

    invoke-virtual {v4, v5}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 74
    aget v4, v2, v3

    add-int/2addr v4, v0

    aput v4, v2, v3

    .line 75
    iget-object v0, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    new-instance v3, Lio/socket/engineio/client/transports/Polling$1$3;

    invoke-direct {v3, p0, v2, v1}, Lio/socket/engineio/client/transports/Polling$1$3;-><init>(Lio/socket/engineio/client/transports/Polling$1;[ILjava/lang/Runnable;)V

    const-string v1, "drain"

    invoke-virtual {v0, v1, v3}, Lio/socket/engineio/client/transports/Polling;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    :cond_3
    :goto_1
    return-void
.end method
