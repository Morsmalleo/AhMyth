.class Lcom/google/android/material/timepicker/ClockHandView;
.super Landroid/view/View;
.source "ClockHandView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/timepicker/ClockHandView$OnActionUpListener;,
        Lcom/google/android/material/timepicker/ClockHandView$OnRotateListener;
    }
.end annotation


# static fields
.field private static final ANIMATION_DURATION:I = 0xc8


# instance fields
.field private animatingOnTouchUp:Z

.field private final centerDotRadius:F

.field private changedDuringTouch:Z

.field private circleRadius:I

.field private degRad:D

.field private downX:F

.field private downY:F

.field private isInTapRegion:Z

.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/material/timepicker/ClockHandView$OnRotateListener;",
            ">;"
        }
    .end annotation
.end field

.field private onActionUpListener:Lcom/google/android/material/timepicker/ClockHandView$OnActionUpListener;

.field private originalDeg:F

.field private final paint:Landroid/graphics/Paint;

.field private rotationAnimator:Landroid/animation/ValueAnimator;

.field private scaledTouchSlop:I

.field private final selectorBox:Landroid/graphics/RectF;

.field private final selectorRadius:I

.field private final selectorStrokeWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 87
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/material/timepicker/ClockHandView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 88
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 91
    sget v0, Lcom/google/android/material/R$attr;->materialClockStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/timepicker/ClockHandView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 92
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 95
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/timepicker/ClockHandView;->listeners:Ljava/util/List;

    .line 71
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/timepicker/ClockHandView;->paint:Landroid/graphics/Paint;

    .line 74
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/timepicker/ClockHandView;->selectorBox:Landroid/graphics/RectF;

    .line 96
    sget-object v1, Lcom/google/android/material/R$styleable;->ClockHandView:[I

    sget v2, Lcom/google/android/material/R$style;->Widget_MaterialComponents_TimePicker_Clock:I

    .line 97
    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 103
    .local v1, "a":Landroid/content/res/TypedArray;
    sget v2, Lcom/google/android/material/R$styleable;->ClockHandView_materialCircleRadius:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/google/android/material/timepicker/ClockHandView;->circleRadius:I

    .line 104
    sget v2, Lcom/google/android/material/R$styleable;->ClockHandView_selectorSize:I

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/google/android/material/timepicker/ClockHandView;->selectorRadius:I

    .line 105
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/ClockHandView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 106
    .local v2, "res":Landroid/content/res/Resources;
    sget v4, Lcom/google/android/material/R$dimen;->material_clock_hand_stroke_width:I

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iput v4, p0, Lcom/google/android/material/timepicker/ClockHandView;->selectorStrokeWidth:I

    .line 107
    sget v4, Lcom/google/android/material/R$dimen;->material_clock_hand_center_dot_radius:I

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    int-to-float v4, v4

    iput v4, p0, Lcom/google/android/material/timepicker/ClockHandView;->centerDotRadius:F

    .line 108
    sget v4, Lcom/google/android/material/R$styleable;->ClockHandView_clockHandColor:I

    invoke-virtual {v1, v4, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    .line 109
    .local v3, "selectorColor":I
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 110
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 111
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/material/timepicker/ClockHandView;->setHandRotation(F)V

    .line 113
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    iput v0, p0, Lcom/google/android/material/timepicker/ClockHandView;->scaledTouchSlop:I

    .line 114
    const/4 v0, 0x2

    invoke-static {p0, v0}, Landroidx/core/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 115
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 116
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/material/timepicker/ClockHandView;FZ)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/material/timepicker/ClockHandView;
    .param p1, "x1"    # F
    .param p2, "x2"    # Z

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/timepicker/ClockHandView;->setHandRotationInternal(FZ)V

    return-void
.end method

.method private drawSelector(Landroid/graphics/Canvas;)V
    .locals 20
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 229
    move-object/from16 v0, p0

    move-object/from16 v7, p1

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/timepicker/ClockHandView;->getHeight()I

    move-result v1

    div-int/lit8 v8, v1, 0x2

    .line 230
    .local v8, "yCenter":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/timepicker/ClockHandView;->getWidth()I

    move-result v1

    div-int/lit8 v9, v1, 0x2

    .line 233
    .local v9, "xCenter":I
    int-to-float v1, v9

    iget v2, v0, Lcom/google/android/material/timepicker/ClockHandView;->circleRadius:I

    int-to-float v2, v2

    iget-wide v3, v0, Lcom/google/android/material/timepicker/ClockHandView;->degRad:D

    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float v2, v2, v3

    add-float v10, v1, v2

    .line 234
    .local v10, "selCenterX":F
    int-to-float v1, v8

    iget v2, v0, Lcom/google/android/material/timepicker/ClockHandView;->circleRadius:I

    int-to-float v2, v2

    iget-wide v3, v0, Lcom/google/android/material/timepicker/ClockHandView;->degRad:D

    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float v2, v2, v3

    add-float v11, v1, v2

    .line 237
    .local v11, "selCenterY":F
    iget-object v1, v0, Lcom/google/android/material/timepicker/ClockHandView;->paint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 238
    iget v1, v0, Lcom/google/android/material/timepicker/ClockHandView;->selectorRadius:I

    int-to-float v1, v1

    iget-object v2, v0, Lcom/google/android/material/timepicker/ClockHandView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v10, v11, v1, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 242
    iget-wide v1, v0, Lcom/google/android/material/timepicker/ClockHandView;->degRad:D

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    .line 243
    .local v12, "sin":D
    iget-wide v1, v0, Lcom/google/android/material/timepicker/ClockHandView;->degRad:D

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v14

    .line 244
    .local v14, "cos":D
    iget v1, v0, Lcom/google/android/material/timepicker/ClockHandView;->circleRadius:I

    iget v2, v0, Lcom/google/android/material/timepicker/ClockHandView;->selectorRadius:I

    sub-int/2addr v1, v2

    int-to-float v6, v1

    .line 245
    .local v6, "lineLength":F
    float-to-double v1, v6

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v1, v1, v14

    double-to-int v1, v1

    add-int/2addr v1, v9

    int-to-float v5, v1

    .line 246
    .local v5, "linePointX":F
    float-to-double v1, v6

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v1, v1, v12

    double-to-int v1, v1

    add-int/2addr v1, v8

    int-to-float v4, v1

    .line 249
    .local v4, "linePointY":F
    iget-object v1, v0, Lcom/google/android/material/timepicker/ClockHandView;->paint:Landroid/graphics/Paint;

    iget v2, v0, Lcom/google/android/material/timepicker/ClockHandView;->selectorStrokeWidth:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 250
    int-to-float v2, v9

    int-to-float v3, v8

    iget-object v1, v0, Lcom/google/android/material/timepicker/ClockHandView;->paint:Landroid/graphics/Paint;

    move-object/from16 v16, v1

    move-object/from16 v1, p1

    move/from16 v17, v4

    .end local v4    # "linePointY":F
    .local v17, "linePointY":F
    move v4, v5

    move/from16 v18, v5

    .end local v5    # "linePointX":F
    .local v18, "linePointX":F
    move/from16 v5, v17

    move/from16 v19, v6

    .end local v6    # "lineLength":F
    .local v19, "lineLength":F
    move-object/from16 v6, v16

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 251
    int-to-float v1, v9

    int-to-float v2, v8

    iget v3, v0, Lcom/google/android/material/timepicker/ClockHandView;->centerDotRadius:F

    iget-object v4, v0, Lcom/google/android/material/timepicker/ClockHandView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 252
    return-void
.end method

.method private getDegreesFromXY(FF)I
    .locals 8
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 334
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/ClockHandView;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    .line 335
    .local v0, "xCenter":I
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/ClockHandView;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    .line 336
    .local v1, "yCenter":I
    int-to-float v2, v0

    sub-float v2, p1, v2

    float-to-double v2, v2

    .line 337
    .local v2, "dX":D
    int-to-float v4, v1

    sub-float v4, p2, v4

    float-to-double v4, v4

    .line 338
    .local v4, "dY":D
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v6

    double-to-int v6, v6

    add-int/lit8 v6, v6, 0x5a

    .line 339
    .local v6, "degrees":I
    if-gez v6, :cond_0

    .line 340
    add-int/lit16 v6, v6, 0x168

    .line 342
    :cond_0
    return v6
.end method

.method private getValuesForAnimation(F)Landroid/util/Pair;
    .locals 4
    .param p1, "degrees"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Landroid/util/Pair<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 161
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/ClockHandView;->getHandRotation()F

    move-result v0

    .line 166
    .local v0, "currentDegrees":F
    sub-float v1, v0, p1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v2, 0x43340000    # 180.0f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_1

    .line 167
    const/high16 v1, 0x43b40000    # 360.0f

    cmpl-float v3, v0, v2

    if-lez v3, :cond_0

    cmpg-float v3, p1, v2

    if-gez v3, :cond_0

    .line 168
    add-float/2addr p1, v1

    .line 171
    :cond_0
    cmpg-float v3, v0, v2

    if-gez v3, :cond_1

    cmpl-float v2, p1, v2

    if-lez v2, :cond_1

    .line 172
    add-float/2addr v0, v1

    .line 176
    :cond_1
    new-instance v1, Landroid/util/Pair;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1
.end method

.method private handleTouchInput(FFZZZ)Z
    .locals 6
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "forceSelection"    # Z
    .param p4, "touchDown"    # Z
    .param p5, "actionUp"    # Z

    .line 319
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/timepicker/ClockHandView;->getDegreesFromXY(FF)I

    move-result v0

    .line 320
    .local v0, "degrees":I
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/ClockHandView;->getHandRotation()F

    move-result v1

    int-to-float v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x1

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 321
    .local v1, "valueChanged":Z
    :goto_0
    if-eqz p4, :cond_1

    if-eqz v1, :cond_1

    .line 322
    return v4

    .line 325
    :cond_1
    if-nez v1, :cond_3

    if-eqz p3, :cond_2

    goto :goto_1

    .line 330
    :cond_2
    return v3

    .line 326
    :cond_3
    :goto_1
    int-to-float v2, v0

    if-eqz p5, :cond_4

    iget-boolean v5, p0, Lcom/google/android/material/timepicker/ClockHandView;->animatingOnTouchUp:Z

    if-eqz v5, :cond_4

    const/4 v3, 0x1

    :cond_4
    invoke-virtual {p0, v2, v3}, Lcom/google/android/material/timepicker/ClockHandView;->setHandRotation(FZ)V

    .line 327
    return v4
.end method

.method private setHandRotationInternal(FZ)V
    .locals 10
    .param p1, "degrees"    # F
    .param p2, "animate"    # Z

    .line 181
    const/high16 v0, 0x43b40000    # 360.0f

    rem-float/2addr p1, v0

    .line 182
    iput p1, p0, Lcom/google/android/material/timepicker/ClockHandView;->originalDeg:F

    .line 184
    const/high16 v0, 0x42b40000    # 90.0f

    sub-float v0, p1, v0

    .line 186
    .local v0, "angDeg":F
    float-to-double v1, v0

    invoke-static {v1, v2}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/material/timepicker/ClockHandView;->degRad:D

    .line 187
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/ClockHandView;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    .line 188
    .local v1, "yCenter":I
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/ClockHandView;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    .line 189
    .local v2, "xCenter":I
    int-to-float v3, v2

    iget v4, p0, Lcom/google/android/material/timepicker/ClockHandView;->circleRadius:I

    int-to-float v4, v4

    iget-wide v5, p0, Lcom/google/android/material/timepicker/ClockHandView;->degRad:D

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    .line 190
    .local v3, "selCenterX":F
    int-to-float v4, v1

    iget v5, p0, Lcom/google/android/material/timepicker/ClockHandView;->circleRadius:I

    int-to-float v5, v5

    iget-wide v6, p0, Lcom/google/android/material/timepicker/ClockHandView;->degRad:D

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    double-to-float v6, v6

    mul-float v5, v5, v6

    add-float/2addr v4, v5

    .line 191
    .local v4, "selCenterY":F
    iget-object v5, p0, Lcom/google/android/material/timepicker/ClockHandView;->selectorBox:Landroid/graphics/RectF;

    iget v6, p0, Lcom/google/android/material/timepicker/ClockHandView;->selectorRadius:I

    int-to-float v7, v6

    sub-float v7, v3, v7

    int-to-float v8, v6

    sub-float v8, v4, v8

    int-to-float v9, v6

    add-float/2addr v9, v3

    int-to-float v6, v6

    add-float/2addr v6, v4

    invoke-virtual {v5, v7, v8, v9, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 197
    iget-object v5, p0, Lcom/google/android/material/timepicker/ClockHandView;->listeners:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/material/timepicker/ClockHandView$OnRotateListener;

    .line 198
    .local v6, "listener":Lcom/google/android/material/timepicker/ClockHandView$OnRotateListener;
    invoke-interface {v6, p1, p2}, Lcom/google/android/material/timepicker/ClockHandView$OnRotateListener;->onRotate(FZ)V

    .line 199
    .end local v6    # "listener":Lcom/google/android/material/timepicker/ClockHandView$OnRotateListener;
    goto :goto_0

    .line 201
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/ClockHandView;->invalidate()V

    .line 202
    return-void
.end method


# virtual methods
.method public addOnRotateListener(Lcom/google/android/material/timepicker/ClockHandView$OnRotateListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/material/timepicker/ClockHandView$OnRotateListener;

    .line 209
    iget-object v0, p0, Lcom/google/android/material/timepicker/ClockHandView;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    return-void
.end method

.method public getCurrentSelectorBox()Landroid/graphics/RectF;
    .locals 1

    .line 256
    iget-object v0, p0, Lcom/google/android/material/timepicker/ClockHandView;->selectorBox:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getHandRotation()F
    .locals 1

    .line 218
    iget v0, p0, Lcom/google/android/material/timepicker/ClockHandView;->originalDeg:F

    return v0
.end method

.method public getSelectorRadius()I
    .locals 1

    .line 261
    iget v0, p0, Lcom/google/android/material/timepicker/ClockHandView;->selectorRadius:I

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 223
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 225
    invoke-direct {p0, p1}, Lcom/google/android/material/timepicker/ClockHandView;->drawSelector(Landroid/graphics/Canvas;)V

    .line 226
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 1
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .line 120
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 122
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/ClockHandView;->getHandRotation()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/material/timepicker/ClockHandView;->setHandRotation(F)V

    .line 123
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 14
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 276
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 277
    .local v0, "action":I
    const/4 v1, 0x0

    .line 278
    .local v1, "forceSelection":Z
    const/4 v2, 0x0

    .line 279
    .local v2, "actionDown":Z
    const/4 v3, 0x0

    .line 280
    .local v3, "actionUp":Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v10

    .line 281
    .local v10, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    .line 282
    .local v11, "y":F
    const/4 v4, 0x0

    const/4 v12, 0x1

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    .line 293
    :pswitch_0
    iget v5, p0, Lcom/google/android/material/timepicker/ClockHandView;->downX:F

    sub-float v5, v10, v5

    float-to-int v5, v5

    .line 294
    .local v5, "deltaX":I
    iget v6, p0, Lcom/google/android/material/timepicker/ClockHandView;->downY:F

    sub-float v6, v11, v6

    float-to-int v6, v6

    .line 295
    .local v6, "deltaY":I
    mul-int v7, v5, v5

    mul-int v8, v6, v6

    add-int/2addr v7, v8

    .line 296
    .local v7, "distance":I
    iget v8, p0, Lcom/google/android/material/timepicker/ClockHandView;->scaledTouchSlop:I

    if-le v7, v8, :cond_0

    const/4 v8, 0x1

    goto :goto_0

    :cond_0
    const/4 v8, 0x0

    :goto_0
    iput-boolean v8, p0, Lcom/google/android/material/timepicker/ClockHandView;->isInTapRegion:Z

    .line 299
    iget-boolean v8, p0, Lcom/google/android/material/timepicker/ClockHandView;->changedDuringTouch:Z

    if-eqz v8, :cond_1

    .line 300
    const/4 v1, 0x1

    .line 303
    :cond_1
    if-ne v0, v12, :cond_2

    const/4 v4, 0x1

    :cond_2
    move v3, v4

    .line 304
    goto :goto_1

    .line 284
    .end local v5    # "deltaX":I
    .end local v6    # "deltaY":I
    .end local v7    # "distance":I
    :pswitch_1
    iput v10, p0, Lcom/google/android/material/timepicker/ClockHandView;->downX:F

    .line 285
    iput v11, p0, Lcom/google/android/material/timepicker/ClockHandView;->downY:F

    .line 286
    iput-boolean v12, p0, Lcom/google/android/material/timepicker/ClockHandView;->isInTapRegion:Z

    .line 288
    iput-boolean v4, p0, Lcom/google/android/material/timepicker/ClockHandView;->changedDuringTouch:Z

    .line 289
    const/4 v2, 0x1

    .line 290
    nop

    .line 309
    :goto_1
    iget-boolean v13, p0, Lcom/google/android/material/timepicker/ClockHandView;->changedDuringTouch:Z

    move-object v4, p0

    move v5, v10

    move v6, v11

    move v7, v1

    move v8, v2

    move v9, v3

    invoke-direct/range {v4 .. v9}, Lcom/google/android/material/timepicker/ClockHandView;->handleTouchInput(FFZZZ)Z

    move-result v4

    or-int/2addr v4, v13

    iput-boolean v4, p0, Lcom/google/android/material/timepicker/ClockHandView;->changedDuringTouch:Z

    .line 310
    if-eqz v4, :cond_3

    if-eqz v3, :cond_3

    iget-object v4, p0, Lcom/google/android/material/timepicker/ClockHandView;->onActionUpListener:Lcom/google/android/material/timepicker/ClockHandView$OnActionUpListener;

    if-eqz v4, :cond_3

    .line 311
    invoke-direct {p0, v10, v11}, Lcom/google/android/material/timepicker/ClockHandView;->getDegreesFromXY(FF)I

    move-result v5

    int-to-float v5, v5

    iget-boolean v6, p0, Lcom/google/android/material/timepicker/ClockHandView;->isInTapRegion:Z

    invoke-interface {v4, v5, v6}, Lcom/google/android/material/timepicker/ClockHandView$OnActionUpListener;->onActionUp(FZ)V

    .line 314
    :cond_3
    return v12

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public setAnimateOnTouchUp(Z)V
    .locals 0
    .param p1, "animating"    # Z

    .line 205
    iput-boolean p1, p0, Lcom/google/android/material/timepicker/ClockHandView;->animatingOnTouchUp:Z

    .line 206
    return-void
.end method

.method public setCircleRadius(I)V
    .locals 0
    .param p1, "circleRadius"    # I

    .line 269
    iput p1, p0, Lcom/google/android/material/timepicker/ClockHandView;->circleRadius:I

    .line 270
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/ClockHandView;->invalidate()V

    .line 271
    return-void
.end method

.method public setHandRotation(F)V
    .locals 1
    .param p1, "degrees"    # F

    .line 126
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/timepicker/ClockHandView;->setHandRotation(FZ)V

    .line 127
    return-void
.end method

.method public setHandRotation(FZ)V
    .locals 4
    .param p1, "degrees"    # F
    .param p2, "animate"    # Z

    .line 130
    iget-object v0, p0, Lcom/google/android/material/timepicker/ClockHandView;->rotationAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 131
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 134
    :cond_0
    const/4 v0, 0x0

    if-nez p2, :cond_1

    .line 135
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/timepicker/ClockHandView;->setHandRotationInternal(FZ)V

    .line 136
    return-void

    .line 139
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/android/material/timepicker/ClockHandView;->getValuesForAnimation(F)Landroid/util/Pair;

    move-result-object v1

    .line 140
    .local v1, "animationValues":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Float;Ljava/lang/Float;>;"
    const/4 v2, 0x2

    new-array v2, v2, [F

    iget-object v3, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    aput v3, v2, v0

    const/4 v0, 0x1

    iget-object v3, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    aput v3, v2, v0

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/timepicker/ClockHandView;->rotationAnimator:Landroid/animation/ValueAnimator;

    .line 141
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 142
    iget-object v0, p0, Lcom/google/android/material/timepicker/ClockHandView;->rotationAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/google/android/material/timepicker/ClockHandView$1;

    invoke-direct {v2, p0}, Lcom/google/android/material/timepicker/ClockHandView$1;-><init>(Lcom/google/android/material/timepicker/ClockHandView;)V

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 150
    iget-object v0, p0, Lcom/google/android/material/timepicker/ClockHandView;->rotationAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/google/android/material/timepicker/ClockHandView$2;

    invoke-direct {v2, p0}, Lcom/google/android/material/timepicker/ClockHandView$2;-><init>(Lcom/google/android/material/timepicker/ClockHandView;)V

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 157
    iget-object v0, p0, Lcom/google/android/material/timepicker/ClockHandView;->rotationAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 158
    return-void
.end method

.method public setOnActionUpListener(Lcom/google/android/material/timepicker/ClockHandView$OnActionUpListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/google/android/material/timepicker/ClockHandView$OnActionUpListener;

    .line 213
    iput-object p1, p0, Lcom/google/android/material/timepicker/ClockHandView;->onActionUpListener:Lcom/google/android/material/timepicker/ClockHandView$OnActionUpListener;

    .line 214
    return-void
.end method
