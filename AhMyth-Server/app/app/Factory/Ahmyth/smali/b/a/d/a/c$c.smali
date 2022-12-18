.class Lb/a/d/a/c$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/c/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/c;->T(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:[Lb/a/d/a/d;

.field final synthetic b:Lb/a/c/a$a;


# direct methods
.method constructor <init>(Lb/a/d/a/c;[Lb/a/d/a/d;Lb/a/c/a$a;)V
    .locals 0

    iput-object p2, p0, Lb/a/d/a/c$c;->a:[Lb/a/d/a/d;

    iput-object p3, p0, Lb/a/d/a/c$c;->b:Lb/a/c/a$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Object;)V
    .locals 4

    const/4 v0, 0x0

    aget-object p1, p1, v0

    check-cast p1, Lb/a/d/a/d;

    iget-object v1, p0, Lb/a/d/a/c$c;->a:[Lb/a/d/a/d;

    aget-object v2, v1, v0

    if-eqz v2, :cond_0

    iget-object v2, p1, Lb/a/d/a/d;->c:Ljava/lang/String;

    aget-object v1, v1, v0

    iget-object v1, v1, Lb/a/d/a/d;->c:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {}, Lb/a/d/a/c;->k()Ljava/util/logging/Logger;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object p1, p1, Lb/a/d/a/d;->c:Ljava/lang/String;

    aput-object p1, v2, v0

    const/4 p1, 0x1

    iget-object v3, p0, Lb/a/d/a/c$c;->a:[Lb/a/d/a/d;

    aget-object v3, v3, v0

    iget-object v3, v3, Lb/a/d/a/d;->c:Ljava/lang/String;

    aput-object v3, v2, p1

    const-string p1, "\'%s\' works - aborting \'%s\'"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object p1, p0, Lb/a/d/a/c$c;->b:Lb/a/c/a$a;

    new-array v0, v0, [Ljava/lang/Object;

    invoke-interface {p1, v0}, Lb/a/c/a$a;->a([Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
