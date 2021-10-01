.class public final Lokhttp3/internal/connection/RouteException;
.super Ljava/lang/RuntimeException;
.source "RouteException.java"


# instance fields
.field private firstException:Ljava/io/IOException;

.field private lastException:Ljava/io/IOException;


# direct methods
.method public constructor <init>(Ljava/io/IOException;)V
    .locals 0
    .param p1, "cause"    # Ljava/io/IOException;

    .line 31
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 32
    iput-object p1, p0, Lokhttp3/internal/connection/RouteException;->firstException:Ljava/io/IOException;

    .line 33
    iput-object p1, p0, Lokhttp3/internal/connection/RouteException;->lastException:Ljava/io/IOException;

    .line 34
    return-void
.end method


# virtual methods
.method public addConnectException(Ljava/io/IOException;)V
    .locals 1
    .param p1, "e"    # Ljava/io/IOException;

    .line 45
    iget-object v0, p0, Lokhttp3/internal/connection/RouteException;->firstException:Ljava/io/IOException;

    invoke-static {v0, p1}, Lokhttp3/internal/Util;->addSuppressedIfPossible(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 46
    iput-object p1, p0, Lokhttp3/internal/connection/RouteException;->lastException:Ljava/io/IOException;

    .line 47
    return-void
.end method

.method public getFirstConnectException()Ljava/io/IOException;
    .locals 1

    .line 37
    iget-object v0, p0, Lokhttp3/internal/connection/RouteException;->firstException:Ljava/io/IOException;

    return-object v0
.end method

.method public getLastConnectException()Ljava/io/IOException;
    .locals 1

    .line 41
    iget-object v0, p0, Lokhttp3/internal/connection/RouteException;->lastException:Ljava/io/IOException;

    return-object v0
.end method
