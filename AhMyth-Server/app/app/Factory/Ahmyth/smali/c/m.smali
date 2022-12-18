.class public interface abstract Lc/m;
.super Ljava/lang/Object;
.source ""


# static fields
.field public static final a:Lc/m;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lc/m$a;

    invoke-direct {v0}, Lc/m$a;-><init>()V

    sput-object v0, Lc/m;->a:Lc/m;

    return-void
.end method


# virtual methods
.method public abstract a(Lc/s;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lc/s;",
            ")",
            "Ljava/util/List<",
            "Lc/l;",
            ">;"
        }
    .end annotation
.end method

.method public abstract b(Lc/s;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lc/s;",
            "Ljava/util/List<",
            "Lc/l;",
            ">;)V"
        }
    .end annotation
.end method
