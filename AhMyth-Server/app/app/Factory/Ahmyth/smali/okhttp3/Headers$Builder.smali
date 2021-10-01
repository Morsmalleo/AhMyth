.class public final Lokhttp3/Headers$Builder;
.super Ljava/lang/Object;
.source "Headers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/Headers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field final namesAndValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 278
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 279
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lokhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;)Lokhttp3/Headers$Builder;
    .locals 4
    .param p1, "line"    # Ljava/lang/String;

    .line 300
    const-string v0, ":"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 301
    .local v0, "index":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 304
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lokhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    move-result-object v1

    return-object v1

    .line 302
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected header: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 311
    invoke-static {p1}, Lokhttp3/Headers;->checkName(Ljava/lang/String;)V

    .line 312
    invoke-static {p2, p1}, Lokhttp3/Headers;->checkValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    invoke-virtual {p0, p1, p2}, Lokhttp3/Headers$Builder;->addLenient(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    move-result-object v0

    return-object v0
.end method

.method public add(Ljava/lang/String;Ljava/util/Date;)Lokhttp3/Headers$Builder;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/util/Date;

    .line 342
    if-eqz p2, :cond_0

    .line 343
    invoke-static {p2}, Lokhttp3/internal/http/HttpDate;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lokhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    .line 344
    return-object p0

    .line 342
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "value for name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " == null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addAll(Lokhttp3/Headers;)Lokhttp3/Headers$Builder;
    .locals 4
    .param p1, "headers"    # Lokhttp3/Headers;

    .line 329
    invoke-virtual {p1}, Lokhttp3/Headers;->size()I

    move-result v0

    .line 330
    .local v0, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 331
    invoke-virtual {p1, v1}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lokhttp3/Headers$Builder;->addLenient(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    .line 330
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 334
    .end local v1    # "i":I
    :cond_0
    return-object p0
.end method

.method addLenient(Ljava/lang/String;)Lokhttp3/Headers$Builder;
    .locals 4
    .param p1, "line"    # Ljava/lang/String;

    .line 286
    const-string v0, ":"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 287
    .local v2, "index":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 288
    const/4 v0, 0x0

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v1, v2, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lokhttp3/Headers$Builder;->addLenient(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    move-result-object v0

    return-object v0

    .line 289
    :cond_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const-string v3, ""

    if-eqz v0, :cond_1

    .line 292
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v3, v0}, Lokhttp3/Headers$Builder;->addLenient(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    move-result-object v0

    return-object v0

    .line 294
    :cond_1
    invoke-virtual {p0, v3, p1}, Lokhttp3/Headers$Builder;->addLenient(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    move-result-object v0

    return-object v0
.end method

.method addLenient(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 362
    iget-object v0, p0, Lokhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 363
    iget-object v0, p0, Lokhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 364
    return-object p0
.end method

.method public addUnsafeNonAscii(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 321
    invoke-static {p1}, Lokhttp3/Headers;->checkName(Ljava/lang/String;)V

    .line 322
    invoke-virtual {p0, p1, p2}, Lokhttp3/Headers$Builder;->addLenient(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    move-result-object v0

    return-object v0
.end method

.method public build()Lokhttp3/Headers;
    .locals 1

    .line 401
    new-instance v0, Lokhttp3/Headers;

    invoke-direct {v0, p0}, Lokhttp3/Headers;-><init>(Lokhttp3/Headers$Builder;)V

    return-object v0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .line 392
    iget-object v0, p0, Lokhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 393
    iget-object v1, p0, Lokhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 394
    iget-object v1, p0, Lokhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    add-int/lit8 v2, v0, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    return-object v1

    .line 392
    :cond_0
    add-int/lit8 v0, v0, -0x2

    goto :goto_0

    .line 397
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public removeAll(Ljava/lang/String;)Lokhttp3/Headers$Builder;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 368
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lokhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 369
    iget-object v1, p0, Lokhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 370
    iget-object v1, p0, Lokhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 371
    iget-object v1, p0, Lokhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 372
    add-int/lit8 v0, v0, -0x2

    .line 368
    :cond_0
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 375
    .end local v0    # "i":I
    :cond_1
    return-object p0
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 383
    invoke-static {p1}, Lokhttp3/Headers;->checkName(Ljava/lang/String;)V

    .line 384
    invoke-static {p2, p1}, Lokhttp3/Headers;->checkValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    invoke-virtual {p0, p1}, Lokhttp3/Headers$Builder;->removeAll(Ljava/lang/String;)Lokhttp3/Headers$Builder;

    .line 386
    invoke-virtual {p0, p1, p2}, Lokhttp3/Headers$Builder;->addLenient(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    .line 387
    return-object p0
.end method

.method public set(Ljava/lang/String;Ljava/util/Date;)Lokhttp3/Headers$Builder;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/util/Date;

    .line 352
    if-eqz p2, :cond_0

    .line 353
    invoke-static {p2}, Lokhttp3/internal/http/HttpDate;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lokhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    .line 354
    return-object p0

    .line 352
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "value for name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " == null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
