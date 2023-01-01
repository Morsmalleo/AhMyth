.class public Lb/a/d/a/e/b$g;
.super Lb/a/c/a;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/a/d/a/e/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "g"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/a/d/a/e/b$g$b;
    }
.end annotation


# instance fields
.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:[B

.field private e:Ljavax/net/ssl/SSLContext;

.field private f:Ljava/net/HttpURLConnection;

.field private g:Ljavax/net/ssl/HostnameVerifier;

.field private h:Ljava/net/Proxy;


# direct methods
.method public constructor <init>(Lb/a/d/a/e/b$g$b;)V
    .locals 1

    invoke-direct {p0}, Lb/a/c/a;-><init>()V

    iget-object v0, p1, Lb/a/d/a/e/b$g$b;->b:Ljava/lang/String;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "GET"

    :goto_0
    iput-object v0, p0, Lb/a/d/a/e/b$g;->b:Ljava/lang/String;

    iget-object v0, p1, Lb/a/d/a/e/b$g$b;->a:Ljava/lang/String;

    iput-object v0, p0, Lb/a/d/a/e/b$g;->c:Ljava/lang/String;

    iget-object v0, p1, Lb/a/d/a/e/b$g$b;->c:[B

    iput-object v0, p0, Lb/a/d/a/e/b$g;->d:[B

    iget-object v0, p1, Lb/a/d/a/e/b$g$b;->d:Ljavax/net/ssl/SSLContext;

    iput-object v0, p0, Lb/a/d/a/e/b$g;->e:Ljavax/net/ssl/SSLContext;

    iget-object v0, p1, Lb/a/d/a/e/b$g$b;->e:Ljavax/net/ssl/HostnameVerifier;

    iput-object v0, p0, Lb/a/d/a/e/b$g;->g:Ljavax/net/ssl/HostnameVerifier;

    iget-object p1, p1, Lb/a/d/a/e/b$g$b;->f:Ljava/net/Proxy;

    iput-object p1, p0, Lb/a/d/a/e/b$g;->h:Ljava/net/Proxy;

    return-void
.end method

.method static synthetic h(Lb/a/d/a/e/b$g;)[B
    .locals 0

    iget-object p0, p0, Lb/a/d/a/e/b$g;->d:[B

    return-object p0
.end method

.method static synthetic i(Lb/a/d/a/e/b$g;)Ljava/net/HttpURLConnection;
    .locals 0

    iget-object p0, p0, Lb/a/d/a/e/b$g;->f:Ljava/net/HttpURLConnection;

    return-object p0
.end method

.method static synthetic j(Lb/a/d/a/e/b$g;Ljava/util/Map;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/d/a/e/b$g;->t(Ljava/util/Map;)V

    return-void
.end method

.method static synthetic k(Lb/a/d/a/e/b$g;)V
    .locals 0

    invoke-direct {p0}, Lb/a/d/a/e/b$g;->r()V

    return-void
.end method

.method static synthetic l(Lb/a/d/a/e/b$g;Ljava/lang/Exception;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/d/a/e/b$g;->q(Ljava/lang/Exception;)V

    return-void
.end method

.method private m()V
    .locals 1

    iget-object v0, p0, Lb/a/d/a/e/b$g;->f:Ljava/net/HttpURLConnection;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    const/4 v0, 0x0

    iput-object v0, p0, Lb/a/d/a/e/b$g;->f:Ljava/net/HttpURLConnection;

    return-void
.end method

.method private o(Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "data"

    invoke-virtual {p0, p1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    invoke-direct {p0}, Lb/a/d/a/e/b$g;->u()V

    return-void
.end method

.method private p([B)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "data"

    invoke-virtual {p0, p1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    invoke-direct {p0}, Lb/a/d/a/e/b$g;->u()V

    return-void
.end method

.method private q(Ljava/lang/Exception;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "error"

    invoke-virtual {p0, p1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method

.method private r()V
    .locals 9

    iget-object v0, p0, Lb/a/d/a/e/b$g;->f:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "application/octet-stream"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/io/BufferedInputStream;

    iget-object v2, p0, Lb/a/d/a/e/b$g;->f:Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/16 v3, 0x400

    new-array v3, v3, [B

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    invoke-virtual {v0, v3}, Ljava/io/InputStream;->read([B)I

    move-result v6

    if-lez v6, :cond_0

    new-array v7, v6, [B

    invoke-static {v3, v4, v7, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/2addr v5, v6

    goto :goto_0

    :cond_0
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-direct {p0, v2}, Lb/a/d/a/e/b$g;->p([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v2, v1

    move-object v1, v0

    goto :goto_3

    :catchall_0
    move-exception v2

    move-object v8, v1

    move-object v1, v0

    move-object v0, v2

    move-object v2, v8

    goto :goto_8

    :catch_0
    move-exception v2

    move-object v8, v1

    move-object v1, v0

    move-object v0, v2

    move-object v2, v8

    goto :goto_5

    :cond_2
    :try_start_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    iget-object v4, p0, Lb/a/d/a/e/b$g;->f:Ljava/net/HttpURLConnection;

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_2
    :try_start_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lb/a/d/a/e/b$g;->o(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :goto_3
    if-eqz v1, :cond_4

    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_4

    :catch_1
    nop

    :cond_4
    :goto_4
    if-eqz v2, :cond_6

    goto :goto_7

    :catch_2
    move-exception v0

    goto :goto_5

    :catchall_1
    move-exception v2

    move-object v0, v2

    move-object v2, v1

    goto :goto_8

    :catch_3
    move-exception v2

    move-object v0, v2

    move-object v2, v1

    :goto_5
    :try_start_5
    invoke-direct {p0, v0}, Lb/a/d/a/e/b$g;->q(Ljava/lang/Exception;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    if-eqz v1, :cond_5

    :try_start_6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_6

    :catch_4
    nop

    :cond_5
    :goto_6
    if-eqz v2, :cond_6

    :goto_7
    :try_start_7
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    :catch_5
    :cond_6
    invoke-direct {p0}, Lb/a/d/a/e/b$g;->m()V

    return-void

    :catchall_2
    move-exception v0

    :goto_8
    if-eqz v1, :cond_7

    :try_start_8
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    goto :goto_9

    :catch_6
    nop

    :cond_7
    :goto_9
    if-eqz v2, :cond_8

    :try_start_9
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_7

    :catch_7
    :cond_8
    invoke-direct {p0}, Lb/a/d/a/e/b$g;->m()V

    goto :goto_b

    :goto_a
    throw v0

    :goto_b
    goto :goto_a
.end method

.method private s(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "requestHeaders"

    invoke-virtual {p0, p1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method

.method private t(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "responseHeaders"

    invoke-virtual {p0, p1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method

.method private u()V
    .locals 2

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "success"

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method


# virtual methods
.method public n()V
    .locals 9

    :try_start_0
    invoke-static {}, Lb/a/d/a/e/b;->J()Ljava/util/logging/Logger;

    move-result-object v0

    const-string v1, "xhr open %s: %s"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Object;

    iget-object v4, p0, Lb/a/d/a/e/b$g;->b:Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget-object v4, p0, Lb/a/d/a/e/b$g;->c:Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    new-instance v0, Ljava/net/URL;

    iget-object v1, p0, Lb/a/d/a/e/b$g;->c:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lb/a/d/a/e/b$g;->h:Ljava/net/Proxy;

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v0

    :goto_0
    check-cast v0, Ljava/net/HttpURLConnection;

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    goto :goto_0

    :goto_1
    iput-object v0, p0, Lb/a/d/a/e/b$g;->f:Ljava/net/HttpURLConnection;

    iget-object v1, p0, Lb/a/d/a/e/b$g;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v0, p0, Lb/a/d/a/e/b$g;->f:Ljava/net/HttpURLConnection;

    const/16 v1, 0x2710

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    iget-object v0, p0, Lb/a/d/a/e/b$g;->f:Ljava/net/HttpURLConnection;

    instance-of v1, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lb/a/d/a/e/b$g;->e:Ljavax/net/ssl/SSLContext;

    if-eqz v1, :cond_1

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    :cond_1
    iget-object v0, p0, Lb/a/d/a/e/b$g;->g:Ljavax/net/ssl/HostnameVerifier;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lb/a/d/a/e/b$g;->f:Ljava/net/HttpURLConnection;

    check-cast v1, Ljavax/net/ssl/HttpsURLConnection;

    invoke-virtual {v1, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    :cond_2
    new-instance v0, Ljava/util/TreeMap;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    iget-object v1, p0, Lb/a/d/a/e/b$g;->b:Ljava/lang/String;

    const-string v3, "POST"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lb/a/d/a/e/b$g;->f:Ljava/net/HttpURLConnection;

    invoke-virtual {v1, v6}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    new-instance v1, Ljava/util/LinkedList;

    new-array v3, v6, [Ljava/lang/String;

    const-string v4, "application/octet-stream"

    aput-object v4, v3, v5

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    const-string v3, "Content-type"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    invoke-direct {p0, v0}, Lb/a/d/a/e/b$g;->s(Ljava/util/Map;)V

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v7, p0, Lb/a/d/a/e/b$g;->f:Ljava/net/HttpURLConnection;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8, v4}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_5
    invoke-static {}, Lb/a/d/a/e/b;->J()Ljava/util/logging/Logger;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    iget-object v2, p0, Lb/a/d/a/e/b$g;->c:Ljava/lang/String;

    aput-object v2, v1, v5

    iget-object v2, p0, Lb/a/d/a/e/b$g;->d:[B

    aput-object v2, v1, v6

    const-string v2, "sending xhr with url %s | data %s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lb/a/d/a/e/b$g$a;

    invoke-direct {v1, p0, p0}, Lb/a/d/a/e/b$g$a;-><init>(Lb/a/d/a/e/b$g;Lb/a/d/a/e/b$g;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void

    :catch_0
    move-exception v0

    invoke-direct {p0, v0}, Lb/a/d/a/e/b$g;->q(Ljava/lang/Exception;)V

    return-void
.end method
