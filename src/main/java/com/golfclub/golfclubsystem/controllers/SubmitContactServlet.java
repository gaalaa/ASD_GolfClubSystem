package com.golfclub.golfclubsystem.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "SubmitContactServlet", value = "/SubmitContactServlet")
public class SubmitContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String message = req.getParameter("message");
        req.setAttribute("name", name);
        req.setAttribute("email", email);
        req.setAttribute("message", message);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/submitContact.jsp");
        dispatcher.forward(req, resp);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}