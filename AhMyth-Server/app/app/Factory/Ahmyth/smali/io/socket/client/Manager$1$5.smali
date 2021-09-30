.class Lio/socket/client/Manager$1$5;
.super Ljava/util/TimerTask;
.source "Manager.java"


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

.field final synthetic val$onTimeout:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lio/socket/client/Manager$1;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "this$1"    # Lio/socket/client/Manager$1;

    .line 292
    iput-object p1, p0, Lio/socket/client/Manager$1$5;->this$1:Lio/socket/client/Manager$1;

    iput-object p2, p0, Lio/socket/client/Manager$1$5;->val$onTimeout:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 295
    iget-object v0, p0, Lio/socket/client/Manager$1$5;->val$onTimeout:Ljava/lang/Runnable;

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 296
    return-void
.end method
