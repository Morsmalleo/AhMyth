.class final Lcom/google/android/material/timepicker/TimeModel$1;
.super Ljava/lang/Object;
.source "TimeModel.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/timepicker/TimeModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/google/android/material/timepicker/TimeModel;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/google/android/material/timepicker/TimeModel;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .line 162
    new-instance v0, Lcom/google/android/material/timepicker/TimeModel;

    invoke-direct {v0, p1}, Lcom/google/android/material/timepicker/TimeModel;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 159
    invoke-virtual {p0, p1}, Lcom/google/android/material/timepicker/TimeModel$1;->createFromParcel(Landroid/os/Parcel;)Lcom/google/android/material/timepicker/TimeModel;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/google/android/material/timepicker/TimeModel;
    .locals 1
    .param p1, "size"    # I

    .line 167
    new-array v0, p1, [Lcom/google/android/material/timepicker/TimeModel;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 159
    invoke-virtual {p0, p1}, Lcom/google/android/material/timepicker/TimeModel$1;->newArray(I)[Lcom/google/android/material/timepicker/TimeModel;

    move-result-object p1

    return-object p1
.end method
