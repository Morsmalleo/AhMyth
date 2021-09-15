.class public abstract Landroidx/core/location/GnssStatusCompat;
.super Ljava/lang/Object;
.source "GnssStatusCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/location/GnssStatusCompat$Callback;,
        Landroidx/core/location/GnssStatusCompat$ConstellationType;
    }
.end annotation


# static fields
.field public static final CONSTELLATION_BEIDOU:I = 0x5

.field public static final CONSTELLATION_GALILEO:I = 0x6

.field public static final CONSTELLATION_GLONASS:I = 0x3

.field public static final CONSTELLATION_GPS:I = 0x1

.field public static final CONSTELLATION_IRNSS:I = 0x7

.field public static final CONSTELLATION_QZSS:I = 0x4

.field public static final CONSTELLATION_SBAS:I = 0x2

.field public static final CONSTELLATION_UNKNOWN:I


# direct methods
.method constructor <init>()V
    .locals 0

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static wrap(Landroid/location/GnssStatus;)Landroidx/core/location/GnssStatusCompat;
    .locals 1
    .param p0, "gnssStatus"    # Landroid/location/GnssStatus;

    .line 117
    new-instance v0, Landroidx/core/location/GnssStatusWrapper;

    invoke-direct {v0, p0}, Landroidx/core/location/GnssStatusWrapper;-><init>(Landroid/location/GnssStatus;)V

    return-object v0
.end method

.method public static wrap(Landroid/location/GpsStatus;)Landroidx/core/location/GnssStatusCompat;
    .locals 1
    .param p0, "gpsStatus"    # Landroid/location/GpsStatus;

    .line 126
    new-instance v0, Landroidx/core/location/GpsStatusWrapper;

    invoke-direct {v0, p0}, Landroidx/core/location/GpsStatusWrapper;-><init>(Landroid/location/GpsStatus;)V

    return-object v0
.end method


# virtual methods
.method public abstract getAzimuthDegrees(I)F
.end method

.method public abstract getBasebandCn0DbHz(I)F
.end method

.method public abstract getCarrierFrequencyHz(I)F
.end method

.method public abstract getCn0DbHz(I)F
.end method

.method public abstract getConstellationType(I)I
.end method

.method public abstract getElevationDegrees(I)F
.end method

.method public abstract getSatelliteCount()I
.end method

.method public abstract getSvid(I)I
.end method

.method public abstract hasAlmanacData(I)Z
.end method

.method public abstract hasBasebandCn0DbHz(I)Z
.end method

.method public abstract hasCarrierFrequencyHz(I)Z
.end method

.method public abstract hasEphemerisData(I)Z
.end method

.method public abstract usedInFix(I)Z
.end method
