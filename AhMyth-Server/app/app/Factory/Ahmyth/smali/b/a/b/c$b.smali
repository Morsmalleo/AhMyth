.class Lb/a/b/c$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/h/c$c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/b/c;->W(Lb/a/h/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/b/c;


# direct methods
.method constructor <init>(Lb/a/b/c;Lb/a/b/c;)V
    .locals 0

    iput-object p2, p0, Lb/a/b/c$b;->a:Lb/a/b/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a([Ljava/lang/Object;)V
    .locals 5

    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    aget-object v3, p1, v2

    instance-of v4, v3, Ljava/lang/String;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lb/a/b/c$b;->a:Lb/a/b/c;

    iget-object v4, v4, Lb/a/b/c;->s:Lb/a/d/a/c;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lb/a/d/a/c;->c0(Ljava/lang/String;)V

    goto :goto_1

    :cond_0
    instance-of v4, v3, [B

    if-eqz v4, :cond_1

    iget-object v4, p0, Lb/a/b/c$b;->a:Lb/a/b/c;

    iget-object v4, v4, Lb/a/b/c;->s:Lb/a/d/a/c;

    check-cast v3, [B

    invoke-virtual {v4, v3}, Lb/a/d/a/c;->e0([B)V

    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lb/a/b/c$b;->a:Lb/a/b/c;

    invoke-static {p1, v1}, Lb/a/b/c;->r(Lb/a/b/c;Z)Z

    iget-object p1, p0, Lb/a/b/c$b;->a:Lb/a/b/c;

    invoke-static {p1}, Lb/a/b/c;->s(Lb/a/b/c;)V

    return-void
.end method
