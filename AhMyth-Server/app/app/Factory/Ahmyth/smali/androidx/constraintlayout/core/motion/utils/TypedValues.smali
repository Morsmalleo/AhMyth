.class public interface abstract Landroidx/constraintlayout/core/motion/utils/TypedValues;
.super Ljava/lang/Object;
.source "TypedValues.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/core/motion/utils/TypedValues$Custom;,
        Landroidx/constraintlayout/core/motion/utils/TypedValues$Motion;,
        Landroidx/constraintlayout/core/motion/utils/TypedValues$Position;,
        Landroidx/constraintlayout/core/motion/utils/TypedValues$Trigger;,
        Landroidx/constraintlayout/core/motion/utils/TypedValues$Cycle;,
        Landroidx/constraintlayout/core/motion/utils/TypedValues$Attributes;
    }
.end annotation


# static fields
.field public static final BOOLEAN_MASK:I = 0x1

.field public static final FLOAT_MASK:I = 0x4

.field public static final INT_MASK:I = 0x2

.field public static final STRING_MASK:I = 0x8

.field public static final S_CUSTOM:Ljava/lang/String; = "CUSTOM"

.field public static final TYPE_FRAME_POSITION:I = 0x64

.field public static final TYPE_TARGET:I = 0x65


# virtual methods
.method public abstract getId(Ljava/lang/String;)I
.end method

.method public abstract setValue(IF)Z
.end method

.method public abstract setValue(II)Z
.end method

.method public abstract setValue(ILjava/lang/String;)Z
.end method

.method public abstract setValue(IZ)Z
.end method
