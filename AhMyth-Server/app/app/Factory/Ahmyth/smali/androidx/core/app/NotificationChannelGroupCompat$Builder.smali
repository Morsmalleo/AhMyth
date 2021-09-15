.class public Landroidx/core/app/NotificationChannelGroupCompat$Builder;
.super Ljava/lang/Object;
.source "NotificationChannelGroupCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/app/NotificationChannelGroupCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field final mGroup:Landroidx/core/app/NotificationChannelGroupCompat;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Landroidx/core/app/NotificationChannelGroupCompat;

    invoke-direct {v0, p1}, Landroidx/core/app/NotificationChannelGroupCompat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Landroidx/core/app/NotificationChannelGroupCompat$Builder;->mGroup:Landroidx/core/app/NotificationChannelGroupCompat;

    .line 64
    return-void
.end method


# virtual methods
.method public build()Landroidx/core/app/NotificationChannelGroupCompat;
    .locals 1

    .line 99
    iget-object v0, p0, Landroidx/core/app/NotificationChannelGroupCompat$Builder;->mGroup:Landroidx/core/app/NotificationChannelGroupCompat;

    return-object v0
.end method

.method public setDescription(Ljava/lang/String;)Landroidx/core/app/NotificationChannelGroupCompat$Builder;
    .locals 1
    .param p1, "description"    # Ljava/lang/String;

    .line 90
    iget-object v0, p0, Landroidx/core/app/NotificationChannelGroupCompat$Builder;->mGroup:Landroidx/core/app/NotificationChannelGroupCompat;

    iput-object p1, v0, Landroidx/core/app/NotificationChannelGroupCompat;->mDescription:Ljava/lang/String;

    .line 91
    return-object p0
.end method

.method public setName(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationChannelGroupCompat$Builder;
    .locals 1
    .param p1, "name"    # Ljava/lang/CharSequence;

    .line 77
    iget-object v0, p0, Landroidx/core/app/NotificationChannelGroupCompat$Builder;->mGroup:Landroidx/core/app/NotificationChannelGroupCompat;

    iput-object p1, v0, Landroidx/core/app/NotificationChannelGroupCompat;->mName:Ljava/lang/CharSequence;

    .line 78
    return-object p0
.end method
