package com.golfclub.golfclubsystem.models;

import java.util.Date;

public class Order {
    private int id;
    private Date creationDate = new Date();
    private Member purchaser;

    public Order(int id, Date creationDate, Member purchaser) {
        this.id = id;
        this.creationDate = creationDate;
        this.purchaser = purchaser;
    }
}
