.class Lb/a/d/a/e/c$b$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/e/c$b;->d(Lc/e0;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lb/a/d/a/e/c$b;


# direct methods
.method constructor <init>(Lb/a/d/a/e/c$b;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lb/a/d/a/e/c$b$b;->b:Lb/a/d/a/e/c$b;

    iput-object p2, p0, Lb/a/d/a/e/c$b$b;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lb/a/d/a/e/c$b$b;->b:Lb/a/d/a/e/c$b;

    iget-object v0, v0, Lb/a/d/a/e/c$b;->a:Lb/a/d/a/e/c;

    iget-object v1, p0, Lb/a/d/a/e/c$b$b;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lb/a/d/a/e/c;->u(Lb/a/d/a/e/c;Ljava/lang/String;)V

    return-void
.end method
