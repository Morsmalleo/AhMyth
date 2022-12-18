.class Lb/a/d/a/e/a$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/d/b/c$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/e/a;->t(Ljava/lang/Object;)V
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

    iput-object p2, p0, Lb/a/d/a/e/a$b;->a:Lb/a/d/a/e/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/a/d/b/b;II)Z
    .locals 0

    iget-object p2, p0, Lb/a/d/a/e/a$b;->a:Lb/a/d/a/e/a;

    invoke-static {p2}, Lb/a/d/a/e/a;->y(Lb/a/d/a/e/a;)Lb/a/d/a/d$e;

    move-result-object p2

    sget-object p3, Lb/a/d/a/d$e;->a:Lb/a/d/a/d$e;

    if-ne p2, p3, :cond_0

    iget-object p2, p0, Lb/a/d/a/e/a$b;->a:Lb/a/d/a/e/a;

    invoke-static {p2}, Lb/a/d/a/e/a;->z(Lb/a/d/a/e/a;)V

    :cond_0
    iget-object p2, p1, Lb/a/d/b/b;->a:Ljava/lang/String;

    const-string p3, "close"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p1, p0, Lb/a/d/a/e/a$b;->a:Lb/a/d/a/e/a;

    invoke-static {p1}, Lb/a/d/a/e/a;->A(Lb/a/d/a/e/a;)V

    const/4 p1, 0x0

    return p1

    :cond_1
    iget-object p2, p0, Lb/a/d/a/e/a$b;->a:Lb/a/d/a/e/a;

    invoke-static {p2, p1}, Lb/a/d/a/e/a;->B(Lb/a/d/a/e/a;Lb/a/d/b/b;)V

    const/4 p1, 0x1

    return p1
.end method
