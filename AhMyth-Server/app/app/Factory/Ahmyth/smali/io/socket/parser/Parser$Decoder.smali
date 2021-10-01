.class public interface abstract Lio/socket/parser/Parser$Decoder;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/parser/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Decoder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/parser/Parser$Decoder$Callback;
    }
.end annotation


# virtual methods
.method public abstract add(Ljava/lang/String;)V
.end method

.method public abstract add([B)V
.end method

.method public abstract destroy()V
.end method

.method public abstract onDecoded(Lio/socket/parser/Parser$Decoder$Callback;)V
.end method
