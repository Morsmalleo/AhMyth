.class public interface abstract Lc/g0/i/m;
.super Ljava/lang/Object;
.source ""


# static fields
.field public static final a:Lc/g0/i/m;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lc/g0/i/m$a;

    invoke-direct {v0}, Lc/g0/i/m$a;-><init>()V

    sput-object v0, Lc/g0/i/m;->a:Lc/g0/i/m;

    return-void
.end method


# virtual methods
.method public abstract a(ILjava/util/List;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lc/g0/i/c;",
            ">;)Z"
        }
    .end annotation
.end method

.method public abstract b(ILjava/util/List;Z)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lc/g0/i/c;",
            ">;Z)Z"
        }
    .end annotation
.end method

.method public abstract c(ILc/g0/i/b;)V
.end method

.method public abstract d(ILd/e;IZ)Z
.end method
