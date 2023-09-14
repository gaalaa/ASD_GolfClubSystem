package com.golfclub.golfclubsystem.controllers.member;

import com.golfclub.golfclubsystem.Attributes;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.Console;
import java.io.IOException;

@WebServlet("/member/login")
public class loginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/login.jsp");
        dispatcher.forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //handle setting session user to user that logged in

        String userName = req.getParameter("username");

        String password = req.getParameter("password");
        if(userName.equals("test") && password.equals("123")){
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/courseInfo.jsp"); //for testing purposes
            dispatcher.forward(req, resp);
            //set session
        }
        else{
            req.setAttribute("loginError", "Invalid Credentials");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/login.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
