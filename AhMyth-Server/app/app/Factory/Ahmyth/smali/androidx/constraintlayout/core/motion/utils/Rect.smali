.class public Landroidx/constraintlayout/core/motion/utils/Rect;
.super Ljava/lang/Object;
.source "Rect.java"


# instance fields
.field public bottom:I

.field public left:I

.field public right:I

.field public top:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public height()I
    .locals 2

    .line 29
    iget v0, p0, Landroidx/constraintlayout/core/motion/utils/Rect;->bottom:I

    iget v1, p0, Landroidx/constraintlayout/core/motion/utils/Rect;->top:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public width()I
    .locals 2

    .line 25
    iget v0, p0, Landroidx/constraintlayout/core/motion/utils/Rect;->right:I

    iget v1, p0, Landroidx/constraintlayout/core/motion/utils/Rect;->left:I

    sub-int/2addr v0, v1

    return v0
.end method
