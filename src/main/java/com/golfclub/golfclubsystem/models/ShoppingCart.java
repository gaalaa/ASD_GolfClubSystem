package com.golfclub.golfclubsystem.models;

import org.jetbrains.annotations.NotNull;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {
    public List<ShoppingCartItem> items = new ArrayList<>();

    public void addProduct(@NotNull Product product) {
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

    public void removeProduct(@NotNull Product product) {
        for (int i = items.size(); i != 0; i--) {
            ShoppingCartItem item = items.get(i - 1);
            if (item.product.getId() == product.getId()) {
                item.quantity--;
                if (item.quantity == 0) {
                    items.remove(i - 1);
                }
            }
        }
    }

    public int count() {
        int count = 0;
        for (ShoppingCartItem item : items) {
            count += item.quantity;
        }
        return count;
    }

    public BigDecimal totalAmount() {
        BigDecimal total = new BigDecimal(0).setScale(2, RoundingMode.HALF_UP);
        for (ShoppingCartItem item : items) {
            total = total.add(item.getTotalPrice());
        }

        return total;
    }
}
