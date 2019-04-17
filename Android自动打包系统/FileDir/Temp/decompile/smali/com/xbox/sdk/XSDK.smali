.class public Lcom/xbox/sdk/XSDK;
.super Ljava/lang/Object;
.source "XSDK.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xbox/sdk/XSDK$AuthTask;
    }
.end annotation


# static fields
.field private static instance:Lcom/xbox/sdk/XSDK;


# instance fields
.field private applicationListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/xbox/sdk/inter/IApplicationListener;",
            ">;"
        }
    .end annotation
.end field

.field private developInfo:Lcom/xbox/sdk/SDKParams;

.field private dialog:Landroid/app/ProgressDialog;

.field private mActivity:Landroid/app/Activity;

.field private mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

.field private mApplicationListener:Lcom/xbox/sdk/inter/IApplicationListener;

.field private mXSDKListener:Lcom/xbox/sdk/inter/IXSDKListener;

.field private metaData:Landroid/os/Bundle;

.field private userid:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xbox/sdk/XSDK;->dialog:Landroid/app/ProgressDialog;

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/xbox/sdk/XSDK;->applicationListeners:Ljava/util/List;

    .line 29
    return-void
.end method

.method static synthetic access$0(Lcom/xbox/sdk/XSDK;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 208
    invoke-direct {p0, p1}, Lcom/xbox/sdk/XSDK;->onAuthResult(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1(Lcom/xbox/sdk/XSDK;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lcom/xbox/sdk/XSDK;->hideProgressDialog(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$2(Lcom/xbox/sdk/XSDK;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0, p1, p2}, Lcom/xbox/sdk/XSDK;->showProgressDialog(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method public static getInstance()Lcom/xbox/sdk/XSDK;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/xbox/sdk/XSDK;->instance:Lcom/xbox/sdk/XSDK;

    if-nez v0, :cond_0

    .line 44
    new-instance v0, Lcom/xbox/sdk/XSDK;

    invoke-direct {v0}, Lcom/xbox/sdk/XSDK;-><init>()V

    sput-object v0, Lcom/xbox/sdk/XSDK;->instance:Lcom/xbox/sdk/XSDK;

    .line 45
    :cond_0
    sget-object v0, Lcom/xbox/sdk/XSDK;->instance:Lcom/xbox/sdk/XSDK;

    return-object v0
.end method

.method private hideProgressDialog(Landroid/app/Activity;)V
    .locals 1
    .param p1, "paramActivity"    # Landroid/app/Activity;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->dialog:Landroid/app/ProgressDialog;

    if-nez v0, :cond_0

    .line 79
    :goto_0
    return-void

    .line 77
    :cond_0
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xbox/sdk/XSDK;->dialog:Landroid/app/ProgressDialog;

    goto :goto_0
.end method

.method private isAuth()Z
    .locals 1

    .prologue
    .line 133
    invoke-virtual {p0}, Lcom/xbox/sdk/XSDK;->getAuthURL()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onAuthResult(Ljava/lang/String;)V
    .locals 3
    .param p1, "paramToken"    # Ljava/lang/String;

    .prologue
    .line 210
    iget-object v2, p0, Lcom/xbox/sdk/XSDK;->mXSDKListener:Lcom/xbox/sdk/inter/IXSDKListener;

    invoke-interface {v2, p1}, Lcom/xbox/sdk/inter/IXSDKListener;->onAuthResult(Ljava/lang/String;)V

    .line 212
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 213
    .local v1, "jsonObject":Lorg/json/JSONObject;
    const-string v2, "userid"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/xbox/sdk/XSDK;->userid:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 219
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 214
    :catch_0
    move-exception v0

    .line 216
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private showProgressDialog(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p1, "paramActivity"    # Landroid/app/Activity;
    .param p2, "paramString"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 61
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->dialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 72
    :goto_0
    return-void

    .line 63
    :cond_0
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/xbox/sdk/XSDK;->dialog:Landroid/app/ProgressDialog;

    .line 64
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 65
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 66
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 67
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->dialog:Landroid/app/ProgressDialog;

    new-instance v1, Lcom/xbox/sdk/XSDK$1;

    invoke-direct {v1, p0}, Lcom/xbox/sdk/XSDK$1;-><init>(Lcom/xbox/sdk/XSDK;)V

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 71
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    goto :goto_0
.end method


# virtual methods
.method public getAppID()Ljava/lang/String;
    .locals 2

    .prologue
    .line 97
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    const-string v1, "XSDK_APPID"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/SDKParams;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 99
    :cond_0
    const/4 v0, 0x0

    .line 100
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    const-string v1, "XSDK_APPID"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/SDKParams;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getAppKey()Ljava/lang/String;
    .locals 2

    .prologue
    .line 104
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    if-eqz v0, :cond_0

    .line 105
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    const-string v1, "XSDK_APPKEY"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/SDKParams;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 106
    :cond_0
    const/4 v0, 0x0

    .line 107
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    const-string v1, "XSDK_APPKEY"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/SDKParams;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getAuthURL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    const-string v1, "XSDK_AUTH_URL"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/SDKParams;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 84
    :cond_0
    const/4 v0, 0x0

    .line 86
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    const-string v1, "XSDK_AUTH_URL"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/SDKParams;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getContext()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method public getCurrChannel()Ljava/lang/String;
    .locals 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    const-string v1, "XSDK_Channel"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/SDKParams;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 92
    :cond_0
    const/4 v0, 0x0

    .line 93
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    const-string v1, "XSDK_Channel"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/SDKParams;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getNoteOne()Ljava/lang/String;
    .locals 2

    .prologue
    .line 118
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    const-string v1, "XSDK_NOTEONE"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/SDKParams;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 120
    :cond_0
    const/4 v0, 0x0

    .line 121
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    const-string v1, "XSDK_NOTEONE"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/SDKParams;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getPayCheckUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    const-string v1, "XSDK_PAY_CHECK_URL"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/SDKParams;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 113
    :cond_0
    const/4 v0, 0x0

    .line 114
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    const-string v1, "XSDK_PAY_CHECK_URL"

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/SDKParams;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getSDKParams()Lcom/xbox/sdk/SDKParams;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    return-object v0
.end method

.method public getSDKUserID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->userid:Ljava/lang/String;

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "paramInt1"    # I
    .param p2, "paramInt2"    # I
    .param p3, "paramIntent"    # Landroid/content/Intent;

    .prologue
    .line 264
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    if-eqz v0, :cond_0

    .line 265
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    invoke-interface {v0, p1, p2, p3}, Lcom/xbox/sdk/inter/IActivityCallback;->onActivityResult(IILandroid/content/Intent;)V

    .line 268
    :cond_0
    return-void
.end method

.method public onAppAttachBaseContext(Landroid/app/Application;Landroid/content/Context;)V
    .locals 8
    .param p1, "paramApplication"    # Landroid/app/Application;
    .param p2, "paramContext"    # Landroid/content/Context;

    .prologue
    .line 162
    iget-object v4, p0, Lcom/xbox/sdk/XSDK;->applicationListeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/xbox/sdk/XSDK;->applicationListeners:Ljava/util/List;

    if-eqz v4, :cond_1

    .line 163
    :cond_0
    iget-object v4, p0, Lcom/xbox/sdk/XSDK;->applicationListeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 165
    :cond_1
    invoke-static {}, Lcom/xbox/sdk/PluginFactory;->getInstance()Lcom/xbox/sdk/PluginFactory;

    move-result-object v4

    invoke-virtual {v4, p2}, Lcom/xbox/sdk/PluginFactory;->loadPluginInfo(Landroid/content/Context;)V

    .line 166
    invoke-static {}, Lcom/xbox/sdk/PluginFactory;->getInstance()Lcom/xbox/sdk/PluginFactory;

    move-result-object v4

    invoke-virtual {v4, p2}, Lcom/xbox/sdk/PluginFactory;->getSDKParams(Landroid/content/Context;)Lcom/xbox/sdk/SDKParams;

    move-result-object v4

    iput-object v4, p0, Lcom/xbox/sdk/XSDK;->developInfo:Lcom/xbox/sdk/SDKParams;

    .line 167
    invoke-static {}, Lcom/xbox/sdk/PluginFactory;->getInstance()Lcom/xbox/sdk/PluginFactory;

    move-result-object v4

    invoke-virtual {v4, p2}, Lcom/xbox/sdk/PluginFactory;->getMetaData(Landroid/content/Context;)Landroid/os/Bundle;

    move-result-object v4

    iput-object v4, p0, Lcom/xbox/sdk/XSDK;->metaData:Landroid/os/Bundle;

    .line 168
    iget-object v4, p0, Lcom/xbox/sdk/XSDK;->metaData:Landroid/os/Bundle;

    if-eqz v4, :cond_2

    .line 169
    iget-object v4, p0, Lcom/xbox/sdk/XSDK;->metaData:Landroid/os/Bundle;

    const-string v5, "X_APPLICATION_PROXY_NAME"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 170
    iget-object v4, p0, Lcom/xbox/sdk/XSDK;->metaData:Landroid/os/Bundle;

    const-string v5, "X_APPLICATION_PROXY_NAME"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 171
    .local v0, "appStr1":Ljava/lang/String;
    const-string v4, ","

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 173
    .local v2, "split":[Ljava/lang/String;
    :try_start_0
    array-length v6, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-lt v5, v6, :cond_3

    .line 190
    .end local v0    # "appStr1":Ljava/lang/String;
    .end local v2    # "split":[Ljava/lang/String;
    :cond_2
    :goto_1
    return-void

    .line 173
    .restart local v0    # "appStr1":Ljava/lang/String;
    .restart local v2    # "split":[Ljava/lang/String;
    :cond_3
    aget-object v3, v2, v5

    .line 174
    .local v3, "str":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/xbox/sdk/inter/IApplicationListener;

    iput-object v4, p0, Lcom/xbox/sdk/XSDK;->mApplicationListener:Lcom/xbox/sdk/inter/IApplicationListener;

    .line 175
    iget-object v4, p0, Lcom/xbox/sdk/XSDK;->mApplicationListener:Lcom/xbox/sdk/inter/IApplicationListener;

    invoke-interface {v4, p2}, Lcom/xbox/sdk/inter/IApplicationListener;->onProxyAttachBaseContext(Landroid/content/Context;)V

    .line 176
    iget-object v4, p0, Lcom/xbox/sdk/XSDK;->applicationListeners:Ljava/util/List;

    iget-object v7, p0, Lcom/xbox/sdk/XSDK;->mApplicationListener:Lcom/xbox/sdk/inter/IApplicationListener;

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    .line 173
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    goto :goto_0

    .line 178
    .end local v3    # "str":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 180
    .local v1, "e":Ljava/lang/InstantiationException;
    invoke-virtual {v1}, Ljava/lang/InstantiationException;->printStackTrace()V

    goto :goto_1

    .line 181
    .end local v1    # "e":Ljava/lang/InstantiationException;
    :catch_1
    move-exception v1

    .line 183
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_1

    .line 184
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v1

    .line 186
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_1
.end method

.method public onAppConfigurationChanged(Landroid/app/Application;Landroid/content/res/Configuration;)V
    .locals 3
    .param p1, "paramApplication"    # Landroid/app/Application;
    .param p2, "paramConfiguration"    # Landroid/content/res/Configuration;

    .prologue
    .line 201
    iget-object v1, p0, Lcom/xbox/sdk/XSDK;->applicationListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 202
    iget-object v1, p0, Lcom/xbox/sdk/XSDK;->applicationListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 206
    :cond_0
    return-void

    .line 202
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xbox/sdk/inter/IApplicationListener;

    .line 203
    .local v0, "mApplicationListener":Lcom/xbox/sdk/inter/IApplicationListener;
    invoke-interface {v0, p2}, Lcom/xbox/sdk/inter/IApplicationListener;->onProxyConfigurationChanged(Landroid/content/res/Configuration;)V

    goto :goto_0
.end method

.method public onAppCreate(Landroid/app/Application;)V
    .locals 3
    .param p1, "paramApplication"    # Landroid/app/Application;

    .prologue
    .line 193
    iget-object v1, p0, Lcom/xbox/sdk/XSDK;->applicationListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 194
    iget-object v1, p0, Lcom/xbox/sdk/XSDK;->applicationListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 198
    :cond_0
    return-void

    .line 194
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xbox/sdk/inter/IApplicationListener;

    .line 195
    .local v0, "mApplicationListener":Lcom/xbox/sdk/inter/IApplicationListener;
    invoke-interface {v0}, Lcom/xbox/sdk/inter/IApplicationListener;->onProxyCreate()V

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 272
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    if-eqz v0, :cond_0

    .line 273
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IActivityCallback;->onBackPressed()V

    .line 275
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 279
    iput-object p1, p0, Lcom/xbox/sdk/XSDK;->mActivity:Landroid/app/Activity;

    .line 281
    :try_start_0
    invoke-static {}, Lcom/xbox/sdk/plugin/XUser;->getInstance()Lcom/xbox/sdk/plugin/XUser;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xbox/sdk/plugin/XUser;->init()V

    .line 282
    invoke-static {}, Lcom/xbox/sdk/plugin/XPay;->getInstance()Lcom/xbox/sdk/plugin/XPay;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xbox/sdk/plugin/XPay;->init()V

    .line 283
    iget-object v1, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    if-eqz v1, :cond_0

    .line 284
    iget-object v1, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    invoke-interface {v1}, Lcom/xbox/sdk/inter/IActivityCallback;->onCreate()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 289
    :cond_0
    :goto_0
    return-void

    .line 286
    :catch_0
    move-exception v0

    .line 287
    .local v0, "localException":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 293
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    if-eqz v0, :cond_0

    .line 294
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IActivityCallback;->onDestroy()V

    .line 296
    :cond_0
    return-void
.end method

.method public onInitResult(Lcom/xbox/sdk/bean/InitResultBean;)V
    .locals 1
    .param p1, "paramInitResult"    # Lcom/xbox/sdk/bean/InitResultBean;

    .prologue
    .line 223
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mXSDKListener:Lcom/xbox/sdk/inter/IXSDKListener;

    invoke-interface {v0, p1}, Lcom/xbox/sdk/inter/IXSDKListener;->onInitResult(Lcom/xbox/sdk/bean/InitResultBean;)V

    .line 224
    return-void
.end method

.method public onLoginResult(Lcom/xbox/sdk/bean/LoginResultBean;)V
    .locals 3
    .param p1, "paramString"    # Lcom/xbox/sdk/bean/LoginResultBean;

    .prologue
    .line 228
    invoke-direct {p0}, Lcom/xbox/sdk/XSDK;->isAuth()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 229
    new-instance v0, Lcom/xbox/sdk/XSDK$AuthTask;

    invoke-direct {v0, p0}, Lcom/xbox/sdk/XSDK$AuthTask;-><init>(Lcom/xbox/sdk/XSDK;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/xbox/sdk/bean/LoginResultBean;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/xbox/sdk/XSDK$AuthTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 231
    :cond_0
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mXSDKListener:Lcom/xbox/sdk/inter/IXSDKListener;

    invoke-interface {v0, p1}, Lcom/xbox/sdk/inter/IXSDKListener;->onLoginResult(Lcom/xbox/sdk/bean/LoginResultBean;)V

    .line 232
    return-void
.end method

.method public onLogout()V
    .locals 1

    .prologue
    .line 236
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mXSDKListener:Lcom/xbox/sdk/inter/IXSDKListener;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IXSDKListener;->onLogout()V

    .line 237
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 1
    .param p1, "paramIntent"    # Landroid/content/Intent;

    .prologue
    .line 300
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    if-eqz v0, :cond_0

    .line 301
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    invoke-interface {v0, p1}, Lcom/xbox/sdk/inter/IActivityCallback;->onNewIntent(Landroid/content/Intent;)V

    .line 303
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 307
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    if-eqz v0, :cond_0

    .line 308
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IActivityCallback;->onPause()V

    .line 310
    :cond_0
    return-void
.end method

.method public onPayResult(Lcom/xbox/sdk/bean/PayResultBean;)V
    .locals 1
    .param p1, "paramPayResult"    # Lcom/xbox/sdk/bean/PayResultBean;

    .prologue
    .line 241
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mXSDKListener:Lcom/xbox/sdk/inter/IXSDKListener;

    invoke-interface {v0, p1}, Lcom/xbox/sdk/inter/IXSDKListener;->onPayResult(Lcom/xbox/sdk/bean/PayResultBean;)V

    .line 242
    return-void
.end method

.method public onRestart()V
    .locals 1

    .prologue
    .line 314
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    if-eqz v0, :cond_0

    .line 315
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IActivityCallback;->onRestart()V

    .line 317
    :cond_0
    return-void
.end method

.method public onResult(ILjava/lang/String;)V
    .locals 1
    .param p1, "paramInt"    # I
    .param p2, "paramString"    # Ljava/lang/String;

    .prologue
    .line 246
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mXSDKListener:Lcom/xbox/sdk/inter/IXSDKListener;

    invoke-interface {v0, p1, p2}, Lcom/xbox/sdk/inter/IXSDKListener;->onResult(ILjava/lang/String;)V

    .line 247
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 321
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    if-eqz v0, :cond_0

    .line 322
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IActivityCallback;->onResume()V

    .line 324
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 328
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    if-eqz v0, :cond_0

    .line 329
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IActivityCallback;->onStart()V

    .line 331
    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 335
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    if-eqz v0, :cond_0

    .line 336
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IActivityCallback;->onStop()V

    .line 338
    :cond_0
    return-void
.end method

.method public onSwitchAccount()V
    .locals 1

    .prologue
    .line 251
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mXSDKListener:Lcom/xbox/sdk/inter/IXSDKListener;

    invoke-interface {v0}, Lcom/xbox/sdk/inter/IXSDKListener;->onSwitchAccount()V

    .line 252
    return-void
.end method

.method public onSwitchAccount(Ljava/lang/String;)V
    .locals 1
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 256
    iget-object v0, p0, Lcom/xbox/sdk/XSDK;->mXSDKListener:Lcom/xbox/sdk/inter/IXSDKListener;

    invoke-interface {v0, p1}, Lcom/xbox/sdk/inter/IXSDKListener;->onSwitchAccount(Ljava/lang/String;)V

    .line 257
    return-void
.end method

.method public setActivityCallback(Lcom/xbox/sdk/inter/IActivityCallback;)V
    .locals 0
    .param p1, "paramIActivityCallback"    # Lcom/xbox/sdk/inter/IActivityCallback;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/xbox/sdk/XSDK;->mActivityCallback:Lcom/xbox/sdk/inter/IActivityCallback;

    .line 54
    return-void
.end method

.method public setSDKListener(Lcom/xbox/sdk/inter/IXSDKListener;)V
    .locals 0
    .param p1, "paramIXSDKListener"    # Lcom/xbox/sdk/inter/IXSDKListener;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/xbox/sdk/XSDK;->mXSDKListener:Lcom/xbox/sdk/inter/IXSDKListener;

    .line 58
    return-void
.end method
