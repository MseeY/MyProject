.class public Lcom/xbox/sdk/SplashActivity;
.super Landroid/app/Activity;
.source "SplashActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/xbox/sdk/SplashActivity;)V
    .registers 1

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/xbox/sdk/SplashActivity;->startGameActivity()V

    return-void
.end method

.method private startGameActivity()V
    .registers 4

    .prologue
    .line 47
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "{Main_Activtiy}"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/xbox/sdk/SplashActivity;->startActivity(Landroid/content/Intent;)V

    .line 48
    invoke-virtual {p0}, Lcom/xbox/sdk/SplashActivity;->finish()V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_12

    .line 53
    :goto_11
    return-void

    .line 50
    :catch_12
    move-exception v0

    .line 51
    .local v0, "localException":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_11
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x0

    .line 17
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 18
    invoke-virtual {p0}, Lcom/xbox/sdk/SplashActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "x_splash"

    const-string v5, "layout"

    invoke-virtual {p0}, Lcom/xbox/sdk/SplashActivity;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/xbox/sdk/SplashActivity;->setContentView(I)V

    .line 19
    new-instance v1, Landroid/view/animation/AlphaAnimation;

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v1, v3, v4}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 20
    .local v1, "localAlphaAnimation":Landroid/view/animation/AlphaAnimation;
    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Landroid/view/animation/AlphaAnimation;->setRepeatMode(I)V

    .line 21
    invoke-virtual {v1, v7}, Landroid/view/animation/AlphaAnimation;->setRepeatCount(I)V

    .line 22
    const-wide/16 v4, 0x7d0

    invoke-virtual {v1, v4, v5}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 23
    invoke-virtual {p0}, Lcom/xbox/sdk/SplashActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "x_splash_img"

    const-string v5, "id"

    invoke-virtual {p0}, Lcom/xbox/sdk/SplashActivity;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/xbox/sdk/SplashActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 24
    .local v2, "localImageView":Landroid/widget/ImageView;
    if-nez v2, :cond_64

    .line 25
    invoke-virtual {p0}, Lcom/xbox/sdk/SplashActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "x_splash_layout"

    const-string v5, "id"

    invoke-virtual {p0}, Lcom/xbox/sdk/SplashActivity;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 26
    .local v0, "i":I
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/RelativeLayout;

    invoke-virtual {v3, v7}, Landroid/widget/RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .end local v2    # "localImageView":Landroid/widget/ImageView;
    check-cast v2, Landroid/widget/ImageView;

    .line 28
    .end local v0    # "i":I
    .restart local v2    # "localImageView":Landroid/widget/ImageView;
    :cond_64
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setAnimation(Landroid/view/animation/Animation;)V

    .line 30
    new-instance v3, Lcom/xbox/sdk/SplashActivity$1;

    invoke-direct {v3, p0}, Lcom/xbox/sdk/SplashActivity$1;-><init>(Lcom/xbox/sdk/SplashActivity;)V

    invoke-virtual {v1, v3}, Landroid/view/animation/AlphaAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 43
    return-void
.end method
