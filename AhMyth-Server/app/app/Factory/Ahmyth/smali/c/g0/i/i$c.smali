.class Lc/g0/i/i$c;
.super Ld/a;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/g0/i/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "c"
.end annotation


# instance fields
.field final synthetic k:Lc/g0/i/i;


# direct methods
.method constructor <init>(Lc/g0/i/i;)V
    .locals 0

    iput-object p1, p0, Lc/g0/i/i$c;->k:Lc/g0/i/i;

    invoke-direct {p0}, Ld/a;-><init>()V

    return-void
.end method


# virtual methods
.method protected q(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 2

    new-instance v0, Ljava/net/SocketTimeoutException;

    const-string v1, "timeout"

    invoke-direct {v0, v1}, Ljava/net/SocketTimeoutException;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    invoke-virtual {v0, p1}, Ljava/net/SocketTimeoutException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    :cond_0
    return-object v0
.end method

.method protected v()V
    .locals 2

    iget-object v0, p0, Lc/g0/i/i$c;->k:Lc/g0/i/i;

    sget-object v1, Lc/g0/i/b;->g:Lc/g0/i/b;

    invoke-virtual {v0, v1}, Lc/g0/i/i;->f(Lc/g0/i/b;)V

    return-void
.end method

.method public w()V
    .locals 1

    invoke-virtual {p0}, Ld/a;->p()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lc/g0/i/i$c;->q(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method
