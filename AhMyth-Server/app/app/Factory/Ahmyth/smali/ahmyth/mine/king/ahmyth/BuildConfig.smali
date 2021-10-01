.class public final Lahmyth/mine/king/ahmyth/BuildConfig;
.super Ljava/lang/Object;
.source "BuildConfig.java"


# static fields
.field public static final APPLICATION_ID:Ljava/lang/String; = "ahmyth.mine.king.ahmyth"

.field public static final BUILD_TYPE:Ljava/lang/String; = "debug"

.field public static final DEBUG:Z

.field public static final VERSION_CODE:I = 0x1

.field public static final VERSION_NAME:Ljava/lang/String; = "1.0"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    const-string v0, "true"

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lahmyth/mine/king/ahmyth/BuildConfig;->DEBUG:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
