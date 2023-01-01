.class Lb/a/b/c$m;
.super Lb/a/d/a/c;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/a/b/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "m"
.end annotation


# direct methods
.method constructor <init>(Ljava/net/URI;Lb/a/d/a/c$u;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lb/a/d/a/c;-><init>(Ljava/net/URI;Lb/a/d/a/c$u;)V

    return-void
.end method
