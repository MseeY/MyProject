.class public Lcom/xbox/sdk/bean/XRoleBean;
.super Ljava/lang/Object;
.source "XRoleBean.java"


# static fields
.field public static final TYPE_CREATE_ROLE:Ljava/lang/String; = "2"

.field public static final TYPE_ENTER_GAME:Ljava/lang/String; = "3"

.field public static final TYPE_EXIT_GAME:Ljava/lang/String; = "5"

.field public static final TYPE_LEVEL_UP:Ljava/lang/String; = "4"

.field public static final TYPE_SELECT_SERVER:Ljava/lang/String; = "1"


# instance fields
.field private dataType:Ljava/lang/String;

.field private moneyNum:Ljava/lang/String;

.field private roleID:Ljava/lang/String;

.field private roleLevel:Ljava/lang/String;

.field private roleName:Ljava/lang/String;

.field private serverID:Ljava/lang/String;

.field private serverName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDataType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 15
    iget-object v0, p0, Lcom/xbox/sdk/bean/XRoleBean;->dataType:Ljava/lang/String;

    return-object v0
.end method

.method public getMoneyNum()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/xbox/sdk/bean/XRoleBean;->moneyNum:Ljava/lang/String;

    return-object v0
.end method

.method public getRoleID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/xbox/sdk/bean/XRoleBean;->roleID:Ljava/lang/String;

    return-object v0
.end method

.method public getRoleLevel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/xbox/sdk/bean/XRoleBean;->roleLevel:Ljava/lang/String;

    return-object v0
.end method

.method public getRoleName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/xbox/sdk/bean/XRoleBean;->roleName:Ljava/lang/String;

    return-object v0
.end method

.method public getServerID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/xbox/sdk/bean/XRoleBean;->serverID:Ljava/lang/String;

    return-object v0
.end method

.method public getServerName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/xbox/sdk/bean/XRoleBean;->serverName:Ljava/lang/String;

    return-object v0
.end method

.method public setDataType(Ljava/lang/String;)V
    .locals 0
    .param p1, "dataType"    # Ljava/lang/String;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/xbox/sdk/bean/XRoleBean;->dataType:Ljava/lang/String;

    .line 20
    return-void
.end method

.method public setMoneyNum(Ljava/lang/String;)V
    .locals 0
    .param p1, "moneyNum"    # Ljava/lang/String;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/xbox/sdk/bean/XRoleBean;->moneyNum:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public setRoleID(Ljava/lang/String;)V
    .locals 0
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/xbox/sdk/bean/XRoleBean;->roleID:Ljava/lang/String;

    .line 60
    return-void
.end method

.method public setRoleLevel(Ljava/lang/String;)V
    .locals 0
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/xbox/sdk/bean/XRoleBean;->roleLevel:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public setRoleName(Ljava/lang/String;)V
    .locals 0
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/xbox/sdk/bean/XRoleBean;->roleName:Ljava/lang/String;

    .line 68
    return-void
.end method

.method public setServerID(Ljava/lang/String;)V
    .locals 0
    .param p1, "serverID"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/xbox/sdk/bean/XRoleBean;->serverID:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public setServerName(Ljava/lang/String;)V
    .locals 0
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/xbox/sdk/bean/XRoleBean;->serverName:Ljava/lang/String;

    .line 72
    return-void
.end method
