package com.golfclub.golfclubsystem.dataContext;

import com.golfclub.golfclubsystem.models.Menu;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class MenuDao implements IDao<Menu> {
    private final Connection connection;
    public MenuDao() {
        connection = DBManager.DataSource.getConnection();
    }


    @Override
    public Optional<Menu> get(int id) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM Menu WHERE id =?")) {
            statement.setInt(1, id);
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                    return Optional.of(new Menu(
                        result.getInt("menuID"),
                        result.getString("menuName"),
                        result.getDouble("menuPrice"),
                        result.getString("menuDescription"),
                        result.getBoolean("isBeverage")
                    ));
                } else {
                    return Optional.empty();
                }
            }
        }
    }

    @Override
    public List<Menu> getAll() throws SQLException {
        List<Menu> menus = new ArrayList<>();

        try (Statement statement = connection.createStatement()) {
            try (ResultSet result = statement.executeQuery("SELECT * FROM Menu")) {
                while (result.next()) {
                    menus.add(new Menu(
                        result.getInt("menuID"),
                        result.getString("menuName"),
                        result.getDouble("menuPrice"),
                        result.getString("menuDescription"),
                        result.getBoolean("isBeverage")
                    ));
                }
            }
        }
        return menus;
    }

    @Override
    public void add(Menu entity) throws SQLException {

    }

    @Override
    public void update(Menu entity) {

    }

    @Override
    public boolean delete(Menu entity) {
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