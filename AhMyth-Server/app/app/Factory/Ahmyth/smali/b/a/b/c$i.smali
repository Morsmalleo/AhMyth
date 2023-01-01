.class Lb/a/b/c$i;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/c/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/b/c;->Q()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/b/c;


# direct methods
.method constructor <init>(Lb/a/b/c;)V
    .locals 0

    iput-object p1, p0, Lb/a/b/c$i;->a:Lb/a/b/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lb/a/b/c$i;->a:Lb/a/b/c;

    const/4 v1, 0x0

    aget-object p1, p1, v1

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1}, Lb/a/b/c;->o(Lb/a/b/c;Ljava/lang/String;)V

    return-void
.end method
