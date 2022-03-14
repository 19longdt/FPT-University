package com.longdt.pe_demo;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;

import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private Button btnHistory;
    private FragmentManager fragmentManager;
    private activity_homeFragment homeFragment;
    private activity_resultFragment activity_resultFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        fragmentManager = getSupportFragmentManager();
        fragmentManager.beginTransaction()
                .add(R.id.fragmentContainerView, new activity_homeFragment())
                .commit();

        fragmentManager.beginTransaction()
                .add(R.id.fragmentContainerView2, new activity_resultFragment())
                .commit();
    }

    @Override
    public void onAttachFragment(@NonNull Fragment fragment) {
        super.onAttachFragment(fragment);
        if(fragment instanceof activity_homeFragment){
            homeFragment = (activity_homeFragment)fragment;
            homeFragment.setOnBtnSendClickListener(this::onBtnSendClick);
        }
    }

    private void onBtnSendClick(int i) {
        activity_resultFragment = new activity_resultFragment();
        Bundle bundle = new Bundle();
        bundle.putString("result", String.valueOf(i));
        activity_resultFragment.setArguments(bundle);
        fragmentManager.beginTransaction()
                .replace(R.id.fragmentContainerView2, activity_resultFragment)
                .commit();
    }

}