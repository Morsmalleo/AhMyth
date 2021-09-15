.class public Landroidx/constraintlayout/core/state/Transition;
.super Ljava/lang/Object;
.source "Transition.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/core/state/Transition$KeyPosition;,
        Landroidx/constraintlayout/core/state/Transition$WidgetState;
    }
.end annotation


# static fields
.field public static final END:I = 0x1

.field public static final INTERPOLATED:I = 0x2

.field public static final START:I


# instance fields
.field keyPositions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroidx/constraintlayout/core/state/Transition$KeyPosition;",
            ">;>;"
        }
    .end annotation
.end field

.field private pathMotionArc:I

.field state:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroidx/constraintlayout/core/state/Transition$WidgetState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->state:Ljava/util/HashMap;

    .line 35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->keyPositions:Ljava/util/HashMap;

    .line 41
    const/4 v0, -0x1

    iput v0, p0, Landroidx/constraintlayout/core/state/Transition;->pathMotionArc:I

    return-void
.end method

.method private getWidgetState(Ljava/lang/String;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Landroidx/constraintlayout/core/state/Transition$WidgetState;
    .locals 3
    .param p1, "widgetId"    # Ljava/lang/String;
    .param p2, "child"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .param p3, "transitionState"    # I

    .line 316
    iget-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->state:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;

    .line 317
    .local v0, "widgetState":Landroidx/constraintlayout/core/state/Transition$WidgetState;
    if-nez v0, :cond_1

    .line 318
    new-instance v1, Landroidx/constraintlayout/core/state/Transition$WidgetState;

    invoke-direct {v1}, Landroidx/constraintlayout/core/state/Transition$WidgetState;-><init>()V

    move-object v0, v1

    .line 319
    iget v1, p0, Landroidx/constraintlayout/core/state/Transition;->pathMotionArc:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 320
    iget-object v1, v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;->motionControl:Landroidx/constraintlayout/core/motion/Motion;

    iget v2, p0, Landroidx/constraintlayout/core/state/Transition;->pathMotionArc:I

    invoke-virtual {v1, v2}, Landroidx/constraintlayout/core/motion/Motion;->setPathMotionArc(I)V

    .line 322
    :cond_0
    iget-object v1, p0, Landroidx/constraintlayout/core/state/Transition;->state:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    if-eqz p2, :cond_1

    .line 324
    invoke-virtual {v0, p2, p3}, Landroidx/constraintlayout/core/state/Transition$WidgetState;->update(Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)V

    .line 327
    :cond_1
    return-object v0
.end method


# virtual methods
.method public addCustomColor(ILjava/lang/String;Ljava/lang/String;I)V
    .locals 2
    .param p1, "state"    # I
    .param p2, "widgetId"    # Ljava/lang/String;
    .param p3, "property"    # Ljava/lang/String;
    .param p4, "color"    # I

    .line 255
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0, p1}, Landroidx/constraintlayout/core/state/Transition;->getWidgetState(Ljava/lang/String;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Landroidx/constraintlayout/core/state/Transition$WidgetState;

    move-result-object v0

    .line 256
    .local v0, "widgetState":Landroidx/constraintlayout/core/state/Transition$WidgetState;
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/core/state/Transition$WidgetState;->getFrame(I)Landroidx/constraintlayout/core/state/WidgetFrame;

    move-result-object v1

    .line 257
    .local v1, "frame":Landroidx/constraintlayout/core/state/WidgetFrame;
    invoke-virtual {v1, p3, p4}, Landroidx/constraintlayout/core/state/WidgetFrame;->addCustomColor(Ljava/lang/String;I)V

    .line 258
    return-void
.end method

.method public addCustomFloat(ILjava/lang/String;Ljava/lang/String;F)V
    .locals 2
    .param p1, "state"    # I
    .param p2, "widgetId"    # Ljava/lang/String;
    .param p3, "property"    # Ljava/lang/String;
    .param p4, "value"    # F

    .line 249
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0, p1}, Landroidx/constraintlayout/core/state/Transition;->getWidgetState(Ljava/lang/String;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Landroidx/constraintlayout/core/state/Transition$WidgetState;

    move-result-object v0

    .line 250
    .local v0, "widgetState":Landroidx/constraintlayout/core/state/Transition$WidgetState;
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/core/state/Transition$WidgetState;->getFrame(I)Landroidx/constraintlayout/core/state/WidgetFrame;

    move-result-object v1

    .line 251
    .local v1, "frame":Landroidx/constraintlayout/core/state/WidgetFrame;
    invoke-virtual {v1, p3, p4}, Landroidx/constraintlayout/core/state/WidgetFrame;->addCustomFloat(Ljava/lang/String;F)V

    .line 252
    return-void
.end method

.method public addKeyAttribute(Ljava/lang/String;Landroidx/constraintlayout/core/motion/utils/TypedBundle;)V
    .locals 2
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "bundle"    # Landroidx/constraintlayout/core/motion/utils/TypedBundle;

    .line 224
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Landroidx/constraintlayout/core/state/Transition;->getWidgetState(Ljava/lang/String;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Landroidx/constraintlayout/core/state/Transition$WidgetState;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroidx/constraintlayout/core/state/Transition$WidgetState;->setKeyAttribute(Landroidx/constraintlayout/core/motion/utils/TypedBundle;)V

    .line 225
    return-void
.end method

.method public addKeyCycle(Ljava/lang/String;Landroidx/constraintlayout/core/motion/utils/TypedBundle;)V
    .locals 2
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "bundle"    # Landroidx/constraintlayout/core/motion/utils/TypedBundle;

    .line 228
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Landroidx/constraintlayout/core/state/Transition;->getWidgetState(Ljava/lang/String;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Landroidx/constraintlayout/core/state/Transition$WidgetState;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroidx/constraintlayout/core/state/Transition$WidgetState;->setKeyCycle(Landroidx/constraintlayout/core/motion/utils/TypedBundle;)V

    .line 229
    return-void
.end method

.method public addKeyPosition(Ljava/lang/String;IIFF)V
    .locals 8
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "frame"    # I
    .param p3, "type"    # I
    .param p4, "x"    # F
    .param p5, "y"    # F

    .line 232
    new-instance v0, Landroidx/constraintlayout/core/motion/utils/TypedBundle;

    invoke-direct {v0}, Landroidx/constraintlayout/core/motion/utils/TypedBundle;-><init>()V

    .line 233
    .local v0, "bundle":Landroidx/constraintlayout/core/motion/utils/TypedBundle;
    const/16 v1, 0x1fe

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroidx/constraintlayout/core/motion/utils/TypedBundle;->add(II)V

    .line 234
    const/16 v1, 0x64

    invoke-virtual {v0, v1, p2}, Landroidx/constraintlayout/core/motion/utils/TypedBundle;->add(II)V

    .line 235
    const/16 v1, 0x1fa

    invoke-virtual {v0, v1, p4}, Landroidx/constraintlayout/core/motion/utils/TypedBundle;->add(IF)V

    .line 236
    const/16 v1, 0x1fb

    invoke-virtual {v0, v1, p5}, Landroidx/constraintlayout/core/motion/utils/TypedBundle;->add(IF)V

    .line 237
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, p1, v1, v2}, Landroidx/constraintlayout/core/state/Transition;->getWidgetState(Ljava/lang/String;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Landroidx/constraintlayout/core/state/Transition$WidgetState;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/constraintlayout/core/state/Transition$WidgetState;->setKeyPosition(Landroidx/constraintlayout/core/motion/utils/TypedBundle;)V

    .line 239
    new-instance v1, Landroidx/constraintlayout/core/state/Transition$KeyPosition;

    move-object v2, v1

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-direct/range {v2 .. v7}, Landroidx/constraintlayout/core/state/Transition$KeyPosition;-><init>(Ljava/lang/String;IIFF)V

    .line 240
    .local v1, "keyPosition":Landroidx/constraintlayout/core/state/Transition$KeyPosition;
    iget-object v2, p0, Landroidx/constraintlayout/core/state/Transition;->keyPositions:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 241
    .local v2, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroidx/constraintlayout/core/state/Transition$KeyPosition;>;"
    if-nez v2, :cond_0

    .line 242
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    move-object v2, v3

    .line 243
    iget-object v3, p0, Landroidx/constraintlayout/core/state/Transition;->keyPositions:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    :cond_0
    invoke-virtual {v2, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    return-void
.end method

.method public addKeyPosition(Ljava/lang/String;Landroidx/constraintlayout/core/motion/utils/TypedBundle;)V
    .locals 2
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "bundle"    # Landroidx/constraintlayout/core/motion/utils/TypedBundle;

    .line 220
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Landroidx/constraintlayout/core/state/Transition;->getWidgetState(Ljava/lang/String;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Landroidx/constraintlayout/core/state/Transition$WidgetState;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroidx/constraintlayout/core/state/Transition$WidgetState;->setKeyPosition(Landroidx/constraintlayout/core/motion/utils/TypedBundle;)V

    .line 221
    return-void
.end method

.method public clear()V
    .locals 1

    .line 212
    iget-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->state:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 213
    return-void
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 216
    iget-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->state:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public fillKeyPositions(Landroidx/constraintlayout/core/state/WidgetFrame;[F[F[F)V
    .locals 5
    .param p1, "frame"    # Landroidx/constraintlayout/core/state/WidgetFrame;
    .param p2, "x"    # [F
    .param p3, "y"    # [F
    .param p4, "pos"    # [F

    .line 92
    const/4 v0, 0x0

    .line 93
    .local v0, "numKeyPositions":I
    const/4 v1, 0x0

    .line 94
    .local v1, "frameNumber":I
    :goto_0
    const/16 v2, 0x64

    if-gt v1, v2, :cond_1

    .line 95
    iget-object v2, p0, Landroidx/constraintlayout/core/state/Transition;->keyPositions:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 96
    .local v2, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroidx/constraintlayout/core/state/Transition$KeyPosition;>;"
    if-eqz v2, :cond_0

    .line 97
    iget-object v3, p1, Landroidx/constraintlayout/core/state/WidgetFrame;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->stringId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/core/state/Transition$KeyPosition;

    .line 98
    .local v3, "keyPosition":Landroidx/constraintlayout/core/state/Transition$KeyPosition;
    if-eqz v3, :cond_0

    .line 99
    iget v4, v3, Landroidx/constraintlayout/core/state/Transition$KeyPosition;->x:F

    aput v4, p2, v0

    .line 100
    iget v4, v3, Landroidx/constraintlayout/core/state/Transition$KeyPosition;->y:F

    aput v4, p3, v0

    .line 101
    iget v4, v3, Landroidx/constraintlayout/core/state/Transition$KeyPosition;->frame:I

    int-to-float v4, v4

    aput v4, p4, v0

    .line 102
    add-int/lit8 v0, v0, 0x1

    .line 105
    .end local v3    # "keyPosition":Landroidx/constraintlayout/core/state/Transition$KeyPosition;
    :cond_0
    nop

    .end local v2    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroidx/constraintlayout/core/state/Transition$KeyPosition;>;"
    add-int/lit8 v1, v1, 0x1

    .line 106
    goto :goto_0

    .line 107
    :cond_1
    return-void
.end method

.method public findNextPosition(Ljava/lang/String;I)Landroidx/constraintlayout/core/state/Transition$KeyPosition;
    .locals 2
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "frameNumber"    # I

    .line 58
    :goto_0
    const/16 v0, 0x64

    if-gt p2, v0, :cond_1

    .line 59
    iget-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->keyPositions:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 60
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroidx/constraintlayout/core/state/Transition$KeyPosition;>;"
    if-eqz v0, :cond_0

    .line 61
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/core/state/Transition$KeyPosition;

    .line 62
    .local v1, "keyPosition":Landroidx/constraintlayout/core/state/Transition$KeyPosition;
    if-eqz v1, :cond_0

    .line 63
    return-object v1

    .line 66
    .end local v1    # "keyPosition":Landroidx/constraintlayout/core/state/Transition$KeyPosition;
    :cond_0
    nop

    .end local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroidx/constraintlayout/core/state/Transition$KeyPosition;>;"
    add-int/lit8 p2, p2, 0x1

    .line 67
    goto :goto_0

    .line 68
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public findPreviousPosition(Ljava/lang/String;I)Landroidx/constraintlayout/core/state/Transition$KeyPosition;
    .locals 2
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "frameNumber"    # I

    .line 44
    :goto_0
    if-ltz p2, :cond_1

    .line 45
    iget-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->keyPositions:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 46
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroidx/constraintlayout/core/state/Transition$KeyPosition;>;"
    if-eqz v0, :cond_0

    .line 47
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/core/state/Transition$KeyPosition;

    .line 48
    .local v1, "keyPosition":Landroidx/constraintlayout/core/state/Transition$KeyPosition;
    if-eqz v1, :cond_0

    .line 49
    return-object v1

    .line 52
    .end local v1    # "keyPosition":Landroidx/constraintlayout/core/state/Transition$KeyPosition;
    :cond_0
    nop

    .end local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroidx/constraintlayout/core/state/Transition$KeyPosition;>;"
    add-int/lit8 p2, p2, -0x1

    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getEnd(Landroidx/constraintlayout/core/widgets/ConstraintWidget;)Landroidx/constraintlayout/core/state/WidgetFrame;
    .locals 3
    .param p1, "child"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 347
    iget-object v0, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->stringId:Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Landroidx/constraintlayout/core/state/Transition;->getWidgetState(Ljava/lang/String;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Landroidx/constraintlayout/core/state/Transition$WidgetState;

    move-result-object v0

    iget-object v0, v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;->end:Landroidx/constraintlayout/core/state/WidgetFrame;

    return-object v0
.end method

.method public getEnd(Ljava/lang/String;)Landroidx/constraintlayout/core/state/WidgetFrame;
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .line 286
    iget-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->state:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;

    .line 287
    .local v0, "widgetState":Landroidx/constraintlayout/core/state/Transition$WidgetState;
    if-nez v0, :cond_0

    .line 288
    const/4 v1, 0x0

    return-object v1

    .line 290
    :cond_0
    iget-object v1, v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;->end:Landroidx/constraintlayout/core/state/WidgetFrame;

    return-object v1
.end method

.method public getInterpolated(Landroidx/constraintlayout/core/widgets/ConstraintWidget;)Landroidx/constraintlayout/core/state/WidgetFrame;
    .locals 3
    .param p1, "child"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 357
    iget-object v0, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->stringId:Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {p0, v0, v1, v2}, Landroidx/constraintlayout/core/state/Transition;->getWidgetState(Ljava/lang/String;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Landroidx/constraintlayout/core/state/Transition$WidgetState;

    move-result-object v0

    iget-object v0, v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;->interpolated:Landroidx/constraintlayout/core/state/WidgetFrame;

    return-object v0
.end method

.method public getInterpolated(Ljava/lang/String;)Landroidx/constraintlayout/core/state/WidgetFrame;
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .line 294
    iget-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->state:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;

    .line 295
    .local v0, "widgetState":Landroidx/constraintlayout/core/state/Transition$WidgetState;
    if-nez v0, :cond_0

    .line 296
    const/4 v1, 0x0

    return-object v1

    .line 298
    :cond_0
    iget-object v1, v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;->interpolated:Landroidx/constraintlayout/core/state/WidgetFrame;

    return-object v1
.end method

.method public getKeyFrames(Ljava/lang/String;[F[I[I)I
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "rectangles"    # [F
    .param p3, "pathMode"    # [I
    .param p4, "position"    # [I

    .line 311
    iget-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->state:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;

    .line 312
    .local v0, "widgetState":Landroidx/constraintlayout/core/state/Transition$WidgetState;
    iget-object v1, v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;->motionControl:Landroidx/constraintlayout/core/motion/Motion;

    invoke-virtual {v1, p2, p3, p4}, Landroidx/constraintlayout/core/motion/Motion;->buildKeyFrames([F[I[I)I

    move-result v1

    return v1
.end method

.method public getMotion(Ljava/lang/String;)Landroidx/constraintlayout/core/motion/Motion;
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .line 88
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Landroidx/constraintlayout/core/state/Transition;->getWidgetState(Ljava/lang/String;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Landroidx/constraintlayout/core/state/Transition$WidgetState;

    move-result-object v0

    iget-object v0, v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;->motionControl:Landroidx/constraintlayout/core/motion/Motion;

    return-object v0
.end method

.method public getNumberKeyPositions(Landroidx/constraintlayout/core/state/WidgetFrame;)I
    .locals 4
    .param p1, "frame"    # Landroidx/constraintlayout/core/state/WidgetFrame;

    .line 72
    const/4 v0, 0x0

    .line 73
    .local v0, "numKeyPositions":I
    const/4 v1, 0x0

    .line 74
    .local v1, "frameNumber":I
    :goto_0
    const/16 v2, 0x64

    if-gt v1, v2, :cond_1

    .line 75
    iget-object v2, p0, Landroidx/constraintlayout/core/state/Transition;->keyPositions:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 76
    .local v2, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroidx/constraintlayout/core/state/Transition$KeyPosition;>;"
    if-eqz v2, :cond_0

    .line 77
    iget-object v3, p1, Landroidx/constraintlayout/core/state/WidgetFrame;->widget:Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    iget-object v3, v3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->stringId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/core/state/Transition$KeyPosition;

    .line 78
    .local v3, "keyPosition":Landroidx/constraintlayout/core/state/Transition$KeyPosition;
    if-eqz v3, :cond_0

    .line 79
    add-int/lit8 v0, v0, 0x1

    .line 82
    .end local v3    # "keyPosition":Landroidx/constraintlayout/core/state/Transition$KeyPosition;
    :cond_0
    nop

    .end local v2    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Landroidx/constraintlayout/core/state/Transition$KeyPosition;>;"
    add-int/lit8 v1, v1, 0x1

    .line 83
    goto :goto_0

    .line 84
    :cond_1
    return v0
.end method

.method public getPath(Ljava/lang/String;)[F
    .locals 5
    .param p1, "id"    # Ljava/lang/String;

    .line 302
    iget-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->state:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;

    .line 303
    .local v0, "widgetState":Landroidx/constraintlayout/core/state/Transition$WidgetState;
    const/16 v1, 0x3e8

    .line 304
    .local v1, "duration":I
    div-int/lit8 v2, v1, 0x10

    .line 305
    .local v2, "frames":I
    mul-int/lit8 v3, v2, 0x2

    new-array v3, v3, [F

    .line 306
    .local v3, "mPoints":[F
    iget-object v4, v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;->motionControl:Landroidx/constraintlayout/core/motion/Motion;

    invoke-virtual {v4, v3, v2}, Landroidx/constraintlayout/core/motion/Motion;->buildPath([FI)V

    .line 307
    return-object v3
.end method

.method public getStart(Landroidx/constraintlayout/core/widgets/ConstraintWidget;)Landroidx/constraintlayout/core/state/WidgetFrame;
    .locals 3
    .param p1, "child"    # Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 337
    iget-object v0, p1, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->stringId:Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Landroidx/constraintlayout/core/state/Transition;->getWidgetState(Ljava/lang/String;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Landroidx/constraintlayout/core/state/Transition$WidgetState;

    move-result-object v0

    iget-object v0, v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;->start:Landroidx/constraintlayout/core/state/WidgetFrame;

    return-object v0
.end method

.method public getStart(Ljava/lang/String;)Landroidx/constraintlayout/core/state/WidgetFrame;
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .line 278
    iget-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->state:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;

    .line 279
    .local v0, "widgetState":Landroidx/constraintlayout/core/state/Transition$WidgetState;
    if-nez v0, :cond_0

    .line 280
    const/4 v1, 0x0

    return-object v1

    .line 282
    :cond_0
    iget-object v1, v0, Landroidx/constraintlayout/core/state/Transition$WidgetState;->start:Landroidx/constraintlayout/core/state/WidgetFrame;

    return-object v1
.end method

.method public hasPositionKeyframes()Z
    .locals 1

    .line 110
    iget-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->keyPositions:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public interpolate(IIF)V
    .locals 3
    .param p1, "parentWidth"    # I
    .param p2, "parentHeight"    # I
    .param p3, "progress"    # F

    .line 271
    iget-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->state:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 272
    .local v1, "key":Ljava/lang/String;
    iget-object v2, p0, Landroidx/constraintlayout/core/state/Transition;->state:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/core/state/Transition$WidgetState;

    .line 273
    .local v2, "widget":Landroidx/constraintlayout/core/state/Transition$WidgetState;
    invoke-virtual {v2, p1, p2, p3, p0}, Landroidx/constraintlayout/core/state/Transition$WidgetState;->interpolate(IIFLandroidx/constraintlayout/core/state/Transition;)V

    .line 274
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "widget":Landroidx/constraintlayout/core/state/Transition$WidgetState;
    goto :goto_0

    .line 275
    :cond_0
    return-void
.end method

.method public isEmpty()Z
    .locals 1

    .line 208
    iget-object v0, p0, Landroidx/constraintlayout/core/state/Transition;->state:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public setTransitionProperties(Landroidx/constraintlayout/core/motion/utils/TypedBundle;)V
    .locals 1
    .param p1, "bundle"    # Landroidx/constraintlayout/core/motion/utils/TypedBundle;

    .line 114
    const/16 v0, 0x1fd

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/core/motion/utils/TypedBundle;->getInteger(I)I

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/state/Transition;->pathMotionArc:I

    .line 115
    return-void
.end method

.method public updateFrom(Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;I)V
    .locals 6
    .param p1, "container"    # Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;
    .param p2, "state"    # I

    .line 261
    invoke-virtual {p1}, Landroidx/constraintlayout/core/widgets/ConstraintWidgetContainer;->getChildren()Ljava/util/ArrayList;

    move-result-object v0

    .line 262
    .local v0, "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/core/widgets/ConstraintWidget;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 263
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 264
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;

    .line 265
    .local v3, "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    iget-object v4, v3, Landroidx/constraintlayout/core/widgets/ConstraintWidget;->stringId:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct {p0, v4, v5, p2}, Landroidx/constraintlayout/core/state/Transition;->getWidgetState(Ljava/lang/String;Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)Landroidx/constraintlayout/core/state/Transition$WidgetState;

    move-result-object v4

    .line 266
    .local v4, "widgetState":Landroidx/constraintlayout/core/state/Transition$WidgetState;
    invoke-virtual {v4, v3, p2}, Landroidx/constraintlayout/core/state/Transition$WidgetState;->update(Landroidx/constraintlayout/core/widgets/ConstraintWidget;I)V

    .line 263
    .end local v3    # "child":Landroidx/constraintlayout/core/widgets/ConstraintWidget;
    .end local v4    # "widgetState":Landroidx/constraintlayout/core/state/Transition$WidgetState;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 268
    .end local v2    # "i":I
    :cond_0
    return-void
.end method
