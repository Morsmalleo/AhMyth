.class public Landroid/arch/lifecycle/Lifecycling;
.super Ljava/lang/Object;
.source "Lifecycling.java"


# static fields
.field private static final GENERATED_CALLBACK:I = 0x2

.field private static final REFLECTIVE_CALLBACK:I = 0x1

.field private static sCallbackCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static sClassToAdapters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class;",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Constructor<",
            "+",
            "Landroid/arch/lifecycle/GeneratedAdapter;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/arch/lifecycle/Lifecycling;->sCallbackCache:Ljava/util/Map;

    .line 43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/arch/lifecycle/Lifecycling;->sClassToAdapters:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createGeneratedAdapter(Ljava/lang/reflect/Constructor;Ljava/lang/Object;)Landroid/arch/lifecycle/GeneratedAdapter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Constructor<",
            "+",
            "Landroid/arch/lifecycle/GeneratedAdapter;",
            ">;",
            "Ljava/lang/Object;",
            ")",
            "Landroid/arch/lifecycle/GeneratedAdapter;"
        }
    .end annotation

    const/4 v0, 0x1

    :try_start_0
    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 79
    invoke-virtual {p0, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/arch/lifecycle/GeneratedAdapter;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 85
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p0

    .line 83
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_2
    move-exception p0

    .line 81
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method private static generatedConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Constructor<",
            "+",
            "Landroid/arch/lifecycle/GeneratedAdapter;",
            ">;"
        }
    .end annotation

    .line 92
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    .line 93
    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_0

    .line 94
    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    .line 95
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    goto :goto_1

    .line 96
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 95
    :goto_1
    invoke-static {v1}, Landroid/arch/lifecycle/Lifecycling;->getAdapterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 100
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 99
    :goto_2
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p0

    .line 103
    invoke-virtual {p0}, Ljava/lang/reflect/Constructor;->isAccessible()Z

    move-result v0

    if-nez v0, :cond_3

    .line 104
    invoke-virtual {p0, v3}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    return-object p0

    :catch_0
    move-exception p0

    .line 111
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :catch_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getAdapterName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "."

    const-string v2, "_"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "_LifecycleAdapter"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static getCallback(Ljava/lang/Object;)Landroid/arch/lifecycle/GenericLifecycleObserver;
    .locals 4

    .line 48
    instance-of v0, p0, Landroid/arch/lifecycle/FullLifecycleObserver;

    if-eqz v0, :cond_0

    .line 49
    new-instance v0, Landroid/arch/lifecycle/FullLifecycleObserverAdapter;

    check-cast p0, Landroid/arch/lifecycle/FullLifecycleObserver;

    invoke-direct {v0, p0}, Landroid/arch/lifecycle/FullLifecycleObserverAdapter;-><init>(Landroid/arch/lifecycle/FullLifecycleObserver;)V

    return-object v0

    .line 52
    :cond_0
    instance-of v0, p0, Landroid/arch/lifecycle/GenericLifecycleObserver;

    if-eqz v0, :cond_1

    .line 53
    check-cast p0, Landroid/arch/lifecycle/GenericLifecycleObserver;

    return-object p0

    .line 56
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 57
    invoke-static {v0}, Landroid/arch/lifecycle/Lifecycling;->getObserverConstructorType(Ljava/lang/Class;)I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_4

    .line 59
    sget-object v1, Landroid/arch/lifecycle/Lifecycling;->sClassToAdapters:Ljava/util/Map;

    .line 60
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 61
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_2

    .line 63
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Constructor;

    .line 62
    invoke-static {v0, p0}, Landroid/arch/lifecycle/Lifecycling;->createGeneratedAdapter(Ljava/lang/reflect/Constructor;Ljava/lang/Object;)Landroid/arch/lifecycle/GeneratedAdapter;

    move-result-object p0

    .line 64
    new-instance v0, Landroid/arch/lifecycle/SingleGeneratedAdapterObserver;

    invoke-direct {v0, p0}, Landroid/arch/lifecycle/SingleGeneratedAdapterObserver;-><init>(Landroid/arch/lifecycle/GeneratedAdapter;)V

    return-object v0

    .line 66
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Landroid/arch/lifecycle/GeneratedAdapter;

    .line 67
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 68
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Constructor;

    invoke-static {v3, p0}, Landroid/arch/lifecycle/Lifecycling;->createGeneratedAdapter(Ljava/lang/reflect/Constructor;Ljava/lang/Object;)Landroid/arch/lifecycle/GeneratedAdapter;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 70
    :cond_3
    new-instance p0, Landroid/arch/lifecycle/CompositeGeneratedAdaptersObserver;

    invoke-direct {p0, v1}, Landroid/arch/lifecycle/CompositeGeneratedAdaptersObserver;-><init>([Landroid/arch/lifecycle/GeneratedAdapter;)V

    return-object p0

    .line 72
    :cond_4
    new-instance v0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;

    invoke-direct {v0, p0}, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method private static getObserverConstructorType(Ljava/lang/Class;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)I"
        }
    .end annotation

    .line 116
    sget-object v0, Landroid/arch/lifecycle/Lifecycling;->sCallbackCache:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 117
    sget-object v0, Landroid/arch/lifecycle/Lifecycling;->sCallbackCache:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    .line 119
    :cond_0
    invoke-static {p0}, Landroid/arch/lifecycle/Lifecycling;->resolveObserverCallbackType(Ljava/lang/Class;)I

    move-result v0

    .line 120
    sget-object v1, Landroid/arch/lifecycle/Lifecycling;->sCallbackCache:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v0
