.class Lcom/xbox/sdk/SplashActivity$1;
.super Ljava/lang/Object;
.source "SplashActivity.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xbox/sdk/SplashActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xbox/sdk/SplashActivity;


# direct methods
.method constructor <init>(Lcom/xbox/sdk/SplashActivity;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/xbox/sdk/SplashActivity$1;->this$0:Lcom/xbox/sdk/SplashActivity;

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 3
    .param p1, "paramAnonymousAnimation"    # Landroid/view/animation/Animation;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/xbox/sdk/SplashActivity$1;->this$0:Lcom/xbox/sdk/SplashActivity;

    # invokes: Lcom/xbox/sdk/SplashActivity;->startGameActivity()V
    invoke-static {v0}, Lcom/xbox/sdk/SplashActivity;->access$0(Lcom/xbox/sdk/SplashActivity;)V

    .line 33
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "paramAnonymousAnimation"    # Landroid/view/animation/Animation;

    .prologue
    .line 37
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "paramAnonymousAnimation"    # Landroid/view/animation/Animation;

    .prologue
    .line 41
    return-void
.end method
