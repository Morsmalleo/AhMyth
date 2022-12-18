.class Lb/a/d/a/e/b$f;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/c/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/e/b;->C()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/d/a/e/b;


# direct methods
.method constructor <init>(Lb/a/d/a/e/b;Lb/a/d/a/e/b;)V
    .locals 0

    iput-object p2, p0, Lb/a/d/a/e/b$f;->a:Lb/a/d/a/e/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Object;)V
    .locals 1

    new-instance v0, Lb/a/d/a/e/b$f$a;

    invoke-direct {v0, p0, p1}, Lb/a/d/a/e/b$f$a;-><init>(Lb/a/d/a/e/b$f;[Ljava/lang/Object;)V

    invoke-static {v0}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-void
.end method
