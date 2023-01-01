.class Lb/a/d/a/e/b$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/c/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/e/b;->D([BLjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lb/a/d/a/e/b;Ljava/lang/Runnable;)V
    .locals 0

    iput-object p2, p0, Lb/a/d/a/e/b$c;->a:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Object;)V
    .locals 0

    new-instance p1, Lb/a/d/a/e/b$c$a;

    invoke-direct {p1, p0}, Lb/a/d/a/e/b$c$a;-><init>(Lb/a/d/a/e/b$c;)V

    invoke-static {p1}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-void
.end method
