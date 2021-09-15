.class public Landroidx/constraintlayout/motion/utils/ViewState;
.super Ljava/lang/Object;
.source "ViewState.java"


# instance fields
.field public bottom:I

.field public left:I

.field public right:I

.field public rotation:F

.field public top:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getState(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 28
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/motion/utils/ViewState;->left:I

    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/motion/utils/ViewState;->top:I

    .line 30
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/motion/utils/ViewState;->right:I

    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/motion/utils/ViewState;->bottom:I

    .line 32
    invoke-virtual {p1}, Landroid/view/View;->getRotation()F

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/motion/utils/ViewState;->rotation:F

    .line 33
    return-void
.end method

.method public height()I
    .locals 2

    .line 40
    iget v0, p0, Landroidx/constraintlayout/motion/utils/ViewState;->bottom:I

    iget v1, p0, Landroidx/constraintlayout/motion/utils/ViewState;->top:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public width()I
    .locals 2

    .line 36
    iget v0, p0, Landroidx/constraintlayout/motion/utils/ViewState;->right:I

    iget v1, p0, Landroidx/constraintlayout/motion/utils/ViewState;->left:I

    sub-int/2addr v0, v1

    return v0
.end method
