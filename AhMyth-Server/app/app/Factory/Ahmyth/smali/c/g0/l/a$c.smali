.class final Lc/g0/l/a$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/g0/l/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Lc/g0/l/a;


# direct methods
.method constructor <init>(Lc/g0/l/a;)V
    .locals 0

    iput-object p1, p0, Lc/g0/l/a$c;->a:Lc/g0/l/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lc/g0/l/a$c;->a:Lc/g0/l/a;

    invoke-virtual {v0}, Lc/g0/l/a;->a()V

    return-void
.end method
