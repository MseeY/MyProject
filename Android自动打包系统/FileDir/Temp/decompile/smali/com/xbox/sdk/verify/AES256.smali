.class public Lcom/xbox/sdk/verify/AES256;
.super Ljava/lang/Object;
.source "AES256.java"


# static fields
.field public static final CIPHER_ALGORITHM:Ljava/lang/String; = "AES/ECB/PKCS7Padding"

.field public static final KEY_ALGORITHM:Ljava/lang/String; = "AES"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static byte2hex([B)Ljava/lang/String;
    .locals 5
    .param p0, "b"    # [B

    .prologue
    .line 75
    const-string v0, ""

    .line 76
    .local v0, "hs":Ljava/lang/String;
    const-string v2, ""

    .line 77
    .local v2, "stmp":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "n":I
    :goto_0
    array-length v3, p0

    if-lt v1, v3, :cond_0

    .line 84
    return-object v0

    .line 78
    :cond_0
    aget-byte v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    .line 79
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 80
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 77
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 82
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method public static decrypt([B[B)[B
    .locals 3
    .param p0, "data"    # [B
    .param p1, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 136
    invoke-static {p1}, Lcom/xbox/sdk/verify/AES256;->toKey([B)Ljava/security/Key;

    move-result-object v1

    .line 141
    .local v1, "k":Ljava/security/Key;
    const-string v2, "AES/ECB/PKCS7Padding"

    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 143
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 145
    invoke-virtual {v0, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v2

    return-object v2
.end method

.method public static encrypt([B[B)[B
    .locals 4
    .param p0, "data"    # [B
    .param p1, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 112
    invoke-static {p1}, Lcom/xbox/sdk/verify/AES256;->toKey([B)Ljava/security/Key;

    move-result-object v1

    .line 117
    .local v1, "k":Ljava/security/Key;
    new-instance v2, Lorg/bouncycastle/jce/provider/BouncyCastleProvider;

    invoke-direct {v2}, Lorg/bouncycastle/jce/provider/BouncyCastleProvider;-><init>()V

    invoke-static {v2}, Ljava/security/Security;->addProvider(Ljava/security/Provider;)I

    .line 118
    const-string v2, "AES/ECB/PKCS7Padding"

    const-string v3, "BC"

    invoke-static {v2, v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 120
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 122
    invoke-virtual {v0, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v2

    return-object v2
.end method

.method public static hex2bytea(Ljava/lang/String;)[B
    .locals 8
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 55
    if-nez p0, :cond_1

    move-object v0, v4

    .line 69
    :cond_0
    :goto_0
    return-object v0

    .line 57
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 59
    .local v3, "len":I
    if-eqz v3, :cond_2

    rem-int/lit8 v5, v3, 0x2

    const/4 v6, 0x1

    if-ne v5, v6, :cond_3

    :cond_2
    move-object v0, v4

    .line 60
    goto :goto_0

    .line 61
    :cond_3
    div-int/lit8 v5, v3, 0x2

    new-array v0, v5, [B

    .line 63
    .local v0, "b":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v2, v5, :cond_0

    .line 64
    div-int/lit8 v5, v2, 0x2

    .line 65
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "0x"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v7, v2, 0x2

    invoke-virtual {p0, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-byte v6, v6

    .line 64
    aput-byte v6, v0, v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    add-int/lit8 v2, v2, 0x2

    goto :goto_1

    .line 68
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    move-object v0, v4

    .line 69
    goto :goto_0
.end method

.method public static initkey()[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 39
    new-instance v2, Lorg/bouncycastle/jce/provider/BouncyCastleProvider;

    invoke-direct {v2}, Lorg/bouncycastle/jce/provider/BouncyCastleProvider;-><init>()V

    invoke-static {v2}, Ljava/security/Security;->addProvider(Ljava/security/Provider;)I

    .line 40
    const-string v2, "AES"

    const-string v3, "BC"

    invoke-static {v2, v3}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v0

    .line 42
    .local v0, "kg":Ljavax/crypto/KeyGenerator;
    const/16 v2, 0x100

    invoke-virtual {v0, v2}, Ljavax/crypto/KeyGenerator;->init(I)V

    .line 45
    invoke-virtual {v0}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object v1

    .line 48
    .local v1, "secretKey":Ljavax/crypto/SecretKey;
    const/16 v2, 0x20

    new-array v2, v2, [B

    fill-array-data v2, :array_0

    return-object v2

    nop

    :array_0
    .array-data 1
        0x67t
        0x7et
        -0x2ft
        0x49t
        0x7at
        -0x6dt
        0xct
        -0xet
        -0x67t
        -0x62t
        0x3et
        0x7t
        -0x4ft
        0xbt
        -0x21t
        -0x7ct
        0x7dt
        -0x4ct
        0x55t
        -0x1ft
        -0x4ft
        -0x62t
        -0x37t
        0x7bt
        0x53t
        0x11t
        0x6ft
        0x1t
        -0x67t
        0x22t
        -0xet
        0x73t
    .end array-data
.end method

.method public static main([Ljava/lang/String;)V
    .locals 11
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 155
    const-string v5, "{\"string\":\"hello\ufffd\ufffd\ufffd\u04f3\ufffd\"}"

    .line 156
    .local v5, "str":Ljava/lang/String;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "\u052d\ufffd\u0123\ufffd"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 161
    :try_start_0
    invoke-static {}, Lcom/xbox/sdk/verify/AES256;->initkey()[B

    move-result-object v3

    .line 162
    .local v3, "key":[B
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "\ufffd\ufffd\u053f\ufffd\ufffd"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 163
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v6, v3

    if-lt v2, v6, :cond_0

    .line 168
    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-static {v6, v3}, Lcom/xbox/sdk/verify/AES256;->encrypt([B[B)[B

    move-result-object v0

    .line 169
    .local v0, "data":[B
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 170
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "\ufffd\ufffd\ufffd\u073a\ufffd"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/xbox/sdk/verify/Base64;->encode([B)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 172
    const-string v4, "gsaHpy9MXzAQa9zMo8/0zPN27HdLCgqssSs4LQEtk6SRzA0WvmRd6gf/aCfPJNkD"

    .line 173
    .local v4, "sql":Ljava/lang/String;
    invoke-static {v4}, Lcom/xbox/sdk/verify/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    .line 176
    invoke-static {v0, v3}, Lcom/xbox/sdk/verify/AES256;->decrypt([B[B)[B

    move-result-object v0

    .line 177
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "\ufffd\ufffd\ufffd\u073a\ufffd"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v8, Ljava/lang/String;

    const-string v9, "UTF-8"

    invoke-direct {v8, v0, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 182
    .end local v0    # "data":[B
    .end local v2    # "i":I
    .end local v3    # "key":[B
    .end local v4    # "sql":Ljava/lang/String;
    :goto_1
    return-void

    .line 164
    .restart local v2    # "i":I
    .restart local v3    # "key":[B
    :cond_0
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "%x"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aget-byte v10, v3, v2

    invoke-static {v10}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v6, v7, v8}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 178
    .end local v2    # "i":I
    .end local v3    # "key":[B
    :catch_0
    move-exception v1

    .line 180
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static toKey([B)Ljava/security/Key;
    .locals 2
    .param p0, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 97
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    const-string v1, "AES"

    invoke-direct {v0, p0, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 98
    .local v0, "secretKey":Ljavax/crypto/SecretKey;
    return-object v0
.end method
