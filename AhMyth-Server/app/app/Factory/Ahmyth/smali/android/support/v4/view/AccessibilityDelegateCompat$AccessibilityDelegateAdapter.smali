.class final Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateAdapter;
.super Landroid/view/View$AccessibilityDelegate;
.source "AccessibilityDelegateCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/AccessibilityDelegateCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AccessibilityDelegateAdapter"
.end annotation


# instance fields
.field private final mCompat:Landroid/support/v4/view/AccessibilityDelegateCompat;


# direct methods
.method constructor <init>(Landroid/support/v4/view/AccessibilityDelegateCompat;)V
    .locals 0

    .line 52
    invoke-direct {p0}, Landroid/view/View$AccessibilityDelegate;-><init>()V

    .line 53
    iput-object p1, p0, Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateAdapter;->mCompat:Landroid/support/v4/view/AccessibilityDelegateCompat;

    return-void
.end method


# virtual methods
.method public dispatchPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1

    .line 59
    iget-object v0, p0, Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateAdapter;->mCompat:Landroid/support/v4/view/AccessibilityDelegateCompat;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/view/AccessibilityDelegateCompat;->dispatchPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public getAccessibilityNodeProvider(Landroid/view/View;)Landroid/view/accessibility/AccessibilityNodeProvider;
    .locals 1

    .line 98
    iget-object v0, p0, Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateAdapter;->mCompat:Landroid/support/v4/view/AccessibilityDelegateCompat;

    .line 99
    invoke-virtual {v0, p1}, Landroid/support/v4/view/AccessibilityDelegateCompat;->getAccessibilityNodeProvider(Landroid/view/View;)Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 101
    invoke-virtual {p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat;->getProvider()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/accessibility/AccessibilityNodeProvider;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1

    .line 64
    iget-object v0, p0, Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateAdapter;->mCompat:Landroid/support/v4/view/AccessibilityDelegateCompat;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/view/AccessibilityDelegateCompat;->onInitializeAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1

    .line 70
    iget-object v0, p0, Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateAdapter;->mCompat:Landroid/support/v4/view/AccessibilityDelegateCompat;

    .line 71
    invoke-static {p2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->wrap(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object p2

    .line 70
    invoke-virtual {v0, p1, p2}, Landroid/support/v4/view/AccessibilityDelegateCompat;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V

    return-void
.end method

.method public onPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1

    .line 76
    iget-object v0, p0, Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateAdapter;->mCompat:Landroid/support/v4/view/AccessibilityDelegateCompat;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/view/AccessibilityDelegateCompat;->onPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    return-void
.end method

.method public onRequestSendAccessibilityEvent(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1

    .line 82
    iget-object v0, p0, Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateAdapter;->mCompat:Landroid/support/v4/view/AccessibilityDelegateCompat;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/view/AccessibilityDelegateCompat;->onRequestSendAccessibilityEvent(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z
    .locals 1

    .line 106
    iget-object v0, p0, Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateAdapter;->mCompat:Landroid/support/v4/view/AccessibilityDelegateCompat;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/view/AccessibilityDelegateCompat;->performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z

    move-result p1

    return p1
.end method

.method public sendAccessibilityEvent(Landroid/view/View;I)V
    .locals 1

    .line 87
    iget-object v0, p0, Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateAdapter;->mCompat:Landroid/support/v4/view/AccessibilityDelegateCompat;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/view/AccessibilityDelegateCompat;->sendAccessibilityEvent(Landroid/view/View;I)V

    return-void
.end method

.method public sendAccessibilityEventUnchecked(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1

    .line 92
    iget-object v0, p0, Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateAdapter;->mCompat:Landroid/support/v4/view/AccessibilityDelegateCompat;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/view/AccessibilityDelegateCompat;->sendAccessibilityEventUnchecked(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    return-void
.end method
