.class Lcom/xbox/test/MainActivity1$3;
.super Ljava/lang/Object;
.source "MainActivity1.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xbox/test/MainActivity1;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xbox/test/MainActivity1;


# direct methods
.method constructor <init>(Lcom/xbox/test/MainActivity1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/xbox/test/MainActivity1$3;->this$0:Lcom/xbox/test/MainActivity1;

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 119
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 121
    .local v1, "json":Lorg/json/JSONObject;
    :try_start_0
    const-string v4, "productId"

    const-string v5, "1"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 122
    const-string v4, "productName"

    const-string v5, "60\u5143\u5b9d"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 123
    const-string v4, "productDesc"

    const-string v5, "6\u5143"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    const-string v4, "paramPrice"

    const-string v5, "6"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    const-string v4, "buyNum"

    const-string v5, "1"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 126
    const-string v4, "coinNum"

    const-string v5, "1"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 127
    const-string v4, "paramZoneId"

    const-string v5, "1"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 128
    const-string v4, "serverName"

    const-string v5, "\u9b54\u517d\u4e00\u533a"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 129
    const-string v4, "paramRoleId"

    const-string v5, "10"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 130
    const-string v4, "roleName"

    const-string v5, "\u597d\u4eba"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 131
    new-instance v3, Ljava/util/Random;

    invoke-direct {v3}, Ljava/util/Random;-><init>()V

    .line 132
    .local v3, "r":Ljava/util/Random;
    const/16 v4, 0x2710

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    .line 133
    .local v2, "nextInt":I
    const-string v4, "paramBillNo"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "9ca7d741-6000-4c68-a18f-"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 134
    const-string v4, "roleLevel"

    const-string v5, "1"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 135
    const-string v4, "vip"

    const-string v5, "12"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 136
    const-string v4, "userid"

    const-string v5, "312"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 156
    iget-object v4, p0, Lcom/xbox/test/MainActivity1$3;->this$0:Lcom/xbox/test/MainActivity1;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/xbox/test/MainActivity1;->pay(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .end local v2    # "nextInt":I
    .end local v3    # "r":Ljava/util/Random;
    :goto_0
    return-void

    .line 157
    :catch_0
    move-exception v0

    .line 159
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
