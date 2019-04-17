.class public Lcom/xbox/sdk/bean/LoginResultBean;
.super Ljava/lang/Object;
.source "LoginResultBean.java"


# instance fields
.field private extension:Ljava/lang/String;

.field private oauth_token_secret:Ljava/lang/String;

.field private openId:Ljava/lang/String;

.field private openkey:Ljava/lang/String;

.field private token:Ljava/lang/String;

.field private type:Ljava/lang/String;

.field private userid:Ljava/lang/String;


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
    .line 32
    iget-object v0, p0, Lcom/xbox/sdk/bean/LoginResultBean;->extension:Ljava/lang/String;

    return-object v0
.end method

.method public getOauth_token_secret()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/xbox/sdk/bean/LoginResultBean;->oauth_token_secret:Ljava/lang/String;

    return-object v0
.end method

.method public getOpenId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/xbox/sdk/bean/LoginResultBean;->openId:Ljava/lang/String;

    return-object v0
.end method

.method public getOpenkey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/xbox/sdk/bean/LoginResultBean;->openkey:Ljava/lang/String;

    return-object v0
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/xbox/sdk/bean/LoginResultBean;->token:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/xbox/sdk/bean/LoginResultBean;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getUserid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/xbox/sdk/bean/LoginResultBean;->userid:Ljava/lang/String;

    return-object v0
.end method

.method public setExtension(Ljava/lang/String;)V
    .locals 0
    .param p1, "extension"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/xbox/sdk/bean/LoginResultBean;->extension:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public setOauth_token_secret(Ljava/lang/String;)V
    .locals 0
    .param p1, "oauth_token_secret"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/xbox/sdk/bean/LoginResultBean;->oauth_token_secret:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public setOpenId(Ljava/lang/String;)V
    .locals 0
    .param p1, "openId"    # Ljava/lang/String;

    .prologue
    .line 17
    iput-object p1, p0, Lcom/xbox/sdk/bean/LoginResultBean;->openId:Ljava/lang/String;

    .line 18
    return-void
.end method

.method public setOpenkey(Ljava/lang/String;)V
    .locals 0
    .param p1, "openkey"    # Ljava/lang/String;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/xbox/sdk/bean/LoginResultBean;->openkey:Ljava/lang/String;

    .line 24
    return-void
.end method

.method public setToken(Ljava/lang/String;)V
    .locals 0
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/xbox/sdk/bean/LoginResultBean;->token:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/xbox/sdk/bean/LoginResultBean;->type:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public setUserid(Ljava/lang/String;)V
    .locals 0
    .param p1, "userid"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/xbox/sdk/bean/LoginResultBean;->userid:Ljava/lang/String;

    .line 42
    return-void
.end method
