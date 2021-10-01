.class Lio/socket/client/Manager$7$1$1;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Lio/socket/client/Manager$OpenCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager$7$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lio/socket/client/Manager$7$1;


# direct methods
.method constructor <init>(Lio/socket/client/Manager$7$1;)V
    .locals 0
    .param p1, "this$2"    # Lio/socket/client/Manager$7$1;

    .line 510
    iput-object p1, p0, Lio/socket/client/Manager$7$1$1;->this$2:Lio/socket/client/Manager$7$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "err"    # Ljava/lang/Exception;

    .line 513
    if-eqz p1, :cond_0

    .line 514
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    const-string v1, "reconnect attempt error"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 515
    iget-object v0, p0, Lio/socket/client/Manager$7$1$1;->this$2:Lio/socket/client/Manager$7$1;

    iget-object v0, v0, Lio/socket/client/Manager$7$1;->this$1:Lio/socket/client/Manager$7;

    iget-object v0, v0, Lio/socket/client/Manager$7;->val$self:Lio/socket/client/Manager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lio/socket/client/Manager;->access$1602(Lio/socket/client/Manager;Z)Z

    .line 516
    iget-object v0, p0, Lio/socket/client/Manager$7$1$1;->this$2:Lio/socket/client/Manager$7$1;

    iget-object v0, v0, Lio/socket/client/Manager$7$1;->this$1:Lio/socket/client/Manager$7;

    iget-object v0, v0, Lio/socket/client/Manager$7;->val$self:Lio/socket/client/Manager;

    invoke-static {v0}, Lio/socket/client/Manager;->access$1700(Lio/socket/client/Manager;)V

    .line 517
    iget-object v0, p0, Lio/socket/client/Manager$7$1$1;->this$2:Lio/socket/client/Manager$7$1;

    iget-object v0, v0, Lio/socket/client/Manager$7$1;->this$1:Lio/socket/client/Manager$7;

    iget-object v0, v0, Lio/socket/client/Manager$7;->val$self:Lio/socket/client/Manager;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v1

    const-string v1, "reconnect_error"

    invoke-virtual {v0, v1, v2}, Lio/socket/client/Manager;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 519
    :cond_0
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    const-string v1, "reconnect success"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 520
    iget-object v0, p0, Lio/socket/client/Manager$7$1$1;->this$2:Lio/socket/client/Manager$7$1;

    iget-object v0, v0, Lio/socket/client/Manager$7$1;->this$1:Lio/socket/client/Manager$7;

    iget-object v0, v0, Lio/socket/client/Manager$7;->val$self:Lio/socket/client/Manager;

    invoke-static {v0}, Lio/socket/client/Manager;->access$1800(Lio/socket/client/Manager;)V

    .line 522
    :goto_0
    return-void
.end method
