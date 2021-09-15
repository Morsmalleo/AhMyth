.class public interface abstract Landroidx/constraintlayout/core/motion/utils/TypedValues$Trigger;
.super Ljava/lang/Object;
.source "TypedValues.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/core/motion/utils/TypedValues;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Trigger"
.end annotation


# static fields
.field public static final CROSS:Ljava/lang/String; = "CROSS"

.field public static final KEY_WORDS:[Ljava/lang/String;

.field public static final NEGATIVE_CROSS:Ljava/lang/String; = "negativeCross"

.field public static final POSITIVE_CROSS:Ljava/lang/String; = "positiveCross"

.field public static final POST_LAYOUT:Ljava/lang/String; = "postLayout"

.field public static final TRIGGER_COLLISION_ID:Ljava/lang/String; = "triggerCollisionId"

.field public static final TRIGGER_COLLISION_VIEW:Ljava/lang/String; = "triggerCollisionView"

.field public static final TRIGGER_ID:Ljava/lang/String; = "triggerID"

.field public static final TRIGGER_RECEIVER:Ljava/lang/String; = "triggerReceiver"

.field public static final TRIGGER_SLACK:Ljava/lang/String; = "triggerSlack"

.field public static final TYPE_CROSS:I = 0x138

.field public static final TYPE_NEGATIVE_CROSS:I = 0x136

.field public static final TYPE_POSITIVE_CROSS:I = 0x135

.field public static final TYPE_POST_LAYOUT:I = 0x130

.field public static final TYPE_TRIGGER_COLLISION_ID:I = 0x133

.field public static final TYPE_TRIGGER_COLLISION_VIEW:I = 0x132

.field public static final TYPE_TRIGGER_ID:I = 0x134

.field public static final TYPE_TRIGGER_RECEIVER:I = 0x137

.field public static final TYPE_TRIGGER_SLACK:I = 0x131

.field public static final TYPE_VIEW_TRANSITION_ON_CROSS:I = 0x12d

.field public static final TYPE_VIEW_TRANSITION_ON_NEGATIVE_CROSS:I = 0x12f

.field public static final TYPE_VIEW_TRANSITION_ON_POSITIVE_CROSS:I = 0x12e

.field public static final VIEW_TRANSITION_ON_CROSS:Ljava/lang/String; = "viewTransitionOnCross"

.field public static final VIEW_TRANSITION_ON_NEGATIVE_CROSS:Ljava/lang/String; = "viewTransitionOnNegativeCross"

.field public static final VIEW_TRANSITION_ON_POSITIVE_CROSS:Ljava/lang/String; = "viewTransitionOnPositiveCross"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 353
    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "viewTransitionOnCross"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "viewTransitionOnPositiveCross"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "viewTransitionOnNegativeCross"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "postLayout"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "triggerSlack"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "triggerCollisionView"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "triggerCollisionId"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "triggerID"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "positiveCross"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "negativeCross"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "triggerReceiver"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "CROSS"

    aput-object v2, v0, v1

    sput-object v0, Landroidx/constraintlayout/core/motion/utils/TypedValues$Trigger;->KEY_WORDS:[Ljava/lang/String;

    return-void
.end method
