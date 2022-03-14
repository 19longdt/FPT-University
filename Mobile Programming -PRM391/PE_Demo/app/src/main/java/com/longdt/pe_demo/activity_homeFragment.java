package com.longdt.pe_demo;

import android.os.Build;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.fragment.app.Fragment;
import androidx.room.Room;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.time.LocalDate;
import java.util.List;

public class activity_homeFragment extends Fragment {
    
    private Spinner spFrom;
    private Spinner spTo;
    private TextView txtInput;
    private Button btnConvert;
    private DBConnection dbConnection;
    private DAO dao;
    private List<History> histories;

    int[] itemsId = new int[]{ 1, 2};
    String[] items = new String[]{ "kilo", "met"};
    private int fromValue = 0;
    private int toValue = 0;
    private int result = 0;

    
    public activity_homeFragment() {
        // Required empty public constructor
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        
        txtInput = view.findViewById(R.id.txtInput);
        spFrom = view.findViewById(R.id.spFrom);
        spTo = view.findViewById(R.id.spTo);
        btnConvert = view.findViewById(R.id.btnConvert);


        ArrayAdapter<String> adapter = new ArrayAdapter<>(getActivity(), android.R.layout.simple_spinner_dropdown_item, items);

        spFrom.setAdapter(adapter);
        spTo.setAdapter(adapter);
        
        btnConvert.setOnClickListener(this::onBtnConvertClicked);


    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    private void onBtnConvertClicked(View view) {

        String inputValue = txtInput.getText().toString();

//        Toast.makeText(getActivity(), inputValue + " aaaaaaa" + spFrom.getSelectedItemPosition(), Toast.LENGTH_SHORT).show();

        if(spFrom.getSelectedItemPosition() == 0){
            if(spTo.getSelectedItemPosition() == 0){
                result = Integer.parseInt(inputValue);
            }
            else{
                result = Integer.parseInt(inputValue) * 1000;
            }
        }else{
            if(spTo.getSelectedItemPosition() == 0){
                result = Integer.parseInt(inputValue) / 1000;
            }
            else{
                result = Integer.parseInt(inputValue);
            }
        }

        dbConnection = Room.databaseBuilder(getActivity(), DBConnection.class, "history")
                .allowMainThreadQueries()
                .build();
        dao = dbConnection.createHistoryDAO();
        dao.insert(new History("2022-1-11",
                txtInput.getText().toString(),
                spFrom.getSelectedItemPosition() == 0 ? "kilo" : "met,",
                spTo.getSelectedItemPosition() == 0 ? "kilo" : "met,",
                String.valueOf(result)));

        if (this.callback != null) {
            callback.onClick(result);
        }

    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_home, container, false);
    }


    public interface OnBtnSendClick {
        public void onClick(int result);
    }

    OnBtnSendClick callback;

    public void setOnBtnSendClickListener(OnBtnSendClick callback) {
        this.callback = callback;
    }
}