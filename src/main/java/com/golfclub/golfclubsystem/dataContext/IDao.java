package com.golfclub.golfclubsystem.dataContext;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface IDao<T> extends AutoCloseable {
    Optional<T> get(int id) throws SQLException;
    List<T> getAll() throws SQLException;
    void add(T entity) throws SQLException;
    void update(T entity);
    boolean delete(T entity);
    boolean delete(int id) throws SQLException;
}
