.class Lio/socket/engineio/client/Socket$7$1;
.super Ljava/lang/Object;
.source "Socket.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/Socket$7;->call([Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/socket/engineio/client/Socket$7;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/Socket$7;)V
    .locals 0

    .line 346
    iput-object p1, p0, Lio/socket/engineio/client/Socket$7$1;->this$1:Lio/socket/engineio/client/Socket$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 4

    .line 349
    iget-object v0, p0, Lio/socket/engineio/client/Socket$7$1;->this$1:Lio/socket/engineio/client/Socket$7;

    iget-object v0, v0, Lio/socket/engineio/client/Socket$7;->val$failed:[Z

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_0

    return-void

    .line 351
    :cond_0
    aget-object p1, p1, v1

    check-cast p1, Lio/socket/engineio/parser/Packet;

    .line 352
    iget-object v0, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    const-string v2, "pong"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    iget-object p1, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    const-string v0, "probe"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 353
    invoke-static {}, Lio/socket/engineio/client/Socket;->access$1200()Ljava/util/logging/Logger;

    move-result-object p1

    new-array v0, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lio/socket/engineio/client/Socket$7$1;->this$1:Lio/socket/engineio/client/Socket$7;

    iget-object v3, v3, Lio/socket/engineio/client/Socket$7;->val$name:Ljava/lang/String;

    aput-object v3, v0, v1

    const-string v3, "probe transport \'%s\' pong"

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 354
    iget-object p1, p0, Lio/socket/engineio/client/Socket$7$1;->this$1:Lio/socket/engineio/client/Socket$7;

    iget-object p1, p1, Lio/socket/engineio/client/Socket$7;->val$self:Lio/socket/engineio/client/Socket;

    invoke-static {p1, v2}, Lio/socket/engineio/client/Socket;->access$1302(Lio/socket/engineio/client/Socket;Z)Z

    .line 355
    iget-object p1, p0, Lio/socket/engineio/client/Socket$7$1;->this$1:Lio/socket/engineio/client/Socket$7;

    iget-object p1, p1, Lio/socket/engineio/client/Socket$7;->val$self:Lio/socket/engineio/client/Socket;

    new-array v0, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lio/socket/engineio/client/Socket$7$1;->this$1:Lio/socket/engineio/client/Socket$7;

    iget-object v3, v3, Lio/socket/engineio/client/Socket$7;->val$transport:[Lio/socket/engineio/client/Transport;

    aget-object v3, v3, v1

    aput-object v3, v0, v1

    const-string v3, "upgrading"

    invoke-virtual {p1, v3, v0}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 356
    iget-object p1, p0, Lio/socket/engineio/client/Socket$7$1;->this$1:Lio/socket/engineio/client/Socket$7;

    iget-object p1, p1, Lio/socket/engineio/client/Socket$7;->val$transport:[Lio/socket/engineio/client/Transport;

    aget-object p1, p1, v1

    if-nez p1, :cond_1

    return-void

    .line 357
    :cond_1
    iget-object p1, p0, Lio/socket/engineio/client/Socket$7$1;->this$1:Lio/socket/engineio/client/Socket$7;

    iget-object p1, p1, Lio/socket/engineio/client/Socket$7;->val$transport:[Lio/socket/engineio/client/Transport;

    aget-object p1, p1, v1

    iget-object p1, p1, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    const-string v0, "websocket"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    invoke-static {p1}, Lio/socket/engineio/client/Socket;->access$302(Z)Z

    .line 359
    invoke-static {}, Lio/socket/engineio/client/Socket;->access$1200()Ljava/util/logging/Logger;

    move-result-object p1

    new-array v0, v2, [Ljava/lang/Object;

    iget-object v2, p0, Lio/socket/engineio/client/Socket$7$1;->this$1:Lio/socket/engineio/client/Socket$7;

    iget-object v2, v2, Lio/socket/engineio/client/Socket$7;->val$self:Lio/socket/engineio/client/Socket;

    iget-object v2, v2, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-object v2, v2, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    aput-object v2, v0, v1

    const-string v1, "pausing current transport \'%s\'"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 360
    iget-object p1, p0, Lio/socket/engineio/client/Socket$7$1;->this$1:Lio/socket/engineio/client/Socket$7;

    iget-object p1, p1, Lio/socket/engineio/client/Socket$7;->val$self:Lio/socket/engineio/client/Socket;

    iget-object p1, p1, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    check-cast p1, Lio/socket/engineio/client/transports/Polling;

    new-instance v0, Lio/socket/engineio/client/Socket$7$1$1;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Socket$7$1$1;-><init>(Lio/socket/engineio/client/Socket$7$1;)V

    invoke-virtual {p1, v0}, Lio/socket/engineio/client/transports/Polling;->pause(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 380
    :cond_2
    invoke-static {}, Lio/socket/engineio/client/Socket;->access$1200()Ljava/util/logging/Logger;

    move-result-object p1

    new-array v0, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lio/socket/engineio/client/Socket$7$1;->this$1:Lio/socket/engineio/client/Socket$7;

    iget-object v3, v3, Lio/socket/engineio/client/Socket$7;->val$name:Ljava/lang/String;

    aput-object v3, v0, v1

    const-string v3, "probe transport \'%s\' failed"

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 381
    new-instance p1, Lio/socket/engineio/client/EngineIOException;

    const-string v0, "probe error"

    invoke-direct {p1, v0}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/String;)V

    .line 382
    iget-object v0, p0, Lio/socket/engineio/client/Socket$7$1;->this$1:Lio/socket/engineio/client/Socket$7;

    iget-object v0, v0, Lio/socket/engineio/client/Socket$7;->val$transport:[Lio/socket/engineio/client/Transport;

    aget-object v0, v0, v1

    iget-object v0, v0, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    iput-object v0, p1, Lio/socket/engineio/client/EngineIOException;->transport:Ljava/lang/String;

    .line 383
    iget-object v0, p0, Lio/socket/engineio/client/Socket$7$1;->this$1:Lio/socket/engineio/client/Socket$7;

    iget-object v0, v0, Lio/socket/engineio/client/Socket$7;->val$self:Lio/socket/engineio/client/Socket;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v1

    const-string p1, "upgradeError"

    invoke-virtual {v0, p1, v2}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    :goto_0
    return-void
.end method
