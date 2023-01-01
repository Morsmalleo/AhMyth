.class Lb/a/b/c$d;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lb/a/b/d$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/b/c;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/Timer;


# direct methods
.method constructor <init>(Lb/a/b/c;Ljava/util/Timer;)V
    .locals 0

    iput-object p2, p0, Lb/a/b/c$d;->a:Ljava/util/Timer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    iget-object v0, p0, Lb/a/b/c$d;->a:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    return-void
.end method
