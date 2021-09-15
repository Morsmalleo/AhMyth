.class Landroidx/core/location/LocationManagerCompat$GpsStatusTransport$4;
.super Ljava/lang/Object;
.source "LocationManagerCompat.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;->onGpsStatusChanged(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;

.field final synthetic val$executor:Ljava/util/concurrent/Executor;

.field final synthetic val$gnssStatus:Landroidx/core/location/GnssStatusCompat;


# direct methods
.method constructor <init>(Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;Ljava/util/concurrent/Executor;Landroidx/core/location/GnssStatusCompat;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;

    .line 508
    iput-object p1, p0, Landroidx/core/location/LocationManagerCompat$GpsStatusTransport$4;->this$0:Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;

    iput-object p2, p0, Landroidx/core/location/LocationManagerCompat$GpsStatusTransport$4;->val$executor:Ljava/util/concurrent/Executor;

    iput-object p3, p0, Landroidx/core/location/LocationManagerCompat$GpsStatusTransport$4;->val$gnssStatus:Landroidx/core/location/GnssStatusCompat;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 511
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$GpsStatusTransport$4;->this$0:Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;

    iget-object v0, v0, Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;->mExecutor:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Landroidx/core/location/LocationManagerCompat$GpsStatusTransport$4;->val$executor:Ljava/util/concurrent/Executor;

    if-eq v0, v1, :cond_0

    .line 512
    return-void

    .line 514
    :cond_0
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$GpsStatusTransport$4;->this$0:Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;

    iget-object v0, v0, Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;->mCallback:Landroidx/core/location/GnssStatusCompat$Callback;

    iget-object v1, p0, Landroidx/core/location/LocationManagerCompat$GpsStatusTransport$4;->val$gnssStatus:Landroidx/core/location/GnssStatusCompat;

    invoke-virtual {v0, v1}, Landroidx/core/location/GnssStatusCompat$Callback;->onSatelliteStatusChanged(Landroidx/core/location/GnssStatusCompat;)V

    .line 515
    return-void
.end method
