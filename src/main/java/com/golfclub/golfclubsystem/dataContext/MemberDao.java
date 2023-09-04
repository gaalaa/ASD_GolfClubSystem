package com.golfclub.golfclubsystem.dataContext;

import com.golfclub.golfclubsystem.models.Member;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class MemberDao implements IDao<Member> {
    private final Connection connection;

    public MemberDao() {
        connection = DBManager.DataSource.getConnection();
    }

    @Override
    public Optional<Member> get(int id) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM Member WHERE id = ?")) {
            statement.setInt(1, id);
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                    return Optional.of(new Member(
                            result.getInt("id"),
                            result.getString("firstName"),
                            result.getString("lastName"),
                            result.getString("email"),
                            result.getBoolean("isAdmin")
                    ));
                } else {
                    return Optional.empty();
                }
            }
        }
    }

    public Optional<Member> get(String email, String password) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM Member WHERE email = ? and password = ?")) {
            statement.setString(1, email);
            statement.setString(2, password);
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                    return Optional.of(new Member(
                            result.getInt("id"),
                            result.getString("firstName"),
                            result.getString("lastName"),
                            result.getString("email"),
                            result.getBoolean("isAdmin")
                    ));
                } else {
                    return Optional.empty();
                }
            }
        }
    }

    @Override
    public List<Member> getAll() throws SQLException {
        List<Member> members = new ArrayList<>();

        try (Statement statement = connection.createStatement()) {
            try (ResultSet result = statement.executeQuery("SELECT * FROM Member")) {
                while (result.next()) {
                    members.add(new Member(
                            result.getInt("id"),
                            result.getString("firstName"),
                            result.getString("lastName"),
                            result.getString("email"),
                            result.getBoolean("isAdmin")
                    ));
                }
            }
        }

        return members;
    }

    @Override
    public void add(Member entity) throws SQLException {
        // Note(Pete): Using preparedStatements help to mitigate SQL injection.
        try (PreparedStatement statement = connection.prepareStatement(
                "INSERT INTO Member (firstName, lastName, email, password, isAdmin) VALUES (?, ?, ?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS)) {
            // Set the '?' parameters starting from index 1.
            statement.setString(1, entity.getFirstName());
            statement.setString(2, entity.getLastName());
            statement.setString(3, entity.getEmail());
            statement.setString(4, entity.getPassword());
            statement.setBoolean(5, entity.isAdmin());

            statement.executeUpdate();
            // Get the automatically incremented id which should be the ID of the entity.
//            try (ResultSet result = statement.getGeneratedKeys()) {
//                result.next();
//                entity.setId(result.getInt(1));
//            }
        }
    }

    @Override
    public void update(Member entity) {

    }

    @Override
    public void delete(Member entity) {

    }

    @Override
    public void close() throws Exception {
        connection.close();
    }
}
