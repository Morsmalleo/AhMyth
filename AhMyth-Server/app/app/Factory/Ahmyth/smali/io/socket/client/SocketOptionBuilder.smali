.class public Lio/socket/client/SocketOptionBuilder;
.super Ljava/lang/Object;
.source "SocketOptionBuilder.java"


# instance fields
.field private final options:Lio/socket/client/IO$Options;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 48
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lio/socket/client/SocketOptionBuilder;-><init>(Lio/socket/client/IO$Options;)V

    .line 49
    return-void
.end method

.method protected constructor <init>(Lio/socket/client/IO$Options;)V
    .locals 3
    .param p1, "options"    # Lio/socket/client/IO$Options;

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Lio/socket/client/IO$Options;

    invoke-direct {v0}, Lio/socket/client/IO$Options;-><init>()V

    iput-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    .line 62
    if-eqz p1, :cond_0

    .line 63
    iget-boolean v0, p1, Lio/socket/client/IO$Options;->forceNew:Z

    invoke-virtual {p0, v0}, Lio/socket/client/SocketOptionBuilder;->setForceNew(Z)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-boolean v1, p1, Lio/socket/client/IO$Options;->multiplex:Z

    .line 64
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setMultiplex(Z)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-boolean v1, p1, Lio/socket/client/IO$Options;->reconnection:Z

    .line 65
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setReconnection(Z)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget v1, p1, Lio/socket/client/IO$Options;->reconnectionAttempts:I

    .line 66
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setReconnectionAttempts(I)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-wide v1, p1, Lio/socket/client/IO$Options;->reconnectionDelay:J

    .line 67
    invoke-virtual {v0, v1, v2}, Lio/socket/client/SocketOptionBuilder;->setReconnectionDelay(J)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-wide v1, p1, Lio/socket/client/IO$Options;->reconnectionDelayMax:J

    .line 68
    invoke-virtual {v0, v1, v2}, Lio/socket/client/SocketOptionBuilder;->setReconnectionDelayMax(J)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-wide v1, p1, Lio/socket/client/IO$Options;->randomizationFactor:D

    .line 69
    invoke-virtual {v0, v1, v2}, Lio/socket/client/SocketOptionBuilder;->setRandomizationFactor(D)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-wide v1, p1, Lio/socket/client/IO$Options;->timeout:J

    .line 70
    invoke-virtual {v0, v1, v2}, Lio/socket/client/SocketOptionBuilder;->setTimeout(J)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-object v1, p1, Lio/socket/client/IO$Options;->transports:[Ljava/lang/String;

    .line 71
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setTransports([Ljava/lang/String;)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-boolean v1, p1, Lio/socket/client/IO$Options;->upgrade:Z

    .line 72
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setUpgrade(Z)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-boolean v1, p1, Lio/socket/client/IO$Options;->rememberUpgrade:Z

    .line 73
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setRememberUpgrade(Z)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-object v1, p1, Lio/socket/client/IO$Options;->host:Ljava/lang/String;

    .line 74
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setHost(Ljava/lang/String;)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-object v1, p1, Lio/socket/client/IO$Options;->hostname:Ljava/lang/String;

    .line 75
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setHostname(Ljava/lang/String;)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget v1, p1, Lio/socket/client/IO$Options;->port:I

    .line 76
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setPort(I)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget v1, p1, Lio/socket/client/IO$Options;->policyPort:I

    .line 77
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setPolicyPort(I)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-boolean v1, p1, Lio/socket/client/IO$Options;->secure:Z

    .line 78
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setSecure(Z)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-object v1, p1, Lio/socket/client/IO$Options;->path:Ljava/lang/String;

    .line 79
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setPath(Ljava/lang/String;)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-object v1, p1, Lio/socket/client/IO$Options;->query:Ljava/lang/String;

    .line 80
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setQuery(Ljava/lang/String;)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-object v1, p1, Lio/socket/client/IO$Options;->auth:Ljava/util/Map;

    .line 81
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setAuth(Ljava/util/Map;)Lio/socket/client/SocketOptionBuilder;

    move-result-object v0

    iget-object v1, p1, Lio/socket/client/IO$Options;->extraHeaders:Ljava/util/Map;

    .line 82
    invoke-virtual {v0, v1}, Lio/socket/client/SocketOptionBuilder;->setExtraHeaders(Ljava/util/Map;)Lio/socket/client/SocketOptionBuilder;

    .line 84
    :cond_0
    return-void
.end method

.method public static builder()Lio/socket/client/SocketOptionBuilder;
    .locals 1

    .line 22
    new-instance v0, Lio/socket/client/SocketOptionBuilder;

    invoke-direct {v0}, Lio/socket/client/SocketOptionBuilder;-><init>()V

    return-object v0
.end method

.method public static builder(Lio/socket/client/IO$Options;)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p0, "options"    # Lio/socket/client/IO$Options;

    .line 37
    new-instance v0, Lio/socket/client/SocketOptionBuilder;

    invoke-direct {v0, p0}, Lio/socket/client/SocketOptionBuilder;-><init>(Lio/socket/client/IO$Options;)V

    return-object v0
.end method


# virtual methods
.method public build()Lio/socket/client/IO$Options;
    .locals 1

    .line 194
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    return-object v0
.end method

.method public setAuth(Ljava/util/Map;)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lio/socket/client/SocketOptionBuilder;"
        }
    .end annotation

    .line 178
    .local p1, "auth":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-object p1, v0, Lio/socket/client/IO$Options;->auth:Ljava/util/Map;

    .line 179
    return-object p0
.end method

.method public setExtraHeaders(Ljava/util/Map;)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lio/socket/client/SocketOptionBuilder;"
        }
    .end annotation

    .line 183
    .local p1, "extraHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-object p1, v0, Lio/socket/client/IO$Options;->extraHeaders:Ljava/util/Map;

    .line 184
    return-object p0
