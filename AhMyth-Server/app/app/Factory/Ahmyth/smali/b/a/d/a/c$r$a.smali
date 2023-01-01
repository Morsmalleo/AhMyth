.class Lb/a/d/a/c$r$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/c/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/c$r;->a([Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/d/a/c$r;


# direct methods
.method constructor <init>(Lb/a/d/a/c$r;)V
    .locals 0

    iput-object p1, p0, Lb/a/d/a/c$r$a;->a:Lb/a/d/a/c$r;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Object;)V
    .locals 4

    iget-object v0, p0, Lb/a/d/a/c$r$a;->a:Lb/a/d/a/c$r;

    iget-object v0, v0, Lb/a/d/a/c$r;->a:[Z

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_0

    return-void

    :cond_0
    aget-object p1, p1, v1

    check-cast p1, Lb/a/d/b/b;

    iget-object v0, p1, Lb/a/d/b/b;->a:Ljava/lang/String;

    const-string v2, "pong"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    iget-object p1, p1, Lb/a/d/b/b;->b:Ljava/lang/Object;

    const-string v0, "probe"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {}, Lb/a/d/a/c;->k()Ljava/util/logging/Logger;

    move-result-object p1

    new-array v0, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lb/a/d/a/c$r$a;->a:Lb/a/d/a/c$r;

    iget-object v3, v3, Lb/a/d/a/c$r;->b:Ljava/lang/String;

    aput-object v3, v0, v1

    const-string v3, "probe transport \'%s\' pong"

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object p1, p0, Lb/a/d/a/c$r$a;->a:Lb/a/d/a/c$r;

    iget-object p1, p1, Lb/a/d/a/c$r;->d:Lb/a/d/a/c;

    invoke-static {p1, v2}, Lb/a/d/a/c;->m(Lb/a/d/a/c;Z)Z

    iget-object p1, p0, Lb/a/d/a/c$r$a;->a:Lb/a/d/a/c$r;

    iget-object v0, p1, Lb/a/d/a/c$r;->d:Lb/a/d/a/c;

    new-array v3, v2, [Ljava/lang/Object;

    iget-object p1, p1, Lb/a/d/a/c$r;->c:[Lb/a/d/a/d;

    aget-object p1, p1, v1

    aput-object p1, v3, v1

    const-string p1, "upgrading"

    invoke-virtual {v0, p1, v3}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    iget-object p1, p0, Lb/a/d/a/c$r$a;->a:Lb/a/d/a/c$r;

    iget-object p1, p1, Lb/a/d/a/c$r;->c:[Lb/a/d/a/d;

    aget-object v0, p1, v1

    if-nez v0, :cond_1

    return-void

    :cond_1
    aget-object p1, p1, v1

    iget-object p1, p1, Lb/a/d/a/d;->c:Ljava/lang/String;

    const-string v0, "websocket"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    invoke-static {p1}, Lb/a/d/a/c;->v(Z)Z

    invoke-static {}, Lb/a/d/a/c;->k()Ljava/util/logging/Logger;

    move-result-object p1

    new-array v0, v2, [Ljava/lang/Object;

    iget-object v2, p0, Lb/a/d/a/c$r$a;->a:Lb/a/d/a/c$r;

    iget-object v2, v2, Lb/a/d/a/c$r;->d:Lb/a/d/a/c;

    iget-object v2, v2, Lb/a/d/a/c;->t:Lb/a/d/a/d;

    iget-object v2, v2, Lb/a/d/a/d;->c:Ljava/lang/String;

    aput-object v2, v0, v1

    const-string v1, "pausing current transport \'%s\'"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object p1, p0, Lb/a/d/a/c$r$a;->a:Lb/a/d/a/c$r;

    iget-object p1, p1, Lb/a/d/a/c$r;->d:Lb/a/d/a/c;

    iget-object p1, p1, Lb/a/d/a/c;->t:Lb/a/d/a/d;

    check-cast p1, Lb/a/d/a/e/a;

    new-instance v0, Lb/a/d/a/c$r$a$a;

    invoke-direct {v0, p0}, Lb/a/d/a/c$r$a$a;-><init>(Lb/a/d/a/c$r$a;)V

    invoke-virtual {p1, v0}, Lb/a/d/a/e/a;->E(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_2
    invoke-static {}, Lb/a/d/a/c;->k()Ljava/util/logging/Logger;

    move-result-object p1

    new-array v0, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lb/a/d/a/c$r$a;->a:Lb/a/d/a/c$r;

    iget-object v3, v3, Lb/a/d/a/c$r;->b:Ljava/lang/String;

    aput-object v3, v0, v1

    const-string v3, "probe transport \'%s\' failed"

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    new-instance p1, Lb/a/d/a/a;

    const-string v0, "probe error"

    invoke-direct {p1, v0}, Lb/a/d/a/a;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lb/a/d/a/c$r$a;->a:Lb/a/d/a/c$r;

    iget-object v3, v0, Lb/a/d/a/c$r;->c:[Lb/a/d/a/d;

    aget-object v3, v3, v1

    iget-object v3, v3, Lb/a/d/a/d;->c:Ljava/lang/String;

    iget-object v0, v0, Lb/a/d/a/c$r;->d:Lb/a/d/a/c;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v1

    const-string p1, "upgradeError"

    invoke-virtual {v0, p1, v2}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    :goto_0
    return-void
.end method
