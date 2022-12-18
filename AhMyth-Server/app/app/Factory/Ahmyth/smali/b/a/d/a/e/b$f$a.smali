.class Lb/a/d/a/e/b$f$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/e/b$f;->a([Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:[Ljava/lang/Object;

.field final synthetic b:Lb/a/d/a/e/b$f;


# direct methods
.method constructor <init>(Lb/a/d/a/e/b$f;[Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lb/a/d/a/e/b$f$a;->b:Lb/a/d/a/e/b$f;

    iput-object p2, p0, Lb/a/d/a/e/b$f$a;->a:[Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lb/a/d/a/e/b$f$a;->a:[Ljava/lang/Object;

    array-length v1, v0

    if-lez v1, :cond_0

    const/4 v1, 0x0

    aget-object v2, v0, v1

    instance-of v2, v2, Ljava/lang/Exception;

    if-eqz v2, :cond_0

    aget-object v0, v0, v1

    check-cast v0, Ljava/lang/Exception;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lb/a/d/a/e/b$f$a;->b:Lb/a/d/a/e/b$f;

    iget-object v1, v1, Lb/a/d/a/e/b$f;->a:Lb/a/d/a/e/b;

    const-string v2, "xhr poll error"

    invoke-static {v1, v2, v0}, Lb/a/d/a/e/b;->I(Lb/a/d/a/e/b;Ljava/lang/String;Ljava/lang/Exception;)Lb/a/d/a/d;

    return-void
.end method
