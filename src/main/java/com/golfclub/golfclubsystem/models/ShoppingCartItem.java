package com.golfclub.golfclubsystem.models;

import java.math.BigDecimal;

public class ShoppingCartItem {
    public Product product;
    public int quantity;

    public BigDecimal getTotalPrice() {
        return product.getPrice().multiply(new BigDecimal(quantity));
    }
}
