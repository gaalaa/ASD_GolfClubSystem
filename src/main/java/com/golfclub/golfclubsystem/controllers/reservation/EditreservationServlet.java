package com.golfclub.golfclubsystem.controllers.reservation;

import com.golfclub.golfclubsystem.dataContext.DBManager;
import com.golfclub.golfclubsystem.models.Reservation;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "EditReservationServlet", value = "/EditReservationServlet")
public class EditreservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String reservationId = req.getParameter("id");
        Reservation reservation = getReservationById(reservationId);
        req.setAttribute("reservation", reservation);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/editreservation.jsp");
        dispatcher.forward(req, resp);
    }

    private Reservation getReservationById(String id) {
        Reservation reservation = new Reservation();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DBManager.DataSource.getConnection();
            String query = "SELECT * FROM Reservations WHERE id=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                reservation.setId(resultSet.getInt("id"));
                reservation.setName(resultSet.getString("name"));
                reservation.setMemberId(resultSet.getString("member_id"));
                reservation.setDate(resultSet.getDate("date"));
                reservation.setTime(resultSet.getTime("time"));
                reservation.setNumberOfPeople(resultSet.getInt("number_of_people"));
                reservation.setRemarks(resultSet.getString("remarks"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
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
        return reservation;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Extract parameters from the request
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String memberId = req.getParameter("member_id");
        String date = req.getParameter("date");
        String time = req.getParameter("time");
        String numberOfPeople = req.getParameter("number_of_people");
        String remarks = req.getParameter("remarks");

        boolean updated = updateReservationInDatabase(id, name, memberId, date, time, numberOfPeople, remarks);

        if (updated) {
            resp.sendRedirect("courseInfo-servlet?success=true");
        } else {
            resp.sendRedirect("ReservationServlet?success=false");
        }
    }

    private boolean updateReservationInDatabase(String id, String name, String memberId, String date, String time, String numberOfPeople, String remarks) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBManager.DataSource.getConnection();

            String updateSQL = "UPDATE Reservations SET name=?, member_id=?, date=?, time=?, number_of_people=?, remarks=? WHERE id=?";
            preparedStatement = connection.prepareStatement(updateSQL);

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, memberId);
            preparedStatement.setString(3, date);
            preparedStatement.setString(4, time);
            preparedStatement.setInt(5, Integer.parseInt(numberOfPeople));
            preparedStatement.setString(6, remarks);
            preparedStatement.setString(7, id);

            int affectedRows = preparedStatement.executeUpdate();

            return affectedRows > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
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
