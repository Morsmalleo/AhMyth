.class Lb/a/b/c$c;
.super Ljava/util/TimerTask;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/b/c;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lb/a/b/c;


# direct methods
.method constructor <init>(Lb/a/b/c;Lb/a/b/c;)V
    .locals 0

    iput-object p2, p0, Lb/a/b/c$c;->a:Lb/a/b/c;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    new-instance v0, Lb/a/b/c$c$a;

    invoke-direct {v0, p0}, Lb/a/b/c$c$a;-><init>(Lb/a/b/c$c;)V

    invoke-static {v0}, Lb/a/i/a;->h(Ljava/lang/Runnable;)V

    return-void
.end method
