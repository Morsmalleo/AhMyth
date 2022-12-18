.class Lb/a/d/a/c$t;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/c/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/c;->T(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:[Lb/a/d/a/d;

.field final synthetic b:Lb/a/c/a$a;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Lb/a/d/a/c;


# direct methods
.method constructor <init>(Lb/a/d/a/c;[Lb/a/d/a/d;Lb/a/c/a$a;Ljava/lang/String;Lb/a/d/a/c;)V
    .locals 0

    iput-object p2, p0, Lb/a/d/a/c$t;->a:[Lb/a/d/a/d;

    iput-object p3, p0, Lb/a/d/a/c$t;->b:Lb/a/c/a$a;

    iput-object p4, p0, Lb/a/d/a/c$t;->c:Ljava/lang/String;

    iput-object p5, p0, Lb/a/d/a/c$t;->d:Lb/a/d/a/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Object;)V
    .locals 5

    const/4 v0, 0x0

    aget-object p1, p1, v0

    instance-of v1, p1, Ljava/lang/Exception;

    const-string v2, "probe error"

    if-eqz v1, :cond_0

    new-instance v1, Lb/a/d/a/a;

    move-object v3, p1

    check-cast v3, Ljava/lang/Exception;

    invoke-direct {v1, v2, v3}, Lb/a/d/a/a;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_1

    new-instance v1, Lb/a/d/a/a;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "probe error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v3, p1

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lb/a/d/a/a;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    new-instance v1, Lb/a/d/a/a;

    invoke-direct {v1, v2}, Lb/a/d/a/a;-><init>(Ljava/lang/String;)V

    :goto_0
    iget-object v2, p0, Lb/a/d/a/c$t;->a:[Lb/a/d/a/d;

    aget-object v2, v2, v0

    iget-object v2, v2, Lb/a/d/a/d;->c:Ljava/lang/String;

    iget-object v2, p0, Lb/a/d/a/c$t;->b:Lb/a/c/a$a;

    new-array v3, v0, [Ljava/lang/Object;

    invoke-interface {v2, v3}, Lb/a/c/a$a;->a([Ljava/lang/Object;)V

    invoke-static {}, Lb/a/d/a/c;->k()Ljava/util/logging/Logger;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lb/a/d/a/c$t;->c:Ljava/lang/String;

    aput-object v4, v3, v0

    const/4 v4, 0x1

    aput-object p1, v3, v4

    const-string p1, "probe transport \"%s\" failed because of error: %s"

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object p1, p0, Lb/a/d/a/c$t;->d:Lb/a/d/a/c;

    new-array v2, v4, [Ljava/lang/Object;

    aput-object v1, v2, v0

    const-string v0, "upgradeError"

    invoke-virtual {p1, v0, v2}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method
