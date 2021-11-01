.class Landroid/support/v4/app/NotificationManagerCompat$CancelTask;
.super Ljava/lang/Object;
.source "NotificationManagerCompat.java"

# interfaces
.implements Landroid/support/v4/app/NotificationManagerCompat$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/NotificationManagerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CancelTask"
.end annotation


# instance fields
.field final all:Z

.field final id:I

.field final packageName:Ljava/lang/String;

.field final tag:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 625
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 626
    iput-object p1, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->packageName:Ljava/lang/String;

    const/4 p1, 0x0

    .line 627
    iput p1, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->id:I

    const/4 p1, 0x0

    .line 628
    iput-object p1, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->tag:Ljava/lang/String;

    const/4 p1, 0x1

    .line 629
    iput-boolean p1, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->all:Z

    return-void
.end method

.method constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 632
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 633
    iput-object p1, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->packageName:Ljava/lang/String;

    .line 634
    iput p2, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->id:I

    .line 635
    iput-object p3, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->tag:Ljava/lang/String;

    const/4 p1, 0x0

    .line 636
    iput-boolean p1, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->all:Z

    return-void
.end method


# virtual methods
.method public send(Landroid/support/v4/app/INotificationSideChannel;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 641
    iget-boolean v0, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->all:Z

    if-eqz v0, :cond_0

    .line 642
    iget-object v0, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->packageName:Ljava/lang/String;

    invoke-interface {p1, v0}, Landroid/support/v4/app/INotificationSideChannel;->cancelAll(Ljava/lang/String;)V

    goto :goto_0

    .line 644
    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->packageName:Ljava/lang/String;

    iget v1, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->id:I

    iget-object v2, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->tag:Ljava/lang/String;

    invoke-interface {p1, v0, v1, v2}, Landroid/support/v4/app/INotificationSideChannel;->cancel(Ljava/lang/String;ILjava/lang/String;)V

    :goto_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 650
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CancelTask["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "packageName:"

    .line 651
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", id:"

    .line 652
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", tag:"

    .line 653
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->tag:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", all:"

    .line 654
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Landroid/support/v4/app/NotificationManagerCompat$CancelTask;->all:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "]"

    .line 655
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 656
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
