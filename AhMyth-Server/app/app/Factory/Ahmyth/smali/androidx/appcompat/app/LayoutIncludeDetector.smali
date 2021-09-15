.class Landroidx/appcompat/app/LayoutIncludeDetector;
.super Ljava/lang/Object;
.source "LayoutIncludeDetector.java"


# instance fields
.field private final mXmlParserStack:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Ljava/lang/ref/WeakReference<",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Landroidx/appcompat/app/LayoutIncludeDetector;->mXmlParserStack:Ljava/util/Deque;

    return-void
.end method

.method private static isParserOutdated(Lorg/xmlpull/v1/XmlPullParser;)Z
    .locals 3
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;

    .line 108
    const/4 v0, 0x1

    if-eqz p0, :cond_1

    :try_start_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_1

    .line 109
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    .line 110
    :catch_0
    move-exception v1

    .line 111
    .local v1, "e":Lorg/xmlpull/v1/XmlPullParserException;
    return v0

    .line 109
    .end local v1    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :cond_1
    :goto_0
    nop

    .line 108
    :goto_1
    return v0
.end method

.method private static popOutdatedAttrHolders(Ljava/util/Deque;)Lorg/xmlpull/v1/XmlPullParser;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Deque<",
            "Ljava/lang/ref/WeakReference<",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ">;>;)",
            "Lorg/xmlpull/v1/XmlPullParser;"
        }
    .end annotation

    .line 95
    .local p0, "xmlParserStack":Ljava/util/Deque;, "Ljava/util/Deque<Ljava/lang/ref/WeakReference<Lorg/xmlpull/v1/XmlPullParser;>;>;"
    :goto_0
    invoke-interface {p0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 96
    invoke-interface {p0}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/xmlpull/v1/XmlPullParser;

    .line 97
    .local v0, "parser":Lorg/xmlpull/v1/XmlPullParser;
    invoke-static {v0}, Landroidx/appcompat/app/LayoutIncludeDetector;->isParserOutdated(Lorg/xmlpull/v1/XmlPullParser;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 98
    invoke-interface {p0}, Ljava/util/Deque;->pop()Ljava/lang/Object;

    .line 102
    .end local v0    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    goto :goto_0

    .line 100
    .restart local v0    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_0
    return-object v0

    .line 103
    .end local v0    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private static shouldInheritContext(Lorg/xmlpull/v1/XmlPullParser;Lorg/xmlpull/v1/XmlPullParser;)Z
    .locals 2
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "previousParser"    # Lorg/xmlpull/v1/XmlPullParser;

    .line 66
    if-eqz p1, :cond_1

    if-eq p0, p1, :cond_1

    .line 75
    :try_start_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 78
    const-string v0, "include"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 81
    :cond_0
    goto :goto_0

    .line 80
    :catch_0
    move-exception v0

    .line 83
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method detect(Landroid/util/AttributeSet;)Z
    .locals 5
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .line 45
    instance-of v0, p1, Lorg/xmlpull/v1/XmlPullParser;

    if-eqz v0, :cond_0

    .line 46
    move-object v0, p1

    check-cast v0, Lorg/xmlpull/v1/XmlPullParser;

    .line 47
    .local v0, "xmlAttrs":Lorg/xmlpull/v1/XmlPullParser;
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 51
    iget-object v1, p0, Landroidx/appcompat/app/LayoutIncludeDetector;->mXmlParserStack:Ljava/util/Deque;

    invoke-static {v1}, Landroidx/appcompat/app/LayoutIncludeDetector;->popOutdatedAttrHolders(Ljava/util/Deque;)Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v1

    .line 53
    .local v1, "ancestorXmlAttrs":Lorg/xmlpull/v1/XmlPullParser;
    iget-object v3, p0, Landroidx/appcompat/app/LayoutIncludeDetector;->mXmlParserStack:Ljava/util/Deque;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v3, v4}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    .line 56
    invoke-static {v0, v1}, Landroidx/appcompat/app/LayoutIncludeDetector;->shouldInheritContext(Lorg/xmlpull/v1/XmlPullParser;Lorg/xmlpull/v1/XmlPullParser;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 57
    return v2

    .line 61
    .end local v0    # "xmlAttrs":Lorg/xmlpull/v1/XmlPullParser;
    .end local v1    # "ancestorXmlAttrs":Lorg/xmlpull/v1/XmlPullParser;
    :cond_0
    const/4 v0, 0x0

    return v0
.end method
