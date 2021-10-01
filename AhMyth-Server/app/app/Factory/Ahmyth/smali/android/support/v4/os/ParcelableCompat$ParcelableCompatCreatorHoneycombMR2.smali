.class Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2;
.super Ljava/lang/Object;
.source "ParcelableCompat.java"

# interfaces
.implements Landroid/os/Parcelable$ClassLoaderCreator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/os/ParcelableCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ParcelableCompatCreatorHoneycombMR2"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$ClassLoaderCreator<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final mCallbacks:Landroid/support/v4/os/ParcelableCompatCreatorCallbacks;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/os/ParcelableCompatCreatorCallbacks<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/support/v4/os/ParcelableCompatCreatorCallbacks;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/os/ParcelableCompatCreatorCallbacks<",
            "TT;>;)V"
        }
    .end annotation

    .line 48
    .local p0, "this":Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2;, "Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2<TT;>;"
    .local p1, "callbacks":Landroid/support/v4/os/ParcelableCompatCreatorCallbacks;, "Landroid/support/v4/os/ParcelableCompatCreatorCallbacks<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2;->mCallbacks:Landroid/support/v4/os/ParcelableCompatCreatorCallbacks;

    .line 50
    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Parcel;",
            ")TT;"
        }
    .end annotation

    .line 54
    .local p0, "this":Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2;, "Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2<TT;>;"
    iget-object v0, p0, Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2;->mCallbacks:Landroid/support/v4/os/ParcelableCompatCreatorCallbacks;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/support/v4/os/ParcelableCompatCreatorCallbacks;->createFromParcel(Landroid/os/Parcel;Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public createFromParcel(Landroid/os/Parcel;Ljava/lang/ClassLoader;)Ljava/lang/Object;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;
    .param p2, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Parcel;",
            "Ljava/lang/ClassLoader;",
            ")TT;"
        }
    .end annotation

    .line 59
    .local p0, "this":Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2;, "Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2<TT;>;"
    iget-object v0, p0, Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2;->mCallbacks:Landroid/support/v4/os/ParcelableCompatCreatorCallbacks;

    invoke-interface {v0, p1, p2}, Landroid/support/v4/os/ParcelableCompatCreatorCallbacks;->createFromParcel(Landroid/os/Parcel;Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Ljava/lang/Object;
    .locals 1
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)[TT;"
        }
    .end annotation

    .line 64
    .local p0, "this":Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2;, "Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2<TT;>;"
    iget-object v0, p0, Landroid/support/v4/os/ParcelableCompat$ParcelableCompatCreatorHoneycombMR2;->mCallbacks:Landroid/support/v4/os/ParcelableCompatCreatorCallbacks;

    invoke-interface {v0, p1}, Landroid/support/v4/os/ParcelableCompatCreatorCallbacks;->newArray(I)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
