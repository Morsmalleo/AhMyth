.class Lokhttp3/RealCall$1;
.super Lokio/AsyncTimeout;
.source "RealCall.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lokhttp3/RealCall;-><init>(Lokhttp3/OkHttpClient;Lokhttp3/Request;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lokhttp3/RealCall;


# direct methods
.method constructor <init>(Lokhttp3/RealCall;)V
    .locals 0
    .param p1, "this$0"    # Lokhttp3/RealCall;

    .line 64
    iput-object p1, p0, Lokhttp3/RealCall$1;->this$0:Lokhttp3/RealCall;

    invoke-direct {p0}, Lokio/AsyncTimeout;-><init>()V

    return-void
.end method


# virtual methods
.method protected timedOut()V
    .locals 1

    .line 66
    iget-object v0, p0, Lokhttp3/RealCall$1;->this$0:Lokhttp3/RealCall;

    invoke-virtual {v0}, Lokhttp3/RealCall;->cancel()V

    .line 67
    return-void
.end method
