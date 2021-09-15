.class Lcom/google/android/material/slider/RangeSlider$RangeSliderState;
.super Landroid/view/AbsSavedState;
.source "RangeSlider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/slider/RangeSlider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "RangeSliderState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/material/slider/RangeSlider$RangeSliderState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private minSeparation:F

.field private separationUnit:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 206
    new-instance v0, Lcom/google/android/material/slider/RangeSlider$RangeSliderState$1;

    invoke-direct {v0}, Lcom/google/android/material/slider/RangeSlider$RangeSliderState$1;-><init>()V

    sput-object v0, Lcom/google/android/material/slider/RangeSlider$RangeSliderState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .line 194
    const-class v0, Lcom/google/android/material/slider/RangeSlider$RangeSliderState;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/view/AbsSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 195
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/google/android/material/slider/RangeSlider$RangeSliderState;->minSeparation:F

    .line 196
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/google/android/material/slider/RangeSlider$RangeSliderState;->separationUnit:I

    .line 197
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/google/android/material/slider/RangeSlider$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/google/android/material/slider/RangeSlider$1;

    .line 184
    invoke-direct {p0, p1}, Lcom/google/android/material/slider/RangeSlider$RangeSliderState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method constructor <init>(Landroid/os/Parcelable;)V
    .locals 0
    .param p1, "superState"    # Landroid/os/Parcelable;

    .line 190
    invoke-direct {p0, p1}, Landroid/view/AbsSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 191
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/material/slider/RangeSlider$RangeSliderState;)F
    .locals 1
    .param p0, "x0"    # Lcom/google/android/material/slider/RangeSlider$RangeSliderState;

    .line 184
    iget v0, p0, Lcom/google/android/material/slider/RangeSlider$RangeSliderState;->minSeparation:F

    return v0
.end method

.method static synthetic access$002(Lcom/google/android/material/slider/RangeSlider$RangeSliderState;F)F
    .locals 0
    .param p0, "x0"    # Lcom/google/android/material/slider/RangeSlider$RangeSliderState;
    .param p1, "x1"    # F

    .line 184
    iput p1, p0, Lcom/google/android/material/slider/RangeSlider$RangeSliderState;->minSeparation:F

    return p1
.end method

.method static synthetic access$100(Lcom/google/android/material/slider/RangeSlider$RangeSliderState;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/material/slider/RangeSlider$RangeSliderState;

    .line 184
    iget v0, p0, Lcom/google/android/material/slider/RangeSlider$RangeSliderState;->separationUnit:I

    return v0
.end method

.method static synthetic access$102(Lcom/google/android/material/slider/RangeSlider$RangeSliderState;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/material/slider/RangeSlider$RangeSliderState;
    .param p1, "x1"    # I

    .line 184
    iput p1, p0, Lcom/google/android/material/slider/RangeSlider$RangeSliderState;->separationUnit:I

    return p1
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 201
    invoke-super {p0, p1, p2}, Landroid/view/AbsSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 202
    iget v0, p0, Lcom/google/android/material/slider/RangeSlider$RangeSliderState;->minSeparation:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 203
    iget v0, p0, Lcom/google/android/material/slider/RangeSlider$RangeSliderState;->separationUnit:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 204
    return-void
.end method
