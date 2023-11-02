package com.golfclub.golfclubsystem.controllers;

import com.golfclub.golfclubsystem.dataContext.DBManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "SubmitContactServlet", value = "/SubmitContactServlet")
public class SubmitContactServlet extends HttpServlet {

    private Connection connection;

    public SubmitContactServlet() throws SQLException {
        this.connection = DBManager.DataSource.getConnection();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String message = req.getParameter("message");

        // Insert data into the database.
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO ContactEnquiries (name, email, message) VALUES (?, ?, ?)");

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, message);

            preparedStatement.executeUpdate();

            preparedStatement.close();
            RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/submitContact.jsp");
            dispatcher.forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // ...
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
