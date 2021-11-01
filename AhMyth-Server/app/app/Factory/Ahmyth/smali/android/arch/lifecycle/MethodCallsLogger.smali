.class public Landroid/arch/lifecycle/MethodCallsLogger;
.super Ljava/lang/Object;
.source "MethodCallsLogger.java"


# instance fields
.field private mCalledMethods:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/arch/lifecycle/MethodCallsLogger;->mCalledMethods:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public approveCall(Ljava/lang/String;I)Z
    .locals 4

    .line 36
    iget-object v0, p0, Landroid/arch/lifecycle/MethodCallsLogger;->mCalledMethods:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 37
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    and-int v2, v0, p2

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    .line 39
    :cond_1
    iget-object v2, p0, Landroid/arch/lifecycle/MethodCallsLogger;->mCalledMethods:Ljava/util/Map;

    or-int/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v2, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    xor-int/lit8 p1, v1, 0x1

    return p1
.end method
