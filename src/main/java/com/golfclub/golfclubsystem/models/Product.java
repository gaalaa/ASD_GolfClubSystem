package com.golfclub.golfclubsystem.models;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class Product {
    private int id;
    private String name;
    private String description;
    private String imageUri;
    private BigDecimal price;
    private int stock;

    public Product() {}
    public Product(int id, String name, String description, String imageUri, BigDecimal price, int stock)
    {
        this.id = id;
        this.name = name;
        this.description = description;
        this.imageUri = imageUri;
        this.price = price.setScale(2, RoundingMode.HALF_UP);
        this.stock = stock;
    }

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }

    public void setDescription(String description) { this.description = description; }

    public String getImageUri() { return imageUri; }

    public void setImageUri(String imageUri) { this.imageUri = imageUri; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public int getStock() { return stock; }

    public void setStock(int stock) { this.stock = stock; }
}
