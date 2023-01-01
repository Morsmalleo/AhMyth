.class Lb/a/d/a/e/c$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lc/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/e/c;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic b:Ljava/lang/String;


# direct methods
.method constructor <init>(Lb/a/d/a/e/c;Ljava/lang/String;)V
    .locals 0

    iput-object p2, p0, Lb/a/d/a/e/c$a;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lc/c0;Lc/a0;)Lc/y;
    .locals 1

    invoke-virtual {p2}, Lc/a0;->Q()Lc/y;

    move-result-object p1

    invoke-virtual {p1}, Lc/y;->g()Lc/y$a;

    move-result-object p1

    iget-object p2, p0, Lb/a/d/a/e/c$a;->b:Ljava/lang/String;

    const-string v0, "Proxy-Authorization"

    invoke-virtual {p1, v0, p2}, Lc/y$a;->c(Ljava/lang/String;Ljava/lang/String;)Lc/y$a;

    invoke-virtual {p1}, Lc/y$a;->b()Lc/y;

    move-result-object p1

    return-object p1
.end method
