.class final Landroidx/transition/MatrixUtils$1;
.super Landroid/graphics/Matrix;
.source "MatrixUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/transition/MatrixUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    return-void
.end method


# virtual methods
.method oops()V
    .locals 2

    .line 27
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Matrix can not be modified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public postConcat(Landroid/graphics/Matrix;)Z
    .locals 1
    .param p1, "other"    # Landroid/graphics/Matrix;

    .line 183
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 184
    const/4 v0, 0x0

    return v0
.end method

.method public postRotate(F)Z
    .locals 1
    .param p1, "degrees"    # F

    .line 165
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 166
    const/4 v0, 0x0

    return v0
.end method

.method public postRotate(FFF)Z
    .locals 1
    .param p1, "degrees"    # F
    .param p2, "px"    # F
    .param p3, "py"    # F

    .line 159
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 160
    const/4 v0, 0x0

    return v0
.end method

.method public postScale(FF)Z
    .locals 1
    .param p1, "sx"    # F
    .param p2, "sy"    # F

    .line 153
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 154
    const/4 v0, 0x0

    return v0
.end method

.method public postScale(FFFF)Z
    .locals 1
    .param p1, "sx"    # F
    .param p2, "sy"    # F
    .param p3, "px"    # F
    .param p4, "py"    # F

    .line 147
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 148
    const/4 v0, 0x0

    return v0
.end method

.method public postSkew(FF)Z
    .locals 1
    .param p1, "kx"    # F
    .param p2, "ky"    # F

    .line 177
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 178
    const/4 v0, 0x0

    return v0
.end method

.method public postSkew(FFFF)Z
    .locals 1
    .param p1, "kx"    # F
    .param p2, "ky"    # F
    .param p3, "px"    # F
    .param p4, "py"    # F

    .line 171
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 172
    const/4 v0, 0x0

    return v0
.end method

.method public postTranslate(FF)Z
    .locals 1
    .param p1, "dx"    # F
    .param p2, "dy"    # F

    .line 141
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 142
    const/4 v0, 0x0

    return v0
.end method

.method public preConcat(Landroid/graphics/Matrix;)Z
    .locals 1
    .param p1, "other"    # Landroid/graphics/Matrix;

    .line 135
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 136
    const/4 v0, 0x0

    return v0
.end method

.method public preRotate(F)Z
    .locals 1
    .param p1, "degrees"    # F

    .line 117
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 118
    const/4 v0, 0x0

    return v0
.end method

.method public preRotate(FFF)Z
    .locals 1
    .param p1, "degrees"    # F
    .param p2, "px"    # F
    .param p3, "py"    # F

    .line 111
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 112
    const/4 v0, 0x0

    return v0
.end method

.method public preScale(FF)Z
    .locals 1
    .param p1, "sx"    # F
    .param p2, "sy"    # F

    .line 105
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 106
    const/4 v0, 0x0

    return v0
.end method

.method public preScale(FFFF)Z
    .locals 1
    .param p1, "sx"    # F
    .param p2, "sy"    # F
    .param p3, "px"    # F
    .param p4, "py"    # F

    .line 99
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 100
    const/4 v0, 0x0

    return v0
.end method

.method public preSkew(FF)Z
    .locals 1
    .param p1, "kx"    # F
    .param p2, "ky"    # F

    .line 129
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 130
    const/4 v0, 0x0

    return v0
.end method

.method public preSkew(FFFF)Z
    .locals 1
    .param p1, "kx"    # F
    .param p2, "ky"    # F
    .param p3, "px"    # F
    .param p4, "py"    # F

    .line 123
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 124
    const/4 v0, 0x0

    return v0
.end method

.method public preTranslate(FF)Z
    .locals 1
    .param p1, "dx"    # F
    .param p2, "dy"    # F

    .line 93
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 94
    const/4 v0, 0x0

    return v0
.end method

.method public reset()V
    .locals 0

    .line 37
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 38
    return-void
.end method

.method public set(Landroid/graphics/Matrix;)V
    .locals 0
    .param p1, "src"    # Landroid/graphics/Matrix;

    .line 32
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 33
    return-void
.end method

.method public setConcat(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)Z
    .locals 1
    .param p1, "a"    # Landroid/graphics/Matrix;
    .param p2, "b"    # Landroid/graphics/Matrix;

    .line 87
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 88
    const/4 v0, 0x0

    return v0
.end method

.method public setPolyToPoly([FI[FII)Z
    .locals 1
    .param p1, "src"    # [F
    .param p2, "srcIndex"    # I
    .param p3, "dst"    # [F
    .param p4, "dstIndex"    # I
    .param p5, "pointCount"    # I

    .line 196
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 197
    const/4 v0, 0x0

    return v0
.end method

.method public setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z
    .locals 1
    .param p1, "src"    # Landroid/graphics/RectF;
    .param p2, "dst"    # Landroid/graphics/RectF;
    .param p3, "stf"    # Landroid/graphics/Matrix$ScaleToFit;

    .line 189
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 190
    const/4 v0, 0x0

    return v0
.end method

.method public setRotate(F)V
    .locals 0
    .param p1, "degrees"    # F

    .line 62
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 63
    return-void
.end method

.method public setRotate(FFF)V
    .locals 0
    .param p1, "degrees"    # F
    .param p2, "px"    # F
    .param p3, "py"    # F

    .line 57
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 58
    return-void
.end method

.method public setScale(FF)V
    .locals 0
    .param p1, "sx"    # F
    .param p2, "sy"    # F

    .line 52
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 53
    return-void
.end method

.method public setScale(FFFF)V
    .locals 0
    .param p1, "sx"    # F
    .param p2, "sy"    # F
    .param p3, "px"    # F
    .param p4, "py"    # F

    .line 47
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 48
    return-void
.end method

.method public setSinCos(FF)V
    .locals 0
    .param p1, "sinValue"    # F
    .param p2, "cosValue"    # F

    .line 72
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 73
    return-void
.end method

.method public setSinCos(FFFF)V
    .locals 0
    .param p1, "sinValue"    # F
    .param p2, "cosValue"    # F
    .param p3, "px"    # F
    .param p4, "py"    # F

    .line 67
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 68
    return-void
.end method

.method public setSkew(FF)V
    .locals 0
    .param p1, "kx"    # F
    .param p2, "ky"    # F

    .line 82
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 83
    return-void
.end method

.method public setSkew(FFFF)V
    .locals 0
    .param p1, "kx"    # F
    .param p2, "ky"    # F
    .param p3, "px"    # F
    .param p4, "py"    # F

    .line 77
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 78
    return-void
.end method

.method public setTranslate(FF)V
    .locals 0
    .param p1, "dx"    # F
    .param p2, "dy"    # F

    .line 42
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 43
    return-void
.end method

.method public setValues([F)V
    .locals 0
    .param p1, "values"    # [F

    .line 202
    invoke-virtual {p0}, Landroidx/transition/MatrixUtils$1;->oops()V

    .line 203
    return-void
.end method
