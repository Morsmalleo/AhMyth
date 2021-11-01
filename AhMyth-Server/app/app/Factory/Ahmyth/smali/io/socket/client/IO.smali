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
    sget v0, Lio/socket/parser/Parser;->protocol:I

    sput v0, Lio/socket/client/IO;->protocol:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setDefaultHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V
    .locals 0

    .line 31
    sput-object p0, Lio/socket/client/Manager;->defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-void
.end method

.method public static setDefaultSSLContext(Ljavax/net/ssl/SSLContext;)V
    .locals 0

    .line 27
    sput-object p0, Lio/socket/client/Manager;->defaultSSLContext:Ljavax/net/ssl/SSLContext;

    return-void
.end method

.method public static socket(Ljava/lang/String;)Lio/socket/client/Socket;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 37
    invoke-static {p0, v0}, Lio/socket/client/IO;->socket(Ljava/lang/String;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;

    move-result-object p0

    return-object p0
.end method

.method public static socket(Ljava/lang/String;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 41
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lio/socket/client/IO;->socket(Ljava/net/URI;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;

    move-result-object p0

    return-object p0
.end method

.method public static socket(Ljava/net/URI;)Lio/socket/client/Socket;
    .locals 1

    const/4 v0, 0x0

    .line 45
    invoke-static {p0, v0}, Lio/socket/client/IO;->socket(Ljava/net/URI;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;

    move-result-object p0

    return-object p0
.end method

.method public static socket(Ljava/net/URI;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;
    .locals 7

    if-nez p1, :cond_0

    .line 57
    new-instance p1, Lio/socket/client/IO$Options;

    invoke-direct {p1}, Lio/socket/client/IO$Options;-><init>()V

    .line 60
    :cond_0
    invoke-static {p0}, Lio/socket/client/Url;->parse(Ljava/net/URI;)Ljava/net/URL;

    move-result-object p0

    .line 63
    :try_start_0
    invoke-virtual {p0}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v0
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    invoke-static {p0}, Lio/socket/client/Url;->extractId(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v1

    .line 68
    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 69
    sget-object v3, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_1

    .line 70
    invoke-virtual {v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/socket/client/Manager;

    iget-object v4, v4, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v2}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 71
    :goto_0
    iget-boolean v4, p1, Lio/socket/client/IO$Options;->forceNew:Z

    if-nez v4, :cond_3

    iget-boolean v4, p1, Lio/socket/client/IO$Options;->multiplex:Z

    if-eqz v4, :cond_3

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 v2, 0x1

    :goto_2
    if-eqz v2, :cond_4

    .line 75
    sget-object v1, Lio/socket/client/IO;->logger:Ljava/util/logging/Logger;

    new-array v2, v5, [Ljava/lang/Object;

    aput-object v0, v2, v6

    const-string v3, "ignoring socket cache for %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 76
    new-instance v1, Lio/socket/client/Manager;

    invoke-direct {v1, v0, p1}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    goto :goto_3

    .line 78
    :cond_4
    invoke-virtual {v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 79
    sget-object v2, Lio/socket/client/IO;->logger:Ljava/util/logging/Logger;

    new-array v4, v5, [Ljava/lang/Object;

    aput-object v0, v4, v6

    const-string v5, "new io instance for %s"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 80
    new-instance v2, Lio/socket/client/Manager;

    invoke-direct {v2, v0, p1}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    invoke-virtual {v3, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    :cond_5
    invoke-virtual {v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lio/socket/client/Manager;

    .line 85
    :goto_3
    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lio/socket/client/Manager;->socket(Ljava/lang/String;)Lio/socket/client/Socket;

    move-result-object p0

    return-object p0

    :catch_0
    move-exception p0

    .line 65
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method
