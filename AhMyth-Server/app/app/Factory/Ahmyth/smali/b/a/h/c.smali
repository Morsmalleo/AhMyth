.class public Lb/a/h/c;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/a/h/c$a;,
        Lb/a/h/c$b;,
        Lb/a/h/c$c;
    }
.end annotation


# static fields
.field private static final a:Ljava/util/logging/Logger;

.field public static b:I

.field public static c:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-class v0, Lb/a/h/c;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lb/a/h/c;->a:Ljava/util/logging/Logger;

    const/4 v0, 0x4

    sput v0, Lb/a/h/c;->b:I

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "CONNECT"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "DISCONNECT"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "EVENT"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "ACK"

    aput-object v3, v1, v2

    const-string v2, "ERROR"

    aput-object v2, v1, v0

    const/4 v0, 0x5

    const-string v2, "BINARY_EVENT"

    aput-object v2, v1, v0

    const/4 v0, 0x6

    const-string v2, "BINARY_ACK"

    aput-object v2, v1, v0

    sput-object v1, Lb/a/h/c;->c:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic a()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lb/a/h/c;->a:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic b()Lb/a/h/b;
    .locals 1

    invoke-static {}, Lb/a/h/c;->c()Lb/a/h/b;

    move-result-object v0

    return-object v0
.end method

.method private static c()Lb/a/h/b;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lb/a/h/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Lb/a/h/b;

    const/4 v1, 0x4

    const-string v2, "parser error"

    invoke-direct {v0, v1, v2}, Lb/a/h/b;-><init>(ILjava/lang/Object;)V

    return-object v0
.end method
