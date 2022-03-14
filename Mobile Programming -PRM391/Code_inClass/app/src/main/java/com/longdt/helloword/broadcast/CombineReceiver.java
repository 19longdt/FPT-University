package com.longdt.helloword.broadcast;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.wifi.WifiManager;
import android.widget.Toast;

public class CombineReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        String data = "";
        switch (intent.getAction()){
            case "com.longdt.isBroadcastReceiver.LOCAL_DEMO":
                data = intent.getStringExtra("local");
                break;
            case  "com.longdt.isBroadcastReceiver.NORMAL_DEMO":
                data = intent.getStringExtra("normal");
                break;
            case  WifiManager.WIFI_STATE_CHANGED_ACTION:
                data = "Wifi state change";
                break;
        }

        Toast.makeText(context, "Combine: " + data, Toast.LENGTH_SHORT).show();
        if(this.callBack != null){
            this.callBack.onReceive(data);
        }
    }

    public interface OnReceiveDataListener{
        void onReceive(String data);
    }

    public OnReceiveDataListener callBack;

    public void setOnReceiveDataListener(OnReceiveDataListener callBack){
        this.callBack = callBack;
    }
}
