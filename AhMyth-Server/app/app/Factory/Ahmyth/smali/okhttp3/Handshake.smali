.class public final Lokhttp3/Handshake;
.super Ljava/lang/Object;
.source "Handshake.java"


# instance fields
.field private final cipherSuite:Lokhttp3/CipherSuite;

.field private final localCertificates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation
.end field

.field private final peerCertificates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation
.end field

.field private final tlsVersion:Lokhttp3/TlsVersion;


# direct methods
.method private constructor <init>(Lokhttp3/TlsVersion;Lokhttp3/CipherSuite;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .param p1, "tlsVersion"    # Lokhttp3/TlsVersion;
    .param p2, "cipherSuite"    # Lokhttp3/CipherSuite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/TlsVersion;",
            "Lokhttp3/CipherSuite;",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;)V"
        }
    .end annotation

    .line 43
    .local p3, "peerCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    .local p4, "localCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lokhttp3/Handshake;->tlsVersion:Lokhttp3/TlsVersion;

    .line 45
    iput-object p2, p0, Lokhttp3/Handshake;->cipherSuite:Lokhttp3/CipherSuite;

    .line 46
    iput-object p3, p0, Lokhttp3/Handshake;->peerCertificates:Ljava/util/List;

    .line 47
    iput-object p4, p0, Lokhttp3/Handshake;->localCertificates:Ljava/util/List;

    .line 48
    return-void
.end method

