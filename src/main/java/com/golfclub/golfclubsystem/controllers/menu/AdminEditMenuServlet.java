package com.golfclub.golfclubsystem.controllers.menu;

import com.golfclub.golfclubsystem.dataContext.MenuDao;
import com.golfclub.golfclubsystem.models.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "adminEditMenuServlet", value = "/adminEditMenu-servlet")
public class AdminEditMenuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int menuId = Integer.parseInt(request.getParameter("menuId"));
        String menuName = request.getParameter("menuName");
        double menuPrice = Double.parseDouble(request.getParameter("menuPrice"));
        String menuDescription = request.getParameter("menuDescription");
        boolean isBeverage = Boolean.parseBoolean(request.getParameter("menuBeverage"));

        Menu updatedMenu = new Menu(menuId, menuName, menuPrice, menuDescription, isBeverage);
        MenuDao menuDao = new MenuDao();

        try {
            menuDao.update(updatedMenu);
            response.sendRedirect(request.getContextPath() + "/adminMenu-servlet"); // Redirect to the updated menu list
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
