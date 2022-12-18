.class Lc/g0/l/a$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/g0/l/a;-><init>(Lc/y;Lc/f0;Ljava/util/Random;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lc/g0/l/a;


# direct methods
.method constructor <init>(Lc/g0/l/a;)V
    .locals 0

    iput-object p1, p0, Lc/g0/l/a$a;->a:Lc/g0/l/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    :goto_0
    :try_start_0
    iget-object v0, p0, Lc/g0/l/a$a;->a:Lc/g0/l/a;

    invoke-virtual {v0}, Lc/g0/l/a;->s()Z

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lc/g0/l/a$a;->a:Lc/g0/l/a;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lc/g0/l/a;->n(Ljava/lang/Exception;Lc/a0;)V

    :cond_0
    return-void
.end method
