package com.longdt.pe_demo;
import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

@Entity
public class History {

    @PrimaryKey(autoGenerate = true)
    private int id;

    @ColumnInfo
    private String time;

    @ColumnInfo
    private String input;

    @ColumnInfo
    private String from;

    @ColumnInfo
    private String to;

    @ColumnInfo
    private String result;

    public History(){}

    public History(String time, String input, String from, String to, String result) {
        this.time = time;
        this.input = input;
        this.from = from;
        this.to = to;
        this.result = result;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getInput() {
        return input;
    }

    public void setInput(String input) {
        this.input = input;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
