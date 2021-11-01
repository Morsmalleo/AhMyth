.class Landroid/support/v4/view/ViewPropertyAnimatorCompat$2;
.super Ljava/lang/Object;
.source "ViewPropertyAnimatorCompat.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setUpdateListener(Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

.field final synthetic val$listener:Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;Landroid/view/View;)V
    .locals 0

    .line 778
    iput-object p1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$2;->this$0:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    iput-object p2, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$2;->val$listener:Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;

    iput-object p3, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$2;->val$view:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 781
    iget-object p1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$2;->val$listener:Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;

    iget-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$2;->val$view:Landroid/view/View;

    invoke-interface {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;->onAnimationUpdate(Landroid/view/View;)V

    return-void
.end method
