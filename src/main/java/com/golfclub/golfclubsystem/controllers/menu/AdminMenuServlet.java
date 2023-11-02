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

@WebServlet(name = "adminMenuServlet", value = "/adminMenu-servlet")

public class AdminMenuServlet extends HttpServlet {

    @Override


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //resp.setStatus(404);
        //resp.sendRedirect("http://localhost:8080/GolfClubSystem_war_exploded/WEB-INF/courseInfo.jsp");
        MenuDao menuDao = new MenuDao();
        try {
            List<Menu> menus = menuDao.getAll();
            req.setAttribute("menus",menus);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/admin-dashboard-menus.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*HttpSession session = req.getSession();
        session.removeAttribute(Attributes.User);
        resp.sendRedirect("/"); */
    }
}