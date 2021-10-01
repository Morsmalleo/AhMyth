.class Lio/socket/client/Socket$3;
.super Ljava/lang/Object;
.source "Socket.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Socket;->open()Lio/socket/client/Socket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/client/Socket;


# direct methods
.method constructor <init>(Lio/socket/client/Socket;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/client/Socket;

    .line 116
    iput-object p1, p0, Lio/socket/client/Socket$3;->this$0:Lio/socket/client/Socket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 119
    iget-object v0, p0, Lio/socket/client/Socket$3;->this$0:Lio/socket/client/Socket;

    invoke-static {v0}, Lio/socket/client/Socket;->access$200(Lio/socket/client/Socket;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lio/socket/client/Socket$3;->this$0:Lio/socket/client/Socket;

    invoke-static {v0}, Lio/socket/client/Socket;->access$500(Lio/socket/client/Socket;)Lio/socket/client/Manager;

    move-result-object v0

    invoke-virtual {v0}, Lio/socket/client/Manager;->isReconnecting()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 121
    :cond_0
    iget-object v0, p0, Lio/socket/client/Socket$3;->this$0:Lio/socket/client/Socket;

    invoke-static {v0}, Lio/socket/client/Socket;->access$600(Lio/socket/client/Socket;)V

    .line 122
    iget-object v0, p0, Lio/socket/client/Socket$3;->this$0:Lio/socket/client/Socket;

    invoke-static {v0}, Lio/socket/client/Socket;->access$500(Lio/socket/client/Socket;)Lio/socket/client/Manager;

    move-result-object v0

    invoke-virtual {v0}, Lio/socket/client/Manager;->open()Lio/socket/client/Manager;

    .line 123
    sget-object v0, Lio/socket/client/Manager$ReadyState;->OPEN:Lio/socket/client/Manager$ReadyState;

    iget-object v1, p0, Lio/socket/client/Socket$3;->this$0:Lio/socket/client/Socket;

    invoke-static {v1}, Lio/socket/client/Socket;->access$500(Lio/socket/client/Socket;)Lio/socket/client/Manager;

    move-result-object v1

    iget-object v1, v1, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lio/socket/client/Socket$3;->this$0:Lio/socket/client/Socket;

    invoke-static {v0}, Lio/socket/client/Socket;->access$000(Lio/socket/client/Socket;)V

    .line 124
    :cond_1
    return-void

    .line 119
    :cond_2
    :goto_0
    return-void
.end method
