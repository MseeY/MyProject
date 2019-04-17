package com.xbok.xsdk;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.dom4j.io.SAXReader;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * 测试的打包工具
 */

public class TestMain2 {

	private static final String fatherPath = "E:\\XSDK\\";// 根目录
	private static final String implSdkPath = fatherPath + "ImplSdk";// 待操作的文件夹
	private static final String sdkToolPath = fatherPath + "SdkTool";// SDK工具文件夹
	private static final String tempPath = fatherPath + "Temp";// 临时中转文件夹
	private static final String compilePath = fatherPath + "CompilePackage";
////	private static String currentChannelName;// 当前渠道的名字
//	private static String currentPackageName;// 当前渠道的包名
//	private static String isSplashFile;// 当前的渠道是否需要闪屏文件 如：当乐渠道需要启动屏界面
//	private static String isWeiXinFile;// 当前的渠道是否需要微信文件 如：如果有微信登陆，需要用到这个微信文件
//	private static String isCustomSignature;// 是否有自定义企业签名
//	private static String signAlias;// 企业签名的别名
//	private static String signPassword;// 企业签名密码
//	private static String mainActivityPath;//当前母包的主调用类
//	private static String processText;
	private static long startTime;// 开始的时间
//	private static File currentChanelPath;//当前渠道的路径
	private static DocumentBuilder db;

	public static void main(String[] args) {
		readConfigChanel();
	}

