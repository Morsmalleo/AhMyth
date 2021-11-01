.class public Lio/socket/parser/Packet;
.super Ljava/lang/Object;
.source "Packet.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public attachments:I

.field public data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public id:I

.field public nsp:Ljava/lang/String;

.field public type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 6
    iput v0, p0, Lio/socket/parser/Packet;->type:I

    .line 7
    iput v0, p0, Lio/socket/parser/Packet;->id:I

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 6
    iput v0, p0, Lio/socket/parser/Packet;->type:I

    .line 7
    iput v0, p0, Lio/socket/parser/Packet;->id:I

    .line 15
    iput p1, p0, Lio/socket/parser/Packet;->type:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 6
    iput v0, p0, Lio/socket/parser/Packet;->type:I

    .line 7
    iput v0, p0, Lio/socket/parser/Packet;->id:I

    .line 19
    iput p1, p0, Lio/socket/parser/Packet;->type:I

    .line 20
    iput-object p2, p0, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    return-void
.end method
