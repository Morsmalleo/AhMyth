.class public Lorg/json/HTTPTokener;
.super Lorg/json/JSONTokener;
.source "HTTPTokener.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 41
    return-void
.end method


# virtual methods
.method public nextToken()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 52
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 54
    :goto_0
    invoke-virtual {p0}, Lorg/json/HTTPTokener;->next()C

    move-result v1

    .line 55
    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-nez v2, :cond_6

    .line 56
    const/16 v2, 0x22

    if-eq v1, v2, :cond_3

    const/16 v2, 0x27

    if-ne v1, v2, :cond_0

    goto :goto_3

    .line 70
    :cond_0
    :goto_1
    if-eqz v1, :cond_2

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_2

    .line 73
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 74
    invoke-virtual {p0}, Lorg/json/HTTPTokener;->next()C

    move-result v1

    goto :goto_1

    .line 71
    :cond_2
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 57
    :cond_3
    :goto_3
    nop

    .line 59
    :goto_4
    invoke-virtual {p0}, Lorg/json/HTTPTokener;->next()C

    move-result v2

    .line 60
    const/16 v3, 0x20

    if-lt v2, v3, :cond_5

    .line 63
    if-ne v2, v1, :cond_4

    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 66
    :cond_4
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_4

    .line 61
    :cond_5
    const-string v0, "Unterminated string."

    invoke-virtual {p0, v0}, Lorg/json/HTTPTokener;->syntaxError(Ljava/lang/String;)Lorg/json/JSONException;

    move-result-object v0

    throw v0

    .line 55
    :cond_6
    goto :goto_0
.end method
