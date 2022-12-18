.class Lb/a/d/a/c$p;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/c/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/c;->b0(Lb/a/d/a/d;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/d/a/c;


# direct methods
.method constructor <init>(Lb/a/d/a/c;Lb/a/d/a/c;)V
    .locals 0

    iput-object p2, p0, Lb/a/d/a/c$p;->a:Lb/a/d/a/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lb/a/d/a/c$p;->a:Lb/a/d/a/c;

    array-length v1, p1

    if-lez v1, :cond_0

    const/4 v1, 0x0

    aget-object p1, p1, v1

    check-cast p1, Lb/a/d/b/b;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-static {v0, p1}, Lb/a/d/a/c;->i(Lb/a/d/a/c;Lb/a/d/b/b;)V

    return-void
.end method
