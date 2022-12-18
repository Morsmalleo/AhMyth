.class public abstract Lc/g0/k/e;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/g0/k/e$b;,
        Lc/g0/k/e$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static b(Ljavax/net/ssl/X509TrustManager;)Lc/g0/k/e;
    .locals 6

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "findTrustAnchorByIssuerAndSignature"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Ljava/security/cert/X509Certificate;

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-instance v1, Lc/g0/k/e$a;

    invoke-direct {v1, p0, v0}, Lc/g0/k/e$a;-><init>(Ljavax/net/ssl/X509TrustManager;Ljava/lang/reflect/Method;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    invoke-interface {p0}, Ljavax/net/ssl/X509TrustManager;->getAcceptedIssuers()[Ljava/security/cert/X509Certificate;

    move-result-object p0

    invoke-static {p0}, Lc/g0/k/e;->c([Ljava/security/cert/X509Certificate;)Lc/g0/k/e;

    move-result-object p0

    return-object p0
.end method

.method public static varargs c([Ljava/security/cert/X509Certificate;)Lc/g0/k/e;
    .locals 1

    new-instance v0, Lc/g0/k/e$b;

    invoke-direct {v0, p0}, Lc/g0/k/e$b;-><init>([Ljava/security/cert/X509Certificate;)V

    return-object v0
.end method


# virtual methods
.method public abstract a(Ljava/security/cert/X509Certificate;)Ljava/security/cert/X509Certificate;
.end method
