.class final Lc/g0/l/a$f;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/g0/l/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "f"
.end annotation


# instance fields
.field final a:I

.field final b:Ld/f;


# direct methods
.method constructor <init>(ILd/f;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lc/g0/l/a$f;->a:I

    iput-object p2, p0, Lc/g0/l/a$f;->b:Ld/f;

    return-void
.end method
