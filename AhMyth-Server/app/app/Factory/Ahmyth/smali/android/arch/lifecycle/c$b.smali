.class public final enum Landroid/arch/lifecycle/c$b;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/arch/lifecycle/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/arch/lifecycle/c$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Landroid/arch/lifecycle/c$b;

.field public static final enum b:Landroid/arch/lifecycle/c$b;

.field public static final enum c:Landroid/arch/lifecycle/c$b;

.field public static final enum d:Landroid/arch/lifecycle/c$b;

.field public static final enum e:Landroid/arch/lifecycle/c$b;

.field private static final synthetic f:[Landroid/arch/lifecycle/c$b;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    new-instance v0, Landroid/arch/lifecycle/c$b;

    const-string v1, "DESTROYED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/arch/lifecycle/c$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/arch/lifecycle/c$b;->a:Landroid/arch/lifecycle/c$b;

    new-instance v1, Landroid/arch/lifecycle/c$b;

    const-string v3, "INITIALIZED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Landroid/arch/lifecycle/c$b;-><init>(Ljava/lang/String;I)V

    sput-object v1, Landroid/arch/lifecycle/c$b;->b:Landroid/arch/lifecycle/c$b;

    new-instance v3, Landroid/arch/lifecycle/c$b;

    const-string v5, "CREATED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Landroid/arch/lifecycle/c$b;-><init>(Ljava/lang/String;I)V

    sput-object v3, Landroid/arch/lifecycle/c$b;->c:Landroid/arch/lifecycle/c$b;

    new-instance v5, Landroid/arch/lifecycle/c$b;

    const-string v7, "STARTED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Landroid/arch/lifecycle/c$b;-><init>(Ljava/lang/String;I)V

    sput-object v5, Landroid/arch/lifecycle/c$b;->d:Landroid/arch/lifecycle/c$b;

    new-instance v7, Landroid/arch/lifecycle/c$b;

    const-string v9, "RESUMED"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Landroid/arch/lifecycle/c$b;-><init>(Ljava/lang/String;I)V

    sput-object v7, Landroid/arch/lifecycle/c$b;->e:Landroid/arch/lifecycle/c$b;

    const/4 v9, 0x5

    new-array v9, v9, [Landroid/arch/lifecycle/c$b;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Landroid/arch/lifecycle/c$b;->f:[Landroid/arch/lifecycle/c$b;

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

.method public static valueOf(Ljava/lang/String;)Landroid/arch/lifecycle/c$b;
    .locals 1

    const-class v0, Landroid/arch/lifecycle/c$b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroid/arch/lifecycle/c$b;

    return-object p0
.end method

.method public static values()[Landroid/arch/lifecycle/c$b;
    .locals 1

    sget-object v0, Landroid/arch/lifecycle/c$b;->f:[Landroid/arch/lifecycle/c$b;

    invoke-virtual {v0}, [Landroid/arch/lifecycle/c$b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/arch/lifecycle/c$b;

    return-object v0
.end method
