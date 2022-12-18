.class public final enum Lc/w;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lc/w;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum b:Lc/w;

.field public static final enum c:Lc/w;

.field public static final enum d:Lc/w;

.field public static final enum e:Lc/w;

.field private static final synthetic f:[Lc/w;


# instance fields
.field private final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    new-instance v0, Lc/w;

    const-string v1, "HTTP_1_0"

    const/4 v2, 0x0

    const-string v3, "http/1.0"

    invoke-direct {v0, v1, v2, v3}, Lc/w;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lc/w;->b:Lc/w;

    new-instance v1, Lc/w;

    const-string v3, "HTTP_1_1"

    const/4 v4, 0x1

    const-string v5, "http/1.1"

    invoke-direct {v1, v3, v4, v5}, Lc/w;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lc/w;->c:Lc/w;

    new-instance v3, Lc/w;

    const-string v5, "SPDY_3"

    const/4 v6, 0x2

    const-string v7, "spdy/3.1"

    invoke-direct {v3, v5, v6, v7}, Lc/w;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lc/w;->d:Lc/w;

    new-instance v5, Lc/w;

    const-string v7, "HTTP_2"

    const/4 v8, 0x3

    const-string v9, "h2"

    invoke-direct {v5, v7, v8, v9}, Lc/w;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lc/w;->e:Lc/w;

    const/4 v7, 0x4

    new-array v7, v7, [Lc/w;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lc/w;->f:[Lc/w;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lc/w;->a:Ljava/lang/String;

    return-void
.end method

.method public static a(Ljava/lang/String;)Lc/w;
    .locals 3

    sget-object v0, Lc/w;->b:Lc/w;

    iget-object v1, v0, Lc/w;->a:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lc/w;->c:Lc/w;

    iget-object v1, v0, Lc/w;->a:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    :cond_1
    sget-object v0, Lc/w;->e:Lc/w;

    iget-object v1, v0, Lc/w;->a:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    return-object v0

    :cond_2
    sget-object v0, Lc/w;->d:Lc/w;

    iget-object v1, v0, Lc/w;->a:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    return-object v0

    :cond_3
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected protocol: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static valueOf(Ljava/lang/String;)Lc/w;
    .locals 1

    const-class v0, Lc/w;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc/w;

    return-object p0
.end method

.method public static values()[Lc/w;
    .locals 1

    sget-object v0, Lc/w;->f:[Lc/w;

    invoke-virtual {v0}, [Lc/w;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc/w;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lc/w;->a:Ljava/lang/String;

    return-object v0
.end method
