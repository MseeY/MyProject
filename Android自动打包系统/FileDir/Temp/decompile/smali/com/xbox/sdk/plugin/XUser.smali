.class public Lcom/xbox/sdk/plugin/XUser;
.super Ljava/lang/Object;
.source "XUser.java"


# static fields
.field private static instance:Lcom/xbox/sdk/plugin/XUser;


# instance fields
.field private userPlugin:Lcom/xbox/sdk/inter/IUser;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/xbox/sdk/plugin/XUser;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/xbox/sdk/plugin/XUser;->instance:Lcom/xbox/sdk/plugin/XUser;

    if-nez v0, :cond_0

    .line 16
    new-instance v0, Lcom/xbox/sdk/plugin/XUser;

    invoke-direct {v0}, Lcom/xbox/sdk/plugin/XUser;-><init>()V

    sput-object v0, Lcom/xbox/sdk/plugin/XUser;->instance:Lcom/xbox/sdk/plugin/XUser;

    .line 17
    :cond_0
    sget-object v0, Lcom/xbox/sdk/plugin/XUser;->instance:Lcom/xbox/sdk/plugin/XUser;

    return-object v0
.end method


# virtual methods
.method public exit()V
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    if-nez v0, :cond_0

    .line 24
    :goto_0
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IUser;->exit()V

    goto :goto_0
.end method

.method public init()V
    .locals 2

    .prologue
    .line 27
    const-string v0, "SDK"

    const-string v1, "Xuser  init\u6267\u884c\u4e86"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    invoke-static {}, Lcom/xbox/sdk/PluginFactory;->getInstance()Lcom/xbox/sdk/PluginFactory;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/PluginFactory;->initPlugin(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xbox/sdk/inter/IUser;

    iput-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    .line 29
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lcom/xbox/sdk/impl/DefaultUser;

    invoke-direct {v0}, Lcom/xbox/sdk/impl/DefaultUser;-><init>()V

    iput-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    .line 32
    :cond_0
    return-void
.end method

.method public isSupport(Ljava/lang/String;)Z
    .locals 1
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    if-nez v0, :cond_0

    .line 36
    const/4 v0, 0x0

    .line 37
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    invoke-interface {v0, p1}, Lcom/xbox/sdk/inter/IUser;->isSupportMethod(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public login()V
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    if-nez v0, :cond_0

    .line 44
    :goto_0
    return-void

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IUser;->login()V

    goto :goto_0
.end method

.method public login(Ljava/lang/String;)V
    .locals 1
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    if-nez v0, :cond_0

    .line 50
    :goto_0
    return-void

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    invoke-interface {v0, p1}, Lcom/xbox/sdk/inter/IUser;->loginCustom(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public logout()V
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    if-nez v0, :cond_0

    .line 56
    :goto_0
    return-void

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IUser;->logout()V

    goto :goto_0
.end method

.method public postGiftCode(Ljava/lang/String;)V
    .locals 1
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    if-nez v0, :cond_0

    .line 62
    :goto_0
    return-void

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    invoke-interface {v0, p1}, Lcom/xbox/sdk/inter/IUser;->postGiftCode(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public showAccountCenter()V
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    if-nez v0, :cond_0

    .line 68
    :goto_0
    return-void

    .line 67
    :cond_0
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IUser;->showAccountCenter()Z

    goto :goto_0
.end method

.method public switchLogin()V
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    if-nez v0, :cond_0

    .line 80
    :goto_0
    return-void

    .line 79
    :cond_0
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IUser;->switchLogin()V

    goto :goto_0
.end method

.method public uploadRoleInfo(Lcom/xbox/sdk/bean/XRoleBean;)V
    .locals 1
    .param p1, "roleInfo"    # Lcom/xbox/sdk/bean/XRoleBean;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    if-nez v0, :cond_0

    .line 74
    :goto_0
    return-void

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XUser;->userPlugin:Lcom/xbox/sdk/inter/IUser;

    invoke-interface {v0, p1}, Lcom/xbox/sdk/inter/IUser;->submitExtraData(Lcom/xbox/sdk/bean/XRoleBean;)V

    goto :goto_0
.end method
