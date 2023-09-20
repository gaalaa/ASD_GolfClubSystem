package com.golfclub.golfclubsystem.controllers;

import com.golfclub.golfclubsystem.Attributes;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "diningServlet", value = "/dining-servlet")

public class DiningServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //resp.setStatus(404);
        //resp.sendRedirect("http://localhost:8080/GolfClubSystem_war_exploded/WEB-INF/courseInfo.jsp");
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/dining.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*HttpSession session = req.getSession();
        session.removeAttribute(Attributes.User);
        resp.sendRedirect("/"); */
    }
}
