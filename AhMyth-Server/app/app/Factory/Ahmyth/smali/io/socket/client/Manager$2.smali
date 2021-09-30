.class Lio/socket/client/Manager$2;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager;->onopen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/client/Manager;


# direct methods
.method constructor <init>(Lio/socket/client/Manager;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/client/Manager;

    .line 325
    iput-object p1, p0, Lio/socket/client/Manager$2;->this$0:Lio/socket/client/Manager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 5
    .param p1, "objects"    # [Ljava/lang/Object;

    .line 328
    const/4 v0, 0x0

    aget-object v0, p1, v0

    .line 330
    .local v0, "data":Ljava/lang/Object;
    :try_start_0
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 331
    iget-object v1, p0, Lio/socket/client/Manager$2;->this$0:Lio/socket/client/Manager;

    invoke-static {v1}, Lio/socket/client/Manager;->access$900(Lio/socket/client/Manager;)Lio/socket/parser/Parser$Decoder;

    move-result-object v1

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1, v2}, Lio/socket/parser/Parser$Decoder;->add(Ljava/lang/String;)V

    goto :goto_0

    .line 332
    :cond_0
    instance-of v1, v0, [B

    if-eqz v1, :cond_1

    .line 333
    iget-object v1, p0, Lio/socket/client/Manager$2;->this$0:Lio/socket/client/Manager;

    invoke-static {v1}, Lio/socket/client/Manager;->access$900(Lio/socket/client/Manager;)Lio/socket/parser/Parser$Decoder;

    move-result-object v1

    move-object v2, v0

    check-cast v2, [B

    check-cast v2, [B

    invoke-interface {v1, v2}, Lio/socket/parser/Parser$Decoder;->add([B)V
    :try_end_0
    .catch Lio/socket/parser/DecodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 337
    :cond_1
    :goto_0
    goto :goto_1

    .line 335
    :catch_0
    move-exception v1

    .line 336
    .local v1, "e":Lio/socket/parser/DecodingException;
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "error while decoding the packet: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lio/socket/parser/DecodingException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 338
    .end local v1    # "e":Lio/socket/parser/DecodingException;
    :goto_1
    return-void
.end method
