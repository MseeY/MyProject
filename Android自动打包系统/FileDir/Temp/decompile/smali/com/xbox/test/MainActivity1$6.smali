.class Lcom/xbox/test/MainActivity1$6;
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
    iput-object p1, p0, Lcom/xbox/test/MainActivity1$6;->this$0:Lcom/xbox/test/MainActivity1;

    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 202
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 204
    .local v1, "json":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "dataType"

    const-string v3, "2"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 205
    const-string v2, "roleID"

    const-string v3, "60\u5143\u5b9d"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 206
    const-string v2, "roleName"

    const-string v3, "6\u5143"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 207
    const-string v2, "roleLevel"

    const-string v3, "6"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 208
    const-string v2, "serverID"

    const-string v3, "1"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 209
    const-string v2, "serverName"

    const-string v3, "\u6b22\u52a8"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 210
    const-string v2, "moneyNum"

    const-string v3, "3"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 211
    iget-object v2, p0, Lcom/xbox/test/MainActivity1$6;->this$0:Lcom/xbox/test/MainActivity1;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/xbox/test/MainActivity1;->uploadRoleInfo(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 216
    :goto_0
    return-void

    .line 212
    :catch_0
    move-exception v0

    .line 214
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
