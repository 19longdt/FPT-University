package com.longdt.pe_demo;

import androidx.room.Database;
import androidx.room.RoomDatabase;

@Database(entities = {History.class}, version = 1)
public abstract class DBConnection extends RoomDatabase {
    public abstract DAO createHistoryDAO();

}
