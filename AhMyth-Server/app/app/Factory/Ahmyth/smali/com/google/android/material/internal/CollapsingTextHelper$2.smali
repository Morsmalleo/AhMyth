.class Lcom/google/android/material/internal/CollapsingTextHelper$2;
.super Ljava/lang/Object;
.source "CollapsingTextHelper.java"

# interfaces
.implements Lcom/google/android/material/resources/CancelableFontCallback$ApplyFont;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/internal/CollapsingTextHelper;->setExpandedTextAppearance(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/material/internal/CollapsingTextHelper;


# direct methods
.method constructor <init>(Lcom/google/android/material/internal/CollapsingTextHelper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 417
    iput-object p1, p0, Lcom/google/android/material/internal/CollapsingTextHelper$2;->this$0:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Landroid/graphics/Typeface;)V
    .locals 1
    .param p1, "font"    # Landroid/graphics/Typeface;

    .line 420
    iget-object v0, p0, Lcom/google/android/material/internal/CollapsingTextHelper$2;->this$0:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Lcom/google/android/material/internal/CollapsingTextHelper;->setExpandedTypeface(Landroid/graphics/Typeface;)V

    .line 421
    return-void
.end method
