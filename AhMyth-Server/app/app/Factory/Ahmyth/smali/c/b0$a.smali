.class final Lc/b0$a;
.super Lc/b0;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/b0;->y(Lc/u;JLd/e;)Lc/b0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Ld/e;


# direct methods
.method constructor <init>(Lc/u;JLd/e;)V
    .locals 0

    iput-wide p2, p0, Lc/b0$a;->a:J

    iput-object p4, p0, Lc/b0$a;->b:Ld/e;

    invoke-direct {p0}, Lc/b0;-><init>()V

    return-void
.end method


# virtual methods
.method public J()Ld/e;
    .locals 1

    iget-object v0, p0, Lc/b0$a;->b:Ld/e;

    return-object v0
.end method

.method public a()J
    .locals 2

    iget-wide v0, p0, Lc/b0$a;->a:J

    return-wide v0
.end method
