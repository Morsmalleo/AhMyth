.class public final Landroid/support/v4/os/ParcelableCompat;
.super Ljava/lang/Object;
.source "ParcelableCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newCreator(Landroid/support/v4/os/ParcelableCompatCreatorCallbacks;)Landroid/os/Parcelable$Creator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/support/v4/os/ParcelableCompatCreatorCallbacks<",
            "TT;>;)",
            "Landroid/os/Parcelable$Creator<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 41
    new-instance v0, Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2;

    invoke-direct {v0, p0}, Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2;-><init>(Landroid/support/v4/os/ParcelableCompatCreatorCallbacks;)V

    return-object v0
.end method
