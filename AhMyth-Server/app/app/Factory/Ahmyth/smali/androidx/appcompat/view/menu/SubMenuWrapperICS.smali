.class Landroidx/appcompat/view/menu/SubMenuWrapperICS;
.super Landroidx/appcompat/view/menu/MenuWrapperICS;
.source "SubMenuWrapperICS.java"

# interfaces
.implements Landroid/view/SubMenu;


# instance fields
.field private final mSubMenu:Landroidx/core/internal/view/SupportSubMenu;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroidx/core/internal/view/SupportSubMenu;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "subMenu"    # Landroidx/core/internal/view/SupportSubMenu;

    .line 39
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/view/menu/MenuWrapperICS;-><init>(Landroid/content/Context;Landroidx/core/internal/view/SupportMenu;)V

    .line 40
    iput-object p2, p0, Landroidx/appcompat/view/menu/SubMenuWrapperICS;->mSubMenu:Landroidx/core/internal/view/SupportSubMenu;

    .line 41
    return-void
.end method


# virtual methods
.method public clearHeader()V
    .locals 1

    .line 75
    iget-object v0, p0, Landroidx/appcompat/view/menu/SubMenuWrapperICS;->mSubMenu:Landroidx/core/internal/view/SupportSubMenu;

    invoke-interface {v0}, Landroidx/core/internal/view/SupportSubMenu;->clearHeader()V

    .line 76
    return-void
.end method

.method public getItem()Landroid/view/MenuItem;
    .locals 1

    .line 92
    iget-object v0, p0, Landroidx/appcompat/view/menu/SubMenuWrapperICS;->mSubMenu:Landroidx/core/internal/view/SupportSubMenu;

    invoke-interface {v0}, Landroidx/core/internal/view/SupportSubMenu;->getItem()Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/appcompat/view/menu/SubMenuWrapperICS;->getMenuItemWrapper(Landroid/view/MenuItem;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public setHeaderIcon(I)Landroid/view/SubMenu;
    .locals 1
    .param p1, "iconRes"    # I

    .line 57
    iget-object v0, p0, Landroidx/appcompat/view/menu/SubMenuWrapperICS;->mSubMenu:Landroidx/core/internal/view/SupportSubMenu;

    invoke-interface {v0, p1}, Landroidx/core/internal/view/SupportSubMenu;->setHeaderIcon(I)Landroid/view/SubMenu;

    .line 58
    return-object p0
.end method

.method public setHeaderIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/SubMenu;
    .locals 1
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .line 63
    iget-object v0, p0, Landroidx/appcompat/view/menu/SubMenuWrapperICS;->mSubMenu:Landroidx/core/internal/view/SupportSubMenu;

    invoke-interface {v0, p1}, Landroidx/core/internal/view/SupportSubMenu;->setHeaderIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/SubMenu;

    .line 64
    return-object p0
.end method

.method public setHeaderTitle(I)Landroid/view/SubMenu;
    .locals 1
    .param p1, "titleRes"    # I

    .line 45
    iget-object v0, p0, Landroidx/appcompat/view/menu/SubMenuWrapperICS;->mSubMenu:Landroidx/core/internal/view/SupportSubMenu;

    invoke-interface {v0, p1}, Landroidx/core/internal/view/SupportSubMenu;->setHeaderTitle(I)Landroid/view/SubMenu;

    .line 46
    return-object p0
.end method

.method public setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/SubMenu;
    .locals 1
    .param p1, "title"    # Ljava/lang/CharSequence;

    .line 51
    iget-object v0, p0, Landroidx/appcompat/view/menu/SubMenuWrapperICS;->mSubMenu:Landroidx/core/internal/view/SupportSubMenu;

    invoke-interface {v0, p1}, Landroidx/core/internal/view/SupportSubMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/SubMenu;

    .line 52
    return-object p0
.end method

.method public setHeaderView(Landroid/view/View;)Landroid/view/SubMenu;
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .line 69
    iget-object v0, p0, Landroidx/appcompat/view/menu/SubMenuWrapperICS;->mSubMenu:Landroidx/core/internal/view/SupportSubMenu;

    invoke-interface {v0, p1}, Landroidx/core/internal/view/SupportSubMenu;->setHeaderView(Landroid/view/View;)Landroid/view/SubMenu;

    .line 70
    return-object p0
.end method

.method public setIcon(I)Landroid/view/SubMenu;
    .locals 1
    .param p1, "iconRes"    # I

    .line 80
    iget-object v0, p0, Landroidx/appcompat/view/menu/SubMenuWrapperICS;->mSubMenu:Landroidx/core/internal/view/SupportSubMenu;

    invoke-interface {v0, p1}, Landroidx/core/internal/view/SupportSubMenu;->setIcon(I)Landroid/view/SubMenu;

    .line 81
    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/SubMenu;
    .locals 1
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .line 86
    iget-object v0, p0, Landroidx/appcompat/view/menu/SubMenuWrapperICS;->mSubMenu:Landroidx/core/internal/view/SupportSubMenu;

    invoke-interface {v0, p1}, Landroidx/core/internal/view/SupportSubMenu;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/SubMenu;

    .line 87
    return-object p0
.end method
