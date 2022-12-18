.class Lb/a/d/a/e/c$b;
.super Lc/f0;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/e/c;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/d/a/e/c;


# direct methods
.method constructor <init>(Lb/a/d/a/e/c;Lb/a/d/a/e/c;)V
    .locals 0

    iput-object p2, p0, Lb/a/d/a/e/c$b;->a:Lb/a/d/a/e/c;

    invoke-direct {p0}, Lc/f0;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lc/e0;ILjava/lang/String;)V
    .locals 0

    new-instance p1, Lb/a/d/a/e/c$b$d;

    invoke-direct {p1, p0}, Lb/a/d/a/e/c$b$d;-><init>(Lb/a/d/a/e/c$b;)V

    invoke-static {p1}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-void
.end method

.method public c(Lc/e0;Ljava/lang/Throwable;Lc/a0;)V
    .locals 0

    instance-of p1, p2, Ljava/lang/Exception;

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Lb/a/d/a/e/c$b$e;

    invoke-direct {p1, p0, p2}, Lb/a/d/a/e/c$b$e;-><init>(Lb/a/d/a/e/c$b;Ljava/lang/Throwable;)V

    invoke-static {p1}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-void
.end method

.method public d(Lc/e0;Ljava/lang/String;)V
    .locals 0

    if-nez p2, :cond_0

    return-void

    :cond_0
    new-instance p1, Lb/a/d/a/e/c$b$b;

    invoke-direct {p1, p0, p2}, Lb/a/d/a/e/c$b$b;-><init>(Lb/a/d/a/e/c$b;Ljava/lang/String;)V

    invoke-static {p1}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-void
.end method

.method public e(Lc/e0;Ld/f;)V
    .locals 0

    if-nez p2, :cond_0

    return-void

    :cond_0
    new-instance p1, Lb/a/d/a/e/c$b$c;

    invoke-direct {p1, p0, p2}, Lb/a/d/a/e/c$b$c;-><init>(Lb/a/d/a/e/c$b;Ld/f;)V

    invoke-static {p1}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-void
.end method

.method public f(Lc/e0;Lc/a0;)V
    .locals 0

    invoke-virtual {p2}, Lc/a0;->M()Lc/r;

    move-result-object p1

    invoke-virtual {p1}, Lc/r;->f()Ljava/util/Map;

    move-result-object p1

    new-instance p2, Lb/a/d/a/e/c$b$a;

    invoke-direct {p2, p0, p1}, Lb/a/d/a/e/c$b$a;-><init>(Lb/a/d/a/e/c$b;Ljava/util/Map;)V

    invoke-static {p2}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-void
.end method
