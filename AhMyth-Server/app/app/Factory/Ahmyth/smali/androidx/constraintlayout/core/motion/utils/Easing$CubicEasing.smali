.class Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;
.super Landroidx/constraintlayout/core/motion/utils/Easing;
.source "Easing.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/core/motion/utils/Easing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CubicEasing"
.end annotation


# static fields
.field private static d_error:D

.field private static error:D


# instance fields
.field x1:D

.field x2:D

.field y1:D

.field y2:D


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 84
    const-wide v0, 0x3f847ae147ae147bL    # 0.01

    sput-wide v0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->error:D

    .line 85
    const-wide v0, 0x3f1a36e2eb1c432dL    # 1.0E-4

    sput-wide v0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->d_error:D

    return-void
.end method

.method public constructor <init>(DDDD)V
    .locals 0
    .param p1, "x1"    # D
    .param p3, "y1"    # D
    .param p5, "x2"    # D
    .param p7, "y2"    # D

    .line 102
    invoke-direct {p0}, Landroidx/constraintlayout/core/motion/utils/Easing;-><init>()V

    .line 103
    invoke-virtual/range {p0 .. p8}, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->setup(DDDD)V

    .line 104
    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 7
    .param p1, "configString"    # Ljava/lang/String;

    .line 88
    invoke-direct {p0}, Landroidx/constraintlayout/core/motion/utils/Easing;-><init>()V

    .line 90
    iput-object p1, p0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->str:Ljava/lang/String;

    .line 91
    const/16 v0, 0x28

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 92
    .local v0, "start":I
    const/16 v1, 0x2c

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 93
    .local v2, "off1":I
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    iput-wide v3, p0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->x1:D

    .line 94
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 95
    .local v3, "off2":I
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->y1:D

    .line 96
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {p1, v1, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 97
    .local v1, "off3":I
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {p1, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->x2:D

    .line 98
    add-int/lit8 v4, v1, 0x1

    const/16 v5, 0x29

    invoke-virtual {p1, v5, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 99
    .local v4, "end":I
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p1, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v5

    iput-wide v5, p0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->y2:D

    .line 100
    return-void
.end method

.method private getDiffX(D)D
    .locals 15
    .param p1, "t"    # D

    .line 132
    move-object v0, p0

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    sub-double v3, v1, p1

    .line 133
    .local v3, "t1":D
    const-wide/high16 v5, 0x4008000000000000L    # 3.0

    mul-double v7, v3, v5

    mul-double v7, v7, v3

    iget-wide v9, v0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->x1:D

    mul-double v7, v7, v9

    const-wide/high16 v11, 0x4018000000000000L    # 6.0

    mul-double v11, v11, v3

    mul-double v11, v11, p1

    iget-wide v13, v0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->x2:D

    sub-double v9, v13, v9

    mul-double v11, v11, v9

    add-double/2addr v7, v11

    mul-double v5, v5, p1

    mul-double v5, v5, p1

    sub-double/2addr v1, v13

    mul-double v5, v5, v1

    add-double/2addr v7, v5

    return-wide v7
.end method

.method private getDiffY(D)D
    .locals 15
    .param p1, "t"    # D

    .line 137
    move-object v0, p0

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    sub-double v3, v1, p1

    .line 138
    .local v3, "t1":D
    const-wide/high16 v5, 0x4008000000000000L    # 3.0

    mul-double v7, v3, v5

    mul-double v7, v7, v3

    iget-wide v9, v0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->y1:D

    mul-double v7, v7, v9

    const-wide/high16 v11, 0x4018000000000000L    # 6.0

    mul-double v11, v11, v3

    mul-double v11, v11, p1

    iget-wide v13, v0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->y2:D

    sub-double v9, v13, v9

    mul-double v11, v11, v9

    add-double/2addr v7, v11

    mul-double v5, v5, p1

    mul-double v5, v5, p1

    sub-double/2addr v1, v13

    mul-double v5, v5, v1

    add-double/2addr v7, v5

    return-wide v7
.end method

.method private getX(D)D
    .locals 12
    .param p1, "t"    # D

    .line 114
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v0, p1

    .line 116
    .local v0, "t1":D
    const-wide/high16 v2, 0x4008000000000000L    # 3.0

    mul-double v4, v0, v2

    mul-double v4, v4, v0

    mul-double v4, v4, p1

    .line 117
    .local v4, "f1":D
    mul-double v2, v2, v0

    mul-double v2, v2, p1

    mul-double v2, v2, p1

    .line 118
    .local v2, "f2":D
    mul-double v6, p1, p1

    mul-double v6, v6, p1

    .line 119
    .local v6, "f3":D
    iget-wide v8, p0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->x1:D

    mul-double v8, v8, v4

    iget-wide v10, p0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->x2:D

    mul-double v10, v10, v2

    add-double/2addr v8, v10

    add-double/2addr v8, v6

    return-wide v8
.end method

.method private getY(D)D
    .locals 12
    .param p1, "t"    # D

    .line 123
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v0, p1

    .line 125
    .local v0, "t1":D
    const-wide/high16 v2, 0x4008000000000000L    # 3.0

    mul-double v4, v0, v2

    mul-double v4, v4, v0

    mul-double v4, v4, p1

    .line 126
    .local v4, "f1":D
    mul-double v2, v2, v0

    mul-double v2, v2, p1

    mul-double v2, v2, p1

    .line 127
    .local v2, "f2":D
    mul-double v6, p1, p1

    mul-double v6, v6, p1

    .line 128
    .local v6, "f3":D
    iget-wide v8, p0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->y1:D

    mul-double v8, v8, v4

    iget-wide v10, p0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->y2:D

    mul-double v10, v10, v2

    add-double/2addr v8, v10

    add-double/2addr v8, v6

    return-wide v8
.end method


# virtual methods
.method public get(D)D
    .locals 17
    .param p1, "x"    # D

    .line 171
    move-object/from16 v0, p0

    const-wide/16 v1, 0x0

    cmpg-double v3, p1, v1

    if-gtz v3, :cond_0

    .line 172
    return-wide v1

    .line 174
    :cond_0
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    cmpl-double v3, p1, v1

    if-ltz v3, :cond_1

    .line 175
    return-wide v1

    .line 177
    :cond_1
    const-wide/high16 v1, 0x3fe0000000000000L    # 0.5

    .line 178
    .local v1, "t":D
    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    .line 179
    .local v3, "range":D
    :goto_0
    sget-wide v5, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->error:D

    cmpl-double v7, v3, v5

    if-lez v7, :cond_3

    .line 180
    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->getX(D)D

    move-result-wide v5

    .line 181
    .local v5, "tx":D
    const-wide/high16 v7, 0x3fe0000000000000L    # 0.5

    mul-double v3, v3, v7

    .line 182
    cmpg-double v7, v5, p1

    if-gez v7, :cond_2

    .line 183
    add-double/2addr v1, v3

    goto :goto_1

    .line 185
    :cond_2
    sub-double/2addr v1, v3

    .line 187
    .end local v5    # "tx":D
    :goto_1
    goto :goto_0

    .line 189
    :cond_3
    sub-double v5, v1, v3

    invoke-direct {v0, v5, v6}, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->getX(D)D

    move-result-wide v5

    .line 190
    .local v5, "x1":D
    add-double v7, v1, v3

    invoke-direct {v0, v7, v8}, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->getX(D)D

    move-result-wide v7

    .line 191
    .local v7, "x2":D
    sub-double v9, v1, v3

    invoke-direct {v0, v9, v10}, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->getY(D)D

    move-result-wide v9

    .line 192
    .local v9, "y1":D
    add-double v11, v1, v3

    invoke-direct {v0, v11, v12}, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->getY(D)D

    move-result-wide v11

    .line 194
    .local v11, "y2":D
    sub-double v13, v11, v9

    sub-double v15, p1, v5

    mul-double v13, v13, v15

    sub-double v15, v7, v5

    div-double/2addr v13, v15

    add-double/2addr v13, v9

    return-wide v13
.end method

.method public getDiff(D)D
    .locals 17
    .param p1, "x"    # D

    .line 146
    move-object/from16 v0, p0

    const-wide/high16 v1, 0x3fe0000000000000L    # 0.5

    .line 147
    .local v1, "t":D
    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    .line 148
    .local v3, "range":D
    :goto_0
    sget-wide v5, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->d_error:D

    cmpl-double v7, v3, v5

    if-lez v7, :cond_1

    .line 149
    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->getX(D)D

    move-result-wide v5

    .line 150
    .local v5, "tx":D
    const-wide/high16 v7, 0x3fe0000000000000L    # 0.5

    mul-double v3, v3, v7

    .line 151
    cmpg-double v7, v5, p1

    if-gez v7, :cond_0

    .line 152
    add-double/2addr v1, v3

    goto :goto_1

    .line 154
    :cond_0
    sub-double/2addr v1, v3

    .line 156
    .end local v5    # "tx":D
    :goto_1
    goto :goto_0

    .line 158
    :cond_1
    sub-double v5, v1, v3

    invoke-direct {v0, v5, v6}, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->getX(D)D

    move-result-wide v5

    .line 159
    .local v5, "x1":D
    add-double v7, v1, v3

    invoke-direct {v0, v7, v8}, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->getX(D)D

    move-result-wide v7

    .line 160
    .local v7, "x2":D
    sub-double v9, v1, v3

    invoke-direct {v0, v9, v10}, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->getY(D)D

    move-result-wide v9

    .line 161
    .local v9, "y1":D
    add-double v11, v1, v3

    invoke-direct {v0, v11, v12}, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->getY(D)D

    move-result-wide v11

    .line 163
    .local v11, "y2":D
    sub-double v13, v11, v9

    sub-double v15, v7, v5

    div-double/2addr v13, v15

    return-wide v13
.end method

.method setup(DDDD)V
    .locals 0
    .param p1, "x1"    # D
    .param p3, "y1"    # D
    .param p5, "x2"    # D
    .param p7, "y2"    # D

    .line 107
    iput-wide p1, p0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->x1:D

    .line 108
    iput-wide p3, p0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->y1:D

    .line 109
    iput-wide p5, p0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->x2:D

    .line 110
    iput-wide p7, p0, Landroidx/constraintlayout/core/motion/utils/Easing$CubicEasing;->y2:D

    .line 111
    return-void
.end method
