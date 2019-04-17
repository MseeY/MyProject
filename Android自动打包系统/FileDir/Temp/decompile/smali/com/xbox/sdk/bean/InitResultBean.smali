.class public Lcom/xbox/sdk/bean/InitResultBean;
.super Ljava/lang/Object;
.source "InitResultBean.java"


# instance fields
.field private extension:Ljava/lang/String;

.field private isInitSuccess:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;I)V
    .locals 0
    .param p1, "paramBoolean"    # Z
    .param p2, "paramString"    # Ljava/lang/String;
    .param p3, "paramSuccess"    # I

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p2, p0, Lcom/xbox/sdk/bean/InitResultBean;->extension:Ljava/lang/String;

    .line 21
    iput p3, p0, Lcom/xbox/sdk/bean/InitResultBean;->isInitSuccess:I

    .line 22
    return-void
.end method


# virtual methods
.method public getExtension()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/xbox/sdk/bean/InitResultBean;->extension:Ljava/lang/String;

    return-object v0
.end method

.method public getIsInitSuccess()I
    .locals 1

    .prologue
    .line 12
    iget v0, p0, Lcom/xbox/sdk/bean/InitResultBean;->isInitSuccess:I

    return v0
.end method

.method public setExtension(Ljava/lang/String;)V
    .locals 0
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/xbox/sdk/bean/InitResultBean;->extension:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public setIsInitSuccess(I)V
    .locals 0
    .param p1, "isInitSuccess"    # I

    .prologue
    .line 16
    iput p1, p0, Lcom/xbox/sdk/bean/InitResultBean;->isInitSuccess:I

    .line 17
    return-void
.end method
