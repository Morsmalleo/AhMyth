.class public Lahmyth/mine/king/ahmyth/LocManager;
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
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->isGPSEnabled:Z

    .line 21
    iput-boolean v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->isNetworkEnabled:Z

    .line 23
    iput-boolean v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->canGetLocation:Z

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->mContext:Landroid/content/Context;

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->isGPSEnabled:Z

    .line 21
    iput-boolean v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->isNetworkEnabled:Z

    .line 23
    iput-boolean v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->canGetLocation:Z

    .line 41
    iput-object p1, p0, Lahmyth/mine/king/ahmyth/LocManager;->mContext:Landroid/content/Context;

    .line 42
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/LocManager;->getLocation()Landroid/location/Location;

    .line 43
    return-void
.end method


# virtual methods
.method public canGetLocation()Z
    .locals 1

    .line 142
    iget-boolean v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->canGetLocation:Z

    return v0
.end method

.method public getLatitude()D
    .locals 2

    .line 115
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->location:Landroid/location/Location;

    if-eqz v0, :cond_0

    .line 116
    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->latitude:D

    .line 120
    :cond_0
    iget-wide v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->latitude:D

    return-wide v0
.end method

.method public getLocation()Landroid/location/Location;
    .locals 11

    .line 48
    const-string v0, "Network"

    const-string v1, "network"

    const-string v2, "gps"

    :try_start_0
    iget-object v3, p0, Lahmyth/mine/king/ahmyth/LocManager;->mContext:Landroid/content/Context;

    const-string v4, "location"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/location/LocationManager;

    iput-object v3, p0, Lahmyth/mine/king/ahmyth/LocManager;->locationManager:Landroid/location/LocationManager;

    .line 50
    invoke-virtual {v3, v2}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lahmyth/mine/king/ahmyth/LocManager;->isGPSEnabled:Z

    .line 52
    iget-object v3, p0, Lahmyth/mine/king/ahmyth/LocManager;->locationManager:Landroid/location/LocationManager;

    invoke-virtual {v3, v1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lahmyth/mine/king/ahmyth/LocManager;->isNetworkEnabled:Z

    .line 54
    iget-boolean v4, p0, Lahmyth/mine/king/ahmyth/LocManager;->isGPSEnabled:Z

    if-nez v4, :cond_0

    if-eqz v3, :cond_2

    .line 56
    :cond_0
    const/4 v4, 0x1

    iput-boolean v4, p0, Lahmyth/mine/king/ahmyth/LocManager;->canGetLocation:Z

    .line 59
    if-eqz v3, :cond_1

    .line 60
    iget-object v5, p0, Lahmyth/mine/king/ahmyth/LocManager;->locationManager:Landroid/location/LocationManager;

    const-string v6, "network"

    const-wide/32 v7, 0xea60

    const/high16 v9, 0x41200000    # 10.0f

    move-object v10, p0

    invoke-virtual/range {v5 .. v10}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 62
    invoke-static {v0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->locationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_1

    .line 64
    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->location:Landroid/location/Location;

    .line 66
    if-eqz v0, :cond_1

    .line 67
    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->latitude:D

    .line 68
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->longitude:D

    .line 74
    :cond_1
    iget-boolean v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->isGPSEnabled:Z

    if-eqz v0, :cond_2

    .line 75
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->location:Landroid/location/Location;

    if-nez v0, :cond_2

    .line 76
    iget-object v3, p0, Lahmyth/mine/king/ahmyth/LocManager;->locationManager:Landroid/location/LocationManager;

    const-string v4, "gps"

    const-wide/32 v5, 0xea60

    const/high16 v7, 0x41200000    # 10.0f

    move-object v8, p0

    invoke-virtual/range {v3 .. v8}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 79
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->locationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_2

    .line 80
    invoke-virtual {v0, v2}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->location:Landroid/location/Location;

    .line 82
    if-eqz v0, :cond_2

    .line 83
    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->latitude:D

    .line 84
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->longitude:D
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    :cond_2
    goto :goto_0

    .line 91
    :catch_0
    move-exception v0

    .line 92
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 95
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/LocManager;->stopUsingGPS()V

    .line 96
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->location:Landroid/location/Location;

    return-object v0
.end method

.method public getLongitude()D
    .locals 2

    .line 128
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->location:Landroid/location/Location;

    if-eqz v0, :cond_0

    .line 129
    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->longitude:D

    .line 133
    :cond_0
    iget-wide v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->longitude:D

    return-wide v0
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .locals 0
    .param p1, "location"    # Landroid/location/Location;

    .line 149
    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .line 153
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .line 157
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;
    .param p2, "status"    # I
    .param p3, "extras"    # Landroid/os/Bundle;

    .line 161
    return-void
.end method

.method public stopUsingGPS()V
    .locals 1

    .line 105
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/LocManager;->locationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_0

    .line 106
    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 108
    :cond_0
    return-void
.end method
