.class public Lcom/xbox/sdk/adapter/ActivityCallbackAdapter;
.super Ljava/lang/Object;
.source "ActivityCallbackAdapter.java"

# interfaces
.implements Lcom/xbox/sdk/inter/IActivityCallback;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "paramInt1"    # I
    .param p2, "paramInt2"    # I
    .param p3, "paramIntent"    # Landroid/content/Intent;

    .prologue
    .line 14
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 20
    return-void
.end method

.method public onCreate()V
    .locals 0

    .prologue
    .line 26
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 32
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "paramIntent"    # Landroid/content/Intent;

    .prologue
    .line 38
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 44
    return-void
.end method

.method public onRestart()V
    .locals 0

    .prologue
    .line 50
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 56
    return-void
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 62
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 68
    return-void
.end method
