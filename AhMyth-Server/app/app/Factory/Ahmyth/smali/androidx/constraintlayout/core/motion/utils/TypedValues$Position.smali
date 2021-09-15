.class public interface abstract Landroidx/constraintlayout/core/motion/utils/TypedValues$Position;
.super Ljava/lang/Object;
.source "TypedValues.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/core/motion/utils/TypedValues;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Position"
.end annotation


# static fields
.field public static final KEY_WORDS:[Ljava/lang/String;

.field public static final S_DRAWPATH:Ljava/lang/String; = "drawPath"

.field public static final S_PERCENT_HEIGHT:Ljava/lang/String; = "percentHeight"

.field public static final S_PERCENT_WIDTH:Ljava/lang/String; = "percentWidth"

.field public static final S_PERCENT_X:Ljava/lang/String; = "percentX"

.field public static final S_PERCENT_Y:Ljava/lang/String; = "percentY"

.field public static final S_SIZE_PERCENT:Ljava/lang/String; = "sizePercent"

.field public static final S_TRANSITION_EASING:Ljava/lang/String; = "transitionEasing"

.field public static final TYPE_CURVE_FIT:I = 0x1fc

.field public static final TYPE_DRAWPATH:I = 0x1f6

.field public static final TYPE_PATH_MOTION_ARC:I = 0x1fd

.field public static final TYPE_PERCENT_HEIGHT:I = 0x1f8

.field public static final TYPE_PERCENT_WIDTH:I = 0x1f7

.field public static final TYPE_PERCENT_X:I = 0x1fa

.field public static final TYPE_PERCENT_Y:I = 0x1fb

.field public static final TYPE_POSITION_TYPE:I = 0x1fe

.field public static final TYPE_SIZE_PERCENT:I = 0x1f9

.field public static final TYPE_TRANSITION_EASING:I = 0x1f5


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 437
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "transitionEasing"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "drawPath"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "percentWidth"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "percentHeight"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "sizePercent"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "percentX"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "percentY"

    aput-object v2, v0, v1

    sput-object v0, Landroidx/constraintlayout/core/motion/utils/TypedValues$Position;->KEY_WORDS:[Ljava/lang/String;

    return-void
.end method
