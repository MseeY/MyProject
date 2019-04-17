.class public Lcom/xbox/sdk/verify/XVerify;
.super Ljava/lang/Object;
.source "XVerify.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static loginAuth(Lcom/xbox/sdk/bean/LoginResultBean;)Ljava/lang/String;
    .locals 12
    .param p0, "resultBean"    # Lcom/xbox/sdk/bean/LoginResultBean;

    .prologue
    .line 18
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 19
    .local v2, "json1":Lorg/json/JSONObject;
    const-string v7, "token"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/LoginResultBean;->getToken()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 20
    const-string v7, "userid"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/LoginResultBean;->getUserid()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 21
    const-string v7, "oauth_token_secret"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/LoginResultBean;->getOauth_token_secret()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 22
    const-string v7, "openid"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/LoginResultBean;->getOpenId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 23
    const-string v7, "type"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/LoginResultBean;->getType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    const-string v7, "openkey"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/LoginResultBean;->getOpenkey()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    const-string v7, "channel"

    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v8

    invoke-virtual {v8}, Lcom/xbox/sdk/XSDK;->getCurrChannel()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 26
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-static {}, Lcom/xbox/sdk/verify/AES256;->initkey()[B

    move-result-object v8

    invoke-static {v7, v8}, Lcom/xbox/sdk/verify/AES256;->encrypt([B[B)[B

    move-result-object v0

    .line 27
    .local v0, "data1":[B
    invoke-static {v0}, Lcom/xbox/sdk/verify/Base64;->encode([B)Ljava/lang/String;

    move-result-object v4

    .line 28
    .local v4, "message":Ljava/lang/String;
    const-string v7, "+"

    const-string v8, "%2B"

    invoke-virtual {v4, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    .line 29
    .local v5, "msg1":Ljava/lang/String;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 30
    .local v3, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v7, "data"

    invoke-interface {v3, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    const-string v7, "appid"

    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v8

    invoke-virtual {v8}, Lcom/xbox/sdk/XSDK;->getAppID()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    const-string v7, "time"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    const-string v7, "SDK"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "map=============+"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 36
    :try_start_1
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v7

    invoke-virtual {v7}, Lcom/xbox/sdk/XSDK;->getAuthURL()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Lcom/xbox/sdk/utils/XHttpUtils;->doPost(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 37
    .local v6, "result":Ljava/lang/String;
    const-string v7, "SDK"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "login =========="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 47
    .end local v0    # "data1":[B
    .end local v2    # "json1":Lorg/json/JSONObject;
    .end local v3    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4    # "message":Ljava/lang/String;
    .end local v5    # "msg1":Ljava/lang/String;
    .end local v6    # "result":Ljava/lang/String;
    :goto_0
    return-object v6

    .line 39
    .restart local v0    # "data1":[B
    .restart local v2    # "json1":Lorg/json/JSONObject;
    .restart local v3    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v4    # "message":Ljava/lang/String;
    .restart local v5    # "msg1":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 41
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 47
    .end local v0    # "data1":[B
    .end local v1    # "e":Ljava/lang/Throwable;
    .end local v2    # "json1":Lorg/json/JSONObject;
    .end local v3    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4    # "message":Ljava/lang/String;
    .end local v5    # "msg1":Ljava/lang/String;
    :goto_1
    const/4 v6, 0x0

    goto :goto_0

    .line 43
    :catch_1
    move-exception v1

    .line 45
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static payAuth(Lcom/xbox/sdk/bean/XPayBean;)Lcom/xbox/sdk/bean/XPayBean;
    .locals 15
    .param p0, "params"    # Lcom/xbox/sdk/bean/XPayBean;

    .prologue
    .line 51
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 53
    .local v6, "payInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 54
    .local v3, "obj":Lorg/json/JSONObject;
    const-string v12, "channelid"

    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v13

    invoke-virtual {v13}, Lcom/xbox/sdk/XSDK;->getCurrChannel()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 55
    const-string v12, "userId"

    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v13

    invoke-virtual {v13}, Lcom/xbox/sdk/XSDK;->getSDKUserID()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 56
    const-string v12, "goodstNo"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/XPayBean;->getProductId()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 57
    const-string v12, "price"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/XPayBean;->getPrice()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    const-string v12, "note1"

    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v13

    invoke-virtual {v13}, Lcom/xbox/sdk/XSDK;->getNoteOne()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 59
    const-string v12, "note2"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/XPayBean;->getExtend()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 60
    const-string v12, "appSerialNumber"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/XPayBean;->getOrderID()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 61
    const-string v12, "nickname"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/XPayBean;->getRoleName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    const-string v12, "serverid"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/XPayBean;->getServerId()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    const-string v12, "goodsName"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/XPayBean;->getProductName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 64
    const-string v12, "goodsNumber"

    invoke-virtual {p0}, Lcom/xbox/sdk/bean/XPayBean;->getBuyNum()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 65
    const-string v12, "extend"

    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v13

    invoke-virtual {v13}, Lcom/xbox/sdk/XSDK;->getNoteOne()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 66
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    .line 67
    .local v2, "message":Ljava/lang/String;
    const-string v12, "SDK"

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "message="

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v12

    invoke-static {}, Lcom/xbox/sdk/verify/AES256;->initkey()[B

    move-result-object v13

    invoke-static {v12, v13}, Lcom/xbox/sdk/verify/AES256;->encrypt([B[B)[B

    move-result-object v0

    .line 69
    .local v0, "data":[B
    invoke-static {v0}, Lcom/xbox/sdk/verify/Base64;->encode([B)Ljava/lang/String;

    move-result-object v2

    .line 70
    const-string v12, "+"

    const-string v13, "%2B"

    invoke-virtual {v2, v12, v13}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 71
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v13

    invoke-virtual {v13}, Lcom/xbox/sdk/XSDK;->getAppID()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v13

    invoke-virtual {v13}, Lcom/xbox/sdk/XSDK;->getAppKey()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 72
    .local v7, "preSign":Ljava/lang/String;
    invoke-static {v7}, Lcom/xbox/sdk/verify/MD5Encrypt;->MD5Encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 73
    .local v9, "sign":Ljava/lang/String;
    const-string v12, "appid"

    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v13

    invoke-virtual {v13}, Lcom/xbox/sdk/XSDK;->getAppID()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    const-string v12, "message"

    invoke-virtual {v6, v12, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    const-string v12, "sign"

    invoke-virtual {v6, v12, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 77
    :try_start_1
    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v12

    invoke-virtual {v12}, Lcom/xbox/sdk/XSDK;->getPayCheckUrl()Ljava/lang/String;

    move-result-object v12

    invoke-static {v6, v12}, Lcom/xbox/sdk/utils/XHttpUtils;->doPost(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 78
    .local v8, "result":Ljava/lang/String;
    const-string v12, "SDK"

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "\u4fdd\u5b58\u7ed3\u679c\uff1a"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 80
    .local v4, "objResult":Lorg/json/JSONObject;
    const-string v12, "status"

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 81
    .local v10, "status":Ljava/lang/String;
    const-string v12, "1"

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 82
    const-string v12, "orderNo"

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 83
    .local v5, "orderNo":Ljava/lang/String;
    const-string v12, "userid"

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 84
    .local v11, "userid":Ljava/lang/String;
    const-string v12, "SDK"

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "payBean= "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ";;;;"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    invoke-virtual {p0, v5}, Lcom/xbox/sdk/bean/XPayBean;->setOrderID(Ljava/lang/String;)V

    .line 86
    invoke-virtual {p0, v11}, Lcom/xbox/sdk/bean/XPayBean;->setUserid(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 97
    .end local v0    # "data":[B
    .end local v2    # "message":Ljava/lang/String;
    .end local v3    # "obj":Lorg/json/JSONObject;
    .end local v4    # "objResult":Lorg/json/JSONObject;
    .end local v5    # "orderNo":Ljava/lang/String;
    .end local v7    # "preSign":Ljava/lang/String;
    .end local v8    # "result":Ljava/lang/String;
    .end local v9    # "sign":Ljava/lang/String;
    .end local v10    # "status":Ljava/lang/String;
    .end local v11    # "userid":Ljava/lang/String;
    .end local p0    # "params":Lcom/xbox/sdk/bean/XPayBean;
    :goto_0
    return-object p0

    .line 89
    .restart local v0    # "data":[B
    .restart local v2    # "message":Ljava/lang/String;
    .restart local v3    # "obj":Lorg/json/JSONObject;
    .restart local v7    # "preSign":Ljava/lang/String;
    .restart local v9    # "sign":Ljava/lang/String;
    .restart local p0    # "params":Lcom/xbox/sdk/bean/XPayBean;
    :catch_0
    move-exception v1

    .line 91
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 97
    .end local v0    # "data":[B
    .end local v1    # "e":Ljava/lang/Throwable;
    .end local v2    # "message":Ljava/lang/String;
    .end local v3    # "obj":Lorg/json/JSONObject;
    .end local v7    # "preSign":Ljava/lang/String;
    .end local v9    # "sign":Ljava/lang/String;
    :cond_0
    :goto_1
    const/4 p0, 0x0

    goto :goto_0

    .line 93
    :catch_1
    move-exception v1

    .line 95
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
