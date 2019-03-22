package com.xbox.eventbus;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.xbox.R;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

/**
 * eventbus基本用法
 */
public class EBActivity extends AppCompatActivity {

    private TextView mText;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.eb_layout);
        EventBus.getDefault().register(this);
        init();
    }

    private void init() {
        Button btn_jump = findViewById(R.id.btn_jump);
        btn_jump.setText("这是第一个按钮");
        mText = findViewById(R.id.tv_show_text);
        mText.setText("这是第一段文字");
        btn_jump.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent=new Intent(EBActivity.this,SecondActivity.class);
                startActivity(intent);
            }
        });

    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void event(MessageEvent messageEvent) {
        mText.setText(messageEvent.getMessage());
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if(EventBus.getDefault().isRegistered(this)) {
            EventBus.getDefault().unregister(this);
        }
    }


}
