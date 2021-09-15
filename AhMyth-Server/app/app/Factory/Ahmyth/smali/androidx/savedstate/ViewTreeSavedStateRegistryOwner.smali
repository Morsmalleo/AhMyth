.class public final Landroidx/savedstate/ViewTreeSavedStateRegistryOwner;
.super Ljava/lang/Object;
.source "ViewTreeSavedStateRegistryOwner.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public static get(Landroid/view/View;)Landroidx/savedstate/SavedStateRegistryOwner;
    .locals 4
    .param p0, "view"    # Landroid/view/View;

    .line 70
    sget v0, Landroidx/savedstate/R$id;->view_tree_saved_state_registry_owner:I

    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/savedstate/SavedStateRegistryOwner;

    .line 72
    .local v0, "found":Landroidx/savedstate/SavedStateRegistryOwner;
    if-eqz v0, :cond_0

    return-object v0

    .line 73
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 74
    .local v1, "parent":Landroid/view/ViewParent;
    :goto_0
    if-nez v0, :cond_1

    instance-of v2, v1, Landroid/view/View;

    if-eqz v2, :cond_1

    .line 75
    move-object v2, v1

    check-cast v2, Landroid/view/View;

    .line 76
    .local v2, "parentView":Landroid/view/View;
    sget v3, Landroidx/savedstate/R$id;->view_tree_saved_state_registry_owner:I

    invoke-virtual {v2, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Landroidx/savedstate/SavedStateRegistryOwner;

    .line 78
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 79
    .end local v2    # "parentView":Landroid/view/View;
    goto :goto_0

    .line 80
    :cond_1
    return-object v0
.end method

.method public static set(Landroid/view/View;Landroidx/savedstate/SavedStateRegistryOwner;)V
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .param p1, "owner"    # Landroidx/savedstate/SavedStateRegistryOwner;

    .line 53
    sget v0, Landroidx/savedstate/R$id;->view_tree_saved_state_registry_owner:I

    invoke-virtual {p0, v0, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 54
    return-void
.end method
