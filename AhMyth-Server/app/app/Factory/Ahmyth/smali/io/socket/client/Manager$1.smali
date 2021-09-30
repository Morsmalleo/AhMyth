.class Lio/socket/client/Manager$1;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager;->open(Lio/socket/client/Manager$OpenCallback;)Lio/socket/client/Manager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/client/Manager;

.field final synthetic val$fn:Lio/socket/client/Manager$OpenCallback;


# direct methods
.method constructor <init>(Lio/socket/client/Manager;Lio/socket/client/Manager$OpenCallback;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/client/Manager;

    .line 222
    iput-object p1, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    iput-object p2, p0, Lio/socket/client/Manager$1;->val$fn:Lio/socket/client/Manager$OpenCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 225
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 226
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    new-array v3, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    iget-object v4, v4, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    aput-object v4, v3, v2

    const-string v4, "readyState %s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 228
    :cond_0
    iget-object v0, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    iget-object v0, v0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    sget-object v3, Lio/socket/client/Manager$ReadyState;->OPEN:Lio/socket/client/Manager$ReadyState;

    if-eq v0, v3, :cond_5

    iget-object v0, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    iget-object v0, v0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    sget-object v3, Lio/socket/client/Manager$ReadyState;->OPENING:Lio/socket/client/Manager$ReadyState;

    if-ne v0, v3, :cond_1

    goto/16 :goto_0

    .line 230
    :cond_1
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 231
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    new-array v3, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v4}, Lio/socket/client/Manager;->access$100(Lio/socket/client/Manager;)Ljava/net/URI;

    move-result-object v4

    aput-object v4, v3, v2

    const-string v4, "opening %s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 233
    :cond_2
    iget-object v0, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    new-instance v3, Lio/socket/client/Manager$Engine;

    iget-object v4, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v4}, Lio/socket/client/Manager;->access$100(Lio/socket/client/Manager;)Ljava/net/URI;

    move-result-object v4

    iget-object v5, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v5}, Lio/socket/client/Manager;->access$200(Lio/socket/client/Manager;)Lio/socket/client/Manager$Options;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lio/socket/client/Manager$Engine;-><init>(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)V

    iput-object v3, v0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    .line 234
    iget-object v0, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    iget-object v0, v0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    .line 235
    .local v0, "socket":Lio/socket/engineio/client/Socket;
    iget-object v9, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    .line 236
    .local v9, "self":Lio/socket/client/Manager;
    iget-object v3, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    sget-object v4, Lio/socket/client/Manager$ReadyState;->OPENING:Lio/socket/client/Manager$ReadyState;

    iput-object v4, v3, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    .line 237
    iget-object v3, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v3, v2}, Lio/socket/client/Manager;->access$302(Lio/socket/client/Manager;Z)Z

    .line 240
    new-instance v3, Lio/socket/client/Manager$1$1;

    invoke-direct {v3, p0, v9}, Lio/socket/client/Manager$1$1;-><init>(Lio/socket/client/Manager$1;Lio/socket/client/Manager;)V

    const-string v4, "transport"

    invoke-virtual {v0, v4, v3}, Lio/socket/engineio/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 247
    new-instance v3, Lio/socket/client/Manager$1$2;

    invoke-direct {v3, p0, v9}, Lio/socket/client/Manager$1$2;-><init>(Lio/socket/client/Manager$1;Lio/socket/client/Manager;)V

    const-string v4, "open"

    invoke-static {v0, v4, v3}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v10

    .line 255
    .local v10, "openSub":Lio/socket/client/On$Handle;
    new-instance v3, Lio/socket/client/Manager$1$3;

    invoke-direct {v3, p0, v9}, Lio/socket/client/Manager$1$3;-><init>(Lio/socket/client/Manager$1;Lio/socket/client/Manager;)V

    const-string v4, "error"

    invoke-static {v0, v4, v3}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v11

    .line 274
    .local v11, "errorSub":Lio/socket/client/On$Handle;
    iget-object v3, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v3}, Lio/socket/client/Manager;->access$700(Lio/socket/client/Manager;)J

    move-result-wide v12

    .line 275
    .local v12, "timeout":J
    new-instance v14, Lio/socket/client/Manager$1$4;

    move-object v3, v14

    move-object v4, p0

    move-wide v5, v12

    move-object v7, v10

    move-object v8, v0

    invoke-direct/range {v3 .. v8}, Lio/socket/client/Manager$1$4;-><init>(Lio/socket/client/Manager$1;JLio/socket/client/On$Handle;Lio/socket/engineio/client/Socket;)V

    .line 285
    .local v3, "onTimeout":Ljava/lang/Runnable;
    const-wide/16 v4, 0x0

    cmp-long v6, v12, v4

    if-nez v6, :cond_3

    .line 286
    invoke-static {v3}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 287
    return-void

    .line 288
    :cond_3
    iget-object v6, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v6}, Lio/socket/client/Manager;->access$700(Lio/socket/client/Manager;)J

    move-result-wide v6

    cmp-long v8, v6, v4

    if-lez v8, :cond_4

    .line 289
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v4

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v1, v2

    const-string v2, "connection attempt will timeout after %d"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 291
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    .line 292
    .local v1, "timer":Ljava/util/Timer;
    new-instance v2, Lio/socket/client/Manager$1$5;

    invoke-direct {v2, p0, v3}, Lio/socket/client/Manager$1$5;-><init>(Lio/socket/client/Manager$1;Ljava/lang/Runnable;)V

    invoke-virtual {v1, v2, v12, v13}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 299
    iget-object v2, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v2}, Lio/socket/client/Manager;->access$800(Lio/socket/client/Manager;)Ljava/util/Queue;

    move-result-object v2

    new-instance v4, Lio/socket/client/Manager$1$6;

    invoke-direct {v4, p0, v1}, Lio/socket/client/Manager$1$6;-><init>(Lio/socket/client/Manager$1;Ljava/util/Timer;)V

    invoke-interface {v2, v4}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 307
    .end local v1    # "timer":Ljava/util/Timer;
    :cond_4
    iget-object v1, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v1}, Lio/socket/client/Manager;->access$800(Lio/socket/client/Manager;)Ljava/util/Queue;

    move-result-object v1

    invoke-interface {v1, v10}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 308
    iget-object v1, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v1}, Lio/socket/client/Manager;->access$800(Lio/socket/client/Manager;)Ljava/util/Queue;

    move-result-object v1

    invoke-interface {v1, v11}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 310
    iget-object v1, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    iget-object v1, v1, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    invoke-virtual {v1}, Lio/socket/engineio/client/Socket;->open()Lio/socket/engineio/client/Socket;

    .line 311
    return-void

    .line 228
    .end local v0    # "socket":Lio/socket/engineio/client/Socket;
    .end local v3    # "onTimeout":Ljava/lang/Runnable;
    .end local v9    # "self":Lio/socket/client/Manager;
    .end local v10    # "openSub":Lio/socket/client/On$Handle;
    .end local v11    # "errorSub":Lio/socket/client/On$Handle;
    .end local v12    # "timeout":J
    :cond_5
    :goto_0
    return-void
.end method
