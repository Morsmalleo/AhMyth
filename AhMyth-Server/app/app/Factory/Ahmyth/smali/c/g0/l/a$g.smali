.class final Lc/g0/l/a$g;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/g0/l/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "g"
.end annotation


# instance fields
.field final synthetic a:Lc/g0/l/a;


# direct methods
.method private constructor <init>(Lc/g0/l/a;)V
    .locals 0

    iput-object p1, p0, Lc/g0/l/a$g;->a:Lc/g0/l/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lc/g0/l/a;Lc/g0/l/a$a;)V
    .locals 0

    invoke-direct {p0, p1}, Lc/g0/l/a$g;-><init>(Lc/g0/l/a;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lc/g0/l/a$g;->a:Lc/g0/l/a;

    invoke-static {v0}, Lc/g0/l/a;->j(Lc/g0/l/a;)V

    return-void
.end method
