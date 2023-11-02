package com.golfclub.golfclubsystem.dataContext;

import com.golfclub.golfclubsystem.models.Member;
import com.golfclub.golfclubsystem.models.Menu;
import kotlin.NotImplementedError;
import org.jetbrains.annotations.NotNull;

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
    public Menu add(Menu entity) throws SQLException {
        String query = "INSERT INTO Menu (menuName, menuPrice, menuDescription, isBeverage) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, entity.getMenuName());
            statement.setDouble(2, entity.getMenuPrice());
            statement.setString(3, entity.getMenuDescription());
            statement.setBoolean(4, entity.isBeverage());
            statement.executeUpdate();
        }
        return entity;
    }

    @Override
    public void update(Menu entity) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("UPDATE Menu SET menuName=?, menuPrice=?, menuDescription=?, isBeverage=? WHERE menuID=?")) {
            statement.setString(1, entity.getMenuName());
            statement.setDouble(2, entity.getMenuPrice());
            statement.setString(3, entity.getMenuDescription());
            statement.setBoolean(4, entity.isBeverage());
            statement.setInt(5, entity.getMenuID());
            statement.executeUpdate();
        }
    }

    @Override
    public boolean delete(@NotNull Menu entity) throws SQLException {
        return delete(entity.getMenuID());
    }

    @Override
    public boolean delete(int menuID) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("DELETE FROM Menu WHERE menuID = ?")) {
            statement.setInt(1, menuID);
            int result = statement.executeUpdate();

            // Note(Pete): The delete should have removed 1 or 0 rows. If the result is 1, return true for success.
            return result == 1;
        }
    }

    @Override
    public void close() throws Exception {

    }
}