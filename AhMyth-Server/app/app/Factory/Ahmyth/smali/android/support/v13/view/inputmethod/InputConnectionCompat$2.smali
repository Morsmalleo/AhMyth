.class final Landroid/support/v13/view/inputmethod/InputConnectionCompat$2;
.super Landroid/view/inputmethod/InputConnectionWrapper;
.source "InputConnectionCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v13/view/inputmethod/InputConnectionCompat;->createWrapper(Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;Landroid/support/v13/view/inputmethod/InputConnectionCompat$OnCommitContentListener;)Landroid/view/inputmethod/InputConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$listener:Landroid/support/v13/view/inputmethod/InputConnectionCompat$OnCommitContentListener;


# direct methods
.method constructor <init>(Landroid/view/inputmethod/InputConnection;ZLandroid/support/v13/view/inputmethod/InputConnectionCompat$OnCommitContentListener;)V
    .locals 0

    .line 222
    iput-object p3, p0, Landroid/support/v13/view/inputmethod/InputConnectionCompat$2;->val$listener:Landroid/support/v13/view/inputmethod/InputConnectionCompat$OnCommitContentListener;

    invoke-direct {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;-><init>(Landroid/view/inputmethod/InputConnection;Z)V

    return-void
.end method


# virtual methods
.method public performPrivateCommand(Ljava/lang/String;Landroid/os/Bundle;)Z
    .locals 1

    .line 225
    iget-object v0, p0, Landroid/support/v13/view/inputmethod/InputConnectionCompat$2;->val$listener:Landroid/support/v13/view/inputmethod/InputConnectionCompat$OnCommitContentListener;

    invoke-static {p1, p2, v0}, Landroid/support/v13/view/inputmethod/InputConnectionCompat;->handlePerformPrivateCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v13/view/inputmethod/InputConnectionCompat$OnCommitContentListener;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 228
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->performPrivateCommand(Ljava/lang/String;Landroid/os/Bundle;)Z

    move-result p1

    return p1
.end method
