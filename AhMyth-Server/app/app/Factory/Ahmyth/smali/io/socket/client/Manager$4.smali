.class Lio/socket/client/Manager$4;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager;->onopen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/client/Manager;


# direct methods
.method constructor <init>(Lio/socket/client/Manager;)V
    .locals 0

    .line 362
    iput-object p1, p0, Lio/socket/client/Manager$4;->this$0:Lio/socket/client/Manager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 0

    .line 365
    iget-object p1, p0, Lio/socket/client/Manager$4;->this$0:Lio/socket/client/Manager;

    invoke-static {p1}, Lio/socket/client/Manager;->access$1300(Lio/socket/client/Manager;)V

    return-void
.end method
