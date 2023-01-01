.class Lb/a/b/c$a$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/c/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/b/c$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/b/c;

.field final synthetic b:Lb/a/b/c$a;


# direct methods
.method constructor <init>(Lb/a/b/c$a;Lb/a/b/c;)V
    .locals 0

    iput-object p1, p0, Lb/a/b/c$a$c;->b:Lb/a/b/c$a;

    iput-object p2, p0, Lb/a/b/c$a$c;->a:Lb/a/b/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Object;)V
    .locals 5

    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-lez v0, :cond_0

    aget-object p1, p1, v1

    goto :goto_0

    :cond_0
    move-object p1, v2

    :goto_0
    invoke-static {}, Lb/a/b/c;->h()Ljava/util/logging/Logger;

    move-result-object v0

    const-string v3, "connect_error"

    invoke-virtual {v0, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object v0, p0, Lb/a/b/c$a$c;->a:Lb/a/b/c;

    invoke-static {v0}, Lb/a/b/c;->B(Lb/a/b/c;)V

    iget-object v0, p0, Lb/a/b/c$a$c;->a:Lb/a/b/c;

    sget-object v4, Lb/a/b/c$p;->a:Lb/a/b/c$p;

    iput-object v4, v0, Lb/a/b/c;->b:Lb/a/b/c$p;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v1

    invoke-static {v0, v3, v4}, Lb/a/b/c;->C(Lb/a/b/c;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lb/a/b/c$a$c;->b:Lb/a/b/c$a;

    iget-object v0, v0, Lb/a/b/c$a;->a:Lb/a/b/c$n;

    if-eqz v0, :cond_2

    new-instance v0, Lb/a/b/f;

    instance-of v1, p1, Ljava/lang/Exception;

    if-eqz v1, :cond_1

    move-object v2, p1

    check-cast v2, Ljava/lang/Exception;

    :cond_1
    const-string p1, "Connection error"

    invoke-direct {v0, p1, v2}, Lb/a/b/f;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object p1, p0, Lb/a/b/c$a$c;->b:Lb/a/b/c$a;

    iget-object p1, p1, Lb/a/b/c$a;->a:Lb/a/b/c$n;

    invoke-interface {p1, v0}, Lb/a/b/c$n;->a(Ljava/lang/Exception;)V

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lb/a/b/c$a$c;->a:Lb/a/b/c;

    invoke-static {p1}, Lb/a/b/c;->D(Lb/a/b/c;)V

    :goto_1
    return-void
.end method
