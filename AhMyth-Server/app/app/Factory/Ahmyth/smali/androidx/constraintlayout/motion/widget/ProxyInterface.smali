.class interface abstract Landroidx/constraintlayout/motion/widget/ProxyInterface;
.super Ljava/lang/Object;
.source "DesignTool.java"


# virtual methods
.method public abstract designAccess(ILjava/lang/String;Ljava/lang/Object;[FI[FI)I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "cmd",
            "type",
            "viewObject",
            "in",
            "inLength",
            "out",
            "outLength"
        }
    .end annotation
.end method

.method public abstract getKeyFramePosition(Ljava/lang/Object;IFF)F
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "view",
            "type",
            "x",
            "y"
        }
    .end annotation
.end method

.method public abstract getKeyframeAtLocation(Ljava/lang/Object;FF)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "viewObject",
            "x",
            "y"
        }
    .end annotation
.end method

.method public abstract getPositionKeyframe(Ljava/lang/Object;Ljava/lang/Object;FF[Ljava/lang/String;[F)Ljava/lang/Boolean;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "keyFrame",
            "view",
            "x",
            "y",
            "attribute",
            "value"
        }
    .end annotation
.end method

.method public abstract getTransitionTimeMs()J
.end method

.method public abstract setAttributes(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "dpi",
            "constraintSetId",
            "opaqueView",
            "opaqueAttributes"
        }
    .end annotation
.end method

.method public abstract setKeyFrame(Ljava/lang/Object;ILjava/lang/String;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "view",
            "position",
            "name",
            "value"
        }
    .end annotation
.end method

.method public abstract setKeyFramePosition(Ljava/lang/Object;IIFF)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "view",
            "position",
            "type",
            "x",
            "y"
        }
    .end annotation
.end method

.method public abstract setToolPosition(F)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "position"
        }
    .end annotation
.end method