.end method

.method private static isLifecycleParent(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    if-eqz p0, :cond_0

    .line 172
    const-class v0, Landroid/arch/lifecycle/LifecycleObserver;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static resolveObserverCallbackType(Ljava/lang/Class;)I
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)I"
        }
    .end annotation

    .line 126
    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    .line 130
    :cond_0
    invoke-static {p0}, Landroid/arch/lifecycle/Lifecycling;->generatedConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    const/4 v2, 0x2

    if-eqz v0, :cond_1

    .line 132
    sget-object v1, Landroid/arch/lifecycle/Lifecycling;->sClassToAdapters:Ljava/util/Map;

    .line 133
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 132
    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v2

    .line 137
    :cond_1
    sget-object v0, Landroid/arch/lifecycle/ClassesInfoCache;->sInstance:Landroid/arch/lifecycle/ClassesInfoCache;

    invoke-virtual {v0, p0}, Landroid/arch/lifecycle/ClassesInfoCache;->hasLifecycleMethods(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    .line 142
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    const/4 v3, 0x0

    .line 144
    invoke-static {v0}, Landroid/arch/lifecycle/Lifecycling;->isLifecycleParent(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 145
    invoke-static {v0}, Landroid/arch/lifecycle/Lifecycling;->getObserverConstructorType(Ljava/lang/Class;)I

    move-result v3

    if-ne v3, v1, :cond_3

    return v1

    .line 148
    :cond_3
    new-instance v3, Ljava/util/ArrayList;

    sget-object v4, Landroid/arch/lifecycle/Lifecycling;->sClassToAdapters:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 151
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v0

    array-length v4, v0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_8

    aget-object v6, v0, v5

    .line 152
    invoke-static {v6}, Landroid/arch/lifecycle/Lifecycling;->isLifecycleParent(Ljava/lang/Class;)Z

    move-result v7

    if-nez v7, :cond_5

    goto :goto_1

    .line 155
    :cond_5
    invoke-static {v6}, Landroid/arch/lifecycle/Lifecycling;->getObserverConstructorType(Ljava/lang/Class;)I

    move-result v7

    if-ne v7, v1, :cond_6

    return v1

    :cond_6
    if-nez v3, :cond_7

    .line 159
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 161
    :cond_7
    sget-object v7, Landroid/arch/lifecycle/Lifecycling;->sClassToAdapters:Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v3, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_8
    if-eqz v3, :cond_9

    .line 164
    sget-object v0, Landroid/arch/lifecycle/Lifecycling;->sClassToAdapters:Ljava/util/Map;

    invoke-interface {v0, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v2

    :cond_9
    return v1
.end method
