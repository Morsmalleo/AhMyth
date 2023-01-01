.class public abstract Lc/b0;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/io/Closeable;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static I(Lc/u;[B)Lc/b0;
    .locals 3

    new-instance v0, Ld/c;

    invoke-direct {v0}, Ld/c;-><init>()V

    invoke-virtual {v0, p1}, Ld/c;->a0([B)Ld/c;

    array-length p1, p1

    int-to-long v1, p1

    invoke-static {p0, v1, v2, v0}, Lc/b0;->y(Lc/u;JLd/e;)Lc/b0;

    move-result-object p0

    return-object p0
.end method

.method public static y(Lc/u;JLd/e;)Lc/b0;
    .locals 1

    if-eqz p3, :cond_0

    new-instance v0, Lc/b0$a;

    invoke-direct {v0, p0, p1, p2, p3}, Lc/b0$a;-><init>(Lc/u;JLd/e;)V

    return-object v0

    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "source == null"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public abstract J()Ld/e;
.end method

.method public abstract a()J
.end method

.method public close()V
    .locals 1

    invoke-virtual {p0}, Lc/b0;->J()Ld/e;

    move-result-object v0

    invoke-static {v0}, Lc/g0/c;->b(Ljava/io/Closeable;)V

    return-void
.end method
