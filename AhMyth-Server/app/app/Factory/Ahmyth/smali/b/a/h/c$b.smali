.class public Lb/a/h/c$b;
.super Lb/a/c/a;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/a/h/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static c:Ljava/lang/String; = "decoded"


# instance fields
.field b:Lb/a/h/c$a;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lb/a/c/a;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lb/a/h/c$b;->b:Lb/a/h/c$a;

    return-void
.end method

.method private static j(Ljava/lang/String;)Lb/a/h/b;
    .locals 8

    new-instance v0, Lb/a/h/b;

    invoke-direct {v0}, Lb/a/h/b;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v3

    iput v3, v0, Lb/a/h/b;->a:I

    if-ltz v3, :cond_d

    sget-object v4, Lb/a/h/c;->c:[Ljava/lang/String;

    array-length v4, v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    if-le v3, v4, :cond_0

    goto/16 :goto_9

    :cond_0
    const/4 v4, 0x5

    if-eq v4, v3, :cond_2

    const/4 v4, 0x6

    if-ne v4, v3, :cond_1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    goto :goto_2

    :cond_2
    :goto_0
    const-string v3, "-"

    invoke-virtual {p0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_c

    if-gt v1, v5, :cond_3

    goto/16 :goto_8

    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    :goto_1
    add-int/2addr v4, v5

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x2d

    if-eq v6, v7, :cond_4

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_4
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v0, Lb/a/h/b;->e:I

    :goto_2
    add-int/lit8 v3, v4, 0x1

    if-le v1, v3, :cond_7

    const/16 v6, 0x2f

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v6, v3, :cond_7

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    :cond_5
    add-int/2addr v4, v5

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x2c

    if-ne v7, v6, :cond_6

    goto :goto_3

    :cond_6
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v4, 0x1

    if-ne v6, v1, :cond_5

    :goto_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_4

    :cond_7
    const-string v3, "/"

    :goto_4
    iput-object v3, v0, Lb/a/h/b;->c:Ljava/lang/String;

    add-int/lit8 v3, v4, 0x1

    if-le v1, v3, :cond_a

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Character;->charValue()C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v3

    const/4 v6, -0x1

    if-le v3, v6, :cond_a

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    :cond_8
    add-int/2addr v4, v5

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v7

    if-gez v7, :cond_9

    add-int/lit8 v4, v4, -0x1

    goto :goto_5

    :cond_9
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v4, 0x1

    if-ne v6, v1, :cond_8

    :goto_5
    :try_start_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v0, Lb/a/h/b;->b:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_6

    :catch_0
    invoke-static {}, Lb/a/h/c;->b()Lb/a/h/b;

    move-result-object p0

    return-object p0

    :cond_a
    :goto_6
    add-int/2addr v4, v5

    if-le v1, v4, :cond_b

    :try_start_1
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    new-instance v1, Lorg/json/JSONTokener;

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Lb/a/h/b;->d:Ljava/lang/Object;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_7

    :catch_1
    move-exception p0

    invoke-static {}, Lb/a/h/c;->a()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v2, "An error occured while retrieving data from JSONTokener"

    invoke-virtual {v0, v1, v2, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lb/a/h/c;->b()Lb/a/h/b;

    move-result-object p0

    return-object p0

    :cond_b
    :goto_7
    invoke-static {}, Lb/a/h/c;->a()Ljava/util/logging/Logger;

    move-result-object v1

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v2

    aput-object v0, v3, v5

    const-string p0, "decoded %s as %s"

    invoke-static {p0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    return-object v0

    :cond_c
    :goto_8
    invoke-static {}, Lb/a/h/c;->b()Lb/a/h/b;

    move-result-object p0

    return-object p0

    :cond_d
    :goto_9
    invoke-static {}, Lb/a/h/c;->b()Lb/a/h/b;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public h(Ljava/lang/String;)V
    .locals 4

    invoke-static {p1}, Lb/a/h/c$b;->j(Ljava/lang/String;)Lb/a/h/b;

    move-result-object p1

    iget v0, p1, Lb/a/h/b;->a:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x5

    if-eq v3, v0, :cond_1

    const/4 v3, 0x6

    if-ne v3, v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Lb/a/h/c$b;->c:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v1

    invoke-virtual {p0, v0, v2}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    goto :goto_1

    :cond_1
    :goto_0
    new-instance v0, Lb/a/h/c$a;

    invoke-direct {v0, p1}, Lb/a/h/c$a;-><init>(Lb/a/h/b;)V

    iput-object v0, p0, Lb/a/h/c$b;->b:Lb/a/h/c$a;

    iget-object v0, v0, Lb/a/h/c$a;->a:Lb/a/h/b;

    iget v0, v0, Lb/a/h/b;->e:I

    if-nez v0, :cond_2

    sget-object v0, Lb/a/h/c$b;->c:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v1

    invoke-virtual {p0, v0, v2}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    :cond_2
    :goto_1
    return-void
.end method

.method public i([B)V
    .locals 3

    iget-object v0, p0, Lb/a/h/c$b;->b:Lb/a/h/c$a;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lb/a/h/c$a;->b([B)Lb/a/h/b;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lb/a/h/c$b;->b:Lb/a/h/c$a;

    sget-object v0, Lb/a/h/c$b;->c:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {p0, v0, v1}, Lb/a/c/a;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    :cond_0
    return-void

    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "got binary data when not reconstructing a packet"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public k()V
    .locals 1

    iget-object v0, p0, Lb/a/h/c$b;->b:Lb/a/h/c$a;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lb/a/h/c$a;->a()V

    :cond_0
    return-void
.end method
