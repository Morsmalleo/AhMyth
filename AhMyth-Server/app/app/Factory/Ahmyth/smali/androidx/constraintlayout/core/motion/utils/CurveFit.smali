.class public abstract Landroidx/constraintlayout/core/motion/utils/CurveFit;
.super Ljava/lang/Object;
.source "CurveFit.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/core/motion/utils/CurveFit$Constant;
    }
.end annotation


# static fields
.field public static final CONSTANT:I = 0x2

.field public static final LINEAR:I = 0x1

.field public static final SPLINE:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(I[D[[D)Landroidx/constraintlayout/core/motion/utils/CurveFit;
    .locals 4
    .param p0, "type"    # I
    .param p1, "time"    # [D
    .param p2, "y"    # [[D

    .line 32
    array-length v0, p1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 33
    const/4 p0, 0x2

    .line 35
    :cond_0
    packed-switch p0, :pswitch_data_0

    .line 41
    :pswitch_0
    new-instance v0, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;

    invoke-direct {v0, p1, p2}, Landroidx/constraintlayout/core/motion/utils/LinearCurveFit;-><init>([D[[D)V

    return-object v0

    .line 39
    :pswitch_1
    new-instance v0, Landroidx/constraintlayout/core/motion/utils/CurveFit$Constant;

    const/4 v1, 0x0

    aget-wide v2, p1, v1

    aget-object v1, p2, v1

    invoke-direct {v0, v2, v3, v1}, Landroidx/constraintlayout/core/motion/utils/CurveFit$Constant;-><init>(D[D)V

    return-object v0

    .line 37
    :pswitch_2
    new-instance v0, Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;

    invoke-direct {v0, p1, p2}, Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;-><init>([D[[D)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static getArc([I[D[[D)Landroidx/constraintlayout/core/motion/utils/CurveFit;
    .locals 1
    .param p0, "arcModes"    # [I
    .param p1, "time"    # [D
    .param p2, "y"    # [[D

    .line 46
    new-instance v0, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit;

    invoke-direct {v0, p0, p1, p2}, Landroidx/constraintlayout/core/motion/utils/ArcCurveFit;-><init>([I[D[[D)V

    return-object v0
.end method


# virtual methods
.method public abstract getPos(DI)D
.end method

.method public abstract getPos(D[D)V
.end method

.method public abstract getPos(D[F)V
.end method

.method public abstract getSlope(DI)D
.end method

.method public abstract getSlope(D[D)V
.end method

.method public abstract getTimePoints()[D
.end method
