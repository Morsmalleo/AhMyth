.class final Lcom/google/android/material/datepicker/DateValidatorPointBackward$1;
.super Ljava/lang/Object;
.source "DateValidatorPointBackward.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/datepicker/DateValidatorPointBackward;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/google/android/material/datepicker/DateValidatorPointBackward;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/google/android/material/datepicker/DateValidatorPointBackward;
    .locals 4
    .param p1, "source"    # Landroid/os/Parcel;

    .line 63
    new-instance v0, Lcom/google/android/material/datepicker/DateValidatorPointBackward;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/material/datepicker/DateValidatorPointBackward;-><init>(JLcom/google/android/material/datepicker/DateValidatorPointBackward$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 59
    invoke-virtual {p0, p1}, Lcom/google/android/material/datepicker/DateValidatorPointBackward$1;->createFromParcel(Landroid/os/Parcel;)Lcom/google/android/material/datepicker/DateValidatorPointBackward;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/google/android/material/datepicker/DateValidatorPointBackward;
    .locals 1
    .param p1, "size"    # I

    .line 69
    new-array v0, p1, [Lcom/google/android/material/datepicker/DateValidatorPointBackward;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 59
    invoke-virtual {p0, p1}, Lcom/google/android/material/datepicker/DateValidatorPointBackward$1;->newArray(I)[Lcom/google/android/material/datepicker/DateValidatorPointBackward;

    move-result-object p1

    return-object p1
.end method
