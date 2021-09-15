.class public Lcom/google/android/material/shape/ShapePath;
.super Ljava/lang/Object;
.source "ShapePath.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/shape/ShapePath$PathCubicOperation;,
        Lcom/google/android/material/shape/ShapePath$PathArcOperation;,
        Lcom/google/android/material/shape/ShapePath$PathQuadOperation;,
        Lcom/google/android/material/shape/ShapePath$PathLineOperation;,
        Lcom/google/android/material/shape/ShapePath$PathOperation;,
        Lcom/google/android/material/shape/ShapePath$ArcShadowOperation;,
        Lcom/google/android/material/shape/ShapePath$LineShadowOperation;,
        Lcom/google/android/material/shape/ShapePath$ShadowCompatOperation;
    }
.end annotation


# static fields
.field protected static final ANGLE_LEFT:F = 180.0f

.field private static final ANGLE_UP:F = 270.0f


# instance fields
.field private containsIncompatibleShadowOp:Z

.field public currentShadowAngle:F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public endShadowAngle:F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public endX:F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public endY:F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private final operations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/material/shape/ShapePath$PathOperation;",
            ">;"
        }
    .end annotation
.end field

.field private final shadowCompatOperations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/material/shape/ShapePath$ShadowCompatOperation;",
            ">;"
        }
    .end annotation
.end field

.field public startX:F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public startY:F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/shape/ShapePath;->operations:Ljava/util/List;

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/shape/ShapePath;->shadowCompatOperations:Ljava/util/List;

    .line 95
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lcom/google/android/material/shape/ShapePath;->reset(FF)V

    .line 96
    return-void
.end method

.method public constructor <init>(FF)V
    .locals 1
    .param p1, "startX"    # F
    .param p2, "startY"    # F

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/shape/ShapePath;->operations:Ljava/util/List;

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/shape/ShapePath;->shadowCompatOperations:Ljava/util/List;

    .line 99
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/shape/ShapePath;->reset(FF)V

    .line 100
    return-void
.end method

