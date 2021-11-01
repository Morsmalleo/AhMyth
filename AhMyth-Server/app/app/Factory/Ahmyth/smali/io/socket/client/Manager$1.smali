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

    .line 250
    iput-object p1, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    iput-object p2, p0, Lio/socket/client/Manager$1;->val$fn:Lio/socket/client/Manager$OpenCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .line 253
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    iget-object v3, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    iget-object v3, v3, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "readyState %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 254
    iget-object v0, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    iget-object v0, v0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    sget-object v2, Lio/socket/client/Manager$ReadyState;->OPEN:Lio/socket/client/Manager$ReadyState;

    if-eq v0, v2, :cond_2

    iget-object v0, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    iget-object v0, v0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    sget-object v2, Lio/socket/client/Manager$ReadyState;->OPENING:Lio/socket/client/Manager$ReadyState;

    if-ne v0, v2, :cond_0

    goto/16 :goto_0

    .line 256
    :cond_0
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    new-array v2, v1, [Ljava/lang/Object;

    iget-object v3, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v3}, Lio/socket/client/Manager;->access$100(Lio/socket/client/Manager;)Ljava/net/URI;

    move-result-object v3

    aput-object v3, v2, v4

    const-string v3, "opening %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 257
    iget-object v0, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    new-instance v2, Lio/socket/client/Manager$Engine;

    iget-object v3, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v3}, Lio/socket/client/Manager;->access$100(Lio/socket/client/Manager;)Ljava/net/URI;

    move-result-object v3

    iget-object v5, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v5}, Lio/socket/client/Manager;->access$200(Lio/socket/client/Manager;)Lio/socket/client/Manager$Options;

    move-result-object v5

    invoke-direct {v2, v3, v5}, Lio/socket/client/Manager$Engine;-><init>(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)V

    iput-object v2, v0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    .line 258
    iget-object v0, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    iget-object v10, v0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    .line 259
    iget-object v11, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    .line 260
    sget-object v0, Lio/socket/client/Manager$ReadyState;->OPENING:Lio/socket/client/Manager$ReadyState;

    iput-object v0, v11, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    .line 261
    iget-object v0, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v0, v4}, Lio/socket/client/Manager;->access$302(Lio/socket/client/Manager;Z)Z

    .line 264
    new-instance v0, Lio/socket/client/Manager$1$1;

    invoke-direct {v0, p0, v11}, Lio/socket/client/Manager$1$1;-><init>(Lio/socket/client/Manager$1;Lio/socket/client/Manager;)V

    const-string v2, "transport"

    invoke-virtual {v10, v2, v0}, Lio/socket/engineio/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 271
    new-instance v0, Lio/socket/client/Manager$1$2;

    invoke-direct {v0, p0, v11}, Lio/socket/client/Manager$1$2;-><init>(Lio/socket/client/Manager$1;Lio/socket/client/Manager;)V

    const-string v2, "open"

    invoke-static {v10, v2, v0}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v0

    .line 279
    new-instance v2, Lio/socket/client/Manager$1$3;

    invoke-direct {v2, p0, v11}, Lio/socket/client/Manager$1$3;-><init>(Lio/socket/client/Manager$1;Lio/socket/client/Manager;)V

    const-string v3, "error"

    invoke-static {v10, v3, v2}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    .line 298
    iget-object v3, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v3}, Lio/socket/client/Manager;->access$800(Lio/socket/client/Manager;)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v3, v5, v7

    if-ltz v3, :cond_1

    .line 299
    iget-object v3, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v3}, Lio/socket/client/Manager;->access$800(Lio/socket/client/Manager;)J

    move-result-wide v12

    .line 300
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v1, v4

    const-string v4, "connection attempt will timeout after %d"

    invoke-static {v4, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 302
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    .line 303
    new-instance v3, Lio/socket/client/Manager$1$4;

    move-object v5, v3

    move-object v6, p0

    move-wide v7, v12

    move-object v9, v0

    invoke-direct/range {v5 .. v11}, Lio/socket/client/Manager$1$4;-><init>(Lio/socket/client/Manager$1;JLio/socket/client/On$Handle;Lio/socket/engineio/client/Socket;Lio/socket/client/Manager;)V

    invoke-virtual {v1, v3, v12, v13}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 319
    iget-object v3, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v3}, Lio/socket/client/Manager;->access$900(Lio/socket/client/Manager;)Ljava/util/Queue;

    move-result-object v3

    new-instance v4, Lio/socket/client/Manager$1$5;

    invoke-direct {v4, p0, v1}, Lio/socket/client/Manager$1$5;-><init>(Lio/socket/client/Manager$1;Ljava/util/Timer;)V

    invoke-interface {v3, v4}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 327
    :cond_1
    iget-object v1, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v1}, Lio/socket/client/Manager;->access$900(Lio/socket/client/Manager;)Ljava/util/Queue;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 328
    iget-object v0, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    invoke-static {v0}, Lio/socket/client/Manager;->access$900(Lio/socket/client/Manager;)Ljava/util/Queue;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 330
    iget-object v0, p0, Lio/socket/client/Manager$1;->this$0:Lio/socket/client/Manager;

    iget-object v0, v0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    invoke-virtual {v0}, Lio/socket/engineio/client/Socket;->open()Lio/socket/engineio/client/Socket;

    :cond_2
    :goto_0
    return-void
.end method
