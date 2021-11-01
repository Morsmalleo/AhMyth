.class Lio/socket/client/Manager$2;
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

    .line 345
    iput-object p1, p0, Lio/socket/client/Manager$2;->this$0:Lio/socket/client/Manager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x0

    .line 348
    aget-object p1, p1, v0

    .line 349
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 350
    iget-object v0, p0, Lio/socket/client/Manager$2;->this$0:Lio/socket/client/Manager;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1}, Lio/socket/client/Manager;->access$1000(Lio/socket/client/Manager;Ljava/lang/String;)V

    goto :goto_0

    .line 351
    :cond_0
    instance-of v0, p1, [B

    if-eqz v0, :cond_1

    .line 352
    iget-object v0, p0, Lio/socket/client/Manager$2;->this$0:Lio/socket/client/Manager;

    check-cast p1, [B

    check-cast p1, [B

    invoke-static {v0, p1}, Lio/socket/client/Manager;->access$1100(Lio/socket/client/Manager;[B)V

    :cond_1
    :goto_0
    return-void
.end method
