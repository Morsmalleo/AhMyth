.class public final Landroid/support/v4/os/ParcelCompat;
.super Ljava/lang/Object;
.source "ParcelCompat.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readBoolean(Landroid/os/Parcel;)Z
    .locals 0

    .line 30
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static writeBoolean(Landroid/os/Parcel;Z)V
    .locals 0

    .line 41
    invoke-virtual {p0, p1}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
