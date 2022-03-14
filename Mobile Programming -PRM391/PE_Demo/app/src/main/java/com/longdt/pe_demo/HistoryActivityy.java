package com.longdt.pe_demo;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.room.Room;

import android.os.Bundle;
import android.widget.TextView;

import java.util.List;

public class HistoryActivityy extends AppCompatActivity {

    private RecyclerView recyclerView;
    private DBConnection dbConnection;
    private DAO dao;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_history);

        recyclerView = findViewById(R.id.recyclerView);
        recyclerView.setLayoutManager(new GridLayoutManager(this, 2));

        dbConnection = Room.databaseBuilder(this, DBConnection.class, "history")
                .allowMainThreadQueries()
                .build();
        dao = dbConnection.createHistoryDAO();

        MyAdapter myAdapter = new MyAdapter(dao.listHistory(), getApplicationContext());
        recyclerView.setAdapter(myAdapter);
    }
}