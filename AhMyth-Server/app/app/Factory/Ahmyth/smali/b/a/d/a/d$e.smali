.class public final enum Lb/a/d/a/d$e;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/a/d/a/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401c
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lb/a/d/a/d$e;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lb/a/d/a/d$e;

.field public static final enum b:Lb/a/d/a/d$e;

.field public static final enum c:Lb/a/d/a/d$e;

.field public static final enum d:Lb/a/d/a/d$e;

.field private static final synthetic e:[Lb/a/d/a/d$e;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    new-instance v0, Lb/a/d/a/d$e;

    const-string v1, "OPENING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lb/a/d/a/d$e;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/a/d/a/d$e;->a:Lb/a/d/a/d$e;

    new-instance v1, Lb/a/d/a/d$e;

    const-string v3, "OPEN"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lb/a/d/a/d$e;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lb/a/d/a/d$e;->b:Lb/a/d/a/d$e;

    new-instance v3, Lb/a/d/a/d$e;

    const-string v5, "CLOSED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lb/a/d/a/d$e;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lb/a/d/a/d$e;->c:Lb/a/d/a/d$e;

    new-instance v5, Lb/a/d/a/d$e;

    const-string v7, "PAUSED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lb/a/d/a/d$e;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lb/a/d/a/d$e;->d:Lb/a/d/a/d$e;

    const/4 v7, 0x4

    new-array v7, v7, [Lb/a/d/a/d$e;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lb/a/d/a/d$e;->e:[Lb/a/d/a/d$e;

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

.method public static valueOf(Ljava/lang/String;)Lb/a/d/a/d$e;
    .locals 1

    const-class v0, Lb/a/d/a/d$e;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb/a/d/a/d$e;

    return-object p0
.end method

.method public static values()[Lb/a/d/a/d$e;
    .locals 1

    sget-object v0, Lb/a/d/a/d$e;->e:[Lb/a/d/a/d$e;

    invoke-virtual {v0}, [Lb/a/d/a/d$e;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/a/d/a/d$e;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    invoke-super {p0}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
