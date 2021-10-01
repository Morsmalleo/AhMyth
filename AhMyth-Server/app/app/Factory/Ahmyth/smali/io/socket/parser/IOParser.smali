.class public final Lio/socket/parser/IOParser;
.super Ljava/lang/Object;
.source "IOParser.java"

# interfaces
.implements Lio/socket/parser/Parser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/parser/IOParser$BinaryReconstructor;,
        Lio/socket/parser/IOParser$Decoder;,
        Lio/socket/parser/IOParser$Encoder;
    }
.end annotation


# static fields
.field private static final logger:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    const-class v0, Lio/socket/parser/IOParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/parser/IOParser;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/logging/Logger;
    .locals 1

    .line 15
    sget-object v0, Lio/socket/parser/IOParser;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method
