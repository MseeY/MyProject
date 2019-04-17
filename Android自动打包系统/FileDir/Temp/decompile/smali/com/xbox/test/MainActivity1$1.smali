.class Lcom/xbox/test/MainActivity1$1;
.super Ljava/lang/Object;
.source "MainActivity1.java"

# interfaces
.implements Lcom/xbox/sdk/inter/IXSDKListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xbox/test/MainActivity1;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xbox/test/MainActivity1;


# direct methods
.method constructor <init>(Lcom/xbox/test/MainActivity1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/xbox/test/MainActivity1$1;->this$0:Lcom/xbox/test/MainActivity1;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAuthResult(Ljava/lang/String;)V
    .locals 3
    .param p1, "paramToken"    # Ljava/lang/String;

    .prologue
    .line 82
    iget-object v0, p0, Lcom/xbox/test/MainActivity1$1;->this$0:Lcom/xbox/test/MainActivity1;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onAuthResult=="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/xbox/test/MainActivity1;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/xbox/test/MainActivity1;->access$0(Lcom/xbox/test/MainActivity1;Ljava/lang/String;)V

    .line 83
    return-void
.end method

.method public onInitResult(Lcom/xbox/sdk/bean/InitResultBean;)V
    .locals 3
    .param p1, "paramInitResult"    # Lcom/xbox/sdk/bean/InitResultBean;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/xbox/test/MainActivity1$1;->this$0:Lcom/xbox/test/MainActivity1;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "resultCode:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/xbox/sdk/bean/InitResultBean;->getIsInitSuccess()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "-------resultMsg:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/xbox/sdk/bean/InitResultBean;->getExtension()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/xbox/test/MainActivity1;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/xbox/test/MainActivity1;->access$0(Lcom/xbox/test/MainActivity1;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public onLoginResult(Lcom/xbox/sdk/bean/LoginResultBean;)V
    .locals 0
    .param p1, "paramLoginResult"    # Lcom/xbox/sdk/bean/LoginResultBean;

    .prologue
    .line 88
    return-void
.end method

.method public onLogout()V
    .locals 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/xbox/test/MainActivity1$1;->this$0:Lcom/xbox/test/MainActivity1;

    const-string v1, "onLogout---"

    # invokes: Lcom/xbox/test/MainActivity1;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/xbox/test/MainActivity1;->access$0(Lcom/xbox/test/MainActivity1;Ljava/lang/String;)V

    .line 71
    return-void
.end method

.method public onPayResult(Lcom/xbox/sdk/bean/PayResultBean;)V
    .locals 3
    .param p1, "paramPayResult"    # Lcom/xbox/sdk/bean/PayResultBean;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/xbox/test/MainActivity1$1;->this$0:Lcom/xbox/test/MainActivity1;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "resultCode:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/xbox/sdk/bean/PayResultBean;->getIsPaySuccess()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "-------resultMsg:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/xbox/sdk/bean/PayResultBean;->getExtension()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/xbox/test/MainActivity1;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/xbox/test/MainActivity1;->access$0(Lcom/xbox/test/MainActivity1;Ljava/lang/String;)V

    .line 65
    return-void
.end method

.method public onResult(ILjava/lang/String;)V
    .locals 0
    .param p1, "paramInt"    # I
    .param p2, "paramString"    # Ljava/lang/String;

    .prologue
    .line 59
    return-void
.end method

.method public onSwitchAccount()V
    .locals 2

    .prologue
    .line 53
    iget-object v0, p0, Lcom/xbox/test/MainActivity1$1;->this$0:Lcom/xbox/test/MainActivity1;

    const-string v1, "onSwitchAccount---"

    # invokes: Lcom/xbox/test/MainActivity1;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/xbox/test/MainActivity1;->access$0(Lcom/xbox/test/MainActivity1;Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public onSwitchAccount(Ljava/lang/String;)V
    .locals 2
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/xbox/test/MainActivity1$1;->this$0:Lcom/xbox/test/MainActivity1;

    const-string v1, "onSwitchAccount---have param"

    # invokes: Lcom/xbox/test/MainActivity1;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/xbox/test/MainActivity1;->access$0(Lcom/xbox/test/MainActivity1;Ljava/lang/String;)V

    .line 48
    return-void
.end method
