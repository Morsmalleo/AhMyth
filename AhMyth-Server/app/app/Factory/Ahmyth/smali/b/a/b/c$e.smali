.class Lb/a/b/c$e;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/c/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/b/c;->Q()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/b/c;


# direct methods
.method constructor <init>(Lb/a/b/c;)V
    .locals 0

    iput-object p1, p0, Lb/a/b/c$e;->a:Lb/a/b/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x0

    aget-object p1, p1, v0

    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lb/a/b/c$e;->a:Lb/a/b/c;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1}, Lb/a/b/c;->j(Lb/a/b/c;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    instance-of v0, p1, [B

    if-eqz v0, :cond_1

    iget-object v0, p0, Lb/a/b/c$e;->a:Lb/a/b/c;

    check-cast p1, [B

    invoke-static {v0, p1}, Lb/a/b/c;->k(Lb/a/b/c;[B)V

    :cond_1
    :goto_0
    return-void
.end method
