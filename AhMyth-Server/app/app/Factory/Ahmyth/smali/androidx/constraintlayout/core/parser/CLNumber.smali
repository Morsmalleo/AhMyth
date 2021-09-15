.class public Landroidx/constraintlayout/core/parser/CLNumber;
.super Landroidx/constraintlayout/core/parser/CLElement;
.source "CLNumber.java"


# instance fields
.field value:F


# direct methods
.method public constructor <init>(F)V
    .locals 1
    .param p1, "value"    # F

    .line 26
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroidx/constraintlayout/core/parser/CLElement;-><init>([C)V

    .line 20
    const/high16 v0, 0x7fc00000    # Float.NaN

    iput v0, p0, Landroidx/constraintlayout/core/parser/CLNumber;->value:F

    .line 27
    iput p1, p0, Landroidx/constraintlayout/core/parser/CLNumber;->value:F

    .line 28
    return-void
.end method

.method public constructor <init>([C)V
    .locals 1
    .param p1, "content"    # [C

    .line 22
    invoke-direct {p0, p1}, Landroidx/constraintlayout/core/parser/CLElement;-><init>([C)V

    .line 20
    const/high16 v0, 0x7fc00000    # Float.NaN

    iput v0, p0, Landroidx/constraintlayout/core/parser/CLNumber;->value:F

    .line 23
    return-void
.end method

.method public static allocate([C)Landroidx/constraintlayout/core/parser/CLElement;
    .locals 1
    .param p0, "content"    # [C

    .line 31
    new-instance v0, Landroidx/constraintlayout/core/parser/CLNumber;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/core/parser/CLNumber;-><init>([C)V

    return-object v0
.end method


# virtual methods
.method public getFloat()F
    .locals 1

    .line 72
    iget v0, p0, Landroidx/constraintlayout/core/parser/CLNumber;->value:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {p0}, Landroidx/constraintlayout/core/parser/CLNumber;->content()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/parser/CLNumber;->value:F

    .line 75
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/core/parser/CLNumber;->value:F

    return v0
.end method

.method public getInt()I
    .locals 1

    .line 64
    iget v0, p0, Landroidx/constraintlayout/core/parser/CLNumber;->value:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    invoke-virtual {p0}, Landroidx/constraintlayout/core/parser/CLNumber;->content()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Landroidx/constraintlayout/core/parser/CLNumber;->value:F

    .line 67
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/core/parser/CLNumber;->value:F

    float-to-int v0, v0

    return v0
.end method

.method public isInt()Z
    .locals 3

    .line 57
    invoke-virtual {p0}, Landroidx/constraintlayout/core/parser/CLNumber;->getFloat()F

    move-result v0

    .line 58
    .local v0, "value":F
    float-to-int v1, v0

    .line 59
    .local v1, "intValue":I
    int-to-float v2, v1

    cmpl-float v2, v2, v0

    if-nez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method public putValue(F)V
    .locals 0
    .param p1, "value"    # F

    .line 79
    iput p1, p0, Landroidx/constraintlayout/core/parser/CLNumber;->value:F

    .line 80
    return-void
.end method

.method protected toFormattedJSON(II)Ljava/lang/String;
    .locals 4
    .param p1, "indent"    # I
    .param p2, "forceIndent"    # I

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .local v0, "json":Ljava/lang/StringBuilder;
    invoke-virtual {p0, v0, p1}, Landroidx/constraintlayout/core/parser/CLNumber;->addIndent(Ljava/lang/StringBuilder;I)V

    .line 46
    invoke-virtual {p0}, Landroidx/constraintlayout/core/parser/CLNumber;->getFloat()F

    move-result v1

    .line 47
    .local v1, "value":F
    float-to-int v2, v1

    .line 48
    .local v2, "intValue":I
    int-to-float v3, v2

    cmpl-float v3, v3, v1

    if-nez v3, :cond_0

    .line 49
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 53
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method protected toJSON()Ljava/lang/String;
    .locals 4

    .line 35
    invoke-virtual {p0}, Landroidx/constraintlayout/core/parser/CLNumber;->getFloat()F

    move-result v0

    .line 36
    .local v0, "value":F
    float-to-int v1, v0

    .line 37
    .local v1, "intValue":I
    int-to-float v2, v1

    const-string v3, ""

    cmpl-float v2, v2, v0

    if-nez v2, :cond_0

    .line 38
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 40
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
