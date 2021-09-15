.class Lcom/google/android/material/transition/platform/FadeModeResult;
.super Ljava/lang/Object;
.source "FadeModeResult.java"


# instance fields
.field final endAlpha:I

.field final endOnTop:Z

.field final startAlpha:I


# direct methods
.method private constructor <init>(IIZ)V
    .locals 0
    .param p1, "startAlpha"    # I
    .param p2, "endAlpha"    # I
    .param p3, "endOnTop"    # Z

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput p1, p0, Lcom/google/android/material/transition/platform/FadeModeResult;->startAlpha:I

    .line 39
    iput p2, p0, Lcom/google/android/material/transition/platform/FadeModeResult;->endAlpha:I

    .line 40
    iput-boolean p3, p0, Lcom/google/android/material/transition/platform/FadeModeResult;->endOnTop:Z

    .line 41
    return-void
.end method

.method static endOnTop(II)Lcom/google/android/material/transition/platform/FadeModeResult;
    .locals 2
    .param p0, "startAlpha"    # I
    .param p1, "endAlpha"    # I

    .line 34
    new-instance v0, Lcom/google/android/material/transition/platform/FadeModeResult;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lcom/google/android/material/transition/platform/FadeModeResult;-><init>(IIZ)V

    return-object v0
.end method

.method static startOnTop(II)Lcom/google/android/material/transition/platform/FadeModeResult;
    .locals 2
    .param p0, "startAlpha"    # I
    .param p1, "endAlpha"    # I

    .line 30
    new-instance v0, Lcom/google/android/material/transition/platform/FadeModeResult;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/google/android/material/transition/platform/FadeModeResult;-><init>(IIZ)V

    return-object v0
.end method
