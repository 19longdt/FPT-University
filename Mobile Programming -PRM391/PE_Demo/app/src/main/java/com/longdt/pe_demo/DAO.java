package com.longdt.pe_demo;

import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.Query;

import java.util.List;

@Dao
public interface DAO {
    @Insert
    void insert(History history);

    @Query("SELECT * FROM history")
    List<History> listHistory();

}
