.class Lio/socket/engineio/client/Socket$11;
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

.field final synthetic val$onerror:Lio/socket/emitter/Emitter$Listener;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/Socket;Lio/socket/emitter/Emitter$Listener;)V
    .locals 0

    .line 435
    iput-object p1, p0, Lio/socket/engineio/client/Socket$11;->this$0:Lio/socket/engineio/client/Socket;

    iput-object p2, p0, Lio/socket/engineio/client/Socket$11;->val$onerror:Lio/socket/emitter/Emitter$Listener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 3

    .line 438
    iget-object p1, p0, Lio/socket/engineio/client/Socket$11;->val$onerror:Lio/socket/emitter/Emitter$Listener;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string v2, "socket closed"

    aput-object v2, v0, v1

    invoke-interface {p1, v0}, Lio/socket/emitter/Emitter$Listener;->call([Ljava/lang/Object;)V

    return-void
.end method
