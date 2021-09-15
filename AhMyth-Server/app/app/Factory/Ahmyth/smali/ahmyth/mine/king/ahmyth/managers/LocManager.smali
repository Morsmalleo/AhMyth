.class public Lahmyth/mine/king/ahmyth/managers/LocManager;
.super Ljava/lang/Object;
.source "LocManager.java"

# interfaces
.implements Landroid/location/LocationListener;


# static fields
.field private static final MIN_DISTANCE_CHANGE_FOR_UPDATES:J = 0xaL

.field private static final MIN_TIME_BW_UPDATES:J = 0xea60L


# instance fields
.field canGetLocation:Z

.field isGPSEnabled:Z

.field isNetworkEnabled:Z

.field latitude:D

.field location:Landroid/location/Location;

.field protected locationManager:Landroid/location/LocationManager;

.field longitude:D

.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->isGPSEnabled:Z

    .line 19
    iput-boolean v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->isNetworkEnabled:Z

    .line 20
    iput-boolean v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->canGetLocation:Z

    .line 29
    iput-object p1, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->mContext:Landroid/content/Context;

    .line 30
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/managers/LocManager;->getLocation()V

    .line 31
    return-void
.end method


# virtual methods
.method public canGetLocation()Z
    .locals 1

    .line 119
    iget-boolean v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->canGetLocation:Z

    return v0
.end method

.method public checkLocationPermission()Z
    .locals 2

    .line 123
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v0, v1}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v0, v1}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getLatitude()D
    .locals 2

    .line 101
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->location:Landroid/location/Location;

    if-eqz v0, :cond_0

    .line 102
    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->latitude:D

    .line 106
    :cond_0
    iget-wide v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->latitude:D

    return-wide v0
.end method

.method public getLocation()V
    .locals 9

    .line 35
    const-string v0, "network"

    const-string v1, "gps"

    :try_start_0
    iget-object v2, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->mContext:Landroid/content/Context;

    const-string v3, "location"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/LocationManager;

    iput-object v2, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->locationManager:Landroid/location/LocationManager;

    .line 37
    invoke-virtual {v2, v1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->isGPSEnabled:Z

    .line 39
    iget-object v2, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->locationManager:Landroid/location/LocationManager;

    invoke-virtual {v2, v0}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->isNetworkEnabled:Z

    .line 41
    iget-boolean v3, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->isGPSEnabled:Z

    if-nez v3, :cond_0

    if-eqz v2, :cond_4

    .line 43
    :cond_0
    const/4 v3, 0x1

    iput-boolean v3, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->canGetLocation:Z

    .line 46
    if-eqz v2, :cond_2

    .line 48
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/managers/LocManager;->checkLocationPermission()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 49
    iget-object v3, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->locationManager:Landroid/location/LocationManager;

    const-string v4, "network"

    const-wide/32 v5, 0xea60

    const/high16 v7, 0x41200000    # 10.0f

    move-object v8, p0

    invoke-virtual/range {v3 .. v8}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 52
    :cond_1
    iget-object v2, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->locationManager:Landroid/location/LocationManager;

    if-eqz v2, :cond_2

    .line 53
    invoke-virtual {v2, v0}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->location:Landroid/location/Location;

    .line 55
    if-eqz v0, :cond_2

    .line 56
    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    iput-wide v2, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->latitude:D

    .line 57
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    iput-wide v2, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->longitude:D

    .line 63
    :cond_2
    iget-boolean v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->isGPSEnabled:Z

    if-eqz v0, :cond_4

    .line 65
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->location:Landroid/location/Location;

    if-nez v0, :cond_4

    .line 67
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/managers/LocManager;->checkLocationPermission()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 68
    iget-object v2, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->locationManager:Landroid/location/LocationManager;

    const-string v3, "gps"

    const-wide/32 v4, 0xea60

    const/high16 v6, 0x41200000    # 10.0f

    move-object v7, p0

    invoke-virtual/range {v2 .. v7}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 71
    :cond_3
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->locationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_4

    .line 73
    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->location:Landroid/location/Location;

    .line 75
    if-eqz v0, :cond_4

    .line 76
    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->latitude:D

    .line 77
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->longitude:D
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    :cond_4
    goto :goto_0

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 89
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/managers/LocManager;->stopUsingGPS()V

    .line 91
    return-void
.end method

.method public getLongitude()D
    .locals 2

    .line 110
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->location:Landroid/location/Location;

    if-eqz v0, :cond_0

    .line 111
    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->longitude:D

    .line 115
    :cond_0
    iget-wide v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->longitude:D

    return-wide v0
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .locals 0
    .param p1, "location"    # Landroid/location/Location;

    .line 131
    return-void
.end method

.method public stopUsingGPS()V
    .locals 1

    .line 95
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/managers/LocManager;->locationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_0

    .line 96
    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 98
    :cond_0
    return-void
.end method
