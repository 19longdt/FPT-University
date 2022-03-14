package com.longdt.pe_demo;

import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.room.Room;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import java.util.List;

public class activity_resultFragment extends Fragment {

    private activity_homeFragment homeFragment;
    TextView txtResult;
    Button btnHistory;
    private RecyclerView recyclerView;

    public activity_resultFragment() {
        // Required empty public constructor
    }


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_result, container, false);
        txtResult = view.findViewById(R.id.txtRe);
        btnHistory = view.findViewById(R.id.btnHis);



        return view;
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        btnHistory.setOnClickListener(this::onBtnHistoryClicked);
    }

    private void onBtnHistoryClicked(View view) {
        Intent intent = new Intent(this.getActivity(), HistoryActivityy.class);
        startActivity(intent);
    }

    @Override
    public void onStart() {
        super.onStart();
        Bundle args = getArguments();
        if (args != null) {
            txtResult.setText("Result: " + args.getString("result"));
        }
    }

}