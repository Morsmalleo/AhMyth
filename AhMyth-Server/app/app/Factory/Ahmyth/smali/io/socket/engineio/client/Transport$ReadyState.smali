.class public final enum Lio/socket/engineio/client/Transport$ReadyState;
.super Ljava/lang/Enum;
.source "Transport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/engineio/client/Transport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401c
    name = "ReadyState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/socket/engineio/client/Transport$ReadyState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/socket/engineio/client/Transport$ReadyState;

.field public static final enum CLOSED:Lio/socket/engineio/client/Transport$ReadyState;

.field public static final enum OPEN:Lio/socket/engineio/client/Transport$ReadyState;

.field public static final enum OPENING:Lio/socket/engineio/client/Transport$ReadyState;

.field public static final enum PAUSED:Lio/socket/engineio/client/Transport$ReadyState;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 18
    new-instance v0, Lio/socket/engineio/client/Transport$ReadyState;

    const-string v1, "OPENING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/socket/engineio/client/Transport$ReadyState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/socket/engineio/client/Transport$ReadyState;->OPENING:Lio/socket/engineio/client/Transport$ReadyState;

    new-instance v1, Lio/socket/engineio/client/Transport$ReadyState;

    const-string v3, "OPEN"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lio/socket/engineio/client/Transport$ReadyState;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lio/socket/engineio/client/Transport$ReadyState;->OPEN:Lio/socket/engineio/client/Transport$ReadyState;

    new-instance v3, Lio/socket/engineio/client/Transport$ReadyState;

    const-string v5, "CLOSED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lio/socket/engineio/client/Transport$ReadyState;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lio/socket/engineio/client/Transport$ReadyState;->CLOSED:Lio/socket/engineio/client/Transport$ReadyState;

    new-instance v5, Lio/socket/engineio/client/Transport$ReadyState;

    const-string v7, "PAUSED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lio/socket/engineio/client/Transport$ReadyState;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lio/socket/engineio/client/Transport$ReadyState;->PAUSED:Lio/socket/engineio/client/Transport$ReadyState;

    .line 17
    const/4 v7, 0x4

    new-array v7, v7, [Lio/socket/engineio/client/Transport$ReadyState;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lio/socket/engineio/client/Transport$ReadyState;->$VALUES:[Lio/socket/engineio/client/Transport$ReadyState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 17
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/socket/engineio/client/Transport$ReadyState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 17
    const-class v0, Lio/socket/engineio/client/Transport$ReadyState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/socket/engineio/client/Transport$ReadyState;

    return-object v0
.end method

.method public static values()[Lio/socket/engineio/client/Transport$ReadyState;
    .locals 1

    .line 17
    sget-object v0, Lio/socket/engineio/client/Transport$ReadyState;->$VALUES:[Lio/socket/engineio/client/Transport$ReadyState;

    invoke-virtual {v0}, [Lio/socket/engineio/client/Transport$ReadyState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/socket/engineio/client/Transport$ReadyState;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 22
    invoke-super {p0}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
