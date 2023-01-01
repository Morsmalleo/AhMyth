.class Lb/a/d/a/e/a$e;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/d/b/c$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/e/a;->s([Lb/a/d/b/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lb/a/d/b/c$d<",
        "[B>;"
    }
.end annotation


# instance fields
.field final synthetic a:Lb/a/d/a/e/a;

.field final synthetic b:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lb/a/d/a/e/a;Lb/a/d/a/e/a;Ljava/lang/Runnable;)V
    .locals 0

    iput-object p2, p0, Lb/a/d/a/e/a$e;->a:Lb/a/d/a/e/a;

    iput-object p3, p0, Lb/a/d/a/e/a$e;->b:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, [B

    invoke-virtual {p0, p1}, Lb/a/d/a/e/a$e;->b([B)V

    return-void
.end method

.method public b([B)V
    .locals 2

    iget-object v0, p0, Lb/a/d/a/e/a$e;->a:Lb/a/d/a/e/a;

    iget-object v1, p0, Lb/a/d/a/e/a$e;->b:Ljava/lang/Runnable;

    invoke-virtual {v0, p1, v1}, Lb/a/d/a/e/a;->D([BLjava/lang/Runnable;)V

    return-void
.end method
