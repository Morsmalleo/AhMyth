.class Lio/socket/engineio/client/Socket$9;
.super Ljava/lang/Object;
.source "Socket.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/Socket;->probe(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/engineio/client/Socket;

.field final synthetic val$freezeTransport:Lio/socket/emitter/Emitter$Listener;

.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$self:Lio/socket/engineio/client/Socket;

.field final synthetic val$transport:[Lio/socket/engineio/client/Transport;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/Socket;[Lio/socket/engineio/client/Transport;Lio/socket/emitter/Emitter$Listener;Ljava/lang/String;Lio/socket/engineio/client/Socket;)V
    .locals 0

    .line 405
    iput-object p1, p0, Lio/socket/engineio/client/Socket$9;->this$0:Lio/socket/engineio/client/Socket;

    iput-object p2, p0, Lio/socket/engineio/client/Socket$9;->val$transport:[Lio/socket/engineio/client/Transport;

    iput-object p3, p0, Lio/socket/engineio/client/Socket$9;->val$freezeTransport:Lio/socket/emitter/Emitter$Listener;

    iput-object p4, p0, Lio/socket/engineio/client/Socket$9;->val$name:Ljava/lang/String;

    iput-object p5, p0, Lio/socket/engineio/client/Socket$9;->val$self:Lio/socket/engineio/client/Socket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 5

    const/4 v0, 0x0

    .line 408
    aget-object p1, p1, v0

    .line 410
    instance-of v1, p1, Ljava/lang/Exception;

    const-string v2, "probe error"

    if-eqz v1, :cond_0

    .line 411
    new-instance v1, Lio/socket/engineio/client/EngineIOException;

    move-object v3, p1

    check-cast v3, Ljava/lang/Exception;

    invoke-direct {v1, v2, v3}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 412
    :cond_0
    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 413
    new-instance v1, Lio/socket/engineio/client/EngineIOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "probe error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object v3, p1

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 415
    :cond_1
    new-instance v1, Lio/socket/engineio/client/EngineIOException;

    invoke-direct {v1, v2}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/String;)V

    .line 417
    :goto_0
    iget-object v2, p0, Lio/socket/engineio/client/Socket$9;->val$transport:[Lio/socket/engineio/client/Transport;

    aget-object v2, v2, v0

    iget-object v2, v2, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    iput-object v2, v1, Lio/socket/engineio/client/EngineIOException;->transport:Ljava/lang/String;

    .line 419
    iget-object v2, p0, Lio/socket/engineio/client/Socket$9;->val$freezeTransport:Lio/socket/emitter/Emitter$Listener;

    new-array v3, v0, [Ljava/lang/Object;

    invoke-interface {v2, v3}, Lio/socket/emitter/Emitter$Listener;->call([Ljava/lang/Object;)V

    .line 421
    invoke-static {}, Lio/socket/engineio/client/Socket;->access$1200()Ljava/util/logging/Logger;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lio/socket/engineio/client/Socket$9;->val$name:Ljava/lang/String;

    aput-object v4, v3, v0

    const/4 v4, 0x1

    aput-object p1, v3, v4

    const-string p1, "probe transport \"%s\" failed because of error: %s"

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 423
    iget-object p1, p0, Lio/socket/engineio/client/Socket$9;->val$self:Lio/socket/engineio/client/Socket;

    new-array v2, v4, [Ljava/lang/Object;

    aput-object v1, v2, v0

    const-string v0, "upgradeError"

    invoke-virtual {p1, v0, v2}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    return-void
.end method
