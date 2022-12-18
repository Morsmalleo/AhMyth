.class La/a/a/a/b$e;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = La/a/a/a/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;",
        "Ljava/lang/Object<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field private a:La/a/a/a/b$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "La/a/a/a/b$d<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field private b:Z

.field final synthetic c:La/a/a/a/b;


# direct methods
.method private constructor <init>(La/a/a/a/b;)V
    .locals 0

    iput-object p1, p0, La/a/a/a/b$e;->c:La/a/a/a/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    iput-boolean p1, p0, La/a/a/a/b$e;->b:Z

    return-void
.end method

.method synthetic constructor <init>(La/a/a/a/b;La/a/a/a/b$a;)V
    .locals 0

    invoke-direct {p0, p1}, La/a/a/a/b$e;-><init>(La/a/a/a/b;)V

    return-void
.end method


# virtual methods
.method public a()Ljava/util/Map$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    iget-boolean v0, p0, La/a/a/a/b$e;->b:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, La/a/a/a/b$e;->b:Z

    iget-object v0, p0, La/a/a/a/b$e;->c:La/a/a/a/b;

    invoke-static {v0}, La/a/a/a/b;->a(La/a/a/a/b;)La/a/a/a/b$d;

    goto :goto_0

    :cond_0
    iget-object v0, p0, La/a/a/a/b$e;->a:La/a/a/a/b$d;

    if-eqz v0, :cond_1

    iget-object v0, v0, La/a/a/a/b$d;->a:La/a/a/a/b$d;

    :cond_1
    :goto_0
    iget-object v0, p0, La/a/a/a/b$e;->a:La/a/a/a/b$d;

    return-object v0
.end method

.method public hasNext()Z
    .locals 3

    iget-boolean v0, p0, La/a/a/a/b$e;->b:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, La/a/a/a/b$e;->c:La/a/a/a/b;

    invoke-static {v0}, La/a/a/a/b;->a(La/a/a/a/b;)La/a/a/a/b$d;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_1
    iget-object v0, p0, La/a/a/a/b$e;->a:La/a/a/a/b$d;

    if-eqz v0, :cond_2

    iget-object v0, v0, La/a/a/a/b$d;->a:La/a/a/a/b$d;

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    return v1
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, La/a/a/a/b$e;->a()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method
