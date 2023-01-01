.class Lb/a/d/a/e/a$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/c/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/e/a;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/d/a/e/a;


# direct methods
.method constructor <init>(Lb/a/d/a/e/a;Lb/a/d/a/e/a;)V
    .locals 0

    iput-object p2, p0, Lb/a/d/a/e/a$c;->a:Lb/a/d/a/e/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Object;)V
    .locals 4

    invoke-static {}, Lb/a/d/a/e/a;->v()Ljava/util/logging/Logger;

    move-result-object p1

    const-string v0, "writing close packet"

    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    :try_start_0
    iget-object p1, p0, Lb/a/d/a/e/a$c;->a:Lb/a/d/a/e/a;

    const/4 v0, 0x1

    new-array v0, v0, [Lb/a/d/b/b;

    const/4 v1, 0x0

    new-instance v2, Lb/a/d/b/b;

    const-string v3, "close"

    invoke-direct {v2, v3}, Lb/a/d/b/b;-><init>(Ljava/lang/String;)V

    aput-object v2, v0, v1

    invoke-virtual {p1, v0}, Lb/a/d/a/e/a;->s([Lb/a/d/b/b;)V
    :try_end_0
    .catch Lb/a/j/b; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method
