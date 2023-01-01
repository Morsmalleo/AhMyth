.class final Lc/v$a;
.super Lc/g0/a;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/v;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lc/g0/a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lc/r$a;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p1, p2}, Lc/r$a;->b(Ljava/lang/String;)Lc/r$a;

    return-void
.end method

.method public b(Lc/r$a;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p1, p2, p3}, Lc/r$a;->c(Ljava/lang/String;Ljava/lang/String;)Lc/r$a;

    return-void
.end method

.method public c(Lc/k;Ljavax/net/ssl/SSLSocket;Z)V
    .locals 0

    invoke-virtual {p1, p2, p3}, Lc/k;->a(Ljavax/net/ssl/SSLSocket;Z)V

    return-void
.end method

.method public d(Lc/j;Lc/g0/f/c;)Z
    .locals 0

    invoke-virtual {p1, p2}, Lc/j;->b(Lc/g0/f/c;)Z

    move-result p1

    return p1
.end method

.method public e(Lc/j;Lc/a;Lc/g0/f/g;)Lc/g0/f/c;
    .locals 0

    invoke-virtual {p1, p2, p3}, Lc/j;->c(Lc/a;Lc/g0/f/g;)Lc/g0/f/c;

    move-result-object p1

    return-object p1
.end method

.method public f(Lc/v;Lc/y;)Lc/e;
    .locals 2

    new-instance v0, Lc/x;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p2, v1}, Lc/x;-><init>(Lc/v;Lc/y;Z)V

    return-object v0
.end method

.method public g(Lc/j;Lc/g0/f/c;)V
    .locals 0

    invoke-virtual {p1, p2}, Lc/j;->e(Lc/g0/f/c;)V

    return-void
.end method

.method public h(Lc/j;)Lc/g0/f/d;
    .locals 0

    iget-object p1, p1, Lc/j;->e:Lc/g0/f/d;

    return-object p1
.end method

.method public i(Lc/e;)Lc/g0/f/g;
    .locals 0

    check-cast p1, Lc/x;

    invoke-virtual {p1}, Lc/x;->g()Lc/g0/f/g;

    move-result-object p1

    return-object p1
.end method
