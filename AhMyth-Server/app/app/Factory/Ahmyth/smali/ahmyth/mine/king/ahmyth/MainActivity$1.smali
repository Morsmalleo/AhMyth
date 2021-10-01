.class Lahmyth/mine/king/ahmyth/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lahmyth/mine/king/ahmyth/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lahmyth/mine/king/ahmyth/MainActivity;

.field final synthetic val$appSettingEditor:Landroid/content/SharedPreferences$Editor;


# direct methods
.method constructor <init>(Lahmyth/mine/king/ahmyth/MainActivity;Landroid/content/SharedPreferences$Editor;)V
    .locals 0
    .param p1, "this$0"    # Lahmyth/mine/king/ahmyth/MainActivity;

    .line 77
    iput-object p1, p0, Lahmyth/mine/king/ahmyth/MainActivity$1;->this$0:Lahmyth/mine/king/ahmyth/MainActivity;

    iput-object p2, p0, Lahmyth/mine/king/ahmyth/MainActivity$1;->val$appSettingEditor:Landroid/content/SharedPreferences$Editor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .line 81
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/MainActivity$1;->val$appSettingEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "hidden_status"

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 82
    iget-object v0, p0, Lahmyth/mine/king/ahmyth/MainActivity$1;->val$appSettingEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 83
    return-void
.end method
