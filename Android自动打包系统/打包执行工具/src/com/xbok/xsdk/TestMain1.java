package com.xbok.xsdk;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;

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
import org.w3c.dom.NodeList;

/**
 * 测试的打包工具
 */

public class TestMain1 {

	private static String fatherPath = "E:\\XSDK\\";
	private static String implSdkPath = fatherPath+"ImplSdk\\";
	private static String sdkToolPath = fatherPath +"SdkTool\\";
	private static String tempPaht = fatherPath+"Temp\\";
	private static String pacName;
	private static String isSplash;
	private static String isCustomSignature;
	private static String s;
	private static long startTime;
	private static long totalTime; //一个包从拆到合的时间
	private static long totalTimeAll; //所有的包从拆到合的时间
	private static String signPwd;
	private static String Alias;  //别名
	private static String isWeixXin;
	private static DocumentBuilder db;
	private static String chanelName;
	
	public static void main(String[] args) {
		readConfigChanel();
	}
	
	private static void readConfigChanel(){
		 try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			db = dbf.newDocumentBuilder();
			File chanelConfigPath = new File(implSdkPath+"Config.xml");
			Document chanelDocument = db.parse(chanelConfigPath);
			Element chanelElement = chanelDocument.getDocumentElement();
			NodeList channelList = chanelElement.getElementsByTagName("channel");
			for (int i = 0; i < channelList.getLength(); i++) {
				 Element item = (Element)channelList.item(i);
				 String chanelName = item.getAttribute("name");
				 System.out.println("开始打"+chanelName+"渠道的包");
				 chanelConfigPath = new File(implSdkPath,chanelName);
				 initParms(chanelElement,item);
				 decompileApk();//拆包
				 configManifest(chanelConfigPath);
				 File[] listFiles = chanelConfigPath.listFiles();
				 for (File file : listFiles) {
					 if(file.isDirectory()){
						 mergeFile(file);
					 }
				 }
				 decompileDex2Smali(chanelConfigPath.getAbsolutePath(),chanelConfigPath.getName());
				 compileR2Smali(chanelConfigPath.getName());
				 compileAPK();
				 signAPK(chanelConfigPath.getName());
			}
			
			System.err.println("打完所有的包耗时====="+totalTimeAll+"毫秒");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private static void initParms(Element outer,Element inner){
		totalTime = 0;
		pacName= outer.getAttribute("package");
		 //小米渠道暂时特殊处理
		chanelName = inner.getAttribute("name");
		 if("xiaomi".equals(inner.getAttribute("name"))||"lianxiang".equals(inner.getAttribute("name"))||"oppo".equals(inner.getAttribute("name"))){
			 pacName = "com.huandong.shenji3d";
		 }
		 
		 if("yingyongbao".endsWith(inner.getAttribute("name"))){
			 pacName = "com.tencent.tmgp.sglmm";
		 }
		 
		isSplash = inner.getAttribute("isSplash");
		isCustomSignature = inner.getAttribute("isCustomSignature");
		String isSuffix = inner.getAttribute("isSuffix");
		
		//是否有自己的签名
		if("yes".equals(isCustomSignature)){
			signPwd = inner.getAttribute("signPwd");
			Alias = inner.getAttribute("Alias");
		}
		//是否有包名后缀
		if("yes".endsWith(isSuffix)){
			pacName  = pacName+inner.getAttribute("suffix");
		}
		
		isWeixXin = inner.getAttribute("isWixin");
	}
	
	//拆包
	private static void decompileApk(){
		File decompileFile = new File(tempPaht+"decompile");
		if(!decompileFile.exists()){
			decompileFile.mkdir();
		}
		Runtime runtime = Runtime.getRuntime();
		try {
			// 对母包进行拆包
			Process exec = runtime.exec("cmd /c "+sdkToolPath+"apktool.bat d [-s] -f "+fatherPath+"XDemo.apk -o "+decompileFile.getAbsolutePath());
			showProcess(exec,"拆包");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private static boolean showProcess(Process exec,String type) throws Exception{
		startTime = System.currentTimeMillis();
		System.out.println(type+"--执行开始..");
		if(exec!=null){
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(exec.getInputStream(),"gbk"));
			while((s=bufferedReader.readLine()) != null){
				System.out.println(s);
				if(s.contains("short value out of range:")){
					return false;
				}
			}
			exec.waitFor();
		}
		long endTime = System.currentTimeMillis()-startTime;
	    System.err.println(type+"--执行完毕..---耗时"+endTime+"毫秒");
	    totalTime+=endTime;
		return true;
	}
	
	//配置AndroidManifest.xml
		private static void configManifest(File chanelPath){
			startTime = System.currentTimeMillis();
			System.out.println("配置AndroidManifest.xml"+"--执行开始..");
			File domPath = new File(chanelPath.getAbsolutePath(),"AndroidManifestConfig.xml");
			if(!domPath.exists()){
				return;
			}
			try {
				 Document doc1 = db.parse(domPath);
				 Element element1 = doc1.getDocumentElement();
				 NodeList fileNotes1 = element1.getElementsByTagName("uses-permission");
				 NodeList featureNotes = element1.getElementsByTagName("uses-feature");
				//---------------------------------------------------------------------------------------------------------
				 
				 Document doc2 = db.parse("E:\\XSDK\\Temp\\decompile\\AndroidManifest.xml");
				 Element element21 = doc2.getDocumentElement();
				 element21.setAttribute("package", pacName);
				 for (int i = 0; i < fileNotes1.getLength(); i++) {
					 Element item1= (Element) fileNotes1.item(i);
					 Element element2 = doc2.getDocumentElement();
					 Element createElement = doc2.createElement("uses-permission");
					 element2.appendChild(createElement);
					 createElement.setAttribute("android:name", item1.getAttribute("android:name"));
				}
				
				for (int i = 0; i < featureNotes.getLength(); i++) {
					Element item2= (Element) featureNotes.item(i);
					 Element element22 = doc2.getDocumentElement();
					 Element createElement = doc2.createElement("uses-feature");
					 element22.appendChild(createElement);
					 createElement.setAttribute("android:name", item2.getAttribute("android:name"));
				}
				 
				 Element element5 = doc2.getDocumentElement();
				 NodeList elementsByTagName = element5.getElementsByTagName("application");
				 Element e = (Element)elementsByTagName.item(0);
				 e.setAttribute("android:name", "com.xbox.sdk.XApplication");
				 
				 //以下配置主Activity的信息
				 Element splashElem = doc2.getDocumentElement();
				 System.out.println(splashElem.getNodeName());
				 NodeList elementsByTagName2 = splashElem.getElementsByTagName("category");
				 	for (int i = 0; i < elementsByTagName2.getLength(); i++) {
					 Element item = (Element)elementsByTagName2.item(i);
					 if("android.intent.category.LAUNCHER".equals(item.getAttribute("android:name"))){
						 Element activtiyEl = (Element)item.getParentNode().getParentNode();
						 activtiyEl.setAttribute("android:configChanges", "orientation|navigation|screenSize|keyboard|keyboardHidden");
						 if("yes".equals(isSplash)){//如果有shanpin
							 activtiyEl.removeChild(item.getParentNode());
					 	 }
						 if("lianxiang".equals(chanelName)){
							 item.setAttribute("android:name", "android.intent.category.DEFAULT");
							 Element parentNode = (Element)item.getParentNode();
							 NodeList elementsByTagName3 = parentNode.getElementsByTagName("action");
							 Element item2 = (Element)elementsByTagName3.item(0);
							 item2.setAttribute("android:name", "lenovoid.MAIN");
						 }
					 }
				}
				 	
//				if("oppo".equals(chanelName)){
//					NodeList elementsByTagName3 = splashElem.getElementsByTagName("uses-sdk");
//					//oppo需要判断一下最小的编译版本为11      minSdkVersion: '11'
//				}
				
				TransformerFactory transformerFactory = TransformerFactory.newInstance();
				Transformer transformer = transformerFactory.newTransformer();
				DOMSource domSource = new DOMSource(doc2);
				// 设置编码类型
				transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
				transformer.setOutputProperty(OutputKeys.INDENT, "yes"); 
				FileOutputStream fileOutputStream = new FileOutputStream("E:\\XSDK\\Temp\\decompile\\AndroidManifest.xml");
				StreamResult result = new StreamResult(fileOutputStream);
				transformer.transform(domSource, result);
				fileOutputStream.close();
				//======================================以下从文件开始读===========================================
				SAXReader reader = new SAXReader();  
				org.dom4j.Document  document = reader.read(domPath);
				org.dom4j.Element rootElement = document.getRootElement();
				org.dom4j.Element element = rootElement.element("components");
				String ss = element.asXML();
				String asXML =ss.substring(12,ss.length()-13).trim();
				//================================================================
				FileReader fr =new FileReader("E:\\XSDK\\Temp\\decompile\\AndroidManifest.xml");
				FileWriter fileWriter = new FileWriter("E:\\XSDK\\Temp\\decompile\\AndroidManifest1.xml", true);
	            BufferedReader br = new BufferedReader(fr);
	            String node = null;
	            while((node=br.readLine())!=null){
	                 String mess = node.trim();
	                 if(mess.equals("</application>")){//若是匹配用户名，则在该行写入
	               	  fileWriter.write("\n"+asXML+"\n"+"  </application>");
	                  }else{
	               	   fileWriter.write(node+"\n");
	                     }
	                 }
	            br.close();
	            fr.close();
	            fileWriter.flush();
	      	    fileWriter.close();
	      	  
	      	  File fileOld = new File("E:\\XSDK\\Temp\\decompile\\AndroidManifest.xml");
	      	  if(fileOld.exists()){
	      		fileOld.delete();
	      	  }
	      	  
	      	  File fileNew = new File("E:\\XSDK\\Temp\\decompile\\AndroidManifest1.xml");
	      	  if(fileNew.exists()&&!fileOld.exists()){
	      		fileNew.renameTo(fileOld);
	      	  }
				
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
			long endTime = System.currentTimeMillis()-startTime;
		    System.err.println("配置AndroidManifest.xml"+"--执行完毕..---耗时"+endTime+"毫秒");
		    totalTime+=endTime;
		}
		
		//合并文件夹
		private static void mergeFile(File pathBefor){
			startTime = System.currentTimeMillis();
			System.out.println("合并"+pathBefor.getName()+"文件夹"+"--执行开始..");
			try {
//			     拷贝资源
			     copyDir(pathBefor, new File("E:\\XSDK\\Temp\\decompile"));
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			long endTime = System.currentTimeMillis()-startTime;
		    System.err.println("合并"+pathBefor.getName()+"文件夹"+"--执行完毕..---耗时"+endTime+"毫秒");
		    totalTime+=endTime;
		}
		
		//将一个文件夹拷贝到另一个文件夹
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
        
        //删除文件夹
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
        
    	private static void decompileDex2Smali(String path,String name){
    		Runtime runtime = Runtime.getRuntime();
    		try {
    			Process exec = runtime.exec("cmd /c java -jar E:\\XSDK\\SdkTool\\baksmali-2.1.2.jar -o E:\\XSDK\\Temp\\"+name+"\\smali "+path+"\\classes.dex");
    		    showProcess(exec, "把实现层的classes.dex转换成smali");
    		   
//    		    合并smali
        		startTime = System.currentTimeMillis();
    			System.out.println("合并smali"+"--执行开始..");
        		copyDir(new File("E:\\XSDK\\Temp\\"+name+"\\smali"), new File("E:\\XSDK\\Temp\\decompile"));
        		
        		 File file = new File(path,"classes2.dex");
     		    if(file.exists()){
     		    	Process exec1 = runtime.exec("cmd /c java -jar E:\\XSDK\\SdkTool\\baksmali-2.1.2.jar -o E:\\XSDK\\Temp\\"+name+"\\smali_classes2 "+path+"\\classes2.dex");
         		    showProcess(exec1, "把实现层的classes2.dex转换成smali_classes2");
         		   copyDir(new File("E:\\XSDK\\Temp\\"+name+"\\smali_classes2"), new File("E:\\XSDK\\Temp\\decompile"));
     		    }
     		    
     		    System.out.println("-------------------------------------------"+pacName);
     		    //如果有微信微信需要改
     		    if("yes".equals(isWeixXin)){
     		    	String pacNamePath = pacName.replaceAll("\\.", "\\\\\\\\");
     		    	File fileName =new File("E:\\XSDK\\Components\\wxapi");
     		    	File file2 = new File("E:\\XSDK\\Temp\\decompile\\smali\\"+pacNamePath);
     		    	if(!file2.exists()){
     		    		file2.mkdirs();
     		    		System.out.println("这里执行了吗");
     		    	}
     	            copyDir(fileName,file2);
     	            fileName = new File(file2,"wxapi\\WXEntryActivity.smali");
     	            pacNamePath = pacName.replaceAll("\\.", "/");
     	        	RandomAccessFile rf = new RandomAccessFile(fileName, "rw"); 
     	        	StringBuffer sb = new StringBuffer();
     	        	String line = null;
     	        	while ((line = rf.readLine())!=null) {
     	        		if(line.startsWith(".class")){
     	        			String str = line.replace("{package_name}", pacNamePath);
     	        			sb.append(str);
     	        		}else{
     	        			sb.append(line);
     	        		}
     	        		sb.append("\r\n");
     				}
     	            rf.seek(0); 
     	            rf.writeBytes(sb.toString()); 
     	            rf.close(); 
     		    }
        		
        		//删除临时smali文件夹
//        		deleteDir(new File("E:\\XSDK\\Temp\\smali"));
        		long endTime = System.currentTimeMillis()-startTime;
    		    System.err.println("合并smali"+"--执行完毕..---耗时"+endTime+"毫秒");
    		    totalTime+=endTime;
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    	}
    	
    	//重新生成R.smali
     	private static void compileR2Smali(String name){
     		String pacNamePath = pacName.replaceAll("\\.", "\\\\\\\\");
     		System.out.println("包名========================"+pacNamePath);
     		Runtime runtime = Runtime.getRuntime();
    		try {
    			File oldFile = new File("E:\\XSDK\\Temp\\decompile\\res\\values\\public.xml");
    			File newFile = new File("E:\\XSDK\\Temp\\public.xml");
    			if(oldFile.exists()){
    				oldFile.renameTo(newFile);
    			}
    			
    			File file = new File("E:\\XSDK\\Temp\\"+name+"\\gen");
    			if(!file.exists()){
    				file.mkdir();
    			}
    			//生成R.java
    			Process exec1 = runtime.exec("cmd /c aapt package -f -m -J E:\\XSDK\\Temp\\"+name+"\\gen -S E:\\XSDK\\Temp\\decompile\\res -M E:\\XSDK\\Temp\\decompile\\AndroidManifest.xml -I D:\\AS\\sdk\\platforms\\android-23\\android.jar");
    		    showProcess(exec1, "用资源文件生成R.java");
    		    //生成R.class
    		    Process exec2 = runtime.exec("cmd /c javac -encoding UTF-8 -bootclasspath D:\\AS\\sdk\\platforms\\android-23\\android.jar -d E:\\XSDK\\Temp\\"+name+"\\gen E:\\XSDK\\Temp\\"+name+"\\gen\\"+pacNamePath+"\\*.java");
    		    showProcess(exec2, "用R.java生成R.class");
    		    
    		    file = new File("E:\\XSDK\\Temp\\"+name+"\\gen\\"+pacNamePath+"\\R.java");
    		    if(file.exists()){
    		    	  file.delete();
    		    }
    		    
    		    Process exec3 = runtime.exec("cmd /c E:\\XSDK\\SdkTool\\dx.jar --dex --output=E:\\XSDK\\Temp\\"+name+"\\gen\\"+pacNamePath+"\\classes.dex E:\\XSDK\\Temp\\"+name+"\\gen");
    		    showProcess(exec3, "用R.class生成classes.dex");

    		    Process exec4 = runtime.exec("cmd /c java -jar E:\\XSDK\\SdkTool\\baksmali-2.1.2.jar -o E:\\XSDK\\Temp\\decompile\\smali E:\\XSDK\\Temp\\"+name+"\\gen\\"+pacNamePath+"\\classes.dex");
    		    showProcess(exec4, "用classes.dex转换为R.smali");
    		    
    			if(newFile.exists()&&!oldFile.exists()){
    				newFile.renameTo(oldFile);
    			}
    		    
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    	}
     	
     	private static void compileAPK(){
     		Runtime runtime = Runtime.getRuntime();
     		Process exec4;
			try {
				exec4 = runtime.exec("cmd /c E:\\XSDK\\SdkTool\\apktool.bat b E:\\XSDK\\Temp\\decompile");
				showProcess(exec4,"回编译apk");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
     	}
     	
     	private static void signAPK(String name){
     		Runtime runtime = Runtime.getRuntime();
     		Process exec4;
			try {
				if("yes".equals(isCustomSignature)){
					exec4 = runtime.exec("cmd /c jarsigner -verbose -keystore E:\\XSDK\\ImplSdk\\"+name+"\\"+name+".keystore -signedjar E:\\XSDK\\CompilePackage\\"+name+".apk digestalg SHA1 -sigalg MD5withRSA E:\\XSDK\\Temp\\decompile\\dist\\XDemo.apk "+Alias+" -storepass "+signPwd);
				}else{
					exec4 = runtime.exec("cmd /c java -jar E:\\XSDK\\SdkTool\\signapk.jar E:\\XSDK\\SdkTool\\testkey.x509.pem E:\\XSDK\\SdkTool\\testkey.pk8 E:\\XSDK\\Temp\\decompile\\dist\\XDemo.apk E:\\XSDK\\CompilePackage\\"+name+".apk");
				}
				boolean showProcess = showProcess(exec4,"对apk进行签名");
				if(!showProcess){
					//TODO 65536执行这里
					
					
					
					
					
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			totalTimeAll = totalTimeAll+totalTime;
			System.err.println("打出"+name+"的包，总共耗时"+totalTime+"毫秒");
     	}
}


