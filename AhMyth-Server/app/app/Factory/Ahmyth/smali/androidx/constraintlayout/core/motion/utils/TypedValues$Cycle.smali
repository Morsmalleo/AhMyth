.class public interface abstract Landroidx/constraintlayout/core/motion/utils/TypedValues$Cycle;
.super Ljava/lang/Object;
.source "TypedValues.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/core/motion/utils/TypedValues;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Cycle"
.end annotation


# static fields
.field public static final KEY_WORDS:[Ljava/lang/String;

.field public static final S_ALPHA:Ljava/lang/String; = "alpha"

.field public static final S_CURVE_FIT:Ljava/lang/String; = "curveFit"

.field public static final S_CUSTOM_WAVE_SHAPE:Ljava/lang/String; = "customWave"

.field public static final S_EASING:Ljava/lang/String; = "easing"

.field public static final S_ELEVATION:Ljava/lang/String; = "elevation"

.field public static final S_PATH_ROTATE:Ljava/lang/String; = "pathRotate"

.field public static final S_PIVOT_X:Ljava/lang/String; = "pivotX"

.field public static final S_PIVOT_Y:Ljava/lang/String; = "pivotY"

.field public static final S_PROGRESS:Ljava/lang/String; = "progress"

.field public static final S_ROTATION_X:Ljava/lang/String; = "rotationX"

.field public static final S_ROTATION_Y:Ljava/lang/String; = "rotationY"

.field public static final S_ROTATION_Z:Ljava/lang/String; = "rotationZ"

.field public static final S_SCALE_X:Ljava/lang/String; = "scaleX"

.field public static final S_SCALE_Y:Ljava/lang/String; = "scaleY"

.field public static final S_TRANSLATION_X:Ljava/lang/String; = "translationX"

.field public static final S_TRANSLATION_Y:Ljava/lang/String; = "translationY"

.field public static final S_TRANSLATION_Z:Ljava/lang/String; = "translationZ"

.field public static final S_VISIBILITY:Ljava/lang/String; = "visibility"

.field public static final S_WAVE_OFFSET:Ljava/lang/String; = "offset"

.field public static final S_WAVE_PERIOD:Ljava/lang/String; = "period"

.field public static final S_WAVE_PHASE:Ljava/lang/String; = "phase"

.field public static final S_WAVE_SHAPE:Ljava/lang/String; = "waveShape"

.field public static final TYPE_ALPHA:I = 0x193

.field public static final TYPE_CURVE_FIT:I = 0x191

.field public static final TYPE_CUSTOM_WAVE_SHAPE:I = 0x1a6

.field public static final TYPE_EASING:I = 0x1a4

.field public static final TYPE_ELEVATION:I = 0x133

.field public static final TYPE_PATH_ROTATE:I = 0x1a0

.field public static final TYPE_PIVOT_X:I = 0x139

.field public static final TYPE_PIVOT_Y:I = 0x13a

.field public static final TYPE_PROGRESS:I = 0x13b

.field public static final TYPE_ROTATION_X:I = 0x134

.field public static final TYPE_ROTATION_Y:I = 0x135

.field public static final TYPE_ROTATION_Z:I = 0x136

.field public static final TYPE_SCALE_X:I = 0x137

.field public static final TYPE_SCALE_Y:I = 0x138

.field public static final TYPE_TRANSLATION_X:I = 0x130

.field public static final TYPE_TRANSLATION_Y:I = 0x131

.field public static final TYPE_TRANSLATION_Z:I = 0x132

.field public static final TYPE_VISIBILITY:I = 0x192

.field public static final TYPE_WAVE_OFFSET:I = 0x1a8

.field public static final TYPE_WAVE_PERIOD:I = 0x1a7

.field public static final TYPE_WAVE_PHASE:I = 0x1a9

.field public static final TYPE_WAVE_SHAPE:I = 0x1a5


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 268
    const/16 v0, 0x16

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "curveFit"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "visibility"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "alpha"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "translationX"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "translationY"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "translationZ"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "elevation"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "rotationX"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "rotationY"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "rotationZ"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "scaleX"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "scaleY"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "pivotX"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "pivotY"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "progress"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "pathRotate"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "easing"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "waveShape"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "customWave"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "period"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "offset"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "phase"

    aput-object v2, v0, v1

    sput-object v0, Landroidx/constraintlayout/core/motion/utils/TypedValues$Cycle;->KEY_WORDS:[Ljava/lang/String;

    return-void
.end method
