.class Lio/socket/engineio/client/Socket$8;
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

.field final synthetic val$transport:[Lio/socket/engineio/client/Transport;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/Socket;[Z[Ljava/lang/Runnable;[Lio/socket/engineio/client/Transport;)V
    .locals 0

    .line 390
    iput-object p1, p0, Lio/socket/engineio/client/Socket$8;->this$0:Lio/socket/engineio/client/Socket;

    iput-object p2, p0, Lio/socket/engineio/client/Socket$8;->val$failed:[Z

    iput-object p3, p0, Lio/socket/engineio/client/Socket$8;->val$cleanup:[Ljava/lang/Runnable;

    iput-object p4, p0, Lio/socket/engineio/client/Socket$8;->val$transport:[Lio/socket/engineio/client/Transport;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 2

    .line 393
    iget-object p1, p0, Lio/socket/engineio/client/Socket$8;->val$failed:[Z

    const/4 v0, 0x0

    aget-boolean v1, p1, v0

    if-eqz v1, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x1

    .line 395
    aput-boolean v1, p1, v0

    .line 397
    iget-object p1, p0, Lio/socket/engineio/client/Socket$8;->val$cleanup:[Ljava/lang/Runnable;

    aget-object p1, p1, v0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 399
    iget-object p1, p0, Lio/socket/engineio/client/Socket$8;->val$transport:[Lio/socket/engineio/client/Transport;

    aget-object p1, p1, v0

    invoke-virtual {p1}, Lio/socket/engineio/client/Transport;->close()Lio/socket/engineio/client/Transport;

    .line 400
    iget-object p1, p0, Lio/socket/engineio/client/Socket$8;->val$transport:[Lio/socket/engineio/client/Transport;

    const/4 v1, 0x0

    aput-object v1, p1, v0

    return-void
.end method
