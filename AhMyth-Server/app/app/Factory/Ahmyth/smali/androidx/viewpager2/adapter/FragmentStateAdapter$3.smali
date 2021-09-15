.class Landroidx/viewpager2/adapter/FragmentStateAdapter$3;
.super Landroidx/fragment/app/FragmentManager$FragmentLifecycleCallbacks;
.source "FragmentStateAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/viewpager2/adapter/FragmentStateAdapter;->scheduleViewAttach(Landroidx/fragment/app/Fragment;Landroid/widget/FrameLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/viewpager2/adapter/FragmentStateAdapter;

.field final synthetic val$container:Landroid/widget/FrameLayout;

.field final synthetic val$fragment:Landroidx/fragment/app/Fragment;


# direct methods
.method constructor <init>(Landroidx/viewpager2/adapter/FragmentStateAdapter;Landroidx/fragment/app/Fragment;Landroid/widget/FrameLayout;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/viewpager2/adapter/FragmentStateAdapter;

    .line 369
    iput-object p1, p0, Landroidx/viewpager2/adapter/FragmentStateAdapter$3;->this$0:Landroidx/viewpager2/adapter/FragmentStateAdapter;

    iput-object p2, p0, Landroidx/viewpager2/adapter/FragmentStateAdapter$3;->val$fragment:Landroidx/fragment/app/Fragment;

    iput-object p3, p0, Landroidx/viewpager2/adapter/FragmentStateAdapter$3;->val$container:Landroid/widget/FrameLayout;

    invoke-direct {p0}, Landroidx/fragment/app/FragmentManager$FragmentLifecycleCallbacks;-><init>()V

    return-void
.end method


# virtual methods
.method public onFragmentViewCreated(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "fm"    # Landroidx/fragment/app/FragmentManager;
    .param p2, "f"    # Landroidx/fragment/app/Fragment;
    .param p3, "v"    # Landroid/view/View;
    .param p4, "savedInstanceState"    # Landroid/os/Bundle;

    .line 376
    iget-object v0, p0, Landroidx/viewpager2/adapter/FragmentStateAdapter$3;->val$fragment:Landroidx/fragment/app/Fragment;

    if-ne p2, v0, :cond_0

    .line 377
    invoke-virtual {p1, p0}, Landroidx/fragment/app/FragmentManager;->unregisterFragmentLifecycleCallbacks(Landroidx/fragment/app/FragmentManager$FragmentLifecycleCallbacks;)V

    .line 378
    iget-object v0, p0, Landroidx/viewpager2/adapter/FragmentStateAdapter$3;->this$0:Landroidx/viewpager2/adapter/FragmentStateAdapter;

    iget-object v1, p0, Landroidx/viewpager2/adapter/FragmentStateAdapter$3;->val$container:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p3, v1}, Landroidx/viewpager2/adapter/FragmentStateAdapter;->addViewToContainer(Landroid/view/View;Landroid/widget/FrameLayout;)V

    .line 380
    :cond_0
    return-void
.end method
