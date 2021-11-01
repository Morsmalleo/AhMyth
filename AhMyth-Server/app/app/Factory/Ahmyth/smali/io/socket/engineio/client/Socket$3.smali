.class Lio/socket/engineio/client/Socket$3;
.super Ljava/lang/Object;
.source "Socket.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/Socket;->setTransport(Lio/socket/engineio/client/Transport;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/engineio/client/Socket;

.field final synthetic val$self:Lio/socket/engineio/client/Socket;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V
    .locals 0

    .line 320
    iput-object p1, p0, Lio/socket/engineio/client/Socket$3;->this$0:Lio/socket/engineio/client/Socket;

    iput-object p2, p0, Lio/socket/engineio/client/Socket$3;->val$self:Lio/socket/engineio/client/Socket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 1

    .line 323
    iget-object p1, p0, Lio/socket/engineio/client/Socket$3;->val$self:Lio/socket/engineio/client/Socket;

    const-string v0, "transport close"

    invoke-static {p1, v0}, Lio/socket/engineio/client/Socket;->access$800(Lio/socket/engineio/client/Socket;Ljava/lang/String;)V

    return-void
.end method
