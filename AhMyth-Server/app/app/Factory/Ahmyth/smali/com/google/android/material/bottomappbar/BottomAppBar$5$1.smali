.class Lcom/google/android/material/bottomappbar/BottomAppBar$5$1;
.super Lcom/google/android/material/floatingactionbutton/FloatingActionButton$OnVisibilityChangedListener;
.source "BottomAppBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/bottomappbar/BottomAppBar$5;->onHidden(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/android/material/bottomappbar/BottomAppBar$5;


# direct methods
.method constructor <init>(Lcom/google/android/material/bottomappbar/BottomAppBar$5;)V
    .locals 0
    .param p1, "this$1"    # Lcom/google/android/material/bottomappbar/BottomAppBar$5;

    .line 648
    iput-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$5$1;->this$1:Lcom/google/android/material/bottomappbar/BottomAppBar$5;

    invoke-direct {p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton$OnVisibilityChangedListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onShown(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V
    .locals 1
    .param p1, "fab"    # Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 651
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$5$1;->this$1:Lcom/google/android/material/bottomappbar/BottomAppBar$5;

    iget-object v0, v0, Lcom/google/android/material/bottomappbar/BottomAppBar$5;->this$0:Lcom/google/android/material/bottomappbar/BottomAppBar;

    invoke-static {v0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->access$1600(Lcom/google/android/material/bottomappbar/BottomAppBar;)V

    .line 652
    return-void
.end method
