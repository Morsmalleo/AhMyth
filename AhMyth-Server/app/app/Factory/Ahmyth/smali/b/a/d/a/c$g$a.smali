.class Lb/a/d/a/c$g$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/c$g;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/d/a/c$g;


# direct methods
.method constructor <init>(Lb/a/d/a/c$g;)V
    .locals 0

    iput-object p1, p0, Lb/a/d/a/c$g$a;->a:Lb/a/d/a/c$g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lb/a/d/a/c$g$a;->a:Lb/a/d/a/c$g;

    iget-object v0, v0, Lb/a/d/a/c$g;->a:Lb/a/d/a/c;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "ping"

    invoke-virtual {v0, v2, v1}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method
