.class public final Lc/g0/f/e;
.super Ljava/lang/RuntimeException;
.source ""


# static fields
.field private static final b:Ljava/lang/reflect/Method;


# instance fields
.field private a:Ljava/io/IOException;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    :try_start_0
    const-class v0, Ljava/lang/Throwable;

    const-string v1, "addSuppressed"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Ljava/lang/Throwable;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    :goto_0
    sput-object v0, Lc/g0/f/e;->b:Ljava/lang/reflect/Method;

    return-void
.end method

.method public constructor <init>(Ljava/io/IOException;)V
    .locals 0

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    iput-object p1, p0, Lc/g0/f/e;->a:Ljava/io/IOException;

    return-void
.end method

.method private b(Ljava/io/IOException;Ljava/io/IOException;)V
    .locals 3

    sget-object v0, Lc/g0/f/e;->b:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Ljava/io/IOException;)V
    .locals 1

    iget-object v0, p0, Lc/g0/f/e;->a:Ljava/io/IOException;

    invoke-direct {p0, p1, v0}, Lc/g0/f/e;->b(Ljava/io/IOException;Ljava/io/IOException;)V

    iput-object p1, p0, Lc/g0/f/e;->a:Ljava/io/IOException;

    return-void
.end method

.method public c()Ljava/io/IOException;
    .locals 1

    iget-object v0, p0, Lc/g0/f/e;->a:Ljava/io/IOException;

    return-object v0
.end method
