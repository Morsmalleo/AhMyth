.class Lb/a/d/a/c$h;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/c;->U(Ljava/lang/String;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/Runnable;

.field final synthetic c:Lb/a/d/a/c;


# direct methods
.method constructor <init>(Lb/a/d/a/c;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    iput-object p1, p0, Lb/a/d/a/c$h;->c:Lb/a/d/a/c;

    iput-object p2, p0, Lb/a/d/a/c$h;->a:Ljava/lang/String;

    iput-object p3, p0, Lb/a/d/a/c$h;->b:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lb/a/d/a/c$h;->c:Lb/a/d/a/c;

    iget-object v1, p0, Lb/a/d/a/c$h;->a:Ljava/lang/String;

    iget-object v2, p0, Lb/a/d/a/c$h;->b:Ljava/lang/Runnable;

    const-string v3, "message"

    invoke-static {v0, v3, v1, v2}, Lb/a/d/a/c;->r(Lb/a/d/a/c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method
