.class public final Landroid/support/v4/view/VelocityTrackerCompat;
.super Ljava/lang/Object;
.source "VelocityTrackerCompat.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getXVelocity(Landroid/view/VelocityTracker;I)F
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 37
    invoke-virtual {p0, p1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result p0

    return p0
.end method

.method public static getYVelocity(Landroid/view/VelocityTracker;I)F
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 49
    invoke-virtual {p0, p1}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result p0

    return p0
.end method
