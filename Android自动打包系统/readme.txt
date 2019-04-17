
1、XDemo              可以看成游戏的源文件。

2、XSDK_Abstraction   是我封装的一个抽象层，抽象层的意思就是把各大渠道的登录、支付等接口封装成统一的接口，最后生成jar包，来给游戏CP接入，这样游戏CP端接入一次就可以了。

3、XSDKImpl_huandong  这个文件依赖上XSDK_Abstraction，然后在这里实现目标渠道（这里的huandong是我公司的自有渠道），如果是小米渠道，文件名是XSDKImpl_xiaomi.只是拿欢动举得例子

4、FileDir            表示打包工具还有一些配置文件所放的目录，其中XDemo.apk代表游戏已经接好了我的抽象层的jar包。将这个FileDir放到你想要的文件目录

5、打包执行工具          执行main函数，就可以进行一系列的惊心动魄的操作了。