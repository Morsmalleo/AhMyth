.class public final Lokhttp3/internal/http/HttpHeaders;
.super Ljava/lang/Object;
.source "HttpHeaders.java"


# static fields
.field private static final QUOTED_STRING_DELIMITERS:Lokio/ByteString;

.field private static final TOKEN_DELIMITERS:Lokio/ByteString;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    const-string v0, "\"\\"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http/HttpHeaders;->QUOTED_STRING_DELIMITERS:Lokio/ByteString;

    .line 45
    const-string v0, "\t ,="

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http/HttpHeaders;->TOKEN_DELIMITERS:Lokio/ByteString;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method public static contentLength(Lokhttp3/Headers;)J
    .locals 2
    .param p0, "headers"    # Lokhttp3/Headers;

    .line 55
    const-string v0, "Content-Length"

    invoke-virtual {p0, v0}, Lokhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/internal/http/HttpHeaders;->stringToLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static contentLength(Lokhttp3/Response;)J
    .locals 2
    .param p0, "response"    # Lokhttp3/Response;

    .line 51
    invoke-virtual {p0}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/internal/http/HttpHeaders;->contentLength(Lokhttp3/Headers;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static hasBody(Lokhttp3/Response;)Z
    .locals 8
    .param p0, "response"    # Lokhttp3/Response;

    .line 324
    invoke-virtual {p0}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HEAD"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 325
    return v1

    .line 328
    :cond_0
    invoke-virtual {p0}, Lokhttp3/Response;->code()I

    move-result v0

    .line 329
    .local v0, "responseCode":I
    const/16 v2, 0x64

    const/4 v3, 0x1

    if-lt v0, v2, :cond_1

    const/16 v2, 0xc8

    if-lt v0, v2, :cond_2

    :cond_1
    const/16 v2, 0xcc

    if-eq v0, v2, :cond_2

    const/16 v2, 0x130

    if-eq v0, v2, :cond_2

    .line 332
    return v3

    .line 337
    :cond_2
    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->contentLength(Lokhttp3/Response;)J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v2, v4, v6

    if-nez v2, :cond_4

    .line 338
    const-string v2, "Transfer-Encoding"

    invoke-virtual {p0, v2}, Lokhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "chunked"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_0

    .line 342
    :cond_3
    return v1

    .line 339
    :cond_4
    :goto_0
    return v3
.end method

.method public static hasVaryAll(Lokhttp3/Headers;)Z
    .locals 2
    .param p0, "responseHeaders"    # Lokhttp3/Headers;

    .line 90
    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->varyFields(Lokhttp3/Headers;)Ljava/util/Set;

    move-result-object v0

    const-string v1, "*"

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static hasVaryAll(Lokhttp3/Response;)Z
    .locals 1
    .param p0, "response"    # Lokhttp3/Response;

    .line 83
    invoke-virtual {p0}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/internal/http/HttpHeaders;->hasVaryAll(Lokhttp3/Headers;)Z

    move-result v0

    return v0
.end method

.method private static parseChallengeHeader(Ljava/util/List;Lokio/Buffer;)V
    .locals 10
    .param p1, "header"    # Lokio/Buffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lokhttp3/Challenge;",
            ">;",
            "Lokio/Buffer;",
            ")V"
        }
    .end annotation

    .line 180
    .local p0, "result":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Challenge;>;"
    const/4 v0, 0x0

    .line 184
    .local v0, "peek":Ljava/lang/String;
    :goto_0
    if-nez v0, :cond_0

    .line 185
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->skipWhitespaceAndCommas(Lokio/Buffer;)Z

    .line 186
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->readToken(Lokio/Buffer;)Ljava/lang/String;

    move-result-object v0

    .line 187
    if-nez v0, :cond_0

    return-void

    .line 190
    :cond_0
    move-object v1, v0

    .line 193
    .local v1, "schemeName":Ljava/lang/String;
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->skipWhitespaceAndCommas(Lokio/Buffer;)Z

    move-result v2

    .line 194
    .local v2, "commaPrefixed":Z
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->readToken(Lokio/Buffer;)Ljava/lang/String;

    move-result-object v0

    .line 195
    if-nez v0, :cond_2

    .line 196
    invoke-virtual {p1}, Lokio/Buffer;->exhausted()Z

    move-result v3

    if-nez v3, :cond_1

    return-void

    .line 197
    :cond_1
    new-instance v3, Lokhttp3/Challenge;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lokhttp3/Challenge;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    invoke-interface {p0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    return-void

    .line 201
    :cond_2
    const/16 v3, 0x3d

    invoke-static {p1, v3}, Lokhttp3/internal/http/HttpHeaders;->skipAll(Lokio/Buffer;B)I

    move-result v4

    .line 202
    .local v4, "eqCount":I
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->skipWhitespaceAndCommas(Lokio/Buffer;)Z

    move-result v5

    .line 205
    .local v5, "commaSuffixed":Z
    if-nez v2, :cond_4

    if-nez v5, :cond_3

    invoke-virtual {p1}, Lokio/Buffer;->exhausted()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 206
    :cond_3
    new-instance v6, Lokhttp3/Challenge;

    const/4 v7, 0x0

    check-cast v7, Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 207
    invoke-static {v3, v4}, Lokhttp3/internal/http/HttpHeaders;->repeat(CI)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 206
    invoke-static {v7, v3}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v3

    invoke-direct {v6, v1, v3}, Lokhttp3/Challenge;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    invoke-interface {p0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    const/4 v0, 0x0

    .line 209
    goto :goto_0

    .line 213
    :cond_4
    new-instance v6, Ljava/util/LinkedHashMap;

    invoke-direct {v6}, Ljava/util/LinkedHashMap;-><init>()V

    .line 214
    .local v6, "parameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p1, v3}, Lokhttp3/internal/http/HttpHeaders;->skipAll(Lokio/Buffer;B)I

    move-result v7

    add-int/2addr v4, v7

    .line 216
    :goto_1
    if-nez v0, :cond_6

    .line 217
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->readToken(Lokio/Buffer;)Ljava/lang/String;

    move-result-object v0

    .line 218
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->skipWhitespaceAndCommas(Lokio/Buffer;)Z

    move-result v7

    if-eqz v7, :cond_5

    goto :goto_2

    .line 219
    :cond_5
    invoke-static {p1, v3}, Lokhttp3/internal/http/HttpHeaders;->skipAll(Lokio/Buffer;B)I

    move-result v4

    .line 221
    :cond_6
    if-nez v4, :cond_7

    .line 234
    :goto_2
    new-instance v3, Lokhttp3/Challenge;

    invoke-direct {v3, v1, v6}, Lokhttp3/Challenge;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    invoke-interface {p0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 235
    .end local v1    # "schemeName":Ljava/lang/String;
    .end local v2    # "commaPrefixed":Z
    .end local v4    # "eqCount":I
    .end local v5    # "commaSuffixed":Z
    .end local v6    # "parameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    goto/16 :goto_0

    .line 222
    .restart local v1    # "schemeName":Ljava/lang/String;
    .restart local v2    # "commaPrefixed":Z
    .restart local v4    # "eqCount":I
    .restart local v5    # "commaSuffixed":Z
    .restart local v6    # "parameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_7
    const/4 v7, 0x1

    if-le v4, v7, :cond_8

    return-void

    .line 223
    :cond_8
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->skipWhitespaceAndCommas(Lokio/Buffer;)Z

    move-result v7

    if-eqz v7, :cond_9

    return-void

    .line 225
    :cond_9
    invoke-virtual {p1}, Lokio/Buffer;->exhausted()Z

    move-result v7

    if-nez v7, :cond_a

    const-wide/16 v7, 0x0

    invoke-virtual {p1, v7, v8}, Lokio/Buffer;->getByte(J)B

    move-result v7

    const/16 v8, 0x22

    if-ne v7, v8, :cond_a

    .line 226
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->readQuotedString(Lokio/Buffer;)Ljava/lang/String;

    move-result-object v7

    goto :goto_3

    .line 227
    :cond_a
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->readToken(Lokio/Buffer;)Ljava/lang/String;

    move-result-object v7

    :goto_3
    nop

    .line 228
    .local v7, "parameterValue":Ljava/lang/String;
    if-nez v7, :cond_b

    return-void

    .line 229
    :cond_b
    invoke-interface {v6, v0, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 230
    .local v8, "replaced":Ljava/lang/String;
    const/4 v0, 0x0

    .line 231
    if-eqz v8, :cond_c

    return-void

    .line 232
    :cond_c
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->skipWhitespaceAndCommas(Lokio/Buffer;)Z

    move-result v9

    if-nez v9, :cond_d

    invoke-virtual {p1}, Lokio/Buffer;->exhausted()Z

    move-result v9

    if-nez v9, :cond_d

    return-void

    .line 233
    .end local v7    # "parameterValue":Ljava/lang/String;
    .end local v8    # "replaced":Ljava/lang/String;
    :cond_d
    goto :goto_1
.end method

.method public static parseChallenges(Lokhttp3/Headers;Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .param p0, "responseHeaders"    # Lokhttp3/Headers;
    .param p1, "headerName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Headers;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lokhttp3/Challenge;",
            ">;"
        }
    .end annotation

    .line 169
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 170
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Challenge;>;"
    const/4 v1, 0x0

    .local v1, "h":I
    :goto_0
    invoke-virtual {p0}, Lokhttp3/Headers;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 171
    invoke-virtual {p0, v1}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 172
    new-instance v2, Lokio/Buffer;

    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    invoke-virtual {p0, v1}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    move-result-object v2

    .line 173
    .local v2, "header":Lokio/Buffer;
    invoke-static {v0, v2}, Lokhttp3/internal/http/HttpHeaders;->parseChallengeHeader(Ljava/util/List;Lokio/Buffer;)V

    .line 170
    .end local v2    # "header":Lokio/Buffer;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 176
    .end local v1    # "h":I
    :cond_1
    return-object v0
.end method

.method public static parseSeconds(Ljava/lang/String;I)I
    .locals 5
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "defaultValue"    # I

    .line 378
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 379
    .local v0, "seconds":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 380
    const v2, 0x7fffffff

    return v2

    .line 381
    :cond_0
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_1

    .line 382
    const/4 v2, 0x0

    return v2

    .line 384
    :cond_1
    long-to-int v2, v0

    return v2

    .line 386
    .end local v0    # "seconds":J
    :catch_0
    move-exception v0

    .line 387
    .local v0, "e":Ljava/lang/NumberFormatException;
    return p1
.end method

.method private static readQuotedString(Lokio/Buffer;)Ljava/lang/String;
    .locals 12
    .param p0, "buffer"    # Lokio/Buffer;

    .line 270
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v0

    const/16 v1, 0x22

    if-ne v0, v1, :cond_3

    .line 271
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 273
    .local v0, "result":Lokio/Buffer;
    :goto_0
    sget-object v2, Lokhttp3/internal/http/HttpHeaders;->QUOTED_STRING_DELIMITERS:Lokio/ByteString;

    invoke-virtual {p0, v2}, Lokio/Buffer;->indexOfElement(Lokio/ByteString;)J

    move-result-wide v2

    .line 274
    .local v2, "i":J
    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    cmp-long v7, v2, v4

    if-nez v7, :cond_0

    return-object v6

    .line 276
    :cond_0
    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->getByte(J)B

    move-result v4

    if-ne v4, v1, :cond_1

    .line 277
    invoke-virtual {v0, p0, v2, v3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 278
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    .line 279
    invoke-virtual {v0}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 282
    :cond_1
    invoke-virtual {p0}, Lokio/Buffer;->size()J

    move-result-wide v4

    const-wide/16 v7, 0x1

    add-long v9, v2, v7

    cmp-long v11, v4, v9

    if-nez v11, :cond_2

    return-object v6

    .line 283
    :cond_2
    invoke-virtual {v0, p0, v2, v3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 284
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    .line 285
    invoke-virtual {v0, p0, v7, v8}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 286
    .end local v2    # "i":J
    goto :goto_0

    .line 270
    .end local v0    # "result":Lokio/Buffer;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method private static readToken(Lokio/Buffer;)Ljava/lang/String;
    .locals 5
    .param p0, "buffer"    # Lokio/Buffer;

    .line 295
    :try_start_0
    sget-object v0, Lokhttp3/internal/http/HttpHeaders;->TOKEN_DELIMITERS:Lokio/ByteString;

    invoke-virtual {p0, v0}, Lokio/Buffer;->indexOfElement(Lokio/ByteString;)J

    move-result-wide v0

    .line 296
    .local v0, "tokenSize":J
    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    invoke-virtual {p0}, Lokio/Buffer;->size()J

    move-result-wide v2

    move-wide v0, v2

    .line 298
    :cond_0
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    .line 299
    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 300
    :cond_1
    const/4 v2, 0x0

    .line 298
    :goto_0
    return-object v2

    .line 301
    .end local v0    # "tokenSize":J
    :catch_0
    move-exception v0

    .line 302
    .local v0, "e":Ljava/io/EOFException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public static receiveHeaders(Lokhttp3/CookieJar;Lokhttp3/HttpUrl;Lokhttp3/Headers;)V
    .locals 2
    .param p0, "cookieJar"    # Lokhttp3/CookieJar;
    .param p1, "url"    # Lokhttp3/HttpUrl;
    .param p2, "headers"    # Lokhttp3/Headers;

    .line 313
    sget-object v0, Lokhttp3/CookieJar;->NO_COOKIES:Lokhttp3/CookieJar;

    if-ne p0, v0, :cond_0

    return-void

    .line 315
    :cond_0
    invoke-static {p1, p2}, Lokhttp3/Cookie;->parseAll(Lokhttp3/HttpUrl;Lokhttp3/Headers;)Ljava/util/List;

    move-result-object v0

    .line 316
    .local v0, "cookies":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Cookie;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    .line 318
    :cond_1
    invoke-interface {p0, p1, v0}, Lokhttp3/CookieJar;->saveFromResponse(Lokhttp3/HttpUrl;Ljava/util/List;)V

    .line 319
    return-void
.end method

.method private static repeat(CI)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # C
    .param p1, "count"    # I

    .line 307
    new-array v0, p1, [C

    .line 308
    .local v0, "array":[C
    invoke-static {v0, p0}, Ljava/util/Arrays;->fill([CC)V

    .line 309
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    return-object v1
.end method

.method private static skipAll(Lokio/Buffer;B)I
    .locals 3
    .param p0, "buffer"    # Lokio/Buffer;
    .param p1, "b"    # B

    .line 256
    const/4 v0, 0x0

    .line 257
    .local v0, "count":I
    :goto_0
    invoke-virtual {p0}, Lokio/Buffer;->exhausted()Z

    move-result v1

    if-nez v1, :cond_0

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v1, v2}, Lokio/Buffer;->getByte(J)B

    move-result v1

    if-ne v1, p1, :cond_0

    .line 258
    add-int/lit8 v0, v0, 0x1

    .line 259
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    goto :goto_0

    .line 261
    :cond_0
    return v0
.end method

.method public static skipUntil(Ljava/lang/String;ILjava/lang/String;)I
    .locals 2
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "characters"    # Ljava/lang/String;

    .line 350
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 351
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 352
    goto :goto_1

    .line 350
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 355
    :cond_1
    :goto_1
    return p1
.end method

.method public static skipWhitespace(Ljava/lang/String;I)I
    .locals 2
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "pos"    # I

    .line 363
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 364
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 365
    .local v0, "c":C
    const/16 v1, 0x20

    if-eq v0, v1, :cond_0

    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    .line 366
    goto :goto_1

    .line 363
    .end local v0    # "c":C
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 369
    :cond_1
    :goto_1
    return p1
.end method

.method private static skipWhitespaceAndCommas(Lokio/Buffer;)Z
    .locals 3
    .param p0, "buffer"    # Lokio/Buffer;

    .line 240
    const/4 v0, 0x0

    .line 241
    .local v0, "commaFound":Z
    :goto_0
    invoke-virtual {p0}, Lokio/Buffer;->exhausted()Z

    move-result v1

    if-nez v1, :cond_2

    .line 242
    const-wide/16 v1, 0x0

    invoke-virtual {p0, v1, v2}, Lokio/Buffer;->getByte(J)B

    move-result v1

    .line 243
    .local v1, "b":B
    const/16 v2, 0x2c

    if-ne v1, v2, :cond_0

    .line 244
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    .line 245
    const/4 v0, 0x1

    goto :goto_1

    .line 246
    :cond_0
    const/16 v2, 0x20

    if-eq v1, v2, :cond_1

    const/16 v2, 0x9

    if-ne v1, v2, :cond_2

    .line 247
    :cond_1
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    .line 251
    .end local v1    # "b":B
    :goto_1
    goto :goto_0

    .line 252
    :cond_2
    return v0
.end method

.method private static stringToLong(Ljava/lang/String;)J
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .line 59
    const-wide/16 v0, -0x1

    if-nez p0, :cond_0

    return-wide v0

    .line 61
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 62
    :catch_0
    move-exception v2

    .line 63
    .local v2, "e":Ljava/lang/NumberFormatException;
    return-wide v0
.end method

.method public static varyFields(Lokhttp3/Headers;)Ljava/util/Set;
    .locals 9
    .param p0, "responseHeaders"    # Lokhttp3/Headers;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Headers;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 101
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    .line 102
    .local v0, "result":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Lokhttp3/Headers;->size()I

    move-result v2

    .local v2, "size":I
    :goto_0
    if-ge v1, v2, :cond_3

    .line 103
    invoke-virtual {p0, v1}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "Vary"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_2

    .line 105
    :cond_0
    invoke-virtual {p0, v1}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v3

    .line 106
    .local v3, "value":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 107
    new-instance v4, Ljava/util/TreeSet;

    sget-object v5, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v4, v5}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    move-object v0, v4

    .line 109
    :cond_1
    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v5, :cond_2

    aget-object v7, v4, v6

    .line 110
    .local v7, "varyField":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 109
    .end local v7    # "varyField":Ljava/lang/String;
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 102
    .end local v3    # "value":Ljava/lang/String;
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 113
    .end local v1    # "i":I
    .end local v2    # "size":I
    :cond_3
    return-object v0
.end method

.method private static varyFields(Lokhttp3/Response;)Ljava/util/Set;
    .locals 1
    .param p0, "response"    # Lokhttp3/Response;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Response;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 94
    invoke-virtual {p0}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/internal/http/HttpHeaders;->varyFields(Lokhttp3/Headers;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static varyHeaders(Lokhttp3/Headers;Lokhttp3/Headers;)Lokhttp3/Headers;
    .locals 6
    .param p0, "requestHeaders"    # Lokhttp3/Headers;
    .param p1, "responseHeaders"    # Lokhttp3/Headers;

    .line 134
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->varyFields(Lokhttp3/Headers;)Ljava/util/Set;

    move-result-object v0

    .line 135
    .local v0, "varyFields":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lokhttp3/Headers$Builder;

    invoke-direct {v1}, Lokhttp3/Headers$Builder;-><init>()V

    invoke-virtual {v1}, Lokhttp3/Headers$Builder;->build()Lokhttp3/Headers;

    move-result-object v1

    return-object v1

    .line 137
    :cond_0
    new-instance v1, Lokhttp3/Headers$Builder;

    invoke-direct {v1}, Lokhttp3/Headers$Builder;-><init>()V

    .line 138
    .local v1, "result":Lokhttp3/Headers$Builder;
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p0}, Lokhttp3/Headers;->size()I

    move-result v3

    .local v3, "size":I
    :goto_0
    if-ge v2, v3, :cond_2

    .line 139
    invoke-virtual {p0, v2}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v4

    .line 140
    .local v4, "fieldName":Ljava/lang/String;
    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 141
    invoke-virtual {p0, v2}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lokhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    .line 138
    .end local v4    # "fieldName":Ljava/lang/String;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 144
    .end local v2    # "i":I
    .end local v3    # "size":I
    :cond_2
    invoke-virtual {v1}, Lokhttp3/Headers$Builder;->build()Lokhttp3/Headers;

    move-result-object v2

    return-object v2
.end method

.method public static varyHeaders(Lokhttp3/Response;)Lokhttp3/Headers;
    .locals 3
    .param p0, "response"    # Lokhttp3/Response;

    .line 124
    invoke-virtual {p0}, Lokhttp3/Response;->networkResponse()Lokhttp3/Response;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request;->headers()Lokhttp3/Headers;

    move-result-object v0

    .line 125
    .local v0, "requestHeaders":Lokhttp3/Headers;
    invoke-virtual {p0}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v1

    .line 126
    .local v1, "responseHeaders":Lokhttp3/Headers;
    invoke-static {v0, v1}, Lokhttp3/internal/http/HttpHeaders;->varyHeaders(Lokhttp3/Headers;Lokhttp3/Headers;)Lokhttp3/Headers;

    move-result-object v2

    return-object v2
.end method

.method public static varyMatches(Lokhttp3/Response;Lokhttp3/Headers;Lokhttp3/Request;)Z
    .locals 4
    .param p0, "cachedResponse"    # Lokhttp3/Response;
    .param p1, "cachedRequest"    # Lokhttp3/Headers;
    .param p2, "newRequest"    # Lokhttp3/Request;

    .line 73
    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->varyFields(Lokhttp3/Response;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 74
    .local v1, "field":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lokhttp3/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {p2, v1}, Lokhttp3/Request;->headers(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-static {v2, v3}, Lokhttp3/internal/Util;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v0, 0x0

    return v0

    .line 75
    .end local v1    # "field":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 76
    :cond_1
    const/4 v0, 0x1

    return v0
.end method
