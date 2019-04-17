.class public Lcom/xbox/sdk/bean/PayResultBean;
.super Ljava/lang/Object;
.source "PayResultBean.java"


# instance fields
.field private extension:Ljava/lang/String;

.field private isPaySuccess:Ljava/lang/String;

.field private productID:Ljava/lang/String;

.field private productName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getExtension()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/xbox/sdk/bean/PayResultBean;->extension:Ljava/lang/String;

    return-object v0
.end method

.method public getIsPaySuccess()Ljava/lang/String;
    .locals 1

    .prologue
    .line 10
    iget-object v0, p0, Lcom/xbox/sdk/bean/PayResultBean;->isPaySuccess:Ljava/lang/String;

    return-object v0
.end method

.method public getProductID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/xbox/sdk/bean/PayResultBean;->productID:Ljava/lang/String;

    return-object v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/xbox/sdk/bean/PayResultBean;->productName:Ljava/lang/String;

    return-object v0
.end method

.method public setExtension(Ljava/lang/String;)V
    .locals 0
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/xbox/sdk/bean/PayResultBean;->extension:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public setIsPaySuccess(Ljava/lang/String;)V
    .locals 0
    .param p1, "isPaySuccess"    # Ljava/lang/String;

    .prologue
    .line 14
    iput-object p1, p0, Lcom/xbox/sdk/bean/PayResultBean;->isPaySuccess:Ljava/lang/String;

    .line 15
    return-void
.end method

.method public setProductID(Ljava/lang/String;)V
    .locals 0
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/xbox/sdk/bean/PayResultBean;->productID:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public setProductName(Ljava/lang/String;)V
    .locals 0
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/xbox/sdk/bean/PayResultBean;->productName:Ljava/lang/String;

    .line 39
    return-void
.end method
