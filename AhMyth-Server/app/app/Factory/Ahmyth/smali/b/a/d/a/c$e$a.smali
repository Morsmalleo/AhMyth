.class Lb/a/d/a/c$e$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/c$e;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/d/a/c$e;


# direct methods
.method constructor <init>(Lb/a/d/a/c$e;)V
    .locals 0

    iput-object p1, p0, Lb/a/d/a/c$e$a;->a:Lb/a/d/a/c$e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lb/a/d/a/c$e$a;->a:Lb/a/d/a/c$e;

    iget-object v0, v0, Lb/a/d/a/c$e;->a:Lb/a/d/a/c;

    invoke-static {v0}, Lb/a/d/a/c;->x(Lb/a/d/a/c;)Lb/a/d/a/c$v;

    move-result-object v0

    sget-object v1, Lb/a/d/a/c$v;->d:Lb/a/d/a/c$v;

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lb/a/d/a/c$e$a;->a:Lb/a/d/a/c$e;

    iget-object v0, v0, Lb/a/d/a/c$e;->a:Lb/a/d/a/c;

    const-string v1, "ping timeout"

    invoke-static {v0, v1}, Lb/a/d/a/c;->B(Lb/a/d/a/c;Ljava/lang/String;)V

    return-void
.end method
