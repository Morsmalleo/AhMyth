.class public interface abstract Lc/p;
.super Ljava/lang/Object;
.source ""


# static fields
.field public static final a:Lc/p;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lc/p$a;

    invoke-direct {v0}, Lc/p$a;-><init>()V

    sput-object v0, Lc/p;->a:Lc/p;

    return-void
.end method


# virtual methods
.method public abstract a(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation
.end method
