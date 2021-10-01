.class public final enum Landroid/arch/lifecycle/Lifecycle$State;
.super Ljava/lang/Enum;
.source "Lifecycle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/arch/lifecycle/Lifecycle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/arch/lifecycle/Lifecycle$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/arch/lifecycle/Lifecycle$State;

.field public static final enum CREATED:Landroid/arch/lifecycle/Lifecycle$State;

.field public static final enum DESTROYED:Landroid/arch/lifecycle/Lifecycle$State;

.field public static final enum INITIALIZED:Landroid/arch/lifecycle/Lifecycle$State;

.field public static final enum RESUMED:Landroid/arch/lifecycle/Lifecycle$State;

.field public static final enum STARTED:Landroid/arch/lifecycle/Lifecycle$State;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 157
    new-instance v0, Landroid/arch/lifecycle/Lifecycle$State;

    const-string v1, "DESTROYED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/arch/lifecycle/Lifecycle$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/arch/lifecycle/Lifecycle$State;->DESTROYED:Landroid/arch/lifecycle/Lifecycle$State;

    .line 164
    new-instance v1, Landroid/arch/lifecycle/Lifecycle$State;

    const-string v3, "INITIALIZED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Landroid/arch/lifecycle/Lifecycle$State;-><init>(Ljava/lang/String;I)V

    sput-object v1, Landroid/arch/lifecycle/Lifecycle$State;->INITIALIZED:Landroid/arch/lifecycle/Lifecycle$State;

    .line 174
    new-instance v3, Landroid/arch/lifecycle/Lifecycle$State;

    const-string v5, "CREATED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Landroid/arch/lifecycle/Lifecycle$State;-><init>(Ljava/lang/String;I)V

    sput-object v3, Landroid/arch/lifecycle/Lifecycle$State;->CREATED:Landroid/arch/lifecycle/Lifecycle$State;

    .line 184
    new-instance v5, Landroid/arch/lifecycle/Lifecycle$State;

    const-string v7, "STARTED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Landroid/arch/lifecycle/Lifecycle$State;-><init>(Ljava/lang/String;I)V

    sput-object v5, Landroid/arch/lifecycle/Lifecycle$State;->STARTED:Landroid/arch/lifecycle/Lifecycle$State;

    .line 190
    new-instance v7, Landroid/arch/lifecycle/Lifecycle$State;

    const-string v9, "RESUMED"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Landroid/arch/lifecycle/Lifecycle$State;-><init>(Ljava/lang/String;I)V

    sput-object v7, Landroid/arch/lifecycle/Lifecycle$State;->RESUMED:Landroid/arch/lifecycle/Lifecycle$State;

    .line 150
    const/4 v9, 0x5

    new-array v9, v9, [Landroid/arch/lifecycle/Lifecycle$State;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Landroid/arch/lifecycle/Lifecycle$State;->$VALUES:[Landroid/arch/lifecycle/Lifecycle$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 151
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/arch/lifecycle/Lifecycle$State;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 150
    const-class v0, Landroid/arch/lifecycle/Lifecycle$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroid/arch/lifecycle/Lifecycle$State;

    return-object v0
.end method

.method public static values()[Landroid/arch/lifecycle/Lifecycle$State;
    .locals 1

    .line 150
    sget-object v0, Landroid/arch/lifecycle/Lifecycle$State;->$VALUES:[Landroid/arch/lifecycle/Lifecycle$State;

    invoke-virtual {v0}, [Landroid/arch/lifecycle/Lifecycle$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/arch/lifecycle/Lifecycle$State;

    return-object v0
.end method


# virtual methods
.method public isAtLeast(Landroid/arch/lifecycle/Lifecycle$State;)Z
    .locals 1
    .param p1, "state"    # Landroid/arch/lifecycle/Lifecycle$State;

    .line 199
    invoke-virtual {p0, p1}, Landroid/arch/lifecycle/Lifecycle$State;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
