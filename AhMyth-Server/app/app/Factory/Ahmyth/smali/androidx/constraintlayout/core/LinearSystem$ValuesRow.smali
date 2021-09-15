.class Landroidx/constraintlayout/core/LinearSystem$ValuesRow;
.super Landroidx/constraintlayout/core/ArrayRow;
.source "LinearSystem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/core/LinearSystem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ValuesRow"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/constraintlayout/core/LinearSystem;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/core/LinearSystem;Landroidx/constraintlayout/core/Cache;)V
    .locals 1
    .param p1, "this$0"    # Landroidx/constraintlayout/core/LinearSystem;
    .param p2, "cache"    # Landroidx/constraintlayout/core/Cache;

    .line 89
    iput-object p1, p0, Landroidx/constraintlayout/core/LinearSystem$ValuesRow;->this$0:Landroidx/constraintlayout/core/LinearSystem;

    invoke-direct {p0}, Landroidx/constraintlayout/core/ArrayRow;-><init>()V

    .line 90
    new-instance v0, Landroidx/constraintlayout/core/SolverVariableValues;

    invoke-direct {v0, p0, p2}, Landroidx/constraintlayout/core/SolverVariableValues;-><init>(Landroidx/constraintlayout/core/ArrayRow;Landroidx/constraintlayout/core/Cache;)V

    iput-object v0, p0, Landroidx/constraintlayout/core/LinearSystem$ValuesRow;->variables:Landroidx/constraintlayout/core/ArrayRow$ArrayRowVariables;

    .line 91
    return-void
.end method
