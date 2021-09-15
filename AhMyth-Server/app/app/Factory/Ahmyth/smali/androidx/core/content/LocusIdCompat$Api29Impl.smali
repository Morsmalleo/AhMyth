.class Landroidx/core/content/LocusIdCompat$Api29Impl;
.super Ljava/lang/Object;
.source "LocusIdCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/content/LocusIdCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Api29Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static create(Ljava/lang/String;)Landroid/content/LocusId;
    .locals 1
    .param p0, "id"    # Ljava/lang/String;

    .line 155
    new-instance v0, Landroid/content/LocusId;

    invoke-direct {v0, p0}, Landroid/content/LocusId;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method static getId(Landroid/content/LocusId;)Ljava/lang/String;
    .locals 1
    .param p0, "obj"    # Landroid/content/LocusId;

    .line 163
    invoke-virtual {p0}, Landroid/content/LocusId;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
