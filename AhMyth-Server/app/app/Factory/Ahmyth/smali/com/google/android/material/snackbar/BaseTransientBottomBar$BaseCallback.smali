.class public abstract Lcom/google/android/material/snackbar/BaseTransientBottomBar$BaseCallback;
.super Ljava/lang/Object;
.source "BaseTransientBottomBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/snackbar/BaseTransientBottomBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BaseCallback"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/snackbar/BaseTransientBottomBar$BaseCallback$DismissEvent;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<B:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final DISMISS_EVENT_ACTION:I = 0x1

.field public static final DISMISS_EVENT_CONSECUTIVE:I = 0x4

.field public static final DISMISS_EVENT_MANUAL:I = 0x3

.field public static final DISMISS_EVENT_SWIPE:I = 0x0

.field public static final DISMISS_EVENT_TIMEOUT:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 119
    .local p0, "this":Lcom/google/android/material/snackbar/BaseTransientBottomBar$BaseCallback;, "Lcom/google/android/material/snackbar/BaseTransientBottomBar$BaseCallback<TB;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismissed(Ljava/lang/Object;I)V
    .locals 0
    .param p2, "event"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TB;I)V"
        }
    .end annotation

    .line 159
    .local p0, "this":Lcom/google/android/material/snackbar/BaseTransientBottomBar$BaseCallback;, "Lcom/google/android/material/snackbar/BaseTransientBottomBar$BaseCallback<TB;>;"
    .local p1, "transientBottomBar":Ljava/lang/Object;, "TB;"
    return-void
.end method

.method public onShown(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TB;)V"
        }
    .end annotation

    .line 169
    .local p0, "this":Lcom/google/android/material/snackbar/BaseTransientBottomBar$BaseCallback;, "Lcom/google/android/material/snackbar/BaseTransientBottomBar$BaseCallback<TB;>;"
    .local p1, "transientBottomBar":Ljava/lang/Object;, "TB;"
    return-void
.end method
