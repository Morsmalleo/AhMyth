.class final Lokio/SegmentPool;
.super Ljava/lang/Object;
.source "SegmentPool.java"


# static fields
.field static final MAX_SIZE:J = 0x10000L

.field static byteCount:J

.field static next:Lokio/Segment;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static recycle(Lokio/Segment;)V
    .locals 10

    .line 50
    iget-object v0, p0, Lokio/Segment;->next:Lokio/Segment;

    if-nez v0, :cond_2

    iget-object v0, p0, Lokio/Segment;->prev:Lokio/Segment;

    if-nez v0, :cond_2

    .line 51
    iget-boolean v0, p0, Lokio/Segment;->shared:Z

    if-eqz v0, :cond_0

    return-void

    .line 52
    :cond_0
    const-class v0, Lokio/SegmentPool;

    monitor-enter v0

    .line 53
    :try_start_0
    sget-wide v1, Lokio/SegmentPool;->byteCount:J

    const-wide/16 v3, 0x2000

    add-long v5, v1, v3

    const-wide/32 v7, 0x10000

    cmp-long v9, v5, v7

    if-lez v9, :cond_1

    monitor-exit v0

    return-void

    :cond_1
    add-long/2addr v1, v3

    .line 54
    sput-wide v1, Lokio/SegmentPool;->byteCount:J

    .line 55
    sget-object v1, Lokio/SegmentPool;->next:Lokio/Segment;

    iput-object v1, p0, Lokio/Segment;->next:Lokio/Segment;

    const/4 v1, 0x0

    .line 56
    iput v1, p0, Lokio/Segment;->limit:I

    iput v1, p0, Lokio/Segment;->pos:I

    .line 57
    sput-object p0, Lokio/SegmentPool;->next:Lokio/Segment;

    .line 58
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 50
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
.end method

.method static take()Lokio/Segment;
    .locals 6

    .line 37
    const-class v0, Lokio/SegmentPool;

    monitor-enter v0

    .line 38
    :try_start_0
    sget-object v1, Lokio/SegmentPool;->next:Lokio/Segment;

    if-eqz v1, :cond_0

    .line 40
    iget-object v2, v1, Lokio/Segment;->next:Lokio/Segment;

    sput-object v2, Lokio/SegmentPool;->next:Lokio/Segment;

    const/4 v2, 0x0

    .line 41
    iput-object v2, v1, Lokio/Segment;->next:Lokio/Segment;

    .line 42
    sget-wide v2, Lokio/SegmentPool;->byteCount:J

    const-wide/16 v4, 0x2000

    sub-long/2addr v2, v4

    sput-wide v2, Lokio/SegmentPool;->byteCount:J

    .line 43
    monitor-exit v0

    return-object v1

    .line 45
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    new-instance v0, Lokio/Segment;

    invoke-direct {v0}, Lokio/Segment;-><init>()V

    return-object v0

    :catchall_0
    move-exception v1

    .line 45
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
