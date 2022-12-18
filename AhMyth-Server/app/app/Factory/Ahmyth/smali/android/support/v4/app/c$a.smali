.class public Landroid/support/v4/app/c$a;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field final a:Landroid/os/Bundle;

.field private final b:[Landroid/support/v4/app/f;

.field private final c:[Landroid/support/v4/app/f;

.field private d:Z

.field e:Z

.field private final f:I

.field public g:I

.field public h:Ljava/lang/CharSequence;

.field public i:Landroid/app/PendingIntent;


# virtual methods
.method public a()Landroid/app/PendingIntent;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/c$a;->i:Landroid/app/PendingIntent;

    return-object v0
.end method

.method public b()Z
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/app/c$a;->d:Z

    return v0
.end method

.method public c()[Landroid/support/v4/app/f;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/c$a;->c:[Landroid/support/v4/app/f;

    return-object v0
.end method

.method public d()Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/c$a;->a:Landroid/os/Bundle;

    return-object v0
.end method

.method public e()I
    .locals 1

    iget v0, p0, Landroid/support/v4/app/c$a;->g:I

    return v0
.end method

.method public f()[Landroid/support/v4/app/f;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/c$a;->b:[Landroid/support/v4/app/f;

    return-object v0
.end method

.method public g()I
    .locals 1

    iget v0, p0, Landroid/support/v4/app/c$a;->f:I

    return v0
.end method

.method public h()Z
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/app/c$a;->e:Z

    return v0
.end method

.method public i()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/c$a;->h:Ljava/lang/CharSequence;

    return-object v0
.end method
