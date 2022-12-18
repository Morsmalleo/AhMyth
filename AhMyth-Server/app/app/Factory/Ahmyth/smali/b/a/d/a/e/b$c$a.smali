.class Lb/a/d/a/e/b$c$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/e/b$c;->a([Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/d/a/e/b$c;


# direct methods
.method constructor <init>(Lb/a/d/a/e/b$c;)V
    .locals 0

    iput-object p1, p0, Lb/a/d/a/e/b$c$a;->a:Lb/a/d/a/e/b$c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lb/a/d/a/e/b$c$a;->a:Lb/a/d/a/e/b$c;

    iget-object v0, v0, Lb/a/d/a/e/b$c;->a:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method
