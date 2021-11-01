.class Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat$AccessibilityNodeProviderApi19;
.super Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat$AccessibilityNodeProviderApi16;
.source "AccessibilityNodeProviderCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AccessibilityNodeProviderApi19"
.end annotation


# direct methods
.method constructor <init>(Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat;)V
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat$AccessibilityNodeProviderApi16;-><init>(Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat;)V

    return-void
.end method


# virtual methods
.method public findFocus(I)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 1

    .line 85
    iget-object v0, p0, Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat$AccessibilityNodeProviderApi19;->mCompat:Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat;

    invoke-virtual {v0, p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat;->findFocus(I)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 89
    :cond_0
    invoke-virtual {p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->unwrap()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1

    return-object p1
.end method
