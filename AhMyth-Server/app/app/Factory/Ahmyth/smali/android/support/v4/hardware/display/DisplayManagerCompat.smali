.class public final Landroid/support/v4/hardware/display/DisplayManagerCompat;
.super Ljava/lang/Object;
.source "DisplayManagerCompat.java"


# static fields
.field public static final DISPLAY_CATEGORY_PRESENTATION:Ljava/lang/String; = "android.hardware.display.category.PRESENTATION"

.field private static final sInstances:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/content/Context;",
            "Landroid/support/v4/hardware/display/DisplayManagerCompat;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Landroid/support/v4/hardware/display/DisplayManagerCompat;->sInstances:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Landroid/support/v4/hardware/display/DisplayManagerCompat;->mContext:Landroid/content/Context;

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Landroid/support/v4/hardware/display/DisplayManagerCompat;
    .locals 2

    .line 62
    sget-object v0, Landroid/support/v4/hardware/display/DisplayManagerCompat;->sInstances:Ljava/util/WeakHashMap;

    monitor-enter v0

    .line 63
    :try_start_0
    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/hardware/display/DisplayManagerCompat;

    if-nez v1, :cond_0

    .line 65
    new-instance v1, Landroid/support/v4/hardware/display/DisplayManagerCompat;

    invoke-direct {v1, p0}, Landroid/support/v4/hardware/display/DisplayManagerCompat;-><init>(Landroid/content/Context;)V

    .line 66
    invoke-virtual {v0, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    :cond_0
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p0

    .line 69
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public getDisplay(I)Landroid/view/Display;
    .locals 2

    .line 83
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 84
    iget-object v0, p0, Landroid/support/v4/hardware/display/DisplayManagerCompat;->mContext:Landroid/content/Context;

    const-string v1, "display"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/display/DisplayManager;

    .line 85
    invoke-virtual {v0, p1}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object p1

    return-object p1

    .line 88
    :cond_0
    iget-object v0, p0, Landroid/support/v4/hardware/display/DisplayManagerCompat;->mContext:Landroid/content/Context;

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 89
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 90
    invoke-virtual {v0}, Landroid/view/Display;->getDisplayId()I

    move-result v1

    if-ne v1, p1, :cond_1

    return-object v0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getDisplays()[Landroid/view/Display;
    .locals 3

    .line 103
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 104
    iget-object v0, p0, Landroid/support/v4/hardware/display/DisplayManagerCompat;->mContext:Landroid/content/Context;

    const-string v1, "display"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/display/DisplayManager;

    .line 105
    invoke-virtual {v0}, Landroid/hardware/display/DisplayManager;->getDisplays()[Landroid/view/Display;

    move-result-object v0

    return-object v0

    .line 108
    :cond_0
    iget-object v0, p0, Landroid/support/v4/hardware/display/DisplayManagerCompat;->mContext:Landroid/content/Context;

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 109
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/view/Display;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    return-object v1
.end method

.method public getDisplays(Ljava/lang/String;)[Landroid/view/Display;
    .locals 2

    .line 131
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 132
    iget-object v0, p0, Landroid/support/v4/hardware/display/DisplayManagerCompat;->mContext:Landroid/content/Context;

    const-string v1, "display"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/display/DisplayManager;

    .line 133
    invoke-virtual {v0, p1}, Landroid/hardware/display/DisplayManager;->getDisplays(Ljava/lang/String;)[Landroid/view/Display;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 v0, 0x0

    if-nez p1, :cond_1

    new-array p1, v0, [Landroid/view/Display;

    return-object p1

    .line 139
    :cond_1
    iget-object p1, p0, Landroid/support/v4/hardware/display/DisplayManagerCompat;->mContext:Landroid/content/Context;

    const-string v1, "window"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    .line 140
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/view/Display;

    aput-object p1, v1, v0

    return-object v1
.end method
