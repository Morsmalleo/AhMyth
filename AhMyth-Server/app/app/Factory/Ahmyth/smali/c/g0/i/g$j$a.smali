.class Lc/g0/i/g$j$a;
.super Lc/g0/b;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/g0/i/g$j;->d(ZIILjava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic b:Lc/g0/i/i;

.field final synthetic c:Lc/g0/i/g$j;


# direct methods
.method varargs constructor <init>(Lc/g0/i/g$j;Ljava/lang/String;[Ljava/lang/Object;Lc/g0/i/i;)V
    .locals 0

    iput-object p1, p0, Lc/g0/i/g$j$a;->c:Lc/g0/i/g$j;

    iput-object p4, p0, Lc/g0/i/g$j$a;->b:Lc/g0/i/i;

    invoke-direct {p0, p2, p3}, Lc/g0/b;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public k()V
    .locals 5

    :try_start_0
    iget-object v0, p0, Lc/g0/i/g$j$a;->c:Lc/g0/i/g$j;

    iget-object v0, v0, Lc/g0/i/g$j;->c:Lc/g0/i/g;

    iget-object v0, v0, Lc/g0/i/g;->b:Lc/g0/i/g$i;

    iget-object v1, p0, Lc/g0/i/g$j$a;->b:Lc/g0/i/i;

    invoke-virtual {v0, v1}, Lc/g0/i/g$i;->c(Lc/g0/i/i;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {}, Lc/g0/j/e;->h()Lc/g0/j/e;

    move-result-object v1

    const/4 v2, 0x4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "FramedConnection.Listener failure for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lc/g0/i/g$j$a;->c:Lc/g0/i/g$j;

    iget-object v4, v4, Lc/g0/i/g$j;->c:Lc/g0/i/g;

    iget-object v4, v4, Lc/g0/i/g;->d:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Lc/g0/j/e;->l(ILjava/lang/String;Ljava/lang/Throwable;)V

    :try_start_1
    iget-object v0, p0, Lc/g0/i/g$j$a;->b:Lc/g0/i/i;

    sget-object v1, Lc/g0/i/b;->c:Lc/g0/i/b;

    invoke-virtual {v0, v1}, Lc/g0/i/i;->d(Lc/g0/i/b;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :goto_0
    return-void
.end method
