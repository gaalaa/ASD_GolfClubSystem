package com.golfclub.golfclubsystem.controllers;

import com.golfclub.golfclubsystem.dataContext.DBManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.io.IOException;

@WebServlet(name = "ReservationServlet", value = "/ReservationServlet")
public class ReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/reservation.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Extract parameters from the request
        String name = req.getParameter("name");
        String memberId = req.getParameter("member_id");
        String date = req.getParameter("date");
        String time = req.getParameter("time");
        String numberOfPeople = req.getParameter("number_of_people");
        String remarks = req.getParameter("remarks");

        Integer reservationId = saveReservationToDatabase(name, memberId, date, time, numberOfPeople, remarks);

        if (reservationId != null) {
            req.getSession().setAttribute("reservationId", reservationId); // Setting reservation ID in session
            resp.sendRedirect("courseInfo-servlet?success=true");
        } else {
            resp.sendRedirect("ReservationServlet?success=false");
        }
    }

    private Integer saveReservationToDatabase(String name, String memberId, String date, String time, String numberOfPeople, String remarks) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBManager.DataSource.getConnection();
            String insertSQL = "INSERT INTO Reservations (name, member_id, date, time, number_of_people, remarks) VALUES (?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, memberId);
            preparedStatement.setString(3, date);
            preparedStatement.setString(4, time);
            preparedStatement.setInt(5, Integer.parseInt(numberOfPeople));
            preparedStatement.setString(6, remarks);

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                ResultSet rs = preparedStatement.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
            return null;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
