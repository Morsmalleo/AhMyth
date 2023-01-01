.class public Lb/a/h/c$c;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/a/h/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/a/h/c$c$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private b(Lb/a/h/b;Lb/a/h/c$c$a;)V
    .locals 2

    invoke-static {p1}, Lb/a/h/a;->c(Lb/a/h/b;)Lb/a/h/a$a;

    move-result-object p1

    iget-object v0, p1, Lb/a/h/a$a;->a:Lb/a/h/b;

    invoke-direct {p0, v0}, Lb/a/h/c$c;->c(Lb/a/h/b;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    iget-object p1, p1, Lb/a/h/a$a;->b:[[B

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 p1, 0x0

    invoke-interface {v1, p1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    invoke-interface {v1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lb/a/h/c$c$a;->a([Ljava/lang/Object;)V

    return-void
.end method

.method private c(Lb/a/h/b;)Ljava/lang/String;
    .locals 6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p1, Lb/a/h/b;->a:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget v1, p1, Lb/a/h/b;->a:I

    const/4 v2, 0x5

    if-eq v2, v1, :cond_0

    const/4 v2, 0x6

    if-ne v2, v1, :cond_1

    :cond_0
    iget v1, p1, Lb/a/h/b;->e:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    iget-object v1, p1, Lb/a/h/b;->c:Ljava/lang/String;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p1, Lb/a/h/b;->c:Ljava/lang/String;

    const-string v4, "/"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p1, Lb/a/h/b;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    iget v4, p1, Lb/a/h/b;->b:I

    const-string v5, ","

    if-ltz v4, :cond_4

    if-eqz v1, :cond_3

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    :cond_3
    iget v4, p1, Lb/a/h/b;->b:I

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_4
    iget-object v4, p1, Lb/a/h/b;->d:Ljava/lang/Object;

    if-eqz v4, :cond_6

    if-eqz v1, :cond_5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_5
    iget-object v1, p1, Lb/a/h/b;->d:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_6
    invoke-static {}, Lb/a/h/c;->a()Ljava/util/logging/Logger;

    move-result-object v1

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v3

    aput-object v0, v4, v2

    const-string p1, "encoded %s as %s"

    invoke-static {p1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public a(Lb/a/h/b;Lb/a/h/c$c$a;)V
    .locals 5

    invoke-static {}, Lb/a/h/c;->a()Ljava/util/logging/Logger;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "encoding packet %s"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget v0, p1, Lb/a/h/b;->a:I

    const/4 v2, 0x5

    if-eq v2, v0, :cond_1

    const/4 v2, 0x6

    if-ne v2, v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lb/a/h/c$c;->c(Lb/a/h/b;)Ljava/lang/String;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/String;

    aput-object p1, v0, v3

    invoke-interface {p2, v0}, Lb/a/h/c$c$a;->a([Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    :goto_0
    invoke-direct {p0, p1, p2}, Lb/a/h/c$c;->b(Lb/a/h/b;Lb/a/h/c$c$a;)V

    :goto_1
    return-void
.end method
