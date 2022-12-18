.class Landroid/support/v4/app/d;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/support/v4/app/b;


# instance fields
.field private final a:Landroid/app/Notification$Builder;

.field private final b:Landroid/support/v4/app/c$b;

.field private c:Landroid/widget/RemoteViews;

.field private d:Landroid/widget/RemoteViews;

.field private final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field

.field private final f:Landroid/os/Bundle;

.field private g:I

.field private h:Landroid/widget/RemoteViews;


# direct methods
.method constructor <init>(Landroid/support/v4/app/c$b;)V
    .locals 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/d;->e:Ljava/util/List;

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    iput-object p1, p0, Landroid/support/v4/app/d;->b:Landroid/support/v4/app/c$b;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    new-instance v2, Landroid/app/Notification$Builder;

    iget-object v3, p1, Landroid/support/v4/app/c$b;->a:Landroid/content/Context;

    if-lt v0, v1, :cond_0

    iget-object v4, p1, Landroid/support/v4/app/c$b;->I:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-direct {v2, v3}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    :goto_0
    iput-object v2, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    iget-object v2, p1, Landroid/support/v4/app/c$b;->N:Landroid/app/Notification;

    iget-object v3, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    iget-wide v4, v2, Landroid/app/Notification;->when:J

    invoke-virtual {v3, v4, v5}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v3

    iget v4, v2, Landroid/app/Notification;->icon:I

    iget v5, v2, Landroid/app/Notification;->iconLevel:I

    invoke-virtual {v3, v4, v5}, Landroid/app/Notification$Builder;->setSmallIcon(II)Landroid/app/Notification$Builder;

    move-result-object v3

    iget-object v4, v2, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContent(Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    move-result-object v3

    iget-object v4, v2, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    iget-object v5, p1, Landroid/support/v4/app/c$b;->h:Landroid/widget/RemoteViews;

    invoke-virtual {v3, v4, v5}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    move-result-object v3

    iget-object v4, v2, Landroid/app/Notification;->vibrate:[J

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    move-result-object v3

    iget v4, v2, Landroid/app/Notification;->ledARGB:I

    iget v5, v2, Landroid/app/Notification;->ledOnMS:I

    iget v6, v2, Landroid/app/Notification;->ledOffMS:I

    invoke-virtual {v3, v4, v5, v6}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    move-result-object v3

    iget v4, v2, Landroid/app/Notification;->flags:I

    and-int/lit8 v4, v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v3

    iget v4, v2, Landroid/app/Notification;->flags:I

    and-int/lit8 v4, v4, 0x8

    if-eqz v4, :cond_2

    const/4 v4, 0x1

    goto :goto_2

    :cond_2
    const/4 v4, 0x0

    :goto_2
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v3

    iget v4, v2, Landroid/app/Notification;->flags:I

    const/16 v7, 0x10

    and-int/2addr v4, v7

    if-eqz v4, :cond_3

    const/4 v4, 0x1

    goto :goto_3

    :cond_3
    const/4 v4, 0x0

    :goto_3
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v3

    iget v4, v2, Landroid/app/Notification;->defaults:I

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v3

    iget-object v4, p1, Landroid/support/v4/app/c$b;->d:Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v3

    iget-object v4, p1, Landroid/support/v4/app/c$b;->e:Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v3

    iget-object v4, p1, Landroid/support/v4/app/c$b;->j:Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v3

    iget-object v4, p1, Landroid/support/v4/app/c$b;->f:Landroid/app/PendingIntent;

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v3

    iget-object v4, v2, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v3

    iget-object v4, p1, Landroid/support/v4/app/c$b;->g:Landroid/app/PendingIntent;

    iget v8, v2, Landroid/app/Notification;->flags:I

    and-int/lit16 v8, v8, 0x80

    if-eqz v8, :cond_4

    const/4 v8, 0x1

    goto :goto_4

    :cond_4
    const/4 v8, 0x0

    :goto_4
    invoke-virtual {v3, v4, v8}, Landroid/app/Notification$Builder;->setFullScreenIntent(Landroid/app/PendingIntent;Z)Landroid/app/Notification$Builder;

    move-result-object v3

    iget-object v4, p1, Landroid/support/v4/app/c$b;->i:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v3

    iget v4, p1, Landroid/support/v4/app/c$b;->k:I

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setNumber(I)Landroid/app/Notification$Builder;

    move-result-object v3

    iget v4, p1, Landroid/support/v4/app/c$b;->r:I

    iget v8, p1, Landroid/support/v4/app/c$b;->s:I

    iget-boolean v9, p1, Landroid/support/v4/app/c$b;->t:Z

    invoke-virtual {v3, v4, v8, v9}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    const/16 v3, 0x15

    if-ge v0, v3, :cond_5

    iget-object v4, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    iget-object v8, v2, Landroid/app/Notification;->sound:Landroid/net/Uri;

    iget v9, v2, Landroid/app/Notification;->audioStreamType:I

    invoke-virtual {v4, v8, v9}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;I)Landroid/app/Notification$Builder;

    :cond_5
    const/16 v4, 0x14

    if-lt v0, v7, :cond_c

    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    iget-object v7, p1, Landroid/support/v4/app/c$b;->p:Ljava/lang/CharSequence;

    invoke-virtual {v0, v7}, Landroid/app/Notification$Builder;->setSubText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    iget-boolean v7, p1, Landroid/support/v4/app/c$b;->n:Z

    invoke-virtual {v0, v7}, Landroid/app/Notification$Builder;->setUsesChronometer(Z)Landroid/app/Notification$Builder;

    move-result-object v0

    iget v7, p1, Landroid/support/v4/app/c$b;->l:I

    invoke-virtual {v0, v7}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    iget-object v0, p1, Landroid/support/v4/app/c$b;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/app/c$a;

    invoke-direct {p0, v7}, Landroid/support/v4/app/d;->a(Landroid/support/v4/app/c$a;)V

    goto :goto_5

    :cond_6
    iget-object v0, p1, Landroid/support/v4/app/c$b;->B:Landroid/os/Bundle;

    if-eqz v0, :cond_7

    iget-object v7, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v0, v4, :cond_b

    iget-boolean v0, p1, Landroid/support/v4/app/c$b;->x:Z

    if-eqz v0, :cond_8

    iget-object v0, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    const-string v7, "android.support.localOnly"

    invoke-virtual {v0, v7, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_8
    iget-object v0, p1, Landroid/support/v4/app/c$b;->u:Ljava/lang/String;

    if-eqz v0, :cond_a

    iget-object v7, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    const-string v8, "android.support.groupKey"

    invoke-virtual {v7, v8, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p1, Landroid/support/v4/app/c$b;->v:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    const-string v7, "android.support.isGroupSummary"

    goto :goto_6

    :cond_9
    iget-object v0, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    const-string v7, "android.support.useSideChannel"

    :goto_6
    invoke-virtual {v0, v7, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_a
    iget-object v0, p1, Landroid/support/v4/app/c$b;->w:Ljava/lang/String;

    if-eqz v0, :cond_b

    iget-object v5, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    const-string v7, "android.support.sortKey"

    invoke-virtual {v5, v7, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_b
    iget-object v0, p1, Landroid/support/v4/app/c$b;->F:Landroid/widget/RemoteViews;

    iput-object v0, p0, Landroid/support/v4/app/d;->c:Landroid/widget/RemoteViews;

    iget-object v0, p1, Landroid/support/v4/app/c$b;->G:Landroid/widget/RemoteViews;

    iput-object v0, p0, Landroid/support/v4/app/d;->d:Landroid/widget/RemoteViews;

    :cond_c
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x13

    if-lt v0, v5, :cond_d

    iget-object v5, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    iget-boolean v7, p1, Landroid/support/v4/app/c$b;->m:Z

    invoke-virtual {v5, v7}, Landroid/app/Notification$Builder;->setShowWhen(Z)Landroid/app/Notification$Builder;

    if-ge v0, v3, :cond_d

    iget-object v5, p1, Landroid/support/v4/app/c$b;->O:Ljava/util/ArrayList;

    if-eqz v5, :cond_d

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_d

    iget-object v5, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    iget-object v7, p1, Landroid/support/v4/app/c$b;->O:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    const-string v8, "android.people"

    invoke-virtual {v5, v8, v7}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    :cond_d
    if-lt v0, v4, :cond_e

    iget-object v4, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    iget-boolean v5, p1, Landroid/support/v4/app/c$b;->x:Z

    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setLocalOnly(Z)Landroid/app/Notification$Builder;

    move-result-object v4

    iget-object v5, p1, Landroid/support/v4/app/c$b;->u:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setGroup(Ljava/lang/String;)Landroid/app/Notification$Builder;

    move-result-object v4

    iget-boolean v5, p1, Landroid/support/v4/app/c$b;->v:Z

    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setGroupSummary(Z)Landroid/app/Notification$Builder;

    move-result-object v4

    iget-object v5, p1, Landroid/support/v4/app/c$b;->w:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setSortKey(Ljava/lang/String;)Landroid/app/Notification$Builder;

    iget v4, p1, Landroid/support/v4/app/c$b;->M:I

    iput v4, p0, Landroid/support/v4/app/d;->g:I

    :cond_e
    if-lt v0, v3, :cond_12

    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    iget-object v3, p1, Landroid/support/v4/app/c$b;->A:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/app/Notification$Builder;->setCategory(Ljava/lang/String;)Landroid/app/Notification$Builder;

    move-result-object v0

    iget v3, p1, Landroid/support/v4/app/c$b;->C:I

    invoke-virtual {v0, v3}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    move-result-object v0

    iget v3, p1, Landroid/support/v4/app/c$b;->D:I

    invoke-virtual {v0, v3}, Landroid/app/Notification$Builder;->setVisibility(I)Landroid/app/Notification$Builder;

    move-result-object v0

    iget-object v3, p1, Landroid/support/v4/app/c$b;->E:Landroid/app/Notification;

    invoke-virtual {v0, v3}, Landroid/app/Notification$Builder;->setPublicVersion(Landroid/app/Notification;)Landroid/app/Notification$Builder;

    move-result-object v0

    iget-object v3, v2, Landroid/app/Notification;->sound:Landroid/net/Uri;

    iget-object v2, v2, Landroid/app/Notification;->audioAttributes:Landroid/media/AudioAttributes;

    invoke-virtual {v0, v3, v2}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;Landroid/media/AudioAttributes;)Landroid/app/Notification$Builder;

    iget-object v0, p1, Landroid/support/v4/app/c$b;->O:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    invoke-virtual {v3, v2}, Landroid/app/Notification$Builder;->addPerson(Ljava/lang/String;)Landroid/app/Notification$Builder;

    goto :goto_7

    :cond_f
    iget-object v0, p1, Landroid/support/v4/app/c$b;->H:Landroid/widget/RemoteViews;

    iput-object v0, p0, Landroid/support/v4/app/d;->h:Landroid/widget/RemoteViews;

    iget-object v0, p1, Landroid/support/v4/app/c$b;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_12

    invoke-virtual {p1}, Landroid/support/v4/app/c$b;->b()Landroid/os/Bundle;

    move-result-object v0

    const-string v2, "android.car.EXTENSIONS"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_10

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    :cond_10
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const/4 v4, 0x0

    :goto_8
    iget-object v5, p1, Landroid/support/v4/app/c$b;->c:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_11

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v7, p1, Landroid/support/v4/app/c$b;->c:Ljava/util/ArrayList;

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/app/c$a;

    invoke-static {v7}, Landroid/support/v4/app/e;->b(Landroid/support/v4/app/c$a;)Landroid/os/Bundle;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_8

    :cond_11
    const-string v4, "invisible_actions"

    invoke-virtual {v0, v4, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-virtual {p1}, Landroid/support/v4/app/c$b;->b()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v3, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    invoke-virtual {v3, v2, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_12
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v0, v2, :cond_15

    iget-object v2, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    iget-object v3, p1, Landroid/support/v4/app/c$b;->B:Landroid/os/Bundle;

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setExtras(Landroid/os/Bundle;)Landroid/app/Notification$Builder;

    move-result-object v2

    iget-object v3, p1, Landroid/support/v4/app/c$b;->q:[Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setRemoteInputHistory([Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    iget-object v2, p1, Landroid/support/v4/app/c$b;->F:Landroid/widget/RemoteViews;

    if-eqz v2, :cond_13

    iget-object v3, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    invoke-virtual {v3, v2}, Landroid/app/Notification$Builder;->setCustomContentView(Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    :cond_13
    iget-object v2, p1, Landroid/support/v4/app/c$b;->G:Landroid/widget/RemoteViews;

    if-eqz v2, :cond_14

    iget-object v3, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    invoke-virtual {v3, v2}, Landroid/app/Notification$Builder;->setCustomBigContentView(Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    :cond_14
    iget-object v2, p1, Landroid/support/v4/app/c$b;->H:Landroid/widget/RemoteViews;

    if-eqz v2, :cond_15

    iget-object v3, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    invoke-virtual {v3, v2}, Landroid/app/Notification$Builder;->setCustomHeadsUpContentView(Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    :cond_15
    if-lt v0, v1, :cond_17

    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    iget v1, p1, Landroid/support/v4/app/c$b;->J:I

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setBadgeIconType(I)Landroid/app/Notification$Builder;

    move-result-object v0

    iget-object v1, p1, Landroid/support/v4/app/c$b;->K:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setShortcutId(Ljava/lang/String;)Landroid/app/Notification$Builder;

    move-result-object v0

    iget-wide v1, p1, Landroid/support/v4/app/c$b;->L:J

    invoke-virtual {v0, v1, v2}, Landroid/app/Notification$Builder;->setTimeoutAfter(J)Landroid/app/Notification$Builder;

    move-result-object v0

    iget v1, p1, Landroid/support/v4/app/c$b;->M:I

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setGroupAlertBehavior(I)Landroid/app/Notification$Builder;

    iget-boolean v0, p1, Landroid/support/v4/app/c$b;->z:Z

    if-eqz v0, :cond_16

    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    iget-boolean v1, p1, Landroid/support/v4/app/c$b;->y:Z

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setColorized(Z)Landroid/app/Notification$Builder;

    :cond_16
    iget-object p1, p1, Landroid/support/v4/app/c$b;->I:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_17

    iget-object p1, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;)Landroid/app/Notification$Builder;

    move-result-object p1

    invoke-virtual {p1, v6}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object p1

    invoke-virtual {p1, v6, v6, v6}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    :cond_17
    return-void
.end method

.method private a(Landroid/support/v4/app/c$a;)V
    .locals 5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x14

    if-lt v0, v1, :cond_4

    new-instance v0, Landroid/app/Notification$Action$Builder;

    invoke-virtual {p1}, Landroid/support/v4/app/c$a;->e()I

    move-result v1

    invoke-virtual {p1}, Landroid/support/v4/app/c$a;->i()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {p1}, Landroid/support/v4/app/c$a;->a()Landroid/app/PendingIntent;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Landroid/app/Notification$Action$Builder;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    invoke-virtual {p1}, Landroid/support/v4/app/c$a;->f()[Landroid/support/v4/app/f;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/support/v4/app/c$a;->f()[Landroid/support/v4/app/f;

    move-result-object v1

    invoke-static {v1}, Landroid/support/v4/app/f;->b([Landroid/support/v4/app/f;)[Landroid/app/RemoteInput;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    invoke-virtual {v0, v4}, Landroid/app/Notification$Action$Builder;->addRemoteInput(Landroid/app/RemoteInput;)Landroid/app/Notification$Action$Builder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/support/v4/app/c$a;->d()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_1

    new-instance v1, Landroid/os/Bundle;

    invoke-virtual {p1}, Landroid/support/v4/app/c$a;->d()Landroid/os/Bundle;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    goto :goto_1

    :cond_1
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    :goto_1
    invoke-virtual {p1}, Landroid/support/v4/app/c$a;->b()Z

    move-result v2

    const-string v3, "android.support.allowGeneratedReplies"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x18

    if-lt v2, v3, :cond_2

    invoke-virtual {p1}, Landroid/support/v4/app/c$a;->b()Z

    move-result v3

    invoke-virtual {v0, v3}, Landroid/app/Notification$Action$Builder;->setAllowGeneratedReplies(Z)Landroid/app/Notification$Action$Builder;

    :cond_2
    invoke-virtual {p1}, Landroid/support/v4/app/c$a;->g()I

    move-result v3

    const-string v4, "android.support.action.semanticAction"

    invoke-virtual {v1, v4, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const/16 v3, 0x1c

    if-lt v2, v3, :cond_3

    invoke-virtual {p1}, Landroid/support/v4/app/c$a;->g()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/app/Notification$Action$Builder;->setSemanticAction(I)Landroid/app/Notification$Action$Builder;

    :cond_3
    invoke-virtual {p1}, Landroid/support/v4/app/c$a;->h()Z

    move-result p1

    const-string v2, "android.support.action.showsUserInterface"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Landroid/app/Notification$Action$Builder;->addExtras(Landroid/os/Bundle;)Landroid/app/Notification$Action$Builder;

    iget-object p1, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    invoke-virtual {v0}, Landroid/app/Notification$Action$Builder;->build()Landroid/app/Notification$Action;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/Notification$Builder;->addAction(Landroid/app/Notification$Action;)Landroid/app/Notification$Builder;

    goto :goto_2

    :cond_4
    const/16 v1, 0x10

    if-lt v0, v1, :cond_5

    iget-object v0, p0, Landroid/support/v4/app/d;->e:Ljava/util/List;

    iget-object v1, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    invoke-static {v1, p1}, Landroid/support/v4/app/e;->f(Landroid/app/Notification$Builder;Landroid/support/v4/app/c$a;)Landroid/os/Bundle;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5
    :goto_2
    return-void
.end method

.method private d(Landroid/app/Notification;)V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p1, Landroid/app/Notification;->sound:Landroid/net/Uri;

    iput-object v0, p1, Landroid/app/Notification;->vibrate:[J

    iget v0, p1, Landroid/app/Notification;->defaults:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p1, Landroid/app/Notification;->defaults:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p1, Landroid/app/Notification;->defaults:I

    return-void
.end method


# virtual methods
.method public b()Landroid/app/Notification;
    .locals 5

    iget-object v0, p0, Landroid/support/v4/app/d;->b:Landroid/support/v4/app/c$b;

    iget-object v0, v0, Landroid/support/v4/app/c$b;->o:Landroid/support/v4/app/c$c;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Landroid/support/v4/app/c$c;->b(Landroid/support/v4/app/b;)V

    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0, p0}, Landroid/support/v4/app/c$c;->d(Landroid/support/v4/app/b;)Landroid/widget/RemoteViews;

    move-result-object v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/support/v4/app/d;->c()Landroid/app/Notification;

    move-result-object v2

    if-eqz v1, :cond_2

    :goto_1
    iput-object v1, v2, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    goto :goto_2

    :cond_2
    iget-object v1, p0, Landroid/support/v4/app/d;->b:Landroid/support/v4/app/c$b;

    iget-object v1, v1, Landroid/support/v4/app/c$b;->F:Landroid/widget/RemoteViews;

    if-eqz v1, :cond_3

    goto :goto_1

    :cond_3
    :goto_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v1, v3, :cond_4

    if-eqz v0, :cond_4

    invoke-virtual {v0, p0}, Landroid/support/v4/app/c$c;->c(Landroid/support/v4/app/b;)Landroid/widget/RemoteViews;

    move-result-object v4

    if-eqz v4, :cond_4

    iput-object v4, v2, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;

    :cond_4
    const/16 v4, 0x15

    if-lt v1, v4, :cond_5

    if-eqz v0, :cond_5

    iget-object v4, p0, Landroid/support/v4/app/d;->b:Landroid/support/v4/app/c$b;

    iget-object v4, v4, Landroid/support/v4/app/c$b;->o:Landroid/support/v4/app/c$c;

    invoke-virtual {v4, p0}, Landroid/support/v4/app/c$c;->e(Landroid/support/v4/app/b;)Landroid/widget/RemoteViews;

    move-result-object v4

    if-eqz v4, :cond_5

    iput-object v4, v2, Landroid/app/Notification;->headsUpContentView:Landroid/widget/RemoteViews;

    :cond_5
    if-lt v1, v3, :cond_6

    if-eqz v0, :cond_6

    invoke-static {v2}, Landroid/support/v4/app/c;->a(Landroid/app/Notification;)Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_6

    invoke-virtual {v0, v1}, Landroid/support/v4/app/c$c;->a(Landroid/os/Bundle;)V

    :cond_6
    return-object v2
.end method

.method protected c()Landroid/app/Notification;
    .locals 7

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    return-object v0

    :cond_0
    const/16 v1, 0x18

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-lt v0, v1, :cond_3

    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    iget v1, p0, Landroid/support/v4/app/d;->g:I

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Landroid/app/Notification;->getGroup()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    iget v1, v0, Landroid/app/Notification;->flags:I

    and-int/lit16 v1, v1, 0x200

    if-eqz v1, :cond_1

    iget v1, p0, Landroid/support/v4/app/d;->g:I

    if-ne v1, v3, :cond_1

    invoke-direct {p0, v0}, Landroid/support/v4/app/d;->d(Landroid/app/Notification;)V

    :cond_1
    invoke-virtual {v0}, Landroid/app/Notification;->getGroup()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    iget v1, v0, Landroid/app/Notification;->flags:I

    and-int/lit16 v1, v1, 0x200

    if-nez v1, :cond_2

    iget v1, p0, Landroid/support/v4/app/d;->g:I

    if-ne v1, v2, :cond_2

    invoke-direct {p0, v0}, Landroid/support/v4/app/d;->d(Landroid/app/Notification;)V

    :cond_2
    return-object v0

    :cond_3
    const/16 v1, 0x15

    if-lt v0, v1, :cond_9

    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    iget-object v1, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setExtras(Landroid/os/Bundle;)Landroid/app/Notification$Builder;

    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/app/d;->c:Landroid/widget/RemoteViews;

    if-eqz v1, :cond_4

    iput-object v1, v0, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    :cond_4
    iget-object v1, p0, Landroid/support/v4/app/d;->d:Landroid/widget/RemoteViews;

    if-eqz v1, :cond_5

    iput-object v1, v0, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;

    :cond_5
    iget-object v1, p0, Landroid/support/v4/app/d;->h:Landroid/widget/RemoteViews;

    if-eqz v1, :cond_6

    iput-object v1, v0, Landroid/app/Notification;->headsUpContentView:Landroid/widget/RemoteViews;

    :cond_6
    iget v1, p0, Landroid/support/v4/app/d;->g:I

    if-eqz v1, :cond_8

    invoke-virtual {v0}, Landroid/app/Notification;->getGroup()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_7

    iget v1, v0, Landroid/app/Notification;->flags:I

    and-int/lit16 v1, v1, 0x200

    if-eqz v1, :cond_7

    iget v1, p0, Landroid/support/v4/app/d;->g:I

    if-ne v1, v3, :cond_7

    invoke-direct {p0, v0}, Landroid/support/v4/app/d;->d(Landroid/app/Notification;)V

    :cond_7
    invoke-virtual {v0}, Landroid/app/Notification;->getGroup()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_8

    iget v1, v0, Landroid/app/Notification;->flags:I

    and-int/lit16 v1, v1, 0x200

    if-nez v1, :cond_8

    iget v1, p0, Landroid/support/v4/app/d;->g:I

    if-ne v1, v2, :cond_8

    invoke-direct {p0, v0}, Landroid/support/v4/app/d;->d(Landroid/app/Notification;)V

    :cond_8
    return-object v0

    :cond_9
    const/16 v1, 0x14

    if-lt v0, v1, :cond_e

    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    iget-object v1, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setExtras(Landroid/os/Bundle;)Landroid/app/Notification$Builder;

    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/app/d;->c:Landroid/widget/RemoteViews;

    if-eqz v1, :cond_a

    iput-object v1, v0, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    :cond_a
    iget-object v1, p0, Landroid/support/v4/app/d;->d:Landroid/widget/RemoteViews;

    if-eqz v1, :cond_b

    iput-object v1, v0, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;

    :cond_b
    iget v1, p0, Landroid/support/v4/app/d;->g:I

    if-eqz v1, :cond_d

    invoke-virtual {v0}, Landroid/app/Notification;->getGroup()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_c

    iget v1, v0, Landroid/app/Notification;->flags:I

    and-int/lit16 v1, v1, 0x200

    if-eqz v1, :cond_c

    iget v1, p0, Landroid/support/v4/app/d;->g:I

    if-ne v1, v3, :cond_c

    invoke-direct {p0, v0}, Landroid/support/v4/app/d;->d(Landroid/app/Notification;)V

    :cond_c
    invoke-virtual {v0}, Landroid/app/Notification;->getGroup()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_d

    iget v1, v0, Landroid/app/Notification;->flags:I

    and-int/lit16 v1, v1, 0x200

    if-nez v1, :cond_d

    iget v1, p0, Landroid/support/v4/app/d;->g:I

    if-ne v1, v2, :cond_d

    invoke-direct {p0, v0}, Landroid/support/v4/app/d;->d(Landroid/app/Notification;)V

    :cond_d
    return-object v0

    :cond_e
    const/16 v1, 0x13

    const-string v2, "android.support.actionExtras"

    if-lt v0, v1, :cond_12

    iget-object v0, p0, Landroid/support/v4/app/d;->e:Ljava/util/List;

    invoke-static {v0}, Landroid/support/v4/app/e;->a(Ljava/util/List;)Landroid/util/SparseArray;

    move-result-object v0

    if-eqz v0, :cond_f

    iget-object v1, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    :cond_f
    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    iget-object v1, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setExtras(Landroid/os/Bundle;)Landroid/app/Notification$Builder;

    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/app/d;->c:Landroid/widget/RemoteViews;

    if-eqz v1, :cond_10

    iput-object v1, v0, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    :cond_10
    iget-object v1, p0, Landroid/support/v4/app/d;->d:Landroid/widget/RemoteViews;

    if-eqz v1, :cond_11

    iput-object v1, v0, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;

    :cond_11
    return-object v0

    :cond_12
    const/16 v1, 0x10

    if-lt v0, v1, :cond_18

    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/app/c;->a(Landroid/app/Notification;)Landroid/os/Bundle;

    move-result-object v1

    new-instance v3, Landroid/os/Bundle;

    iget-object v4, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    invoke-direct {v3, v4}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    iget-object v4, p0, Landroid/support/v4/app/d;->f:Landroid/os/Bundle;

    invoke-virtual {v4}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_13
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_14

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_13

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto :goto_0

    :cond_14
    invoke-virtual {v1, v3}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    iget-object v1, p0, Landroid/support/v4/app/d;->e:Ljava/util/List;

    invoke-static {v1}, Landroid/support/v4/app/e;->a(Ljava/util/List;)Landroid/util/SparseArray;

    move-result-object v1

    if-eqz v1, :cond_15

    invoke-static {v0}, Landroid/support/v4/app/c;->a(Landroid/app/Notification;)Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v3, v2, v1}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    :cond_15
    iget-object v1, p0, Landroid/support/v4/app/d;->c:Landroid/widget/RemoteViews;

    if-eqz v1, :cond_16

    iput-object v1, v0, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    :cond_16
    iget-object v1, p0, Landroid/support/v4/app/d;->d:Landroid/widget/RemoteViews;

    if-eqz v1, :cond_17

    iput-object v1, v0, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;

    :cond_17
    return-object v0

    :cond_18
    iget-object v0, p0, Landroid/support/v4/app/d;->a:Landroid/app/Notification$Builder;

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v0

    return-object v0
.end method
