.class Lb/a/d/a/c$m$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


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


# direct methods
.method constructor <init>(Lb/a/d/a/c$m;Lb/a/d/a/c;[Lb/a/c/a$a;)V
    .locals 0

    iput-object p2, p0, Lb/a/d/a/c$m$c;->a:Lb/a/d/a/c;

    iput-object p3, p0, Lb/a/d/a/c$m$c;->b:[Lb/a/c/a$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lb/a/d/a/c$m$c;->a:Lb/a/d/a/c;

    iget-object v1, p0, Lb/a/d/a/c$m$c;->b:[Lb/a/c/a$a;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    const-string v3, "upgrade"

    invoke-virtual {v0, v3, v1}, Lb/a/c/a;->f(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    iget-object v0, p0, Lb/a/d/a/c$m$c;->a:Lb/a/d/a/c;

    iget-object v1, p0, Lb/a/d/a/c$m$c;->b:[Lb/a/c/a$a;

    aget-object v1, v1, v2

    const-string v2, "upgradeError"

    invoke-virtual {v0, v2, v1}, Lb/a/c/a;->f(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    return-void
.end method
