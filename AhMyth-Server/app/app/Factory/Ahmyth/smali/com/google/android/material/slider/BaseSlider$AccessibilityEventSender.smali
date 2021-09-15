.class Lcom/google/android/material/slider/BaseSlider$AccessibilityEventSender;
.super Ljava/lang/Object;
.source "BaseSlider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/slider/BaseSlider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AccessibilityEventSender"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/material/slider/BaseSlider;

.field virtualViewId:I


# direct methods
.method private constructor <init>(Lcom/google/android/material/slider/BaseSlider;)V
    .locals 0

    .line 2375
    .local p0, "this":Lcom/google/android/material/slider/BaseSlider$AccessibilityEventSender;, "Lcom/google/android/material/slider/BaseSlider<TS;TL;TT;>.AccessibilityEventSender;"
    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider$AccessibilityEventSender;->this$0:Lcom/google/android/material/slider/BaseSlider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2376
    const/4 p1, -0x1

    iput p1, p0, Lcom/google/android/material/slider/BaseSlider$AccessibilityEventSender;->virtualViewId:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/material/slider/BaseSlider;Lcom/google/android/material/slider/BaseSlider$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/material/slider/BaseSlider;
    .param p2, "x1"    # Lcom/google/android/material/slider/BaseSlider$1;

    .line 2375
    .local p0, "this":Lcom/google/android/material/slider/BaseSlider$AccessibilityEventSender;, "Lcom/google/android/material/slider/BaseSlider<TS;TL;TT;>.AccessibilityEventSender;"
    invoke-direct {p0, p1}, Lcom/google/android/material/slider/BaseSlider$AccessibilityEventSender;-><init>(Lcom/google/android/material/slider/BaseSlider;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 2384
    .local p0, "this":Lcom/google/android/material/slider/BaseSlider$AccessibilityEventSender;, "Lcom/google/android/material/slider/BaseSlider<TS;TL;TT;>.AccessibilityEventSender;"
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider$AccessibilityEventSender;->this$0:Lcom/google/android/material/slider/BaseSlider;

    invoke-static {v0}, Lcom/google/android/material/slider/BaseSlider;->access$300(Lcom/google/android/material/slider/BaseSlider;)Lcom/google/android/material/slider/BaseSlider$AccessibilityHelper;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider$AccessibilityEventSender;->virtualViewId:I

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Lcom/google/android/material/slider/BaseSlider$AccessibilityHelper;->sendEventForVirtualView(II)Z

    .line 2386
    return-void
.end method

.method setVirtualViewId(I)V
    .locals 0
    .param p1, "virtualViewId"    # I

    .line 2379
    .local p0, "this":Lcom/google/android/material/slider/BaseSlider$AccessibilityEventSender;, "Lcom/google/android/material/slider/BaseSlider<TS;TL;TT;>.AccessibilityEventSender;"
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider$AccessibilityEventSender;->virtualViewId:I

    .line 2380
    return-void
.end method
