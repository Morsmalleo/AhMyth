.class final enum Lc/s$a$a;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/s$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lc/s$a$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lc/s$a$a;

.field public static final enum b:Lc/s$a$a;

.field public static final enum c:Lc/s$a$a;

.field public static final enum d:Lc/s$a$a;

.field public static final enum e:Lc/s$a$a;

.field private static final synthetic f:[Lc/s$a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    new-instance v0, Lc/s$a$a;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lc/s$a$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/s$a$a;->a:Lc/s$a$a;

    new-instance v1, Lc/s$a$a;

    const-string v3, "MISSING_SCHEME"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lc/s$a$a;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lc/s$a$a;->b:Lc/s$a$a;

    new-instance v3, Lc/s$a$a;

    const-string v5, "UNSUPPORTED_SCHEME"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lc/s$a$a;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lc/s$a$a;->c:Lc/s$a$a;

    new-instance v5, Lc/s$a$a;

    const-string v7, "INVALID_PORT"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lc/s$a$a;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lc/s$a$a;->d:Lc/s$a$a;

    new-instance v7, Lc/s$a$a;

    const-string v9, "INVALID_HOST"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lc/s$a$a;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lc/s$a$a;->e:Lc/s$a$a;

    const/4 v9, 0x5

    new-array v9, v9, [Lc/s$a$a;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Lc/s$a$a;->f:[Lc/s$a$a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lc/s$a$a;
    .locals 1

    const-class v0, Lc/s$a$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc/s$a$a;

    return-object p0
.end method

.method public static values()[Lc/s$a$a;
    .locals 1

    sget-object v0, Lc/s$a$a;->f:[Lc/s$a$a;

    invoke-virtual {v0}, [Lc/s$a$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc/s$a$a;

    return-object v0
.end method
