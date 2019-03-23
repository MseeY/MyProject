package com.xbox.activityorservice;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

/**
 * 被绑定的服务
 */
public class ServiceOne extends Service {

    public String data = "服务正在执行";
    private static final String TAG = "SDK";

    @Override
    public IBinder onBind(Intent intent) {
        return new Binder();
    }

    public class Binder extends android.os.Binder{
        public void setData(String data){
            ServiceOne.this.data = data;
            Log.i(TAG,ServiceOne.this.data);
        }
    }

    private boolean quit = false;

    @Override
    public void onCreate() {
        super.onCreate();
    }

    /**断开绑定执行的方法*/
    @Override
    public boolean onUnbind(Intent intent) {
        Log.i(TAG,"service onUnbind....");
        return super.onUnbind(intent);
    }

    /** 当从新绑定是执行 */
    @Override
    public void onRebind(Intent intent) {
        // TODO Auto-generated method stub
        super.onRebind(intent);
        Log.i(TAG, "service onRebind...");
    }

    /** 断开绑定或者停止服务时执行 */
    @Override
    public void onDestroy() {
        super.onDestroy();
        quit = true;
        Log.i(TAG,"service onDestroy....");
    }

    /** 每次开启服务时调用的方法 */
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        Log.i(TAG,"onStartCommand执行了....");
//        new Thread(){
//            @Override
//            public void run() {
//                super.run();
//                // 每间隔一秒count加1 ，直到quit为true。
//                while (!quit) {
//                    try {
//                        Log.i(TAG,"这里执行了吗");
//                        Thread.sleep(1000);
//                    } catch (InterruptedException e) {
//                        e.printStackTrace();
//                    }
//                }
//
//            }
//        }.start();
        return super.onStartCommand(intent, flags, startId);
    }

    /** 当内存不够是执行该方法 */
    @Override
    public void onLowMemory() {
        super.onLowMemory();
        Log.i(TAG, "onLowMemory()");
        onDestroy();

    }

}
