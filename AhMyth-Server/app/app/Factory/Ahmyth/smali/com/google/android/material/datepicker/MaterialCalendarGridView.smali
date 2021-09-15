.class final Lcom/google/android/material/datepicker/MaterialCalendarGridView;
.super Landroid/widget/GridView;
.source "MaterialCalendarGridView.java"


# instance fields
.field private final dayCompute:Ljava/util/Calendar;

.field private final nestedScrollable:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 46
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 54
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/GridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    invoke-static {}, Lcom/google/android/material/datepicker/UtcDates;->getUtcCalendar()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->dayCompute:Ljava/util/Calendar;

    .line 55
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/material/datepicker/MaterialDatePicker;->isFullscreen(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    sget v0, Lcom/google/android/material/R$id;->cancel_button:I

    invoke-virtual {p0, v0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->setNextFocusLeftId(I)V

    .line 57
    sget v0, Lcom/google/android/material/R$id;->confirm_button:I

    invoke-virtual {p0, v0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->setNextFocusRightId(I)V

    .line 59
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/material/datepicker/MaterialDatePicker;->isNestedScrollable(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->nestedScrollable:Z

    .line 60
    new-instance v0, Lcom/google/android/material/datepicker/MaterialCalendarGridView$1;

    invoke-direct {v0, p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView$1;-><init>(Lcom/google/android/material/datepicker/MaterialCalendarGridView;)V

    invoke-static {p0, v0}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    .line 71
    return-void
.end method

.method private gainFocus(ILandroid/graphics/Rect;)V
    .locals 1
    .param p1, "direction"    # I
    .param p2, "previouslyFocusedRect"    # Landroid/graphics/Rect;

    .line 221
    const/16 v0, 0x21

    if-ne p1, v0, :cond_0

    .line 222
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lcom/google/android/material/datepicker/MonthAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/MonthAdapter;->lastPositionInMonth()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->setSelection(I)V

    goto :goto_0

    .line 223
    :cond_0
    const/16 v0, 0x82

    if-ne p1, v0, :cond_1

    .line 224
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lcom/google/android/material/datepicker/MonthAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/MonthAdapter;->firstPositionInMonth()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->setSelection(I)V

    goto :goto_0

    .line 226
    :cond_1
    const/4 v0, 0x1

    invoke-super {p0, v0, p1, p2}, Landroid/widget/GridView;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 228
    :goto_0
    return-void
.end method

.method private static horizontalMidPoint(Landroid/view/View;)I
    .locals 2
    .param p0, "view"    # Landroid/view/View;

    .line 242
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    return v0
.end method

.method private static skipMonth(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)Z
    .locals 6
    .param p0, "firstOfMonth"    # Ljava/lang/Long;
    .param p1, "lastOfMonth"    # Ljava/lang/Long;
    .param p2, "startDay"    # Ljava/lang/Long;
    .param p3, "endDay"    # Ljava/lang/Long;

    .line 235
    const/4 v0, 0x1

    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    if-eqz p2, :cond_3

    if-nez p3, :cond_0

    goto :goto_1

    .line 238
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long v5, v1, v3

    if-gtz v5, :cond_2

    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long v5, v1, v3

    if-gez v5, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :cond_2
    :goto_0
    return v0

    .line 236
    :cond_3
    :goto_1
    return v0
.end method


# virtual methods
.method public bridge synthetic getAdapter()Landroid/widget/Adapter;
    .locals 1

    .line 40
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lcom/google/android/material/datepicker/MonthAdapter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getAdapter()Landroid/widget/ListAdapter;
    .locals 1

    .line 40
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lcom/google/android/material/datepicker/MonthAdapter;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Lcom/google/android/material/datepicker/MonthAdapter;
    .locals 1

    .line 108
    invoke-super {p0}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/datepicker/MonthAdapter;

    return-object v0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 75
    invoke-super {p0}, Landroid/widget/GridView;->onAttachedToWindow()V

    .line 76
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lcom/google/android/material/datepicker/MonthAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/MonthAdapter;->notifyDataSetChanged()V

    .line 77
    return-void
.end method

.method protected final onDraw(Landroid/graphics/Canvas;)V
    .locals 38
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 125
    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Landroid/widget/GridView;->onDraw(Landroid/graphics/Canvas;)V

    .line 126
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lcom/google/android/material/datepicker/MonthAdapter;

    move-result-object v1

    .line 127
    .local v1, "monthAdapter":Lcom/google/android/material/datepicker/MonthAdapter;
    iget-object v2, v1, Lcom/google/android/material/datepicker/MonthAdapter;->dateSelector:Lcom/google/android/material/datepicker/DateSelector;

    .line 128
    .local v2, "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    iget-object v3, v1, Lcom/google/android/material/datepicker/MonthAdapter;->calendarStyle:Lcom/google/android/material/datepicker/CalendarStyle;

    .line 129
    .local v3, "calendarStyle":Lcom/google/android/material/datepicker/CalendarStyle;
    invoke-virtual {v1}, Lcom/google/android/material/datepicker/MonthAdapter;->firstPositionInMonth()I

    move-result v4

    invoke-virtual {v1, v4}, Lcom/google/android/material/datepicker/MonthAdapter;->getItem(I)Ljava/lang/Long;

    move-result-object v4

    .line 130
    .local v4, "firstOfMonth":Ljava/lang/Long;
    invoke-virtual {v1}, Lcom/google/android/material/datepicker/MonthAdapter;->lastPositionInMonth()I

    move-result v5

    invoke-virtual {v1, v5}, Lcom/google/android/material/datepicker/MonthAdapter;->getItem(I)Ljava/lang/Long;

    move-result-object v5

    .line 132
    .local v5, "lastOfMonth":Ljava/lang/Long;
    invoke-interface {v2}, Lcom/google/android/material/datepicker/DateSelector;->getSelectedRanges()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_f

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/core/util/Pair;

    .line 133
    .local v7, "range":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    iget-object v8, v7, Landroidx/core/util/Pair;->first:Ljava/lang/Object;

    if-eqz v8, :cond_e

    iget-object v8, v7, Landroidx/core/util/Pair;->second:Ljava/lang/Object;

    if-nez v8, :cond_0

    .line 134
    goto :goto_0

    .line 136
    :cond_0
    iget-object v8, v7, Landroidx/core/util/Pair;->first:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 137
    .local v8, "startItem":J
    iget-object v10, v7, Landroidx/core/util/Pair;->second:Ljava/lang/Object;

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    .line 139
    .local v10, "endItem":J
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-static {v4, v5, v12, v13}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->skipMonth(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 140
    goto :goto_0

    .line 142
    :cond_1
    invoke-static/range {p0 .. p0}, Lcom/google/android/material/internal/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result v12

    .line 145
    .local v12, "isRtl":Z
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    const/4 v15, 0x5

    const/16 v16, 0x0

    cmp-long v17, v8, v13

    if-gez v17, :cond_4

    .line 146
    invoke-virtual {v1}, Lcom/google/android/material/datepicker/MonthAdapter;->firstPositionInMonth()I

    move-result v13

    .line 147
    .local v13, "firstHighlightPosition":I
    nop

    .line 148
    invoke-virtual {v1, v13}, Lcom/google/android/material/datepicker/MonthAdapter;->isFirstInRow(I)Z

    move-result v14

    if-eqz v14, :cond_2

    const/4 v14, 0x0

    goto :goto_1

    :cond_2
    if-nez v12, :cond_3

    add-int/lit8 v14, v13, -0x1

    .line 151
    invoke-virtual {v0, v14}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    invoke-virtual {v14}, Landroid/view/View;->getRight()I

    move-result v14

    goto :goto_1

    :cond_3
    add-int/lit8 v14, v13, -0x1

    .line 152
    invoke-virtual {v0, v14}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    invoke-virtual {v14}, Landroid/view/View;->getLeft()I

    move-result v14

    :goto_1
    nop

    .local v14, "rangeHighlightStart":I
    goto :goto_2

    .line 154
    .end local v13    # "firstHighlightPosition":I
    .end local v14    # "rangeHighlightStart":I
    :cond_4
    iget-object v13, v0, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->dayCompute:Ljava/util/Calendar;

    invoke-virtual {v13, v8, v9}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 155
    iget-object v13, v0, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->dayCompute:Ljava/util/Calendar;

    invoke-virtual {v13, v15}, Ljava/util/Calendar;->get(I)I

    move-result v13

    invoke-virtual {v1, v13}, Lcom/google/android/material/datepicker/MonthAdapter;->dayToPosition(I)I

    move-result v13

    .line 156
    .restart local v13    # "firstHighlightPosition":I
    invoke-virtual {v0, v13}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    invoke-static {v14}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->horizontalMidPoint(Landroid/view/View;)I

    move-result v14

    .line 161
    .restart local v14    # "rangeHighlightStart":I
    :goto_2
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v17

    cmp-long v19, v10, v17

    if-lez v19, :cond_7

    .line 162
    invoke-virtual {v1}, Lcom/google/android/material/datepicker/MonthAdapter;->lastPositionInMonth()I

    move-result v15

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getChildCount()I

    move-result v17

    move-object/from16 v18, v2

    .end local v2    # "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    .local v18, "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    add-int/lit8 v2, v17, -0x1

    invoke-static {v15, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 163
    .local v2, "lastHighlightPosition":I
    nop

    .line 164
    invoke-virtual {v1, v2}, Lcom/google/android/material/datepicker/MonthAdapter;->isLastInRow(I)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 165
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getWidth()I

    move-result v15

    goto :goto_3

    :cond_5
    if-nez v12, :cond_6

    .line 167
    invoke-virtual {v0, v2}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v15

    invoke-virtual {v15}, Landroid/view/View;->getRight()I

    move-result v15

    goto :goto_3

    .line 168
    :cond_6
    invoke-virtual {v0, v2}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v15

    invoke-virtual {v15}, Landroid/view/View;->getLeft()I

    move-result v15

    :goto_3
    nop

    .local v15, "rangeHighlightEnd":I
    goto :goto_4

    .line 170
    .end local v15    # "rangeHighlightEnd":I
    .end local v18    # "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    .local v2, "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    :cond_7
    move-object/from16 v18, v2

    .end local v2    # "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    .restart local v18    # "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    iget-object v2, v0, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->dayCompute:Ljava/util/Calendar;

    invoke-virtual {v2, v10, v11}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 171
    iget-object v2, v0, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->dayCompute:Ljava/util/Calendar;

    invoke-virtual {v2, v15}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/google/android/material/datepicker/MonthAdapter;->dayToPosition(I)I

    move-result v2

    .line 172
    .local v2, "lastHighlightPosition":I
    invoke-virtual {v0, v2}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v15

    invoke-static {v15}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->horizontalMidPoint(Landroid/view/View;)I

    move-result v15

    .line 175
    .restart local v15    # "rangeHighlightEnd":I
    :goto_4
    move-object/from16 v17, v4

    move-object/from16 v19, v5

    .end local v4    # "firstOfMonth":Ljava/lang/Long;
    .end local v5    # "lastOfMonth":Ljava/lang/Long;
    .local v17, "firstOfMonth":Ljava/lang/Long;
    .local v19, "lastOfMonth":Ljava/lang/Long;
    invoke-virtual {v1, v13}, Lcom/google/android/material/datepicker/MonthAdapter;->getItemId(I)J

    move-result-wide v4

    long-to-int v5, v4

    .line 176
    .local v5, "firstRow":I
    move-object v4, v6

    move-object/from16 v20, v7

    .end local v7    # "range":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    .local v20, "range":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    invoke-virtual {v1, v2}, Lcom/google/android/material/datepicker/MonthAdapter;->getItemId(I)J

    move-result-wide v6

    long-to-int v7, v6

    .line 177
    .local v7, "lastRow":I
    move v6, v5

    .local v6, "row":I
    :goto_5
    if-gt v6, v7, :cond_d

    .line 178
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getNumColumns()I

    move-result v21

    move-object/from16 v22, v1

    .end local v1    # "monthAdapter":Lcom/google/android/material/datepicker/MonthAdapter;
    .local v22, "monthAdapter":Lcom/google/android/material/datepicker/MonthAdapter;
    mul-int v1, v6, v21

    .line 179
    .local v1, "firstPositionInRow":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getNumColumns()I

    move-result v21

    add-int v21, v1, v21

    move-object/from16 v23, v4

    add-int/lit8 v4, v21, -0x1

    .line 180
    .local v4, "lastPositionInRow":I
    invoke-virtual {v0, v1}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v21

    .line 181
    .local v21, "firstView":Landroid/view/View;
    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->getTop()I

    move-result v24

    iget-object v0, v3, Lcom/google/android/material/datepicker/CalendarStyle;->day:Lcom/google/android/material/datepicker/CalendarItemStyle;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/CalendarItemStyle;->getTopInset()I

    move-result v0

    add-int v0, v24, v0

    .line 182
    .local v0, "top":I
    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->getBottom()I

    move-result v24

    move/from16 v25, v5

    .end local v5    # "firstRow":I
    .local v25, "firstRow":I
    iget-object v5, v3, Lcom/google/android/material/datepicker/CalendarStyle;->day:Lcom/google/android/material/datepicker/CalendarItemStyle;

    invoke-virtual {v5}, Lcom/google/android/material/datepicker/CalendarItemStyle;->getBottomInset()I

    move-result v5

    sub-int v5, v24, v5

    .line 185
    .local v5, "bottom":I
    if-nez v12, :cond_a

    .line 186
    if-le v1, v13, :cond_8

    const/16 v24, 0x0

    goto :goto_6

    :cond_8
    move/from16 v24, v14

    .line 187
    .local v24, "left":I
    :goto_6
    if-le v2, v4, :cond_9

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getWidth()I

    move-result v26

    goto :goto_7

    :cond_9
    move/from16 v26, v15

    :goto_7
    move/from16 v27, v1

    move/from16 v1, v24

    move/from16 v24, v2

    move/from16 v2, v26

    .local v26, "right":I
    goto :goto_a

    .line 189
    .end local v24    # "left":I
    .end local v26    # "right":I
    :cond_a
    if-le v2, v4, :cond_b

    const/16 v24, 0x0

    goto :goto_8

    :cond_b
    move/from16 v24, v15

    .line 190
    .restart local v24    # "left":I
    :goto_8
    if-le v1, v13, :cond_c

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getWidth()I

    move-result v26

    goto :goto_9

    :cond_c
    move/from16 v26, v14

    :goto_9
    move/from16 v27, v1

    move/from16 v1, v24

    move/from16 v24, v2

    move/from16 v2, v26

    .line 192
    .local v1, "left":I
    .local v2, "right":I
    .local v24, "lastHighlightPosition":I
    .local v27, "firstPositionInRow":I
    :goto_a
    move/from16 v26, v4

    .end local v4    # "lastPositionInRow":I
    .local v26, "lastPositionInRow":I
    int-to-float v4, v1

    move/from16 v34, v1

    .end local v1    # "left":I
    .local v34, "left":I
    int-to-float v1, v0

    move/from16 v35, v0

    .end local v0    # "top":I
    .local v35, "top":I
    int-to-float v0, v2

    move/from16 v36, v2

    .end local v2    # "right":I
    .local v36, "right":I
    int-to-float v2, v5

    move/from16 v37, v5

    .end local v5    # "bottom":I
    .local v37, "bottom":I
    iget-object v5, v3, Lcom/google/android/material/datepicker/CalendarStyle;->rangeFill:Landroid/graphics/Paint;

    move-object/from16 v28, p1

    move/from16 v29, v4

    move/from16 v30, v1

    move/from16 v31, v0

    move/from16 v32, v2

    move-object/from16 v33, v5

    invoke-virtual/range {v28 .. v33}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 177
    .end local v21    # "firstView":Landroid/view/View;
    .end local v26    # "lastPositionInRow":I
    .end local v27    # "firstPositionInRow":I
    .end local v34    # "left":I
    .end local v35    # "top":I
    .end local v36    # "right":I
    .end local v37    # "bottom":I
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v4, v23

    move/from16 v2, v24

    move/from16 v5, v25

    goto/16 :goto_5

    .end local v22    # "monthAdapter":Lcom/google/android/material/datepicker/MonthAdapter;
    .end local v24    # "lastHighlightPosition":I
    .end local v25    # "firstRow":I
    .local v1, "monthAdapter":Lcom/google/android/material/datepicker/MonthAdapter;
    .local v2, "lastHighlightPosition":I
    .local v5, "firstRow":I
    :cond_d
    move-object/from16 v22, v1

    move/from16 v24, v2

    move-object/from16 v23, v4

    move/from16 v25, v5

    .line 194
    .end local v1    # "monthAdapter":Lcom/google/android/material/datepicker/MonthAdapter;
    .end local v2    # "lastHighlightPosition":I
    .end local v5    # "firstRow":I
    .end local v6    # "row":I
    .end local v7    # "lastRow":I
    .end local v8    # "startItem":J
    .end local v10    # "endItem":J
    .end local v12    # "isRtl":Z
    .end local v13    # "firstHighlightPosition":I
    .end local v14    # "rangeHighlightStart":I
    .end local v15    # "rangeHighlightEnd":I
    .end local v20    # "range":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    .restart local v22    # "monthAdapter":Lcom/google/android/material/datepicker/MonthAdapter;
    move-object/from16 v0, p0

    move-object/from16 v4, v17

    move-object/from16 v2, v18

    move-object/from16 v5, v19

    move-object/from16 v6, v23

    goto/16 :goto_0

    .line 133
    .end local v17    # "firstOfMonth":Ljava/lang/Long;
    .end local v18    # "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    .end local v19    # "lastOfMonth":Ljava/lang/Long;
    .end local v22    # "monthAdapter":Lcom/google/android/material/datepicker/MonthAdapter;
    .restart local v1    # "monthAdapter":Lcom/google/android/material/datepicker/MonthAdapter;
    .local v2, "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    .local v4, "firstOfMonth":Ljava/lang/Long;
    .local v5, "lastOfMonth":Ljava/lang/Long;
    .local v7, "range":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    :cond_e
    move-object/from16 v22, v1

    move-object/from16 v18, v2

    move-object/from16 v17, v4

    move-object/from16 v19, v5

    move-object/from16 v23, v6

    move-object/from16 v20, v7

    .end local v1    # "monthAdapter":Lcom/google/android/material/datepicker/MonthAdapter;
    .end local v2    # "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    .end local v4    # "firstOfMonth":Ljava/lang/Long;
    .end local v5    # "lastOfMonth":Ljava/lang/Long;
    .end local v7    # "range":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    .restart local v17    # "firstOfMonth":Ljava/lang/Long;
    .restart local v18    # "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    .restart local v19    # "lastOfMonth":Ljava/lang/Long;
    .restart local v20    # "range":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    .restart local v22    # "monthAdapter":Lcom/google/android/material/datepicker/MonthAdapter;
    move-object/from16 v0, p0

    goto/16 :goto_0

    .line 195
    .end local v17    # "firstOfMonth":Ljava/lang/Long;
    .end local v18    # "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    .end local v19    # "lastOfMonth":Ljava/lang/Long;
    .end local v20    # "range":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    .end local v22    # "monthAdapter":Lcom/google/android/material/datepicker/MonthAdapter;
    .restart local v1    # "monthAdapter":Lcom/google/android/material/datepicker/MonthAdapter;
    .restart local v2    # "dateSelector":Lcom/google/android/material/datepicker/DateSelector;, "Lcom/google/android/material/datepicker/DateSelector<*>;"
    .restart local v4    # "firstOfMonth":Ljava/lang/Long;
    .restart local v5    # "lastOfMonth":Ljava/lang/Long;
    :cond_f
    return-void
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 1
    .param p1, "gainFocus"    # Z
    .param p2, "direction"    # I
    .param p3, "previouslyFocusedRect"    # Landroid/graphics/Rect;

    .line 213
    if-eqz p1, :cond_0

    .line 214
    invoke-direct {p0, p2, p3}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->gainFocus(ILandroid/graphics/Rect;)V

    goto :goto_0

    .line 216
    :cond_0
    const/4 v0, 0x0

    invoke-super {p0, v0, p2, p3}, Landroid/widget/GridView;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 218
    :goto_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .line 90
    invoke-super {p0, p1, p2}, Landroid/widget/GridView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 91
    .local v0, "result":Z
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 92
    return v1

    .line 94
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getSelectedItemPosition()I

    move-result v2

    const/4 v3, -0x1

    const/4 v4, 0x1

    if-eq v2, v3, :cond_3

    .line 95
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getSelectedItemPosition()I

    move-result v2

    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lcom/google/android/material/datepicker/MonthAdapter;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/material/datepicker/MonthAdapter;->firstPositionInMonth()I

    move-result v3

    if-lt v2, v3, :cond_1

    goto :goto_0

    .line 98
    :cond_1
    const/16 v2, 0x13

    if-ne v2, p1, :cond_2

    .line 99
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lcom/google/android/material/datepicker/MonthAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/material/datepicker/MonthAdapter;->firstPositionInMonth()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->setSelection(I)V

    .line 100
    return v4

    .line 102
    :cond_2
    return v1

    .line 96
    :cond_3
    :goto_0
    return v4
.end method

.method public onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 199
    iget-boolean v0, p0, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->nestedScrollable:Z

    if-eqz v0, :cond_0

    .line 202
    const v0, 0xffffff

    const/high16 v1, -0x80000000

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 203
    .local v0, "expandSpec":I
    invoke-super {p0, p1, v0}, Landroid/widget/GridView;->onMeasure(II)V

    .line 204
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 205
    .local v1, "params":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getMeasuredHeight()I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 206
    .end local v0    # "expandSpec":I
    .end local v1    # "params":Landroid/view/ViewGroup$LayoutParams;
    goto :goto_0

    .line 207
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/GridView;->onMeasure(II)V

    .line 209
    :goto_0
    return-void
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0

    .line 40
    check-cast p1, Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public final setAdapter(Landroid/widget/ListAdapter;)V
    .locals 4
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .line 113
    instance-of v0, p1, Lcom/google/android/material/datepicker/MonthAdapter;

    if-eqz v0, :cond_0

    .line 120
    invoke-super {p0, p1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 121
    return-void

    .line 114
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-class v3, Lcom/google/android/material/datepicker/MaterialCalendarGridView;

    .line 117
    invoke-virtual {v3}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-class v3, Lcom/google/android/material/datepicker/MonthAdapter;

    .line 118
    invoke-virtual {v3}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 115
    const-string v2, "%1$s must have its Adapter set to a %2$s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSelection(I)V
    .locals 1
    .param p1, "position"    # I

    .line 81
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lcom/google/android/material/datepicker/MonthAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/MonthAdapter;->firstPositionInMonth()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 82
    invoke-virtual {p0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lcom/google/android/material/datepicker/MonthAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/MonthAdapter;->firstPositionInMonth()I

    move-result v0

    invoke-super {p0, v0}, Landroid/widget/GridView;->setSelection(I)V

    goto :goto_0

    .line 84
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/GridView;->setSelection(I)V

    .line 86
    :goto_0
    return-void
.end method
