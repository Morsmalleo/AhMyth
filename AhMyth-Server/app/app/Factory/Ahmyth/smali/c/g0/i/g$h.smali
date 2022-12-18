.class public Lc/g0/i/g$h;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/g0/i/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "h"
.end annotation


# instance fields
.field a:Ljava/net/Socket;

.field b:Ljava/lang/String;

.field c:Ld/e;

.field d:Ld/d;

.field e:Lc/g0/i/g$i;

.field f:Lc/g0/i/m;

.field g:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lc/g0/i/g$i;->a:Lc/g0/i/g$i;

    iput-object v0, p0, Lc/g0/i/g$h;->e:Lc/g0/i/g$i;

    sget-object v0, Lc/g0/i/m;->a:Lc/g0/i/m;

    iput-object v0, p0, Lc/g0/i/g$h;->f:Lc/g0/i/m;

    iput-boolean p1, p0, Lc/g0/i/g$h;->g:Z

    return-void
.end method


# virtual methods
.method public a()Lc/g0/i/g;
    .locals 1

    new-instance v0, Lc/g0/i/g;

    invoke-direct {v0, p0}, Lc/g0/i/g;-><init>(Lc/g0/i/g$h;)V

    return-object v0
.end method

.method public b(Lc/g0/i/g$i;)Lc/g0/i/g$h;
    .locals 0

    iput-object p1, p0, Lc/g0/i/g$h;->e:Lc/g0/i/g$i;

    return-object p0
.end method

.method public c(Ljava/net/Socket;Ljava/lang/String;Ld/e;Ld/d;)Lc/g0/i/g$h;
    .locals 0

    iput-object p1, p0, Lc/g0/i/g$h;->a:Ljava/net/Socket;

    iput-object p2, p0, Lc/g0/i/g$h;->b:Ljava/lang/String;

    iput-object p3, p0, Lc/g0/i/g$h;->c:Ld/e;

    iput-object p4, p0, Lc/g0/i/g$h;->d:Ld/d;

    return-object p0
.end method
