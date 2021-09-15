.class final Lcom/google/android/material/datepicker/CompositeDateValidator$1;
.super Ljava/lang/Object;
.source "CompositeDateValidator.java"

# interfaces
.implements Lcom/google/android/material/datepicker/CompositeDateValidator$Operator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/datepicker/CompositeDateValidator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getId()I
    .locals 1

    .line 61
    const/4 v0, 0x1

    return v0
.end method

.method public isValid(Ljava/util/List;J)Z
    .locals 3
    .param p2, "date"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;",
            ">;J)Z"
        }
    .end annotation

    .line 47
    .local p1, "validators":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;

    .line 48
    .local v1, "validator":Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;
    if-nez v1, :cond_0

    .line 49
    goto :goto_0

    .line 51
    :cond_0
    invoke-interface {v1, p2, p3}, Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;->isValid(J)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 52
    const/4 v0, 0x1

    return v0

    .line 54
    .end local v1    # "validator":Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;
    :cond_1
    goto :goto_0

    .line 56
    :cond_2
    const/4 v0, 0x0

    return v0
.end method
