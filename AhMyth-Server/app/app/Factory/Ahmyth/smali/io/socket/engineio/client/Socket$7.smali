.class Lio/socket/engineio/client/Socket$7;
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

.field final synthetic val$cleanup:[Ljava/lang/Runnable;

.field final synthetic val$failed:[Z

.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$self:Lio/socket/engineio/client/Socket;

.field final synthetic val$transport:[Lio/socket/engineio/client/Transport;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/Socket;[ZLjava/lang/String;[Lio/socket/engineio/client/Transport;Lio/socket/engineio/client/Socket;[Ljava/lang/Runnable;)V
    .locals 0

    .line 338
    iput-object p1, p0, Lio/socket/engineio/client/Socket$7;->this$0:Lio/socket/engineio/client/Socket;

    iput-object p2, p0, Lio/socket/engineio/client/Socket$7;->val$failed:[Z

    iput-object p3, p0, Lio/socket/engineio/client/Socket$7;->val$name:Ljava/lang/String;

    iput-object p4, p0, Lio/socket/engineio/client/Socket$7;->val$transport:[Lio/socket/engineio/client/Transport;

    iput-object p5, p0, Lio/socket/engineio/client/Socket$7;->val$self:Lio/socket/engineio/client/Socket;

    iput-object p6, p0, Lio/socket/engineio/client/Socket$7;->val$cleanup:[Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 4

    .line 341
    iget-object p1, p0, Lio/socket/engineio/client/Socket$7;->val$failed:[Z

    const/4 v0, 0x0

    aget-boolean p1, p1, v0

    if-eqz p1, :cond_0

    return-void

    .line 343
    :cond_0
    invoke-static {}, Lio/socket/engineio/client/Socket;->access$1200()Ljava/util/logging/Logger;

    move-result-object p1

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    iget-object v3, p0, Lio/socket/engineio/client/Socket$7;->val$name:Ljava/lang/String;

    aput-object v3, v2, v0

    const-string v3, "probe transport \'%s\' opened"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 344
    new-instance p1, Lio/socket/engineio/parser/Packet;

    const-string v2, "ping"

    const-string v3, "probe"

    invoke-direct {p1, v2, v3}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 345
    iget-object v2, p0, Lio/socket/engineio/client/Socket$7;->val$transport:[Lio/socket/engineio/client/Transport;

    aget-object v2, v2, v0

    new-array v1, v1, [Lio/socket/engineio/parser/Packet;

    aput-object p1, v1, v0

    invoke-virtual {v2, v1}, Lio/socket/engineio/client/Transport;->send([Lio/socket/engineio/parser/Packet;)V

    .line 346
    iget-object p1, p0, Lio/socket/engineio/client/Socket$7;->val$transport:[Lio/socket/engineio/client/Transport;

    aget-object p1, p1, v0

    new-instance v0, Lio/socket/engineio/client/Socket$7$1;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Socket$7$1;-><init>(Lio/socket/engineio/client/Socket$7;)V

    const-string v1, "packet"

    invoke-virtual {p1, v1, v0}, Lio/socket/engineio/client/Transport;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    return-void
.end method
