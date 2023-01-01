.class public Lb/a/d/a/c$u;
.super Lb/a/d/a/d$d;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/a/d/a/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "u"
.end annotation


# instance fields
.field public o:[Ljava/lang/String;

.field public p:Z

.field public q:Z

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lb/a/d/a/d$d;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lb/a/d/a/c$u;->p:Z

    return-void
.end method

.method static synthetic a(Ljava/net/URI;Lb/a/d/a/c$u;)Lb/a/d/a/c$u;
    .locals 0

    invoke-static {p0, p1}, Lb/a/d/a/c$u;->b(Ljava/net/URI;Lb/a/d/a/c$u;)Lb/a/d/a/c$u;

    move-result-object p0

    return-object p0
.end method

.method private static b(Ljava/net/URI;Lb/a/d/a/c$u;)Lb/a/d/a/c$u;
    .locals 2

    if-nez p1, :cond_0

    new-instance p1, Lb/a/d/a/c$u;

    invoke-direct {p1}, Lb/a/d/a/c$u;-><init>()V

    :cond_0
    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lb/a/d/a/c$u;->r:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "wss"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p1, Lb/a/d/a/d$d;->d:Z

    invoke-virtual {p0}, Ljava/net/URI;->getPort()I

    move-result v0

    iput v0, p1, Lb/a/d/a/d$d;->f:I

    invoke-virtual {p0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_3

    iput-object p0, p1, Lb/a/d/a/c$u;->s:Ljava/lang/String;

    :cond_3
    return-object p1
.end method
