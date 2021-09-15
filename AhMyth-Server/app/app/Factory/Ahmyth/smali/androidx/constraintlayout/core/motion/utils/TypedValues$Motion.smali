.class public interface abstract Landroidx/constraintlayout/core/motion/utils/TypedValues$Motion;
.super Ljava/lang/Object;
.source "TypedValues.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/core/motion/utils/TypedValues;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Motion"
.end annotation


# static fields
.field public static final KEY_WORDS:[Ljava/lang/String;

.field public static final S_ANIMATE_CIRCLEANGLE_TO:Ljava/lang/String; = "AnimateCircleAngleTo"

.field public static final S_ANIMATE_RELATIVE_TO:Ljava/lang/String; = "AnimateRelativeTo"

.field public static final S_DRAW_PATH:Ljava/lang/String; = "DrawPath"

.field public static final S_EASING:Ljava/lang/String; = "TransitionEasing"

.field public static final S_PATHMOTION_ARC:Ljava/lang/String; = "PathMotionArc"

.field public static final S_PATH_ROTATE:Ljava/lang/String; = "PathRotate"

.field public static final S_POLAR_RELATIVETO:Ljava/lang/String; = "PolarRelativeTo"

.field public static final S_QUANTIZE_INTERPOLATOR:Ljava/lang/String; = "QuantizeInterpolator"

.field public static final S_QUANTIZE_INTERPOLATOR_ID:Ljava/lang/String; = "QuantizeInterpolatorID"

.field public static final S_QUANTIZE_INTERPOLATOR_TYPE:Ljava/lang/String; = "QuantizeInterpolatorType"

.field public static final S_QUANTIZE_MOTIONSTEPS:Ljava/lang/String; = "QuantizeMotionSteps"

.field public static final S_QUANTIZE_MOTION_PHASE:Ljava/lang/String; = "QuantizeMotionPhase"

.field public static final S_STAGGER:Ljava/lang/String; = "Stagger"

.field public static final TYPE_ANIMATE_CIRCLEANGLE_TO:I = 0x25e

.field public static final TYPE_ANIMATE_RELATIVE_TO:I = 0x25d

.field public static final TYPE_DRAW_PATH:I = 0x260

.field public static final TYPE_EASING:I = 0x25b

.field public static final TYPE_PATHMOTION_ARC:I = 0x25f

.field public static final TYPE_PATH_ROTATE:I = 0x259

.field public static final TYPE_POLAR_RELATIVETO:I = 0x261

.field public static final TYPE_QUANTIZE_INTERPOLATOR:I = 0x25c

.field public static final TYPE_QUANTIZE_INTERPOLATOR_ID:I = 0x264

.field public static final TYPE_QUANTIZE_INTERPOLATOR_TYPE:I = 0x263

.field public static final TYPE_QUANTIZE_MOTIONSTEPS:I = 0x262

.field public static final TYPE_QUANTIZE_MOTION_PHASE:I = 0x25a

.field public static final TYPE_STAGGER:I = 0x258


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 489
    const/16 v0, 0xd

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Stagger"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "PathRotate"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "QuantizeMotionPhase"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "TransitionEasing"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "QuantizeInterpolator"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "AnimateRelativeTo"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "AnimateCircleAngleTo"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "PathMotionArc"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "DrawPath"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "PolarRelativeTo"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "QuantizeMotionSteps"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "QuantizeInterpolatorType"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "QuantizeInterpolatorID"

    aput-object v2, v0, v1

    sput-object v0, Landroidx/constraintlayout/core/motion/utils/TypedValues$Motion;->KEY_WORDS:[Ljava/lang/String;

    return-void
.end method
