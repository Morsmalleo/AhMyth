.class Lokhttp3/internal/cache/DiskLruCache$Editor$1;
.super Lokhttp3/internal/cache/FaultHidingSink;
.source "DiskLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lokhttp3/internal/cache/DiskLruCache$Editor;->newSink(I)Lokio/Sink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lokhttp3/internal/cache/DiskLruCache$Editor;


# direct methods
.method constructor <init>(Lokhttp3/internal/cache/DiskLruCache$Editor;Lokio/Sink;)V
    .locals 0
    .param p1, "this$1"    # Lokhttp3/internal/cache/DiskLruCache$Editor;
    .param p2, "delegate"    # Lokio/Sink;

    .line 904
    iput-object p1, p0, Lokhttp3/internal/cache/DiskLruCache$Editor$1;->this$1:Lokhttp3/internal/cache/DiskLruCache$Editor;

    invoke-direct {p0, p2}, Lokhttp3/internal/cache/FaultHidingSink;-><init>(Lokio/Sink;)V

    return-void
.end method


# virtual methods
.method protected onException(Ljava/io/IOException;)V
    .locals 2
    .param p1, "e"    # Ljava/io/IOException;

    .line 906
    iget-object v0, p0, Lokhttp3/internal/cache/DiskLruCache$Editor$1;->this$1:Lokhttp3/internal/cache/DiskLruCache$Editor;

    iget-object v0, v0, Lokhttp3/internal/cache/DiskLruCache$Editor;->this$0:Lokhttp3/internal/cache/DiskLruCache;

    monitor-enter v0

    .line 907
    :try_start_0
    iget-object v1, p0, Lokhttp3/internal/cache/DiskLruCache$Editor$1;->this$1:Lokhttp3/internal/cache/DiskLruCache$Editor;

    invoke-virtual {v1}, Lokhttp3/internal/cache/DiskLruCache$Editor;->detach()V

    .line 908
    monitor-exit v0

    .line 909
    return-void

    .line 908
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
