.class public abstract Lb/a/d/a/e/a;
.super Lb/a/d/a/d;
.source ""


# static fields
.field private static final r:Ljava/util/logging/Logger;


# instance fields
.field private q:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lb/a/d/a/e/a;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lb/a/d/a/e/a;->r:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lb/a/d/a/d$d;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/d/a/d;-><init>(Lb/a/d/a/d$d;)V

    const-string p1, "polling"

    iput-object p1, p0, Lb/a/d/a/d;->c:Ljava/lang/String;

    return-void
.end method

.method static synthetic A(Lb/a/d/a/e/a;)V
    .locals 0

    invoke-virtual {p0}, Lb/a/d/a/d;->k()V

    return-void
.end method

.method static synthetic B(Lb/a/d/a/e/a;Lb/a/d/b/b;)V
    .locals 0

    invoke-virtual {p0, p1}, Lb/a/d/a/d;->p(Lb/a/d/b/b;)V

    return-void
.end method

.method private F()V
    .locals 2

    sget-object v0, Lb/a/d/a/e/a;->r:Ljava/util/logging/Logger;

    const-string v1, "polling"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lb/a/d/a/e/a;->q:Z

    invoke-virtual {p0}, Lb/a/d/a/e/a;->C()V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "poll"

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method

.method private t(Ljava/lang/Object;)V
    .locals 5

    sget-object v0, Lb/a/d/a/e/a;->r:Ljava/util/logging/Logger;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "polling got data %s"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    new-instance v2, Lb/a/d/a/e/a$b;

    invoke-direct {v2, p0, p0}, Lb/a/d/a/e/a$b;-><init>(Lb/a/d/a/e/a;Lb/a/d/a/e/a;)V

    instance-of v4, p1, Ljava/lang/String;

    if-eqz v4, :cond_0

    check-cast p1, Ljava/lang/String;

    invoke-static {p1, v2}, Lb/a/d/b/c;->f(Ljava/lang/String;Lb/a/d/b/c$c;)V

    goto :goto_0

    :cond_0
    instance-of v4, p1, [B

    if-eqz v4, :cond_1

    check-cast p1, [B

    invoke-static {p1, v2}, Lb/a/d/b/c;->g([BLb/a/d/b/c$c;)V

    :cond_1
    :goto_0
    iget-object p1, p0, Lb/a/d/a/d;->p:Lb/a/d/a/d$e;

    sget-object v2, Lb/a/d/a/d$e;->c:Lb/a/d/a/d$e;

    if-eq p1, v2, :cond_3

    iput-boolean v3, p0, Lb/a/d/a/e/a;->q:Z

    new-array p1, v3, [Ljava/lang/Object;

    const-string v2, "pollComplete"

    invoke-virtual {p0, v2, p1}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    iget-object p1, p0, Lb/a/d/a/d;->p:Lb/a/d/a/d$e;

    sget-object v2, Lb/a/d/a/d$e;->b:Lb/a/d/a/d$e;

    if-ne p1, v2, :cond_2

    invoke-direct {p0}, Lb/a/d/a/e/a;->F()V

    goto :goto_1

    :cond_2
    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v3

    const-string p1, "ignoring poll - transport state \'%s\'"

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    :cond_3
    :goto_1
    return-void
.end method

.method static synthetic u(Lb/a/d/a/e/a;Lb/a/d/a/d$e;)Lb/a/d/a/d$e;
    .locals 0

    iput-object p1, p0, Lb/a/d/a/d;->p:Lb/a/d/a/d$e;

    return-object p1
.end method

.method static synthetic v()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lb/a/d/a/e/a;->r:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic w(Lb/a/d/a/e/a;Lb/a/d/a/d$e;)Lb/a/d/a/d$e;
    .locals 0

    iput-object p1, p0, Lb/a/d/a/d;->p:Lb/a/d/a/d$e;

    return-object p1
.end method

.method static synthetic x(Lb/a/d/a/e/a;)Z
    .locals 0

    iget-boolean p0, p0, Lb/a/d/a/e/a;->q:Z

    return p0
.end method

.method static synthetic y(Lb/a/d/a/e/a;)Lb/a/d/a/d$e;
    .locals 0

    iget-object p0, p0, Lb/a/d/a/d;->p:Lb/a/d/a/d$e;

    return-object p0
.end method

.method static synthetic z(Lb/a/d/a/e/a;)V
    .locals 0

    invoke-virtual {p0}, Lb/a/d/a/d;->o()V

    return-void
.end method


# virtual methods
.method protected abstract C()V
.end method

.method protected abstract D([BLjava/lang/Runnable;)V
.end method

.method public E(Ljava/lang/Runnable;)V
    .locals 1

    new-instance v0, Lb/a/d/a/e/a$a;

    invoke-direct {v0, p0, p1}, Lb/a/d/a/e/a$a;-><init>(Lb/a/d/a/e/a;Ljava/lang/Runnable;)V

    invoke-static {v0}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected G()Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lb/a/d/a/d;->d:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :cond_0
    iget-boolean v1, p0, Lb/a/d/a/d;->e:Z

    const-string v2, "https"

    const-string v3, "http"

    if-eqz v1, :cond_1

    move-object v1, v2

    goto :goto_0

    :cond_1
    move-object v1, v3

    :goto_0
    iget-boolean v4, p0, Lb/a/d/a/d;->f:Z

    if-eqz v4, :cond_2

    iget-object v4, p0, Lb/a/d/a/d;->j:Ljava/lang/String;

    invoke-static {}, Lb/a/k/a;->b()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    invoke-static {v0}, Lb/a/g/a;->b(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    iget v4, p0, Lb/a/d/a/d;->g:I

    const-string v5, ":"

    if-lez v4, :cond_5

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget v2, p0, Lb/a/d/a/d;->g:I

    const/16 v4, 0x1bb

    if-ne v2, v4, :cond_4

    :cond_3
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget v2, p0, Lb/a/d/a/d;->g:I

    const/16 v3, 0x50

    if-eq v2, v3, :cond_5

    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lb/a/d/a/d;->g:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_5
    const-string v2, ""

    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_6
    iget-object v3, p0, Lb/a/d/a/d;->i:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "://"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v3, :cond_7

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lb/a/d/a/d;->i:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "]"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_7
    iget-object v1, p0, Lb/a/d/a/d;->i:Ljava/lang/String;

    :goto_2
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/a/d/a/d;->h:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected i()V
    .locals 3

    new-instance v0, Lb/a/d/a/e/a$c;

    invoke-direct {v0, p0, p0}, Lb/a/d/a/e/a$c;-><init>(Lb/a/d/a/e/a;Lb/a/d/a/e/a;)V

    iget-object v1, p0, Lb/a/d/a/d;->p:Lb/a/d/a/d$e;

    sget-object v2, Lb/a/d/a/d$e;->b:Lb/a/d/a/d$e;

    if-ne v1, v2, :cond_0

    sget-object v1, Lb/a/d/a/e/a;->r:Ljava/util/logging/Logger;

    const-string v2, "transport open - closing"

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-interface {v0, v1}, Lb/a/c/a$a;->a([Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    sget-object v1, Lb/a/d/a/e/a;->r:Ljava/util/logging/Logger;

    const-string v2, "transport not open - deferring close"

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    const-string v1, "open"

    invoke-virtual {p0, v1, v0}, Lb/a/c/a;->f(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    :goto_0
    return-void
.end method

.method protected j()V
    .locals 0

    invoke-direct {p0}, Lb/a/d/a/e/a;->F()V

    return-void
.end method

.method protected l(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/d/a/e/a;->t(Ljava/lang/Object;)V

    return-void
.end method

.method protected m([B)V
    .locals 0

    invoke-direct {p0, p1}, Lb/a/d/a/e/a;->t(Ljava/lang/Object;)V

    return-void
.end method

.method protected s([Lb/a/d/b/b;)V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lb/a/d/a/d;->b:Z

    new-instance v0, Lb/a/d/a/e/a$d;

    invoke-direct {v0, p0, p0}, Lb/a/d/a/e/a$d;-><init>(Lb/a/d/a/e/a;Lb/a/d/a/e/a;)V

    new-instance v1, Lb/a/d/a/e/a$e;

    invoke-direct {v1, p0, p0, v0}, Lb/a/d/a/e/a$e;-><init>(Lb/a/d/a/e/a;Lb/a/d/a/e/a;Ljava/lang/Runnable;)V

    invoke-static {p1, v1}, Lb/a/d/b/c;->k([Lb/a/d/b/b;Lb/a/d/b/c$d;)V

    return-void
.end method
