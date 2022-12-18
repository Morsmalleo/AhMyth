.class Lb/a/h/c$a;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/a/h/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field public a:Lb/a/h/b;

.field b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lb/a/h/b;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb/a/h/c$a;->a:Lb/a/h/b;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lb/a/h/c$a;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lb/a/h/c$a;->a:Lb/a/h/b;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/a/h/c$a;->b:Ljava/util/List;

    return-void
.end method

.method public b([B)Lb/a/h/b;
    .locals 2

    iget-object v0, p0, Lb/a/h/c$a;->b:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lb/a/h/c$a;->b:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iget-object v0, p0, Lb/a/h/c$a;->a:Lb/a/h/b;

    iget v1, v0, Lb/a/h/b;->e:I

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lb/a/h/c$a;->b:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [[B

    invoke-interface {p1, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [[B

    invoke-static {v0, p1}, Lb/a/h/a;->d(Lb/a/h/b;[[B)Lb/a/h/b;

    invoke-virtual {p0}, Lb/a/h/c$a;->a()V

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