.method private addConnectingShadowIfNecessary(F)V
    .locals 6
    .param p1, "nextShadowAngle"    # F

    .line 293
    invoke-direct {p0}, Lcom/google/android/material/shape/ShapePath;->getCurrentShadowAngle()F

    move-result v0

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    .line 295
    return-void

    .line 297
    :cond_0
    invoke-direct {p0}, Lcom/google/android/material/shape/ShapePath;->getCurrentShadowAngle()F

    move-result v0

    sub-float v0, p1, v0

    const/high16 v1, 0x43b40000    # 360.0f

    add-float/2addr v0, v1

    rem-float/2addr v0, v1

    .line 298
    .local v0, "shadowSweep":F
    const/high16 v1, 0x43340000    # 180.0f

    cmpl-float v1, v0, v1

    if-lez v1, :cond_1

    .line 300
    return-void

    .line 302
    :cond_1
    new-instance v1, Lcom/google/android/material/shape/ShapePath$PathArcOperation;

    .line 303
    invoke-virtual {p0}, Lcom/google/android/material/shape/ShapePath;->getEndX()F

    move-result v2

    invoke-virtual {p0}, Lcom/google/android/material/shape/ShapePath;->getEndY()F

    move-result v3

    invoke-virtual {p0}, Lcom/google/android/material/shape/ShapePath;->getEndX()F

    move-result v4

    invoke-virtual {p0}, Lcom/google/android/material/shape/ShapePath;->getEndY()F

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/google/android/material/shape/ShapePath$PathArcOperation;-><init>(FFFF)V

    .line 304
    .local v1, "pathArcOperation":Lcom/google/android/material/shape/ShapePath$PathArcOperation;
    invoke-direct {p0}, Lcom/google/android/material/shape/ShapePath;->getCurrentShadowAngle()F

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/material/shape/ShapePath$PathArcOperation;->access$600(Lcom/google/android/material/shape/ShapePath$PathArcOperation;F)V

    .line 305
    invoke-static {v1, v0}, Lcom/google/android/material/shape/ShapePath$PathArcOperation;->access$700(Lcom/google/android/material/shape/ShapePath$PathArcOperation;F)V

    .line 306
    iget-object v2, p0, Lcom/google/android/material/shape/ShapePath;->shadowCompatOperations:Ljava/util/List;

    new-instance v3, Lcom/google/android/material/shape/ShapePath$ArcShadowOperation;

    invoke-direct {v3, v1}, Lcom/google/android/material/shape/ShapePath$ArcShadowOperation;-><init>(Lcom/google/android/material/shape/ShapePath$PathArcOperation;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    invoke-direct {p0, p1}, Lcom/google/android/material/shape/ShapePath;->setCurrentShadowAngle(F)V

    .line 308
    return-void
.end method

.method private addShadowCompatOperation(Lcom/google/android/material/shape/ShapePath$ShadowCompatOperation;FF)V
    .locals 1
    .param p1, "shadowOperation"    # Lcom/google/android/material/shape/ShapePath$ShadowCompatOperation;
    .param p2, "startShadowAngle"    # F
    .param p3, "endShadowAngle"    # F

    .line 275
    invoke-direct {p0, p2}, Lcom/google/android/material/shape/ShapePath;->addConnectingShadowIfNecessary(F)V

    .line 276
    iget-object v0, p0, Lcom/google/android/material/shape/ShapePath;->shadowCompatOperations:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    invoke-direct {p0, p3}, Lcom/google/android/material/shape/ShapePath;->setCurrentShadowAngle(F)V

    .line 278
    return-void
.end method

.method private getCurrentShadowAngle()F
    .locals 1

    .line 327
    iget v0, p0, Lcom/google/android/material/shape/ShapePath;->currentShadowAngle:F

    return v0
.end method

.method private getEndShadowAngle()F
    .locals 1

    .line 331
    iget v0, p0, Lcom/google/android/material/shape/ShapePath;->endShadowAngle:F

    return v0
.end method

.method private setCurrentShadowAngle(F)V
    .locals 0
    .param p1, "currentShadowAngle"    # F

    .line 351
    iput p1, p0, Lcom/google/android/material/shape/ShapePath;->currentShadowAngle:F

    .line 352
    return-void
.end method

.method private setEndShadowAngle(F)V
    .locals 0
    .param p1, "endShadowAngle"    # F

    .line 355
    iput p1, p0, Lcom/google/android/material/shape/ShapePath;->endShadowAngle:F

    .line 356
    return-void
.end method

.method private setEndX(F)V
    .locals 0
    .param p1, "endX"    # F

    .line 343
    iput p1, p0, Lcom/google/android/material/shape/ShapePath;->endX:F

    .line 344
    return-void
.end method

.method private setEndY(F)V
    .locals 0
    .param p1, "endY"    # F

    .line 347
    iput p1, p0, Lcom/google/android/material/shape/ShapePath;->endY:F

    .line 348
    return-void
.end method

.method private setStartX(F)V
    .locals 0
    .param p1, "startX"    # F

    .line 335
    iput p1, p0, Lcom/google/android/material/shape/ShapePath;->startX:F

    .line 336
    return-void
.end method

.method private setStartY(F)V
    .locals 0
    .param p1, "startY"    # F

    .line 339
    iput p1, p0, Lcom/google/android/material/shape/ShapePath;->startY:F

    .line 340
    return-void
.end method


# virtual methods
.method public addArc(FFFFFF)V
    .locals 16
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "right"    # F
    .param p4, "bottom"    # F
    .param p5, "startAngle"    # F
    .param p6, "sweepAngle"    # F

    .line 211
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    new-instance v7, Lcom/google/android/material/shape/ShapePath$PathArcOperation;

    invoke-direct {v7, v1, v2, v3, v4}, Lcom/google/android/material/shape/ShapePath$PathArcOperation;-><init>(FFFF)V

    .line 212
    .local v7, "operation":Lcom/google/android/material/shape/ShapePath$PathArcOperation;
    invoke-static {v7, v5}, Lcom/google/android/material/shape/ShapePath$PathArcOperation;->access$600(Lcom/google/android/material/shape/ShapePath$PathArcOperation;F)V

    .line 213
    invoke-static {v7, v6}, Lcom/google/android/material/shape/ShapePath$PathArcOperation;->access$700(Lcom/google/android/material/shape/ShapePath$PathArcOperation;F)V

    .line 214
    iget-object v8, v0, Lcom/google/android/material/shape/ShapePath;->operations:Ljava/util/List;

    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    new-instance v8, Lcom/google/android/material/shape/ShapePath$ArcShadowOperation;

    invoke-direct {v8, v7}, Lcom/google/android/material/shape/ShapePath$ArcShadowOperation;-><init>(Lcom/google/android/material/shape/ShapePath$PathArcOperation;)V

    .line 217
    .local v8, "arcShadowOperation":Lcom/google/android/material/shape/ShapePath$ArcShadowOperation;
    add-float v9, v5, v6

    .line 221
    .local v9, "endAngle":F
    const/4 v10, 0x0

    cmpg-float v10, v6, v10

    if-gez v10, :cond_0

    const/4 v10, 0x1

    goto :goto_0

    :cond_0
    const/4 v10, 0x0

    .line 222
    .local v10, "drawShadowInsideBounds":Z
    :goto_0
    const/high16 v11, 0x43b40000    # 360.0f

    const/high16 v12, 0x43340000    # 180.0f

    if-eqz v10, :cond_1

    add-float v13, v5, v12

    rem-float/2addr v13, v11

    goto :goto_1

    :cond_1
    move v13, v5

    :goto_1
    if-eqz v10, :cond_2

    add-float/2addr v12, v9

    rem-float/2addr v12, v11

    goto :goto_2

    :cond_2
    move v12, v9

    :goto_2
    invoke-direct {v0, v8, v13, v12}, Lcom/google/android/material/shape/ShapePath;->addShadowCompatOperation(Lcom/google/android/material/shape/ShapePath$ShadowCompatOperation;FF)V

    .line 227
    add-float v11, v1, v3

    const/high16 v12, 0x3f000000    # 0.5f

    mul-float v11, v11, v12

    sub-float v13, v3, v1

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v13, v14

    add-float v15, v5, v6

    float-to-double v14, v15

    .line 229
    invoke-static {v14, v15}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Math;->cos(D)D

    move-result-wide v14

    double-to-float v14, v14

    mul-float v13, v13, v14

    add-float/2addr v11, v13

    .line 227
    invoke-direct {v0, v11}, Lcom/google/android/material/shape/ShapePath;->setEndX(F)V

    .line 230
    add-float v11, v2, v4

    mul-float v11, v11, v12

    sub-float v12, v4, v2

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v12, v13

    add-float v13, v5, v6

    float-to-double v13, v13

    .line 232
    invoke-static {v13, v14}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v13

    double-to-float v13, v13

    mul-float v12, v12, v13

    add-float/2addr v11, v12

    .line 230
    invoke-direct {v0, v11}, Lcom/google/android/material/shape/ShapePath;->setEndY(F)V

    .line 233
    return-void
.end method

.method public applyToPath(Landroid/graphics/Matrix;Landroid/graphics/Path;)V
    .locals 3
    .param p1, "transform"    # Landroid/graphics/Matrix;
    .param p2, "path"    # Landroid/graphics/Path;

    .line 242
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v1, p0, Lcom/google/android/material/shape/ShapePath;->operations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "size":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 243
    iget-object v2, p0, Lcom/google/android/material/shape/ShapePath;->operations:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/shape/ShapePath$PathOperation;

    .line 244
    .local v2, "operation":Lcom/google/android/material/shape/ShapePath$PathOperation;
    invoke-virtual {v2, p1, p2}, Lcom/google/android/material/shape/ShapePath$PathOperation;->applyToPath(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 242
    .end local v2    # "operation":Lcom/google/android/material/shape/ShapePath$PathOperation;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 246
    .end local v0    # "i":I
    .end local v1    # "size":I
    :cond_0
    return-void
.end method

.method containsIncompatibleShadowOp()Z
    .locals 1

    .line 285
    iget-boolean v0, p0, Lcom/google/android/material/shape/ShapePath;->containsIncompatibleShadowOp:Z

    return v0
.end method

.method createShadowCompatOperation(Landroid/graphics/Matrix;)Lcom/google/android/material/shape/ShapePath$ShadowCompatOperation;
    .locals 3
    .param p1, "transform"    # Landroid/graphics/Matrix;

    .line 255
    invoke-direct {p0}, Lcom/google/android/material/shape/ShapePath;->getEndShadowAngle()F

    move-result v0

    invoke-direct {p0, v0}, Lcom/google/android/material/shape/ShapePath;->addConnectingShadowIfNecessary(F)V

    .line 256
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0, p1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 257
    .local v0, "transformCopy":Landroid/graphics/Matrix;
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/google/android/material/shape/ShapePath;->shadowCompatOperations:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 258
    .local v1, "operations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/material/shape/ShapePath$ShadowCompatOperation;>;"
    new-instance v2, Lcom/google/android/material/shape/ShapePath$1;

    invoke-direct {v2, p0, v1, v0}, Lcom/google/android/material/shape/ShapePath$1;-><init>(Lcom/google/android/material/shape/ShapePath;Ljava/util/List;Landroid/graphics/Matrix;)V

    return-object v2
.end method

.method public cubicToPoint(FFFFFF)V
    .locals 8
    .param p1, "controlX1"    # F
    .param p2, "controlY1"    # F
    .param p3, "controlX2"    # F
    .param p4, "controlY2"    # F
    .param p5, "toX"    # F
    .param p6, "toY"    # F

    .line 189
    new-instance v7, Lcom/google/android/material/shape/ShapePath$PathCubicOperation;

    move-object v0, v7

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/google/android/material/shape/ShapePath$PathCubicOperation;-><init>(FFFFFF)V

    .line 191
    .local v0, "operation":Lcom/google/android/material/shape/ShapePath$PathCubicOperation;
    iget-object v1, p0, Lcom/google/android/material/shape/ShapePath;->operations:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/material/shape/ShapePath;->containsIncompatibleShadowOp:Z

    .line 195
    invoke-direct {p0, p5}, Lcom/google/android/material/shape/ShapePath;->setEndX(F)V

    .line 196
    invoke-direct {p0, p6}, Lcom/google/android/material/shape/ShapePath;->setEndY(F)V

    .line 197
    return-void
.end method

.method getEndX()F
    .locals 1

    .line 319
    iget v0, p0, Lcom/google/android/material/shape/ShapePath;->endX:F

    return v0
.end method

.method getEndY()F
    .locals 1

    .line 323
    iget v0, p0, Lcom/google/android/material/shape/ShapePath;->endY:F

    return v0
.end method

.method getStartX()F
    .locals 1

    .line 311
    iget v0, p0, Lcom/google/android/material/shape/ShapePath;->startX:F

    return v0
.end method

.method getStartY()F
    .locals 1

    .line 315
    iget v0, p0, Lcom/google/android/material/shape/ShapePath;->startY:F

    return v0
.end method

.method public lineTo(FF)V
    .locals 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 130
    new-instance v0, Lcom/google/android/material/shape/ShapePath$PathLineOperation;

    invoke-direct {v0}, Lcom/google/android/material/shape/ShapePath$PathLineOperation;-><init>()V

    .line 131
    .local v0, "operation":Lcom/google/android/material/shape/ShapePath$PathLineOperation;
    invoke-static {v0, p1}, Lcom/google/android/material/shape/ShapePath$PathLineOperation;->access$002(Lcom/google/android/material/shape/ShapePath$PathLineOperation;F)F

    .line 132
    invoke-static {v0, p2}, Lcom/google/android/material/shape/ShapePath$PathLineOperation;->access$102(Lcom/google/android/material/shape/ShapePath$PathLineOperation;F)F

    .line 133
    iget-object v1, p0, Lcom/google/android/material/shape/ShapePath;->operations:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    new-instance v1, Lcom/google/android/material/shape/ShapePath$LineShadowOperation;

    invoke-virtual {p0}, Lcom/google/android/material/shape/ShapePath;->getEndX()F

    move-result v2

    invoke-virtual {p0}, Lcom/google/android/material/shape/ShapePath;->getEndY()F

    move-result v3

    invoke-direct {v1, v0, v2, v3}, Lcom/google/android/material/shape/ShapePath$LineShadowOperation;-><init>(Lcom/google/android/material/shape/ShapePath$PathLineOperation;FF)V

    .line 138
    .local v1, "shadowOperation":Lcom/google/android/material/shape/ShapePath$LineShadowOperation;
    nop

    .line 140
    invoke-virtual {v1}, Lcom/google/android/material/shape/ShapePath$LineShadowOperation;->getAngle()F

    move-result v2

    const/high16 v3, 0x43870000    # 270.0f

    add-float/2addr v2, v3

    .line 141
    invoke-virtual {v1}, Lcom/google/android/material/shape/ShapePath$LineShadowOperation;->getAngle()F

    move-result v4

    add-float/2addr v4, v3

    .line 138
    invoke-direct {p0, v1, v2, v4}, Lcom/google/android/material/shape/ShapePath;->addShadowCompatOperation(Lcom/google/android/material/shape/ShapePath$ShadowCompatOperation;FF)V

    .line 143
    invoke-direct {p0, p1}, Lcom/google/android/material/shape/ShapePath;->setEndX(F)V

    .line 144
    invoke-direct {p0, p2}, Lcom/google/android/material/shape/ShapePath;->setEndY(F)V

    .line 145
    return-void
.end method

.method public quadToPoint(FFFF)V
    .locals 2
    .param p1, "controlX"    # F
    .param p2, "controlY"    # F
    .param p3, "toX"    # F
    .param p4, "toY"    # F

    .line 160
    new-instance v0, Lcom/google/android/material/shape/ShapePath$PathQuadOperation;

    invoke-direct {v0}, Lcom/google/android/material/shape/ShapePath$PathQuadOperation;-><init>()V

    .line 161
    .local v0, "operation":Lcom/google/android/material/shape/ShapePath$PathQuadOperation;
    invoke-static {v0, p1}, Lcom/google/android/material/shape/ShapePath$PathQuadOperation;->access$200(Lcom/google/android/material/shape/ShapePath$PathQuadOperation;F)V

    .line 162
    invoke-static {v0, p2}, Lcom/google/android/material/shape/ShapePath$PathQuadOperation;->access$300(Lcom/google/android/material/shape/ShapePath$PathQuadOperation;F)V

    .line 163
    invoke-static {v0, p3}, Lcom/google/android/material/shape/ShapePath$PathQuadOperation;->access$400(Lcom/google/android/material/shape/ShapePath$PathQuadOperation;F)V

    .line 164
    invoke-static {v0, p4}, Lcom/google/android/material/shape/ShapePath$PathQuadOperation;->access$500(Lcom/google/android/material/shape/ShapePath$PathQuadOperation;F)V

    .line 165
    iget-object v1, p0, Lcom/google/android/material/shape/ShapePath;->operations:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/material/shape/ShapePath;->containsIncompatibleShadowOp:Z

    .line 169
    invoke-direct {p0, p3}, Lcom/google/android/material/shape/ShapePath;->setEndX(F)V

    .line 170
    invoke-direct {p0, p4}, Lcom/google/android/material/shape/ShapePath;->setEndY(F)V

    .line 171
    return-void
.end method

.method public reset(FF)V
    .locals 2
    .param p1, "startX"    # F
    .param p2, "startY"    # F

    .line 107
    const/high16 v0, 0x43870000    # 270.0f

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/google/android/material/shape/ShapePath;->reset(FFFF)V

    .line 108
    return-void
.end method

.method public reset(FFFF)V
    .locals 2
    .param p1, "startX"    # F
    .param p2, "startY"    # F
    .param p3, "shadowStartAngle"    # F
    .param p4, "shadowSweepAngle"    # F

    .line 112
    invoke-direct {p0, p1}, Lcom/google/android/material/shape/ShapePath;->setStartX(F)V

    .line 113
    invoke-direct {p0, p2}, Lcom/google/android/material/shape/ShapePath;->setStartY(F)V

    .line 114
    invoke-direct {p0, p1}, Lcom/google/android/material/shape/ShapePath;->setEndX(F)V

    .line 115
    invoke-direct {p0, p2}, Lcom/google/android/material/shape/ShapePath;->setEndY(F)V

    .line 116
    invoke-direct {p0, p3}, Lcom/google/android/material/shape/ShapePath;->setCurrentShadowAngle(F)V

    .line 117
    add-float v0, p3, p4

    const/high16 v1, 0x43b40000    # 360.0f

    rem-float/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/google/android/material/shape/ShapePath;->setEndShadowAngle(F)V

    .line 118
    iget-object v0, p0, Lcom/google/android/material/shape/ShapePath;->operations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 119
    iget-object v0, p0, Lcom/google/android/material/shape/ShapePath;->shadowCompatOperations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 120
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/material/shape/ShapePath;->containsIncompatibleShadowOp:Z

    .line 121
    return-void
.end method
