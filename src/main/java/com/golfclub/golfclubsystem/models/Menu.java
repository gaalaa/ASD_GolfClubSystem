package com.golfclub.golfclubsystem.models;

public class Menu {
    private int menuID;
    private String menuName;
    private double menuPrice;
    private String menuDescription;

    private Boolean isBeverage;

public Menu() {}

public Menu(int menuID, String menuName, double menuPrice, String menuDescription, Boolean isBeverage) {
    this.menuID = menuID;
    this.menuName = menuName;
    this.menuPrice = menuPrice;
    this.menuDescription = menuDescription;
    this.isBeverage = isBeverage;
}

    public int getMenuID() {
        return menuID;
    }
    public void setMenuID(int menuID) { this.menuID = menuID; }

    public String getMenuName() {
        return menuName;
    }
    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public double getMenuPrice() {
        return menuPrice;
    }
    public void setMenuPrice(double menuPrice) {
        this.menuPrice = menuPrice;
    }

    public String getMenuDescription() {
        return menuDescription;
    }
    public void setMenuDescription(String menuDescription) {
        this.menuDescription = menuDescription;
    }

    public boolean isBeverage() { return isBeverage; }
    public void setIsBeverage(boolean beverage) { isBeverage=beverage; }

}