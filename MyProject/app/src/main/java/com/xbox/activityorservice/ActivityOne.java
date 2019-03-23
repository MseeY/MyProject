package com.xbox.activityorservice;

import android.app.Service;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.xbox.R;

/**
 * 绑定Service的方式实现Activity与Service通信
 */

public class ActivityOne extends AppCompatActivity implements View.OnClickListener,ServiceConnection {

    private ServiceOne.Binder mBinder = null;
    private Intent intent;
    private static final String TAG = "SDK";

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activityorservice_layout);
        findViewById(R.id.btn_start_service).setOnClickListener(this);
        findViewById(R.id.btn_stop_service).setOnClickListener(this);
        intent = new Intent(this,ServiceOne.class);
    }


    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.btn_start_service:
                // 绑定服务
                bindService(intent,this, Service.BIND_AUTO_CREATE);
                break;
            case R.id.btn_stop_service://停止服务this
                if(mBinder!=null){
                    unbindService(this);
                    mBinder = null;
                }else{
                    Toast.makeText(this,"请先绑定服务",Toast.LENGTH_SHORT).show();
                }
                break;
        }
    }


    @Override
    public void onServiceConnected(ComponentName name, IBinder service) {
        mBinder = (ServiceOne.Binder) service;
        Log.i(TAG,"服务连接成功了...");
        if(mBinder!=null){
            mBinder.setData("服务启动了");
        }
//        if(intent!=null){
//            startService(intent);
//        }

    }

    @Override
    public void onServiceDisconnected(ComponentName name) {
        Log.i(TAG,"服务连接失败了...");

    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if(mBinder!=null){
            unbindService(this);
        }
    }
}
