.class Lio/socket/client/Manager$1$3;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


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

.field final synthetic val$self:Lio/socket/client/Manager;


# direct methods
.method constructor <init>(Lio/socket/client/Manager$1;Lio/socket/client/Manager;)V
    .locals 0

    .line 279
    iput-object p1, p0, Lio/socket/client/Manager$1$3;->this$1:Lio/socket/client/Manager$1;

    iput-object p2, p0, Lio/socket/client/Manager$1$3;->val$self:Lio/socket/client/Manager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 5

    .line 282
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-lez v0, :cond_0

    aget-object p1, p1, v1

    goto :goto_0

    :cond_0
    move-object p1, v2

    .line 283
    :goto_0
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    const-string v3, "connect_error"

    invoke-virtual {v0, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 284
    iget-object v0, p0, Lio/socket/client/Manager$1$3;->val$self:Lio/socket/client/Manager;

    invoke-static {v0}, Lio/socket/client/Manager;->access$500(Lio/socket/client/Manager;)V

    .line 285
    iget-object v0, p0, Lio/socket/client/Manager$1$3;->val$self:Lio/socket/client/Manager;

    sget-object v4, Lio/socket/client/Manager$ReadyState;->CLOSED:Lio/socket/client/Manager$ReadyState;

    iput-object v4, v0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    .line 286
    iget-object v0, p0, Lio/socket/client/Manager$1$3;->val$self:Lio/socket/client/Manager;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v1

    invoke-static {v0, v3, v4}, Lio/socket/client/Manager;->access$600(Lio/socket/client/Manager;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 287
    iget-object v0, p0, Lio/socket/client/Manager$1$3;->this$1:Lio/socket/client/Manager$1;

    iget-object v0, v0, Lio/socket/client/Manager$1;->val$fn:Lio/socket/client/Manager$OpenCallback;

    if-eqz v0, :cond_2

    .line 288
    new-instance v0, Lio/socket/client/SocketIOException;

    instance-of v1, p1, Ljava/lang/Exception;

    if-eqz v1, :cond_1

    move-object v2, p1

    check-cast v2, Ljava/lang/Exception;

    :cond_1
    const-string p1, "Connection error"

    invoke-direct {v0, p1, v2}, Lio/socket/client/SocketIOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 290
    iget-object p1, p0, Lio/socket/client/Manager$1$3;->this$1:Lio/socket/client/Manager$1;

    iget-object p1, p1, Lio/socket/client/Manager$1;->val$fn:Lio/socket/client/Manager$OpenCallback;

    invoke-interface {p1, v0}, Lio/socket/client/Manager$OpenCallback;->call(Ljava/lang/Exception;)V

    goto :goto_1

    .line 293
    :cond_2
    iget-object p1, p0, Lio/socket/client/Manager$1$3;->val$self:Lio/socket/client/Manager;

    invoke-static {p1}, Lio/socket/client/Manager;->access$700(Lio/socket/client/Manager;)V

    :goto_1
    return-void
.end method
