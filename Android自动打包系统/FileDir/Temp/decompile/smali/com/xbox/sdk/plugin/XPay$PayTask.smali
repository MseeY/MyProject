.class Lcom/xbox/sdk/plugin/XPay$PayTask;
.super Landroid/os/AsyncTask;
.source "XPay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xbox/sdk/plugin/XPay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PayTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/xbox/sdk/bean/XPayBean;",
        "Ljava/lang/Void;",
        "Lcom/xbox/sdk/bean/XPayBean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xbox/sdk/plugin/XPay;


# direct methods
.method constructor <init>(Lcom/xbox/sdk/plugin/XPay;)V
    .locals 0

    .prologue
    .line 61
    iput-object p1, p0, Lcom/xbox/sdk/plugin/XPay$PayTask;->this$0:Lcom/xbox/sdk/plugin/XPay;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/xbox/sdk/bean/XPayBean;)Lcom/xbox/sdk/bean/XPayBean;
    .locals 3
    .param p1, "params"    # [Lcom/xbox/sdk/bean/XPayBean;

    .prologue
    .line 66
    const-string v0, "SDK"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "doInBackground = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    const/4 v0, 0x0

    aget-object v0, p1, v0

    invoke-static {v0}, Lcom/xbox/sdk/verify/XVerify;->payAuth(Lcom/xbox/sdk/bean/XPayBean;)Lcom/xbox/sdk/bean/XPayBean;

    move-result-object v0

    return-object v0
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Lcom/xbox/sdk/bean/XPayBean;

    invoke-virtual {p0, p1}, Lcom/xbox/sdk/plugin/XPay$PayTask;->doInBackground([Lcom/xbox/sdk/bean/XPayBean;)Lcom/xbox/sdk/bean/XPayBean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/xbox/sdk/bean/XPayBean;)V
    .locals 3
    .param p1, "result"    # Lcom/xbox/sdk/bean/XPayBean;

    .prologue
    .line 73
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 74
    const-string v0, "SDK"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "----------------------------------------------------"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XPay$PayTask;->this$0:Lcom/xbox/sdk/plugin/XPay;

    # invokes: Lcom/xbox/sdk/plugin/XPay;->onPayAuthResult(Lcom/xbox/sdk/bean/XPayBean;)V
    invoke-static {v0, p1}, Lcom/xbox/sdk/plugin/XPay;->access$0(Lcom/xbox/sdk/plugin/XPay;Lcom/xbox/sdk/bean/XPayBean;)V

    .line 76
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Lcom/xbox/sdk/bean/XPayBean;

    invoke-virtual {p0, p1}, Lcom/xbox/sdk/plugin/XPay$PayTask;->onPostExecute(Lcom/xbox/sdk/bean/XPayBean;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 81
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 82
    return-void
.end method
