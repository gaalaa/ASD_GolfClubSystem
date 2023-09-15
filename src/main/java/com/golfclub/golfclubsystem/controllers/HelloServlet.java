package com.golfclub.golfclubsystem.controllers;

import java.io.*;
import java.sql.SQLException;
import java.util.Optional;

import com.golfclub.golfclubsystem.Attributes;
import com.golfclub.golfclubsystem.dataContext.MemberDao;
import com.golfclub.golfclubsystem.models.Member;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/index.jsp");
        dispatcher.forward(request, response);
    }

    public void destroy() {
    }
}