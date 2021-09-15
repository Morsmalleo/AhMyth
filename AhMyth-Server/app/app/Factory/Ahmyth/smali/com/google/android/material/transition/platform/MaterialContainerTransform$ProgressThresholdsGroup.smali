.class Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;
.super Ljava/lang/Object;
.source "MaterialContainerTransform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/transition/platform/MaterialContainerTransform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ProgressThresholdsGroup"
.end annotation


# instance fields
.field private final fade:Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;

.field private final scale:Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;

.field private final scaleMask:Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;

.field private final shapeMask:Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;


# direct methods
.method private constructor <init>(Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;)V
    .locals 0
    .param p1, "fade"    # Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;
    .param p2, "scale"    # Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;
    .param p3, "scaleMask"    # Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;
    .param p4, "shapeMask"    # Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;

    .line 1571
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1572
    iput-object p1, p0, Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;->fade:Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;

    .line 1573
    iput-object p2, p0, Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;->scale:Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;

    .line 1574
    iput-object p3, p0, Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;->scaleMask:Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;

    .line 1575
    iput-object p4, p0, Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;->shapeMask:Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;

    .line 1576
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;Lcom/google/android/material/transition/platform/MaterialContainerTransform$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;
    .param p2, "x1"    # Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;
    .param p3, "x2"    # Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;
    .param p4, "x3"    # Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;
    .param p5, "x4"    # Lcom/google/android/material/transition/platform/MaterialContainerTransform$1;

    .line 1561
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;-><init>(Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;)Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;

    .line 1561
    iget-object v0, p0, Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;->fade:Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;

    return-object v0
.end method

.method static synthetic access$500(Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;)Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;

    .line 1561
    iget-object v0, p0, Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;->scale:Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;

    return-object v0
.end method

.method static synthetic access$600(Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;)Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;

    .line 1561
    iget-object v0, p0, Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;->scaleMask:Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;

    return-object v0
.end method

.method static synthetic access$700(Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;)Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;

    .line 1561
    iget-object v0, p0, Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholdsGroup;->shapeMask:Lcom/google/android/material/transition/platform/MaterialContainerTransform$ProgressThresholds;

    return-object v0
.end method
