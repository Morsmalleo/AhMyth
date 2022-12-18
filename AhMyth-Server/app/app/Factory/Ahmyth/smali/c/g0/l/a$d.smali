.class final Lc/g0/l/a$d;
.super Lc/g0/l/a$h;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/g0/l/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "d"
.end annotation


# instance fields
.field private final d:Lc/g0/f/g;


# direct methods
.method constructor <init>(Lc/g0/f/g;)V
    .locals 3

    invoke-virtual {p1}, Lc/g0/f/g;->d()Lc/g0/f/c;

    move-result-object v0

    iget-object v0, v0, Lc/g0/f/c;->i:Ld/e;

    invoke-virtual {p1}, Lc/g0/f/g;->d()Lc/g0/f/c;

    move-result-object v1

    iget-object v1, v1, Lc/g0/f/c;->j:Ld/d;

    const/4 v2, 0x1

    invoke-direct {p0, v2, v0, v1}, Lc/g0/l/a$h;-><init>(ZLd/e;Ld/d;)V

    iput-object p1, p0, Lc/g0/l/a$d;->d:Lc/g0/f/g;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    iget-object v0, p0, Lc/g0/l/a$d;->d:Lc/g0/f/g;

    invoke-virtual {v0}, Lc/g0/f/g;->c()Lc/g0/g/c;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Lc/g0/f/g;->o(ZLc/g0/g/c;)V

    return-void
.end method
