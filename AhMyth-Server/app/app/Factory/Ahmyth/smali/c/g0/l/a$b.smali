.class Lc/g0/l/a$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lc/f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/g0/l/a;->m(Lc/v;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lc/y;

.field final synthetic b:I

.field final synthetic c:Lc/g0/l/a;


# direct methods
.method constructor <init>(Lc/g0/l/a;Lc/y;I)V
    .locals 0

    iput-object p1, p0, Lc/g0/l/a$b;->c:Lc/g0/l/a;

    iput-object p2, p0, Lc/g0/l/a$b;->a:Lc/y;

    iput p3, p0, Lc/g0/l/a$b;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lc/e;Lc/a0;)V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lc/g0/l/a$b;->c:Lc/g0/l/a;

    invoke-virtual {v0, p2}, Lc/g0/l/a;->k(Lc/a0;)V
    :try_end_0
    .catch Ljava/net/ProtocolException; {:try_start_0 .. :try_end_0} :catch_1

    sget-object v0, Lc/g0/a;->a:Lc/g0/a;

    invoke-virtual {v0, p1}, Lc/g0/a;->i(Lc/e;)Lc/g0/f/g;

    move-result-object p1

    invoke-virtual {p1}, Lc/g0/f/g;->j()V

    new-instance v0, Lc/g0/l/a$d;

    invoke-direct {v0, p1}, Lc/g0/l/a$d;-><init>(Lc/g0/f/g;)V

    :try_start_1
    iget-object v1, p0, Lc/g0/l/a$b;->c:Lc/g0/l/a;

    iget-object v2, v1, Lc/g0/l/a;->b:Lc/f0;

    invoke-virtual {v2, v1, p2}, Lc/f0;->f(Lc/e0;Lc/a0;)V

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "OkHttp WebSocket "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc/g0/l/a$b;->a:Lc/y;

    invoke-virtual {v1}, Lc/y;->h()Lc/s;

    move-result-object v1

    invoke-virtual {v1}, Lc/s;->A()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    iget-object v1, p0, Lc/g0/l/a$b;->c:Lc/g0/l/a;

    iget v2, p0, Lc/g0/l/a$b;->b:I

    int-to-long v2, v2

    invoke-virtual {v1, p2, v2, v3, v0}, Lc/g0/l/a;->o(Ljava/lang/String;JLc/g0/l/a$h;)V

    invoke-virtual {p1}, Lc/g0/f/g;->d()Lc/g0/f/c;

    move-result-object p1

    invoke-virtual {p1}, Lc/g0/f/c;->p()Ljava/net/Socket;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/net/Socket;->setSoTimeout(I)V

    iget-object p1, p0, Lc/g0/l/a$b;->c:Lc/g0/l/a;

    invoke-virtual {p1}, Lc/g0/l/a;->p()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object p2, p0, Lc/g0/l/a$b;->c:Lc/g0/l/a;

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Lc/g0/l/a;->n(Ljava/lang/Exception;Lc/a0;)V

    :goto_0
    return-void

    :catch_1
    move-exception p1

    iget-object v0, p0, Lc/g0/l/a$b;->c:Lc/g0/l/a;

    invoke-virtual {v0, p1, p2}, Lc/g0/l/a;->n(Ljava/lang/Exception;Lc/a0;)V

    invoke-static {p2}, Lc/g0/c;->b(Ljava/io/Closeable;)V

    return-void
.end method

.method public b(Lc/e;Ljava/io/IOException;)V
    .locals 1

    iget-object p1, p0, Lc/g0/l/a$b;->c:Lc/g0/l/a;

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lc/g0/l/a;->n(Ljava/lang/Exception;Lc/a0;)V

    return-void
.end method