	private static void readConfigChanel() {
		long startTime1 = System.currentTimeMillis();
		try {
			decompileApk();
			int taskSize = 2;
			ExecutorService executorService = Executors.newFixedThreadPool(taskSize);
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			db = dbf.newDocumentBuilder();
			File chanelConfigPath = new File(implSdkPath, "Config.xml");
			Document chanelDocument = db.parse(chanelConfigPath);
			final Element rootElement = chanelDocument.getDocumentElement();
			NodeList channelList = rootElement.getElementsByTagName("channel");
			for (int i = 0; i < channelList.getLength(); i++) {
				final Element channelElement = (Element) channelList.item(i);
				 executorService.execute(new Runnable() {
					@Override
					public void run() {
						// TODO Auto-generated method stub
						configInitInfo(rootElement, channelElement);
					}
				});
			
//				copyResourceFiles();
//				decompileDex2Smali();
//				decompileR2Smali();
//				compileAPK();
//				signAPK();
			}
			if(!executorService.isShutdown()){
				executorService.shutdown();
			}
			Double total = (System.currentTimeMillis()-startTime1)/1000.00;
			System.out.println("打完所有的包耗时=====" +total+ "秒");
			System.out.println("平均一个包耗时=====" + total/channelList.getLength()+ "秒");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 配置读取的Config.xml信息
	 * @param rootElement  根节点
	 * @param channelElement   channel节点
	 */
	private static void configInitInfo(Element rootElement,Element channelElement) {
		String currentChannelName = channelElement.getAttribute("name");
		System.out.println(currentChannelName+"----------");
		File currentChanelPath = new File(implSdkPath, currentChannelName);
		System.out.println("开始打" + currentChannelName + "渠道的包");
		File file = new File(tempPath,currentChannelName);
		try {
			if(!file.exists()){
				file.mkdir();
			}
			File decompileFile = new File(tempPath, "decompile");// 反编译后的路径
			copyDir(decompileFile, file);
		} catch (Exception e) {
			// TODO: handle exception
		}
//		// 获取默认包名
//		currentPackageName = rootElement.getAttribute("package");
		// 是否有自定义包名
//		if ("yes".equals(channelElement.getAttribute("isCustomPackageName")))
//			currentPackageName = channelElement.getAttribute("packageName");
		// 是否有包名的后缀
//		if ("yes".equals(channelElement.getAttribute("isSuffix")))
//			currentPackageName = currentPackageName+ channelElement.getAttribute("suffix");
//		// 是否有自定义签名
//		isCustomSignature = channelElement.getAttribute("isCustomSignature");
//		if ("yes".equals(isCustomSignature)) {
//			signPassword = channelElement.getAttribute("signPwd");
//			signAlias = channelElement.getAttribute("alias");
//		}
//		// 是否有闪屏文件
//		isSplashFile = channelElement.getAttribute("isSplashFile");
//		// 是否有微信文件
//		isWeiXinFile = channelElement.getAttribute("isWeiXinFile");
		
		configManifest(currentChannelName,currentChanelPath,rootElement,channelElement);
	}

	/**
	 * 对母包进行拆包
	 */
	private static void decompileApk() {
		startTime = System.currentTimeMillis();
		System.out.println("对母包进行反编译--执行开始..");
		File decompileFile = new File(tempPath, "decompile");// 反编译后的路径
		File parentPacFile = new File(fatherPath, "XDemo.apk");// 母包的路径
		File sdkToolFile = new File(sdkToolPath, "apktool.bat");// 工具的路径
		if (!decompileFile.exists())
			decompileFile.mkdir();
		try {
			System.out.println("cmd /c " + sdkToolFile+" d [-s] -f " + parentPacFile+ " -o "+decompileFile);
			Process exec = Runtime.getRuntime().exec("cmd /c " + sdkToolFile + " d -f "+ parentPacFile + " -o "+ decompileFile);
			showProcess(exec, "拆包");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("拆包出现问题");
		}
		
		System.err.println("对母包进行反编译--执行完毕..---耗时"+(System.currentTimeMillis() - startTime)+"毫秒"+System.currentTimeMillis());
	}

	private static boolean showProcess(Process exec, String type) throws Exception {
		String processText;
		if (exec != null) {
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(exec.getInputStream(), "gbk"));
			while ((processText = bufferedReader.readLine()) != null) {
				System.out.println(processText);
				if (processText.contains("short value out of range:")) {
					return false;
				}
			}
			exec.waitFor();
		}
		return true;
	}

	/**
	 * 
	 * @param chanelPath   每个渠道的实现层路径
	 */
	private static void configManifest(String currentChannelName,File currentChanelPath,Element rootCofingElement,Element channelCofingElement) {
		startTime = System.currentTimeMillis();
		System.out.println("配置AndroidManifest.xml" + "--执行开始.."+System.currentTimeMillis());
		File  tempManifestPath = new File(tempPath+"\\"+currentChannelName+"\\decompile","AndroidManifest.xml");
		System.out.println(tempManifestPath+"===========================");
		String mainActivityPath = null;
		String currentPackageName = null;
		try {
			Document document = db.parse(tempManifestPath);
			Element rootElement = document.getDocumentElement();
			currentPackageName = rootCofingElement.getAttribute("package");
			if ("yes".equals(channelCofingElement.getAttribute("isCustomPackageName")))
			currentPackageName = channelCofingElement.getAttribute("packageName");
			//设置全局的包名
			rootElement.setAttribute("package", currentPackageName);
			//以下配置application的信息
			NodeList applicationNodeList = rootElement.getElementsByTagName("application");
			Element applicationNode = (Element) applicationNodeList.item(0);
			applicationNode.setAttribute("android:name","com.xbox.sdk.XApplication");
			//以下配置MainActivtiy的信息
			NodeList categoryNodeList = rootElement.getElementsByTagName("category");
			for (int i = 0; i < categoryNodeList.getLength(); i++) {
				Element categoryNode = (Element)categoryNodeList.item(i);
				if("android.intent.category.LAUNCHER".equals(categoryNode.getAttribute("android:name"))){
					//category父节点的父节点是Activity节点
					Element activtiyNode = (Element)categoryNode.getParentNode().getParentNode();
					//设置Activity节点的属性
					activtiyNode.setAttribute("android:configChanges", "orientation|navigation|screenSize|keyboard|keyboardHidden");
					//如果有闪屏文件直接删除
					if("yes".equals(channelCofingElement.getAttribute("isSplashFile"))) {
						activtiyNode.removeChild(categoryNode.getParentNode());
						//获取入口类的路径（后面会用到）
						mainActivityPath = activtiyNode.getAttribute("android:name");
					}
					//如果是联想渠道，需要特殊处理
					if("lianxiang".equals(currentChannelName)){
						 categoryNode.setAttribute("android:name", "android.intent.category.DEFAULT");
						 Element intentFilterNode = (Element)categoryNode.getParentNode();
						 NodeList actionNodeList = intentFilterNode.getElementsByTagName("action");
						 Element actionNode = (Element)actionNodeList.item(0);
						 actionNode.setAttribute("android:name", "lenovoid.MAIN");
					 }
				}
			}
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			DOMSource domSource = new DOMSource(document);
			transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			FileOutputStream fileOutputStream = new FileOutputStream(tempManifestPath);
			StreamResult result = new StreamResult(fileOutputStream);
			transformer.transform(domSource, result);
			fileOutputStream.close();
		} catch (Exception e) {
			// TODO: handle exception
		}

		// ------------将AndroidManifestConfig.xml中的组件拷贝到AndroidManifest.xml----------------------
		File manifestConfigPath = new File(currentChanelPath,"AndroidManifestConfig.xml");
		if (!manifestConfigPath.exists())
			return;
		try {
			FileReader fr = new FileReader(manifestConfigPath);
			BufferedReader br = new BufferedReader(fr);
			RandomAccessFile rf = new RandomAccessFile(tempManifestPath, "rw");
			StringBuilder permissionBuilder = new StringBuilder();
			StringBuilder componentsBuilder = new StringBuilder();
			StringBuilder newBuilder = new StringBuilder();
			String line;
			boolean o = false;
			boolean b = false;
			while ((line = br.readLine()) != null) {// 定义循环, 读取数据到sBuilder中
				if ("</permission>".equals(line.trim())) o = false;
				if (o) permissionBuilder.append(line + "\r\n");
				if ("<permission>".equals(line.trim()))o = true;
				if ("</components>".equals(line.trim())) {b = false;
					break;
				}
				if (b)componentsBuilder.append(line + "\r\n");
				if ("<components>".equals(line.trim()))b = true;
			}
			br.close();
			while ((line = rf.readLine()) != null) {
				newBuilder.append(line + "\r\n");
				if (line.trim().contains("<application"))newBuilder.insert(newBuilder.toString().indexOf("<application"),permissionBuilder.toString());
				if (line.trim().contains("</application>"))newBuilder.insert(newBuilder.toString().indexOf("</application>"),componentsBuilder.toString());
			}
			rf.seek(0);
			rf.write(newBuilder.toString().getBytes());
			rf.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.err.println("配置AndroidManifest.xml--执行完毕..---耗时"+(System.currentTimeMillis() - startTime)+"毫秒");
		copyResourceFiles(currentChannelName,currentChanelPath,channelCofingElement,mainActivityPath,currentPackageName);
	}
	
	/**
	 * 拷贝资源文件到临时目录
	 * @param chanelPath
	 */
	private static void copyResourceFiles(String currentChannelName,File currentChanelPath,Element channelCofingElement,String mainActivityName,String currentPackageName){
		 startTime = System.currentTimeMillis();
		 System.out.println("合并"+currentChannelName+"资源文件--执行开始..");
		 File decompileFile = new File(tempPath+"\\"+currentChannelName+"\\decompile");
		 try {
			 File resourceFiles = new File(currentChanelPath,"Resource");
			 File[] listFiles = resourceFiles.listFiles();
			 for (File resourceFile : listFiles) {
				 copyDir(resourceFile,decompileFile);
			 }
		  } catch (Exception e) {
				// TODO: handle exception
		  }
		 System.err.println("合并"+currentChannelName+"资源文件--执行完毕..---耗时"+(System.currentTimeMillis() - startTime)+"毫秒");
		 decompileDex2Smali(currentChannelName,currentChanelPath,decompileFile,channelCofingElement,mainActivityName,currentPackageName);
	}
	
	/**
	 * 反编译classes.dex到Smali文件
	 */
	private static void decompileDex2Smali(String currentChannelName,File currentChanelPath,File decompileFile,Element channelCofingElement,String mainActivityPath,String currentPackageName){
		 startTime = System.currentTimeMillis();
		 System.out.println("将实现层的dex转化为smali文件,并且合并--执行开始..");
		try {
			//把classes.dex通过工具转换成Smali文件放到临时目录
			Runtime runtime = Runtime.getRuntime();
			File baksmaliToolPath = new File(sdkToolPath,"baksmali-2.1.2.jar");
			File dexPath = new File(currentChanelPath,"Dex");
			File smaliPath;
			File[] listFiles = dexPath.listFiles();
			for (File file : listFiles) {
				if("classes".equals(file.getName().substring(0, file.getName().length()-4)))
					smaliPath = new File(tempPath+"\\"+currentChannelName,"smali");
				else
					smaliPath = new File(tempPath+"\\"+currentChannelName,"smali_"+file.getName().substring(0, file.getName().length()-4));
				Process exec = runtime.exec("cmd /c java -jar "+baksmaliToolPath+" -o "+smaliPath+" "+file);
			    showProcess(exec, "把实现层的"+file.getName().substring(0, file.getName().length()-4)+"转换成smali");
			    copyDir(smaliPath, decompileFile);
			}
			
			if("yes".equals(channelCofingElement.getAttribute("isWeiXinFile"))){
				//把微信文件移动到指定目录
				String pacNamePath = currentPackageName.replaceAll("\\.", "\\\\\\\\");
				File WXFilePath =new File(currentChanelPath,"wxapi");
				File targetPath = new File(decompileFile,"smali\\"+pacNamePath);
				if(!targetPath.exists())targetPath.mkdirs();
				copyDir(WXFilePath,targetPath);
				//将微信文件修改内容
				File targetWXFile = new File(targetPath,"wxapi\\WXEntryActivity.smali");
				pacNamePath = currentPackageName.replaceAll("\\.", "/");
				modifyFile(targetWXFile, "{package_name}",pacNamePath);
			}
			
			if("yes".equals(channelCofingElement.getAttribute("isSplashFile"))){
				File splashFilePath = new File(currentChanelPath,"Splash");
				File[] listSplashFiles = splashFilePath.listFiles();
				for (File splash : listSplashFiles) {
					File targetFile = new File(decompileFile+"\\smali\\com\\xbox\\sdk",splash.getName());
					copyFile(splash, targetFile);
					if(targetFile.getName().equals("SplashActivity.smali")){
						modifyFile(targetFile, "{Main_Activtiy}",mainActivityPath);
					}
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		System.err.println("将实现层的dex转化为smali文件,并且合并--执行完毕..---耗时"+(System.currentTimeMillis() - startTime)+"毫秒");
		decompileR2Smali(decompileFile,currentPackageName,currentChannelName,currentChanelPath,channelCofingElement);
	}
	
	/**
	 * 重新生成R.smali然后合并
	 * @param name
	 */
 	private static void decompileR2Smali(File decompileFile,String currentPackageName,String currentChannelName,File currentChanelPath,Element channelCofingElement){
		 startTime = System.currentTimeMillis();
		 System.out.println("重新生成R.smali文件,并且合并--执行开始..");
		 System.out.println("当前的包名为：---------------    "+currentPackageName);
 		String pacNamePath = "\\"+currentPackageName.replaceAll("\\.", "\\\\\\\\");
 		Runtime runtime = Runtime.getRuntime();
		try {
			//这步骤是必要的，先将public.xml从res中移除到临时文件夹，因为生成R文件不需要public.xml
			File oldFile = new File(decompileFile+"\\res\\values","public.xml");
			File newFile = new File(tempPath+"\\"+currentChannelName,"public.xml");
			if(oldFile.exists()){
				oldFile.renameTo(newFile);
			}
			//在临时文件夹下创建gen
			File genDir = new File(tempPath+"\\"+currentChannelName,"gen");
			if(!genDir.exists()){
				genDir.mkdirs();
			}
			//res资源目录
			File resDir = new File(decompileFile,"res");
			//AndroidManifest.xml资源目录
			File manifestFile = new File(decompileFile,"AndroidManifest.xml");
			//AndroidSDK中的工具jar
			File androidFile = new File(sdkToolPath,"android.jar");
			File aaptPath = new File(sdkToolPath,"aapt");
			//首先用资源文件res和AndroidManifest.xml生成R.java
			Process exec1 = runtime.exec("cmd /c "+aaptPath+" package -f -m -J "+genDir+" -S "+resDir+" -M "+manifestFile+" -I "+androidFile);
		    showProcess(exec1, "用资源文件生成R.java");
		    //生成*.java文件的路径
		    File JavaFile = new File(genDir+pacNamePath,"*.java");
		    //再用R.java生成R.class
		    Process exec2 = runtime.exec("cmd /c javac -encoding UTF-8 -bootclasspath "+androidFile+" -d "+genDir+" "+JavaFile);
		    showProcess(exec2, "用R.java生成R.class");
		    //删除R.java （这步骤是必要的）
		    File rJavaFile = new File(genDir+pacNamePath,"R.java");
		    if(rJavaFile.exists()){
		    	rJavaFile.delete();
		    }
		    //class转化dex的工具
		    File dxTool = new File(sdkToolPath,"dx.jar");
		    File dexFile = new File(genDir+pacNamePath,"classes.dex");
		    //用R.class生成classes.dex
		    Process exec3 = runtime.exec("cmd /c "+dxTool+" --dex --output="+dexFile+" "+genDir);
		    showProcess(exec3, "用R.class生成classes.dex");

		    File baksmaliToolPath = new File(sdkToolPath,"baksmali-2.1.2.jar");
		    File smaliDir = new File(decompileFile,"smali");
		    //用classes.dex生成R.smali文件，把R.smali直接放到待回编的工程路径
		    Process exec4 = runtime.exec("cmd /c java -jar "+baksmaliToolPath+" -o "+smaliDir+" "+dexFile);
		    showProcess(exec4, "用classes.dex转换为R.smali");
		    //当R.smali生成完毕以后，我们在合包之前需要把public.xml再次移回到原目录
			if(newFile.exists()&&!oldFile.exists()){
				newFile.renameTo(oldFile);
			}
		    
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.err.println("重新生成R.smali文件,并且合并--执行完毕..---耗时"+(System.currentTimeMillis() - startTime)+"毫秒");
		compileAPK(decompileFile,currentChannelName,currentChanelPath,channelCofingElement);
	}
 	
 	/**
 	 * 回编APK
 	 */
 	private static void compileAPK(File decompileFile,String currentChannelName,File currentChanelPath,Element channelCofingElement){
		 startTime = System.currentTimeMillis();
		 System.out.println("回编APK--执行开始..");
		try {
			File apktool = new File(sdkToolPath,"apktool.bat");
			Process exec = Runtime.getRuntime().exec("cmd /c "+apktool+" b "+decompileFile);
			showProcess(exec,"回编译apk");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.err.println("回编APK--执行完毕..---耗时"+(System.currentTimeMillis() - startTime)+"毫秒");
		signAPK(decompileFile,currentChannelName,currentChanelPath,channelCofingElement);
 	}
 	
 	/**
 	 * 对apk进行签名并且优化
 	 */
 	private static void signAPK(File decompileFile,final String currentChannelName,File currentChanelPath,Element channelCofingElement){
 		 startTime = System.currentTimeMillis();
		 System.out.println("对apk进行签名并且优化--执行开始..");
 		Runtime runtime = Runtime.getRuntime();
 		Process exec;
		try {
			//签名之前的apk
			File beforeApk = new File(decompileFile+"\\dist","XDemo.apk");
			//签名之后的apk
			File afterApk = new File(tempPath,currentChannelName+"//"+currentChannelName+".apk");
			if("yes".equals(channelCofingElement.getAttribute("isCustomSignature"))){
				String signPassword = channelCofingElement.getAttribute("signPwd");
				String signAlias = channelCofingElement.getAttribute("alias");
				//签名文件
				File keystoreFile = new File(currentChanelPath,currentChannelName+".keystore");
				exec = runtime.exec("cmd /c jarsigner -verbose -keystore "+keystoreFile+" -signedjar "+afterApk+" digestalg SHA1 -sigalg MD5withRSA "+beforeApk+" "+signAlias+" -storepass "+signPassword);
			}else{
				File signFile1 = new File(sdkToolPath,"testkey.x509.pem");
				File signFile2 = new File(sdkToolPath,"testkey.pk8");
				File singapkjar = new File(sdkToolPath,"signapk.jar");
				exec = runtime.exec("cmd /c java -jar "+singapkjar+" "+signFile1+" "+signFile2+" "+beforeApk+" "+afterApk);
			}
			boolean showProcess = showProcess(exec,"对apk进行签名");
			if(!showProcess){
				//TODO 65536执行这里   先留出来
			}
			
			//优化后的后的apk
			File zipApk = new File(compilePath,currentChannelName+".apk");
			File zipTool = new File(sdkToolPath,"zipalign");
			Process execzip = runtime.exec("cmd /c "+zipTool+" -v 4 "+afterApk+" "+zipApk);
			String processText;
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(execzip.getInputStream(), "gbk"));
			while ((processText = bufferedReader.readLine()) != null) {
				System.out.println(processText);
				if (processText.contains("Verification succesful")) {
					//异步删除残余文件夹
					new Thread(){
						public void run() {
							System.out.println("开始删除"+currentChannelName+"渠道的临时文件");
							deleteDir(new File(tempPath,currentChannelName));
						};
					}.start();
				}
			}
			exec.waitFor();
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.err.println("对apk进行签名并且优化--执行完毕..---耗时"+(System.currentTimeMillis() - startTime)+"毫秒");
 	}
	
	/**
	 * 对文件进行修改
	 * @param targetFile  要修改的路径
	 * @param rule  修改的规则
	 * @param replaceContent  修改的内容
	 * @throws Exception
	 */
	private static void modifyFile (File targetFile,String rule,String replaceContent) throws Exception{
		RandomAccessFile rf = new RandomAccessFile(targetFile, "rw"); 
     	StringBuffer sb = new StringBuffer();
     	String line;
     	while ((line = rf.readLine())!=null) {
     		if(line.contains(rule))sb.append(line.replace(rule, replaceContent));
     		else sb.append(line);
     		sb.append("\r\n");
			}
         rf.seek(0); 
         rf.writeBytes(sb.toString()); 
         rf.close(); 
	}
	
	/**
	 * 拷贝文件
	 * @param source
	 * @param target
	 */
	private static void copyFile(File source, File target){
		InputStream fis = null;
		OutputStream fos = null;
		try {
			fis = new BufferedInputStream(new FileInputStream(source));
			fos = new BufferedOutputStream(new FileOutputStream(target));
			byte[] buf = new byte[1024];
			int i;
			while ((i = fis.read(buf)) != -1) {
				fos.write(buf, 0, i);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fis.close();
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 将一个文件夹拷贝到另一个文件夹
	 * @param src  源路径
	 * @param dest  目标路径
	 * @throws IOException
	 */
    public static void copyDir(File src, File dest) throws IOException {
            File newDir = new File(dest, src.getName()); // 在dest文件夹下创建和src同名的文件夹
            newDir.mkdir();
            File[] subFiles = src.listFiles();    // 获取src下所有子文件
            if (subFiles != null) {
                    for (File subFile : subFiles) {    // 循环遍历
                            if (subFile.isFile()) {     // 如果是文件直接考到新建的文件夹下
                                    FileInputStream fis = new FileInputStream(subFile);
                                    FileOutputStream fos = new FileOutputStream(new File(newDir, subFile.getName()));
                                    byte[] buffer = new byte[1024];
                                    int len;
                                    while ((len = fis.read(buffer)) != -1)
                                            fos.write(buffer, 0, len);
                                            fis.close();
                                            fos.close();
                            } else {        // 如果是文件夹, 递归拷贝子文件夹
                                    copyDir(subFile, newDir);
                            }
                    }
            }
    }
    
    /**
     * 删除文件夹
     * @param dir
     */
    public static void deleteDir(File dir){
        File[] subFiles = dir.listFiles();           // 获取所有子文件
        if (subFiles != null)                              // 避免NullPointerException
                for (File subFile : subFiles)           // 遍历
                        if (subFile.isFile())            // 如果是文件就删除
                                subFile.delete(); 
                        else                                    // 如果是文件夹就递归, 删除文件夹
                                deleteDir(subFile);
        dir.delete();                                        // 删除所有子文件之后, 删除当前文件夹
    }
}
