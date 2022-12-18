.class public final Lc/g0/g/h;
.super Lc/b0;
.source ""


# instance fields
.field private final a:Lc/r;

.field private final b:Ld/e;


# direct methods
.method public constructor <init>(Lc/r;Ld/e;)V
    .locals 0

    invoke-direct {p0}, Lc/b0;-><init>()V

    iput-object p1, p0, Lc/g0/g/h;->a:Lc/r;

    iput-object p2, p0, Lc/g0/g/h;->b:Ld/e;

    return-void
.end method


# virtual methods
.method public J()Ld/e;
    .locals 1

    iget-object v0, p0, Lc/g0/g/h;->b:Ld/e;

    return-object v0
.end method

.method public a()J
    .locals 2

    iget-object v0, p0, Lc/g0/g/h;->a:Lc/r;

    invoke-static {v0}, Lc/g0/g/e;->a(Lc/r;)J

    move-result-wide v0

    return-wide v0
.end method
