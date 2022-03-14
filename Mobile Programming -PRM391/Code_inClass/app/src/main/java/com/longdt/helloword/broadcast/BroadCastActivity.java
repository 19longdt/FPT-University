package com.longdt.helloword.broadcast;

import android.content.Intent;
import android.content.IntentFilter;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import com.longdt.helloword.R;

public class BroadCastActivity extends AppCompatActivity {

    private Button btnLocal;
    private Button btnNormal;
    private TextView txtShow;
    private CombineReceiver combineReceiver;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_broadcast);

        btnLocal = findViewById(R.id.btnLocal);
        btnNormal = findViewById(R.id.btnNormal);
        txtShow = findViewById(R.id.txtShow);
        combineReceiver = new CombineReceiver();

        bindingAction();
        _registerReceiver();
    }


    @Override
    protected void onDestroy() {
        super.onDestroy();
        _unReceiverRegister();
    }

    private void _registerReceiver() {
        IntentFilter combineFilter = new IntentFilter();
        combineFilter.addAction("com.longdt.isBroadcastReceiver.NORMAL_DEMO");
        combineFilter.addAction("com.longdt.isBroadcastReceiver.LOCAL_DEMO");
        combineFilter.addAction(WifiManager.WIFI_STATE_CHANGED_ACTION);
        registerReceiver(combineReceiver, combineFilter);
        LocalBroadcastManager.getInstance(this).registerReceiver(combineReceiver, combineFilter);
    }


    private void _unReceiverRegister() {
        unregisterReceiver(combineReceiver);
        LocalBroadcastManager.getInstance(this).unregisterReceiver(combineReceiver);
    }

    private void bindingAction() {
        btnLocal.setOnClickListener(view -> {
            Intent intent = new Intent();
            intent.setAction("com.longdt.isBroadcastReceiver.LOCAL_DEMO");
            intent.putExtra("local", "Message sending from local broadcast");

            LocalBroadcastManager.getInstance(this).sendBroadcast(intent);
        });
        btnNormal.setOnClickListener(view -> {
            Intent intent = new Intent();
            intent.setAction("com.longdt.isBroadcastReceiver.NORMAL_DEMO");
            intent.putExtra("normal", "Message sending from normal broadcast");

            sendBroadcast(intent);
        });
        combineReceiver.setOnReceiveDataListener(this::setCombineReceiverReceiverData);
    }

    private void setCombineReceiverReceiverData(String data) {
        txtShow.setText(data);
    }
}
