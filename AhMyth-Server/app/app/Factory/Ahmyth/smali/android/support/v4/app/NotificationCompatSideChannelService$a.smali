.class Landroid/support/v4/app/NotificationCompatSideChannelService$a;
.super Landroid/support/v4/app/a$a;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/NotificationCompatSideChannelService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v4/app/NotificationCompatSideChannelService;


# direct methods
.method constructor <init>(Landroid/support/v4/app/NotificationCompatSideChannelService;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompatSideChannelService$a;->a:Landroid/support/v4/app/NotificationCompatSideChannelService;

    invoke-direct {p0}, Landroid/support/v4/app/a$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;ILjava/lang/String;)V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompatSideChannelService$a;->a:Landroid/support/v4/app/NotificationCompatSideChannelService;

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v4/app/NotificationCompatSideChannelService;->c(ILjava/lang/String;)V

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    iget-object v2, p0, Landroid/support/v4/app/NotificationCompatSideChannelService$a;->a:Landroid/support/v4/app/NotificationCompatSideChannelService;

    invoke-virtual {v2, p1, p2, p3}, Landroid/support/v4/app/NotificationCompatSideChannelService;->a(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception p1

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw p1
.end method

.method public b(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompatSideChannelService$a;->a:Landroid/support/v4/app/NotificationCompatSideChannelService;

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v4/app/NotificationCompatSideChannelService;->c(ILjava/lang/String;)V

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    iget-object v2, p0, Landroid/support/v4/app/NotificationCompatSideChannelService$a;->a:Landroid/support/v4/app/NotificationCompatSideChannelService;

    invoke-virtual {v2, p1}, Landroid/support/v4/app/NotificationCompatSideChannelService;->b(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception p1

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw p1
.end method

.method public c(Ljava/lang/String;ILjava/lang/String;Landroid/app/Notification;)V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompatSideChannelService$a;->a:Landroid/support/v4/app/NotificationCompatSideChannelService;

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v4/app/NotificationCompatSideChannelService;->c(ILjava/lang/String;)V

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    iget-object v2, p0, Landroid/support/v4/app/NotificationCompatSideChannelService$a;->a:Landroid/support/v4/app/NotificationCompatSideChannelService;

    invoke-virtual {v2, p1, p2, p3, p4}, Landroid/support/v4/app/NotificationCompatSideChannelService;->d(Ljava/lang/String;ILjava/lang/String;Landroid/app/Notification;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception p1

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw p1
.end method
