.class public Lio/socket/engineio/client/HandshakeData;
.super Ljava/lang/Object;
.source "HandshakeData.java"


# instance fields
.field public pingInterval:J

.field public pingTimeout:J

.field public sid:Ljava/lang/String;

.field public upgrades:[Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 16
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lio/socket/engineio/client/HandshakeData;-><init>(Lorg/json/JSONObject;)V

    return-void
.end method

.method constructor <init>(Lorg/json/JSONObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "upgrades"

    .line 20
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    .line 22
    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    .line 24
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    const-string v0, "sid"

    .line 27
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/socket/engineio/client/HandshakeData;->sid:Ljava/lang/String;

    .line 28
    iput-object v2, p0, Lio/socket/engineio/client/HandshakeData;->upgrades:[Ljava/lang/String;

    const-string v0, "pingInterval"

    .line 29
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lio/socket/engineio/client/HandshakeData;->pingInterval:J

    const-string v0, "pingTimeout"

    .line 30
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lio/socket/engineio/client/HandshakeData;->pingTimeout:J

    return-void
.end method
