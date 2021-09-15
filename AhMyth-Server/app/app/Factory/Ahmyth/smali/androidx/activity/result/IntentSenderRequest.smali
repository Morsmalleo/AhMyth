.class public final Landroidx/activity/result/IntentSenderRequest;
.super Ljava/lang/Object;
.source "IntentSenderRequest.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/activity/result/IntentSenderRequest$Builder;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Landroidx/activity/result/IntentSenderRequest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mFillInIntent:Landroid/content/Intent;

.field private final mFlagsMask:I

.field private final mFlagsValues:I

.field private final mIntentSender:Landroid/content/IntentSender;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 132
    new-instance v0, Landroidx/activity/result/IntentSenderRequest$1;

    invoke-direct {v0}, Landroidx/activity/result/IntentSenderRequest$1;-><init>()V

    sput-object v0, Landroidx/activity/result/IntentSenderRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(Landroid/content/IntentSender;Landroid/content/Intent;II)V
    .locals 0
    .param p1, "intentSender"    # Landroid/content/IntentSender;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "flagsMask"    # I
    .param p4, "flagsValues"    # I

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput-object p1, p0, Landroidx/activity/result/IntentSenderRequest;->mIntentSender:Landroid/content/IntentSender;

    .line 79
    iput-object p2, p0, Landroidx/activity/result/IntentSenderRequest;->mFillInIntent:Landroid/content/Intent;

    .line 80
    iput p3, p0, Landroidx/activity/result/IntentSenderRequest;->mFlagsMask:I

    .line 81
    iput p4, p0, Landroidx/activity/result/IntentSenderRequest;->mFlagsValues:I

    .line 82
    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    const-class v0, Landroid/content/IntentSender;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/IntentSender;

    iput-object v0, p0, Landroidx/activity/result/IntentSenderRequest;->mIntentSender:Landroid/content/IntentSender;

    .line 126
    const-class v0, Landroid/content/Intent;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Landroidx/activity/result/IntentSenderRequest;->mFillInIntent:Landroid/content/Intent;

    .line 127
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroidx/activity/result/IntentSenderRequest;->mFlagsMask:I

    .line 128
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroidx/activity/result/IntentSenderRequest;->mFlagsValues:I

    .line 129
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 146
    const/4 v0, 0x0

    return v0
.end method

.method public getFillInIntent()Landroid/content/Intent;
    .locals 1

    .line 102
    iget-object v0, p0, Landroidx/activity/result/IntentSenderRequest;->mFillInIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public getFlagsMask()I
    .locals 1

    .line 111
    iget v0, p0, Landroidx/activity/result/IntentSenderRequest;->mFlagsMask:I

    return v0
.end method

.method public getFlagsValues()I
    .locals 1

    .line 120
    iget v0, p0, Landroidx/activity/result/IntentSenderRequest;->mFlagsValues:I

    return v0
.end method

.method public getIntentSender()Landroid/content/IntentSender;
    .locals 1

    .line 91
    iget-object v0, p0, Landroidx/activity/result/IntentSenderRequest;->mIntentSender:Landroid/content/IntentSender;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 151
    iget-object v0, p0, Landroidx/activity/result/IntentSenderRequest;->mIntentSender:Landroid/content/IntentSender;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 152
    iget-object v0, p0, Landroidx/activity/result/IntentSenderRequest;->mFillInIntent:Landroid/content/Intent;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 153
    iget v0, p0, Landroidx/activity/result/IntentSenderRequest;->mFlagsMask:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 154
    iget v0, p0, Landroidx/activity/result/IntentSenderRequest;->mFlagsValues:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 155
    return-void
.end method
