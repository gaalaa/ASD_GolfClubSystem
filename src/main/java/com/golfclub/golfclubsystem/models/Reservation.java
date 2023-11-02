package com.golfclub.golfclubsystem.models;

import java.sql.Date;
import java.sql.Time;

public class Reservation {
    private int id;
    private String name;
    private String memberId;
    private Date date;
    private Time time;
    private int numberOfPeople;
    private String remarks;

    // Getters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getMemberId() { return memberId; }
    public Date getDate() { return date; }
    public Time getTime() { return time; }
    public int getNumberOfPeople() { return numberOfPeople; }
    public String getRemarks() { return remarks; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setMemberId(String memberId) { this.memberId = memberId; }
    public void setDate(Date date) { this.date = date; }
    public void setTime(Time time) { this.time = time; }
    public void setNumberOfPeople(int numberOfPeople) { this.numberOfPeople = numberOfPeople; }
    public void setRemarks(String remarks) { this.remarks = remarks; }
}

