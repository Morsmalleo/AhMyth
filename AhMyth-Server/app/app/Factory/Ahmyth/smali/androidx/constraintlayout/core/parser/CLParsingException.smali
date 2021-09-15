.class public Landroidx/constraintlayout/core/parser/CLParsingException;
.super Ljava/lang/Exception;
.source "CLParsingException.java"


# instance fields
.field private final mElementClass:Ljava/lang/String;

.field private final mLineNumber:I

.field private final mReason:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroidx/constraintlayout/core/parser/CLElement;)V
    .locals 1
    .param p1, "reason"    # Ljava/lang/String;
    .param p2, "element"    # Landroidx/constraintlayout/core/parser/CLElement;

    .line 23
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 24
    iput-object p1, p0, Landroidx/constraintlayout/core/parser/CLParsingException;->mReason:Ljava/lang/String;

    .line 25
    if-eqz p2, :cond_0

    .line 26
    invoke-virtual {p2}, Landroidx/constraintlayout/core/parser/CLElement;->getStrClass()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroidx/constraintlayout/core/parser/CLParsingException;->mElementClass:Ljava/lang/String;

    .line 27
    invoke-virtual {p2}, Landroidx/constraintlayout/core/parser/CLElement;->getLine()I

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/core/parser/CLParsingException;->mLineNumber:I

    goto :goto_0

    .line 29
    :cond_0
    const-string v0, "unknown"

    iput-object v0, p0, Landroidx/constraintlayout/core/parser/CLParsingException;->mElementClass:Ljava/lang/String;

    .line 30
    const/4 v0, 0x0

    iput v0, p0, Landroidx/constraintlayout/core/parser/CLParsingException;->mLineNumber:I

    .line 32
    :goto_0
    return-void
.end method


# virtual methods
.method public reason()Ljava/lang/String;
    .locals 2

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroidx/constraintlayout/core/parser/CLParsingException;->mReason:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/constraintlayout/core/parser/CLParsingException;->mElementClass:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " at line "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/constraintlayout/core/parser/CLParsingException;->mLineNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CLParsingException ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ") : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroidx/constraintlayout/core/parser/CLParsingException;->reason()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
