.class public Landroidx/constraintlayout/core/motion/utils/FloatRect;
.super Ljava/lang/Object;
.source "FloatRect.java"


# instance fields
.field public bottom:F

.field public left:F

.field public right:F

.field public top:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final centerX()F
    .locals 2

    .line 24
    iget v0, p0, Landroidx/constraintlayout/core/motion/utils/FloatRect;->left:F

    iget v1, p0, Landroidx/constraintlayout/core/motion/utils/FloatRect;->right:F

    add-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v0, v0, v1

    return v0
.end method

.method public final centerY()F
    .locals 2

    .line 27
    iget v0, p0, Landroidx/constraintlayout/core/motion/utils/FloatRect;->top:F

    iget v1, p0, Landroidx/constraintlayout/core/motion/utils/FloatRect;->bottom:F

    add-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v0, v0, v1

    return v0
.end method
