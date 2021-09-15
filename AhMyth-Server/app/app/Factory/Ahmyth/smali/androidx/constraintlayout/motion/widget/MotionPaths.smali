.class Landroidx/constraintlayout/motion/widget/MotionPaths;
.super Ljava/lang/Object;
.source "MotionPaths.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Landroidx/constraintlayout/motion/widget/MotionPaths;",
        ">;"
    }
.end annotation


# static fields
.field static final CARTESIAN:I = 0x0

.field public static final DEBUG:Z = false

.field static final OFF_HEIGHT:I = 0x4

.field static final OFF_PATH_ROTATE:I = 0x5

.field static final OFF_POSITION:I = 0x0

.field static final OFF_WIDTH:I = 0x3

.field static final OFF_X:I = 0x1

.field static final OFF_Y:I = 0x2

.field public static final OLD_WAY:Z = false

.field static final PERPENDICULAR:I = 0x1

.field static final SCREEN:I = 0x2

.field public static final TAG:Ljava/lang/String; = "MotionPaths"

.field static names:[Ljava/lang/String;


# instance fields
.field attributes:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Landroidx/constraintlayout/widget/ConstraintAttribute;",
            ">;"
        }
    .end annotation
.end field

.field height:F

.field mAnimateCircleAngleTo:I

.field mAnimateRelativeTo:I

.field mDrawPath:I

.field mKeyFrameEasing:Landroidx/constraintlayout/core/motion/utils/Easing;

.field mMode:I

.field mPathMotionArc:I

.field mPathRotate:F

.field mProgress:F

.field mRelativeAngle:F

.field mRelativeToController:Landroidx/constraintlayout/motion/widget/MotionController;

