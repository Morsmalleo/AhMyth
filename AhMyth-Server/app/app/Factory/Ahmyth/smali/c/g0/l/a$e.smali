.class final Lc/g0/l/a$e;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/g0/l/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "e"
.end annotation


# instance fields
.field final a:I

.field final b:Ld/f;

.field final c:J


# direct methods
.method constructor <init>(ILd/f;J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lc/g0/l/a$e;->a:I

    iput-object p2, p0, Lc/g0/l/a$e;->b:Ld/f;

    iput-wide p3, p0, Lc/g0/l/a$e;->c:J

    return-void
.end method
