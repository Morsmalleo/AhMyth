.class public Lio/socket/client/IO;
.super Ljava/lang/Object;
.source "IO.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/client/IO$Options;
    }
.end annotation


# static fields
.field private static final logger:Ljava/util/logging/Logger;

.field private static final managers:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lio/socket/client/Manager;",
            ">;"
        }
    .end annotation
.end field

.field public static protocol:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    const-class v0, Lio/socket/client/IO;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/client/IO;->logger:Ljava/util/logging/Logger;

    .line 19
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    .line 24
    const/4 v0, 0x5

    sput v0, Lio/socket/client/IO;->protocol:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setDefaultOkHttpCallFactory(Lokhttp3/Call$Factory;)V
    .locals 0
    .param p0, "factory"    # Lokhttp3/Call$Factory;

    .line 31
    sput-object p0, Lio/socket/client/Manager;->defaultCallFactory:Lokhttp3/Call$Factory;

    .line 32
    return-void
.end method

.method public static setDefaultOkHttpWebSocketFactory(Lokhttp3/WebSocket$Factory;)V
    .locals 0
    .param p0, "factory"    # Lokhttp3/WebSocket$Factory;

    .line 27
    sput-object p0, Lio/socket/client/Manager;->defaultWebSocketFactory:Lokhttp3/WebSocket$Factory;

    .line 28
    return-void
.end method

.method public static socket(Ljava/lang/String;)Lio/socket/client/Socket;
    .locals 1
    .param p0, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 37
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lio/socket/client/IO;->socket(Ljava/lang/String;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;

    move-result-object v0

    return-object v0
.end method

.method public static socket(Ljava/lang/String;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;
    .locals 1
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "opts"    # Lio/socket/client/IO$Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 41
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lio/socket/client/IO;->socket(Ljava/net/URI;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;

    move-result-object v0

    return-object v0
.end method

.method public static socket(Ljava/net/URI;)Lio/socket/client/Socket;
    .locals 1
    .param p0, "uri"    # Ljava/net/URI;

    .line 45
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lio/socket/client/IO;->socket(Ljava/net/URI;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;

    move-result-object v0

    return-object v0
.end method

.method public static socket(Ljava/net/URI;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;
    .locals 11
    .param p0, "uri"    # Ljava/net/URI;
    .param p1, "opts"    # Lio/socket/client/IO$Options;

    .line 56
    if-nez p1, :cond_0

    .line 57
    new-instance v0, Lio/socket/client/IO$Options;

    invoke-direct {v0}, Lio/socket/client/IO$Options;-><init>()V

    move-object p1, v0

    .line 60
    :cond_0
    invoke-static {p0}, Lio/socket/client/Url;->parse(Ljava/net/URI;)Lio/socket/client/Url$ParsedURI;

    move-result-object v0

    .line 61
    .local v0, "parsed":Lio/socket/client/Url$ParsedURI;
    iget-object v1, v0, Lio/socket/client/Url$ParsedURI;->uri:Ljava/net/URI;

    .line 62
    .local v1, "source":Ljava/net/URI;
    iget-object v2, v0, Lio/socket/client/Url$ParsedURI;->id:Ljava/lang/String;

    .line 64
    .local v2, "id":Ljava/lang/String;
    sget-object v3, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_1

    .line 65
    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/socket/client/Manager;

    iget-object v4, v4, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    .line 66
    .local v4, "sameNamespace":Z
    :goto_0
    iget-boolean v7, p1, Lio/socket/client/IO$Options;->forceNew:Z

    if-nez v7, :cond_3

    iget-boolean v7, p1, Lio/socket/client/IO$Options;->multiplex:Z

    if-eqz v7, :cond_3

    if-eqz v4, :cond_2

    goto :goto_1

    :cond_2
    const/4 v7, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 v7, 0x1

    .line 69
    .local v7, "newConnection":Z
    :goto_2
    invoke-virtual {v1}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v8

    .line 70
    .local v8, "query":Ljava/lang/String;
    if-eqz v8, :cond_5

    iget-object v9, p1, Lio/socket/client/IO$Options;->query:Ljava/lang/String;

    if-eqz v9, :cond_4

    iget-object v9, p1, Lio/socket/client/IO$Options;->query:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 71
    :cond_4
    iput-object v8, p1, Lio/socket/client/IO$Options;->query:Ljava/lang/String;

    .line 74
    :cond_5
    if-eqz v7, :cond_7

    .line 75
    sget-object v3, Lio/socket/client/IO;->logger:Ljava/util/logging/Logger;

    sget-object v9, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v9}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 76
    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v6

    const-string v6, "ignoring socket cache for %s"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 78
    :cond_6
    new-instance v3, Lio/socket/client/Manager;

    invoke-direct {v3, v1, p1}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    .local v3, "io":Lio/socket/client/Manager;
    goto :goto_3

    .line 80
    .end local v3    # "io":Lio/socket/client/Manager;
    :cond_7
    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_9

    .line 81
    sget-object v9, Lio/socket/client/IO;->logger:Ljava/util/logging/Logger;

    sget-object v10, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 82
    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v6

    const-string v6, "new io instance for %s"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 84
    :cond_8
    new-instance v5, Lio/socket/client/Manager;

    invoke-direct {v5, v1, p1}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    invoke-virtual {v3, v2, v5}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    :cond_9
    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/socket/client/Manager;

    .line 89
    .restart local v3    # "io":Lio/socket/client/Manager;
    :goto_3
    invoke-virtual {v1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5, p1}, Lio/socket/client/Manager;->socket(Ljava/lang/String;Lio/socket/client/Manager$Options;)Lio/socket/client/Socket;

    move-result-object v5

    return-object v5
.end method
