.class public final enum Landroid/support/annotation/RestrictTo$Scope;
.super Ljava/lang/Enum;
.source "RestrictTo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/annotation/RestrictTo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Scope"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/support/annotation/RestrictTo$Scope;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/support/annotation/RestrictTo$Scope;

.field public static final enum GROUP_ID:Landroid/support/annotation/RestrictTo$Scope;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum LIBRARY:Landroid/support/annotation/RestrictTo$Scope;

.field public static final enum LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;

.field public static final enum SUBCLASSES:Landroid/support/annotation/RestrictTo$Scope;

.field public static final enum TESTS:Landroid/support/annotation/RestrictTo$Scope;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 63
    new-instance v0, Landroid/support/annotation/RestrictTo$Scope;

    const-string v1, "LIBRARY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/support/annotation/RestrictTo$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;

    .line 69
    new-instance v1, Landroid/support/annotation/RestrictTo$Scope;

    const-string v3, "LIBRARY_GROUP"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Landroid/support/annotation/RestrictTo$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v1, Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;

    .line 77
    new-instance v3, Landroid/support/annotation/RestrictTo$Scope;

    const-string v5, "GROUP_ID"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Landroid/support/annotation/RestrictTo$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v3, Landroid/support/annotation/RestrictTo$Scope;->GROUP_ID:Landroid/support/annotation/RestrictTo$Scope;

    .line 83
    new-instance v5, Landroid/support/annotation/RestrictTo$Scope;

    const-string v7, "TESTS"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Landroid/support/annotation/RestrictTo$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v5, Landroid/support/annotation/RestrictTo$Scope;->TESTS:Landroid/support/annotation/RestrictTo$Scope;

    .line 91
    new-instance v7, Landroid/support/annotation/RestrictTo$Scope;

    const-string v9, "SUBCLASSES"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Landroid/support/annotation/RestrictTo$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v7, Landroid/support/annotation/RestrictTo$Scope;->SUBCLASSES:Landroid/support/annotation/RestrictTo$Scope;

    .line 58
    const/4 v9, 0x5

    new-array v9, v9, [Landroid/support/annotation/RestrictTo$Scope;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Landroid/support/annotation/RestrictTo$Scope;->$VALUES:[Landroid/support/annotation/RestrictTo$Scope;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 58
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/support/annotation/RestrictTo$Scope;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 58
    const-class v0, Landroid/support/annotation/RestrictTo$Scope;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroid/support/annotation/RestrictTo$Scope;

    return-object v0
.end method

.method public static values()[Landroid/support/annotation/RestrictTo$Scope;
    .locals 1

    .line 58
    sget-object v0, Landroid/support/annotation/RestrictTo$Scope;->$VALUES:[Landroid/support/annotation/RestrictTo$Scope;

    invoke-virtual {v0}, [Landroid/support/annotation/RestrictTo$Scope;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/support/annotation/RestrictTo$Scope;

    return-object v0
.end method
