.class final Lc/g0/i/g$i$a;
.super Lc/g0/i/g$i;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/g0/i/g$i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lc/g0/i/g$i;-><init>()V

    return-void
.end method


# virtual methods
.method public c(Lc/g0/i/i;)V
    .locals 1

    sget-object v0, Lc/g0/i/b;->f:Lc/g0/i/b;

    invoke-virtual {p1, v0}, Lc/g0/i/i;->d(Lc/g0/i/b;)V

    return-void
.end method
