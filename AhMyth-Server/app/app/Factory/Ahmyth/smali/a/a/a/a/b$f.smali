.class abstract La/a/a/a/b$f;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = La/a/a/a/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "f"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;",
        "Ljava/lang/Object<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field a:La/a/a/a/b$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "La/a/a/a/b$d<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field b:La/a/a/a/b$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "La/a/a/a/b$d<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(La/a/a/a/b$d;La/a/a/a/b$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "La/a/a/a/b$d<",
            "TK;TV;>;",
            "La/a/a/a/b$d<",
            "TK;TV;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private c()La/a/a/a/b$d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "La/a/a/a/b$d<",
            "TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, La/a/a/a/b$f;->b:La/a/a/a/b$d;

    iget-object v1, p0, La/a/a/a/b$f;->a:La/a/a/a/b$d;

    if-eq v0, v1, :cond_1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, La/a/a/a/b$f;->a(La/a/a/a/b$d;)La/a/a/a/b$d;

    move-result-object v0

    return-object v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method abstract a(La/a/a/a/b$d;)La/a/a/a/b$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "La/a/a/a/b$d<",
            "TK;TV;>;)",
            "La/a/a/a/b$d<",
            "TK;TV;>;"
        }
    .end annotation
.end method

.method public b()Ljava/util/Map$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, La/a/a/a/b$f;->b:La/a/a/a/b$d;

    invoke-direct {p0}, La/a/a/a/b$f;->c()La/a/a/a/b$d;

    return-object v0
.end method

.method public hasNext()Z
    .locals 1

    iget-object v0, p0, La/a/a/a/b$f;->b:La/a/a/a/b$d;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, La/a/a/a/b$f;->b()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method
