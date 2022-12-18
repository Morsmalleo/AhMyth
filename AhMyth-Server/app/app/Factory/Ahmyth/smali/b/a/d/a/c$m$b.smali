.class Lb/a/d/a/c$m$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/c/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/d/a/c$m;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/d/a/c;

.field final synthetic b:[Lb/a/c/a$a;

.field final synthetic c:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lb/a/d/a/c$m;Lb/a/d/a/c;[Lb/a/c/a$a;Ljava/lang/Runnable;)V
    .locals 0

    iput-object p2, p0, Lb/a/d/a/c$m$b;->a:Lb/a/d/a/c;

    iput-object p3, p0, Lb/a/d/a/c$m$b;->b:[Lb/a/c/a$a;

    iput-object p4, p0, Lb/a/d/a/c$m$b;->c:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Object;)V
    .locals 3

    iget-object p1, p0, Lb/a/d/a/c$m$b;->a:Lb/a/d/a/c;

    iget-object v0, p0, Lb/a/d/a/c$m$b;->b:[Lb/a/c/a$a;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const-string v2, "upgrade"

    invoke-virtual {p1, v2, v0}, Lb/a/c/a;->d(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    iget-object p1, p0, Lb/a/d/a/c$m$b;->a:Lb/a/d/a/c;

    iget-object v0, p0, Lb/a/d/a/c$m$b;->b:[Lb/a/c/a$a;

    aget-object v0, v0, v1

    const-string v1, "upgradeError"

    invoke-virtual {p1, v1, v0}, Lb/a/c/a;->d(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    iget-object p1, p0, Lb/a/d/a/c$m$b;->c:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method
