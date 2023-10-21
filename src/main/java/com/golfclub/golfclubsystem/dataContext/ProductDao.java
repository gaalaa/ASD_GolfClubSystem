package com.golfclub.golfclubsystem.dataContext;

import com.golfclub.golfclubsystem.models.Product;
import org.jetbrains.annotations.NotNull;

import javax.swing.plaf.nimbus.State;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProductDao implements IDao<Product> {
    private final Connection connection;

    public ProductDao()
    {
        connection = DBManager.DataSource.getConnection();
    }

    @Override
    public Optional<Product> get(int id) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM Product WHERE id = ?")) {
            statement.setInt(1, id);
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                    Product product = new Product(
                            result.getInt("id"),
                            result.getString("name"),
                            result.getString("description"),
                            result.getString("imageUri"),
                            result.getBigDecimal("priceFormat"),
                            result.getInt("stock")
                    );

                    return Optional.of(product);
                }

            }
        }
        return Optional.empty();
    }

    @Override
    public List<Product> getAll() throws SQLException {
        List<Product> products = new ArrayList<>();

        try (Statement statement = connection.createStatement()) {
            try (ResultSet result = statement.executeQuery("SELECT * FROM Product")) {
                while (result.next()) {
                    Product product = new Product(
                            result.getInt("id"),
                            result.getString("name"),
                            result.getString("description"),
                            result.getString("imageUri"),
                            result.getBigDecimal("price"),
                            result.getInt("stock")
                    );
                    products.add(product);
                }
            }
        }
        return products;
    }

    @Override
    public Product add(@NotNull Product entity) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(
                "INSERT INTO Product (name, description, price, stock, imageuri) VALUES (?, ?, ?, ?, ?)")) {
            // Set the '?' parameters starting from index 1.
            statement.setString(1, entity.getName());
            statement.setString(2, entity.getDescription());
            statement.setBigDecimal(3, entity.getPrice());
            statement.setInt(4, entity.getStock());
            statement.setString(5, entity.getImageUri());

            statement.executeUpdate();
        }
        int lastInsertedRowId = DBManager.DataSource.getGeneratedKey(connection);
        entity.setId(lastInsertedRowId);
        return entity;
    }

    @Override
    public void update(@NotNull Product entity) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(
                "UPDATE Product SET name = ?, description = ?, price = ?, stock = ?, imageUri = ? WHERE id = ?"
        )) {
            statement.setString(1, entity.getName());
            statement.setString(2, entity.getDescription());
            statement.setBigDecimal(3, entity.getPrice());
            statement.setInt(4, entity.getStock());
            statement.setString(5, entity.getImageUri());
            statement.setInt(6, entity.getId());

            statement.executeUpdate();
        }
    }

    @Override
    public boolean delete(@NotNull Product entity) throws SQLException {
        return delete(entity.getId());
    }

    @Override
    public boolean delete(int id) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("DELETE FROM Product WHERE id = ?")) {
            statement.setInt(1, id);
            int result = statement.executeUpdate();

            // Note(Pete): The delete should have removed 1 or 0 rows. If the result is 1, return true for success.
            return result == 1;
        }
    }

    @Override
    public void close() throws Exception {
        connection.close();
    }
}
