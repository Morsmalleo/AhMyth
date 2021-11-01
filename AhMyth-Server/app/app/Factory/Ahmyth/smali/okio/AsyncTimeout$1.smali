.class Lokio/AsyncTimeout$1;
.super Ljava/lang/Object;
.source "AsyncTimeout.java"

# interfaces
.implements Lokio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lokio/AsyncTimeout;->sink(Lokio/Sink;)Lokio/Sink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lokio/AsyncTimeout;

.field final synthetic val$sink:Lokio/Sink;


# direct methods
.method constructor <init>(Lokio/AsyncTimeout;Lokio/Sink;)V
    .locals 0

    .line 159
    iput-object p1, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    iput-object p2, p0, Lokio/AsyncTimeout$1;->val$sink:Lokio/Sink;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    iget-object v0, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    invoke-virtual {v0}, Lokio/AsyncTimeout;->enter()V

    .line 207
    :try_start_0
    iget-object v0, p0, Lokio/AsyncTimeout$1;->val$sink:Lokio/Sink;

    invoke-interface {v0}, Lokio/Sink;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    .line 212
    iget-object v1, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    invoke-virtual {v1, v0}, Lokio/AsyncTimeout;->exit(Z)V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 210
    :try_start_1
    iget-object v1, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    invoke-virtual {v1, v0}, Lokio/AsyncTimeout;->exit(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 212
    :goto_0
    iget-object v1, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lokio/AsyncTimeout;->exit(Z)V

    throw v0
.end method

.method public flush()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 192
    iget-object v0, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    invoke-virtual {v0}, Lokio/AsyncTimeout;->enter()V

    .line 194
    :try_start_0
    iget-object v0, p0, Lokio/AsyncTimeout$1;->val$sink:Lokio/Sink;

    invoke-interface {v0}, Lokio/Sink;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    .line 199
    iget-object v1, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    invoke-virtual {v1, v0}, Lokio/AsyncTimeout;->exit(Z)V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 197
    :try_start_1
    iget-object v1, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    invoke-virtual {v1, v0}, Lokio/AsyncTimeout;->exit(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 199
    :goto_0
    iget-object v1, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lokio/AsyncTimeout;->exit(Z)V

    throw v0
.end method

.method public timeout()Lokio/Timeout;
    .locals 1

    .line 217
    iget-object v0, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 221
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AsyncTimeout.sink("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lokio/AsyncTimeout$1;->val$sink:Lokio/Sink;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Lokio/Buffer;J)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 161
    iget-wide v0, p1, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_2

    .line 166
    iget-object v2, p1, Lokio/Buffer;->head:Lokio/Segment;

    :goto_1
    const-wide/32 v3, 0x10000

    cmp-long v5, v0, v3

    if-gez v5, :cond_1

    .line 167
    iget-object v3, p1, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v3, Lokio/Segment;->limit:I

    iget-object v4, p1, Lokio/Buffer;->head:Lokio/Segment;

    iget v4, v4, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    add-long/2addr v0, v3

    cmp-long v3, v0, p2

    if-ltz v3, :cond_0

    move-wide v0, p2

    goto :goto_2

    .line 166
    :cond_0
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_1

    :cond_1
    :goto_2
    const/4 v2, 0x0

    .line 177
    iget-object v3, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    invoke-virtual {v3}, Lokio/AsyncTimeout;->enter()V

    .line 179
    :try_start_0
    iget-object v3, p0, Lokio/AsyncTimeout$1;->val$sink:Lokio/Sink;

    invoke-interface {v3, p1, v0, v1}, Lokio/Sink;->write(Lokio/Buffer;J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-long/2addr p2, v0

    const/4 v0, 0x1

    .line 185
    iget-object v1, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    invoke-virtual {v1, v0}, Lokio/AsyncTimeout;->exit(Z)V

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_0
    move-exception p1

    .line 183
    :try_start_1
    iget-object p2, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    invoke-virtual {p2, p1}, Lokio/AsyncTimeout;->exit(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 185
    :goto_3
    iget-object p2, p0, Lokio/AsyncTimeout$1;->this$0:Lokio/AsyncTimeout;

    invoke-virtual {p2, v2}, Lokio/AsyncTimeout;->exit(Z)V

    throw p1

    :cond_2
    return-void
.end method
