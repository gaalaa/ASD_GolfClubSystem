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

@WebServlet("/member/editPersonalDetails")
public class editPersonalDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/editPersonalDetails.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        boolean updated = false;
        Member member = (Member) req.getSession().getAttribute(Attributes.User);
        if(!firstName.isEmpty() && !firstName.equals(member.getFirstName())){
            member.setFirstName(firstName);
            updated = true;
        }
        if(!lastName.isEmpty() && !lastName.equals(member.getLastName())){
            member.setLastName(lastName);
            updated = true;
        }
        if(updated){
            //Add a pop-up box to say details updated before returning to main menu
            try {
                EmailManager emailManager = new EmailManager();
                emailManager.sendMail(member.getEmail(), "Testing", "Hi, " + member.getFullName() +
                "\n\nYour details have been successfully updated.\n\nKind Regards,\nASD Gold Club System");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            req.getSession().setAttribute(Attributes.User, member);
            try(MemberDao memberDao = new MemberDao()){
                try{
                    memberDao.update(member);
                }
                catch (SQLException e){
                    System.out.println("An error occurred while trying to update the member:\n" + e);
                }
            }
            catch (Exception e){
                System.out.println("Error occurred creating memberDAO object: \n" + e);
            }

        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/homepage.jsp");
        dispatcher.forward(req, resp);

    }

}