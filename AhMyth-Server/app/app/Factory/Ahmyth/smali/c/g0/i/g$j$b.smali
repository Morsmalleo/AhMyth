.class Lc/g0/i/g$j$b;
.super Lc/g0/b;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/g0/i/g$j;->j(ZLc/g0/i/n;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic b:Lc/g0/i/g$j;


# direct methods
.method varargs constructor <init>(Lc/g0/i/g$j;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lc/g0/i/g$j$b;->b:Lc/g0/i/g$j;

    invoke-direct {p0, p2, p3}, Lc/g0/b;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public k()V
    .locals 2

    iget-object v0, p0, Lc/g0/i/g$j$b;->b:Lc/g0/i/g$j;

    iget-object v0, v0, Lc/g0/i/g$j;->c:Lc/g0/i/g;

    iget-object v1, v0, Lc/g0/i/g;->b:Lc/g0/i/g$i;

    invoke-virtual {v1, v0}, Lc/g0/i/g$i;->b(Lc/g0/i/g;)V

    return-void
.end method
