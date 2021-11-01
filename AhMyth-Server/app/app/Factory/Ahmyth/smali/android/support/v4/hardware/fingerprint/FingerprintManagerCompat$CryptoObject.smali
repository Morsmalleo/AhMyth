.class public Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;
.super Ljava/lang/Object;
.source "FingerprintManagerCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CryptoObject"
.end annotation


# instance fields
.field private final mCipher:Ljavax/crypto/Cipher;

.field private final mMac:Ljavax/crypto/Mac;

.field private final mSignature:Ljava/security/Signature;


# direct methods
.method public constructor <init>(Ljava/security/Signature;)V
    .locals 0

    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 198
    iput-object p1, p0, Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;->mSignature:Ljava/security/Signature;

    const/4 p1, 0x0

    .line 199
    iput-object p1, p0, Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;->mCipher:Ljavax/crypto/Cipher;

    .line 200
    iput-object p1, p0, Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;->mMac:Ljavax/crypto/Mac;

    return-void
.end method

.method public constructor <init>(Ljavax/crypto/Cipher;)V
    .locals 0

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 205
    iput-object p1, p0, Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;->mCipher:Ljavax/crypto/Cipher;

    const/4 p1, 0x0

    .line 206
    iput-object p1, p0, Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;->mSignature:Ljava/security/Signature;

    .line 207
    iput-object p1, p0, Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;->mMac:Ljavax/crypto/Mac;

    return-void
.end method

.method public constructor <init>(Ljavax/crypto/Mac;)V
    .locals 0

    .line 210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 211
    iput-object p1, p0, Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;->mMac:Ljavax/crypto/Mac;

    const/4 p1, 0x0

    .line 212
    iput-object p1, p0, Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;->mCipher:Ljavax/crypto/Cipher;

    .line 213
    iput-object p1, p0, Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;->mSignature:Ljava/security/Signature;

    return-void
.end method


# virtual methods
.method public getCipher()Ljavax/crypto/Cipher;
    .locals 1

    .line 228
    iget-object v0, p0, Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;->mCipher:Ljavax/crypto/Cipher;

    return-object v0
.end method

.method public getMac()Ljavax/crypto/Mac;
    .locals 1

    .line 235
    iget-object v0, p0, Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;->mMac:Ljavax/crypto/Mac;

    return-object v0
.end method

.method public getSignature()Ljava/security/Signature;
    .locals 1

    .line 221
    iget-object v0, p0, Landroid/support/v4/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;->mSignature:Ljava/security/Signature;

    return-object v0
.end method
