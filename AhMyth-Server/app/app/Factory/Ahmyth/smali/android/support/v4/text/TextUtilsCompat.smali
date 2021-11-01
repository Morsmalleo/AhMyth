.class public final Landroid/support/v4/text/TextUtilsCompat;
.super Ljava/lang/Object;
.source "TextUtilsCompat.java"


# static fields
.field private static final ARAB_SCRIPT_SUBTAG:Ljava/lang/String; = "Arab"

.field private static final HEBR_SCRIPT_SUBTAG:Ljava/lang/String; = "Hebr"

.field private static final ROOT:Ljava/util/Locale;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 33
    new-instance v0, Ljava/util/Locale;

    const-string v1, ""

    invoke-direct {v0, v1, v1}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Landroid/support/v4/text/TextUtilsCompat;->ROOT:Ljava/util/Locale;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getLayoutDirectionFromFirstChar(Ljava/util/Locale;)I
    .locals 3

    .line 119
    invoke-virtual {p0, p0}, Ljava/util/Locale;->getDisplayName(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-static {p0}, Ljava/lang/Character;->getDirectionality(C)B

    move-result p0

    const/4 v1, 0x1

    if-eq p0, v1, :cond_0

    const/4 v2, 0x2

    if-eq p0, v2, :cond_0

    return v0

    :cond_0
    return v1
.end method

.method public static getLayoutDirectionFromLocale(Ljava/util/Locale;)I
    .locals 2

    .line 90
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 91
    invoke-static {p0}, Landroid/text/TextUtils;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result p0

    return p0

    :cond_0
    if-eqz p0, :cond_3

    .line 93
    sget-object v0, Landroid/support/v4/text/TextUtilsCompat;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 94
    invoke-static {p0}, Landroid/support/v4/text/ICUCompat;->maximizeAndGetScript(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 95
    invoke-static {p0}, Landroid/support/v4/text/TextUtilsCompat;->getLayoutDirectionFromFirstChar(Ljava/util/Locale;)I

    move-result p0

    return p0

    :cond_1
    const-string p0, "Arab"

    .line 99
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_2

    const-string p0, "Hebr"

    .line 100
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    :cond_2
    const/4 p0, 0x1

    return p0

    :cond_3
    const/4 p0, 0x0

    return p0
.end method

.method public static htmlEncode(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 45
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 46
    invoke-static {p0}, Landroid/text/TextUtils;->htmlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 48
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 50
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_6

    .line 51
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x22

    if-eq v2, v3, :cond_5

    const/16 v3, 0x3c

    if-eq v2, v3, :cond_4

    const/16 v3, 0x3e

    if-eq v2, v3, :cond_3

    const/16 v3, 0x26

    if-eq v2, v3, :cond_2

    const/16 v3, 0x27

    if-eq v2, v3, :cond_1

    .line 74
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_1
    const-string v2, "&#39;"

    .line 68
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_2
    const-string v2, "&amp;"

    .line 60
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_3
    const-string v2, "&gt;"

    .line 57
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_4
    const-string v2, "&lt;"

    .line 54
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_5
    const-string v2, "&quot;"

    .line 71
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 77
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
