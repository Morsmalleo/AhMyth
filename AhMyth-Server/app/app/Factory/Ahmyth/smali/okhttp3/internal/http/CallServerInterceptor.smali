.class public final Lokhttp3/internal/http/CallServerInterceptor;
.super Ljava/lang/Object;
.source "CallServerInterceptor.java"

# interfaces
.implements Lokhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/internal/http/CallServerInterceptor$CountingSink;
    }
.end annotation


# instance fields
.field private final forWebSocket:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .param p1, "forWebSocket"    # Z

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-boolean p1, p0, Lokhttp3/internal/http/CallServerInterceptor;->forWebSocket:Z

    .line 38
    return-void
.end method


# virtual methods
.method public intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;
    .locals 16
    .param p1, "chain"    # Lokhttp3/Interceptor$Chain;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    move-object/from16 v0, p1

    check-cast v0, Lokhttp3/internal/http/RealInterceptorChain;

    .line 42
    .local v0, "realChain":Lokhttp3/internal/http/RealInterceptorChain;
    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->httpStream()Lokhttp3/internal/http/HttpCodec;

    move-result-object v1

    .line 43
    .local v1, "httpCodec":Lokhttp3/internal/http/HttpCodec;
    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->streamAllocation()Lokhttp3/internal/connection/StreamAllocation;

    move-result-object v2

    .line 44
    .local v2, "streamAllocation":Lokhttp3/internal/connection/StreamAllocation;
    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->connection()Lokhttp3/Connection;

    move-result-object v3

    check-cast v3, Lokhttp3/internal/connection/RealConnection;

    .line 45
    .local v3, "connection":Lokhttp3/internal/connection/RealConnection;
    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->request()Lokhttp3/Request;

    move-result-object v4

    .line 47
    .local v4, "request":Lokhttp3/Request;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 49
    .local v5, "sentRequestMillis":J
    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->eventListener()Lokhttp3/EventListener;

    move-result-object v7

    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->call()Lokhttp3/Call;

    move-result-object v8

    invoke-virtual {v7, v8}, Lokhttp3/EventListener;->requestHeadersStart(Lokhttp3/Call;)V

    .line 50
    invoke-interface {v1, v4}, Lokhttp3/internal/http/HttpCodec;->writeRequestHeaders(Lokhttp3/Request;)V

    .line 51
    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->eventListener()Lokhttp3/EventListener;

    move-result-object v7

    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->call()Lokhttp3/Call;

    move-result-object v8

    invoke-virtual {v7, v8, v4}, Lokhttp3/EventListener;->requestHeadersEnd(Lokhttp3/Call;Lokhttp3/Request;)V

    .line 53
    const/4 v7, 0x0

    .line 54
    .local v7, "responseBuilder":Lokhttp3/Response$Builder;
    invoke-virtual {v4}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lokhttp3/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-virtual {v4}, Lokhttp3/Request;->body()Lokhttp3/RequestBody;

    move-result-object v8

    if-eqz v8, :cond_2

    .line 58
    const-string v8, "Expect"

    invoke-virtual {v4, v8}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "100-continue"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 59
    invoke-interface {v1}, Lokhttp3/internal/http/HttpCodec;->flushRequest()V

    .line 60
    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->eventListener()Lokhttp3/EventListener;

    move-result-object v8

    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->call()Lokhttp3/Call;

    move-result-object v9

    invoke-virtual {v8, v9}, Lokhttp3/EventListener;->responseHeadersStart(Lokhttp3/Call;)V

    .line 61
    const/4 v8, 0x1

    invoke-interface {v1, v8}, Lokhttp3/internal/http/HttpCodec;->readResponseHeaders(Z)Lokhttp3/Response$Builder;

    move-result-object v7

    .line 64
    :cond_0
    if-nez v7, :cond_1

    .line 66
    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->eventListener()Lokhttp3/EventListener;

    move-result-object v8

    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->call()Lokhttp3/Call;

    move-result-object v9

    invoke-virtual {v8, v9}, Lokhttp3/EventListener;->requestBodyStart(Lokhttp3/Call;)V

    .line 67
    invoke-virtual {v4}, Lokhttp3/Request;->body()Lokhttp3/RequestBody;

    move-result-object v8

    invoke-virtual {v8}, Lokhttp3/RequestBody;->contentLength()J

    move-result-wide v8

    .line 68
    .local v8, "contentLength":J
    new-instance v10, Lokhttp3/internal/http/CallServerInterceptor$CountingSink;

    .line 69
    invoke-interface {v1, v4, v8, v9}, Lokhttp3/internal/http/HttpCodec;->createRequestBody(Lokhttp3/Request;J)Lokio/Sink;

    move-result-object v11

    invoke-direct {v10, v11}, Lokhttp3/internal/http/CallServerInterceptor$CountingSink;-><init>(Lokio/Sink;)V

    .line 70
    .local v10, "requestBodyOut":Lokhttp3/internal/http/CallServerInterceptor$CountingSink;
    invoke-static {v10}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v11

    .line 72
    .local v11, "bufferedRequestBody":Lokio/BufferedSink;
    invoke-virtual {v4}, Lokhttp3/Request;->body()Lokhttp3/RequestBody;

    move-result-object v12

    invoke-virtual {v12, v11}, Lokhttp3/RequestBody;->writeTo(Lokio/BufferedSink;)V

    .line 73
    invoke-interface {v11}, Lokio/BufferedSink;->close()V

    .line 74
    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->eventListener()Lokhttp3/EventListener;

    move-result-object v12

    .line 75
    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->call()Lokhttp3/Call;

    move-result-object v13

    iget-wide v14, v10, Lokhttp3/internal/http/CallServerInterceptor$CountingSink;->successfulCount:J

    invoke-virtual {v12, v13, v14, v15}, Lokhttp3/EventListener;->requestBodyEnd(Lokhttp3/Call;J)V

    .end local v8    # "contentLength":J
    .end local v10    # "requestBodyOut":Lokhttp3/internal/http/CallServerInterceptor$CountingSink;
    .end local v11    # "bufferedRequestBody":Lokio/BufferedSink;
    goto :goto_0

    .line 76
    :cond_1
    invoke-virtual {v3}, Lokhttp3/internal/connection/RealConnection;->isMultiplexed()Z

    move-result v8

    if-nez v8, :cond_2

    .line 80
    invoke-virtual {v2}, Lokhttp3/internal/connection/StreamAllocation;->noNewStreams()V

    nop

    .line 84
    :cond_2
    :goto_0
    invoke-interface {v1}, Lokhttp3/internal/http/HttpCodec;->finishRequest()V

    .line 86
    const/4 v8, 0x0

    if-nez v7, :cond_3

    .line 87
    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->eventListener()Lokhttp3/EventListener;

    move-result-object v9

    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->call()Lokhttp3/Call;

    move-result-object v10

    invoke-virtual {v9, v10}, Lokhttp3/EventListener;->responseHeadersStart(Lokhttp3/Call;)V

    .line 88
    invoke-interface {v1, v8}, Lokhttp3/internal/http/HttpCodec;->readResponseHeaders(Z)Lokhttp3/Response$Builder;

    move-result-object v7

    .line 91
    :cond_3
    nop

    .line 92
    invoke-virtual {v7, v4}, Lokhttp3/Response$Builder;->request(Lokhttp3/Request;)Lokhttp3/Response$Builder;

    move-result-object v9

    .line 93
    invoke-virtual {v2}, Lokhttp3/internal/connection/StreamAllocation;->connection()Lokhttp3/internal/connection/RealConnection;

    move-result-object v10

    invoke-virtual {v10}, Lokhttp3/internal/connection/RealConnection;->handshake()Lokhttp3/Handshake;

    move-result-object v10

    invoke-virtual {v9, v10}, Lokhttp3/Response$Builder;->handshake(Lokhttp3/Handshake;)Lokhttp3/Response$Builder;

    move-result-object v9

    .line 94
    invoke-virtual {v9, v5, v6}, Lokhttp3/Response$Builder;->sentRequestAtMillis(J)Lokhttp3/Response$Builder;

    move-result-object v9

    .line 95
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Lokhttp3/Response$Builder;->receivedResponseAtMillis(J)Lokhttp3/Response$Builder;

    move-result-object v9

    .line 96
    invoke-virtual {v9}, Lokhttp3/Response$Builder;->build()Lokhttp3/Response;

    move-result-object v9

    .line 98
    .local v9, "response":Lokhttp3/Response;
    invoke-virtual {v9}, Lokhttp3/Response;->code()I

    move-result v10

    .line 99
    .local v10, "code":I
    const/16 v11, 0x64

    if-ne v10, v11, :cond_4

    .line 102
    invoke-interface {v1, v8}, Lokhttp3/internal/http/HttpCodec;->readResponseHeaders(Z)Lokhttp3/Response$Builder;

    move-result-object v7

    .line 104
    nop

    .line 105
    invoke-virtual {v7, v4}, Lokhttp3/Response$Builder;->request(Lokhttp3/Request;)Lokhttp3/Response$Builder;

    move-result-object v8

    .line 106
    invoke-virtual {v2}, Lokhttp3/internal/connection/StreamAllocation;->connection()Lokhttp3/internal/connection/RealConnection;

    move-result-object v11

    invoke-virtual {v11}, Lokhttp3/internal/connection/RealConnection;->handshake()Lokhttp3/Handshake;

    move-result-object v11

    invoke-virtual {v8, v11}, Lokhttp3/Response$Builder;->handshake(Lokhttp3/Handshake;)Lokhttp3/Response$Builder;

    move-result-object v8

    .line 107
    invoke-virtual {v8, v5, v6}, Lokhttp3/Response$Builder;->sentRequestAtMillis(J)Lokhttp3/Response$Builder;

    move-result-object v8

    .line 108
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    invoke-virtual {v8, v11, v12}, Lokhttp3/Response$Builder;->receivedResponseAtMillis(J)Lokhttp3/Response$Builder;

    move-result-object v8

    .line 109
    invoke-virtual {v8}, Lokhttp3/Response$Builder;->build()Lokhttp3/Response;

    move-result-object v9

    .line 111
    invoke-virtual {v9}, Lokhttp3/Response;->code()I

    move-result v10

    .line 114
    :cond_4
    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->eventListener()Lokhttp3/EventListener;

    move-result-object v8

    .line 115
    invoke-virtual {v0}, Lokhttp3/internal/http/RealInterceptorChain;->call()Lokhttp3/Call;

    move-result-object v11

    invoke-virtual {v8, v11, v9}, Lokhttp3/EventListener;->responseHeadersEnd(Lokhttp3/Call;Lokhttp3/Response;)V

    .line 117
    move-object/from16 v8, p0

    iget-boolean v11, v8, Lokhttp3/internal/http/CallServerInterceptor;->forWebSocket:Z

    if-eqz v11, :cond_5

    const/16 v11, 0x65

    if-ne v10, v11, :cond_5

    .line 119
    invoke-virtual {v9}, Lokhttp3/Response;->newBuilder()Lokhttp3/Response$Builder;

    move-result-object v11

    sget-object v12, Lokhttp3/internal/Util;->EMPTY_RESPONSE:Lokhttp3/ResponseBody;

    .line 120
    invoke-virtual {v11, v12}, Lokhttp3/Response$Builder;->body(Lokhttp3/ResponseBody;)Lokhttp3/Response$Builder;

    move-result-object v11

    .line 121
    invoke-virtual {v11}, Lokhttp3/Response$Builder;->build()Lokhttp3/Response;

    move-result-object v9

    goto :goto_1

    .line 123
    :cond_5
    invoke-virtual {v9}, Lokhttp3/Response;->newBuilder()Lokhttp3/Response$Builder;

    move-result-object v11

    .line 124
    invoke-interface {v1, v9}, Lokhttp3/internal/http/HttpCodec;->openResponseBody(Lokhttp3/Response;)Lokhttp3/ResponseBody;

    move-result-object v12

    invoke-virtual {v11, v12}, Lokhttp3/Response$Builder;->body(Lokhttp3/ResponseBody;)Lokhttp3/Response$Builder;

    move-result-object v11

    .line 125
    invoke-virtual {v11}, Lokhttp3/Response$Builder;->build()Lokhttp3/Response;

    move-result-object v9

    .line 128
    :goto_1
    invoke-virtual {v9}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v11

    const-string v12, "Connection"

    invoke-virtual {v11, v12}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "close"

    invoke-virtual {v13, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_6

    .line 129
    invoke-virtual {v9, v12}, Lokhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v13, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 130
    :cond_6
    invoke-virtual {v2}, Lokhttp3/internal/connection/StreamAllocation;->noNewStreams()V

    .line 133
    :cond_7
    const/16 v11, 0xcc

    if-eq v10, v11, :cond_8

    const/16 v11, 0xcd

    if-ne v10, v11, :cond_9

    :cond_8
    invoke-virtual {v9}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v11

    invoke-virtual {v11}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v11

    const-wide/16 v13, 0x0

    cmp-long v15, v11, v13

    if-gtz v15, :cond_a

    .line 138
    :cond_9
    return-object v9

    .line 134
    :cond_a
    new-instance v11, Ljava/net/ProtocolException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "HTTP "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " had non-zero Content-Length: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    .line 135
    invoke-virtual {v9}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v13

    invoke-virtual {v13}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v13

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v11
.end method
