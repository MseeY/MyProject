.class public Lcom/xbox/sdk/plugin/XPay;
.super Ljava/lang/Object;
.source "XPay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xbox/sdk/plugin/XPay$PayTask;
    }
.end annotation


# static fields
.field private static instance:Lcom/xbox/sdk/plugin/XPay;


# instance fields
.field private payPlugin:Lcom/xbox/sdk/inter/IPay;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/xbox/sdk/plugin/XPay;Lcom/xbox/sdk/bean/XPayBean;)V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/xbox/sdk/plugin/XPay;->onPayAuthResult(Lcom/xbox/sdk/bean/XPayBean;)V

    return-void
.end method

.method public static getInstance()Lcom/xbox/sdk/plugin/XPay;
    .locals 1

    .prologue
    .line 17
    sget-object v0, Lcom/xbox/sdk/plugin/XPay;->instance:Lcom/xbox/sdk/plugin/XPay;

    if-nez v0, :cond_0

    .line 18
    new-instance v0, Lcom/xbox/sdk/plugin/XPay;

    invoke-direct {v0}, Lcom/xbox/sdk/plugin/XPay;-><init>()V

    sput-object v0, Lcom/xbox/sdk/plugin/XPay;->instance:Lcom/xbox/sdk/plugin/XPay;

    .line 19
    :cond_0
    sget-object v0, Lcom/xbox/sdk/plugin/XPay;->instance:Lcom/xbox/sdk/plugin/XPay;

    return-object v0
.end method

.method private onPayAuthResult(Lcom/xbox/sdk/bean/XPayBean;)V
    .locals 1
    .param p1, "payInfo"    # Lcom/xbox/sdk/bean/XPayBean;

    .prologue
    .line 56
    if-eqz p1, :cond_0

    .line 57
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XPay;->payPlugin:Lcom/xbox/sdk/inter/IPay;

    invoke-interface {v0, p1}, Lcom/xbox/sdk/inter/IPay;->pay(Lcom/xbox/sdk/bean/XPayBean;)V

    .line 59
    :cond_0
    return-void
.end method


# virtual methods
.method public init()V
    .locals 3

    .prologue
    .line 23
    const-string v0, "SDK"

    const-string v1, "Xpay  init\u6267\u884c\u4e86"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    invoke-static {}, Lcom/xbox/sdk/PluginFactory;->getInstance()Lcom/xbox/sdk/PluginFactory;

    move-result-object v0

    const-string v1, "2"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/PluginFactory;->initPlugin(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xbox/sdk/inter/IPay;

    iput-object v0, p0, Lcom/xbox/sdk/plugin/XPay;->payPlugin:Lcom/xbox/sdk/inter/IPay;

    .line 25
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XPay;->payPlugin:Lcom/xbox/sdk/inter/IPay;

    if-nez v0, :cond_0

    .line 26
    const-string v0, "SDK"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "payPlugin=="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/xbox/sdk/plugin/XPay;->payPlugin:Lcom/xbox/sdk/inter/IPay;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    new-instance v0, Lcom/xbox/sdk/impl/DefaultPay;

    invoke-direct {v0}, Lcom/xbox/sdk/impl/DefaultPay;-><init>()V

    iput-object v0, p0, Lcom/xbox/sdk/plugin/XPay;->payPlugin:Lcom/xbox/sdk/inter/IPay;

    .line 29
    :cond_0
    return-void
.end method

.method public isSupport(Ljava/lang/String;)Z
    .locals 1
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XPay;->payPlugin:Lcom/xbox/sdk/inter/IPay;

    if-nez v0, :cond_0

    .line 33
    const/4 v0, 0x0

    .line 34
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XPay;->payPlugin:Lcom/xbox/sdk/inter/IPay;

    invoke-interface {v0, p1}, Lcom/xbox/sdk/inter/IPay;->isSupportMethod(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public pay(Lcom/xbox/sdk/bean/XPayBean;)V
    .locals 3
    .param p1, "paramPayParams"    # Lcom/xbox/sdk/bean/XPayBean;

    .prologue
    .line 38
    const-string v0, "SDK"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Xpay\u4e2d\u7684pay\u6267\u884c\u4e86\u5417="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/xbox/sdk/plugin/XPay;->payPlugin:Lcom/xbox/sdk/inter/IPay;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XPay;->payPlugin:Lcom/xbox/sdk/inter/IPay;

    if-nez v0, :cond_0

    .line 53
    :goto_0
    return-void

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XPay;->payPlugin:Lcom/xbox/sdk/inter/IPay;

    instance-of v0, v0, Lcom/xbox/sdk/impl/DefaultPay;

    if-eqz v0, :cond_1

    .line 43
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "---------------"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/xbox/sdk/plugin/XPay;->payPlugin:Lcom/xbox/sdk/inter/IPay;

    instance-of v2, v2, Lcom/xbox/sdk/impl/DefaultPay;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 44
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XPay;->payPlugin:Lcom/xbox/sdk/inter/IPay;

    invoke-interface {v0, p1}, Lcom/xbox/sdk/inter/IPay;->pay(Lcom/xbox/sdk/bean/XPayBean;)V

    goto :goto_0

    .line 48
    :cond_1
    const-string v0, "91"

    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xbox/sdk/XSDK;->getCurrChannel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "69"

    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xbox/sdk/XSDK;->getCurrChannel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 49
    :cond_2
    iget-object v0, p0, Lcom/xbox/sdk/plugin/XPay;->payPlugin:Lcom/xbox/sdk/inter/IPay;

    invoke-interface {v0, p1}, Lcom/xbox/sdk/inter/IPay;->pay(Lcom/xbox/sdk/bean/XPayBean;)V

    goto :goto_0

    .line 51
    :cond_3
    new-instance v0, Lcom/xbox/sdk/plugin/XPay$PayTask;

    invoke-direct {v0, p0}, Lcom/xbox/sdk/plugin/XPay$PayTask;-><init>(Lcom/xbox/sdk/plugin/XPay;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/xbox/sdk/bean/XPayBean;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/plugin/XPay$PayTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method
