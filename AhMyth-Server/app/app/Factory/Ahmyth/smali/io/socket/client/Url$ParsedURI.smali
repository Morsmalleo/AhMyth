.class Lio/socket/client/Url$ParsedURI;
.super Ljava/lang/Object;
.source "Url.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/client/Url;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ParsedURI"
.end annotation


# instance fields
.field public final id:Ljava/lang/String;

.field public final uri:Ljava/net/URI;


# direct methods
.method public constructor <init>(Ljava/net/URI;Ljava/lang/String;)V
    .locals 0
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "id"    # Ljava/lang/String;

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lio/socket/client/Url$ParsedURI;->uri:Ljava/net/URI;

    .line 22
    iput-object p2, p0, Lio/socket/client/Url$ParsedURI;->id:Ljava/lang/String;

    .line 23
    return-void
.end method
