.class Lb/a/d/a/d$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/d;->q()Lb/a/d/a/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/d/a/d;


# direct methods
.method constructor <init>(Lb/a/d/a/d;)V
    .locals 0

    iput-object p1, p0, Lb/a/d/a/d$a;->a:Lb/a/d/a/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lb/a/d/a/d$a;->a:Lb/a/d/a/d;

    iget-object v1, v0, Lb/a/d/a/d;->p:Lb/a/d/a/d$e;

    sget-object v2, Lb/a/d/a/d$e;->c:Lb/a/d/a/d$e;

    if-eq v1, v2, :cond_0

    if-nez v1, :cond_1

    :cond_0
    sget-object v1, Lb/a/d/a/d$e;->a:Lb/a/d/a/d$e;

    iput-object v1, v0, Lb/a/d/a/d;->p:Lb/a/d/a/d$e;

    invoke-virtual {v0}, Lb/a/d/a/d;->j()V

    :cond_1
    return-void
.end method
