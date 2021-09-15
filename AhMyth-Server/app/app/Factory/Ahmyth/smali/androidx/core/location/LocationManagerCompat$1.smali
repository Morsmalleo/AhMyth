.class Landroidx/core/location/LocationManagerCompat$1;
.super Ljava/lang/Object;
.source "LocationManagerCompat.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/core/location/LocationManagerCompat;->registerGnssStatusCallback(Landroid/location/LocationManager;Landroid/os/Handler;Ljava/util/concurrent/Executor;Landroidx/core/location/GnssStatusCompat$Callback;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$locationManager:Landroid/location/LocationManager;

.field final synthetic val$myTransport:Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;


# direct methods
.method constructor <init>(Landroid/location/LocationManager;Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;)V
    .locals 0

    .line 216
    iput-object p1, p0, Landroidx/core/location/LocationManagerCompat$1;->val$locationManager:Landroid/location/LocationManager;

    iput-object p2, p0, Landroidx/core/location/LocationManagerCompat$1;->val$myTransport:Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Boolean;
    .locals 2

    .line 220
    iget-object v0, p0, Landroidx/core/location/LocationManagerCompat$1;->val$locationManager:Landroid/location/LocationManager;

    iget-object v1, p0, Landroidx/core/location/LocationManagerCompat$1;->val$myTransport:Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->addGpsStatusListener(Landroid/location/GpsStatus$Listener;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 216
    invoke-virtual {p0}, Landroidx/core/location/LocationManagerCompat$1;->call()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
