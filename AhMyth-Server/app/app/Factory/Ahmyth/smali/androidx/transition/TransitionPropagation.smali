.class public abstract Landroidx/transition/TransitionPropagation;
.super Ljava/lang/Object;
.source "TransitionPropagation.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract captureValues(Landroidx/transition/TransitionValues;)V
.end method

.method public abstract getPropagationProperties()[Ljava/lang/String;
.end method

.method public abstract getStartDelay(Landroid/view/ViewGroup;Landroidx/transition/Transition;Landroidx/transition/TransitionValues;Landroidx/transition/TransitionValues;)J
.end method
