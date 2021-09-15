.class Landroidx/transition/AnimatorUtils;
.super Ljava/lang/Object;
.source "AnimatorUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/transition/AnimatorUtils$AnimatorPauseListenerCompat;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    return-void
.end method

.method static addPauseListener(Landroid/animation/Animator;Landroid/animation/AnimatorListenerAdapter;)V
    .locals 2
    .param p0, "animator"    # Landroid/animation/Animator;
    .param p1, "listener"    # Landroid/animation/AnimatorListenerAdapter;

    .line 31
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 32
    invoke-virtual {p0, p1}, Landroid/animation/Animator;->addPauseListener(Landroid/animation/Animator$AnimatorPauseListener;)V

    .line 34
    :cond_0
    return-void
.end method

.method static pause(Landroid/animation/Animator;)V
    .locals 5
    .param p0, "animator"    # Landroid/animation/Animator;

    .line 37
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 38
    invoke-virtual {p0}, Landroid/animation/Animator;->pause()V

    goto :goto_1

    .line 40
    :cond_0
    invoke-virtual {p0}, Landroid/animation/Animator;->getListeners()Ljava/util/ArrayList;

    move-result-object v0

    .line 41
    .local v0, "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator$AnimatorListener;>;"
    if-eqz v0, :cond_2

    .line 42
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    .local v2, "size":I
    :goto_0
    if-ge v1, v2, :cond_2

    .line 43
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/animation/Animator$AnimatorListener;

    .line 44
    .local v3, "listener":Landroid/animation/Animator$AnimatorListener;
    instance-of v4, v3, Landroidx/transition/AnimatorUtils$AnimatorPauseListenerCompat;

    if-eqz v4, :cond_1

    .line 45
    move-object v4, v3

    check-cast v4, Landroidx/transition/AnimatorUtils$AnimatorPauseListenerCompat;

    invoke-interface {v4, p0}, Landroidx/transition/AnimatorUtils$AnimatorPauseListenerCompat;->onAnimationPause(Landroid/animation/Animator;)V

    .line 42
    .end local v3    # "listener":Landroid/animation/Animator$AnimatorListener;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 50
    .end local v0    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator$AnimatorListener;>;"
    .end local v1    # "i":I
    .end local v2    # "size":I
    :cond_2
    :goto_1
    return-void
.end method

.method static resume(Landroid/animation/Animator;)V
    .locals 5
    .param p0, "animator"    # Landroid/animation/Animator;

    .line 53
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 54
    invoke-virtual {p0}, Landroid/animation/Animator;->resume()V

    goto :goto_1

    .line 56
    :cond_0
    invoke-virtual {p0}, Landroid/animation/Animator;->getListeners()Ljava/util/ArrayList;

    move-result-object v0

    .line 57
    .local v0, "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator$AnimatorListener;>;"
    if-eqz v0, :cond_2

    .line 58
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    .local v2, "size":I
    :goto_0
    if-ge v1, v2, :cond_2

    .line 59
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/animation/Animator$AnimatorListener;

    .line 60
    .local v3, "listener":Landroid/animation/Animator$AnimatorListener;
    instance-of v4, v3, Landroidx/transition/AnimatorUtils$AnimatorPauseListenerCompat;

    if-eqz v4, :cond_1

    .line 61
    move-object v4, v3

    check-cast v4, Landroidx/transition/AnimatorUtils$AnimatorPauseListenerCompat;

    invoke-interface {v4, p0}, Landroidx/transition/AnimatorUtils$AnimatorPauseListenerCompat;->onAnimationResume(Landroid/animation/Animator;)V

    .line 58
    .end local v3    # "listener":Landroid/animation/Animator$AnimatorListener;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 66
    .end local v0    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator$AnimatorListener;>;"
    .end local v1    # "i":I
    .end local v2    # "size":I
    :cond_2
    :goto_1
    return-void
.end method
