.class public final enum Lc/g0/i/b;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lc/g0/i/b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum b:Lc/g0/i/b;

.field public static final enum c:Lc/g0/i/b;

.field public static final enum d:Lc/g0/i/b;

.field public static final enum e:Lc/g0/i/b;

.field public static final enum f:Lc/g0/i/b;

.field public static final enum g:Lc/g0/i/b;

.field private static final synthetic h:[Lc/g0/i/b;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .locals 14

    new-instance v0, Lc/g0/i/b;

    const-string v1, "NO_ERROR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lc/g0/i/b;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lc/g0/i/b;->b:Lc/g0/i/b;

    new-instance v1, Lc/g0/i/b;

    const-string v3, "PROTOCOL_ERROR"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lc/g0/i/b;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lc/g0/i/b;->c:Lc/g0/i/b;

    new-instance v3, Lc/g0/i/b;

    const-string v5, "INTERNAL_ERROR"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lc/g0/i/b;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lc/g0/i/b;->d:Lc/g0/i/b;

    new-instance v5, Lc/g0/i/b;

    const-string v7, "FLOW_CONTROL_ERROR"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lc/g0/i/b;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lc/g0/i/b;->e:Lc/g0/i/b;

    new-instance v7, Lc/g0/i/b;

    const-string v9, "REFUSED_STREAM"

    const/4 v10, 0x4

    const/4 v11, 0x7

    invoke-direct {v7, v9, v10, v11}, Lc/g0/i/b;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lc/g0/i/b;->f:Lc/g0/i/b;

    new-instance v9, Lc/g0/i/b;

    const-string v11, "CANCEL"

    const/4 v12, 0x5

    const/16 v13, 0x8

    invoke-direct {v9, v11, v12, v13}, Lc/g0/i/b;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lc/g0/i/b;->g:Lc/g0/i/b;

    const/4 v11, 0x6

    new-array v11, v11, [Lc/g0/i/b;

    aput-object v0, v11, v2

    aput-object v1, v11, v4

    aput-object v3, v11, v6

    aput-object v5, v11, v8

    aput-object v7, v11, v10

    aput-object v9, v11, v12

    sput-object v11, Lc/g0/i/b;->h:[Lc/g0/i/b;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lc/g0/i/b;->a:I

    return-void
.end method

.method public static a(I)Lc/g0/i/b;
    .locals 5

    invoke-static {}, Lc/g0/i/b;->values()[Lc/g0/i/b;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    iget v4, v3, Lc/g0/i/b;->a:I

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lc/g0/i/b;
    .locals 1

    const-class v0, Lc/g0/i/b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc/g0/i/b;

    return-object p0
.end method

.method public static values()[Lc/g0/i/b;
    .locals 1

    sget-object v0, Lc/g0/i/b;->h:[Lc/g0/i/b;

    invoke-virtual {v0}, [Lc/g0/i/b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc/g0/i/b;

    return-object v0
.end method
