.class Lc/g0/i/g$j$c;
.super Lc/g0/b;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/g0/i/g$j;->l(Lc/g0/i/n;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic b:Lc/g0/i/n;

.field final synthetic c:Lc/g0/i/g$j;


# direct methods
.method varargs constructor <init>(Lc/g0/i/g$j;Ljava/lang/String;[Ljava/lang/Object;Lc/g0/i/n;)V
    .locals 0

    iput-object p1, p0, Lc/g0/i/g$j$c;->c:Lc/g0/i/g$j;

    iput-object p4, p0, Lc/g0/i/g$j$c;->b:Lc/g0/i/n;

    invoke-direct {p0, p2, p3}, Lc/g0/b;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public k()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lc/g0/i/g$j$c;->c:Lc/g0/i/g$j;

    iget-object v0, v0, Lc/g0/i/g$j;->c:Lc/g0/i/g;

    iget-object v0, v0, Lc/g0/i/g;->q:Lc/g0/i/j;

    iget-object v1, p0, Lc/g0/i/g$j$c;->b:Lc/g0/i/n;

    invoke-virtual {v0, v1}, Lc/g0/i/j;->a(Lc/g0/i/n;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
