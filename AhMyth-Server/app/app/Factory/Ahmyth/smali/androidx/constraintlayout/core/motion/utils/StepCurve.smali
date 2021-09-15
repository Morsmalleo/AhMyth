.class public Landroidx/constraintlayout/core/motion/utils/StepCurve;
.super Landroidx/constraintlayout/core/motion/utils/Easing;
.source "StepCurve.java"


# static fields
.field private static final DEBUG:Z = false


# instance fields
.field mCurveFit:Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 9
    .param p1, "configString"    # Ljava/lang/String;

    .line 31
    invoke-direct {p0}, Landroidx/constraintlayout/core/motion/utils/Easing;-><init>()V

    .line 33
    iput-object p1, p0, Landroidx/constraintlayout/core/motion/utils/StepCurve;->str:Ljava/lang/String;

    .line 34
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/StepCurve;->str:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [D

    .line 35
    .local v0, "values":[D
    const/16 v1, 0x28

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    .line 36
    .local v1, "start":I
    const/16 v2, 0x2c

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 37
    .local v3, "off1":I
    const/4 v4, 0x0

    .line 38
    .local v4, "count":I
    :goto_0
    const/4 v5, -0x1

    if-eq v3, v5, :cond_0

    .line 39
    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 40
    .local v5, "tmp":Ljava/lang/String;
    add-int/lit8 v6, v4, 0x1

    .end local v4    # "count":I
    .local v6, "count":I
    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v7

    aput-wide v7, v0, v4

    .line 41
    add-int/lit8 v4, v3, 0x1

    move v1, v4

    invoke-virtual {p1, v2, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 42
    .end local v5    # "tmp":Ljava/lang/String;
    move v4, v6

    goto :goto_0

    .line 43
    .end local v6    # "count":I
    .restart local v4    # "count":I
    :cond_0
    const/16 v2, 0x29

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 44
    .end local v3    # "off1":I
    .local v2, "off1":I
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 45
    .local v3, "tmp":Ljava/lang/String;
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "count":I
    .local v5, "count":I
    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6

    aput-wide v6, v0, v4

    .line 47
    invoke-static {v0, v5}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v4

    invoke-static {v4}, Landroidx/constraintlayout/core/motion/utils/StepCurve;->genSpline([D)Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;

    move-result-object v4

    iput-object v4, p0, Landroidx/constraintlayout/core/motion/utils/StepCurve;->mCurveFit:Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;

    .line 48
    return-void
.end method

.method private static genSpline(Ljava/lang/String;)Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;
    .locals 6
    .param p0, "str"    # Ljava/lang/String;

    .line 51
    move-object v0, p0

    .line 52
    .local v0, "wave":Ljava/lang/String;
    const-string v1, "\\s+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 53
    .local v1, "sp":[Ljava/lang/String;
    array-length v2, v1

    new-array v2, v2, [D

    .line 54
    .local v2, "values":[D
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_0

    .line 55
    aget-object v4, v1, v3

    invoke-static {v4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    aput-wide v4, v2, v3

    .line 54
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 57
    .end local v3    # "i":I
    :cond_0
    invoke-static {v2}, Landroidx/constraintlayout/core/motion/utils/StepCurve;->genSpline([D)Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;

    move-result-object v3

    return-object v3
.end method

.method private static genSpline([D)Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;
    .locals 18
    .param p0, "values"    # [D

    .line 61
    move-object/from16 v0, p0

    array-length v1, v0

    mul-int/lit8 v1, v1, 0x3

    const/4 v2, 0x2

    sub-int/2addr v1, v2

    .line 62
    .local v1, "length":I
    array-length v3, v0

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    .line 63
    .local v3, "len":I
    int-to-double v5, v3

    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    div-double v5, v7, v5

    .line 64
    .local v5, "gap":D
    new-array v2, v2, [I

    aput v4, v2, v4

    const/4 v4, 0x0

    aput v1, v2, v4

    const-class v9, D

    invoke-static {v9, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[D

    .line 65
    .local v2, "points":[[D
    new-array v9, v1, [D

    .line 66
    .local v9, "time":[D
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    array-length v11, v0

    if-ge v10, v11, :cond_1

    .line 67
    aget-wide v11, v0, v10

    .line 68
    .local v11, "v":D
    add-int v13, v10, v3

    aget-object v13, v2, v13

    aput-wide v11, v13, v4

    .line 69
    add-int v13, v10, v3

    int-to-double v14, v10

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v14, v14, v5

    aput-wide v14, v9, v13

    .line 70
    if-lez v10, :cond_0

    .line 71
    mul-int/lit8 v13, v3, 0x2

    add-int/2addr v13, v10

    aget-object v13, v2, v13

    add-double v14, v11, v7

    aput-wide v14, v13, v4

    .line 72
    mul-int/lit8 v13, v3, 0x2

    add-int/2addr v13, v10

    int-to-double v14, v10

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v14, v14, v5

    add-double/2addr v14, v7

    aput-wide v14, v9, v13

    .line 74
    add-int/lit8 v13, v10, -0x1

    aget-object v13, v2, v13

    sub-double v14, v11, v7

    sub-double/2addr v14, v5

    aput-wide v14, v13, v4

    .line 75
    add-int/lit8 v13, v10, -0x1

    int-to-double v14, v10

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v14, v14, v5

    const-wide/high16 v16, -0x4010000000000000L    # -1.0

    add-double v14, v14, v16

    sub-double/2addr v14, v5

    aput-wide v14, v9, v13

    .line 66
    .end local v11    # "v":D
    :cond_0
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 89
    .end local v10    # "i":I
    :cond_1
    new-instance v10, Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;

    invoke-direct {v10, v9, v2}, Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;-><init>([D[[D)V

    .line 90
    .local v10, "ms":Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, " 0 "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-wide/16 v13, 0x0

    invoke-virtual {v10, v13, v14, v4}, Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;->getPos(DI)D

    move-result-wide v13

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 91
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, " 1 "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v7, v8, v4}, Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;->getPos(DI)D

    move-result-wide v7

    invoke-virtual {v12, v7, v8}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 92
    return-object v10
.end method


# virtual methods
.method public get(D)D
    .locals 2
    .param p1, "x"    # D

    .line 100
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/StepCurve;->mCurveFit:Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;->getPos(DI)D

    move-result-wide v0

    return-wide v0
.end method

.method public getDiff(D)D
    .locals 2
    .param p1, "x"    # D

    .line 96
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/StepCurve;->mCurveFit:Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Landroidx/constraintlayout/core/motion/utils/MonotonicCurveFit;->getSlope(DI)D

    move-result-wide v0

    return-wide v0
.end method
