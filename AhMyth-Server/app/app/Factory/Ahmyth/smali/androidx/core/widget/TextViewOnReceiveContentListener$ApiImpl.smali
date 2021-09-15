.class final Landroidx/core/widget/TextViewOnReceiveContentListener$ApiImpl;
.super Ljava/lang/Object;
.source "TextViewOnReceiveContentListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/widget/TextViewOnReceiveContentListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ApiImpl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static coerce(Landroid/content/Context;Landroid/content/ClipData$Item;I)Ljava/lang/CharSequence;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "item"    # Landroid/content/ClipData$Item;
    .param p2, "flags"    # I

    .line 157
    invoke-virtual {p1, p0}, Landroid/content/ClipData$Item;->coerceToText(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 158
    .local v0, "text":Ljava/lang/CharSequence;
    and-int/lit8 v1, p2, 0x1

    if-eqz v1, :cond_0

    instance-of v1, v0, Landroid/text/Spanned;

    if-eqz v1, :cond_0

    .line 159
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 161
    :cond_0
    return-object v0
.end method
