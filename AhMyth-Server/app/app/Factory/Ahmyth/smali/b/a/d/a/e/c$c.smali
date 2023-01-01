.class Lb/a/d/a/e/c$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/e/c;->s([Lb/a/d/b/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/d/a/e/c;


# direct methods
.method constructor <init>(Lb/a/d/a/e/c;Lb/a/d/a/e/c;)V
    .locals 0

    iput-object p2, p0, Lb/a/d/a/e/c$c;->a:Lb/a/d/a/e/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    new-instance v0, Lb/a/d/a/e/c$c$a;

    invoke-direct {v0, p0}, Lb/a/d/a/e/c$c$a;-><init>(Lb/a/d/a/e/c$c;)V

    invoke-static {v0}, Lb/a/i/a;->j(Ljava/lang/Runnable;)V

    return-void
.end method