.field mTempDelta:[D

.field mTempValue:[D

.field position:F

.field time:F

.field width:F

.field x:F

.field y:F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 54
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "position"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "x"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "y"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "width"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "height"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "pathRotate"

    aput-object v2, v0, v1

    sput-object v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->names:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    const/4 v0, 0x0

    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mDrawPath:I

    .line 63
    const/high16 v1, 0x7fc00000    # Float.NaN

    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathRotate:F

    .line 64
    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mProgress:F

    .line 65
    sget v2, Landroidx/constraintlayout/motion/widget/Key;->UNSET:I

    iput v2, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathMotionArc:I

    .line 66
    sget v2, Landroidx/constraintlayout/motion/widget/Key;->UNSET:I

    iput v2, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mAnimateRelativeTo:I

    .line 67
    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeAngle:F

    .line 68
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeToController:Landroidx/constraintlayout/motion/widget/MotionController;

    .line 70
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->attributes:Ljava/util/LinkedHashMap;

    .line 71
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mMode:I

    .line 488
    const/16 v0, 0x12

    new-array v1, v0, [D

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    .line 489
    new-array v0, v0, [D

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempDelta:[D

    .line 76
    return-void
.end method

.method public constructor <init>(IILandroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V
    .locals 3
    .param p1, "parentWidth"    # I
    .param p2, "parentHeight"    # I
    .param p3, "c"    # Landroidx/constraintlayout/motion/widget/KeyPosition;
    .param p4, "startTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .param p5, "endTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "parentWidth",
            "parentHeight",
            "c",
            "startTimePoint",
            "endTimePoint"
        }
    .end annotation

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    const/4 v0, 0x0

    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mDrawPath:I

    .line 63
    const/high16 v1, 0x7fc00000    # Float.NaN

    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathRotate:F

    .line 64
    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mProgress:F

    .line 65
    sget v2, Landroidx/constraintlayout/motion/widget/Key;->UNSET:I

    iput v2, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathMotionArc:I

    .line 66
    sget v2, Landroidx/constraintlayout/motion/widget/Key;->UNSET:I

    iput v2, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mAnimateRelativeTo:I

    .line 67
    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeAngle:F

    .line 68
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeToController:Landroidx/constraintlayout/motion/widget/MotionController;

    .line 70
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->attributes:Ljava/util/LinkedHashMap;

    .line 71
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mMode:I

    .line 488
    const/16 v0, 0x12

    new-array v1, v0, [D

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    .line 489
    new-array v0, v0, [D

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempDelta:[D

    .line 131
    iget v0, p4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mAnimateRelativeTo:I

    sget v1, Landroidx/constraintlayout/motion/widget/Key;->UNSET:I

    if-eq v0, v1, :cond_0

    .line 132
    invoke-virtual/range {p0 .. p5}, Landroidx/constraintlayout/motion/widget/MotionPaths;->initPolar(IILandroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V

    .line 133
    return-void

    .line 135
    :cond_0
    iget v0, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPositionType:I

    packed-switch v0, :pswitch_data_0

    .line 144
    invoke-virtual {p0, p3, p4, p5}, Landroidx/constraintlayout/motion/widget/MotionPaths;->initCartesian(Landroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V

    .line 145
    return-void

    .line 137
    :pswitch_0
    invoke-virtual/range {p0 .. p5}, Landroidx/constraintlayout/motion/widget/MotionPaths;->initScreen(IILandroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V

    .line 138
    return-void

    .line 140
    :pswitch_1
    invoke-virtual {p0, p3, p4, p5}, Landroidx/constraintlayout/motion/widget/MotionPaths;->initPath(Landroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V

    .line 141
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private diff(FF)Z
    .locals 4
    .param p1, "a"    # F
    .param p2, "b"    # F
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "a",
            "b"
        }
    .end annotation

    .line 298
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_2

    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 301
    :cond_0
    sub-float v0, p1, p2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v3, 0x358637bd    # 1.0E-6f

    cmpl-float v0, v0, v3

    if-lez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 299
    :cond_2
    :goto_1
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-eq v0, v3, :cond_3

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    :goto_2
    return v1
.end method

.method private static final xRotate(FFFFFF)F
    .locals 2
    .param p0, "sin"    # F
    .param p1, "cos"    # F
    .param p2, "cx"    # F
    .param p3, "cy"    # F
    .param p4, "x"    # F
    .param p5, "y"    # F
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "sin",
            "cos",
            "cx",
            "cy",
            "x",
            "y"
        }
    .end annotation

    .line 286
    sub-float/2addr p4, p2

    .line 287
    sub-float/2addr p5, p3

    .line 288
    mul-float v0, p4, p1

    mul-float v1, p5, p0

    sub-float/2addr v0, v1

    add-float/2addr v0, p2

    return v0
.end method

.method private static final yRotate(FFFFFF)F
    .locals 2
    .param p0, "sin"    # F
    .param p1, "cos"    # F
    .param p2, "cx"    # F
    .param p3, "cy"    # F
    .param p4, "x"    # F
    .param p5, "y"    # F
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "sin",
            "cos",
            "cx",
            "cy",
            "x",
            "y"
        }
    .end annotation

    .line 292
    sub-float/2addr p4, p2

    .line 293
    sub-float/2addr p5, p3

    .line 294
    mul-float v0, p4, p0

    mul-float v1, p5, p1

    add-float/2addr v0, v1

    add-float/2addr v0, p3

    return v0
.end method


# virtual methods
.method public applyParameters(Landroidx/constraintlayout/widget/ConstraintSet$Constraint;)V
    .locals 6
    .param p1, "c"    # Landroidx/constraintlayout/widget/ConstraintSet$Constraint;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    .line 915
    move-object v0, p0

    .line 916
    .local v0, "point":Landroidx/constraintlayout/motion/widget/MotionPaths;
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->motion:Landroidx/constraintlayout/widget/ConstraintSet$Motion;

    iget-object v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$Motion;->mTransitionEasing:Ljava/lang/String;

    invoke-static {v1}, Landroidx/constraintlayout/core/motion/utils/Easing;->getInterpolator(Ljava/lang/String;)Landroidx/constraintlayout/core/motion/utils/Easing;

    move-result-object v1

    iput-object v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mKeyFrameEasing:Landroidx/constraintlayout/core/motion/utils/Easing;

    .line 917
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->motion:Landroidx/constraintlayout/widget/ConstraintSet$Motion;

    iget v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$Motion;->mPathMotionArc:I

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathMotionArc:I

    .line 918
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->motion:Landroidx/constraintlayout/widget/ConstraintSet$Motion;

    iget v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$Motion;->mAnimateRelativeTo:I

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mAnimateRelativeTo:I

    .line 919
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->motion:Landroidx/constraintlayout/widget/ConstraintSet$Motion;

    iget v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$Motion;->mPathRotate:F

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathRotate:F

    .line 920
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->motion:Landroidx/constraintlayout/widget/ConstraintSet$Motion;

    iget v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$Motion;->mDrawPath:I

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mDrawPath:I

    .line 921
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->motion:Landroidx/constraintlayout/widget/ConstraintSet$Motion;

    iget v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$Motion;->mAnimateCircleAngleTo:I

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mAnimateCircleAngleTo:I

    .line 922
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->propertySet:Landroidx/constraintlayout/widget/ConstraintSet$PropertySet;

    iget v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$PropertySet;->mProgress:F

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mProgress:F

    .line 923
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->layout:Landroidx/constraintlayout/widget/ConstraintSet$Layout;

    iget v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->circleAngle:F

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeAngle:F

    .line 924
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->mCustomConstraints:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 925
    .local v1, "at":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 926
    .local v3, "s":Ljava/lang/String;
    iget-object v4, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->mCustomConstraints:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintAttribute;

    .line 927
    .local v4, "attr":Landroidx/constraintlayout/widget/ConstraintAttribute;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Landroidx/constraintlayout/widget/ConstraintAttribute;->isContinuous()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 928
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v5, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 930
    .end local v3    # "s":Ljava/lang/String;
    .end local v4    # "attr":Landroidx/constraintlayout/widget/ConstraintAttribute;
    :cond_0
    goto :goto_0

    .line 931
    :cond_1
    return-void
.end method

.method public compareTo(Landroidx/constraintlayout/motion/widget/MotionPaths;)I
    .locals 2
    .param p1, "o"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 911
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    iget v1, p1, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "o"
        }
    .end annotation

    .line 39
    check-cast p1, Landroidx/constraintlayout/motion/widget/MotionPaths;

    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionPaths;->compareTo(Landroidx/constraintlayout/motion/widget/MotionPaths;)I

    move-result p1

    return p1
.end method

.method public configureRelativeTo(Landroidx/constraintlayout/motion/widget/MotionController;)V
    .locals 2
    .param p1, "toOrbit"    # Landroidx/constraintlayout/motion/widget/MotionController;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "toOrbit"
        }
    .end annotation

    .line 934
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mProgress:F

    float-to-double v0, v0

    invoke-virtual {p1, v0, v1}, Landroidx/constraintlayout/motion/widget/MotionController;->getPos(D)[D

    move-result-object v0

    .line 935
    .local v0, "p":[D
    return-void
.end method

.method different(Landroidx/constraintlayout/motion/widget/MotionPaths;[Z[Ljava/lang/String;Z)V
    .locals 7
    .param p1, "points"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .param p2, "mask"    # [Z
    .param p3, "custom"    # [Ljava/lang/String;
    .param p4, "arcMode"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "points",
            "mask",
            "custom",
            "arcMode"
        }
    .end annotation

    .line 305
    const/4 v0, 0x0

    .line 306
    .local v0, "c":I
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v2, p1, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    invoke-direct {p0, v1, v2}, Landroidx/constraintlayout/motion/widget/MotionPaths;->diff(FF)Z

    move-result v1

    .line 307
    .local v1, "diffx":Z
    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    iget v3, p1, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    invoke-direct {p0, v2, v3}, Landroidx/constraintlayout/motion/widget/MotionPaths;->diff(FF)Z

    move-result v2

    .line 308
    .local v2, "diffy":Z
    add-int/lit8 v3, v0, 0x1

    .end local v0    # "c":I
    .local v3, "c":I
    aget-boolean v4, p2, v0

    iget v5, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    iget v6, p1, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    invoke-direct {p0, v5, v6}, Landroidx/constraintlayout/motion/widget/MotionPaths;->diff(FF)Z

    move-result v5

    or-int/2addr v4, v5

    aput-boolean v4, p2, v0

    .line 309
    add-int/lit8 v0, v3, 0x1

    .end local v3    # "c":I
    .restart local v0    # "c":I
    aget-boolean v4, p2, v3

    or-int v5, v1, v2

    or-int/2addr v5, p4

    or-int/2addr v4, v5

    aput-boolean v4, p2, v3

    .line 310
    add-int/lit8 v3, v0, 0x1

    .end local v0    # "c":I
    .restart local v3    # "c":I
    aget-boolean v4, p2, v0

    or-int v5, v1, v2

    or-int/2addr v5, p4

    or-int/2addr v4, v5

    aput-boolean v4, p2, v0

    .line 311
    add-int/lit8 v0, v3, 0x1

    .end local v3    # "c":I
    .restart local v0    # "c":I
    aget-boolean v4, p2, v3

    iget v5, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    iget v6, p1, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    invoke-direct {p0, v5, v6}, Landroidx/constraintlayout/motion/widget/MotionPaths;->diff(FF)Z

    move-result v5

    or-int/2addr v4, v5

    aput-boolean v4, p2, v3

    .line 312
    add-int/lit8 v3, v0, 0x1

    .end local v0    # "c":I
    .restart local v3    # "c":I
    aget-boolean v4, p2, v0

    iget v5, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    iget v6, p1, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    invoke-direct {p0, v5, v6}, Landroidx/constraintlayout/motion/widget/MotionPaths;->diff(FF)Z

    move-result v5

    or-int/2addr v4, v5

    aput-boolean v4, p2, v0

    .line 314
    return-void
.end method

.method fillStandard([D[I)V
    .locals 6
    .param p1, "data"    # [D
    .param p2, "toUse"    # [I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "toUse"
        }
    .end annotation

    .line 863
    const/4 v0, 0x6

    new-array v0, v0, [F

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    const/4 v2, 0x0

    aput v1, v0, v2

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    const/4 v2, 0x1

    aput v1, v0, v2

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    const/4 v2, 0x2

    aput v1, v0, v2

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    const/4 v2, 0x3

    aput v1, v0, v2

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    const/4 v2, 0x4

    aput v1, v0, v2

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathRotate:F

    const/4 v2, 0x5

    aput v1, v0, v2

    .line 864
    .local v0, "set":[F
    const/4 v1, 0x0

    .line 865
    .local v1, "c":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p2

    if-ge v2, v3, :cond_1

    .line 866
    aget v3, p2, v2

    array-length v4, v0

    if-ge v3, v4, :cond_0

    .line 867
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "c":I
    .local v3, "c":I
    aget v4, p2, v2

    aget v4, v0, v4

    float-to-double v4, v4

    aput-wide v4, p1, v1

    move v1, v3

    .line 865
    .end local v3    # "c":I
    .restart local v1    # "c":I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 870
    .end local v2    # "i":I
    :cond_1
    return-void
.end method

.method getBounds([I[D[FI)V
    .locals 9
    .param p1, "toUse"    # [I
    .param p2, "data"    # [D
    .param p3, "point"    # [F
    .param p4, "offset"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "toUse",
            "data",
            "point",
            "offset"
        }
    .end annotation

    .line 461
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 462
    .local v0, "v_x":F
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 463
    .local v1, "v_y":F
    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 464
    .local v2, "v_width":F
    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 465
    .local v3, "v_height":F
    const/4 v4, 0x0

    .local v4, "translationX":F
    const/4 v5, 0x0

    .line 466
    .local v5, "translationY":F
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    array-length v7, p1

    if-ge v6, v7, :cond_0

    .line 467
    aget-wide v7, p2, v6

    double-to-float v7, v7

    .line 469
    .local v7, "value":F
    aget v8, p1, v6

    packed-switch v8, :pswitch_data_0

    goto :goto_1

    .line 480
    :pswitch_0
    move v3, v7

    goto :goto_1

    .line 477
    :pswitch_1
    move v2, v7

    .line 478
    goto :goto_1

    .line 474
    :pswitch_2
    move v1, v7

    .line 475
    goto :goto_1

    .line 471
    :pswitch_3
    move v0, v7

    .line 472
    nop

    .line 466
    .end local v7    # "value":F
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 484
    .end local v6    # "i":I
    :cond_0
    aput v2, p3, p4

    .line 485
    add-int/lit8 v6, p4, 0x1

    aput v3, p3, v6

    .line 486
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method getCenter(D[I[D[FI)V
    .locals 19
    .param p1, "p"    # D
    .param p3, "toUse"    # [I
    .param p4, "data"    # [D
    .param p5, "point"    # [F
    .param p6, "offset"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "p",
            "toUse",
            "data",
            "point",
            "offset"
        }
    .end annotation

    .line 317
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 318
    .local v2, "v_x":F
    iget v3, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 319
    .local v3, "v_y":F
    iget v4, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 320
    .local v4, "v_width":F
    iget v5, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 321
    .local v5, "v_height":F
    const/4 v6, 0x0

    .local v6, "translationX":F
    const/4 v7, 0x0

    .line 322
    .local v7, "translationY":F
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    array-length v9, v1

    if-ge v8, v9, :cond_0

    .line 323
    aget-wide v9, p4, v8

    double-to-float v9, v9

    .line 325
    .local v9, "value":F
    aget v10, v1, v8

    packed-switch v10, :pswitch_data_0

    goto :goto_1

    .line 336
    :pswitch_0
    move v5, v9

    goto :goto_1

    .line 333
    :pswitch_1
    move v4, v9

    .line 334
    goto :goto_1

    .line 330
    :pswitch_2
    move v3, v9

    .line 331
    goto :goto_1

    .line 327
    :pswitch_3
    move v2, v9

    .line 328
    nop

    .line 322
    .end local v9    # "value":F
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 340
    .end local v8    # "i":I
    :cond_0
    iget-object v8, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeToController:Landroidx/constraintlayout/motion/widget/MotionController;

    if-eqz v8, :cond_1

    .line 341
    const/4 v10, 0x2

    new-array v11, v10, [F

    .line 342
    .local v11, "pos":[F
    new-array v10, v10, [F

    .line 344
    .local v10, "vel":[F
    move-wide/from16 v12, p1

    invoke-virtual {v8, v12, v13, v11, v10}, Landroidx/constraintlayout/motion/widget/MotionController;->getCenter(D[F[F)V

    .line 345
    const/4 v8, 0x0

    aget v8, v11, v8

    .line 346
    .local v8, "rx":F
    const/4 v14, 0x1

    aget v14, v11, v14

    .line 347
    .local v14, "ry":F
    move v15, v2

    .line 348
    .local v15, "radius":F
    move/from16 v16, v3

    .line 350
    .local v16, "angle":F
    move-object/from16 v17, v10

    .end local v10    # "vel":[F
    .local v17, "vel":[F
    float-to-double v9, v8

    float-to-double v0, v15

    move/from16 v18, v2

    move/from16 v2, v16

    move-object/from16 v16, v11

    .end local v11    # "pos":[F
    .local v2, "angle":F
    .local v16, "pos":[F
    .local v18, "v_x":F
    float-to-double v11, v2

    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    move-result-wide v11

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v11

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v9, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float v1, v4, v0

    float-to-double v0, v1

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v9, v0

    double-to-float v0, v9

    .line 351
    .end local v18    # "v_x":F
    .local v0, "v_x":F
    float-to-double v9, v14

    float-to-double v11, v15

    move v13, v0

    .end local v0    # "v_x":F
    .local v13, "v_x":F
    float-to-double v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    invoke-static {v11, v12}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v11, v11, v0

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v9, v11

    const/high16 v0, 0x40000000    # 2.0f

    div-float v1, v5, v0

    float-to-double v11, v1

    invoke-static {v11, v12}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v9, v11

    double-to-float v3, v9

    move v2, v13

    goto :goto_2

    .line 340
    .end local v8    # "rx":F
    .end local v13    # "v_x":F
    .end local v14    # "ry":F
    .end local v15    # "radius":F
    .end local v16    # "pos":[F
    .end local v17    # "vel":[F
    .local v2, "v_x":F
    :cond_1
    move/from16 v18, v2

    const/high16 v0, 0x40000000    # 2.0f

    .line 354
    :goto_2
    div-float v1, v4, v0

    add-float/2addr v1, v2

    add-float/2addr v1, v6

    aput v1, p5, p6

    .line 355
    add-int/lit8 v1, p6, 0x1

    div-float v0, v5, v0

    add-float/2addr v0, v3

    add-float/2addr v0, v7

    aput v0, p5, v1

    .line 356
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method getCenter(D[I[D[F[D[F)V
    .locals 32
    .param p1, "p"    # D
    .param p3, "toUse"    # [I
    .param p4, "data"    # [D
    .param p5, "point"    # [F
    .param p6, "vdata"    # [D
    .param p7, "velocity"    # [F
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "p",
            "toUse",
            "data",
            "point",
            "vdata",
            "velocity"
        }
    .end annotation

    .line 359
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 360
    .local v2, "v_x":F
    iget v3, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 361
    .local v3, "v_y":F
    iget v4, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 362
    .local v4, "v_width":F
    iget v5, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 363
    .local v5, "v_height":F
    const/4 v6, 0x0

    .line 364
    .local v6, "dv_x":F
    const/4 v7, 0x0

    .line 365
    .local v7, "dv_y":F
    const/4 v8, 0x0

    .line 366
    .local v8, "dv_width":F
    const/4 v9, 0x0

    .line 368
    .local v9, "dv_height":F
    const/4 v10, 0x0

    .local v10, "translationX":F
    const/4 v11, 0x0

    .line 369
    .local v11, "translationY":F
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    array-length v13, v1

    if-ge v12, v13, :cond_0

    .line 370
    aget-wide v13, p4, v12

    double-to-float v13, v13

    .line 371
    .local v13, "value":F
    aget-wide v14, p6, v12

    double-to-float v14, v14

    .line 373
    .local v14, "dvalue":F
    aget v15, v1, v12

    packed-switch v15, :pswitch_data_0

    goto :goto_1

    .line 387
    :pswitch_0
    move v5, v13

    .line 388
    move v9, v14

    goto :goto_1

    .line 383
    :pswitch_1
    move v4, v13

    .line 384
    move v8, v14

    .line 385
    goto :goto_1

    .line 379
    :pswitch_2
    move v3, v13

    .line 380
    move v7, v14

    .line 381
    goto :goto_1

    .line 375
    :pswitch_3
    move v2, v13

    .line 376
    move v6, v14

    .line 377
    nop

    .line 369
    .end local v13    # "value":F
    .end local v14    # "dvalue":F
    :goto_1
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 392
    .end local v12    # "i":I
    :cond_0
    const/high16 v12, 0x40000000    # 2.0f

    div-float v13, v8, v12

    add-float/2addr v13, v6

    .line 393
    .local v13, "dpos_x":F
    div-float v14, v9, v12

    add-float/2addr v14, v7

    .line 395
    .local v14, "dpos_y":F
    iget-object v15, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeToController:Landroidx/constraintlayout/motion/widget/MotionController;

    const/16 v16, 0x0

    const/16 v17, 0x1

    if-eqz v15, :cond_1

    .line 396
    const/4 v12, 0x2

    new-array v0, v12, [F

    .line 397
    .local v0, "pos":[F
    new-array v12, v12, [F

    .line 398
    .local v12, "vel":[F
    move/from16 v19, v8

    move/from16 v18, v9

    move-wide/from16 v8, p1

    .end local v8    # "dv_width":F
    .end local v9    # "dv_height":F
    .local v18, "dv_height":F
    .local v19, "dv_width":F
    invoke-virtual {v15, v8, v9, v0, v12}, Landroidx/constraintlayout/motion/widget/MotionController;->getCenter(D[F[F)V

    .line 399
    aget v15, v0, v16

    .line 400
    .local v15, "rx":F
    aget v1, v0, v17

    .line 401
    .local v1, "ry":F
    move/from16 v20, v2

    .line 402
    .local v20, "radius":F
    move/from16 v21, v3

    .line 403
    .local v21, "angle":F
    move/from16 v22, v6

    .line 404
    .local v22, "dradius":F
    move/from16 v23, v7

    .line 405
    .local v23, "dangle":F
    move-object/from16 v24, v0

    .end local v0    # "pos":[F
    .local v24, "pos":[F
    aget v0, v12, v16

    .line 406
    .local v0, "drx":F
    move/from16 v25, v2

    .end local v2    # "v_x":F
    .local v25, "v_x":F
    aget v2, v12, v17

    .line 408
    .local v2, "dry":F
    move/from16 v26, v6

    move/from16 v27, v7

    .end local v6    # "dv_x":F
    .end local v7    # "dv_y":F
    .local v26, "dv_x":F
    .local v27, "dv_y":F
    float-to-double v6, v15

    move/from16 v28, v3

    move/from16 v3, v20

    .end local v20    # "radius":F
    .local v3, "radius":F
    .local v28, "v_y":F
    float-to-double v8, v3

    move-object/from16 v20, v12

    move/from16 v29, v14

    move/from16 v12, v21

    move/from16 v21, v13

    .end local v13    # "dpos_x":F
    .end local v14    # "dpos_y":F
    .local v12, "angle":F
    .local v20, "vel":[F
    .local v21, "dpos_x":F
    .local v29, "dpos_y":F
    float-to-double v13, v12

    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v13

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v8, v8, v13

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v6, v8

    const/high16 v8, 0x40000000    # 2.0f

    div-float v9, v4, v8

    float-to-double v8, v9

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v6, v8

    double-to-float v6, v6

    .line 409
    .end local v25    # "v_x":F
    .local v6, "v_x":F
    float-to-double v7, v1

    float-to-double v13, v3

    move/from16 v30, v10

    .end local v10    # "translationX":F
    .local v30, "translationX":F
    float-to-double v9, v12

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v13, v13, v9

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v7, v13

    const/high16 v9, 0x40000000    # 2.0f

    div-float v10, v5, v9

    float-to-double v9, v10

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v7, v9

    double-to-float v7, v7

    .line 410
    .end local v28    # "v_y":F
    .local v7, "v_y":F
    float-to-double v8, v0

    move/from16 v10, v22

    .end local v22    # "dradius":F
    .local v10, "dradius":F
    float-to-double v13, v10

    move/from16 v31, v0

    move/from16 v22, v1

    .end local v0    # "drx":F
    .end local v1    # "ry":F
    .local v22, "ry":F
    .local v31, "drx":F
    float-to-double v0, v12

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v13, v13, v0

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v8, v13

    float-to-double v0, v12

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    move v14, v6

    move/from16 v13, v23

    move/from16 v23, v7

    .end local v6    # "v_x":F
    .end local v7    # "v_y":F
    .local v13, "dangle":F
    .local v14, "v_x":F
    .local v23, "v_y":F
    float-to-double v6, v13

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v6

    add-double/2addr v8, v0

    double-to-float v0, v8

    .line 411
    .end local v21    # "dpos_x":F
    .local v0, "dpos_x":F
    float-to-double v6, v2

    float-to-double v8, v10

    move/from16 v21, v0

    .end local v0    # "dpos_x":F
    .restart local v21    # "dpos_x":F
    float-to-double v0, v12

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v8, v8, v0

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v6, v8

    float-to-double v0, v12

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    float-to-double v8, v13

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v8

    add-double/2addr v6, v0

    double-to-float v0, v6

    move v2, v14

    move/from16 v13, v21

    move/from16 v3, v23

    move v14, v0

    .end local v29    # "dpos_y":F
    .local v0, "dpos_y":F
    goto :goto_2

    .line 395
    .end local v0    # "dpos_y":F
    .end local v12    # "angle":F
    .end local v15    # "rx":F
    .end local v18    # "dv_height":F
    .end local v19    # "dv_width":F
    .end local v20    # "vel":[F
    .end local v21    # "dpos_x":F
    .end local v22    # "ry":F
    .end local v23    # "v_y":F
    .end local v24    # "pos":[F
    .end local v26    # "dv_x":F
    .end local v27    # "dv_y":F
    .end local v30    # "translationX":F
    .end local v31    # "drx":F
    .local v2, "v_x":F
    .local v3, "v_y":F
    .local v6, "dv_x":F
    .local v7, "dv_y":F
    .restart local v8    # "dv_width":F
    .restart local v9    # "dv_height":F
    .local v10, "translationX":F
    .local v13, "dpos_x":F
    .local v14, "dpos_y":F
    :cond_1
    move/from16 v25, v2

    move/from16 v28, v3

    move/from16 v26, v6

    move/from16 v27, v7

    move/from16 v19, v8

    move/from16 v18, v9

    move/from16 v30, v10

    move/from16 v21, v13

    move/from16 v29, v14

    .line 414
    .end local v6    # "dv_x":F
    .end local v7    # "dv_y":F
    .end local v8    # "dv_width":F
    .end local v9    # "dv_height":F
    .end local v10    # "translationX":F
    .restart local v18    # "dv_height":F
    .restart local v19    # "dv_width":F
    .restart local v26    # "dv_x":F
    .restart local v27    # "dv_y":F
    .restart local v30    # "translationX":F
    :goto_2
    const/high16 v0, 0x40000000    # 2.0f

    div-float v1, v4, v0

    add-float/2addr v1, v2

    add-float v1, v1, v30

    aput v1, p5, v16

    .line 415
    div-float v0, v5, v0

    add-float/2addr v0, v3

    add-float/2addr v0, v11

    aput v0, p5, v17

    .line 416
    aput v13, p7, v16

    .line 417
    aput v14, p7, v17

    .line 418
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method getCenterVelocity(D[I[D[FI)V
    .locals 19
    .param p1, "p"    # D
    .param p3, "toUse"    # [I
    .param p4, "data"    # [D
    .param p5, "point"    # [F
    .param p6, "offset"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "p",
            "toUse",
            "data",
            "point",
            "offset"
        }
    .end annotation

    .line 420
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 421
    .local v2, "v_x":F
    iget v3, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 422
    .local v3, "v_y":F
    iget v4, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 423
    .local v4, "v_width":F
    iget v5, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 424
    .local v5, "v_height":F
    const/4 v6, 0x0

    .local v6, "translationX":F
    const/4 v7, 0x0

    .line 425
    .local v7, "translationY":F
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    array-length v9, v1

    if-ge v8, v9, :cond_0

    .line 426
    aget-wide v9, p4, v8

    double-to-float v9, v9

    .line 428
    .local v9, "value":F
    aget v10, v1, v8

    packed-switch v10, :pswitch_data_0

    goto :goto_1

    .line 439
    :pswitch_0
    move v5, v9

    goto :goto_1

    .line 436
    :pswitch_1
    move v4, v9

    .line 437
    goto :goto_1

    .line 433
    :pswitch_2
    move v3, v9

    .line 434
    goto :goto_1

    .line 430
    :pswitch_3
    move v2, v9

    .line 431
    nop

    .line 425
    .end local v9    # "value":F
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 443
    .end local v8    # "i":I
    :cond_0
    iget-object v8, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeToController:Landroidx/constraintlayout/motion/widget/MotionController;

    if-eqz v8, :cond_1

    .line 444
    const/4 v10, 0x2

    new-array v11, v10, [F

    .line 445
    .local v11, "pos":[F
    new-array v10, v10, [F

    .line 446
    .local v10, "vel":[F
    move-wide/from16 v12, p1

    invoke-virtual {v8, v12, v13, v11, v10}, Landroidx/constraintlayout/motion/widget/MotionController;->getCenter(D[F[F)V

    .line 447
    const/4 v8, 0x0

    aget v8, v11, v8

    .line 448
    .local v8, "rx":F
    const/4 v14, 0x1

    aget v14, v11, v14

    .line 449
    .local v14, "ry":F
    move v15, v2

    .line 450
    .local v15, "radius":F
    move/from16 v16, v3

    .line 452
    .local v16, "angle":F
    move-object/from16 v17, v10

    .end local v10    # "vel":[F
    .local v17, "vel":[F
    float-to-double v9, v8

    float-to-double v0, v15

    move/from16 v18, v2

    move/from16 v2, v16

    move-object/from16 v16, v11

    .end local v11    # "pos":[F
    .local v2, "angle":F
    .local v16, "pos":[F
    .local v18, "v_x":F
    float-to-double v11, v2

    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    move-result-wide v11

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v11

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v9, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float v1, v4, v0

    float-to-double v0, v1

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v9, v0

    double-to-float v0, v9

    .line 453
    .end local v18    # "v_x":F
    .local v0, "v_x":F
    float-to-double v9, v14

    float-to-double v11, v15

    move v13, v0

    .end local v0    # "v_x":F
    .local v13, "v_x":F
    float-to-double v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    invoke-static {v11, v12}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v11, v11, v0

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v9, v11

    const/high16 v0, 0x40000000    # 2.0f

    div-float v1, v5, v0

    float-to-double v11, v1

    invoke-static {v11, v12}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v9, v11

    double-to-float v3, v9

    move v2, v13

    goto :goto_2

    .line 443
    .end local v8    # "rx":F
    .end local v13    # "v_x":F
    .end local v14    # "ry":F
    .end local v15    # "radius":F
    .end local v16    # "pos":[F
    .end local v17    # "vel":[F
    .local v2, "v_x":F
    :cond_1
    move/from16 v18, v2

    const/high16 v0, 0x40000000    # 2.0f

    .line 456
    :goto_2
    div-float v1, v4, v0

    add-float/2addr v1, v2

    add-float/2addr v1, v6

    aput v1, p5, p6

    .line 457
    add-int/lit8 v1, p6, 0x1

    div-float v0, v5, v0

    add-float/2addr v0, v3

    add-float/2addr v0, v7

    aput v0, p5, v1

    .line 458
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method getCustomData(Ljava/lang/String;[DI)I
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [D
    .param p3, "offset"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "value",
            "offset"
        }
    .end annotation

    .line 885
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintAttribute;

    .line 886
    .local v0, "a":Landroidx/constraintlayout/widget/ConstraintAttribute;
    if-nez v0, :cond_0

    .line 887
    const/4 v1, 0x0

    return v1

    .line 888
    :cond_0
    invoke-virtual {v0}, Landroidx/constraintlayout/widget/ConstraintAttribute;->numberOfInterpolatedValues()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 889
    invoke-virtual {v0}, Landroidx/constraintlayout/widget/ConstraintAttribute;->getValueToInterpolate()F

    move-result v1

    float-to-double v3, v1

    aput-wide v3, p2, p3

    .line 890
    return v2

    .line 892
    :cond_1
    invoke-virtual {v0}, Landroidx/constraintlayout/widget/ConstraintAttribute;->numberOfInterpolatedValues()I

    move-result v1

    .line 893
    .local v1, "N":I
    new-array v2, v1, [F

    .line 894
    .local v2, "f":[F
    invoke-virtual {v0, v2}, Landroidx/constraintlayout/widget/ConstraintAttribute;->getValuesToInterpolate([F)V

    .line 895
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_2

    .line 896
    add-int/lit8 v4, p3, 0x1

    .end local p3    # "offset":I
    .local v4, "offset":I
    aget v5, v2, v3

    float-to-double v5, v5

    aput-wide v5, p2, p3

    .line 895
    add-int/lit8 v3, v3, 0x1

    move p3, v4

    goto :goto_0

    .line 898
    .end local v3    # "i":I
    .end local v4    # "offset":I
    .restart local p3    # "offset":I
    :cond_2
    return v1
.end method

.method getCustomDataCount(Ljava/lang/String;)I
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 877
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintAttribute;

    .line 878
    .local v0, "a":Landroidx/constraintlayout/widget/ConstraintAttribute;
    if-nez v0, :cond_0

    .line 879
    const/4 v1, 0x0

    return v1

    .line 881
    :cond_0
    invoke-virtual {v0}, Landroidx/constraintlayout/widget/ConstraintAttribute;->numberOfInterpolatedValues()I

    move-result v1

    return v1
.end method

.method getRect([I[D[FI)V
    .locals 41
    .param p1, "toUse"    # [I
    .param p2, "data"    # [D
    .param p3, "path"    # [F
    .param p4, "offset"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "toUse",
            "data",
            "path",
            "offset"
        }
    .end annotation

    .line 649
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 650
    .local v2, "v_x":F
    iget v3, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 651
    .local v3, "v_y":F
    iget v4, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 652
    .local v4, "v_width":F
    iget v5, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 653
    .local v5, "v_height":F
    const/4 v6, 0x0

    .line 654
    .local v6, "delta_path":F
    const/4 v7, 0x0

    .line 655
    .local v7, "rotation":F
    const/4 v8, 0x0

    .line 656
    .local v8, "alpha":F
    const/4 v9, 0x0

    .line 657
    .local v9, "rotationX":F
    const/4 v10, 0x0

    .line 658
    .local v10, "rotationY":F
    const/high16 v11, 0x3f800000    # 1.0f

    .line 659
    .local v11, "scaleX":F
    const/high16 v12, 0x3f800000    # 1.0f

    .line 660
    .local v12, "scaleY":F
    const/high16 v13, 0x7fc00000    # Float.NaN

    .line 661
    .local v13, "pivotX":F
    const/high16 v14, 0x7fc00000    # Float.NaN

    .line 662
    .local v14, "pivotY":F
    const/4 v15, 0x0

    .line 663
    .local v15, "translationX":F
    const/16 v16, 0x0

    .line 667
    .local v16, "translationY":F
    const/16 v17, 0x0

    move/from16 v40, v17

    move/from16 v17, v6

    move/from16 v6, v40

    .local v6, "i":I
    .local v17, "delta_path":F
    :goto_0
    move/from16 v18, v8

    .end local v8    # "alpha":F
    .local v18, "alpha":F
    array-length v8, v1

    if-ge v6, v8, :cond_0

    .line 668
    move/from16 v19, v9

    .end local v9    # "rotationX":F
    .local v19, "rotationX":F
    aget-wide v8, p2, v6

    double-to-float v8, v8

    .line 670
    .local v8, "value":F
    aget v9, v1, v6

    packed-switch v9, :pswitch_data_0

    goto :goto_1

    .line 684
    :pswitch_0
    move v5, v8

    goto :goto_1

    .line 681
    :pswitch_1
    move v4, v8

    .line 682
    goto :goto_1

    .line 678
    :pswitch_2
    move v3, v8

    .line 679
    goto :goto_1

    .line 675
    :pswitch_3
    move v2, v8

    .line 676
    goto :goto_1

    .line 672
    :pswitch_4
    move v9, v8

    .line 673
    .end local v17    # "delta_path":F
    .local v9, "delta_path":F
    move/from16 v17, v9

    .line 667
    .end local v8    # "value":F
    .end local v9    # "delta_path":F
    .restart local v17    # "delta_path":F
    :goto_1
    add-int/lit8 v6, v6, 0x1

    move/from16 v8, v18

    move/from16 v9, v19

    goto :goto_0

    .end local v19    # "rotationX":F
    .local v9, "rotationX":F
    :cond_0
    move/from16 v19, v9

    .line 689
    .end local v6    # "i":I
    .end local v9    # "rotationX":F
    .restart local v19    # "rotationX":F
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeToController:Landroidx/constraintlayout/motion/widget/MotionController;

    if-eqz v6, :cond_1

    .line 690
    invoke-virtual {v6}, Landroidx/constraintlayout/motion/widget/MotionController;->getCenterX()F

    move-result v6

    .line 691
    .local v6, "rx":F
    iget-object v9, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeToController:Landroidx/constraintlayout/motion/widget/MotionController;

    invoke-virtual {v9}, Landroidx/constraintlayout/motion/widget/MotionController;->getCenterY()F

    move-result v9

    .line 692
    .local v9, "ry":F
    move/from16 v20, v2

    .line 693
    .local v20, "radius":F
    move/from16 v21, v3

    .line 695
    .local v21, "angle":F
    move/from16 v23, v9

    .end local v9    # "ry":F
    .local v23, "ry":F
    float-to-double v8, v6

    move/from16 v0, v20

    .end local v2    # "v_x":F
    .local v0, "radius":F
    .local v20, "v_x":F
    float-to-double v1, v0

    move/from16 v24, v3

    move/from16 v25, v6

    move/from16 v21, v7

    .end local v6    # "rx":F
    .end local v7    # "rotation":F
    .local v3, "angle":F
    .local v21, "rotation":F
    .local v24, "v_y":F
    .local v25, "rx":F
    float-to-double v6, v3

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v1, v1, v6

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v8, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float v2, v4, v1

    float-to-double v1, v2

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v8, v1

    double-to-float v2, v8

    .line 696
    .end local v20    # "v_x":F
    .restart local v2    # "v_x":F
    move/from16 v1, v23

    .end local v23    # "ry":F
    .local v1, "ry":F
    float-to-double v6, v1

    float-to-double v8, v0

    move/from16 v23, v0

    move/from16 v20, v1

    .end local v0    # "radius":F
    .end local v1    # "ry":F
    .local v20, "ry":F
    .local v23, "radius":F
    float-to-double v0, v3

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v8, v8, v0

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v6, v8

    const/high16 v0, 0x40000000    # 2.0f

    div-float v1, v5, v0

    float-to-double v0, v1

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v6, v0

    double-to-float v0, v6

    move v3, v0

    .end local v24    # "v_y":F
    .local v0, "v_y":F
    goto :goto_2

    .line 689
    .end local v0    # "v_y":F
    .end local v20    # "ry":F
    .end local v21    # "rotation":F
    .end local v23    # "radius":F
    .end local v25    # "rx":F
    .local v3, "v_y":F
    .restart local v7    # "rotation":F
    :cond_1
    move/from16 v20, v2

    move/from16 v24, v3

    move/from16 v21, v7

    .line 699
    .end local v7    # "rotation":F
    .restart local v21    # "rotation":F
    :goto_2
    move v0, v2

    .line 700
    .local v0, "x1":F
    move v1, v3

    .line 702
    .local v1, "y1":F
    add-float v6, v2, v4

    .line 703
    .local v6, "x2":F
    move v7, v1

    .line 705
    .local v7, "y2":F
    move v8, v6

    .line 706
    .local v8, "x3":F
    add-float v9, v3, v5

    .line 708
    .local v9, "y3":F
    move/from16 v20, v0

    .line 709
    .local v20, "x4":F
    move/from16 v23, v9

    .line 711
    .local v23, "y4":F
    const/high16 v22, 0x40000000    # 2.0f

    div-float v24, v4, v22

    add-float v24, v0, v24

    .line 712
    .local v24, "cx":F
    div-float v25, v5, v22

    add-float v25, v1, v25

    .line 714
    .local v25, "cy":F
    invoke-static {v13}, Ljava/lang/Float;->isNaN(F)Z

    move-result v26

    if-nez v26, :cond_2

    .line 715
    sub-float v26, v6, v0

    mul-float v26, v26, v13

    add-float v24, v0, v26

    .line 717
    :cond_2
    invoke-static {v14}, Ljava/lang/Float;->isNaN(F)Z

    move-result v26

    if-nez v26, :cond_3

    .line 719
    sub-float v26, v9, v1

    mul-float v26, v26, v14

    add-float v25, v1, v26

    .line 721
    :cond_3
    const/high16 v26, 0x3f800000    # 1.0f

    cmpl-float v27, v11, v26

    if-eqz v27, :cond_4

    .line 722
    add-float v27, v0, v6

    const/high16 v22, 0x40000000    # 2.0f

    div-float v27, v27, v22

    .line 723
    .local v27, "midx":F
    sub-float v28, v0, v27

    mul-float v28, v28, v11

    add-float v0, v28, v27

    .line 724
    sub-float v28, v6, v27

    mul-float v28, v28, v11

    add-float v6, v28, v27

    .line 725
    sub-float v28, v8, v27

    mul-float v28, v28, v11

    add-float v8, v28, v27

    .line 726
    sub-float v28, v20, v27

    mul-float v28, v28, v11

    add-float v20, v28, v27

    .line 728
    .end local v27    # "midx":F
    :cond_4
    cmpl-float v26, v12, v26

    if-eqz v26, :cond_5

    .line 729
    add-float v26, v1, v9

    const/high16 v22, 0x40000000    # 2.0f

    div-float v26, v26, v22

    .line 730
    .local v26, "midy":F
    sub-float v22, v1, v26

    mul-float v22, v22, v12

    add-float v1, v22, v26

    .line 731
    sub-float v22, v7, v26

    mul-float v22, v22, v12

    add-float v7, v22, v26

    .line 732
    sub-float v22, v9, v26

    mul-float v22, v22, v12

    add-float v9, v22, v26

    .line 733
    sub-float v22, v23, v26

    mul-float v22, v22, v12

    add-float v23, v22, v26

    .line 735
    .end local v26    # "midy":F
    :cond_5
    const/16 v22, 0x0

    cmpl-float v22, v21, v22

    if-eqz v22, :cond_6

    .line 736
    move/from16 v22, v2

    move/from16 v32, v3

    move/from16 v2, v21

    move/from16 v21, v4

    .end local v3    # "v_y":F
    .end local v4    # "v_width":F
    .local v2, "rotation":F
    .local v21, "v_width":F
    .local v22, "v_x":F
    .local v32, "v_y":F
    float-to-double v3, v2

    invoke-static {v3, v4}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float v3, v3

    .line 737
    .local v3, "sin":F
    move/from16 v33, v5

    .end local v5    # "v_height":F
    .local v33, "v_height":F
    float-to-double v4, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    double-to-float v4, v4

    .line 738
    .local v4, "cos":F
    move/from16 v26, v3

    move/from16 v27, v4

    move/from16 v28, v24

    move/from16 v29, v25

    move/from16 v30, v0

    move/from16 v31, v1

    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->xRotate(FFFFFF)F

    move-result v5

    .line 739
    .local v5, "tx1":F
    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->yRotate(FFFFFF)F

    move-result v34

    .line 740
    .local v34, "ty1":F
    move/from16 v30, v6

    move/from16 v31, v7

    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->xRotate(FFFFFF)F

    move-result v35

    .line 741
    .local v35, "tx2":F
    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->yRotate(FFFFFF)F

    move-result v36

    .line 742
    .local v36, "ty2":F
    move/from16 v30, v8

    move/from16 v31, v9

    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->xRotate(FFFFFF)F

    move-result v37

    .line 743
    .local v37, "tx3":F
    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->yRotate(FFFFFF)F

    move-result v38

    .line 744
    .local v38, "ty3":F
    move/from16 v30, v20

    move/from16 v31, v23

    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->xRotate(FFFFFF)F

    move-result v39

    .line 745
    .local v39, "tx4":F
    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->yRotate(FFFFFF)F

    move-result v26

    .line 746
    .local v26, "ty4":F
    move v0, v5

    .line 747
    move/from16 v1, v34

    .line 748
    move/from16 v6, v35

    .line 749
    move/from16 v7, v36

    .line 750
    move/from16 v8, v37

    .line 751
    move/from16 v9, v38

    .line 752
    move/from16 v20, v39

    .line 753
    move/from16 v23, v26

    goto :goto_3

    .line 735
    .end local v22    # "v_x":F
    .end local v26    # "ty4":F
    .end local v32    # "v_y":F
    .end local v33    # "v_height":F
    .end local v34    # "ty1":F
    .end local v35    # "tx2":F
    .end local v36    # "ty2":F
    .end local v37    # "tx3":F
    .end local v38    # "ty3":F
    .end local v39    # "tx4":F
    .local v2, "v_x":F
    .local v3, "v_y":F
    .local v4, "v_width":F
    .local v5, "v_height":F
    .local v21, "rotation":F
    :cond_6
    move/from16 v22, v2

    move/from16 v32, v3

    move/from16 v33, v5

    move/from16 v2, v21

    move/from16 v21, v4

    .line 756
    .end local v3    # "v_y":F
    .end local v4    # "v_width":F
    .end local v5    # "v_height":F
    .local v2, "rotation":F
    .local v21, "v_width":F
    .restart local v22    # "v_x":F
    .restart local v32    # "v_y":F
    .restart local v33    # "v_height":F
    :goto_3
    add-float/2addr v0, v15

    .line 757
    add-float v1, v1, v16

    .line 758
    add-float/2addr v6, v15

    .line 759
    add-float v7, v7, v16

    .line 760
    add-float/2addr v8, v15

    .line 761
    add-float v9, v9, v16

    .line 762
    add-float v20, v20, v15

    .line 763
    add-float v23, v23, v16

    .line 765
    add-int/lit8 v3, p4, 0x1

    .end local p4    # "offset":I
    .local v3, "offset":I
    aput v0, p3, p4

    .line 766
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "offset":I
    .local v4, "offset":I
    aput v1, p3, v3

    .line 767
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    aput v6, p3, v4

    .line 768
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "offset":I
    .restart local v4    # "offset":I
    aput v7, p3, v3

    .line 769
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    aput v8, p3, v4

    .line 770
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "offset":I
    .restart local v4    # "offset":I
    aput v9, p3, v3

    .line 771
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    aput v20, p3, v4

    .line 772
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "offset":I
    .restart local v4    # "offset":I
    aput v23, p3, v3

    .line 773
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method hasCustomData(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 873
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method initCartesian(Landroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V
    .locals 22
    .param p1, "c"    # Landroidx/constraintlayout/motion/widget/KeyPosition;
    .param p2, "startTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .param p3, "endTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "c",
            "startTimePoint",
            "endTimePoint"
        }
    .end annotation

    .line 86
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    iget v3, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mFramePosition:I

    int-to-float v3, v3

    const/high16 v4, 0x42c80000    # 100.0f

    div-float/2addr v3, v4

    .line 87
    .local v3, "position":F
    move-object/from16 v4, p0

    .line 88
    .local v4, "point":Landroidx/constraintlayout/motion/widget/MotionPaths;
    iput v3, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    .line 90
    iget v5, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mDrawPath:I

    move-object/from16 v6, p0

    iput v5, v6, Landroidx/constraintlayout/motion/widget/MotionPaths;->mDrawPath:I

    .line 91
    iget v5, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-eqz v5, :cond_0

    move v5, v3

    goto :goto_0

    :cond_0
    iget v5, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    .line 92
    .local v5, "scaleWidth":F
    :goto_0
    iget v7, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_1

    move v7, v3

    goto :goto_1

    :cond_1
    iget v7, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    .line 93
    .local v7, "scaleHeight":F
    :goto_1
    iget v8, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    iget v9, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    sub-float v10, v8, v9

    .line 94
    .local v10, "scaleX":F
    iget v11, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    iget v12, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    sub-float v13, v11, v12

    .line 96
    .local v13, "scaleY":F
    iget v14, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    iput v14, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    .line 98
    move v14, v3

    .line 100
    .local v14, "path":F
    iget v15, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    const/high16 v16, 0x40000000    # 2.0f

    div-float v17, v9, v16

    add-float v17, v15, v17

    .line 101
    .local v17, "startCenterX":F
    move/from16 v18, v3

    .end local v3    # "position":F
    .local v18, "position":F
    iget v3, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    div-float v19, v12, v16

    add-float v19, v3, v19

    .line 102
    .local v19, "startCenterY":F
    iget v6, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    div-float v8, v8, v16

    add-float/2addr v6, v8

    .line 103
    .local v6, "endCenterX":F
    iget v8, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    div-float v11, v11, v16

    add-float/2addr v8, v11

    .line 104
    .local v8, "endCenterY":F
    sub-float v11, v6, v17

    .line 105
    .local v11, "pathVectorX":F
    sub-float v20, v8, v19

    .line 106
    .local v20, "pathVectorY":F
    mul-float v21, v11, v14

    add-float v15, v15, v21

    mul-float v21, v10, v5

    div-float v21, v21, v16

    sub-float v15, v15, v21

    float-to-int v15, v15

    int-to-float v15, v15

    iput v15, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 107
    mul-float v15, v20, v14

    add-float/2addr v3, v15

    mul-float v15, v13, v7

    div-float v15, v15, v16

    sub-float/2addr v3, v15

    float-to-int v3, v3

    int-to-float v3, v3

    iput v3, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 108
    mul-float v3, v10, v5

    add-float/2addr v9, v3

    float-to-int v3, v9

    int-to-float v3, v3

    iput v3, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 109
    mul-float v3, v13, v7

    add-float/2addr v12, v3

    float-to-int v3, v12

    int-to-float v3, v3

    iput v3, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 111
    iget v3, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-eqz v3, :cond_2

    move/from16 v3, v18

    goto :goto_2

    :cond_2
    iget v3, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    .line 112
    .local v3, "dxdx":F
    :goto_2
    iget v9, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mAltPercentY:F

    invoke-static {v9}, Ljava/lang/Float;->isNaN(F)Z

    move-result v9

    if-eqz v9, :cond_3

    const/4 v9, 0x0

    goto :goto_3

    :cond_3
    iget v9, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mAltPercentY:F

    .line 113
    .local v9, "dydx":F
    :goto_3
    iget v15, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    invoke-static {v15}, Ljava/lang/Float;->isNaN(F)Z

    move-result v15

    if-eqz v15, :cond_4

    move/from16 v15, v18

    goto :goto_4

    :cond_4
    iget v15, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    .line 114
    .local v15, "dydy":F
    :goto_4
    iget v12, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mAltPercentX:F

    invoke-static {v12}, Ljava/lang/Float;->isNaN(F)Z

    move-result v12

    if-eqz v12, :cond_5

    const/4 v12, 0x0

    goto :goto_5

    :cond_5
    iget v12, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mAltPercentX:F

    .line 115
    .local v12, "dxdy":F
    :goto_5
    const/4 v2, 0x0

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mMode:I

    .line 116
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    mul-float v21, v11, v3

    add-float v2, v2, v21

    mul-float v21, v20, v12

    add-float v2, v2, v21

    mul-float v21, v10, v5

    div-float v21, v21, v16

    sub-float v2, v2, v21

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 117
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    mul-float v21, v11, v9

    add-float v2, v2, v21

    mul-float v21, v20, v15

    add-float v2, v2, v21

    mul-float v21, v13, v7

    div-float v21, v21, v16

    sub-float v2, v2, v21

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 119
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mTransitionEasing:Ljava/lang/String;

    invoke-static {v2}, Landroidx/constraintlayout/core/motion/utils/Easing;->getInterpolator(Ljava/lang/String;)Landroidx/constraintlayout/core/motion/utils/Easing;

    move-result-object v2

    iput-object v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mKeyFrameEasing:Landroidx/constraintlayout/core/motion/utils/Easing;

    .line 120
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPathMotionArc:I

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathMotionArc:I

    .line 121
    return-void
.end method

.method initPath(Landroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V
    .locals 25
    .param p1, "c"    # Landroidx/constraintlayout/motion/widget/KeyPosition;
    .param p2, "startTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .param p3, "endTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "c",
            "startTimePoint",
            "endTimePoint"
        }
    .end annotation

    .line 243
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    iget v4, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mFramePosition:I

    int-to-float v4, v4

    const/high16 v5, 0x42c80000    # 100.0f

    div-float/2addr v4, v5

    .line 244
    .local v4, "position":F
    move-object/from16 v5, p0

    .line 245
    .local v5, "point":Landroidx/constraintlayout/motion/widget/MotionPaths;
    iput v4, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    .line 247
    iget v6, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mDrawPath:I

    iput v6, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mDrawPath:I

    .line 248
    iget v6, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    invoke-static {v6}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-eqz v6, :cond_0

    move v6, v4

    goto :goto_0

    :cond_0
    iget v6, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    .line 249
    .local v6, "scaleWidth":F
    :goto_0
    iget v7, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_1

    move v7, v4

    goto :goto_1

    :cond_1
    iget v7, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    .line 251
    .local v7, "scaleHeight":F
    :goto_1
    iget v8, v3, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    iget v9, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    sub-float/2addr v8, v9

    .line 252
    .local v8, "scaleX":F
    iget v9, v3, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    iget v10, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    sub-float/2addr v9, v10

    .line 254
    .local v9, "scaleY":F
    iget v10, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    iput v10, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    .line 256
    iget v10, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    invoke-static {v10}, Ljava/lang/Float;->isNaN(F)Z

    move-result v10

    if-eqz v10, :cond_2

    move v10, v4

    goto :goto_2

    :cond_2
    iget v10, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    .line 258
    .local v10, "path":F
    :goto_2
    iget v11, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v12, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    const/high16 v13, 0x40000000    # 2.0f

    div-float v14, v12, v13

    add-float/2addr v14, v11

    .line 259
    .local v14, "startCenterX":F
    iget v15, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    move/from16 v16, v4

    .end local v4    # "position":F
    .local v16, "position":F
    iget v4, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    div-float v17, v4, v13

    add-float v17, v15, v17

    .line 260
    .local v17, "startCenterY":F
    iget v0, v3, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v2, v3, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    div-float/2addr v2, v13

    add-float/2addr v0, v2

    .line 261
    .local v0, "endCenterX":F
    iget v2, v3, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    iget v1, v3, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    div-float/2addr v1, v13

    add-float/2addr v2, v1

    .line 262
    .local v2, "endCenterY":F
    sub-float v1, v0, v14

    .line 263
    .local v1, "pathVectorX":F
    sub-float v13, v2, v17

    .line 264
    .local v13, "pathVectorY":F
    mul-float v19, v1, v10

    add-float v11, v11, v19

    mul-float v19, v8, v6

    const/high16 v18, 0x40000000    # 2.0f

    div-float v19, v19, v18

    sub-float v11, v11, v19

    float-to-int v11, v11

    int-to-float v11, v11

    iput v11, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 265
    mul-float v11, v13, v10

    add-float/2addr v15, v11

    mul-float v11, v9, v7

    div-float v11, v11, v18

    sub-float/2addr v15, v11

    float-to-int v11, v15

    int-to-float v11, v11

    iput v11, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 266
    mul-float v11, v8, v6

    add-float/2addr v12, v11

    float-to-int v11, v12

    int-to-float v11, v11

    iput v11, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 267
    mul-float v11, v9, v7

    add-float/2addr v4, v11

    float-to-int v4, v4

    int-to-float v4, v4

    iput v4, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 268
    move-object/from16 v4, p1

    iget v11, v4, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    invoke-static {v11}, Ljava/lang/Float;->isNaN(F)Z

    move-result v11

    if-eqz v11, :cond_3

    const/4 v11, 0x0

    goto :goto_3

    :cond_3
    iget v11, v4, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    .line 269
    .local v11, "perpendicular":F
    :goto_3
    neg-float v12, v13

    .line 270
    .local v12, "perpendicularX":F
    move v15, v1

    .line 272
    .local v15, "perpendicularY":F
    mul-float v19, v12, v11

    .line 273
    .local v19, "normalX":F
    mul-float v20, v15, v11

    .line 274
    .local v20, "normalY":F
    move/from16 v21, v0

    .end local v0    # "endCenterX":F
    .local v21, "endCenterX":F
    const/4 v0, 0x1

    iput v0, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->mMode:I

    .line 275
    move-object/from16 v0, p2

    move/from16 v22, v2

    .end local v2    # "endCenterY":F
    .local v22, "endCenterY":F
    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    mul-float v23, v1, v10

    add-float v2, v2, v23

    mul-float v23, v8, v6

    const/high16 v18, 0x40000000    # 2.0f

    div-float v23, v23, v18

    sub-float v2, v2, v23

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 276
    move/from16 v23, v1

    .end local v1    # "pathVectorX":F
    .local v23, "pathVectorX":F
    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    mul-float v24, v13, v10

    add-float v1, v1, v24

    mul-float v24, v9, v7

    div-float v24, v24, v18

    sub-float v1, v1, v24

    float-to-int v1, v1

    int-to-float v1, v1

    iput v1, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 277
    add-float v2, v2, v19

    iput v2, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 278
    add-float v1, v1, v20

    iput v1, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 280
    move-object/from16 v1, p0

    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->mAnimateRelativeTo:I

    iput v2, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->mAnimateRelativeTo:I

    .line 281
    iget-object v2, v4, Landroidx/constraintlayout/motion/widget/KeyPosition;->mTransitionEasing:Ljava/lang/String;

    invoke-static {v2}, Landroidx/constraintlayout/core/motion/utils/Easing;->getInterpolator(Ljava/lang/String;)Landroidx/constraintlayout/core/motion/utils/Easing;

    move-result-object v2

    iput-object v2, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->mKeyFrameEasing:Landroidx/constraintlayout/core/motion/utils/Easing;

    .line 282
    iget v2, v4, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPathMotionArc:I

    iput v2, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathMotionArc:I

    .line 283
    return-void
.end method

.method initPolar(IILandroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V
    .locals 10
    .param p1, "parentWidth"    # I
    .param p2, "parentHeight"    # I
    .param p3, "c"    # Landroidx/constraintlayout/motion/widget/KeyPosition;
    .param p4, "s"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .param p5, "e"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "parentWidth",
            "parentHeight",
            "c",
            "s",
            "e"
        }
    .end annotation

    .line 150
    iget v0, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mFramePosition:I

    int-to-float v0, v0

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr v0, v1

    .line 151
    .local v0, "position":F
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    .line 152
    iget v1, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mDrawPath:I

    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mDrawPath:I

    .line 153
    iget v1, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPositionType:I

    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mMode:I

    .line 154
    iget v1, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    iget v1, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    .line 155
    .local v1, "scaleWidth":F
    :goto_0
    iget v2, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_1

    move v2, v0

    goto :goto_1

    :cond_1
    iget v2, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    .line 156
    .local v2, "scaleHeight":F
    :goto_1
    iget v3, p5, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    iget v4, p4, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    sub-float/2addr v3, v4

    .line 157
    .local v3, "scaleX":F
    iget v5, p5, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    iget v6, p4, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    sub-float/2addr v5, v6

    .line 158
    .local v5, "scaleY":F
    iget v7, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    iput v7, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    .line 159
    mul-float v7, v3, v1

    add-float/2addr v4, v7

    float-to-int v4, v4

    int-to-float v4, v4

    iput v4, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 160
    mul-float v4, v5, v2

    add-float/2addr v6, v4

    float-to-int v4, v6

    int-to-float v4, v4

    iput v4, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 161
    const/high16 v4, 0x3f800000    # 1.0f

    sub-float/2addr v4, v0

    .line 162
    .local v4, "startfactor":F
    move v6, v0

    .line 163
    .local v6, "endfactor":F
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPositionType:I

    packed-switch v7, :pswitch_data_0

    .line 175
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_6

    move v7, v0

    goto :goto_6

    .line 165
    :pswitch_0
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_2

    iget v7, p5, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v8, p4, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    sub-float/2addr v7, v8

    mul-float v7, v7, v0

    add-float/2addr v7, v8

    goto :goto_2

    :cond_2
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v8

    mul-float v7, v7, v8

    :goto_2
    iput v7, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 166
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_3

    iget v7, p5, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    iget v8, p4, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    sub-float/2addr v7, v8

    mul-float v7, v7, v0

    add-float/2addr v7, v8

    goto :goto_3

    :cond_3
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    :goto_3
    iput v7, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 167
    goto :goto_8

    .line 170
    :pswitch_1
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_4

    move v7, v0

    goto :goto_4

    :cond_4
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    :goto_4
    iget v8, p5, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v9, p4, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    sub-float/2addr v8, v9

    mul-float v7, v7, v8

    add-float/2addr v7, v9

    iput v7, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 171
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_5

    move v7, v0

    goto :goto_5

    :cond_5
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    :goto_5
    iget v8, p5, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    iget v9, p4, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    sub-float/2addr v8, v9

    mul-float v7, v7, v8

    add-float/2addr v7, v9

    iput v7, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 172
    goto :goto_8

    .line 175
    :cond_6
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    :goto_6
    iget v8, p5, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v9, p4, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    sub-float/2addr v8, v9

    mul-float v7, v7, v8

    add-float/2addr v7, v9

    iput v7, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 176
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_7

    move v7, v0

    goto :goto_7

    :cond_7
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    :goto_7
    iget v8, p5, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    iget v9, p4, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    sub-float/2addr v8, v9

    mul-float v7, v7, v8

    add-float/2addr v7, v9

    iput v7, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 180
    :goto_8
    iget v7, p4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mAnimateRelativeTo:I

    iput v7, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mAnimateRelativeTo:I

    .line 181
    iget-object v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mTransitionEasing:Ljava/lang/String;

    invoke-static {v7}, Landroidx/constraintlayout/core/motion/utils/Easing;->getInterpolator(Ljava/lang/String;)Landroidx/constraintlayout/core/motion/utils/Easing;

    move-result-object v7

    iput-object v7, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mKeyFrameEasing:Landroidx/constraintlayout/core/motion/utils/Easing;

    .line 182
    iget v7, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPathMotionArc:I

    iput v7, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathMotionArc:I

    .line 183
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method initScreen(IILandroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V
    .locals 22
    .param p1, "parentWidth"    # I
    .param p2, "parentHeight"    # I
    .param p3, "c"    # Landroidx/constraintlayout/motion/widget/KeyPosition;
    .param p4, "startTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .param p5, "endTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "parentWidth",
            "parentHeight",
            "c",
            "startTimePoint",
            "endTimePoint"
        }
    .end annotation

    .line 200
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    iget v4, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mFramePosition:I

    int-to-float v4, v4

    const/high16 v5, 0x42c80000    # 100.0f

    div-float/2addr v4, v5

    .line 201
    .local v4, "position":F
    move-object/from16 v5, p0

    .line 202
    .local v5, "point":Landroidx/constraintlayout/motion/widget/MotionPaths;
    iput v4, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    .line 204
    iget v6, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mDrawPath:I

    iput v6, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mDrawPath:I

    .line 205
    iget v6, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    invoke-static {v6}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-eqz v6, :cond_0

    move v6, v4

    goto :goto_0

    :cond_0
    iget v6, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    .line 206
    .local v6, "scaleWidth":F
    :goto_0
    iget v7, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_1

    move v7, v4

    goto :goto_1

    :cond_1
    iget v7, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    .line 208
    .local v7, "scaleHeight":F
    :goto_1
    iget v8, v3, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    iget v9, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    sub-float v10, v8, v9

    .line 209
    .local v10, "scaleX":F
    iget v11, v3, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    iget v12, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    sub-float v13, v11, v12

    .line 211
    .local v13, "scaleY":F
    iget v14, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    iput v14, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    .line 213
    move v14, v4

    .line 215
    .local v14, "path":F
    iget v15, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    const/high16 v16, 0x40000000    # 2.0f

    div-float v17, v9, v16

    add-float v17, v15, v17

    .line 216
    .local v17, "startCenterX":F
    move/from16 v18, v4

    .end local v4    # "position":F
    .local v18, "position":F
    iget v4, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    div-float v19, v12, v16

    add-float v19, v4, v19

    .line 217
    .local v19, "startCenterY":F
    iget v2, v3, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    div-float v8, v8, v16

    add-float/2addr v2, v8

    .line 218
    .local v2, "endCenterX":F
    iget v8, v3, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    div-float v11, v11, v16

    add-float/2addr v8, v11

    .line 219
    .local v8, "endCenterY":F
    sub-float v11, v2, v17

    .line 220
    .local v11, "pathVectorX":F
    sub-float v20, v8, v19

    .line 221
    .local v20, "pathVectorY":F
    mul-float v21, v11, v14

    add-float v15, v15, v21

    mul-float v21, v10, v6

    div-float v21, v21, v16

    sub-float v15, v15, v21

    float-to-int v15, v15

    int-to-float v15, v15

    iput v15, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 222
    mul-float v15, v20, v14

    add-float/2addr v4, v15

    mul-float v15, v13, v7

    div-float v15, v15, v16

    sub-float/2addr v4, v15

    float-to-int v4, v4

    int-to-float v4, v4

    iput v4, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 223
    mul-float v4, v10, v6

    add-float/2addr v9, v4

    float-to-int v4, v9

    int-to-float v4, v4

    iput v4, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 224
    mul-float v4, v13, v7

    add-float/2addr v12, v4

    float-to-int v4, v12

    int-to-float v4, v4

    iput v4, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 226
    const/4 v4, 0x2

    iput v4, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->mMode:I

    .line 227
    iget v4, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_2

    .line 228
    move/from16 v4, p1

    int-to-float v9, v4

    iget v12, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    sub-float/2addr v9, v12

    float-to-int v4, v9

    .line 229
    .end local p1    # "parentWidth":I
    .local v4, "parentWidth":I
    iget v9, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    int-to-float v12, v4

    mul-float v9, v9, v12

    float-to-int v9, v9

    int-to-float v9, v9

    iput v9, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    goto :goto_2

    .line 227
    .end local v4    # "parentWidth":I
    .restart local p1    # "parentWidth":I
    :cond_2
    move/from16 v4, p1

    .line 231
    .end local p1    # "parentWidth":I
    .restart local v4    # "parentWidth":I
    :goto_2
    iget v9, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    invoke-static {v9}, Ljava/lang/Float;->isNaN(F)Z

    move-result v9

    if-nez v9, :cond_3

    .line 232
    move/from16 v9, p2

    int-to-float v12, v9

    iget v15, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    sub-float/2addr v12, v15

    float-to-int v9, v12

    .line 233
    .end local p2    # "parentHeight":I
    .local v9, "parentHeight":I
    iget v12, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    int-to-float v15, v9

    mul-float v12, v12, v15

    float-to-int v12, v12

    int-to-float v12, v12

    iput v12, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    goto :goto_3

    .line 231
    .end local v9    # "parentHeight":I
    .restart local p2    # "parentHeight":I
    :cond_3
    move/from16 v9, p2

    .line 236
    .end local p2    # "parentHeight":I
    .restart local v9    # "parentHeight":I
    :goto_3
    iget v12, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mAnimateRelativeTo:I

    iput v12, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->mAnimateRelativeTo:I

    .line 237
    iget-object v12, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mTransitionEasing:Ljava/lang/String;

    invoke-static {v12}, Landroidx/constraintlayout/core/motion/utils/Easing;->getInterpolator(Ljava/lang/String;)Landroidx/constraintlayout/core/motion/utils/Easing;

    move-result-object v12

    iput-object v12, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->mKeyFrameEasing:Landroidx/constraintlayout/core/motion/utils/Easing;

    .line 238
    iget v12, v1, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPathMotionArc:I

    iput v12, v5, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathMotionArc:I

    .line 239
    return-void
.end method

.method setBounds(FFFF)V
    .locals 0
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "w"    # F
    .param p4, "h"    # F
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "x",
            "y",
            "w",
            "h"
        }
    .end annotation

    .line 903
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 904
    iput p2, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 905
    iput p3, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 906
    iput p4, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 907
    return-void
.end method

.method setDpDt(FF[F[I[D[D)V
    .locals 21
    .param p1, "locationX"    # F
    .param p2, "locationY"    # F
    .param p3, "mAnchorDpDt"    # [F
    .param p4, "toUse"    # [I
    .param p5, "deltaData"    # [D
    .param p6, "data"    # [D
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "locationX",
            "locationY",
            "mAnchorDpDt",
            "toUse",
            "deltaData",
            "data"
        }
    .end annotation

    .line 787
    move-object/from16 v0, p4

    const/4 v1, 0x0

    .line 788
    .local v1, "d_x":F
    const/4 v2, 0x0

    .line 789
    .local v2, "d_y":F
    const/4 v3, 0x0

    .line 790
    .local v3, "d_width":F
    const/4 v4, 0x0

    .line 792
    .local v4, "d_height":F
    const/4 v5, 0x0

    .line 793
    .local v5, "deltaScaleX":F
    const/4 v6, 0x0

    .line 795
    .local v6, "deltaScaleY":F
    const/high16 v7, 0x7fc00000    # Float.NaN

    .line 796
    .local v7, "mPathRotate":F
    const/4 v8, 0x0

    .line 797
    .local v8, "deltaTranslationX":F
    const/4 v9, 0x0

    .line 799
    .local v9, "deltaTranslationY":F
    const-string v10, " dd = "

    .line 800
    .local v10, "mod":Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    array-length v12, v0

    if-ge v11, v12, :cond_0

    .line 801
    aget-wide v12, p5, v11

    double-to-float v12, v12

    .line 802
    .local v12, "deltaV":F
    aget-wide v13, p6, v11

    double-to-float v13, v13

    .line 806
    .local v13, "value":F
    aget v14, v0, v11

    packed-switch v14, :pswitch_data_0

    goto :goto_1

    .line 819
    :pswitch_0
    move v4, v12

    goto :goto_1

    .line 816
    :pswitch_1
    move v3, v12

    .line 817
    goto :goto_1

    .line 813
    :pswitch_2
    move v2, v12

    .line 814
    goto :goto_1

    .line 810
    :pswitch_3
    move v1, v12

    .line 811
    goto :goto_1

    .line 808
    :pswitch_4
    nop

    .line 800
    .end local v12    # "deltaV":F
    .end local v13    # "value":F
    :goto_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 830
    .end local v11    # "i":I
    :cond_0
    mul-float v11, v5, v3

    const/high16 v12, 0x40000000    # 2.0f

    div-float/2addr v11, v12

    sub-float v11, v1, v11

    .line 831
    .local v11, "deltaX":F
    mul-float v13, v6, v4

    div-float/2addr v13, v12

    sub-float v12, v2, v13

    .line 832
    .local v12, "deltaY":F
    const/high16 v13, 0x3f800000    # 1.0f

    add-float v14, v5, v13

    mul-float v14, v14, v3

    .line 833
    .local v14, "deltaWidth":F
    add-float v15, v6, v13

    mul-float v15, v15, v4

    .line 834
    .local v15, "deltaHeight":F
    add-float v16, v11, v14

    .line 835
    .local v16, "deltaRight":F
    add-float v17, v12, v15

    .line 858
    .local v17, "deltaBottom":F
    const/16 v18, 0x0

    sub-float v19, v13, p1

    mul-float v19, v19, v11

    mul-float v20, v16, p1

    add-float v19, v19, v20

    add-float v19, v19, v8

    aput v19, p3, v18

    .line 859
    sub-float v13, v13, p2

    mul-float v13, v13, v12

    mul-float v18, v17, p2

    add-float v13, v13, v18

    add-float/2addr v13, v9

    const/16 v18, 0x1

    aput v13, p3, v18

    .line 860
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method setView(FLandroid/view/View;[I[D[D[D)V
    .locals 35
    .param p1, "position"    # F
    .param p2, "view"    # Landroid/view/View;
    .param p3, "toUse"    # [I
    .param p4, "data"    # [D
    .param p5, "slope"    # [D
    .param p6, "cycle"    # [D
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "position",
            "view",
            "toUse",
            "data",
            "slope",
            "cycle"
        }
    .end annotation

    .line 493
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p5

    iget v4, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 494
    .local v4, "v_x":F
    iget v5, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 495
    .local v5, "v_y":F
    iget v6, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 496
    .local v6, "v_width":F
    iget v7, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 497
    .local v7, "v_height":F
    const/4 v8, 0x0

    .line 498
    .local v8, "dv_x":F
    const/4 v9, 0x0

    .line 499
    .local v9, "dv_y":F
    const/4 v10, 0x0

    .line 500
    .local v10, "dv_width":F
    const/4 v11, 0x0

    .line 501
    .local v11, "dv_height":F
    const/4 v12, 0x0

    .line 502
    .local v12, "delta_path":F
    const/high16 v13, 0x7fc00000    # Float.NaN

    .line 508
    .local v13, "path_rotate":F
    array-length v14, v2

    const/4 v15, 0x1

    if-eqz v14, :cond_0

    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    array-length v14, v14

    move/from16 v16, v4

    .end local v4    # "v_x":F
    .local v16, "v_x":F
    array-length v4, v2

    sub-int/2addr v4, v15

    aget v4, v2, v4

    if-gt v14, v4, :cond_1

    .line 509
    array-length v4, v2

    sub-int/2addr v4, v15

    aget v4, v2, v4

    add-int/2addr v4, v15

    .line 510
    .local v4, "scratch_data_length":I
    new-array v14, v4, [D

    iput-object v14, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    .line 511
    new-array v14, v4, [D

    iput-object v14, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempDelta:[D

    goto :goto_0

    .line 508
    .end local v16    # "v_x":F
    .local v4, "v_x":F
    :cond_0
    move/from16 v16, v4

    .line 513
    .end local v4    # "v_x":F
    .restart local v16    # "v_x":F
    :cond_1
    :goto_0
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    move v14, v5

    move/from16 v17, v6

    .end local v5    # "v_y":F
    .end local v6    # "v_width":F
    .local v14, "v_y":F
    .local v17, "v_width":F
    const-wide/high16 v5, 0x7ff8000000000000L    # Double.NaN

    invoke-static {v4, v5, v6}, Ljava/util/Arrays;->fill([DD)V

    .line 514
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v5, v2

    if-ge v4, v5, :cond_2

    .line 515
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    aget v6, v2, v4

    aget-wide v18, p4, v4

    aput-wide v18, v5, v6

    .line 516
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempDelta:[D

    aget v6, v2, v4

    aget-wide v18, v3, v4

    aput-wide v18, v5, v6

    .line 514
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 519
    .end local v4    # "i":I
    :cond_2
    const/4 v4, 0x0

    move v5, v14

    move/from16 v6, v17

    .end local v14    # "v_y":F
    .end local v17    # "v_width":F
    .restart local v4    # "i":I
    .restart local v5    # "v_y":F
    .restart local v6    # "v_width":F
    :goto_2
    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    array-length v15, v14

    if-ge v4, v15, :cond_7

    .line 520
    aget-wide v18, v14, v4

    invoke-static/range {v18 .. v19}, Ljava/lang/Double;->isNaN(D)Z

    move-result v14

    const-wide/16 v18, 0x0

    if-eqz v14, :cond_4

    if-eqz p6, :cond_3

    aget-wide v14, p6, v4

    cmpl-double v20, v14, v18

    if-nez v20, :cond_4

    .line 521
    move v15, v11

    move/from16 v18, v12

    goto/16 :goto_4

    .line 520
    :cond_3
    move v15, v11

    move/from16 v18, v12

    goto/16 :goto_4

    .line 523
    :cond_4
    if-eqz p6, :cond_5

    aget-wide v18, p6, v4

    :cond_5
    move-wide/from16 v14, v18

    .line 524
    .local v14, "deltaCycle":D
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    aget-wide v18, v2, v4

    invoke-static/range {v18 .. v19}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-eqz v2, :cond_6

    move-wide/from16 v20, v14

    goto :goto_3

    :cond_6
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    aget-wide v18, v2, v4

    add-double v18, v18, v14

    move-wide/from16 v20, v14

    move-wide/from16 v14, v18

    .end local v14    # "deltaCycle":D
    .local v20, "deltaCycle":D
    :goto_3
    double-to-float v2, v14

    .line 525
    .local v2, "value":F
    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempDelta:[D

    move v15, v11

    move/from16 v18, v12

    .end local v11    # "dv_height":F
    .end local v12    # "delta_path":F
    .local v15, "dv_height":F
    .local v18, "delta_path":F
    aget-wide v11, v14, v4

    double-to-float v11, v11

    .line 529
    .local v11, "dvalue":F
    packed-switch v4, :pswitch_data_0

    goto :goto_4

    .line 551
    :pswitch_0
    move v12, v2

    move v13, v12

    move v11, v15

    move/from16 v12, v18

    .end local v13    # "path_rotate":F
    .local v12, "path_rotate":F
    goto :goto_5

    .line 547
    .end local v12    # "path_rotate":F
    .restart local v13    # "path_rotate":F
    :pswitch_1
    move v7, v2

    .line 548
    move v12, v11

    .line 549
    .end local v15    # "dv_height":F
    .local v12, "dv_height":F
    move/from16 v12, v18

    goto :goto_5

    .line 543
    .end local v12    # "dv_height":F
    .restart local v15    # "dv_height":F
    :pswitch_2
    move v6, v2

    .line 544
    move v10, v11

    .line 545
    move v11, v15

    move/from16 v12, v18

    goto :goto_5

    .line 539
    :pswitch_3
    move v5, v2

    .line 540
    move v9, v11

    .line 541
    move v11, v15

    move/from16 v12, v18

    goto :goto_5

    .line 534
    :pswitch_4
    move v12, v2

    .line 535
    .end local v16    # "v_x":F
    .local v12, "v_x":F
    move v8, v11

    .line 537
    move/from16 v16, v12

    move v11, v15

    move/from16 v12, v18

    goto :goto_5

    .line 531
    .end local v12    # "v_x":F
    .restart local v16    # "v_x":F
    :pswitch_5
    move v12, v2

    .line 532
    .end local v18    # "delta_path":F
    .local v12, "delta_path":F
    move v11, v15

    goto :goto_5

    .line 519
    .end local v2    # "value":F
    .end local v15    # "dv_height":F
    .end local v20    # "deltaCycle":D
    .local v11, "dv_height":F
    :goto_4
    move v11, v15

    move/from16 v12, v18

    :goto_5
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v2, p3

    const/4 v15, 0x1

    goto :goto_2

    :cond_7
    move v15, v11

    move/from16 v18, v12

    .line 556
    .end local v4    # "i":I
    .end local v11    # "dv_height":F
    .end local v12    # "delta_path":F
    .restart local v15    # "dv_height":F
    .restart local v18    # "delta_path":F
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeToController:Landroidx/constraintlayout/motion/widget/MotionController;

    const/4 v11, 0x0

    if-eqz v2, :cond_a

    .line 557
    const/4 v12, 0x2

    new-array v14, v12, [F

    .line 558
    .local v14, "pos":[F
    new-array v4, v12, [F

    .line 560
    .local v4, "vel":[F
    move/from16 v12, p1

    float-to-double v0, v12

    invoke-virtual {v2, v0, v1, v14, v4}, Landroidx/constraintlayout/motion/widget/MotionController;->getCenter(D[F[F)V

    .line 561
    aget v0, v14, v11

    .line 562
    .local v0, "rx":F
    const/4 v1, 0x1

    aget v2, v14, v1

    .line 563
    .local v2, "ry":F
    move/from16 v1, v16

    .line 564
    .local v1, "radius":F
    move/from16 v21, v5

    .line 565
    .local v21, "angle":F
    move/from16 v22, v8

    .line 566
    .local v22, "dradius":F
    move/from16 v23, v9

    .line 567
    .local v23, "dangle":F
    move/from16 v24, v5

    .end local v5    # "v_y":F
    .local v24, "v_y":F
    aget v5, v4, v11

    .line 568
    .local v5, "drx":F
    const/16 v17, 0x1

    aget v11, v4, v17

    .line 571
    .local v11, "dry":F
    move-object/from16 v27, v14

    move/from16 v26, v15

    .end local v14    # "pos":[F
    .end local v15    # "dv_height":F
    .local v26, "dv_height":F
    .local v27, "pos":[F
    float-to-double v14, v0

    move/from16 v29, v8

    move/from16 v28, v9

    .end local v8    # "dv_x":F
    .end local v9    # "dv_y":F
    .local v28, "dv_y":F
    .local v29, "dv_x":F
    float-to-double v8, v1

    move/from16 v30, v0

    move/from16 v0, v21

    move/from16 v21, v13

    .end local v13    # "path_rotate":F
    .local v0, "angle":F
    .local v21, "path_rotate":F
    .local v30, "rx":F
    float-to-double v12, v0

    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v8, v8, v12

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v14, v8

    const/high16 v8, 0x40000000    # 2.0f

    div-float v9, v6, v8

    float-to-double v8, v9

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v14, v8

    double-to-float v8, v14

    .line 572
    .local v8, "pos_x":F
    float-to-double v12, v2

    float-to-double v14, v1

    move/from16 v31, v10

    .end local v10    # "dv_width":F
    .local v31, "dv_width":F
    float-to-double v9, v0

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v14, v14, v9

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v12, v14

    const/high16 v9, 0x40000000    # 2.0f

    div-float v9, v7, v9

    float-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v12, v9

    double-to-float v9, v12

    .line 573
    .local v9, "pos_y":F
    float-to-double v12, v5

    move/from16 v10, v22

    .end local v22    # "dradius":F
    .local v10, "dradius":F
    float-to-double v14, v10

    move-object/from16 v19, v4

    move/from16 v22, v5

    .end local v4    # "vel":[F
    .end local v5    # "drx":F
    .local v19, "vel":[F
    .local v22, "drx":F
    float-to-double v4, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v14, v14, v4

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v12, v14

    float-to-double v4, v1

    float-to-double v14, v0

    invoke-static {v14, v15}, Ljava/lang/Math;->cos(D)D

    move-result-wide v14

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v4, v4, v14

    move v15, v7

    move/from16 v14, v23

    move/from16 v23, v6

    .end local v6    # "v_width":F
    .end local v7    # "v_height":F
    .local v14, "dangle":F
    .local v15, "v_height":F
    .local v23, "v_width":F
    float-to-double v6, v14

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v4, v4, v6

    add-double/2addr v12, v4

    double-to-float v4, v12

    .line 574
    .local v4, "dpos_x":F
    float-to-double v5, v11

    float-to-double v12, v10

    move/from16 v32, v10

    move v7, v11

    .end local v10    # "dradius":F
    .end local v11    # "dry":F
    .local v7, "dry":F
    .local v32, "dradius":F
    float-to-double v10, v0

    invoke-static {v10, v11}, Ljava/lang/Math;->cos(D)D

    move-result-wide v10

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v12, v12, v10

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v5, v12

    float-to-double v10, v1

    float-to-double v12, v0

    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    invoke-static {v10, v11}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v10, v10, v12

    float-to-double v12, v14

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v10, v10, v12

    add-double/2addr v5, v10

    double-to-float v5, v5

    .line 575
    .local v5, "dpos_y":F
    move v6, v4

    .line 576
    .end local v29    # "dv_x":F
    .local v6, "dv_x":F
    move v10, v5

    .line 577
    .end local v28    # "dv_y":F
    .local v10, "dv_y":F
    move/from16 v16, v8

    .line 578
    move v11, v9

    .line 579
    .end local v24    # "v_y":F
    .local v11, "v_y":F
    array-length v12, v3

    const/4 v13, 0x2

    if-lt v12, v13, :cond_8

    .line 580
    float-to-double v12, v4

    const/16 v20, 0x0

    aput-wide v12, v3, v20

    .line 581
    float-to-double v12, v5

    const/16 v17, 0x1

    aput-wide v12, v3, v17

    goto :goto_6

    .line 579
    :cond_8
    const/16 v17, 0x1

    const/16 v20, 0x0

    .line 583
    :goto_6
    invoke-static/range {v21 .. v21}, Ljava/lang/Float;->isNaN(F)Z

    move-result v12

    if-nez v12, :cond_9

    .line 584
    move v12, v1

    move/from16 v13, v21

    move/from16 v21, v0

    .end local v0    # "angle":F
    .end local v1    # "radius":F
    .local v12, "radius":F
    .restart local v13    # "path_rotate":F
    .local v21, "angle":F
    float-to-double v0, v13

    move/from16 v25, v2

    .end local v2    # "ry":F
    .local v25, "ry":F
    float-to-double v2, v10

    move/from16 v33, v4

    move/from16 v34, v5

    .end local v4    # "dpos_x":F
    .end local v5    # "dpos_y":F
    .local v33, "dpos_x":F
    .local v34, "dpos_y":F
    float-to-double v4, v6

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v2

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v0, v2

    double-to-float v0, v0

    .line 585
    .local v0, "rot":F
    move-object/from16 v1, p2

    invoke-virtual {v1, v0}, Landroid/view/View;->setRotation(F)V

    goto :goto_7

    .line 583
    .end local v12    # "radius":F
    .end local v13    # "path_rotate":F
    .end local v25    # "ry":F
    .end local v33    # "dpos_x":F
    .end local v34    # "dpos_y":F
    .local v0, "angle":F
    .restart local v1    # "radius":F
    .restart local v2    # "ry":F
    .restart local v4    # "dpos_x":F
    .restart local v5    # "dpos_y":F
    .local v21, "path_rotate":F
    :cond_9
    move v12, v1

    move/from16 v25, v2

    move/from16 v33, v4

    move/from16 v34, v5

    move/from16 v13, v21

    move-object/from16 v1, p2

    move/from16 v21, v0

    .line 588
    .end local v0    # "angle":F
    .end local v1    # "radius":F
    .end local v2    # "ry":F
    .end local v4    # "dpos_x":F
    .end local v5    # "dpos_y":F
    .end local v7    # "dry":F
    .end local v8    # "pos_x":F
    .end local v9    # "pos_y":F
    .end local v14    # "dangle":F
    .end local v19    # "vel":[F
    .end local v21    # "path_rotate":F
    .end local v22    # "drx":F
    .end local v27    # "pos":[F
    .end local v30    # "rx":F
    .end local v32    # "dradius":F
    .restart local v13    # "path_rotate":F
    :goto_7
    move v8, v6

    move v9, v10

    move v5, v11

    goto :goto_8

    .line 590
    .end local v11    # "v_y":F
    .end local v23    # "v_width":F
    .end local v26    # "dv_height":F
    .end local v31    # "dv_width":F
    .local v5, "v_y":F
    .local v6, "v_width":F
    .local v7, "v_height":F
    .local v8, "dv_x":F
    .local v9, "dv_y":F
    .local v10, "dv_width":F
    .local v15, "dv_height":F
    :cond_a
    move/from16 v24, v5

    move/from16 v23, v6

    move/from16 v29, v8

    move/from16 v28, v9

    move/from16 v31, v10

    move/from16 v26, v15

    const/16 v17, 0x1

    const/16 v20, 0x0

    move v15, v7

    .end local v5    # "v_y":F
    .end local v6    # "v_width":F
    .end local v7    # "v_height":F
    .end local v8    # "dv_x":F
    .end local v9    # "dv_y":F
    .end local v10    # "dv_width":F
    .local v15, "v_height":F
    .restart local v23    # "v_width":F
    .restart local v24    # "v_y":F
    .restart local v26    # "dv_height":F
    .restart local v28    # "dv_y":F
    .restart local v29    # "dv_x":F
    .restart local v31    # "dv_width":F
    invoke-static {v13}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_b

    .line 591
    const/4 v0, 0x0

    .line 592
    .local v0, "rot":F
    const/high16 v2, 0x40000000    # 2.0f

    div-float v10, v31, v2

    add-float v8, v29, v10

    .line 593
    .local v8, "dx":F
    div-float v11, v26, v2

    add-float v9, v28, v11

    .line 600
    .local v9, "dy":F
    float-to-double v2, v0

    float-to-double v4, v13

    float-to-double v6, v9

    float-to-double v10, v8

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v6

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v4, v6

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v2, v4

    double-to-float v0, v2

    .line 601
    invoke-virtual {v1, v0}, Landroid/view/View;->setRotation(F)V

    .line 608
    .end local v0    # "rot":F
    .end local v8    # "dx":F
    .end local v9    # "dy":F
    :cond_b
    move/from16 v5, v24

    move/from16 v9, v28

    move/from16 v8, v29

    .end local v24    # "v_y":F
    .end local v28    # "dv_y":F
    .end local v29    # "dv_x":F
    .restart local v5    # "v_y":F
    .local v8, "dv_x":F
    .local v9, "dv_y":F
    :goto_8
    instance-of v0, v1, Landroidx/constraintlayout/motion/widget/FloatLayout;

    if-eqz v0, :cond_c

    .line 609
    move/from16 v0, v16

    .line 610
    .local v0, "l":F
    move v2, v5

    .line 611
    .local v2, "t":F
    add-float v6, v16, v23

    .line 612
    .local v6, "r":F
    add-float v7, v5, v15

    .line 613
    .local v7, "b":F
    move-object v3, v1

    check-cast v3, Landroidx/constraintlayout/motion/widget/FloatLayout;

    invoke-interface {v3, v0, v2, v6, v7}, Landroidx/constraintlayout/motion/widget/FloatLayout;->layout(FFFF)V

    .line 614
    return-void

    .line 616
    .end local v0    # "l":F
    .end local v2    # "t":F
    .end local v6    # "r":F
    .end local v7    # "b":F
    :cond_c
    const/high16 v0, 0x3f000000    # 0.5f

    add-float v2, v16, v0

    float-to-int v2, v2

    .line 617
    .local v2, "l":I
    add-float v3, v5, v0

    float-to-int v3, v3

    .line 618
    .local v3, "t":I
    add-float v4, v16, v0

    add-float v4, v4, v23

    float-to-int v4, v4

    .line 619
    .local v4, "r":I
    add-float/2addr v0, v5

    add-float/2addr v0, v15

    float-to-int v0, v0

    .line 620
    .local v0, "b":I
    sub-int v6, v4, v2

    .line 621
    .local v6, "i_width":I
    sub-int v7, v0, v3

    .line 631
    .local v7, "i_height":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    if-ne v6, v10, :cond_e

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    if-eq v7, v10, :cond_d

    goto :goto_9

    :cond_d
    const/16 v17, 0x0

    :cond_e
    :goto_9
    move/from16 v10, v17

    .line 633
    .local v10, "remeasure":Z
    if-eqz v10, :cond_f

    .line 634
    const/high16 v11, 0x40000000    # 2.0f

    invoke-static {v6, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v12

    .line 635
    .local v12, "widthMeasureSpec":I
    invoke-static {v7, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v11

    .line 637
    .local v11, "heightMeasureSpec":I
    invoke-virtual {v1, v12, v11}, Landroid/view/View;->measure(II)V

    .line 640
    .end local v11    # "heightMeasureSpec":I
    .end local v12    # "widthMeasureSpec":I
    :cond_f
    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/view/View;->layout(IIII)V

    .line 646
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setupRelative(Landroidx/constraintlayout/motion/widget/MotionController;Landroidx/constraintlayout/motion/widget/MotionPaths;)V
    .locals 8
    .param p1, "mc"    # Landroidx/constraintlayout/motion/widget/MotionController;
    .param p2, "relative"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "mc",
            "relative"
        }
    .end annotation

    .line 186
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p2, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    sub-float/2addr v0, v1

    iget v1, p2, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    float-to-double v0, v0

    .line 187
    .local v0, "dx":D
    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    div-float/2addr v4, v2

    add-float/2addr v3, v4

    iget v4, p2, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    sub-float/2addr v3, v4

    iget v4, p2, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    div-float/2addr v4, v2

    sub-float/2addr v3, v4

    float-to-double v2, v3

    .line 188
    .local v2, "dy":D
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeToController:Landroidx/constraintlayout/motion/widget/MotionController;

    .line 190
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v4

    double-to-float v4, v4

    iput v4, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 191
    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeAngle:F

    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 192
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v4

    const-wide v6, 0x3ff921fb54442d18L    # 1.5707963267948966

    add-double/2addr v4, v6

    double-to-float v4, v4

    iput v4, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    goto :goto_0

    .line 194
    :cond_0
    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mRelativeAngle:F

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v4

    double-to-float v4, v4

    iput v4, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 197
    :goto_0
    return-void
.end method
