.class public final Lc/h;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static final b:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/String;",
            "Lc/h;",
            ">;"
        }
    .end annotation
.end field

.field public static final c:Lc/h;

.field public static final d:Lc/h;

.field public static final e:Lc/h;

.field public static final f:Lc/h;

.field public static final g:Lc/h;

.field public static final h:Lc/h;

.field public static final i:Lc/h;

.field public static final j:Lc/h;

.field public static final k:Lc/h;

.field public static final l:Lc/h;

.field public static final m:Lc/h;

.field public static final n:Lc/h;

.field public static final o:Lc/h;

.field public static final p:Lc/h;

.field public static final q:Lc/h;


# instance fields
.field final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lc/h;->b:Ljava/util/concurrent/ConcurrentMap;

    const-string v0, "SSL_RSA_WITH_NULL_MD5"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_RSA_WITH_NULL_SHA"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_RSA_EXPORT_WITH_RC4_40_MD5"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_RSA_WITH_RC4_128_MD5"

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_RSA_WITH_RC4_128_SHA"

    const/4 v1, 0x5

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_RSA_EXPORT_WITH_DES40_CBC_SHA"

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_RSA_WITH_DES_CBC_SHA"

    const/16 v1, 0x9

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_RSA_WITH_3DES_EDE_CBC_SHA"

    const/16 v1, 0xa

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->c:Lc/h;

    const-string v0, "SSL_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA"

    const/16 v1, 0x11

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_DHE_DSS_WITH_DES_CBC_SHA"

    const/16 v1, 0x12

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_DHE_DSS_WITH_3DES_EDE_CBC_SHA"

    const/16 v1, 0x13

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA"

    const/16 v1, 0x14

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_DHE_RSA_WITH_DES_CBC_SHA"

    const/16 v1, 0x15

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_DHE_RSA_WITH_3DES_EDE_CBC_SHA"

    const/16 v1, 0x16

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_DH_anon_EXPORT_WITH_RC4_40_MD5"

    const/16 v1, 0x17

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_DH_anon_WITH_RC4_128_MD5"

    const/16 v1, 0x18

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_DH_anon_EXPORT_WITH_DES40_CBC_SHA"

    const/16 v1, 0x19

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_DH_anon_WITH_DES_CBC_SHA"

    const/16 v1, 0x1a

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "SSL_DH_anon_WITH_3DES_EDE_CBC_SHA"

    const/16 v1, 0x1b

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_KRB5_WITH_DES_CBC_SHA"

    const/16 v1, 0x1e

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_KRB5_WITH_3DES_EDE_CBC_SHA"

    const/16 v1, 0x1f

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_KRB5_WITH_RC4_128_SHA"

    const/16 v1, 0x20

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_KRB5_WITH_DES_CBC_MD5"

    const/16 v1, 0x22

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_KRB5_WITH_3DES_EDE_CBC_MD5"

    const/16 v1, 0x23

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_KRB5_WITH_RC4_128_MD5"

    const/16 v1, 0x24

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA"

    const/16 v1, 0x26

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_KRB5_EXPORT_WITH_RC4_40_SHA"

    const/16 v1, 0x28

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5"

    const/16 v1, 0x29

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_KRB5_EXPORT_WITH_RC4_40_MD5"

    const/16 v1, 0x2b

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_RSA_WITH_AES_128_CBC_SHA"

    const/16 v1, 0x2f

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->d:Lc/h;

    const-string v0, "TLS_DHE_DSS_WITH_AES_128_CBC_SHA"

    const/16 v1, 0x32

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DHE_RSA_WITH_AES_128_CBC_SHA"

    const/16 v1, 0x33

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DH_anon_WITH_AES_128_CBC_SHA"

    const/16 v1, 0x34

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_RSA_WITH_AES_256_CBC_SHA"

    const/16 v1, 0x35

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->e:Lc/h;

    const-string v0, "TLS_DHE_DSS_WITH_AES_256_CBC_SHA"

    const/16 v1, 0x38

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DHE_RSA_WITH_AES_256_CBC_SHA"

    const/16 v1, 0x39

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DH_anon_WITH_AES_256_CBC_SHA"

    const/16 v1, 0x3a

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_RSA_WITH_NULL_SHA256"

    const/16 v1, 0x3b

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_RSA_WITH_AES_128_CBC_SHA256"

    const/16 v1, 0x3c

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_RSA_WITH_AES_256_CBC_SHA256"

    const/16 v1, 0x3d

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DHE_DSS_WITH_AES_128_CBC_SHA256"

    const/16 v1, 0x40

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_RSA_WITH_CAMELLIA_128_CBC_SHA"

    const/16 v1, 0x41

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA"

    const/16 v1, 0x44

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA"

    const/16 v1, 0x45

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DHE_RSA_WITH_AES_128_CBC_SHA256"

    const/16 v1, 0x67

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DHE_DSS_WITH_AES_256_CBC_SHA256"

    const/16 v1, 0x6a

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DHE_RSA_WITH_AES_256_CBC_SHA256"

    const/16 v1, 0x6b

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DH_anon_WITH_AES_128_CBC_SHA256"

    const/16 v1, 0x6c

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DH_anon_WITH_AES_256_CBC_SHA256"

    const/16 v1, 0x6d

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_RSA_WITH_CAMELLIA_256_CBC_SHA"

    const/16 v1, 0x84

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA"

    const/16 v1, 0x87

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA"

    const/16 v1, 0x88

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_PSK_WITH_RC4_128_SHA"

    const/16 v1, 0x8a

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_PSK_WITH_3DES_EDE_CBC_SHA"

    const/16 v1, 0x8b

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_PSK_WITH_AES_128_CBC_SHA"

    const/16 v1, 0x8c

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_PSK_WITH_AES_256_CBC_SHA"

    const/16 v1, 0x8d

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_RSA_WITH_SEED_CBC_SHA"

    const/16 v1, 0x96

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_RSA_WITH_AES_128_GCM_SHA256"

    const/16 v1, 0x9c

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->f:Lc/h;

    const-string v0, "TLS_RSA_WITH_AES_256_GCM_SHA384"

    const/16 v1, 0x9d

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->g:Lc/h;

    const-string v0, "TLS_DHE_RSA_WITH_AES_128_GCM_SHA256"

    const/16 v1, 0x9e

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DHE_RSA_WITH_AES_256_GCM_SHA384"

    const/16 v1, 0x9f

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DHE_DSS_WITH_AES_128_GCM_SHA256"

    const/16 v1, 0xa2

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DHE_DSS_WITH_AES_256_GCM_SHA384"

    const/16 v1, 0xa3

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DH_anon_WITH_AES_128_GCM_SHA256"

    const/16 v1, 0xa6

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_DH_anon_WITH_AES_256_GCM_SHA384"

    const/16 v1, 0xa7

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_EMPTY_RENEGOTIATION_INFO_SCSV"

    const/16 v1, 0xff

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_FALLBACK_SCSV"

    const/16 v1, 0x5600

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_ECDSA_WITH_NULL_SHA"

    const v1, 0xc001

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_ECDSA_WITH_RC4_128_SHA"

    const v1, 0xc002

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA"

    const v1, 0xc003

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA"

    const v1, 0xc004

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA"

    const v1, 0xc005

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_ECDSA_WITH_NULL_SHA"

    const v1, 0xc006

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_ECDSA_WITH_RC4_128_SHA"

    const v1, 0xc007

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA"

    const v1, 0xc008

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA"

    const v1, 0xc009

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->h:Lc/h;

    const-string v0, "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA"

    const v1, 0xc00a

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->i:Lc/h;

    const-string v0, "TLS_ECDH_RSA_WITH_NULL_SHA"

    const v1, 0xc00b

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_RSA_WITH_RC4_128_SHA"

    const v1, 0xc00c

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA"

    const v1, 0xc00d

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_RSA_WITH_AES_128_CBC_SHA"

    const v1, 0xc00e

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_RSA_WITH_AES_256_CBC_SHA"

    const v1, 0xc00f

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_RSA_WITH_NULL_SHA"

    const v1, 0xc010

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_RSA_WITH_RC4_128_SHA"

    const v1, 0xc011

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA"

    const v1, 0xc012

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA"

    const v1, 0xc013

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->j:Lc/h;

    const-string v0, "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA"

    const v1, 0xc014

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->k:Lc/h;

    const-string v0, "TLS_ECDH_anon_WITH_NULL_SHA"

    const v1, 0xc015

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_anon_WITH_RC4_128_SHA"

    const v1, 0xc016

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA"

    const v1, 0xc017

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_anon_WITH_AES_128_CBC_SHA"

    const v1, 0xc018

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_anon_WITH_AES_256_CBC_SHA"

    const v1, 0xc019

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256"

    const v1, 0xc023

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384"

    const v1, 0xc024

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256"

    const v1, 0xc025

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384"

    const v1, 0xc026

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256"

    const v1, 0xc027

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384"

    const v1, 0xc028

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256"

    const v1, 0xc029

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384"

    const v1, 0xc02a

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"

    const v1, 0xc02b

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->l:Lc/h;

    const-string v0, "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384"

    const v1, 0xc02c

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->m:Lc/h;

    const-string v0, "TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256"

    const v1, 0xc02d

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384"

    const v1, 0xc02e

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"

    const v1, 0xc02f

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->n:Lc/h;

    const-string v0, "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"

    const v1, 0xc030

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->o:Lc/h;

    const-string v0, "TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256"

    const v1, 0xc031

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384"

    const v1, 0xc032

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA"

    const v1, 0xc035

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA"

    const v1, 0xc036

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    const-string v0, "TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256"

    const v1, 0xcca8

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->p:Lc/h;

    const-string v0, "TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256"

    const v1, 0xcca9

    invoke-static {v0, v1}, Lc/h;->b(Ljava/lang/String;I)Lc/h;

    move-result-object v0

    sput-object v0, Lc/h;->q:Lc/h;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lc/h;->a:Ljava/lang/String;

    return-void
.end method

.method public static a(Ljava/lang/String;)Lc/h;
    .locals 2

    sget-object v0, Lc/h;->b:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/h;

    if-nez v1, :cond_1

    new-instance v1, Lc/h;

    invoke-direct {v1, p0}, Lc/h;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, p0, v1}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc/h;

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, p0

    :cond_1
    :goto_0
    return-object v1
.end method

.method private static b(Ljava/lang/String;I)Lc/h;
    .locals 0

    invoke-static {p0}, Lc/h;->a(Ljava/lang/String;)Lc/h;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lc/h;->a:Ljava/lang/String;

    return-object v0
.end method
