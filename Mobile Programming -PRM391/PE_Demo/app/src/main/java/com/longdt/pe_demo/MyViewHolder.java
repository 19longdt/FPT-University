package com.longdt.pe_demo;

import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

public class MyViewHolder extends RecyclerView.ViewHolder {

    TextView txtTime;
    TextView txtInput;
    TextView txtFrom;
    TextView txtTo;
    TextView txtResult;

    public MyViewHolder(@NonNull View itemView) {
        super(itemView);

            txtTime = itemView.findViewById(R.id.txtTime);
            txtInput = itemView.findViewById(R.id.txtInputValue);
            txtFrom = itemView.findViewById(R.id.txtFromValue);
            txtTo = itemView.findViewById(R.id.txtToValue);
            txtResult = itemView.findViewById(R.id.txtResultValue);

    }

    public TextView getTxtTime() {
        return txtTime;
    }

    public TextView getTxtInput() {
        return txtInput;
    }

    public TextView getTxtFrom() {
        return txtFrom;
    }

    public TextView getTxtTo() {
        return txtTo;
    }

    public TextView getTxtResult() {
        return txtResult;
    }
}

