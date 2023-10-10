package com.golfclub.golfclubsystem.models;

public class Food {
    private int foodID;
    private String foodName;
    private double foodPrice;
    private String foodDescription;

public Food() {}

public Food(int foodID,String foodName,double foodPrice,String foodDescription) {
    this.foodID = foodID;
    this.foodName = foodName;
    this.foodPrice = foodPrice;
    this.foodDescription = foodDescription;
}

public int getFoodID() {
    return foodID;
}
public void setFoodID(int foodID) { this.foodID = foodID; }

public String getFoodName() {
    return foodName;
}
public void setFoodName(String foodName) {
    this.foodName = foodName;
}

public double getFoodPrice() {
    return foodPrice;
}
public void setFoodPrice(double foodPrice) {
    this.foodPrice = foodPrice;
}

public String getFoodDescription() {
    return foodDescription;
}
public void setFoodDescription(String foodDescription) {
    this.foodDescription = foodDescription;
}


}