package com.xbok.xsdk;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * 测试的多线程打包
 */
public class Exercise5 {

	public static void main(String[] args) throws Exception {
		System.out.println("----程序开始运行----");  
		   Date date1 = new Date();  
		  
		   int taskSize = 3;  
		   // 创建一个线程池  
		   ExecutorService pool = Executors.newFixedThreadPool(taskSize);  
		   // 创建多个有返回值的任务  
		   List<Future> list = new ArrayList<Future>();  
		   for (int i = 0; i < 50; i++) {  
		    Callable<Object> c = new MyCallable(i + " ");  
		    // 执行任务并获取Future对象  
		    Future f = pool.submit(c);
		    // System.out.println(">>>" + f.get().toString());  
		    list.add(f);  
		   }  
		   // 关闭线程池  
		   pool.shutdown();  
		  
		   // 获取所有并发任务的运行结果  
		   for (Future f : list) {  
		    // 从Future对象上获取任务的返回值，并输出到控制台  
		    System.out.println(">>>" + f.get().toString());  
		   }  
		  
		   Date date2 = new Date();  
		   System.out.println("----程序结束运行----，程序运行时间【"  
		     + (date2.getTime() - date1.getTime()) + "毫秒】");  

	}
	
	static class MyCallable implements Callable<Object> {  
		private String taskNum;  
		  
		MyCallable(String taskNum) {  
		   this.taskNum = taskNum;  
		}  
		  
		public Object call() throws Exception {  
		  System.out.println(">>>" + taskNum + "任务启动");  
		   Date dateTmp1 = new Date();  
		   Thread.sleep(1000);  
		   Date dateTmp2 = new Date();  
		   long time = dateTmp2.getTime() - dateTmp1.getTime();  
		   System.out.println(">>>" + taskNum + "任务终止");  
		   return taskNum + "任务返回运行结果,当前任务时间【" + time + "毫秒】";  
		} 
	}

	public static void updata() {
		try {
			File fileName = new File(
					"E:\\XSDK\\ImplSdk\\yingyongbao\\WXEntryActivity.smali");
			RandomAccessFile rf = new RandomAccessFile(fileName, "rw");
			StringBuffer sb = new StringBuffer();
			String line = null;

			while ((line = rf.readLine()) != null) {
				if (line.startsWith(".class")) {
					String str = line.replace("{package_name}", "com");
					sb.append(str);
				} else {
					sb.append(line);
				}
				sb.append("\r\n");
			}
			rf.seek(0);
			rf.writeBytes(sb.toString());
			rf.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static void getRandom() {
		Random r = new Random();
		int nextInt = r.nextInt(10000);
		System.out.println(nextInt);
	}

	// 将一个文件夹拷贝到另一个文件夹
	public static void copyDir(File src, File dest) throws IOException {
		File newDir = new File(dest, src.getName()); // 在dest文件夹下创建和src同名的文件夹
		newDir.mkdir();

		File[] subFiles = src.listFiles(); // 获取src下所有子文件
		if (subFiles != null) {
			for (File subFile : subFiles) { // 循环遍历
				if (subFile.isFile()) { // 如果是文件直接考到新建的文件夹下
					FileInputStream fis = new FileInputStream(subFile);
					FileOutputStream fos = new FileOutputStream(new File(
							newDir, subFile.getName()));
					byte[] buffer = new byte[1024];
					int len;
					while ((len = fis.read(buffer)) != -1)
						fos.write(buffer, 0, len);
					fis.close();
					fos.close();
				} else { // 如果是文件夹, 递归拷贝子文件夹
					copyDir(subFile, newDir);
				}
			}
		}
	}

}
