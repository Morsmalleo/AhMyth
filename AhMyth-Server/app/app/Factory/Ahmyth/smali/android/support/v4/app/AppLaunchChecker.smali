.class public Landroid/support/v4/app/AppLaunchChecker;
.super Ljava/lang/Object;
.source "AppLaunchChecker.java"


# static fields
.field private static final KEY_STARTED_FROM_LAUNCHER:Ljava/lang/String; = "startedFromLauncher"

.field private static final SHARED_PREFS_NAME:Ljava/lang/String; = "android.support.AppLaunchChecker"


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hasStartedFromLauncher(Landroid/content/Context;)Z
    .locals 2

    const-string v0, "android.support.AppLaunchChecker"

    const/4 v1, 0x0

    .line 51
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "startedFromLauncher"

    .line 52
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static onActivityCreate(Landroid/app/Activity;)V
    .locals 4

    const-string v0, "android.support.AppLaunchChecker"

    const/4 v1, 0x0

    .line 67
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "startedFromLauncher"

    .line 68
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 72
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    if-nez p0, :cond_1

    return-void

    .line 77
    :cond_1
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v3, "android.intent.action.MAIN"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "android.intent.category.LAUNCHER"

    .line 78
    invoke-virtual {p0, v1}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "android.intent.category.LEANBACK_LAUNCHER"

    .line 79
    invoke-virtual {p0, v1}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 80
    :cond_2
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const/4 v0, 0x1

    invoke-interface {p0, v2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_3
    return-void
.end method
