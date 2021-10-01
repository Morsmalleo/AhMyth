.class Lio/socket/client/Manager$1$4;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/socket/client/Manager$1;

.field final synthetic val$openSub:Lio/socket/client/On$Handle;

.field final synthetic val$socket:Lio/socket/engineio/client/Socket;

.field final synthetic val$timeout:J


# direct methods
.method constructor <init>(Lio/socket/client/Manager$1;JLio/socket/client/On$Handle;Lio/socket/engineio/client/Socket;)V
    .locals 0
    .param p1, "this$1"    # Lio/socket/client/Manager$1;

    .line 275
    iput-object p1, p0, Lio/socket/client/Manager$1$4;->this$1:Lio/socket/client/Manager$1;

    iput-wide p2, p0, Lio/socket/client/Manager$1$4;->val$timeout:J

    iput-object p4, p0, Lio/socket/client/Manager$1$4;->val$openSub:Lio/socket/client/On$Handle;

    iput-object p5, p0, Lio/socket/client/Manager$1$4;->val$socket:Lio/socket/engineio/client/Socket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 278
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    iget-wide v3, p0, Lio/socket/client/Manager$1$4;->val$timeout:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "connect attempt timed out after %d"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 279
    iget-object v0, p0, Lio/socket/client/Manager$1$4;->val$openSub:Lio/socket/client/On$Handle;

    invoke-interface {v0}, Lio/socket/client/On$Handle;->destroy()V

    .line 280
    iget-object v0, p0, Lio/socket/client/Manager$1$4;->val$socket:Lio/socket/engineio/client/Socket;

    invoke-virtual {v0}, Lio/socket/engineio/client/Socket;->close()Lio/socket/engineio/client/Socket;

    .line 281
    iget-object v0, p0, Lio/socket/client/Manager$1$4;->val$socket:Lio/socket/engineio/client/Socket;

    new-array v1, v1, [Ljava/lang/Object;

    new-instance v2, Lio/socket/client/SocketIOException;

    const-string v3, "timeout"

    invoke-direct {v2, v3}, Lio/socket/client/SocketIOException;-><init>(Ljava/lang/String;)V

    aput-object v2, v1, v4

    const-string v2, "error"

    invoke-virtual {v0, v2, v1}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 282
    return-void
.end method
