package com.xbox.eventbus;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.xbox.R;

import org.greenrobot.eventbus.EventBus;

public class SecondActivity extends AppCompatActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.eb_layout);
        Button btn_jump  = findViewById(R.id.btn_jump);
        TextView tv_show_text = findViewById(R.id.tv_show_text);
        tv_show_text.setVisibility(View.GONE);
        btn_jump.setText("发送事件");
        btn_jump.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EventBus.getDefault().post(new MessageEvent("第二个页面带回的文字"));
                finish();
            }
        });
    }
}
