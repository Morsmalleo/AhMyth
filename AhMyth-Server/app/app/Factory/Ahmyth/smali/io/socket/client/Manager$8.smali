.class Lio/socket/client/Manager$8;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager;->socket(Ljava/lang/String;)Lio/socket/client/Socket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/client/Manager;

.field final synthetic val$s:Lio/socket/client/Socket;

.field final synthetic val$self:Lio/socket/client/Manager;


# direct methods
.method constructor <init>(Lio/socket/client/Manager;Lio/socket/client/Manager;Lio/socket/client/Socket;)V
    .locals 0

    .line 431
    iput-object p1, p0, Lio/socket/client/Manager$8;->this$0:Lio/socket/client/Manager;

    iput-object p2, p0, Lio/socket/client/Manager$8;->val$self:Lio/socket/client/Manager;

    iput-object p3, p0, Lio/socket/client/Manager$8;->val$s:Lio/socket/client/Socket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 1

    .line 434
    iget-object p1, p0, Lio/socket/client/Manager$8;->val$self:Lio/socket/client/Manager;

    invoke-static {p1}, Lio/socket/client/Manager;->access$1700(Lio/socket/client/Manager;)Ljava/util/Set;

    move-result-object p1

    iget-object v0, p0, Lio/socket/client/Manager$8;->val$s:Lio/socket/client/Socket;

    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method
