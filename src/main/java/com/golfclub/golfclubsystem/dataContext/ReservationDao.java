package com.golfclub.golfclubsystem.dataContext;

import com.golfclub.golfclubsystem.models.Reservation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReservationDao {

    public Reservation getReservationById(int id) {
        Reservation reservation = null;
        try (Connection connection = DBManager.DataSource.getConnection()) {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Reservations WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                reservation = new Reservation();
                reservation.setId(rs.getInt("id"));
                reservation.setName(rs.getString("name"));
                reservation.setMemberId(rs.getString("member_id"));
                reservation.setDate(rs.getDate("date"));
                reservation.setTime(rs.getTime("time"));
                reservation.setNumberOfPeople(rs.getInt("number_of_people"));
                reservation.setRemarks(rs.getString("remarks"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reservation;
    }

    public void addReservation(Reservation reservation) {
        try (Connection connection = DBManager.DataSource.getConnection()) {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO Reservations(name, member_id, date, time, number_of_people, remarks) VALUES(?,?,?,?,?,?)");
            ps.setString(1, reservation.getName());
            ps.setString(2, reservation.getMemberId());
            ps.setDate(3, new java.sql.Date(reservation.getDate().getTime()));
            ps.setTime(4, new java.sql.Time(reservation.getTime().getTime()));
            ps.setInt(5, reservation.getNumberOfPeople());
            ps.setString(6, reservation.getRemarks());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateReservation(Reservation reservation) {
        try (Connection connection = DBManager.DataSource.getConnection()) {
            PreparedStatement ps = connection.prepareStatement("UPDATE Reservations SET name=?, member_id=?, date=?, time=?, number_of_people=?, remarks=? WHERE id = ?");
            ps.setString(1, reservation.getName());
            ps.setString(2, reservation.getMemberId());
            ps.setDate(3, new java.sql.Date(reservation.getDate().getTime()));
            ps.setTime(4, new java.sql.Time(reservation.getTime().getTime()));
            ps.setInt(5, reservation.getNumberOfPeople());
            ps.setString(6, reservation.getRemarks());
            ps.setInt(7, reservation.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
