.class Landroid/support/v4/provider/SelfDestructiveThread$2$1;
.super Ljava/lang/Object;
.source "SelfDestructiveThread.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/provider/SelfDestructiveThread$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/support/v4/provider/SelfDestructiveThread$2;

.field final synthetic val$result:Ljava/lang/Object;


# direct methods
.method constructor <init>(Landroid/support/v4/provider/SelfDestructiveThread$2;Ljava/lang/Object;)V
    .locals 0

    .line 147
    iput-object p1, p0, Landroid/support/v4/provider/SelfDestructiveThread$2$1;->this$1:Landroid/support/v4/provider/SelfDestructiveThread$2;

    iput-object p2, p0, Landroid/support/v4/provider/SelfDestructiveThread$2$1;->val$result:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 150
    iget-object v0, p0, Landroid/support/v4/provider/SelfDestructiveThread$2$1;->this$1:Landroid/support/v4/provider/SelfDestructiveThread$2;

    iget-object v0, v0, Landroid/support/v4/provider/SelfDestructiveThread$2;->val$reply:Landroid/support/v4/provider/SelfDestructiveThread$ReplyCallback;

    iget-object v1, p0, Landroid/support/v4/provider/SelfDestructiveThread$2$1;->val$result:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/provider/SelfDestructiveThread$ReplyCallback;->onReply(Ljava/lang/Object;)V

    return-void
.end method
