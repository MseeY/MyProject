.class public Lcom/xbox/sdk/SDKParams;
.super Ljava/lang/Object;
.source "SDKParams.java"


# instance fields
.field private configs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xbox/sdk/SDKParams;->configs:Ljava/util/Map;

    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 15
    .local p1, "paramMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xbox/sdk/SDKParams;->configs:Ljava/util/Map;

    .line 16
    iput-object p1, p0, Lcom/xbox/sdk/SDKParams;->configs:Ljava/util/Map;

    .line 17
    const-string v0, "SDK"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/xbox/sdk/SDKParams;->configs:Ljava/util/Map;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/String;)Z
    .locals 1
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/xbox/sdk/SDKParams;->configs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lcom/xbox/sdk/SDKParams;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 26
    if-nez p1, :cond_0

    .line 27
    const/4 v0, 0x0

    .line 28
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public getByte(Ljava/lang/String;)Ljava/lang/Byte;
    .locals 1
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/xbox/sdk/SDKParams;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 33
    if-nez p1, :cond_0

    .line 34
    const/4 v0, 0x0

    .line 35
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B

    move-result v0

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    goto :goto_0
.end method

.method public getDouble(Ljava/lang/String;)Ljava/lang/Double;
    .locals 2
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-virtual {p0, p1}, Lcom/xbox/sdk/SDKParams;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 40
    if-nez p1, :cond_0

    .line 41
    const/4 v0, 0x0

    .line 42
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_0
.end method

.method public getFloat(Ljava/lang/String;)Ljava/lang/Float;
    .locals 1
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-virtual {p0, p1}, Lcom/xbox/sdk/SDKParams;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 47
    if-nez p1, :cond_0

    .line 48
    const/4 v0, 0x0

    .line 49
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0
.end method

.method public getInt(Ljava/lang/String;)I
    .locals 2
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-virtual {p0, p1}, Lcom/xbox/sdk/SDKParams;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 54
    .local v0, "ss":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 55
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 57
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getLong(Ljava/lang/String;)Ljava/lang/Long;
    .locals 2
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 61
    invoke-virtual {p0, p1}, Lcom/xbox/sdk/SDKParams;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 62
    if-nez p1, :cond_0

    .line 63
    const/4 v0, 0x0

    .line 64
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_0
.end method

.method public getShort(Ljava/lang/String;)Ljava/lang/Short;
    .locals 1
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-virtual {p0, p1}, Lcom/xbox/sdk/SDKParams;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 69
    if-nez p1, :cond_0

    .line 70
    const/4 v0, 0x0

    .line 71
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Ljava/lang/Short;->parseShort(Ljava/lang/String;)S

    move-result v0

    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    goto :goto_0
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/xbox/sdk/SDKParams;->configs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/xbox/sdk/SDKParams;->configs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 77
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "paramString1"    # Ljava/lang/String;
    .param p2, "paramString2"    # Ljava/lang/String;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/xbox/sdk/SDKParams;->configs:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .local v1, "localStringBuilder":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lcom/xbox/sdk/SDKParams;->configs:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 88
    .local v0, "localIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 89
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 90
    .local v2, "str":Ljava/lang/String;
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v3, p0, Lcom/xbox/sdk/SDKParams;->configs:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method
