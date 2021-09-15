.class Landroidx/core/os/ProcessCompat$Api24Impl;
.super Ljava/lang/Object;
.source "ProcessCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/os/ProcessCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Api24Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    return-void
.end method

.method static isApplicationUid(I)Z
    .locals 1
    .param p0, "uid"    # I

    .line 75
    invoke-static {p0}, Landroid/os/Process;->isApplicationUid(I)Z

    move-result v0

    return v0
.end method
