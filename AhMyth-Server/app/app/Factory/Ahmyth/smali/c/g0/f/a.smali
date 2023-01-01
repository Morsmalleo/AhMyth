.class public final Lc/g0/f/a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lc/t;


# instance fields
.field public final a:Lc/v;


# direct methods
.method public constructor <init>(Lc/v;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc/g0/f/a;->a:Lc/v;

    return-void
.end method


# virtual methods
.method public a(Lc/t$a;)Lc/a0;
    .locals 4

    check-cast p1, Lc/g0/g/g;

    invoke-virtual {p1}, Lc/g0/g/g;->a()Lc/y;

    move-result-object v0

    invoke-virtual {p1}, Lc/g0/g/g;->f()Lc/g0/f/g;

    move-result-object v1

    invoke-virtual {v0}, Lc/y;->f()Ljava/lang/String;

    move-result-object v2

    const-string v3, "GET"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    iget-object v3, p0, Lc/g0/f/a;->a:Lc/v;

    invoke-virtual {v1, v3, v2}, Lc/g0/f/g;->i(Lc/v;Z)Lc/g0/g/c;

    move-result-object v2

    invoke-virtual {v1}, Lc/g0/f/g;->d()Lc/g0/f/c;

    move-result-object v3

    invoke-virtual {p1, v0, v1, v2, v3}, Lc/g0/g/g;->d(Lc/y;Lc/g0/f/g;Lc/g0/g/c;Lc/i;)Lc/a0;

    move-result-object p1

    return-object p1
.end method
