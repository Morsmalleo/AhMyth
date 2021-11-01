.class Landroid/support/v4/content/res/ResourcesCompat$FontCallback$2;
.super Ljava/lang/Object;
.source "ResourcesCompat.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/content/res/ResourcesCompat$FontCallback;->callbackFailAsync(ILandroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/content/res/ResourcesCompat$FontCallback;

.field final synthetic val$reason:I


# direct methods
.method constructor <init>(Landroid/support/v4/content/res/ResourcesCompat$FontCallback;I)V
    .locals 0

    .line 266
    iput-object p1, p0, Landroid/support/v4/content/res/ResourcesCompat$FontCallback$2;->this$0:Landroid/support/v4/content/res/ResourcesCompat$FontCallback;

    iput p2, p0, Landroid/support/v4/content/res/ResourcesCompat$FontCallback$2;->val$reason:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 269
    iget-object v0, p0, Landroid/support/v4/content/res/ResourcesCompat$FontCallback$2;->this$0:Landroid/support/v4/content/res/ResourcesCompat$FontCallback;

    iget v1, p0, Landroid/support/v4/content/res/ResourcesCompat$FontCallback$2;->val$reason:I

    invoke-virtual {v0, v1}, Landroid/support/v4/content/res/ResourcesCompat$FontCallback;->onFontRetrievalFailed(I)V

    return-void
.end method
