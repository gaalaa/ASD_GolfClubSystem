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
@WebServlet("/member/userRegistration")
public class userRegistrationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/userRegistration.jsp");
        dispatcher.forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        int id = generateID();
        Member member = new Member(id, firstName, lastName, email, false);
        member.setPassword(password);
        req.getSession().setAttribute(Attributes.User, member);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/homepage.jsp");
        dispatcher.forward(req, resp);


    }
    private int generateID(){
        //+1 from last id in db??
        return 123;
    }
}