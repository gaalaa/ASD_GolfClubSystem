package com.golfclub.golfclubsystem.controllers.member;

import com.golfclub.golfclubsystem.Attributes;
import com.golfclub.golfclubsystem.models.Member;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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

        //see if user exists in db
        if(userName.equals("test") && password.equals("123")){

            Member member = new Member(123, "test", "member", "test.member@gmail.com", false);
            req.getSession().setAttribute(Attributes.User, member);


            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/courseInfo.jsp");
            dispatcher.forward(req, resp);

        }
        else{
            req.setAttribute("loginError", "Invalid Credentials");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/login.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
