.class public final Landroidx/core/os/MessageCompat;
.super Ljava/lang/Object;
.source "MessageCompat.java"


# static fields
.field private static sTryIsAsynchronous:Z

.field private static sTrySetAsynchronous:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    const/4 v0, 0x1

    sput-boolean v0, Landroidx/core/os/MessageCompat;->sTrySetAsynchronous:Z

    .line 39
    sput-boolean v0, Landroidx/core/os/MessageCompat;->sTryIsAsynchronous:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    return-void
.end method

.method public static isAsynchronous(Landroid/os/Message;)Z
    .locals 3
    .param p0, "message"    # Landroid/os/Message;

    .line 97
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x16

    if-lt v0, v1, :cond_0

    .line 98
    invoke-virtual {p0}, Landroid/os/Message;->isAsynchronous()Z

    move-result v0

    return v0

    .line 100
    :cond_0
    sget-boolean v0, Landroidx/core/os/MessageCompat;->sTryIsAsynchronous:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v0, v2, :cond_1

    .line 104
    :try_start_0
    invoke-virtual {p0}, Landroid/os/Message;->isAsynchronous()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 105
    :catch_0
    move-exception v0

    .line 106
    .local v0, "e":Ljava/lang/NoSuchMethodError;
    sput-boolean v1, Landroidx/core/os/MessageCompat;->sTryIsAsynchronous:Z

    .line 109
    .end local v0    # "e":Ljava/lang/NoSuchMethodError;
    :cond_1
    return v1
.end method

.method public static setAsynchronous(Landroid/os/Message;Z)V
    .locals 2
    .param p0, "message"    # Landroid/os/Message;
    .param p1, "async"    # Z

    .line 71
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x16

    if-lt v0, v1, :cond_0

    .line 72
    invoke-virtual {p0, p1}, Landroid/os/Message;->setAsynchronous(Z)V

    .line 73
    return-void

    .line 75
    :cond_0
    sget-boolean v0, Landroidx/core/os/MessageCompat;->sTrySetAsynchronous:Z

    if-eqz v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    .line 79
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/os/Message;->setAsynchronous(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    goto :goto_0

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Ljava/lang/NoSuchMethodError;
    const/4 v1, 0x0

    sput-boolean v1, Landroidx/core/os/MessageCompat;->sTrySetAsynchronous:Z

    .line 84
    .end local v0    # "e":Ljava/lang/NoSuchMethodError;
    :cond_1
    :goto_0
    return-void
.end method