.method public static get(Ljavax/net/ssl/SSLSession;)Lokhttp3/Handshake;
    .locals 9
    .param p0, "session"    # Ljavax/net/ssl/SSLSession;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    invoke-interface {p0}, Ljavax/net/ssl/SSLSession;->getCipherSuite()Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "cipherSuiteString":Ljava/lang/String;
    if-eqz v0, :cond_5

    .line 53
    const-string v1, "SSL_NULL_WITH_NULL_NULL"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 56
    invoke-static {v0}, Lokhttp3/CipherSuite;->forJavaName(Ljava/lang/String;)Lokhttp3/CipherSuite;

    move-result-object v1

    .line 58
    .local v1, "cipherSuite":Lokhttp3/CipherSuite;
    invoke-interface {p0}, Ljavax/net/ssl/SSLSession;->getProtocol()Ljava/lang/String;

    move-result-object v2

    .line 59
    .local v2, "tlsVersionString":Ljava/lang/String;
    if-eqz v2, :cond_3

    .line 60
    const-string v3, "NONE"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 61
    invoke-static {v2}, Lokhttp3/TlsVersion;->forJavaName(Ljava/lang/String;)Lokhttp3/TlsVersion;

    move-result-object v3

    .line 65
    .local v3, "tlsVersion":Lokhttp3/TlsVersion;
    :try_start_0
    invoke-interface {p0}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v4
    :try_end_0
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .local v4, "peerCertificates":[Ljava/security/cert/Certificate;
    goto :goto_0

    .line 66
    .end local v4    # "peerCertificates":[Ljava/security/cert/Certificate;
    :catch_0
    move-exception v4

    .line 67
    .local v4, "ignored":Ljavax/net/ssl/SSLPeerUnverifiedException;
    const/4 v5, 0x0

    move-object v4, v5

    .line 69
    .local v4, "peerCertificates":[Ljava/security/cert/Certificate;
    :goto_0
    if-eqz v4, :cond_0

    .line 70
    invoke-static {v4}, Lokhttp3/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    goto :goto_1

    .line 71
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v5

    :goto_1
    nop

    .line 73
    .local v5, "peerCertificatesList":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    invoke-interface {p0}, Ljavax/net/ssl/SSLSession;->getLocalCertificates()[Ljava/security/cert/Certificate;

    move-result-object v6

    .line 74
    .local v6, "localCertificates":[Ljava/security/cert/Certificate;
    if-eqz v6, :cond_1

    .line 75
    invoke-static {v6}, Lokhttp3/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    goto :goto_2

    .line 76
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v7

    :goto_2
    nop

    .line 78
    .local v7, "localCertificatesList":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    new-instance v8, Lokhttp3/Handshake;

    invoke-direct {v8, v3, v1, v5, v7}, Lokhttp3/Handshake;-><init>(Lokhttp3/TlsVersion;Lokhttp3/CipherSuite;Ljava/util/List;Ljava/util/List;)V

    return-object v8

    .line 60
    .end local v3    # "tlsVersion":Lokhttp3/TlsVersion;
    .end local v4    # "peerCertificates":[Ljava/security/cert/Certificate;
    .end local v5    # "peerCertificatesList":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    .end local v6    # "localCertificates":[Ljava/security/cert/Certificate;
    .end local v7    # "localCertificatesList":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    :cond_2
    new-instance v3, Ljava/io/IOException;

    const-string v4, "tlsVersion == NONE"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 59
    :cond_3
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "tlsVersion == null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 54
    .end local v1    # "cipherSuite":Lokhttp3/CipherSuite;
    .end local v2    # "tlsVersionString":Ljava/lang/String;
    :cond_4
    new-instance v1, Ljava/io/IOException;

    const-string v2, "cipherSuite == SSL_NULL_WITH_NULL_NULL"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 52
    :cond_5
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "cipherSuite == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static get(Lokhttp3/TlsVersion;Lokhttp3/CipherSuite;Ljava/util/List;Ljava/util/List;)Lokhttp3/Handshake;
    .locals 3
    .param p0, "tlsVersion"    # Lokhttp3/TlsVersion;
    .param p1, "cipherSuite"    # Lokhttp3/CipherSuite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/TlsVersion;",
            "Lokhttp3/CipherSuite;",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;)",
            "Lokhttp3/Handshake;"
        }
    .end annotation

    .line 83
    .local p2, "peerCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    .local p3, "localCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    if-eqz p0, :cond_1

    .line 84
    if-eqz p1, :cond_0

    .line 85
    new-instance v0, Lokhttp3/Handshake;

    invoke-static {p2}, Lokhttp3/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 86
    invoke-static {p3}, Lokhttp3/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, p0, p1, v1, v2}, Lokhttp3/Handshake;-><init>(Lokhttp3/TlsVersion;Lokhttp3/CipherSuite;Ljava/util/List;Ljava/util/List;)V

    .line 85
    return-object v0

    .line 84
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "cipherSuite == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "tlsVersion == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public cipherSuite()Lokhttp3/CipherSuite;
    .locals 1

    .line 99
    iget-object v0, p0, Lokhttp3/Handshake;->cipherSuite:Lokhttp3/CipherSuite;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 127
    instance-of v0, p1, Lokhttp3/Handshake;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 128
    :cond_0
    move-object v0, p1

    check-cast v0, Lokhttp3/Handshake;

    .line 129
    .local v0, "that":Lokhttp3/Handshake;
    iget-object v2, p0, Lokhttp3/Handshake;->tlsVersion:Lokhttp3/TlsVersion;

    iget-object v3, v0, Lokhttp3/Handshake;->tlsVersion:Lokhttp3/TlsVersion;

    invoke-virtual {v2, v3}, Lokhttp3/TlsVersion;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lokhttp3/Handshake;->cipherSuite:Lokhttp3/CipherSuite;

    iget-object v3, v0, Lokhttp3/Handshake;->cipherSuite:Lokhttp3/CipherSuite;

    .line 130
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lokhttp3/Handshake;->peerCertificates:Ljava/util/List;

    iget-object v3, v0, Lokhttp3/Handshake;->peerCertificates:Ljava/util/List;

    .line 131
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lokhttp3/Handshake;->localCertificates:Ljava/util/List;

    iget-object v3, v0, Lokhttp3/Handshake;->localCertificates:Ljava/util/List;

    .line 132
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    nop

    .line 129
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 3

    .line 136
    const/16 v0, 0x11

    .line 137
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lokhttp3/Handshake;->tlsVersion:Lokhttp3/TlsVersion;

    invoke-virtual {v2}, Lokhttp3/TlsVersion;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    .line 138
    .end local v0    # "result":I
    .local v1, "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lokhttp3/Handshake;->cipherSuite:Lokhttp3/CipherSuite;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    .line 139
    .end local v1    # "result":I
    .restart local v0    # "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lokhttp3/Handshake;->peerCertificates:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    .line 140
    .end local v0    # "result":I
    .restart local v1    # "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lokhttp3/Handshake;->localCertificates:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    .line 141
    .end local v1    # "result":I
    .restart local v0    # "result":I
    return v0
.end method

.method public localCertificates()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation

    .line 116
    iget-object v0, p0, Lokhttp3/Handshake;->localCertificates:Ljava/util/List;

    return-object v0
.end method

.method public localPrincipal()Ljava/security/Principal;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 121
    iget-object v0, p0, Lokhttp3/Handshake;->localCertificates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 122
    iget-object v0, p0, Lokhttp3/Handshake;->localCertificates:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v0

    goto :goto_0

    .line 123
    :cond_0
    const/4 v0, 0x0

    .line 121
    :goto_0
    return-object v0
.end method

.method public peerCertificates()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation

    .line 104
    iget-object v0, p0, Lokhttp3/Handshake;->peerCertificates:Ljava/util/List;

    return-object v0
.end method

.method public peerPrincipal()Ljava/security/Principal;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 109
    iget-object v0, p0, Lokhttp3/Handshake;->peerCertificates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 110
    iget-object v0, p0, Lokhttp3/Handshake;->peerCertificates:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v0

    goto :goto_0

    .line 111
    :cond_0
    const/4 v0, 0x0

    .line 109
    :goto_0
    return-object v0
.end method

.method public tlsVersion()Lokhttp3/TlsVersion;
    .locals 1

    .line 94
    iget-object v0, p0, Lokhttp3/Handshake;->tlsVersion:Lokhttp3/TlsVersion;

    return-object v0
.end method
