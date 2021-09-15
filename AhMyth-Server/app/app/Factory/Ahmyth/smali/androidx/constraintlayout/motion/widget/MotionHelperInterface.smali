.class public interface abstract Landroidx/constraintlayout/motion/widget/MotionHelperInterface;
.super Ljava/lang/Object;
.source "MotionHelperInterface.java"

# interfaces
.implements Landroidx/constraintlayout/motion/widget/Animatable;
.implements Landroidx/constraintlayout/motion/widget/MotionLayout$TransitionListener;


# virtual methods
.method public abstract isDecorator()Z
.end method

.method public abstract isUseOnHide()Z
.end method

.method public abstract isUsedOnShow()Z
.end method

.method public abstract onFinishedMotionScene(Landroidx/constraintlayout/motion/widget/MotionLayout;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "motionLayout"
        }
    .end annotation
.end method

.method public abstract onPostDraw(Landroid/graphics/Canvas;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "canvas"
        }
    .end annotation
.end method

.method public abstract onPreDraw(Landroid/graphics/Canvas;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "canvas"
        }
    .end annotation
.end method

.method public abstract onPreSetup(Landroidx/constraintlayout/motion/widget/MotionLayout;Ljava/util/HashMap;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "motionLayout",
            "controllerMap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/constraintlayout/motion/widget/MotionLayout;",
            "Ljava/util/HashMap<",
            "Landroid/view/View;",
            "Landroidx/constraintlayout/motion/widget/MotionController;",
            ">;)V"
        }
    .end annotation
.end method
