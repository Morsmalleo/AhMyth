.class public Lio/socket/parser/Parser$Encoder;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/parser/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Encoder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/parser/Parser$Encoder$Callback;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private encodeAsBinary(Lio/socket/parser/Packet;Lio/socket/parser/Parser$Encoder$Callback;)V
    .locals 2

    .line 124
    invoke-static {p1}, Lio/socket/parser/Binary;->deconstructPacket(Lio/socket/parser/Packet;)Lio/socket/parser/Binary$DeconstructedPacket;

    move-result-object p1

    .line 125
    iget-object v0, p1, Lio/socket/parser/Binary$DeconstructedPacket;->packet:Lio/socket/parser/Packet;

    invoke-direct {p0, v0}, Lio/socket/parser/Parser$Encoder;->encodeAsString(Lio/socket/parser/Packet;)Ljava/lang/String;

    move-result-object v0

    .line 126
    new-instance v1, Ljava/util/ArrayList;

    iget-object p1, p1, Lio/socket/parser/Binary$DeconstructedPacket;->buffers:[[B

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 p1, 0x0

    .line 128
    invoke-interface {v1, p1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 129
    invoke-interface {v1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/socket/parser/Parser$Encoder$Callback;->call([Ljava/lang/Object;)V

    return-void
.end method

.method private encodeAsString(Lio/socket/parser/Packet;)Ljava/lang/String;
    .locals 6

    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    iget v1, p1, Lio/socket/parser/Packet;->type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    iget v1, p1, Lio/socket/parser/Packet;->type:I

    const/4 v2, 0x5

    if-eq v2, v1, :cond_0

    const/4 v1, 0x6

    iget v2, p1, Lio/socket/parser/Packet;->type:I

    if-ne v1, v2, :cond_1

    .line 97
    :cond_0
    iget v1, p1, Lio/socket/parser/Packet;->attachments:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "-"

    .line 98
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    :cond_1
    iget-object v1, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    iget-object v1, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    const-string v4, "/"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 103
    iget-object v1, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    .line 106
    :goto_0
    iget v4, p1, Lio/socket/parser/Packet;->id:I

    const-string v5, ","

    if-ltz v4, :cond_4

    if-eqz v1, :cond_3

    .line 108
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    .line 111
    :cond_3
    iget v4, p1, Lio/socket/parser/Packet;->id:I

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 114
    :cond_4
    iget-object v4, p1, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    if-eqz v4, :cond_6

    if-eqz v1, :cond_5

    .line 115
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    :cond_5
    iget-object v1, p1, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 119
    :cond_6
    invoke-static {}, Lio/socket/parser/Parser;->access$000()Ljava/util/logging/Logger;

    move-result-object v1

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v3

    aput-object v0, v4, v2

    const-string p1, "encoded %s as %s"

    invoke-static {p1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public encode(Lio/socket/parser/Packet;Lio/socket/parser/Parser$Encoder$Callback;)V
    .locals 5

    .line 80
    invoke-static {}, Lio/socket/parser/Parser;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "encoding packet %s"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 82
    iget v0, p1, Lio/socket/parser/Packet;->type:I

    const/4 v2, 0x5

    if-eq v2, v0, :cond_1

    const/4 v0, 0x6

    iget v2, p1, Lio/socket/parser/Packet;->type:I

    if-ne v0, v2, :cond_0

    goto :goto_0

    .line 85
    :cond_0
    invoke-direct {p0, p1}, Lio/socket/parser/Parser$Encoder;->encodeAsString(Lio/socket/parser/Packet;)Ljava/lang/String;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/String;

    aput-object p1, v0, v3

    .line 86
    invoke-interface {p2, v0}, Lio/socket/parser/Parser$Encoder$Callback;->call([Ljava/lang/Object;)V

    goto :goto_1

    .line 83
    :cond_1
    :goto_0
    invoke-direct {p0, p1, p2}, Lio/socket/parser/Parser$Encoder;->encodeAsBinary(Lio/socket/parser/Packet;Lio/socket/parser/Parser$Encoder$Callback;)V

    :goto_1
    return-void
.end method
