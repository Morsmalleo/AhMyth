.class public final Landroidx/core/content/res/ColorStateListInflaterCompat;
.super Ljava/lang/Object;
.source "ColorStateListInflaterCompat.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method public static createFromXml(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;
    .locals 4
    .param p0, "r"    # Landroid/content/res/Resources;
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "theme"    # Landroid/content/res/Resources$Theme;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 86
    invoke-static {p1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v0

    .line 89
    .local v0, "attrs":Landroid/util/AttributeSet;
    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    move v2, v1

    .local v2, "type":I
    const/4 v3, 0x2

    if-eq v1, v3, :cond_0

    const/4 v1, 0x1

    if-eq v2, v1, :cond_0

    goto :goto_0

    .line 94
    :cond_0
    if-ne v2, v3, :cond_1

    .line 98
    invoke-static {p0, p1, v0, p2}, Landroidx/core/content/res/ColorStateListInflaterCompat;->createFromXmlInner(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    move-result-object v1

    return-object v1

    .line 95
    :cond_1
    new-instance v1, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v3, "No start tag found"

    invoke-direct {v1, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method public static createFromXmlInner(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;
    .locals 4
    .param p0, "r"    # Landroid/content/res/Resources;
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "theme"    # Landroid/content/res/Resources$Theme;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 114
    .local v0, "name":Ljava/lang/String;
    const-string v1, "selector"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 119
    invoke-static {p0, p1, p2, p3}, Landroidx/core/content/res/ColorStateListInflaterCompat;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    move-result-object v1

    return-object v1

    .line 115
    :cond_0
    new-instance v1, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": invalid color state list tag "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static inflate(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;
    .locals 3
    .param p0, "resources"    # Landroid/content/res/Resources;
    .param p1, "resId"    # I
    .param p2, "theme"    # Landroid/content/res/Resources$Theme;

    .line 65
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v0

    .line 66
    .local v0, "parser":Lorg/xmlpull/v1/XmlPullParser;
    invoke-static {p0, v0, p2}, Landroidx/core/content/res/ColorStateListInflaterCompat;->createFromXml(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 67
    .end local v0    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "CSLCompat"

    const-string v2, "Failed to inflate ColorStateList."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 70
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return-object v0
.end method

.method private static inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;
    .locals 21
    .param p0, "r"    # Landroid/content/res/Resources;
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "theme"    # Landroid/content/res/Resources$Theme;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    move-object/from16 v0, p2

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    .line 132
    .local v1, "innerDepth":I
    const/16 v3, 0x14

    new-array v3, v3, [[I

    .line 133
    .local v3, "stateSpecList":[[I
    array-length v4, v3

    new-array v4, v4, [I

    .line 134
    .local v4, "colorList":[I
    const/4 v5, 0x0

    .line 136
    .local v5, "listSize":I
    :goto_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    move v7, v6

    .local v7, "type":I
    if-eq v6, v2, :cond_9

    .line 137
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v6

    move v9, v6

    .local v9, "depth":I
    if-ge v6, v1, :cond_1

    const/4 v6, 0x3

    if-eq v7, v6, :cond_0

    goto :goto_1

    :cond_0
    move-object/from16 v10, p0

    move-object/from16 v11, p3

    move/from16 v17, v1

    goto/16 :goto_6

    .line 138
    :cond_1
    :goto_1
    const/4 v6, 0x2

    if-ne v7, v6, :cond_8

    if-gt v9, v1, :cond_8

    .line 139
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v10, "item"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 140
    move-object/from16 v10, p0

    move-object/from16 v11, p3

    move/from16 v17, v1

    goto/16 :goto_5

    .line 143
    :cond_2
    sget-object v6, Landroidx/core/R$styleable;->ColorStateListItem:[I

    move-object/from16 v10, p0

    move-object/from16 v11, p3

    invoke-static {v10, v11, v0, v6}, Landroidx/core/content/res/ColorStateListInflaterCompat;->obtainAttributes(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v6

    .line 144
    .local v6, "a":Landroid/content/res/TypedArray;
    sget v12, Landroidx/core/R$styleable;->ColorStateListItem_android_color:I

    const v13, -0xff01

    invoke-virtual {v6, v12, v13}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v12

    .line 147
    .local v12, "baseColor":I
    const/high16 v13, 0x3f800000    # 1.0f

    .line 148
    .local v13, "alphaMod":F
    sget v14, Landroidx/core/R$styleable;->ColorStateListItem_android_alpha:I

    invoke-virtual {v6, v14}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 149
    sget v14, Landroidx/core/R$styleable;->ColorStateListItem_android_alpha:I

    invoke-virtual {v6, v14, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v13

    goto :goto_2

    .line 150
    :cond_3
    sget v14, Landroidx/core/R$styleable;->ColorStateListItem_alpha:I

    invoke-virtual {v6, v14}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 151
    sget v14, Landroidx/core/R$styleable;->ColorStateListItem_alpha:I

    invoke-virtual {v6, v14, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v13

    .line 154
    :cond_4
    :goto_2
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->recycle()V

    .line 157
    const/4 v14, 0x0

    .line 158
    .local v14, "j":I
    invoke-interface/range {p2 .. p2}, Landroid/util/AttributeSet;->getAttributeCount()I

    move-result v15

    .line 159
    .local v15, "numAttrs":I
    new-array v2, v15, [I

    .line 160
    .local v2, "stateSpec":[I
    const/16 v16, 0x0

    move/from16 v8, v16

    .local v8, "i":I
    :goto_3
    if-ge v8, v15, :cond_7

    .line 161
    move/from16 v17, v1

    .end local v1    # "innerDepth":I
    .local v17, "innerDepth":I
    invoke-interface {v0, v8}, Landroid/util/AttributeSet;->getAttributeNameResource(I)I

    move-result v1

    .line 162
    .local v1, "stateResId":I
    move-object/from16 v18, v6

    .end local v6    # "a":Landroid/content/res/TypedArray;
    .local v18, "a":Landroid/content/res/TypedArray;
    const v6, 0x10101a5

    if-eq v1, v6, :cond_6

    const v6, 0x101031f

    if-eq v1, v6, :cond_6

    sget v6, Landroidx/core/R$attr;->alpha:I

    if-eq v1, v6, :cond_6

    .line 165
    add-int/lit8 v6, v14, 0x1

    move/from16 v19, v6

    const/4 v6, 0x0

    .end local v14    # "j":I
    .local v19, "j":I
    invoke-interface {v0, v8, v6}, Landroid/util/AttributeSet;->getAttributeBooleanValue(IZ)Z

    move-result v20

    if-eqz v20, :cond_5

    .line 166
    move v6, v1

    goto :goto_4

    :cond_5
    neg-int v6, v1

    :goto_4
    aput v6, v2, v14

    move/from16 v14, v19

    .line 160
    .end local v1    # "stateResId":I
    .end local v19    # "j":I
    .restart local v14    # "j":I
    :cond_6
    add-int/lit8 v8, v8, 0x1

    move/from16 v1, v17

    move-object/from16 v6, v18

    goto :goto_3

    .end local v17    # "innerDepth":I
    .end local v18    # "a":Landroid/content/res/TypedArray;
    .local v1, "innerDepth":I
    .restart local v6    # "a":Landroid/content/res/TypedArray;
    :cond_7
    move/from16 v17, v1

    move-object/from16 v18, v6

    .line 169
    .end local v1    # "innerDepth":I
    .end local v6    # "a":Landroid/content/res/TypedArray;
    .end local v8    # "i":I
    .restart local v17    # "innerDepth":I
    .restart local v18    # "a":Landroid/content/res/TypedArray;
    invoke-static {v2, v14}, Landroid/util/StateSet;->trimStateSet([II)[I

    move-result-object v1

    .line 174
    .end local v2    # "stateSpec":[I
    .local v1, "stateSpec":[I
    invoke-static {v12, v13}, Landroidx/core/content/res/ColorStateListInflaterCompat;->modulateColorAlpha(IF)I

    move-result v2

    .line 176
    .local v2, "color":I
    invoke-static {v4, v5, v2}, Landroidx/core/content/res/GrowingArrayUtils;->append([III)[I

    move-result-object v4

    .line 177
    invoke-static {v3, v5, v1}, Landroidx/core/content/res/GrowingArrayUtils;->append([Ljava/lang/Object;ILjava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    move-object v3, v6

    check-cast v3, [[I

    .line 178
    nop

    .end local v1    # "stateSpec":[I
    .end local v2    # "color":I
    .end local v12    # "baseColor":I
    .end local v13    # "alphaMod":F
    .end local v14    # "j":I
    .end local v15    # "numAttrs":I
    .end local v18    # "a":Landroid/content/res/TypedArray;
    add-int/lit8 v5, v5, 0x1

    .line 179
    move/from16 v1, v17

    const/4 v2, 0x1

    goto/16 :goto_0

    .line 138
    .end local v17    # "innerDepth":I
    .local v1, "innerDepth":I
    :cond_8
    move-object/from16 v10, p0

    move-object/from16 v11, p3

    move/from16 v17, v1

    .line 136
    .end local v1    # "innerDepth":I
    .end local v7    # "type":I
    .end local v9    # "depth":I
    .restart local v17    # "innerDepth":I
    :goto_5
    move/from16 v1, v17

    const/4 v2, 0x1

    goto/16 :goto_0

    .end local v17    # "innerDepth":I
    .restart local v1    # "innerDepth":I
    .restart local v7    # "type":I
    :cond_9
    move-object/from16 v10, p0

    move-object/from16 v11, p3

    move/from16 v17, v1

    .line 181
    .end local v1    # "innerDepth":I
    .restart local v17    # "innerDepth":I
    :goto_6
    new-array v1, v5, [I

    .line 182
    .local v1, "colors":[I
    new-array v2, v5, [[I

    .line 183
    .local v2, "stateSpecs":[[I
    const/4 v6, 0x0

    invoke-static {v4, v6, v1, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 184
    invoke-static {v3, v6, v2, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 186
    new-instance v6, Landroid/content/res/ColorStateList;

    invoke-direct {v6, v2, v1}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v6
.end method

.method private static modulateColorAlpha(IF)I
    .locals 3
    .param p0, "color"    # I
    .param p1, "alphaMod"    # F

    .line 198
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    int-to-float v0, v0

    mul-float v0, v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 199
    .local v0, "alpha":I
    const v1, 0xffffff

    and-int/2addr v1, p0

    shl-int/lit8 v2, v0, 0x18

    or-int/2addr v1, v2

    return v1
.end method

.method private static obtainAttributes(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;
    .locals 1
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "theme"    # Landroid/content/res/Resources$Theme;
    .param p2, "set"    # Landroid/util/AttributeSet;
    .param p3, "attrs"    # [I

    .line 191
    if-nez p1, :cond_0

    invoke-virtual {p0, p2, p3}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    goto :goto_0

    .line 192
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p1, p2, p3, v0, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 191
    :goto_0
    return-object v0
.end method
