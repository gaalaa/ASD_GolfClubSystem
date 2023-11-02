package com.golfclub.golfclubsystem.controllers.menu;

import com.golfclub.golfclubsystem.dataContext.MenuDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "adminDeleteMenuServlet", value = "/adminDeleteMenu-servlet")
public class AdminDeleteMenuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int menuId = Integer.parseInt(request.getParameter("menuId"));
        MenuDao menuDao = new MenuDao();

        try {
            boolean isDeleted = menuDao.delete(menuId);
            if (isDeleted) {
                response.sendRedirect(request.getContextPath() + "/adminMenu-servlet"); // Redirect to the updated menu list
            } else {
                // Handle the case when the menu item could not be deleted
                // Possibly show an error message or redirect to an error page
            }
        } catch (SQLException e) {
            // Handle any SQL errors
            e.printStackTrace();
        } finally {
            try {
                menuDao.close(); // Close the connection
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
