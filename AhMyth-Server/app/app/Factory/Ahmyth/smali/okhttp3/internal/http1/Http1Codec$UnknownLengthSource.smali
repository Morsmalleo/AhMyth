.class Lokhttp3/internal/http1/Http1Codec$UnknownLengthSource;
.super Lokhttp3/internal/http1/Http1Codec$AbstractSource;
.source "Http1Codec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/http1/Http1Codec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UnknownLengthSource"
.end annotation


# instance fields
.field private inputExhausted:Z

.field final synthetic this$0:Lokhttp3/internal/http1/Http1Codec;


# direct methods
.method constructor <init>(Lokhttp3/internal/http1/Http1Codec;)V
    .locals 1

    .line 474
    iput-object p1, p0, Lokhttp3/internal/http1/Http1Codec$UnknownLengthSource;->this$0:Lokhttp3/internal/http1/Http1Codec;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lokhttp3/internal/http1/Http1Codec$AbstractSource;-><init>(Lokhttp3/internal/http1/Http1Codec;Lokhttp3/internal/http1/Http1Codec$1;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 493
    iget-boolean v0, p0, Lokhttp3/internal/http1/Http1Codec$UnknownLengthSource;->closed:Z

    if-eqz v0, :cond_0

    return-void

    .line 494
    :cond_0
    iget-boolean v0, p0, Lokhttp3/internal/http1/Http1Codec$UnknownLengthSource;->inputExhausted:Z

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 495
    invoke-virtual {p0, v0}, Lokhttp3/internal/http1/Http1Codec$UnknownLengthSource;->endOfInput(Z)V

    :cond_1
    const/4 v0, 0x1

    .line 497
    iput-boolean v0, p0, Lokhttp3/internal/http1/Http1Codec$UnknownLengthSource;->closed:Z

    return-void
.end method

.method public read(Lokio/Buffer;J)J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_3

    .line 480
    iget-boolean v0, p0, Lokhttp3/internal/http1/Http1Codec$UnknownLengthSource;->closed:Z

    if-nez v0, :cond_2

    .line 481
    iget-boolean v0, p0, Lokhttp3/internal/http1/Http1Codec$UnknownLengthSource;->inputExhausted:Z

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_0

    return-wide v1

    .line 483
    :cond_0
    iget-object v0, p0, Lokhttp3/internal/http1/Http1Codec$UnknownLengthSource;->this$0:Lokhttp3/internal/http1/Http1Codec;

    iget-object v0, v0, Lokhttp3/internal/http1/Http1Codec;->source:Lokio/BufferedSource;

    invoke-interface {v0, p1, p2, p3}, Lokio/BufferedSource;->read(Lokio/Buffer;J)J

    move-result-wide p1

    cmp-long p3, p1, v1

    if-nez p3, :cond_1

    const/4 p1, 0x1

    .line 485
    iput-boolean p1, p0, Lokhttp3/internal/http1/Http1Codec$UnknownLengthSource;->inputExhausted:Z

    .line 486
    invoke-virtual {p0, p1}, Lokhttp3/internal/http1/Http1Codec$UnknownLengthSource;->endOfInput(Z)V

    return-wide v1

    :cond_1
    return-wide p1

    .line 480
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 479
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "byteCount < 0: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