.end method

.method public setForceNew(Z)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "forceNew"    # Z

    .line 87
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-boolean p1, v0, Lio/socket/client/IO$Options;->forceNew:Z

    .line 88
    return-object p0
.end method

.method public setHost(Ljava/lang/String;)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "host"    # Ljava/lang/String;

    .line 143
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-object p1, v0, Lio/socket/client/IO$Options;->host:Ljava/lang/String;

    .line 144
    return-object p0
.end method

.method public setHostname(Ljava/lang/String;)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "hostname"    # Ljava/lang/String;

    .line 148
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-object p1, v0, Lio/socket/client/IO$Options;->hostname:Ljava/lang/String;

    .line 149
    return-object p0
.end method

.method public setMultiplex(Z)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "multiplex"    # Z

    .line 92
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-boolean p1, v0, Lio/socket/client/IO$Options;->multiplex:Z

    .line 93
    return-object p0
.end method

.method public setPath(Ljava/lang/String;)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .line 173
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-object p1, v0, Lio/socket/client/IO$Options;->path:Ljava/lang/String;

    .line 174
    return-object p0
.end method

.method public setPolicyPort(I)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "policyPort"    # I

    .line 158
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput p1, v0, Lio/socket/client/IO$Options;->policyPort:I

    .line 159
    return-object p0
.end method

.method public setPort(I)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "port"    # I

    .line 153
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput p1, v0, Lio/socket/client/IO$Options;->port:I

    .line 154
    return-object p0
.end method

.method public setQuery(Ljava/lang/String;)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .line 163
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-object p1, v0, Lio/socket/client/IO$Options;->query:Ljava/lang/String;

    .line 164
    return-object p0
.end method

.method public setRandomizationFactor(D)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "randomizationFactor"    # D

    .line 118
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-wide p1, v0, Lio/socket/client/IO$Options;->randomizationFactor:D

    .line 119
    return-object p0
.end method

.method public setReconnection(Z)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "reconnection"    # Z

    .line 97
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-boolean p1, v0, Lio/socket/client/IO$Options;->reconnection:Z

    .line 98
    return-object p0
.end method

.method public setReconnectionAttempts(I)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "reconnectionAttempts"    # I

    .line 102
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput p1, v0, Lio/socket/client/IO$Options;->reconnectionAttempts:I

    .line 103
    return-object p0
.end method

.method public setReconnectionDelay(J)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "reconnectionDelay"    # J

    .line 107
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-wide p1, v0, Lio/socket/client/IO$Options;->reconnectionDelay:J

    .line 108
    return-object p0
.end method

.method public setReconnectionDelayMax(J)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "reconnectionDelayMax"    # J

    .line 112
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-wide p1, v0, Lio/socket/client/IO$Options;->reconnectionDelayMax:J

    .line 113
    return-object p0
.end method

.method public setRememberUpgrade(Z)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "rememberUpgrade"    # Z

    .line 138
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-boolean p1, v0, Lio/socket/client/IO$Options;->rememberUpgrade:Z

    .line 139
    return-object p0
.end method

.method public setSecure(Z)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "secure"    # Z

    .line 168
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-boolean p1, v0, Lio/socket/client/IO$Options;->secure:Z

    .line 169
    return-object p0
.end method

.method public setTimeout(J)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "timeout"    # J

    .line 123
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-wide p1, v0, Lio/socket/client/IO$Options;->timeout:J

    .line 124
    return-object p0
.end method

.method public setTransports([Ljava/lang/String;)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "transports"    # [Ljava/lang/String;

    .line 128
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-object p1, v0, Lio/socket/client/IO$Options;->transports:[Ljava/lang/String;

    .line 129
    return-object p0
.end method

.method public setUpgrade(Z)Lio/socket/client/SocketOptionBuilder;
    .locals 1
    .param p1, "upgrade"    # Z

    .line 133
    iget-object v0, p0, Lio/socket/client/SocketOptionBuilder;->options:Lio/socket/client/IO$Options;

    iput-boolean p1, v0, Lio/socket/client/IO$Options;->upgrade:Z

    .line 134
    return-object p0
.end method
