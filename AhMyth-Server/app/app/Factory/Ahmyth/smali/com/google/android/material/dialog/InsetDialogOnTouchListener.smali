.class public Lcom/google/android/material/dialog/InsetDialogOnTouchListener;
.super Ljava/lang/Object;
.source "InsetDialogOnTouchListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private final dialog:Landroid/app/Dialog;

.field private final leftInset:I

.field private final prePieSlop:I

.field private final topInset:I


# direct methods
.method public constructor <init>(Landroid/app/Dialog;Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "dialog"    # Landroid/app/Dialog;
    .param p2, "insets"    # Landroid/graphics/Rect;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/google/android/material/dialog/InsetDialogOnTouchListener;->dialog:Landroid/app/Dialog;

    .line 47
    iget v0, p2, Landroid/graphics/Rect;->left:I

    iput v0, p0, Lcom/google/android/material/dialog/InsetDialogOnTouchListener;->leftInset:I

    .line 48
    iget v0, p2, Landroid/graphics/Rect;->top:I

    iput v0, p0, Lcom/google/android/material/dialog/InsetDialogOnTouchListener;->topInset:I

    .line 49
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledWindowTouchSlop()I

    move-result v0

    iput v0, p0, Lcom/google/android/material/dialog/InsetDialogOnTouchListener;->prePieSlop:I

    .line 50
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 11
    .param p1, "view"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .line 54
    const v0, 0x1020002

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 56
    .local v0, "insetView":Landroid/view/View;
    iget v1, p0, Lcom/google/android/material/dialog/InsetDialogOnTouchListener;->leftInset:I

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v2

    add-int/2addr v1, v2

    .line 57
    .local v1, "insetLeft":I
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    add-int/2addr v2, v1

    .line 58
    .local v2, "insetRight":I
    iget v3, p0, Lcom/google/android/material/dialog/InsetDialogOnTouchListener;->topInset:I

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v4

    add-int/2addr v3, v4

    .line 59
    .local v3, "insetTop":I
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v4

    add-int/2addr v4, v3

    .line 61
    .local v4, "insetBottom":I
    new-instance v5, Landroid/graphics/RectF;

    int-to-float v6, v1

    int-to-float v7, v3

    int-to-float v8, v2

    int-to-float v9, v4

    invoke-direct {v5, v6, v7, v8, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 62
    .local v5, "dialogWindow":Landroid/graphics/RectF;
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    invoke-virtual {v5, v6, v7}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_0

    .line 63
    return v7

    .line 65
    :cond_0
    invoke-static {p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v6

    .line 66
    .local v6, "outsideEvent":Landroid/view/MotionEvent;
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_1

    .line 67
    const/4 v8, 0x4

    invoke-virtual {v6, v8}, Landroid/view/MotionEvent;->setAction(I)V

    .line 71
    :cond_1
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x1c

    if-ge v8, v10, :cond_2

    .line 72
    invoke-virtual {v6, v7}, Landroid/view/MotionEvent;->setAction(I)V

    .line 73
    iget v7, p0, Lcom/google/android/material/dialog/InsetDialogOnTouchListener;->prePieSlop:I

    neg-int v8, v7

    sub-int/2addr v8, v9

    int-to-float v8, v8

    neg-int v7, v7

    sub-int/2addr v7, v9

    int-to-float v7, v7

    invoke-virtual {v6, v8, v7}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 75
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    .line 76
    iget-object v7, p0, Lcom/google/android/material/dialog/InsetDialogOnTouchListener;->dialog:Landroid/app/Dialog;

    invoke-virtual {v7, v6}, Landroid/app/Dialog;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v7

    return v7
.end method
