package com.golfclub.golfclubsystem.dataContext;

import org.jetbrains.annotations.NotNull;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface IDao<T> extends AutoCloseable {
    Optional<T> get(int id) throws SQLException;
    List<T> getAll() throws SQLException;
    void add(@NotNull T entity) throws SQLException;
    void update(@NotNull T entity) throws SQLException;
    boolean delete(@NotNull T entity) throws SQLException;
    boolean delete(int id) throws SQLException;
}
