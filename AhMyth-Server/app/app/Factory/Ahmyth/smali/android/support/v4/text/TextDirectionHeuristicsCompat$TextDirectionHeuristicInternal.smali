.class Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;
.super Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicImpl;
.source "TextDirectionHeuristicsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/text/TextDirectionHeuristicsCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TextDirectionHeuristicInternal"
.end annotation


# instance fields
.field private final mDefaultIsRtl:Z


# direct methods
.method constructor <init>(Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionAlgorithm;Z)V
    .locals 0

    .line 156
    invoke-direct {p0, p1}, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicImpl;-><init>(Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionAlgorithm;)V

    .line 157
    iput-boolean p2, p0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;->mDefaultIsRtl:Z

    return-void
.end method


# virtual methods
.method protected defaultIsRtl()Z
    .locals 1

    .line 162
    iget-boolean v0, p0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicInternal;->mDefaultIsRtl:Z

    return v0
.end method
