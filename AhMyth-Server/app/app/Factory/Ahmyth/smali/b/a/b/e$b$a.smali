.class Lb/a/b/e$b$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/c/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/a/b/e$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/b/e$b;


# direct methods
.method constructor <init>(Lb/a/b/e$b;)V
    .locals 0

    iput-object p1, p0, Lb/a/b/e$b$a;->a:Lb/a/b/e$b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Object;)V
    .locals 0

    iget-object p1, p0, Lb/a/b/e$b$a;->a:Lb/a/b/e$b;

    iget-object p1, p1, Lb/a/b/e$b;->b:Lb/a/b/e;

    invoke-static {p1}, Lb/a/b/e;->h(Lb/a/b/e;)V

    return-void
.end method
