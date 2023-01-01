.class public abstract Lc/g0/l/a$h;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/g0/l/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "h"
.end annotation


# instance fields
.field public final a:Z

.field public final b:Ld/e;

.field public final c:Ld/d;


# direct methods
.method public constructor <init>(ZLd/e;Ld/d;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lc/g0/l/a$h;->a:Z

    iput-object p2, p0, Lc/g0/l/a$h;->b:Ld/e;

    iput-object p3, p0, Lc/g0/l/a$h;->c:Ld/d;

    return-void
.end method
