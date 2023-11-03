package com.golfclub.golfclubsystem.controllers.member;


import com.golfclub.golfclubsystem.Attributes;
import com.golfclub.golfclubsystem.EmailManager;
import com.golfclub.golfclubsystem.dataContext.MemberDao;
import com.golfclub.golfclubsystem.models.Member;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

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
        Member member = new Member();
        member.setFirstName(firstName);
        member.setLastName(lastName);
        member.setEmail(email);
        member.setPassword(password);
        member.setAdmin(false);
        req.getSession().setAttribute(Attributes.User, member);
        try(MemberDao memberDao = new MemberDao()){
            try{
                memberDao.add(member);
            }
            catch (SQLException e){
                System.out.println("An error occurred while trying to add the new member:\n" + e);
            }
            try {
//                EmailManager emailManager = new EmailManager();
//                emailManager.sendMail(member.getEmail(), "Testing", "Hi, " + member.getFullName() +
//                        "\n\nYour account has been successfully created.\n\nKind Regards,\nASD Gold Club System");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        catch (Exception e){
            System.out.println("Error occurred creating memberDAO object: \n" + e);
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/homepage.jsp");
        dispatcher.forward(req, resp);
    }

}