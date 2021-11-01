.class public final Landroid/support/v4/net/ConnectivityManagerCompat;
.super Ljava/lang/Object;
.source "ConnectivityManagerCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/net/ConnectivityManagerCompat$RestrictBackgroundStatus;
    }
.end annotation


# static fields
.field public static final RESTRICT_BACKGROUND_STATUS_DISABLED:I = 0x1

.field public static final RESTRICT_BACKGROUND_STATUS_ENABLED:I = 0x3

.field public static final RESTRICT_BACKGROUND_STATUS_WHITELISTED:I = 0x2


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getNetworkInfoFromBroadcast(Landroid/net/ConnectivityManager;Landroid/content/Intent;)Landroid/net/NetworkInfo;
    .locals 1

    const-string v0, "networkInfo"

    .line 139
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/net/NetworkInfo;

    if-eqz p1, :cond_0

    .line 141
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getType()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getRestrictBackgroundStatus(Landroid/net/ConnectivityManager;)I
    .locals 2

    .line 157
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    .line 158
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getRestrictBackgroundStatus()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x3

    return p0
.end method

.method public static isActiveNetworkMetered(Landroid/net/ConnectivityManager;)Z
    .locals 2

    .line 99
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    .line 100
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->isActiveNetworkMetered()Z

    move-result p0

    return p0

    .line 102
    :cond_0
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p0

    const/4 v0, 0x1

    if-nez p0, :cond_1

    return v0

    .line 108
    :cond_1
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    move-result p0

    if-eq p0, v0, :cond_2

    const/4 v1, 0x7

    if-eq p0, v1, :cond_2

    const/16 v1, 0x9

    if-eq p0, v1, :cond_2

    return v0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method
