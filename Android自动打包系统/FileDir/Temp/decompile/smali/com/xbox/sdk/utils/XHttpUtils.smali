.class public Lcom/xbox/sdk/utils/XHttpUtils;
.super Ljava/lang/Object;
.source "XHttpUtils.java"


# static fields
.field public static final requestCode:I = 0xc8


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doGet(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 20
    .local p0, "parameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p0, p1}, Lcom/xbox/sdk/utils/XHttpUtils;->getNewPath(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 22
    .local v1, "newPath":Ljava/lang/String;
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 24
    .local v2, "url":Ljava/net/URL;
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    check-cast v3, Ljava/net/HttpURLConnection;

    .line 26
    .local v3, "urlConn":Ljava/net/HttpURLConnection;
    const/16 v4, 0x1388

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 28
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->connect()V

    .line 30
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    const/16 v5, 0xc8

    if-ne v4, v5, :cond_0

    .line 32
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4}, Lcom/xbox/sdk/utils/XHttpUtils;->readStream(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 33
    .local v0, "data":[B
    const-string v4, "SDK"

    const-string v5, "Get\u65b9\u5f0f\u8bf7\u6c42\u6210\u529f\uff0c\u8fd4\u56de\u6570\u636e\u5982\u4e0b\uff1a"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    new-instance v4, Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-direct {v4, v0, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 40
    .end local v0    # "data":[B
    :goto_0
    return-object v4

    .line 36
    :cond_0
    const-string v4, "SDK"

    const-string v5, "Get\u65b9\u5f0f\u8bf7\u6c42\u5931\u8d25"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 40
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public static doPost(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .local p0, "parameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/16 v10, 0x1388

    const/4 v9, 0x1

    .line 44
    invoke-static {p0, p1}, Lcom/xbox/sdk/utils/XHttpUtils;->getNewPath(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 45
    .local v2, "newPath":Ljava/lang/String;
    const-string v6, "SDK"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "newPath=============="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    .line 50
    .local v3, "postData":[B
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 52
    .local v4, "url":Ljava/net/URL;
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    check-cast v5, Ljava/net/HttpURLConnection;

    .line 54
    .local v5, "urlConn":Ljava/net/HttpURLConnection;
    invoke-virtual {v5, v10}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 55
    invoke-virtual {v5, v10}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 58
    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 60
    invoke-virtual {v5, v9}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 61
    invoke-virtual {v5, v9}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 63
    invoke-virtual {v5, v9}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 65
    const-string v6, "accept"

    const-string v7, "*/*"

    invoke-virtual {v5, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    const-string v6, "connection"

    const-string v7, "Keep-Alive"

    invoke-virtual {v5, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    const-string v6, "POST"

    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 68
    const-string v6, "Content-Type"

    const-string v7, "application/x-www-form-urlencoded"

    invoke-virtual {v5, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    const-string v6, "charset"

    const-string v7, "utf-8"

    invoke-virtual {v5, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->connect()V

    .line 74
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 75
    .local v1, "dos":Ljava/io/DataOutputStream;
    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->write([B)V

    .line 76
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 77
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V

    .line 79
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v6

    const/16 v7, 0xc8

    if-ne v6, v7, :cond_0

    .line 81
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-static {v6}, Lcom/xbox/sdk/utils/XHttpUtils;->readStream(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 82
    .local v0, "data":[B
    new-instance v6, Ljava/lang/String;

    const-string v7, "UTF-8"

    invoke-direct {v6, v0, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 86
    .end local v0    # "data":[B
    :goto_0
    return-object v6

    .line 84
    :cond_0
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(I)V

    .line 86
    const/4 v6, 0x0

    goto :goto_0
.end method

.method private static getNewPath(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 90
    .local p0, "parameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .local v2, "sb":Ljava/lang/StringBuilder;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 101
    const/4 v3, 0x0

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 92
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 94
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v3, "key= "

    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, " and value= "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v7, "utf-8"

    invoke-static {v3, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 95
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "="

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v6, "utf-8"

    invoke-static {v3, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "&"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 96
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method private static readStream(Ljava/io/InputStream;)[B
    .locals 5
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 106
    const/16 v4, 0x400

    new-array v1, v4, [B

    .line 107
    .local v1, "buffer":[B
    const/4 v3, -0x1

    .line 108
    .local v3, "len":I
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 109
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    .line 112
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 113
    .local v2, "data":[B
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 114
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 115
    return-object v2

    .line 110
    .end local v2    # "data":[B
    :cond_0
    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0
.end method
