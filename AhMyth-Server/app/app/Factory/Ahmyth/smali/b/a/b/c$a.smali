.class Lb/a/b/c$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/b/c;->V(Lb/a/b/c$n;)Lb/a/b/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/b/c$n;

.field final synthetic b:Lb/a/b/c;


# direct methods
.method constructor <init>(Lb/a/b/c;Lb/a/b/c$n;)V
    .locals 0

    iput-object p1, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    iput-object p2, p0, Lb/a/b/c$a;->a:Lb/a/b/c$n;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    invoke-static {}, Lb/a/b/c;->h()Ljava/util/logging/Logger;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    iget-object v3, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    iget-object v3, v3, Lb/a/b/c;->b:Lb/a/b/c$p;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "readyState %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object v0, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    iget-object v0, v0, Lb/a/b/c;->b:Lb/a/b/c$p;

    sget-object v2, Lb/a/b/c$p;->c:Lb/a/b/c$p;

    if-eq v0, v2, :cond_2

    sget-object v2, Lb/a/b/c$p;->b:Lb/a/b/c$p;

    if-ne v0, v2, :cond_0

    goto/16 :goto_0

    :cond_0
    invoke-static {}, Lb/a/b/c;->h()Ljava/util/logging/Logger;

    move-result-object v0

    new-array v3, v1, [Ljava/lang/Object;

    iget-object v5, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    invoke-static {v5}, Lb/a/b/c;->i(Lb/a/b/c;)Ljava/net/URI;

    move-result-object v5

    aput-object v5, v3, v4

    const-string v5, "opening %s"

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object v0, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    new-instance v3, Lb/a/b/c$m;

    iget-object v5, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    invoke-static {v5}, Lb/a/b/c;->i(Lb/a/b/c;)Ljava/net/URI;

    move-result-object v5

    iget-object v6, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    invoke-static {v6}, Lb/a/b/c;->t(Lb/a/b/c;)Lb/a/b/c$o;

    move-result-object v6

    invoke-direct {v3, v5, v6}, Lb/a/b/c$m;-><init>(Ljava/net/URI;Lb/a/d/a/c$u;)V

    iput-object v3, v0, Lb/a/b/c;->s:Lb/a/d/a/c;

    iget-object v13, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    iget-object v12, v13, Lb/a/b/c;->s:Lb/a/d/a/c;

    iput-object v2, v13, Lb/a/b/c;->b:Lb/a/b/c$p;

    invoke-static {v13, v4}, Lb/a/b/c;->z(Lb/a/b/c;Z)Z

    new-instance v0, Lb/a/b/c$a$a;

    invoke-direct {v0, p0, v13}, Lb/a/b/c$a$a;-><init>(Lb/a/b/c$a;Lb/a/b/c;)V

    const-string v2, "transport"

    invoke-virtual {v12, v2, v0}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    new-instance v0, Lb/a/b/c$a$b;

    invoke-direct {v0, p0, v13}, Lb/a/b/c$a$b;-><init>(Lb/a/b/c$a;Lb/a/b/c;)V

    const-string v2, "open"

    invoke-static {v12, v2, v0}, Lb/a/b/d;->a(Lb/a/c/a;Ljava/lang/String;Lb/a/c/a$a;)Lb/a/b/d$b;

    move-result-object v0

    new-instance v2, Lb/a/b/c$a$c;

    invoke-direct {v2, p0, v13}, Lb/a/b/c$a$c;-><init>(Lb/a/b/c$a;Lb/a/b/c;)V

    const-string v3, "error"

    invoke-static {v12, v3, v2}, Lb/a/b/d;->a(Lb/a/c/a;Ljava/lang/String;Lb/a/c/a$a;)Lb/a/b/d$b;

    move-result-object v2

    iget-object v3, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    invoke-static {v3}, Lb/a/b/c;->E(Lb/a/b/c;)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v3, v5, v7

    if-ltz v3, :cond_1

    iget-object v3, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    invoke-static {v3}, Lb/a/b/c;->E(Lb/a/b/c;)J

    move-result-wide v5

    invoke-static {}, Lb/a/b/c;->h()Ljava/util/logging/Logger;

    move-result-object v3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v1, v4

    const-string v4, "connection attempt will timeout after %d"

    invoke-static {v4, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    new-instance v3, Lb/a/b/c$a$d;

    move-object v7, v3

    move-object v8, p0

    move-wide v9, v5

    move-object v11, v0

    invoke-direct/range {v7 .. v13}, Lb/a/b/c$a$d;-><init>(Lb/a/b/c$a;JLb/a/b/d$b;Lb/a/d/a/c;Lb/a/b/c;)V

    invoke-virtual {v1, v3, v5, v6}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    iget-object v3, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    invoke-static {v3}, Lb/a/b/c;->F(Lb/a/b/c;)Ljava/util/Queue;

    move-result-object v3

    new-instance v4, Lb/a/b/c$a$e;

    invoke-direct {v4, p0, v1}, Lb/a/b/c$a$e;-><init>(Lb/a/b/c$a;Ljava/util/Timer;)V

    invoke-interface {v3, v4}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    :cond_1
    iget-object v1, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    invoke-static {v1}, Lb/a/b/c;->F(Lb/a/b/c;)Ljava/util/Queue;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    invoke-static {v0}, Lb/a/b/c;->F(Lb/a/b/c;)Ljava/util/Queue;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lb/a/b/c$a;->b:Lb/a/b/c;

    iget-object v0, v0, Lb/a/b/c;->s:Lb/a/d/a/c;

    invoke-virtual {v0}, Lb/a/d/a/c;->R()Lb/a/d/a/c;

    :cond_2
    :goto_0
    return-void
.end method
