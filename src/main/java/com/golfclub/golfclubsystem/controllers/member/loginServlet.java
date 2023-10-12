package com.golfclub.golfclubsystem.controllers.member;
import com.golfclub.golfclubsystem.dataContext.MemberDao;
import com.golfclub.golfclubsystem.Attributes;
import com.golfclub.golfclubsystem.models.Member;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;


@WebServlet("/member/login")
public class loginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/login.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberDao memberDao = new MemberDao();
        Optional<Member> member = Optional.empty();
        String userName = req.getParameter("email");
        String password = req.getParameter("password");
        try{
            member = memberDao.get(userName, password);
        }
        catch (SQLException e){
            System.out.println("Error occurred while fetching member data");
        }
        finally {
            try{
                memberDao.close();
            }
            catch (Exception e){
                System.out.println("Error occurred while closing the memberDao");
            }
        }

        //see if user exists in db
        if(member.isPresent()){
            req.getSession().setAttribute(Attributes.User, member.get());
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/homepage.jsp");
            dispatcher.forward(req, resp);
        }
        else{
            req.setAttribute("loginError", "Invalid Credentials");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/login.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
