.class Landroid/support/v4/view/ViewPropertyAnimatorCompat$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ViewPropertyAnimatorCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListenerInternal(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

.field final synthetic val$listener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/support/v4/view/ViewPropertyAnimatorListener;Landroid/view/View;)V
    .locals 0

    .line 740
    iput-object p1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$1;->this$0:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    iput-object p2, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$1;->val$listener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

    iput-object p3, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$1;->val$view:Landroid/view/View;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 743
    iget-object p1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$1;->val$listener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$1;->val$view:Landroid/view/View;

    invoke-interface {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorListener;->onAnimationCancel(Landroid/view/View;)V

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 748
    iget-object p1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$1;->val$listener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$1;->val$view:Landroid/view/View;

    invoke-interface {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorListener;->onAnimationEnd(Landroid/view/View;)V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 753
    iget-object p1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$1;->val$listener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$1;->val$view:Landroid/view/View;

    invoke-interface {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorListener;->onAnimationStart(Landroid/view/View;)V

    return-void
.end method
