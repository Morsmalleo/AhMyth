.class public Lahmyth/mine/king/ahmyth/f;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/location/LocationListener;


# instance fields
.field private final a:Landroid/content/Context;

.field b:Z

.field c:Z

.field d:Z

.field e:Landroid/location/Location;

.field f:D

.field g:D

.field protected h:Landroid/location/LocationManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lahmyth/mine/king/ahmyth/f;->b:Z

    iput-boolean v0, p0, Lahmyth/mine/king/ahmyth/f;->c:Z

    iput-boolean v0, p0, Lahmyth/mine/king/ahmyth/f;->d:Z

    iput-object p1, p0, Lahmyth/mine/king/ahmyth/f;->a:Landroid/content/Context;

    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/f;->c()Landroid/location/Location;

    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    iget-boolean v0, p0, Lahmyth/mine/king/ahmyth/f;->d:Z

    return v0
.end method

.method public b()D
    .locals 2

    iget-object v0, p0, Lahmyth/mine/king/ahmyth/f;->e:Landroid/location/Location;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/f;->f:D

    :cond_0
    iget-wide v0, p0, Lahmyth/mine/king/ahmyth/f;->f:D

    return-wide v0
.end method

.method public c()Landroid/location/Location;
    .locals 11

    const-string v0, "Network"

    const-string v1, "network"

    const-string v2, "gps"

    :try_start_0
    iget-object v3, p0, Lahmyth/mine/king/ahmyth/f;->a:Landroid/content/Context;

    const-string v4, "location"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/location/LocationManager;

    iput-object v3, p0, Lahmyth/mine/king/ahmyth/f;->h:Landroid/location/LocationManager;

    invoke-virtual {v3, v2}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lahmyth/mine/king/ahmyth/f;->b:Z

    iget-object v3, p0, Lahmyth/mine/king/ahmyth/f;->h:Landroid/location/LocationManager;

    invoke-virtual {v3, v1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lahmyth/mine/king/ahmyth/f;->c:Z

    iget-boolean v4, p0, Lahmyth/mine/king/ahmyth/f;->b:Z

    if-nez v4, :cond_0

    if-eqz v3, :cond_2

    :cond_0
    const/4 v4, 0x1

    iput-boolean v4, p0, Lahmyth/mine/king/ahmyth/f;->d:Z

    if-eqz v3, :cond_1

    iget-object v5, p0, Lahmyth/mine/king/ahmyth/f;->h:Landroid/location/LocationManager;

    const-string v6, "network"

    const-wide/32 v7, 0xea60

    const/high16 v9, 0x41200000    # 10.0f

    move-object v10, p0

    invoke-virtual/range {v5 .. v10}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    invoke-static {v0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lahmyth/mine/king/ahmyth/f;->h:Landroid/location/LocationManager;

    if-eqz v0, :cond_1

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lahmyth/mine/king/ahmyth/f;->e:Landroid/location/Location;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/f;->f:D

    iget-object v0, p0, Lahmyth/mine/king/ahmyth/f;->e:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/f;->g:D

    :cond_1
    iget-boolean v0, p0, Lahmyth/mine/king/ahmyth/f;->b:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lahmyth/mine/king/ahmyth/f;->e:Landroid/location/Location;

    if-nez v0, :cond_2

    iget-object v3, p0, Lahmyth/mine/king/ahmyth/f;->h:Landroid/location/LocationManager;

    const-string v4, "gps"

    const-wide/32 v5, 0xea60

    const/high16 v7, 0x41200000    # 10.0f

    move-object v8, p0

    invoke-virtual/range {v3 .. v8}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    iget-object v0, p0, Lahmyth/mine/king/ahmyth/f;->h:Landroid/location/LocationManager;

    if-eqz v0, :cond_2

    invoke-virtual {v0, v2}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lahmyth/mine/king/ahmyth/f;->e:Landroid/location/Location;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/f;->f:D

    iget-object v0, p0, Lahmyth/mine/king/ahmyth/f;->e:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/f;->g:D
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    :goto_0
    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/f;->e()V

    iget-object v0, p0, Lahmyth/mine/king/ahmyth/f;->e:Landroid/location/Location;

    return-object v0
.end method

.method public d()D
    .locals 2

    iget-object v0, p0, Lahmyth/mine/king/ahmyth/f;->e:Landroid/location/Location;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lahmyth/mine/king/ahmyth/f;->g:D

    :cond_0
    iget-wide v0, p0, Lahmyth/mine/king/ahmyth/f;->g:D

    return-wide v0
.end method

.method public e()V
    .locals 1

    iget-object v0, p0, Lahmyth/mine/king/ahmyth/f;->h:Landroid/location/LocationManager;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    :cond_0
    return-void
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .locals 0

    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0

    return-void
.end method
