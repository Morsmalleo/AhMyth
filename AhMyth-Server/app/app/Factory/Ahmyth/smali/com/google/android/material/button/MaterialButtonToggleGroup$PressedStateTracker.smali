.class Lcom/google/android/material/button/MaterialButtonToggleGroup$PressedStateTracker;
.super Ljava/lang/Object;
.source "MaterialButtonToggleGroup.java"

# interfaces
.implements Lcom/google/android/material/button/MaterialButton$OnPressedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/button/MaterialButtonToggleGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PressedStateTracker"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/material/button/MaterialButtonToggleGroup;


# direct methods
.method private constructor <init>(Lcom/google/android/material/button/MaterialButtonToggleGroup;)V
    .locals 0

    .line 817
    iput-object p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup$PressedStateTracker;->this$0:Lcom/google/android/material/button/MaterialButtonToggleGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/material/button/MaterialButtonToggleGroup;Lcom/google/android/material/button/MaterialButtonToggleGroup$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/material/button/MaterialButtonToggleGroup;
    .param p2, "x1"    # Lcom/google/android/material/button/MaterialButtonToggleGroup$1;

    .line 817
    invoke-direct {p0, p1}, Lcom/google/android/material/button/MaterialButtonToggleGroup$PressedStateTracker;-><init>(Lcom/google/android/material/button/MaterialButtonToggleGroup;)V

    return-void
.end method


# virtual methods
.method public onPressedChanged(Lcom/google/android/material/button/MaterialButton;Z)V
    .locals 1
    .param p1, "button"    # Lcom/google/android/material/button/MaterialButton;
    .param p2, "isPressed"    # Z

    .line 821
    iget-object v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup$PressedStateTracker;->this$0:Lcom/google/android/material/button/MaterialButtonToggleGroup;

    invoke-virtual {v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->invalidate()V

    .line 822
    return-void
.end method
