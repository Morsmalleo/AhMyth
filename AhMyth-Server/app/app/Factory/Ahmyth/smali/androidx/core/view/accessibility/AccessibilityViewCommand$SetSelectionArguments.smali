.class public final Landroidx/core/view/accessibility/AccessibilityViewCommand$SetSelectionArguments;
.super Landroidx/core/view/accessibility/AccessibilityViewCommand$CommandArguments;
.source "AccessibilityViewCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/accessibility/AccessibilityViewCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SetSelectionArguments"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 113
    invoke-direct {p0}, Landroidx/core/view/accessibility/AccessibilityViewCommand$CommandArguments;-><init>()V

    return-void
.end method


# virtual methods
.method public getEnd()I
    .locals 2

    .line 126
    iget-object v0, p0, Landroidx/core/view/accessibility/AccessibilityViewCommand$SetSelectionArguments;->mBundle:Landroid/os/Bundle;

    const-string v1, "ACTION_ARGUMENT_SELECTION_END_INT"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getStart()I
    .locals 2

    .line 119
    iget-object v0, p0, Landroidx/core/view/accessibility/AccessibilityViewCommand$SetSelectionArguments;->mBundle:Landroid/os/Bundle;

    const-string v1, "ACTION_ARGUMENT_SELECTION_START_INT"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method
