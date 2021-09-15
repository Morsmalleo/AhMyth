.class Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData;
.super Landroidx/lifecycle/MutableLiveData;
.source "SavedStateHandle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/lifecycle/SavedStateHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SavingStateLiveData"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/lifecycle/MutableLiveData<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private mHandle:Landroidx/lifecycle/SavedStateHandle;

.field private mKey:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroidx/lifecycle/SavedStateHandle;Ljava/lang/String;)V
    .locals 0
    .param p1, "handle"    # Landroidx/lifecycle/SavedStateHandle;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "handle",
            "key"
        }
    .end annotation

    .line 357
    .local p0, "this":Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData;, "Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData<TT;>;"
    invoke-direct {p0}, Landroidx/lifecycle/MutableLiveData;-><init>()V

    .line 358
    iput-object p2, p0, Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData;->mKey:Ljava/lang/String;

    .line 359
    iput-object p1, p0, Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData;->mHandle:Landroidx/lifecycle/SavedStateHandle;

    .line 360
    return-void
.end method

.method constructor <init>(Landroidx/lifecycle/SavedStateHandle;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "handle"    # Landroidx/lifecycle/SavedStateHandle;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "handle",
            "key",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/lifecycle/SavedStateHandle;",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .line 351
    .local p0, "this":Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData;, "Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData<TT;>;"
    .local p3, "value":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, p3}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    .line 352
    iput-object p2, p0, Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData;->mKey:Ljava/lang/String;

    .line 353
    iput-object p1, p0, Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData;->mHandle:Landroidx/lifecycle/SavedStateHandle;

    .line 354
    return-void
.end method


# virtual methods
.method detach()V
    .locals 1

    .line 371
    .local p0, "this":Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData;, "Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData<TT;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData;->mHandle:Landroidx/lifecycle/SavedStateHandle;

    .line 372
    return-void
.end method

.method public setValue(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 364
    .local p0, "this":Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData;, "Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData;->mHandle:Landroidx/lifecycle/SavedStateHandle;

    if-eqz v0, :cond_0

    .line 365
    iget-object v0, v0, Landroidx/lifecycle/SavedStateHandle;->mRegular:Ljava/util/Map;

    iget-object v1, p0, Landroidx/lifecycle/SavedStateHandle$SavingStateLiveData;->mKey:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    :cond_0
    invoke-super {p0, p1}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    .line 368
    return-void
.end method
