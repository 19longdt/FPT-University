package com.longdt.helloword.fragment;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

public class ViewPagerAdapter extends FragmentPagerAdapter {

    public ViewPagerAdapter(@NonNull FragmentManager fm, int behavior) {
        super(fm, behavior);
    }

    @NonNull
    @Override
    public Fragment getItem(int position) {
        switch (position){
            case 0:
                return new home_fragment();
            case 1:
                return new favorite_Fragment();
            case 2:
                return new my_fragment();
            default:
                return new home_fragment();
        }
    }

    @Override
    public int getCount() {
        return 3;
    }

    @Nullable
    @Override
    public CharSequence getPageTitle(int position) {
        String tittle = "";
        switch (position){
            case 0:
                tittle = "Home";
                break;
            case 1:
                tittle = "Favorite";
                break;
            case 2:
                tittle = "MyPage";
                break;
        }
        return tittle;
    }
}
