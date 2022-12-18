.class La/a/a/a/b$c;
.super La/a/a/a/b$f;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = La/a/a/a/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "La/a/a/a/b$f<",
        "TK;TV;>;"
    }
.end annotation


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

    invoke-direct {p0, p1, p2}, La/a/a/a/b$f;-><init>(La/a/a/a/b$d;La/a/a/a/b$d;)V

    return-void
.end method


# virtual methods
.method a(La/a/a/a/b$d;)La/a/a/a/b$d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "La/a/a/a/b$d<",
            "TK;TV;>;)",
            "La/a/a/a/b$d<",
            "TK;TV;>;"
        }
    .end annotation

    iget-object p1, p1, La/a/a/a/b$d;->b:La/a/a/a/b$d;

    return-object p1
.end method
