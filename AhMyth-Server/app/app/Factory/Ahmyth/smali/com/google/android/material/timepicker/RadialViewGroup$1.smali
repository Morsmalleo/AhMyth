.class Lcom/google/android/material/timepicker/RadialViewGroup$1;
.super Ljava/lang/Object;
.source "RadialViewGroup.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/timepicker/RadialViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/material/timepicker/RadialViewGroup;


# direct methods
.method constructor <init>(Lcom/google/android/material/timepicker/RadialViewGroup;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/android/material/timepicker/RadialViewGroup;

    .line 70
    iput-object p1, p0, Lcom/google/android/material/timepicker/RadialViewGroup$1;->this$0:Lcom/google/android/material/timepicker/RadialViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/google/android/material/timepicker/RadialViewGroup$1;->this$0:Lcom/google/android/material/timepicker/RadialViewGroup;

    invoke-virtual {v0}, Lcom/google/android/material/timepicker/RadialViewGroup;->updateLayoutParams()V

    .line 74
    return-void
.end method
