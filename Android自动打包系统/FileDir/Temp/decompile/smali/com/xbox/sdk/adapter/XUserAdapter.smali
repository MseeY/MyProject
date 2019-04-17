.class public abstract Lcom/xbox/sdk/adapter/XUserAdapter;
.super Ljava/lang/Object;
.source "XUserAdapter.java"

# interfaces
.implements Lcom/xbox/sdk/inter/IUser;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public exit()V
    .locals 0

    .prologue
    .line 15
    return-void
.end method

.method public abstract isSupportMethod(Ljava/lang/String;)Z
.end method

.method public login()V
    .locals 0

    .prologue
    .line 21
    return-void
.end method

.method public loginCustom(Ljava/lang/String;)V
    .locals 0
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 27
    return-void
.end method

.method public logout()V
    .locals 0

    .prologue
    .line 33
    return-void
.end method

.method public postGiftCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 39
    return-void
.end method

.method public queryAntiAddiction()V
    .locals 0

    .prologue
    .line 45
    return-void
.end method

.method public realNameRegister()V
    .locals 0

    .prologue
    .line 51
    return-void
.end method

.method public showAccountCenter()Z
    .locals 1

    .prologue
    .line 56
    const/4 v0, 0x0

    return v0
.end method

.method public submitExtraData(Lcom/xbox/sdk/bean/XRoleBean;)V
    .locals 0
    .param p1, "roleBean"    # Lcom/xbox/sdk/bean/XRoleBean;

    .prologue
    .line 63
    return-void
.end method

.method public switchLogin()V
    .locals 0

    .prologue
    .line 69
    return-void
.end method
