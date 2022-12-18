.class Lc/g0/i/f$a;
.super Ld/g;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/g0/i/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "a"
.end annotation


# instance fields
.field final synthetic b:Lc/g0/i/f;


# direct methods
.method public constructor <init>(Lc/g0/i/f;Ld/r;)V
    .locals 0

    iput-object p1, p0, Lc/g0/i/f$a;->b:Lc/g0/i/f;

    invoke-direct {p0, p2}, Ld/g;-><init>(Ld/r;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    iget-object v0, p0, Lc/g0/i/f$a;->b:Lc/g0/i/f;

    iget-object v1, v0, Lc/g0/i/f;->b:Lc/g0/f/g;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Lc/g0/f/g;->o(ZLc/g0/g/c;)V

    invoke-super {p0}, Ld/g;->close()V

    return-void
.end method
