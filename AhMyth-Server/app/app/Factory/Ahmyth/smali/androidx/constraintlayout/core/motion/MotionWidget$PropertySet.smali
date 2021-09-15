.class public Landroidx/constraintlayout/core/motion/MotionWidget$PropertySet;
.super Ljava/lang/Object;
.source "MotionWidget.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/core/motion/MotionWidget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PropertySet"
.end annotation


# instance fields
.field public alpha:F

.field public mProgress:F

.field public mVisibilityMode:I

.field public visibility:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    const/4 v0, 0x4

    iput v0, p0, Landroidx/constraintlayout/core/motion/MotionWidget$PropertySet;->visibility:I

    .line 80
    const/4 v0, 0x0

    iput v0, p0, Landroidx/constraintlayout/core/motion/MotionWidget$PropertySet;->mVisibilityMode:I

    .line 81
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Landroidx/constraintlayout/core/motion/MotionWidget$PropertySet;->alpha:F

    .line 82
    const/high16 v0, 0x7fc00000    # Float.NaN

    iput v0, p0, Landroidx/constraintlayout/core/motion/MotionWidget$PropertySet;->mProgress:F

    return-void
.end method
