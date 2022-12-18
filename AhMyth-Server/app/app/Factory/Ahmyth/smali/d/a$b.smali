.class Ld/a$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ld/r;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ld/a;->u(Ld/r;)Ld/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ld/r;

.field final synthetic b:Ld/a;


# direct methods
.method constructor <init>(Ld/a;Ld/r;)V
    .locals 0

    iput-object p1, p0, Ld/a$b;->b:Ld/a;

    iput-object p2, p0, Ld/a$b;->a:Ld/r;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public G(Ld/c;J)J
    .locals 1

    iget-object v0, p0, Ld/a$b;->b:Ld/a;

    invoke-virtual {v0}, Ld/a;->m()V

    :try_start_0
    iget-object v0, p0, Ld/a$b;->a:Ld/r;

    invoke-interface {v0, p1, p2, p3}, Ld/r;->G(Ld/c;J)J

    move-result-wide p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p3, 0x1

    iget-object v0, p0, Ld/a$b;->b:Ld/a;

    invoke-virtual {v0, p3}, Ld/a;->o(Z)V

    return-wide p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_1
    iget-object p2, p0, Ld/a$b;->b:Ld/a;

    invoke-virtual {p2, p1}, Ld/a;->n(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    iget-object p2, p0, Ld/a$b;->b:Ld/a;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Ld/a;->o(Z)V

    throw p1
.end method

.method public b()Ld/s;
    .locals 1

    iget-object v0, p0, Ld/a$b;->b:Ld/a;

    return-object v0
.end method

.method public close()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Ld/a$b;->a:Ld/r;

    invoke-interface {v0}, Ld/r;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    iget-object v1, p0, Ld/a$b;->b:Ld/a;

    invoke-virtual {v1, v0}, Ld/a;->o(Z)V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_1
    iget-object v1, p0, Ld/a$b;->b:Ld/a;

    invoke-virtual {v1, v0}, Ld/a;->n(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    iget-object v1, p0, Ld/a$b;->b:Ld/a;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ld/a;->o(Z)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AsyncTimeout.source("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ld/a$b;->a:Ld/r;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
