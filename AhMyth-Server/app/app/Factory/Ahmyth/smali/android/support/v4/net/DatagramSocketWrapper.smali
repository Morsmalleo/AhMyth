.class Landroid/support/v4/net/DatagramSocketWrapper;
.super Ljava/net/Socket;
.source "DatagramSocketWrapper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/net/DatagramSocketWrapper$DatagramSocketImplWrapper;
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/net/DatagramSocket;Ljava/io/FileDescriptor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 32
    new-instance v0, Landroid/support/v4/net/DatagramSocketWrapper$DatagramSocketImplWrapper;

    invoke-direct {v0, p1, p2}, Landroid/support/v4/net/DatagramSocketWrapper$DatagramSocketImplWrapper;-><init>(Ljava/net/DatagramSocket;Ljava/io/FileDescriptor;)V

    invoke-direct {p0, v0}, Ljava/net/Socket;-><init>(Ljava/net/SocketImpl;)V

    return-void
.end method
