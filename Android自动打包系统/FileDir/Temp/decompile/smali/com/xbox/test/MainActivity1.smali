.class public Lcom/xbox/test/MainActivity1;
.super Landroid/app/Activity;
.source "MainActivity1.java"


# static fields
.field public static final CALLBACK_AUTH:Ljava/lang/String; = "OnAuthSuc"

.field public static final CALLBACK_GAMEOBJECT_NAME:Ljava/lang/String; = "(sdk_callback)"

.field public static final CALLBACK_INIT:Ljava/lang/String; = "OnInitSuc"

.field public static final CALLBACK_LOGOUT:Ljava/lang/String; = "OnSDKLogout"

.field public static final CALLBACK_SDK_LOGIN:Ljava/lang/String; = "OnSDKLoginSuc"

.field public static final CALLBACK_SWITCH_LOGIN:Ljava/lang/String; = "OnSDKSwitchAccount"

.field public static final TAG:Ljava/lang/String; = "SDK"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/xbox/test/MainActivity1;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 370
    invoke-direct {p0, p1}, Lcom/xbox/test/MainActivity1;->showToast(Ljava/lang/String;)V

    return-void
.end method

.method private parsePayInfo(Ljava/lang/String;)Lcom/xbox/sdk/bean/XPayBean;
    .locals 4
    .param p1, "payJson"    # Ljava/lang/String;

    .prologue
    .line 342
    const-string v3, "SDK"

    invoke-static {v3, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 343
    new-instance v2, Lcom/xbox/sdk/bean/XPayBean;

    invoke-direct {v2}, Lcom/xbox/sdk/bean/XPayBean;-><init>()V

    .line 345
    .local v2, "payBean":Lcom/xbox/sdk/bean/XPayBean;
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 346
    .local v1, "jsonObject":Lorg/json/JSONObject;
    const-string v3, "productId"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setProductId(Ljava/lang/String;)V

    .line 347
    const-string v3, "productName"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setProductName(Ljava/lang/String;)V

    .line 348
    const-string v3, "productDesc"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setProductDesc(Ljava/lang/String;)V

    .line 349
    const-string v3, "paramPrice"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setPrice(Ljava/lang/String;)V

    .line 350
    const-string v3, "0"

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setRatio(Ljava/lang/String;)V

    .line 351
    const-string v3, "buyNum"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setBuyNum(Ljava/lang/String;)V

    .line 352
    const-string v3, "coinNum"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setCoinNum(Ljava/lang/String;)V

    .line 353
    const-string v3, "paramZoneId"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setServerId(Ljava/lang/String;)V

    .line 354
    const-string v3, "serverName"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setServerName(Ljava/lang/String;)V

    .line 355
    const-string v3, "paramRoleId"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setRoleId(Ljava/lang/String;)V

    .line 356
    const-string v3, "roleName"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setRoleName(Ljava/lang/String;)V

    .line 357
    const-string v3, "roleLevel"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setRoleLevel(Ljava/lang/String;)V

    .line 358
    const-string v3, ""

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setPayNotifyUrl(Ljava/lang/String;)V

    .line 359
    const-string v3, "vip"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setVip(Ljava/lang/String;)V

    .line 360
    const-string v3, "paramBillNo"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setOrderID(Ljava/lang/String;)V

    .line 361
    const-string v3, "userid"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setUserid(Ljava/lang/String;)V

    .line 362
    const-string v3, ""

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XPayBean;->setExtend(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 367
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    return-object v2

    .line 363
    :catch_0
    move-exception v0

    .line 365
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private parseRoleInfo(Ljava/lang/String;)Lcom/xbox/sdk/bean/XRoleBean;
    .locals 4
    .param p1, "roleJson"    # Ljava/lang/String;

    .prologue
    .line 324
    new-instance v2, Lcom/xbox/sdk/bean/XRoleBean;

    invoke-direct {v2}, Lcom/xbox/sdk/bean/XRoleBean;-><init>()V

    .line 326
    .local v2, "roleBean":Lcom/xbox/sdk/bean/XRoleBean;
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 327
    .local v1, "jsonObject":Lorg/json/JSONObject;
    const-string v3, "dataType"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XRoleBean;->setDataType(Ljava/lang/String;)V

    .line 328
    const-string v3, "roleID"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XRoleBean;->setRoleID(Ljava/lang/String;)V

    .line 329
    const-string v3, "roleName"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XRoleBean;->setRoleName(Ljava/lang/String;)V

    .line 330
    const-string v3, "roleLevel"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XRoleBean;->setRoleLevel(Ljava/lang/String;)V

    .line 331
    const-string v3, "serverID"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XRoleBean;->setServerID(Ljava/lang/String;)V

    .line 332
    const-string v3, "serverName"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XRoleBean;->setServerName(Ljava/lang/String;)V

    .line 333
    const-string v3, "moneyNum"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/sdk/bean/XRoleBean;->setMoneyNum(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 338
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    return-object v2

    .line 334
    :catch_0
    move-exception v0

    .line 336
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private showToast(Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 371
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 372
    const-string v0, "SDK"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "---\u81ea\u52a8\u6253\u5305---"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 373
    return-void
.end method


# virtual methods
.method public exit()V
    .locals 1

    .prologue
    .line 291
    invoke-static {}, Lcom/xbox/sdk/plugin/XUser;->getInstance()Lcom/xbox/sdk/plugin/XUser;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xbox/sdk/plugin/XUser;->exit()V

    .line 292
    return-void
.end method

.method public getChannelID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 231
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xbox/sdk/XSDK;->getCurrChannel()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public login()V
    .locals 1

    .prologue
    .line 298
    invoke-static {}, Lcom/xbox/sdk/plugin/XUser;->getInstance()Lcom/xbox/sdk/plugin/XUser;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xbox/sdk/plugin/XUser;->login()V

    .line 299
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 279
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/xbox/sdk/XSDK;->onActivityResult(IILandroid/content/Intent;)V

    .line 280
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 281
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 40
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 41
    const/high16 v5, 0x7f030000

    invoke-virtual {p0, v5}, Lcom/xbox/test/MainActivity1;->setContentView(I)V

    .line 42
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v5

    new-instance v6, Lcom/xbox/test/MainActivity1$1;

    invoke-direct {v6, p0}, Lcom/xbox/test/MainActivity1$1;-><init>(Lcom/xbox/test/MainActivity1;)V

    invoke-virtual {v5, v6}, Lcom/xbox/sdk/XSDK;->setSDKListener(Lcom/xbox/sdk/inter/IXSDKListener;)V

    .line 90
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v5

    invoke-virtual {v5, p0}, Lcom/xbox/sdk/XSDK;->onCreate(Landroid/app/Activity;)V

    .line 91
    const/high16 v5, 0x7f050000

    invoke-virtual {p0, v5}, Lcom/xbox/test/MainActivity1;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 92
    .local v2, "login":Landroid/widget/Button;
    new-instance v5, Lcom/xbox/test/MainActivity1$2;

    invoke-direct {v5, p0}, Lcom/xbox/test/MainActivity1$2;-><init>(Lcom/xbox/test/MainActivity1;)V

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    const v5, 0x7f050001

    invoke-virtual {p0, v5}, Lcom/xbox/test/MainActivity1;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 115
    .local v3, "pay":Landroid/widget/Button;
    new-instance v5, Lcom/xbox/test/MainActivity1$3;

    invoke-direct {v5, p0}, Lcom/xbox/test/MainActivity1$3;-><init>(Lcom/xbox/test/MainActivity1;)V

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 165
    const v5, 0x7f050002

    invoke-virtual {p0, v5}, Lcom/xbox/test/MainActivity1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 166
    .local v1, "intogameupload":Landroid/widget/Button;
    new-instance v5, Lcom/xbox/test/MainActivity1$4;

    invoke-direct {v5, p0}, Lcom/xbox/test/MainActivity1$4;-><init>(Lcom/xbox/test/MainActivity1;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    const v5, 0x7f050003

    invoke-virtual {p0, v5}, Lcom/xbox/test/MainActivity1;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 175
    .local v4, "uplevel":Landroid/widget/Button;
    new-instance v5, Lcom/xbox/test/MainActivity1$5;

    invoke-direct {v5, p0}, Lcom/xbox/test/MainActivity1$5;-><init>(Lcom/xbox/test/MainActivity1;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 196
    const v5, 0x7f050004

    invoke-virtual {p0, v5}, Lcom/xbox/test/MainActivity1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 197
    .local v0, "createrole":Landroid/widget/Button;
    new-instance v5, Lcom/xbox/test/MainActivity1$6;

    invoke-direct {v5, p0}, Lcom/xbox/test/MainActivity1$6;-><init>(Lcom/xbox/test/MainActivity1;)V

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 219
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 251
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xbox/sdk/XSDK;->onDestroy()V

    .line 252
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 253
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 286
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/xbox/sdk/XSDK;->onNewIntent(Landroid/content/Intent;)V

    .line 287
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 288
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 265
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xbox/sdk/XSDK;->onPause()V

    .line 266
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 267
    return-void
.end method

.method protected onRestart()V
    .locals 1

    .prologue
    .line 244
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xbox/sdk/XSDK;->onRestart()V

    .line 245
    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    .line 246
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 272
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xbox/sdk/XSDK;->onResume()V

    .line 273
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 274
    return-void
.end method

.method protected onStart()V
    .locals 1

    .prologue
    .line 237
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xbox/sdk/XSDK;->onStart()V

    .line 238
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 239
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 258
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xbox/sdk/XSDK;->onStop()V

    .line 259
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 260
    return-void
.end method

.method public pay(Ljava/lang/String;)V
    .locals 2
    .param p1, "payJson"    # Ljava/lang/String;

    .prologue
    .line 319
    invoke-direct {p0, p1}, Lcom/xbox/test/MainActivity1;->parsePayInfo(Ljava/lang/String;)Lcom/xbox/sdk/bean/XPayBean;

    move-result-object v0

    .line 320
    .local v0, "parsePayInfo":Lcom/xbox/sdk/bean/XPayBean;
    invoke-static {}, Lcom/xbox/sdk/plugin/XPay;->getInstance()Lcom/xbox/sdk/plugin/XPay;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/xbox/sdk/plugin/XPay;->pay(Lcom/xbox/sdk/bean/XPayBean;)V

    .line 321
    return-void
.end method

.method public sendCallback(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "paramString1"    # Ljava/lang/String;
    .param p2, "paramString2"    # Ljava/lang/String;

    .prologue
    .line 222
    if-nez p2, :cond_0

    .line 223
    const-string p2, ""

    .line 227
    :cond_0
    return-void
.end method

.method public uploadRoleInfo(Ljava/lang/String;)V
    .locals 2
    .param p1, "roleJson"    # Ljava/lang/String;

    .prologue
    .line 308
    invoke-direct {p0, p1}, Lcom/xbox/test/MainActivity1;->parseRoleInfo(Ljava/lang/String;)Lcom/xbox/sdk/bean/XRoleBean;

    move-result-object v0

    .line 309
    .local v0, "parseRoleInfo":Lcom/xbox/sdk/bean/XRoleBean;
    invoke-static {}, Lcom/xbox/sdk/plugin/XUser;->getInstance()Lcom/xbox/sdk/plugin/XUser;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/xbox/sdk/plugin/XUser;->uploadRoleInfo(Lcom/xbox/sdk/bean/XRoleBean;)V

    .line 310
    return-void
.end method
