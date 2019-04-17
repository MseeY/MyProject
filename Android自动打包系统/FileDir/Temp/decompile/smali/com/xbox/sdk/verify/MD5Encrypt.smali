.class public Lcom/xbox/sdk/verify/MD5Encrypt;
.super Ljava/lang/Object;
.source "MD5Encrypt.java"


# static fields
.field private static final hexDigits:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 9
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "0"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "2"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "3"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "4"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "5"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 10
    const-string v2, "6"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "7"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "8"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "9"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "a"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "b"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "c"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "d"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "e"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "f"

    aput-object v2, v0, v1

    .line 9
    sput-object v0, Lcom/xbox/sdk/verify/MD5Encrypt;->hexDigits:[Ljava/lang/String;

    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    return-void
.end method

.method public static final MD5(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 75
    const/16 v11, 0x10

    new-array v3, v11, [C

    fill-array-data v3, :array_0

    .line 78
    .local v3, "hexDigits":[C
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 79
    .local v0, "btInput":[B
    const-string v11, "MD5"

    invoke-static {v11}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v9

    .line 80
    .local v9, "mdInst":Ljava/security/MessageDigest;
    invoke-virtual {v9, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 81
    invoke-virtual {v9}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v8

    .line 82
    .local v8, "md":[B
    array-length v5, v8

    .line 83
    .local v5, "j":I
    mul-int/lit8 v11, v5, 0x2

    new-array v10, v11, [C

    .line 84
    .local v10, "str":[C
    const/4 v6, 0x0

    .line 85
    .local v6, "k":I
    const/4 v4, 0x0

    .local v4, "i":I
    move v7, v6

    .end local v6    # "k":I
    .local v7, "k":I
    :goto_0
    if-lt v4, v5, :cond_0

    .line 90
    new-instance v11, Ljava/lang/String;

    invoke-direct {v11, v10}, Ljava/lang/String;-><init>([C)V

    .line 93
    .end local v0    # "btInput":[B
    .end local v4    # "i":I
    .end local v5    # "j":I
    .end local v7    # "k":I
    .end local v8    # "md":[B
    .end local v9    # "mdInst":Ljava/security/MessageDigest;
    .end local v10    # "str":[C
    :goto_1
    return-object v11

    .line 86
    .restart local v0    # "btInput":[B
    .restart local v4    # "i":I
    .restart local v5    # "j":I
    .restart local v7    # "k":I
    .restart local v8    # "md":[B
    .restart local v9    # "mdInst":Ljava/security/MessageDigest;
    .restart local v10    # "str":[C
    :cond_0
    aget-byte v1, v8, v4

    .line 87
    .local v1, "byte0":B
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "k":I
    .restart local v6    # "k":I
    ushr-int/lit8 v11, v1, 0x4

    and-int/lit8 v11, v11, 0xf

    aget-char v11, v3, v11

    aput-char v11, v10, v7

    .line 88
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "k":I
    .restart local v7    # "k":I
    and-int/lit8 v11, v1, 0xf

    aget-char v11, v3, v11

    aput-char v11, v10, v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 91
    .end local v0    # "btInput":[B
    .end local v1    # "byte0":B
    .end local v4    # "i":I
    .end local v5    # "j":I
    .end local v7    # "k":I
    .end local v8    # "md":[B
    .end local v9    # "mdInst":Ljava/security/MessageDigest;
    .end local v10    # "str":[C
    :catch_0
    move-exception v2

    .line 93
    .local v2, "e":Ljava/lang/Exception;
    const/4 v11, 0x0

    goto :goto_1

    .line 75
    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public static MD5Encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "origin"    # Ljava/lang/String;

    .prologue
    .line 49
    const/4 v1, 0x0

    .line 52
    .local v1, "resultString":Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .end local v1    # "resultString":Ljava/lang/String;
    .local v2, "resultString":Ljava/lang/String;
    :try_start_1
    const-string v3, "MD5"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 54
    .local v0, "md":Ljava/security/MessageDigest;
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3

    invoke-static {v3}, Lcom/xbox/sdk/verify/MD5Encrypt;->byteArrayToString([B)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 58
    .end local v0    # "md":Ljava/security/MessageDigest;
    .end local v2    # "resultString":Ljava/lang/String;
    .restart local v1    # "resultString":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 55
    :catch_0
    move-exception v3

    goto :goto_0

    .end local v1    # "resultString":Ljava/lang/String;
    .restart local v2    # "resultString":Ljava/lang/String;
    :catch_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "resultString":Ljava/lang/String;
    .restart local v1    # "resultString":Ljava/lang/String;
    goto :goto_0
.end method

.method public static SHAEncode(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "origin"    # Ljava/lang/String;

    .prologue
    .line 62
    const/4 v1, 0x0

    .line 65
    .local v1, "resultString":Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .end local v1    # "resultString":Ljava/lang/String;
    .local v2, "resultString":Ljava/lang/String;
    :try_start_1
    const-string v3, "SHA"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 67
    .local v0, "md":Ljava/security/MessageDigest;
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3

    invoke-static {v3}, Lcom/xbox/sdk/verify/MD5Encrypt;->byteArrayToString([B)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 71
    .end local v0    # "md":Ljava/security/MessageDigest;
    .end local v2    # "resultString":Ljava/lang/String;
    .restart local v1    # "resultString":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 68
    :catch_0
    move-exception v3

    goto :goto_0

    .end local v1    # "resultString":Ljava/lang/String;
    .restart local v2    # "resultString":Ljava/lang/String;
    :catch_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "resultString":Ljava/lang/String;
    .restart local v1    # "resultString":Ljava/lang/String;
    goto :goto_0
.end method

.method public static byteArrayToString([B)Ljava/lang/String;
    .locals 3
    .param p0, "b"    # [B

    .prologue
    .line 20
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 21
    .local v1, "resultSb":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-lt v0, v2, :cond_0

    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 22
    :cond_0
    aget-byte v2, p0, v0

    invoke-static {v2}, Lcom/xbox/sdk/verify/MD5Encrypt;->byteToHexString(B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 21
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static byteToHexString(B)Ljava/lang/String;
    .locals 5
    .param p0, "b"    # B

    .prologue
    .line 39
    move v2, p0

    .line 40
    .local v2, "n":I
    if-gez v2, :cond_0

    .line 41
    add-int/lit16 v2, v2, 0x100

    .line 43
    :cond_0
    div-int/lit8 v0, v2, 0x10

    .line 44
    .local v0, "d1":I
    rem-int/lit8 v1, v2, 0x10

    .line 45
    .local v1, "d2":I
    new-instance v3, Ljava/lang/StringBuilder;

    sget-object v4, Lcom/xbox/sdk/verify/MD5Encrypt;->hexDigits:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v4, Lcom/xbox/sdk/verify/MD5Encrypt;->hexDigits:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
