package com.golfclub.golfclubsystem.dataContext;

import com.golfclub.golfclubsystem.models.Food;

import javax.swing.text.html.Option;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class FoodDao implements IDao<Food> {
    private final Connection connection;
    public FoodDao() {
        connection = DBManager.DataSource.getConnection();
    }


    @Override
    public Optional<Food> get(int id) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM Food WHERE id =?")) {
            statement.setInt(1, id);
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                    return Optional.of(new Food(
                       result.getInt("foodID"),
                       result.getString("foodName"),
                       result.getDouble("foodPrice"),
                       result.getString("foodDescription")
                    ));
                } else {
                    return Optional.empty();
                }
            }
        }
    }

    @Override
    public List<Food> getAll() throws SQLException {
        List<Food> foods = new ArrayList<>();

        try (Statement statement = connection.createStatement()) {
            try (ResultSet result = statement.executeQuery("SELECT * FROM Food")) {
                while (result.next()) {
                    foods.add(new Food(
                        result.getInt("foodID"),
                        result.getString("foodName"),
                        result.getDouble("foodPrice"),
                        result.getString("foodDescription")
                    ));
                }
            }
        }
        return foods;
    }

    @Override
    public void add(Food entity) throws SQLException {

    }

    @Override
    public void update(Food entity) {

    }

    @Override
    public boolean delete(Food entity) {
        return false;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    @Override
    public void close() throws Exception {

    }
}