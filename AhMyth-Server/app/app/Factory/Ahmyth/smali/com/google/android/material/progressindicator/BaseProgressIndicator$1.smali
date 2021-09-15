.class Lcom/google/android/material/progressindicator/BaseProgressIndicator$1;
.super Ljava/lang/Object;
.source "BaseProgressIndicator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/progressindicator/BaseProgressIndicator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/material/progressindicator/BaseProgressIndicator;


# direct methods
.method constructor <init>(Lcom/google/android/material/progressindicator/BaseProgressIndicator;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/android/material/progressindicator/BaseProgressIndicator;

    .line 780
    .local p0, "this":Lcom/google/android/material/progressindicator/BaseProgressIndicator$1;, "Lcom/google/android/material/progressindicator/BaseProgressIndicator$1;"
    iput-object p1, p0, Lcom/google/android/material/progressindicator/BaseProgressIndicator$1;->this$0:Lcom/google/android/material/progressindicator/BaseProgressIndicator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 783
    .local p0, "this":Lcom/google/android/material/progressindicator/BaseProgressIndicator$1;, "Lcom/google/android/material/progressindicator/BaseProgressIndicator$1;"
    iget-object v0, p0, Lcom/google/android/material/progressindicator/BaseProgressIndicator$1;->this$0:Lcom/google/android/material/progressindicator/BaseProgressIndicator;

    invoke-static {v0}, Lcom/google/android/material/progressindicator/BaseProgressIndicator;->access$000(Lcom/google/android/material/progressindicator/BaseProgressIndicator;)V

    .line 784
    return-void
.end method
