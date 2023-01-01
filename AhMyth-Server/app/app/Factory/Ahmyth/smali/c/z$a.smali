.class final Lc/z$a;
.super Lc/z;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/z;->d(Lc/u;[BII)Lc/z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Lc/u;

.field final synthetic b:I

.field final synthetic c:[B

.field final synthetic d:I


# direct methods
.method constructor <init>(Lc/u;I[BI)V
    .locals 0

    iput p2, p0, Lc/z$a;->b:I

    iput-object p3, p0, Lc/z$a;->c:[B

    iput p4, p0, Lc/z$a;->d:I

    invoke-direct {p0}, Lc/z;-><init>()V

    return-void
.end method


# virtual methods
.method public a()J
    .locals 2

    iget v0, p0, Lc/z$a;->b:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public b()Lc/u;
    .locals 1

    iget-object v0, p0, Lc/z$a;->a:Lc/u;

    return-object v0
.end method

.method public e(Ld/d;)V
    .locals 3

    iget-object v0, p0, Lc/z$a;->c:[B

    iget v1, p0, Lc/z$a;->d:I

    iget v2, p0, Lc/z$a;->b:I

    invoke-interface {p1, v0, v1, v2}, Ld/d;->i([BII)Ld/d;

    return-void
.end method
