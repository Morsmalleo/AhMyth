.class Lio/socket/parser/IOParser$BinaryReconstructor;
.super Ljava/lang/Object;
.source "IOParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/parser/IOParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BinaryReconstructor"
.end annotation


# instance fields
.field buffers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field

.field public reconPack:Lio/socket/parser/Packet;


# direct methods
.method constructor <init>(Lio/socket/parser/Packet;)V
    .locals 1
    .param p1, "packet"    # Lio/socket/parser/Packet;

    .line 240
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 241
    iput-object p1, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->reconPack:Lio/socket/parser/Packet;

    .line 242
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->buffers:Ljava/util/List;

    .line 243
    return-void
.end method


# virtual methods
.method public finishReconstruction()V
    .locals 1

    .line 257
    const/4 v0, 0x0

    iput-object v0, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->reconPack:Lio/socket/parser/Packet;

    .line 258
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->buffers:Ljava/util/List;

    .line 259
    return-void
.end method

.method public takeBinaryData([B)Lio/socket/parser/Packet;
    .locals 3
    .param p1, "binData"    # [B

    .line 246
    iget-object v0, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->buffers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 247
    iget-object v0, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->buffers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->reconPack:Lio/socket/parser/Packet;

    iget v1, v1, Lio/socket/parser/Packet;->attachments:I

    if-ne v0, v1, :cond_0

    .line 248
    iget-object v0, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->reconPack:Lio/socket/parser/Packet;

    iget-object v1, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->buffers:Ljava/util/List;

    .line 249
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [[B

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[B

    .line 248
    invoke-static {v0, v1}, Lio/socket/parser/Binary;->reconstructPacket(Lio/socket/parser/Packet;[[B)Lio/socket/parser/Packet;

    move-result-object v0

    .line 250
    .local v0, "packet":Lio/socket/parser/Packet;
    invoke-virtual {p0}, Lio/socket/parser/IOParser$BinaryReconstructor;->finishReconstruction()V

    .line 251
    return-object v0

    .line 253
    .end local v0    # "packet":Lio/socket/parser/Packet;
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method
