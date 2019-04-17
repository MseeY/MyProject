.class public Lcom/xbox/sdk/impl/DefaultUser;
.super Ljava/lang/Object;
.source "DefaultUser.java"

# interfaces
.implements Lcom/xbox/sdk/inter/IUser;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private showToast(Ljava/lang/String;)V
    .locals 2
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xbox/sdk/XSDK;->getContext()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 14
    return-void
.end method


# virtual methods
.method public exit()V
    .locals 1

    .prologue
    .line 25
    const-string v0, "\u8c03\u7528[\u9000\u51fa\u6e38\u620f\u786e\u8ba4]\u63a5\u53e3\u6210\u529f\uff0c\u8fd8\u9700\u8981\u7ecf\u8fc7\u6253\u5305\u5de5\u5177\u6765\u6253\u51fa\u6700\u7ec8\u7684\u6e20\u9053\u5305"

    invoke-direct {p0, v0}, Lcom/xbox/sdk/impl/DefaultUser;->showToast(Ljava/lang/String;)V

    .line 26
    return-void
.end method

.method public isSupportMethod(Ljava/lang/String;)Z
    .locals 1
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 19
    const/4 v0, 0x0

    return v0
.end method

.method public login()V
    .locals 1

    .prologue
    .line 31
    const-string v0, "\u8c03\u7528[\u767b\u5f55]\u63a5\u53e3\u6210\u529f\uff0c\u8fd9\u4e2a\u9ed8\u8ba4\u7684\u5b9e\u73b0\uff0c\u8fd8\u9700\u8981\u7ecf\u8fc7\u6253\u5305\u5de5\u5177\u6765\u6253\u51fa\u6700\u7ec8\u7684\u6e20\u9053\u5305"

    invoke-direct {p0, v0}, Lcom/xbox/sdk/impl/DefaultUser;->showToast(Ljava/lang/String;)V

    .line 32
    return-void
.end method

.method public loginCustom(Ljava/lang/String;)V
    .locals 0
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 38
    return-void
.end method

.method public logout()V
    .locals 1

    .prologue
    .line 43
    const-string v0, "\u8c03\u7528[\u767b\u51fa\u63a5\u53e3]\u63a5\u53e3\u6210\u529f\uff0c\u8fd8\u9700\u8981\u7ecf\u8fc7\u6253\u5305\u5de5\u5177\u6765\u6253\u51fa\u6700\u7ec8\u7684\u6e20\u9053\u5305"

    invoke-direct {p0, v0}, Lcom/xbox/sdk/impl/DefaultUser;->showToast(Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public postGiftCode(Ljava/lang/String;)V
    .locals 1
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 49
    const-string v0, "\u8c03\u7528[\u4e0a\u4f20\u793c\u5305\u5151\u6362\u7801]\u63a5\u53e3\u6210\u529f\uff0c\u8fd8\u9700\u8981\u7ecf\u8fc7\u6253\u5305\u5de5\u5177\u6765\u6253\u51fa\u6700\u7ec8\u7684\u6e20\u9053\u5305"

    invoke-direct {p0, v0}, Lcom/xbox/sdk/impl/DefaultUser;->showToast(Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method public queryAntiAddiction()V
    .locals 1

    .prologue
    .line 55
    const-string v0, "\u6e38\u620f\u4e2d\u6682\u65f6\u4e0d\u9700\u8981\u8c03\u7528\u8be5\u63a5\u53e3"

    invoke-direct {p0, v0}, Lcom/xbox/sdk/impl/DefaultUser;->showToast(Ljava/lang/String;)V

    .line 56
    return-void
.end method

.method public realNameRegister()V
    .locals 1

    .prologue
    .line 61
    const-string v0, "\u6e38\u620f\u4e2d\u6682\u65f6\u4e0d\u9700\u8981\u8c03\u7528\u8be5\u63a5\u53e3"

    invoke-direct {p0, v0}, Lcom/xbox/sdk/impl/DefaultUser;->showToast(Ljava/lang/String;)V

    .line 62
    return-void
.end method

.method public showAccountCenter()Z
    .locals 1

    .prologue
    .line 67
    const-string v0, "\u8c03\u7528[\u4e2a\u4eba\u4e2d\u5fc3]\u63a5\u53e3\u6210\u529f\uff0c\u8fd8\u9700\u8981\u7ecf\u8fc7\u6253\u5305\u5de5\u5177\u6765\u6253\u51fa\u6700\u7ec8\u7684\u6e20\u9053\u5305"

    invoke-direct {p0, v0}, Lcom/xbox/sdk/impl/DefaultUser;->showToast(Ljava/lang/String;)V

    .line 68
    const/4 v0, 0x0

    return v0
.end method

.method public submitExtraData(Lcom/xbox/sdk/bean/XRoleBean;)V
    .locals 1
    .param p1, "roleBean"    # Lcom/xbox/sdk/bean/XRoleBean;

    .prologue
    .line 74
    const-string v0, "\u8c03\u7528[\u63d0\u4ea4\u6269\u5c55\u6570\u636e]\u63a5\u53e3\u6210\u529f\uff0c\u8fd8\u9700\u8981\u7ecf\u8fc7\u6253\u5305\u5de5\u5177\u6765\u6253\u51fa\u6700\u7ec8\u7684\u6e20\u9053\u5305"

    invoke-direct {p0, v0}, Lcom/xbox/sdk/impl/DefaultUser;->showToast(Ljava/lang/String;)V

    .line 75
    return-void
.end method

.method public switchLogin()V
    .locals 1

    .prologue
    .line 80
    const-string v0, "\u8c03\u7528[\u5207\u6362\u5e10\u53f7]\u63a5\u53e3\u6210\u529f\uff0c\u8fd8\u9700\u8981\u7ecf\u8fc7\u6253\u5305\u5de5\u5177\u6765\u6253\u51fa\u6700\u7ec8\u7684\u6e20\u9053\u5305"

    invoke-direct {p0, v0}, Lcom/xbox/sdk/impl/DefaultUser;->showToast(Ljava/lang/String;)V

    .line 81
    return-void
.end method
