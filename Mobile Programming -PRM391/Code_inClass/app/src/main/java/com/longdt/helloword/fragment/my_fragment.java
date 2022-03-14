package com.longdt.helloword.fragment;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.longdt.helloword.R;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link my_fragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class my_fragment extends Fragment {


    public my_fragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.my_fragment, container, false);
    }
}