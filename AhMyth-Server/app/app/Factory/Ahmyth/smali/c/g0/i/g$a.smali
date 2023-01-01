.class Lc/g0/i/g$a;
.super Lc/g0/b;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/g0/i/g;->b0(ILc/g0/i/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic b:I

.field final synthetic c:Lc/g0/i/b;

.field final synthetic d:Lc/g0/i/g;


# direct methods
.method varargs constructor <init>(Lc/g0/i/g;Ljava/lang/String;[Ljava/lang/Object;ILc/g0/i/b;)V
    .locals 0

    iput-object p1, p0, Lc/g0/i/g$a;->d:Lc/g0/i/g;

    iput p4, p0, Lc/g0/i/g$a;->b:I

    iput-object p5, p0, Lc/g0/i/g$a;->c:Lc/g0/i/b;

    invoke-direct {p0, p2, p3}, Lc/g0/b;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public k()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lc/g0/i/g$a;->d:Lc/g0/i/g;

    iget v1, p0, Lc/g0/i/g$a;->b:I

    iget-object v2, p0, Lc/g0/i/g$a;->c:Lc/g0/i/b;

    invoke-virtual {v0, v1, v2}, Lc/g0/i/g;->a0(ILc/g0/i/b;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
