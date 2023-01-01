.class Lb/a/b/e$b;
.super Ljava/util/LinkedList;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/b/e;->J()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedList<",
        "Lb/a/b/d$b;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lb/a/b/c;

.field final synthetic b:Lb/a/b/e;


# direct methods
.method constructor <init>(Lb/a/b/e;Lb/a/b/c;)V
    .locals 1

    iput-object p1, p0, Lb/a/b/e$b;->b:Lb/a/b/e;

    iput-object p2, p0, Lb/a/b/e$b;->a:Lb/a/b/c;

    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    new-instance p1, Lb/a/b/e$b$a;

    invoke-direct {p1, p0}, Lb/a/b/e$b$a;-><init>(Lb/a/b/e$b;)V

    const-string v0, "open"

    invoke-static {p2, v0, p1}, Lb/a/b/d;->a(Lb/a/c/a;Ljava/lang/String;Lb/a/c/a$a;)Lb/a/b/d$b;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    new-instance p1, Lb/a/b/e$b$b;

    invoke-direct {p1, p0}, Lb/a/b/e$b$b;-><init>(Lb/a/b/e$b;)V

    const-string v0, "packet"

    invoke-static {p2, v0, p1}, Lb/a/b/d;->a(Lb/a/c/a;Ljava/lang/String;Lb/a/c/a$a;)Lb/a/b/d$b;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    new-instance p1, Lb/a/b/e$b$c;

    invoke-direct {p1, p0}, Lb/a/b/e$b$c;-><init>(Lb/a/b/e$b;)V

    const-string v0, "close"

    invoke-static {p2, v0, p1}, Lb/a/b/d;->a(Lb/a/c/a;Ljava/lang/String;Lb/a/c/a$a;)Lb/a/b/d$b;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void
.end method
