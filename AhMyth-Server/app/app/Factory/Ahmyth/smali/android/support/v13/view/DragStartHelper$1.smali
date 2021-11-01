.class Landroid/support/v13/view/DragStartHelper$1;
.super Ljava/lang/Object;
.source "DragStartHelper.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v13/view/DragStartHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v13/view/DragStartHelper;


# direct methods
.method constructor <init>(Landroid/support/v13/view/DragStartHelper;)V
    .locals 0

    .line 181
    iput-object p1, p0, Landroid/support/v13/view/DragStartHelper$1;->this$0:Landroid/support/v13/view/DragStartHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 184
    iget-object v0, p0, Landroid/support/v13/view/DragStartHelper$1;->this$0:Landroid/support/v13/view/DragStartHelper;

    invoke-virtual {v0, p1}, Landroid/support/v13/view/DragStartHelper;->onLongClick(Landroid/view/View;)Z

    move-result p1

    return p1
.end method
