package com.golfclub.golfclubsystem.models;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {
    public List<ShoppingCartItem> items = new ArrayList<>();

    public void addProduct(Product product) {
        boolean added = false;
        for (ShoppingCartItem item : items) {
            if (item.product.getId() == product.getId()) {
                item.quantity++;
                added = true;
            }
        }

        if (!added) {
            ShoppingCartItem item = new ShoppingCartItem();
            item.product = product;
            item.quantity = 1;
            items.add(item);
        }
    }
}
