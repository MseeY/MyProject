package com.xbox;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.xbox.eventbus.EBActivity;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private Button mBtnEB;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mBtnEB = findViewById(R.id.btn_eventbus);
        mBtnEB.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.btn_eventbus:
                Intent intent = new Intent(MainActivity.this, EBActivity.class);
                startActivity(intent);
                break;
        }

    }
}
