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

    .line 73
    iput-object p1, p0, Lahmyth/mine/king/ahmyth/MainActivity$1;->this$0:Lahmyth/mine/king/ahmyth/MainActivity;

    iput-object p2, p0, Lahmyth/mine/king/ahmyth/MainActivity$1;->val$appSettingEditor:Landroid/content/SharedPreferences$Editor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 77
    iget-object p1, p0, Lahmyth/mine/king/ahmyth/MainActivity$1;->val$appSettingEditor:Landroid/content/SharedPreferences$Editor;

    const-string v0, "hidden_status"

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 78
    iget-object p1, p0, Lahmyth/mine/king/ahmyth/MainActivity$1;->val$appSettingEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method
