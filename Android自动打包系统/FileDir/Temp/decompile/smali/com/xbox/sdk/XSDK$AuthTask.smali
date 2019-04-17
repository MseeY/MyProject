.class Lcom/xbox/sdk/XSDK$AuthTask;
.super Landroid/os/AsyncTask;
.source "XSDK.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xbox/sdk/XSDK;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AuthTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/xbox/sdk/bean/LoginResultBean;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xbox/sdk/XSDK;


# direct methods
.method constructor <init>(Lcom/xbox/sdk/XSDK;)V
    .locals 0

    .prologue
    .line 136
    iput-object p1, p0, Lcom/xbox/sdk/XSDK$AuthTask;->this$0:Lcom/xbox/sdk/XSDK;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Lcom/xbox/sdk/bean/LoginResultBean;

    invoke-virtual {p0, p1}, Lcom/xbox/sdk/XSDK$AuthTask;->doInBackground([Lcom/xbox/sdk/bean/LoginResultBean;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Lcom/xbox/sdk/bean/LoginResultBean;)Ljava/lang/String;
    .locals 1
    .param p1, "params"    # [Lcom/xbox/sdk/bean/LoginResultBean;

    .prologue
    .line 141
    const/4 v0, 0x0

    aget-object v0, p1, v0

    invoke-static {v0}, Lcom/xbox/sdk/verify/XVerify;->loginAuth(Lcom/xbox/sdk/bean/LoginResultBean;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/xbox/sdk/XSDK$AuthTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 147
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 148
    iget-object v0, p0, Lcom/xbox/sdk/XSDK$AuthTask;->this$0:Lcom/xbox/sdk/XSDK;

    # invokes: Lcom/xbox/sdk/XSDK;->onAuthResult(Ljava/lang/String;)V
    invoke-static {v0, p1}, Lcom/xbox/sdk/XSDK;->access$0(Lcom/xbox/sdk/XSDK;Ljava/lang/String;)V

    .line 149
    iget-object v0, p0, Lcom/xbox/sdk/XSDK$AuthTask;->this$0:Lcom/xbox/sdk/XSDK;

    iget-object v1, p0, Lcom/xbox/sdk/XSDK$AuthTask;->this$0:Lcom/xbox/sdk/XSDK;

    invoke-virtual {v1}, Lcom/xbox/sdk/XSDK;->getContext()Landroid/app/Activity;

    move-result-object v1

    # invokes: Lcom/xbox/sdk/XSDK;->hideProgressDialog(Landroid/app/Activity;)V
    invoke-static {v0, v1}, Lcom/xbox/sdk/XSDK;->access$1(Lcom/xbox/sdk/XSDK;Landroid/app/Activity;)V

    .line 150
    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    .line 155
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 156
    iget-object v0, p0, Lcom/xbox/sdk/XSDK$AuthTask;->this$0:Lcom/xbox/sdk/XSDK;

    iget-object v1, p0, Lcom/xbox/sdk/XSDK$AuthTask;->this$0:Lcom/xbox/sdk/XSDK;

    invoke-virtual {v1}, Lcom/xbox/sdk/XSDK;->getContext()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "\u6b63\u5728\u8fdb\u884c\u767b\u5f55\u8ba4\u8bc1\uff0c\u8bf7\u7a0d\u5019..."

    # invokes: Lcom/xbox/sdk/XSDK;->showProgressDialog(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {v0, v1, v2}, Lcom/xbox/sdk/XSDK;->access$2(Lcom/xbox/sdk/XSDK;Landroid/app/Activity;Ljava/lang/String;)V

    .line 157
    return-void
.end method
