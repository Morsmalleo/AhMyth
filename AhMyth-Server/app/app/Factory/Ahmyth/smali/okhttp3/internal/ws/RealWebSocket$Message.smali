.class final Lokhttp3/internal/ws/RealWebSocket$Message;
.super Ljava/lang/Object;
.source "RealWebSocket.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/ws/RealWebSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Message"
.end annotation


# instance fields
.field final data:Lokio/ByteString;

.field final formatOpcode:I


# direct methods
.method constructor <init>(ILokio/ByteString;)V
    .locals 0
    .param p1, "formatOpcode"    # I
    .param p2, "data"    # Lokio/ByteString;

    .line 581
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 582
    iput p1, p0, Lokhttp3/internal/ws/RealWebSocket$Message;->formatOpcode:I

    .line 583
    iput-object p2, p0, Lokhttp3/internal/ws/RealWebSocket$Message;->data:Lokio/ByteString;

    .line 584
    return-void
.end method
