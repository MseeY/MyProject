.class public Lcom/xbox/sdk/PluginFactory;
.super Ljava/lang/Object;
.source "PluginFactory.java"


# static fields
.field private static instance:Lcom/xbox/sdk/PluginFactory;


# instance fields
.field private supportedPlugins:Ljava/util/Map;
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
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xbox/sdk/PluginFactory;->supportedPlugins:Ljava/util/Map;

    .line 22
    return-void
.end method

.method public static getInstance()Lcom/xbox/sdk/PluginFactory;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/xbox/sdk/PluginFactory;->instance:Lcom/xbox/sdk/PluginFactory;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Lcom/xbox/sdk/PluginFactory;

    invoke-direct {v0}, Lcom/xbox/sdk/PluginFactory;-><init>()V

    sput-object v0, Lcom/xbox/sdk/PluginFactory;->instance:Lcom/xbox/sdk/PluginFactory;

    .line 29
    :cond_0
    sget-object v0, Lcom/xbox/sdk/PluginFactory;->instance:Lcom/xbox/sdk/PluginFactory;

    return-object v0
.end method

.method private getPluginName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "paramInt"    # Ljava/lang/String;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/xbox/sdk/PluginFactory;->supportedPlugins:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/xbox/sdk/PluginFactory;->supportedPlugins:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 58
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isSupportPlugin(Ljava/lang/String;)Z
    .locals 1
    .param p1, "paramInt"    # Ljava/lang/String;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/xbox/sdk/PluginFactory;->supportedPlugins:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getMetaData(Landroid/content/Context;)Landroid/os/Bundle;
    .locals 5
    .param p1, "paramContext"    # Landroid/content/Context;

    .prologue
    .line 128
    const/4 v0, 0x0

    .line 130
    .local v0, "applicationInfo":Landroid/content/pm/ApplicationInfo;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 131
    .local v2, "packageManager":Landroid/content/pm/PackageManager;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 136
    .end local v2    # "packageManager":Landroid/content/pm/PackageManager;
    :goto_0
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    return-object v3

    .line 132
    :catch_0
    move-exception v1

    .line 134
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method public getSDKParams(Landroid/content/Context;)Lcom/xbox/sdk/SDKParams;
    .locals 10
    .param p1, "paramContext"    # Landroid/content/Context;

    .prologue
    .line 106
    const/4 v4, 0x0

    .line 108
    .local v4, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 109
    .end local v4    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local v5, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_1
    new-instance v7, Ljava/util/Properties;

    invoke-direct {v7}, Ljava/util/Properties;-><init>()V

    .line 110
    .local v7, "pro":Ljava/util/Properties;
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 111
    .local v0, "assets":Landroid/content/res/AssetManager;
    const-string v9, "x_developer_config.properties"

    invoke-virtual {v0, v9}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 112
    .local v2, "is":Ljava/io/InputStream;
    new-instance v3, Ljava/io/InputStreamReader;

    const-string v9, "UTF-8"

    invoke-direct {v3, v2, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 113
    .local v3, "isr":Ljava/io/InputStreamReader;
    invoke-virtual {v7, v3}, Ljava/util/Properties;->load(Ljava/io/Reader;)V

    .line 114
    invoke-virtual {v7}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v8

    .line 115
    .local v8, "propertyNames":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    :goto_0
    invoke-interface {v8}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-nez v9, :cond_0

    .line 119
    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V

    .line 120
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v4, v5

    .line 124
    .end local v0    # "assets":Landroid/content/res/AssetManager;
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v3    # "isr":Ljava/io/InputStreamReader;
    .end local v5    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "pro":Ljava/util/Properties;
    .end local v8    # "propertyNames":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    .restart local v4    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_1
    new-instance v9, Lcom/xbox/sdk/SDKParams;

    invoke-direct {v9, v4}, Lcom/xbox/sdk/SDKParams;-><init>(Ljava/util/Map;)V

    return-object v9

    .line 116
    .end local v4    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v0    # "assets":Landroid/content/res/AssetManager;
    .restart local v2    # "is":Ljava/io/InputStream;
    .restart local v3    # "isr":Ljava/io/InputStreamReader;
    .restart local v5    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v7    # "pro":Ljava/util/Properties;
    .restart local v8    # "propertyNames":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    :cond_0
    :try_start_2
    invoke-interface {v8}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 117
    .local v6, "nextElement":Ljava/lang/String;
    invoke-virtual {v7, v6}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v6, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 121
    .end local v0    # "assets":Landroid/content/res/AssetManager;
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v3    # "isr":Ljava/io/InputStreamReader;
    .end local v6    # "nextElement":Ljava/lang/String;
    .end local v7    # "pro":Ljava/util/Properties;
    .end local v8    # "propertyNames":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    :catch_0
    move-exception v1

    move-object v4, v5

    .line 122
    .end local v5    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local v1, "e":Ljava/lang/Exception;
    .restart local v4    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 121
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    goto :goto_2
.end method

.method public initPlugin(Ljava/lang/String;)Ljava/lang/Object;
    .locals 8
    .param p1, "pluginType"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 33
    const-string v5, "SDK"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "supportedPlugins  ="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/xbox/sdk/PluginFactory;->supportedPlugins:Ljava/util/Map;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    invoke-direct {p0, p1}, Lcom/xbox/sdk/PluginFactory;->isSupportPlugin(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 35
    const-string v5, "1"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, "2"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 36
    :cond_0
    const-string v5, "SDK"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "The config of the XSDK is not support plugin type:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    :goto_0
    return-object v4

    .line 41
    :cond_1
    :try_start_0
    const-string v5, "SDK"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {p0, p1}, Lcom/xbox/sdk/PluginFactory;->getPluginName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "------------------------------------"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    invoke-direct {p0, p1}, Lcom/xbox/sdk/PluginFactory;->getPluginName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 43
    .local v1, "localClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/app/Activity;

    aput-object v7, v5, v6

    invoke-virtual {v1, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 44
    .local v2, "localConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v5, 0x1

    new-array v0, v5, [Ljava/lang/Object;

    .line 45
    .local v0, "arrayOfObject":[Ljava/lang/Object;
    const/4 v5, 0x0

    invoke-static {}, Lcom/xbox/sdk/XSDK;->getInstance()Lcom/xbox/sdk/XSDK;

    move-result-object v6

    invoke-virtual {v6}, Lcom/xbox/sdk/XSDK;->getContext()Landroid/app/Activity;

    move-result-object v6

    aput-object v6, v0, v5

    .line 46
    invoke-virtual {v2, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 47
    .local v4, "localObject":Ljava/lang/Object;
    goto :goto_0

    .line 48
    .end local v0    # "arrayOfObject":[Ljava/lang/Object;
    .end local v1    # "localClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "localConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v4    # "localObject":Ljava/lang/Object;
    :catch_0
    move-exception v3

    .line 49
    .local v3, "localException":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public loadPluginInfo(Landroid/content/Context;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v10, 0x1

    .line 72
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 73
    .local v0, "assets":Landroid/content/res/AssetManager;
    const-string v9, "x_plugin_config.xml"

    invoke-virtual {v0, v9}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 74
    .local v3, "is":Ljava/io/InputStream;
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v8

    .line 75
    .local v8, "xppf":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v8}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v4

    .line 76
    .local v4, "newPullParser":Lorg/xmlpull/v1/XmlPullParser;
    const-string v9, "UTF-8"

    invoke-interface {v4, v3, v9}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 77
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    .line 78
    .local v2, "evtType":I
    :goto_0
    if-ne v2, v10, :cond_0

    .line 96
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .end local v0    # "assets":Landroid/content/res/AssetManager;
    .end local v2    # "evtType":I
    .end local v3    # "is":Ljava/io/InputStream;
    .end local v4    # "newPullParser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v8    # "xppf":Lorg/xmlpull/v1/XmlPullParserFactory;
    :goto_1
    const-string v9, "SDK"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lcom/xbox/sdk/PluginFactory;->supportedPlugins:Ljava/util/Map;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    return-void

    .line 79
    .restart local v0    # "assets":Landroid/content/res/AssetManager;
    .restart local v2    # "evtType":I
    .restart local v3    # "is":Ljava/io/InputStream;
    .restart local v4    # "newPullParser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v8    # "xppf":Lorg/xmlpull/v1/XmlPullParserFactory;
    :cond_0
    packed-switch v2, :pswitch_data_0

    .line 94
    :cond_1
    :goto_2
    :pswitch_0
    :try_start_1
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    goto :goto_0

    .line 81
    :pswitch_1
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    .line 82
    .local v7, "tag":Ljava/lang/String;
    const-string v9, "plugin"

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 83
    const/4 v9, 0x0

    invoke-interface {v4, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v5

    .line 84
    .local v5, "pluginName":Ljava/lang/String;
    const/4 v9, 0x1

    invoke-interface {v4, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v6

    .line 85
    .local v6, "pluginValue":Ljava/lang/String;
    iget-object v9, p0, Lcom/xbox/sdk/PluginFactory;->supportedPlugins:Ljava/util/Map;

    invoke-interface {v9, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 97
    .end local v0    # "assets":Landroid/content/res/AssetManager;
    .end local v2    # "evtType":I
    .end local v3    # "is":Ljava/io/InputStream;
    .end local v4    # "newPullParser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v5    # "pluginName":Ljava/lang/String;
    .end local v6    # "pluginValue":Ljava/lang/String;
    .end local v7    # "tag":Ljava/lang/String;
    .end local v8    # "xppf":Lorg/xmlpull/v1/XmlPullParserFactory;
    :catch_0
    move-exception v1

    .line 99
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 79
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
