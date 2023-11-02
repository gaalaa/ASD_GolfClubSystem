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

@WebServlet(name = "adminAddMenuServlet", value = "/adminAddMenu-servlet")
public class AdminAddMenuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String menuName = request.getParameter("menuName");
        double menuPrice = Double.parseDouble(request.getParameter("menuPrice"));
        String menuDescription = request.getParameter("menuDescription");
        boolean isBeverage = Boolean.parseBoolean(request.getParameter("isBeverage"));

        Menu newMenu = new Menu(0, menuName, menuPrice, menuDescription, isBeverage);

        MenuDao menuDao = new MenuDao();
        try {
            menuDao.add(newMenu);
            response.sendRedirect(request.getContextPath() + "/adminMenu-servlet");
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
    }
}
