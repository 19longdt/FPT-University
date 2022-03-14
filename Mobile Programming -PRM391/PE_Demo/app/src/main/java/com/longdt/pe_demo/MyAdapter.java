package com.longdt.pe_demo;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

public class MyAdapter extends RecyclerView.Adapter<MyViewHolder> {
    private List<History> histories;
    private LayoutInflater inflater;

    public MyAdapter(List<History> list, Context context) {
            this.histories =  list;
            this.inflater = LayoutInflater.from(context);
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            View view = inflater.inflate(R.layout.recycleview_history, parent, false);
            MyViewHolder viewHolder = new MyViewHolder(view);
            return viewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        holder.getTxtTime().setText(histories.get(position).getTime());
        holder.getTxtInput().setText(histories.get(position).getInput());
        holder.getTxtFrom().setText(histories.get(position).getFrom());
        holder.getTxtTo().setText(histories.get(position).getTo());
        holder.getTxtResult().setText(histories.get(position).getResult());
    }

    @Override
    public int getItemCount() {
        return histories.size();
    }
}

