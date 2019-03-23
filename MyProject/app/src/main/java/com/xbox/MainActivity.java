package com.xbox;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.xbox.activityorservice.ActivityOne;
import com.xbox.eventbus.EBActivity;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private Intent intent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        findViewById(R.id.btn_eventbus).setOnClickListener(this);
        findViewById(R.id.btn_activity_or_service).setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.btn_eventbus:
                intent = new Intent(MainActivity.this, EBActivity.class);
                startActivity(intent);
                break;
            case R.id.btn_activity_or_service:
                intent = new Intent(MainActivity.this, ActivityOne.class);
                startActivity(intent);
                break;
        }

    }
}
